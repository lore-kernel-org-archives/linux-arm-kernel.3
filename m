Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2A6E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrM165U7VqITYD93ELOsfVOKyLY8V5p99Pv8hbVoqLE=; b=qmSdJKi5JeHrJSJUcrug5h2cC0
	9A35Z2QiLhUZ55hHVPsu9yZM97L9UDlClwkd0mZtcXTlv+JmjMx/CPbHmBXSxm/Er6+I8+Vc3wOG6
	eEGLQ1gcH8p+k8F1/ob+OVULskZ3ahZJh+/vlmoO08AbL3sC+HwmQwptNVC/xBI1Nr4kk67IqMLdT
	WePOnPFg/hNYGcRjDla6tfV/4IyOQacHdHyLDnpL51Qg6Tc6xK47XWr4Vlb47SEw6akQkwqowWzuW
	GYaT39PeZw12Wh9UkIKyNFR/8lBnWay+zPP7iDNqcWE8DAFshZSrrYLA5iv2wXJQgc4i2+AGeUHlr
	c+UyuKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNATY-0000000A09B-2ry6;
	Mon, 16 Dec 2024 12:45:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNASR-0000000A005-1yxm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 12:44:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFC18113E;
	Mon, 16 Dec 2024 04:44:46 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D5163F58B;
	Mon, 16 Dec 2024 04:44:16 -0800 (PST)
Date: Mon, 16 Dec 2024 12:44:14 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <Z2Agntn52mY5bSTp@J2N7QTR9R3>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
 <709a0e75-0d0c-4bff-b9fd-3bbb55c97bd5@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <709a0e75-0d0c-4bff-b9fd-3bbb55c97bd5@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_044419_555520_21AF20B8 
X-CRM114-Status: GOOD (  19.70  )
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

On Mon, Dec 16, 2024 at 12:17:54PM +0000, Mark Brown wrote:
> On Sat, Dec 14, 2024 at 10:56:13AM +0000, Marc Zyngier wrote:
> 
> > I don't understand the need to single out SMIDR_EL1. It seems to only
> > make things even more fragile than they already are by adding more
> > synchronisation phases.
> 
> > Why isn't the following a good enough fix? It makes it plain that
> > boot_cpu_data is only a copy of CPU0's initial boot state.
> 
> That would work but it's not clear to me that that is what the intent is
> here.  The current ordering seemed like a strange enough decision to be
> deliberate, though I couldn't identify the reasoning.

The original intent was that __cpuinfo_store_cpu() read *all* of a CPU's
implemented ID regs, and init_cpu_features() initialised the expected
system features based on the boot CPU's ID regs.

The expectation was that init_cpu_features() would only consume the
register values, and would not alter the cpuinfo_arm64 values, so the
order of:

	boot_cpu_data = *info;
	init_cpu_features(&boot_cpu_data);

... didn't matter either way, and using '&boot_cpu_data' was intended to
make it clear that the features were based on the boot CPU's info, even
if you just grepped for that and didn't see the surrounding context.

I think the real fix here is to move the reading back into
__cpuinfo_store_cpu(), but to have an explicit check that SME has been
disabled on the commandline, with a comment explaining that this is a
bodge for broken FW which traps the SME ID regs.

Mark.

