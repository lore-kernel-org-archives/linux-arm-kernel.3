Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA75E69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQxgn8LhHFxLw/BY5HisaFdRxjq6rIClP7lGnkFWtMc=; b=GrvirlJyoJwqo9UXl7H/iGoSma
	npM7rPNZSmX92wb9UGh0PsitWsza2Yu/5CxAZtSISnuIBtRtCGeWCYx7AMo/FenKKQkfgH4+ZQ6z+
	o2G+v8aZY82C9/7nJzp6MfONb2UcgFry2xbbht1SnIrVT75tWpD0koGUixEB9QsxczvWf5epSQ5Hw
	QqDkrrv/8Zz8IbjPRADKoM6z1cnDW+2Sr1SMR70aQaUaRPdIcj3EgSoU1qhENa6vvwoPpro0GctPy
	eW6FXFxBMpqg9yeuG3tMHrfaGnOwU5UuJFG9geMp8KG5ZUPWOzeYClV4tak9/BLSvcQ0zWkl2iNVk
	tL4FE8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUuS-00000009wef-2DLx;
	Tue, 03 Dec 2024 15:33:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUt1-00000009wGk-0vFj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:32:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0213AFEC;
	Tue,  3 Dec 2024 07:32:54 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9793F71E;
	Tue,  3 Dec 2024 07:32:24 -0800 (PST)
Date: Tue, 3 Dec 2024 15:32:22 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64/sme: Flush foreign register state in
 do_sme_acc()
Message-ID: <Z08khk6Mg6+T6VV9@e133380.arm.com>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-1-d853479d1b77@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-arm64-sme-reenable-v1-1-d853479d1b77@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_073227_303216_CD22B498 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, Dec 03, 2024 at 12:45:53PM +0000, Mark Brown wrote:
> When do_sme_acc() runs with foreign FP state it does not do any updates of
> the task structure, relying on the next return to userspace to reload the
> register state appropriately, but leaves the task's last loaded CPU
> untouched. This means that if the task returns to userspace on the last
> CPU it ran on then the checks in fpsimd_bind_task_to_cpu() will incorrectly
> determine that the register state on the CPU is current and suppress reload
> of the floating point register state before returning to userspace. This
> will result in spurious warnings due to SME access traps occuring for the
> task after TIF_SME is set.
> 
> Call fpsimd_flush_task_state() to invalidate the last loaded CPU
> recorded in the task, forcing detection of the task as foreign.
> 
> Fixes: 8bd7f91c03d8 ("arm64/sme: Implement traps and syscall handling for SME")
> Reported-by: Mark Rutlamd <mark.rutland@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kernel/fpsimd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 8c4c1a2186cc510a7826d15ec36225857c07ed71..eca0b6a2fc6fa25d8c850a5b9e109b4d58809f54 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1460,6 +1460,8 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
>  		sme_set_vq(vq_minus_one);
>  
>  		fpsimd_bind_task_to_cpu();
> +	} else {
> +		fpsimd_flush_task_state(current);

TIF_FOREIGN_FPSTATE is (or was) a cache of the task<->CPU binding that
you're clobbering here.

So, this fpsimd_flush_task_state() should have no effect unless
TIF_FOREIGN_FPSTATE is already wrong?  I'm wondering if the apparent
need for this means that there is an undiagnosed bug elsewhere.

(My understanding is based on FPSIMD/SVE; I'm less familiar with the
SME changes, so I may be missing something important here.)

[...]

Cheers
---Dave

