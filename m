Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704F3C531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgqeVxJh/mSJw25lLchrQn9WEHwrqioLah+Q4155O9E=; b=vW4Hohpx/uetbSMV2OCQ1Qdedd
	s5/3WYFzk45ObrjKIjFbEWktKgI62XN5BziXjLk3TR4W6gMhH7OJVWmnjS+X3DwrHJl3h3d7LvaXA
	8aaU5bfYrIACeDH7T2OP4GenYhuoGOStalTCfeAuVjDucj5hrpoO8t1vUuw1282HMfFscnKTtJAO0
	cgKnPJ90BMbfFgRwL3PmiO2qCzOAHqPZzQyE/oyWtS5c/kQMfUNkyiWMnmnlc2YUPP784+8djqsoo
	S76DvyCz3dmGvnPTXfR1MyluafK2dUCYP466Oc8XPp0ENbHPwH8KvS7Fjr0k1ixHv75HTjrsdUu4E
	GdyXwoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtFI-0000000ELgd-0aj1;
	Thu, 23 Jul 2026 13:13:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtEv-0000000ELQj-1jsV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Jul 2026 13:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pgqeVxJh/mSJw25lLchrQn9WEHwrqioLah+Q4155O9E=; b=ALCPxBMNOXOxQLa1ua+lLc5AN5
	xgLUX6dm+BV6xtziPsuJBJhDzZ7QpO7qBqvXrUYSGyehhBNKl355pAQv+d/ufkSg94fHQELmcb0Sq
	JYRmILjOQqCYymgH0y7jthpLAhDOGnHqfpG8ANyJGDhXwSGRU1SeMMeUm4rtrUpq4ouJefxXfNHXA
	ddqbyMULnyiG7soVHG8VfqByyAiBj47PRLzMdtNN00MNH8Mr8PhxEE5qa+X7VgF61lSDSyz+nj2ME
	TjOgusELCQO0UeqgrYROZWKlmzmfPV0uW9jxNxctHm4nCIrRulIe2jHX3uqPNSjnc3iZlvRlQ6ibQ
	MBzPNRmg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmtEr-00000001lup-0V0o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:13:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFC831477;
	Thu, 23 Jul 2026 06:13:18 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 568393F66F;
	Thu, 23 Jul 2026 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784812403; bh=0wkZkf4pXuxLn73/yKmLsBoe6rRD+bdZ/Ogoj8u8dik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjcqWrxz1u0H53889bf3GeUziPSbMQjFUGmknyICYzxOd2SYHH8Dv8RuwiTID2RK6
	 /WQ5YnKCms953/uqJT813jIaySHzm6IdDkJK0mt6g18xJriknzIE5EhgCJQUcNITAW
	 2TdOVQ9P8er8FtLi4s958nEOTlUHkwrSZrOhftcg=
Date: Thu, 23 Jul 2026 14:13:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <willdeacon@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: cpucaps: Remove stale comment about keeping
 capabilities sorted
Message-ID: <amITcJVfOT1k68VV@J2N7QTR9R3.cambridge.arm.com>
References: <20260723130233.3123-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723130233.3123-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_141325_598508_C977D346 
X-CRM114-Status: GOOD (  20.29  )
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

On Thu, Jul 23, 2026 at 02:02:32PM +0100, Will Deacon wrote:
> From: Will Deacon <willdeacon@google.com>
> 
> There is no functional requirement to keep the entries in arm64's
> tools/cpucaps file sorted alphabetically and, in fact, they have fallen
> out of order over time. Given that only the arm64 tree touches this file,
> just remove the stale comment and accept that we're collectively not
> very good at the alphabet.

It might be worth mentioning:

(1) The intent of sorting was to make it easier to avoid and/or resolve
    merge conflicts, which hasn't been a big problem in practice.

(2) In the few cases where we do depend on the order of specific
   cpucaps, we've added build-time asserts, e.g. in
   can_use_gic_priorities(), which has:

     /*   
      * ARM64_HAS_GICV3_CPUIF has a lower index, and is a boot CPU
      * feature, so will be detected earlier.
      */
     BUILD_BUG_ON(ARM64_HAS_GIC_PRIO_MASKING <= ARM64_HAS_GICV3_CPUIF);

   ... and we can still do that.

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Regardless of whether you add the above to the commit message:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
> 
> Follow-up from the discussion at:
> 
> https://lore.kernel.org/r/20260519092243.7278-1-will@kernel.org
> 
>  arch/arm64/tools/cpucaps | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 9b85a84f6fd4..3fcac789b0a4 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
> -# Internal CPU capabilities constants, keep this list sorted
> +# Internal CPU capabilities constants
>  
>  ALWAYS_BOOT
>  ALWAYS_SYSTEM
> -- 
> 2.55.0.229.g6434b31f56-goog
> 

