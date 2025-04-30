Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A859C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZUWxPeQM7+Lg9BQ1viewDXNkyeg7aOeRbtyCQ7tuiY=; b=CmoEmLJGrzprbDamPHYzz92aGE
	sxSw5NmXy+0OixqUX1SkVnNweLli0izY/zOk7kfkeODP/kd91NZ/E3noksPPKujnyN+hY0NFvpQx1
	9qQ0ksmImkTImm97qz69XeXRH0KWtWYobAbg6THkinOiYnr2DoK0JrgGCcF6NUYODzCam13/DN3VT
	CAJSqypsgutYbeF5cKa8qk/7vkb3V19pWyPsIMcRfzLaRUVEAmvYYrSA7v9r3F3LBeqhJKlEhL1lO
	WdoKIf+KK6S3vvddn80GkgxYHB0OH4Xc5cKmZAK3LxoPQM7xGQ+jJjonSoghJuZC2fsrmvGqvmr9P
	EWazIMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7Vk-0000000D0KQ-2W4p;
	Wed, 30 Apr 2025 13:30:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7Qo-0000000CzQG-1LZG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:24:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93A41106F;
	Wed, 30 Apr 2025 06:24:48 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38C63F5A1;
	Wed, 30 Apr 2025 06:24:54 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:24:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	broonie@kernel.org, maz@kernel.org
Subject: Re: [PATCH v2 00/13] arm64: Preparatory FPSIMD/SVE/SME fixes
Message-ID: <aBIkoNmrf02PyYds@J2N7QTR9R3>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
 <174421878646.2870912.3802724291984766270.b4-ty@arm.com>
 <20250429194600.GA26883@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429194600.GA26883@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_062458_405377_D1F9B1E0 
X-CRM114-Status: GOOD (  22.35  )
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

On Tue, Apr 29, 2025 at 08:46:01PM +0100, Will Deacon wrote:
> On Wed, Apr 09, 2025 at 06:17:09PM +0100, Catalin Marinas wrote:
> > On Wed, 09 Apr 2025 17:39:57 +0100, Mark Rutland wrote:
> > > These patches fix a number of problems in the FPSIMD/SVE/SME code, as a
> > > step towards re-enabling SME support. Additional fixes/changes will be
> > > necessary before we can re-enable SME support. I intend to follow up
> > > with more patches in the near future.
> > > 
> > > I'm hoping these patches as-is are largely uncontroversial, though I'm
> > > afraid they've only seen light/targeted testing so far, so any testing
> > > would be much appreciated.
> > > 
> > > [...]
> > 
> > I added these patches to for-next/sme-fixes (and for-kernelci) for wider
> > exposure. Not queued for upstream yet, I need to review and discuss with
> > Will whether we target 6.15 or 6.16.
> 
> FYI: I see the following warning from 'allnoconfig' with these patches
> applied:
> 
> 
> arch/arm64/kernel/fpsimd.c:676:13: warning: unused function 'sve_to_fpsimd' [-Wunused-function]
>   676 | static void sve_to_fpsimd(struct task_struct *task)
>       |             ^~~~~~~~~~~~~
> 1 warning generated.

Argh, sorry about this.

That's a side-effect of fpsimd_signal_preserve_current_state() being
removed in commit:

  929fa99b1215966f ("arm64/fpsimd: signal: Always save+flush state early")

... since fpsimd_signal_preserve_current_state() was always defined and
would (conditionally) call sve_to_fpsimd().

> It's easy enough to move that inside the CONFIG_ARM64_SVE guards, but
> it's a little strange that fpsimd_to_sve() is more widely referenced
> and harder to move.

Yeah, this is a bit messy. I think no matter how we clean things up
we'll end up with a reference to fpsimd_to_sve() via do_sve_acc().  We
want do_sve_acc() to be defined regardless of CONFIG_ARM64_SVE so that
we get consistent trap/SIGILL behaviour when either CONFIG_ARM64_SVE=n
or SVE isn't supported by all PEs, and I don't think we want to move the
bulk of that logic under ifdeffery.

The simplest fix for now would be to mark fpsimd_to_sve() and
sve_to_fpsimd() as 'static inline' or '__maybe_unused', and the former
would be more consistent with the rest of the file.

I'll spin a fix shortly.

Mark.

