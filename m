Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2E3D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qb4MPkbP6ZHnM6yreyxSZnEX1N0ka7FAFkqI4HFFD+4=; b=M/0d7FJRrBIhuw5EAXUjw/MDZp
	7ANjAbX72o5nqmqxq7ImKAC5k5T7QaJIm2WAEf+yAGehaQRmg83gAyyGOi38UI8QHUDhyZxW9LoAe
	VOor8L+AAU6gIuxV/G9hIr/Ofia+Ov/xuL+EIofZL2pOuhL+jrmPOG9osKKtMpY+F288qApia36j0
	5a0UfxKGmWmV8Z8mvECuq+FTHgUSo2d7aHPD0KLk35YTml3FRdtPhvtGAJWkGwLTXFVVHuWD7Rick
	lOVl1QlVbpcFkEaEjyDLYfBXPGtmBo+L0vAMHCiMkZBToPQVD+ycvMaaf4rAFGAsDsoLL0IaU/Ta3
	/7aO/BcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8Js-00000003YWE-06rg;
	Tue, 20 Jan 2026 09:46:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8Jn-00000003YV7-2neY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 09:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qb4MPkbP6ZHnM6yreyxSZnEX1N0ka7FAFkqI4HFFD+4=; b=YpQX+cWtzSciG6UKC3k1vODiMV
	AU1byiDfhxfMNEKR59tLo2jZav5qZk13KHFnbQiqgkSynPxhHKIQ5U9nmCMTysqa7JH5OlPhg+WNR
	DpQfP3MbPGOFkgc/Ae5E79bF/qwkfecqDYpqzcpgUR0aAFh74ZXp2reZwCWH8pAwNxlRUiUJgcUpC
	qWaA4DsJ1z2+w7KvCP1sFLSk9wFsXHvHUsvwOTAOOuE2sQGYfA0+GKpMYbKgXvdf7nviTEn0XY1dU
	YGdWdxt3Bkd7NPVXZlBiFa7ZLRZm4/0lQjnmADIQWv7UtI5trGQHSBmw3jADyq8FqMhJhtzU52U3V
	A3EEJypA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8Jk-0000000Djc6-1wbn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 09:46:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37A801476;
	Tue, 20 Jan 2026 01:46:22 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04FE43F740;
	Tue, 20 Jan 2026 01:46:23 -0800 (PST)
Date: Tue, 20 Jan 2026 09:46:17 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	catalin.marinas@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, ardb@kernel.org,
	suzuki.poulose@arm.com, lpieralisi@kernel.org,
	yangyicong@hisilicon.com, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI
 for swpX emulation.
Message-ID: <aW9O6R7v-ybhrm66@J2N7QTR9R3>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-10-yeoreum.yun@arm.com>
 <86ms3knl6s.wl-maz@kernel.org>
 <aT/bNLQyKcrAZ6Fb@e129823.arm.com>
 <aW5O714hfl7DCl04@willie-the-truck>
 <aW6w6+B21NbUuszA@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW6w6+B21NbUuszA@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_094632_682529_DB500D7A 
X-CRM114-Status: GOOD (  28.06  )
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

On Mon, Jan 19, 2026 at 10:32:11PM +0000, Yeoreum Yun wrote:
> > On Mon, Dec 15, 2025 at 09:56:04AM +0000, Yeoreum Yun wrote:
> > > > On Sun, 14 Dec 2025 11:22:48 +0000,
> > > > Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > > >
> > > > > Apply the FEAT_LSUI instruction to emulate the deprecated swpX
> > > > > instruction, so that toggling of the PSTATE.PAN bit can be removed when
> > > > > LSUI-related instructions are used.
> > > > >
> > > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > >
> > > > It really begs the question: what are the odds of ever seeing a CPU
> > > > that implements both LSUI and AArch32?
> > > >
> > > > This seems extremely unlikely to me.
> > >
> > > Well, I'm not sure how many CPU will have
> > > both ID_AA64PFR0_EL1.EL0 bit as 0b0010 and FEAT_LSUI
> > > (except FVP currently) -- at least the CPU what I saw,
> > > most of them set ID_AA64PFR0_EL1.EL0 as 0b0010.
> >
> > Just to make sure I understand you, you're saying that you have seen
> > a real CPU that implements both 32-bit EL0 *and* FEAT_LSUI?
> >
> > > If you this seems useless, I don't have any strong comments
> > > whether drop patches related to deprecated swp instruction parts
> > > (patch 8-9 only) or not.
> > > (But, I hope to pass this decision to maintaining perspective...)
> >
> > I think it depends on whether or not the hardware exists. Marc thinks
> > that it's extremely unlikely whereas you appear to have seen some (but
> > please confirm).
> 
> What I meant was not a 32-bit CPU with LSUI, but a CPU that supports
> 32-bit EL0 compatibility (i.e. ID_AA64PFR0_EL1.EL0 = 0b0010).
> My point was that if CPUs implementing LSUI do appear, most of them will likely
> continue to support the existing 32-bit EL0 compatibility that
> the majority of current CPUs already have.

That doesn't really answer Will's question. Will asked:

  Just to make sure I understand you, you're saying that you have seen a
  real CPU that implements both 32-bit EL0 *and* FEAT_LSUI?

IIUC you have NOT seen any specific real CPU that supports this, and you
have been testing on an FVP AEM model (which can be configured to
support this combination of features). Can you please confirm?

I don't beleive it's likely that we'll see hardware that supports
both FEAT_LSUI and AArch32 (at EL0).

Mark.

