Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA1EE9A05A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaRyG72WPgoZfQvmt7tzAvNRmns05ThydFykOtS0r84=; b=gHBPld3r+FTtyuEHGjbeygR0E1
	e4Xjp/QtH7dBe6X8HTMLiZQ63OMF5L3+Ql1Xq9CwaVUrsq4OVBrmbsvlqi5GsKDpcBLURyzd2W496
	msqnzjMvXqeowJcFP389TgnhFECrXluF48XWajfZpht4DRctePcSj/4vqnqBG+VcWKOJHFwStgj62
	rzlwgofARi7soKDAU9skk/JGGANffixF8YWZd4sgbOpD9A84+43hAvsuuvS9VJFWhhsfiG/8Px090
	W/BOtIG3dUsN6Idz76GRbu4beIIeBJpwHX38N1Vo9yUdsgfNGqcWp1E/ufj+XIPK9oa6pVGXuaIPw
	IWuu1bRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9E2-0000000BoKl-1bN0;
	Thu, 19 Feb 2026 18:58:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9Dy-0000000BoKQ-2rHZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 18:58:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF8C0339;
	Thu, 19 Feb 2026 10:57:56 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82FAF3F62B;
	Thu, 19 Feb 2026 10:58:02 -0800 (PST)
Date: Thu, 19 Feb 2026 18:58:00 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <20260219185800.GD136967@e132581.arm.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
 <aZSAsC1YI5_lK3e0@willie-the-truck>
 <20260217190121.GB136967@e132581.arm.com>
 <aZcWC25GE2iUKsNt@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZcWC25GE2iUKsNt@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_105806_822705_5DA7431C 
X-CRM114-Status: GOOD (  30.21  )
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

On Thu, Feb 19, 2026 at 01:54:19PM +0000, Will Deacon wrote:

[...]

> > > > > In which case, the host->guest something hideous like:
> > > > > 
> > > > > 	isb();
> > > > > 	tsb_csync();	// Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!
> > > > > 	dsb(nsh);	// I missed this in my patch
> > > > > 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> > > > > 	if (2064142) {
> > > > > 		tsb_csync();
> > > > > 		dsb(nsh);
> > > > > 	}
> > > > > 	isb();
> > > > 
> > > > As I_QXJZX suggests, the section K10.5.10 "Context switching" gives
> > > > the flow.  I'd suggest the VM context switch is also aligned to the
> > > > description in S_VKHHY.
> > > 
> > > I honestly have a hard time believing the sequence in S_VKHHY as the DSB
> > > seems to be in the wrong place which means the TSB CSYNC can float. It
> > > also isn't aligned with what the EL1 driver does...
> > 
> > Sorry for confusion.  I am checking internally for the flow suggested
> > in S_VKHHY.

After internal review, we conclude that S_VKHHY is valid.  The intent of
S_VKHHY is to use the minimal number of barriers during a context switch.

Given the mentioned "DSB seems to be in the wrong place which means the
TSB CSYNC can float", this would be fine due to the two considerations:

1) As described in B2.6.8:

 | The following situations are synchronized using a TSB operation:
 |
 | * A direct write B to a System register is ordered after an indirect
 |   read or indirect write of the same register by atrace operation of
 |   a traced instruction A, if all of the following are true:
 |   - A is executed in program order before a Context synchronization event C.
 |   - C appears in program order before a TSB operation T.
 |   - B is executed in program order after T.

If trace operations indirectly read or write system registers, the TSB
ensures that these indirect accesses are complete before any direct
writes to the same register are performed in program order after the TSB.

So in S_VKHHY, we don't expect clearing TRCPRGCTLR.EN (step 4) and
clearing TRBLIMITR_EL1.E (step 5) to take effect prior to the TSB.

2) A DSB executed after the TSB ensures the data writes are complete,
then it is safe to read trace data from memory.  However, in the context
switch case, we don't need to read trace data, so a DSB for "publishing"
data is not required.

Based on these conclusions, let me summarize the flow:

  // Prohibit trace
  TRFCR_EL1 = 0;

  // No new program-flow trace
  isb();

  // Trace operation and trace unit are flushed
  tsb_csync();   // Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!

  // Disable trace unit
  TRCPRGCTLR.EN = 0b0

  // Disable trace buffer unit
  TRBLIMITR_EL1.E = 0b0

  if (2064142) {
    tsb_csync();
    dsb(nsh);
  }

  // Ensure trace disable takes effect and indirect writes are visible;
  // Ensure 2064142 is done before affected sysreg write.
  isb();

> > > > When switching from host to guest, we need to clear TRCPRGCTLR.EN to
> > > > zero.  As the doc states "ETE trace compression logic is stateful,
> > > > and disabling the ETE resets this compression state".
> > > > 
> > > > > and then the guest->host part is:
> > > > > 
> > > > > 	write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
> > > > > 	isb();
> > > > > 	if (2038923)
> > > > > 		isb();
> > > > > 
> > > > > Does that look right to you?
> > > > 
> > > > S_PKLXF gives the flow for switching in.
> > > 
> > > Well, modulo errata, sure. I don't have access to the errata document so
> > > I was more interested in whether I got that right...
> > 
> > Please see the doc:
> > https://developer.arm.com/documentation/SDEN-1873351/1900/?lang=en
> 
> Aha, thank you, Leo!

You are welcome!

> I swear you used to be able to google the erratum number and get the doc,
> but that doesn't seem to be the case any more. In fact, if you type the
> erratum number into the search box on developer.arm.com it doesn't even
> work, so cheers for pointing me to the right place.

I also cannot search the doc via google, seems this is a known issue for
developer.arm.com when I checked this internally.  Thanks a lot for
reporting it.

The flow for guest->host might be easy one, anyway, I try to summary for
review:

  Restore TRFCR_EL1;

  // Ensure restored sysreg is visible
  isb();

  // Enable trace buffer
  TRBLIMITR_EL1.E = 0b1

  // Enable trace unit
  TRCPRGCTLR.EN = 0b1

  if (2038923)
     isb();

  // eret works as an extra context synchronization

Thanks,
Leo

