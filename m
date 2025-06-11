Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E730C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElD1FO2RKOHHzIV2M83q6wcsgDVyd1PaGMYTZeR86PM=; b=gyW7XBNn9L0PU2PWCaJEg3nhCB
	kGLrm6/4pqBx7XUH3ZHkpyaI/p9nnKP1sx6AwVEsiku3p+iskYImS/7TrZc3rKjCujd/VoAfR00nD
	tfAeVOUccKtwwlcWJVU6s7ZVDQC90/bmYsC79Q0s9pKlwDMxCo6aepIozX0f5WFWbPJU20e5+F9iV
	t4qpWPQkr+qh3Rse7KEx6ftUEDHn8ngu/sYE+ZNiYEmnLDNOUei5U3kgRrt2bAg8svFfg+WuT7+JB
	V8KD9rgQdo0C3wISc5bFq21KMmj1CpflBh4B6f/NN/3MbYx8fTX3oA/VL83CS7kWLadFhTY3ggty2
	ub1e7ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRzo-0000000B9jI-0LVg;
	Wed, 11 Jun 2025 20:24:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPLA-0000000AjDk-1kAI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:34:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 999004508C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 17:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E40C4CEE3;
	Wed, 11 Jun 2025 17:34:18 +0000 (UTC)
Date: Wed, 11 Jun 2025 18:34:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <aEm-F04k0sC1tOCp@arm.com>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103420_470980_A6E5AA4D 
X-CRM114-Status: GOOD (  22.71  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11, 2025 at 05:28:13PM +0100, Mark Brown wrote:
> Currently we call gcs_free() during flush_gcs() to reset the thread state
> for GCS. This includes unmapping any kernel allocated GCS, but this is
> redundant when doing a flush_thread() since we are reinitialisng the thread
> memory too. Inline the reinitialisaton of the thread struct.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/process.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index a5ca15daeb8a..5954cec19660 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -288,7 +288,9 @@ static void flush_gcs(void)
>  	if (!system_supports_gcs())
>  		return;
>  
> -	gcs_free(current);
> +	current->thread.gcspr_el0 = 0;
> +	current->thread.gcs_base = 0;
> +	current->thread.gcs_size = 0;
>  	current->thread.gcs_el0_mode = 0;
>  	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
>  	write_sysreg_s(0, SYS_GCSPR_EL0);

I think this makes sense.

However, I thought there was another slightly misplaced call to
gcs_free() via arch_release_task_struct(). I wouldn't touch the user
memory with vm_munmap() when releasing a task structure. Is this needed
because the shadow stack is allocated automatically on thread creation,
so we need something to free it when the thread died?

Another caller of gcs_free() is deactivate_mm(). It's not clear to me
when we need to free the shadow stack on this path. On the exit_mm()
path for example we have mmput() -> exit_mmap() that takes care of
unmapping everything. Similarly on the exec_mmap() path.

-- 
Catalin

