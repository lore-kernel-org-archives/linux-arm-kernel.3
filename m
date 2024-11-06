Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C02FD44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjhumPQzdlA5xRWWERY6wz09oOKAaAQIGShHlNJ/2P0=; b=OQg/CSQCtt0ONhw+FNGQ+CIH24
	s9YDpOzOAYJgGyYrzCcRd8LXS4944uyP8zKxjH8J1TVCjEDxq7CHbCbNuiU6kQeXh1NVRhwF5FMlc
	Rb0WdqTv0HpkCUo+LXP1+kfnzV3uuiPUYEU9/v7GN4ZnxiSMjhsYb30Pzuj1vVUeWrvZkVRAKj4Nb
	H13qNR1eu+oxgFOyIVYODceevLifveaXEsNHMOl7leayM2sxKxbHZ5UQbAPYP12sV8qkqebEKvvVX
	4CdZJ1+lPNY1kCU6g2nW13sbBZB6yX3fcE2UF1DsVSwll69V29+BQFo/U9oZkFnQ0Sqvl8iXUmpum
	7K59aENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eoX-000000036kd-074J;
	Wed, 06 Nov 2024 12:07:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eHa-00000002w3R-3vMa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:33:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 695BB1063;
	Wed,  6 Nov 2024 03:33:36 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 692493F6A8;
	Wed,  6 Nov 2024 03:33:05 -0800 (PST)
Date: Wed, 6 Nov 2024 11:33:03 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] kselftest/arm64: Test signal handler state
 modification in fp-stress
Message-ID: <ZytT7z1EN97RaKmo@J2N7QTR9R3>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <20241023-arm64-fp-stress-irritator-v1-6-a51af298d449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-6-a51af298d449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_033307_039885_B0AA36EE 
X-CRM114-Status: GOOD (  17.28  )
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

On Wed, Oct 23, 2024 at 09:38:34PM +0100, Mark Brown wrote:
> Currently in fp-stress we test signal delivery to the test threads by
> sending SIGUSR2 which simply counts how many signals are delivered. The
> test programs now also all have a SIGUSR1 handler which for the threads
> doing userspace testing additionally modifies the floating point register
> state in the signal handler, verifying that when we return the saved
> register state is restored from the signal context as expected. Switch over
> to triggering that to validate that we are restoring as expected.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  tools/testing/selftests/arm64/fp/fp-stress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
> index faac24bdefeb9436e2daf20b7250d0ae25ca23a7..3d477249dee0632b662b48582433d39323d18e18 100644
> --- a/tools/testing/selftests/arm64/fp/fp-stress.c
> +++ b/tools/testing/selftests/arm64/fp/fp-stress.c
> @@ -221,7 +221,7 @@ static void child_output(struct child_data *child, uint32_t events,
>  static void child_tickle(struct child_data *child)
>  {
>  	if (child->output_seen && !child->exited)
> -		kill(child->pid, SIGUSR2);
> +		kill(child->pid, SIGUSR1);
>  }
>  
>  static void child_stop(struct child_data *child)
> 
> -- 
> 2.39.2
> 

