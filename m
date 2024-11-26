Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86692D6553C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yOy0Bs9vwt+cXeoyHcL2cAGdkm3DavTJKmi9mq8F6A=; b=mFxrDWCPJFyo/aX6FI+0NBSkt9
	jnUdLNQgHMuCvHb4nrkjY9ALLbgKNgdqWw59M/N49yTlG19+vti2f9Vb5kmB/AsVLOKIjWE+bh3k6
	/bRFisfzDifUyKbrUR/H2s+Nov5H3T9zWxQsKtPTpkkB+FXLoFc84PmprMP89wzgG7r8L/RAsEmKW
	bWJuYIZG5ydNpdjIeVhNb8VIk2CZHGCdGk5KXUuW4yNiMwOpRLrL5tKHl7mHFye5DJ7qL2dyRyrag
	mlI0xF/V0/h6/IND22WzSMYkm3k4f6HRre/X53iXZCPrMayydXJYmqLvjKlygbAqTmKRW3Elo7LKI
	NK9DexSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFztt-0000000BNT8-1vJb;
	Tue, 26 Nov 2024 18:03:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzsv-0000000BNOP-21Cu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 18:02:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58686153B;
	Tue, 26 Nov 2024 10:02:29 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D17963F66E;
	Tue, 26 Nov 2024 10:01:58 -0800 (PST)
Date: Tue, 26 Nov 2024 18:01:56 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BOOT-WRAPPER PATCH 3/3] aarch64: Enable use of GCS for EL2 and
 below
Message-ID: <Z0YNFCfisiCqU3lJ@J2N7QTR9R3.cambridge.arm.com>
References: <20241126153955.477569-1-mark.rutland@arm.com>
 <20241126153955.477569-4-mark.rutland@arm.com>
 <154929d3-c46b-42cd-9785-c48aa1b08d33@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154929d3-c46b-42cd-9785-c48aa1b08d33@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_100201_562110_38867D8A 
X-CRM114-Status: GOOD (  15.32  )
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

On Tue, Nov 26, 2024 at 05:20:47PM +0000, Mark Brown wrote:
> On Tue, Nov 26, 2024 at 03:39:55PM +0000, Mark Rutland wrote:
> 
> > +	if (mrs_field(ID_AA64PFR1_EL1, GCS)) {
> > +		scr |= SCR_EL3_GCSEn;
> > +		msr(GCSCR_EL2, 0);
> > +		msr(GCSCR_EL1, 0);
> > +		msr(GCSCRE0_EL1, 0);
> > +	}
> > +
> 
> We're not doing anything for GCSCR_EL3 where (as for the other ELs)
> RVCHKEN resets to an architecturally UNKNOWN value:  
> 
>    https://developer.arm.com/documentation/ddi0601/2024-09/AArch64-Registers/GCSCR-EL3--Guarded-Control-Stack-Control-Register--EL3-?lang=en
> 
> This is also an oversight in the TF-A GCS support.  One might question
> the decisions of an implementation which doesn't reset it to 0 but it
> should be safer to initialise.

A need to initialize GCSCR_EL3.RVCHKEN would be an *architecture bug*,
not an oversight in TF-A. That bit should only reset to an UNKNOWN value
if it doesn't have a functional effect on EL3 code that doesn't touch
GCS functionality. If it has no functional effect it's fine to leave it
in an UNKNOWN state.

GCSCR_EL3.PCRSEL resets to 0, so the HW won't push to the GCS for BL/BLR
and won't pop from the GCS for a RET. That menas there's no GCS value
for a return value check to compare with...

That does raise the question of what specifically happens for a return
at EL3 when GCSCR_EL3.{PCRSEL,RVCHKEN} == {1,0}. Can you enlighten me?

Mark.

