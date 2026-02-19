Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A007E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXiv4R6WCVXBVrZMqGzkIjXqOrG1i8AfxER8MYkGtLA=; b=DFKK+k89koLVcPD0Em6reNYLxA
	ZaIGQDbeZ6PaQs5ZFkacVNtsNw1cjIX0qgxZZhbi/KnQKcsh8ZA2rBmV5uqAFL+ki8THLgoVQtx91
	JzNhf+uZPVYbJCVt/OoXwDUaB5U39iFH9PfSz0P2F2mWprweOeWJepg/qrGEOb2kzEU4NzcPGDzbe
	OHVaDbOd0vLFGvYvhzGqd3CJjNBrDzmKmwXpLtjhNUTIrRTRlW57mAYqkXmuCwjS8qFbHw4tpoqXk
	aLcyLeVFJdid/+YVbqiDFTysunfkshZdxUDo96tc+nYdIp9Gs22WryeV+ehFlxJgRomdh2GbJGLGI
	CxFa5vIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4U8-0000000BQB8-0F9c;
	Thu, 19 Feb 2026 13:54:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4U6-0000000BQAP-24m9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 13:54:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D85C60054;
	Thu, 19 Feb 2026 13:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284C1C4CEF7;
	Thu, 19 Feb 2026 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771509265;
	bh=0QQ4xGrL6De/tHJfVXxAIlwtEBCu7b+nqFPL3Cqzz48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdCLTfXht8Wc/rrnBf+SlNxpDgCpjtZIxwlQ5GCjVdRW6kTQpEKp6xpQw3PXMGFj2
	 VeqLVVPk/ODP7SVlkgNoVtriLnqUkTuEeoJm7fpWQQ0jadxySqr3Qh8CR2YJxGXRL9
	 iT3tEstrZfY7yjgiOb4/0YfHykepPMi3dmfRnsQfPn6aM1fOzWEpWP9qKYiTgis2ag
	 2I6pl/KbuTMLOte5U5dxiM98YSJZ/16st3N6XV3Nae8oZdd0GtmH4HpOpbGk7380e1
	 NwWuY6kGLW9KWDcp60sW1wJ5qU2h/oREKFRxjFhS9Qglm9uSt5/+7DCsbOEQLHLX6U
	 2OyaIv8RWO5yQ==
Date: Thu, 19 Feb 2026 13:54:19 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <aZcWC25GE2iUKsNt@willie-the-truck>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
 <aZSAsC1YI5_lK3e0@willie-the-truck>
 <20260217190121.GB136967@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217190121.GB136967@e132581.arm.com>
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

On Tue, Feb 17, 2026 at 07:01:21PM +0000, Leo Yan wrote:
> On Tue, Feb 17, 2026 at 02:52:32PM +0000, Will Deacon wrote:
> 
> [...]
> 
> > > > It also looks like we can't rely on the dsb(nsh) in the vcpu_run()
> > > > path if that needs to be before the write to TRBLIMITR_EL1.
> > > > 
> > > > In which case, the host->guest something hideous like:
> > > > 
> > > > 	isb();
> > > > 	tsb_csync();	// Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!
> > > > 	dsb(nsh);	// I missed this in my patch
> > > > 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> > > > 	if (2064142) {
> > > > 		tsb_csync();
> > > > 		dsb(nsh);
> > > > 	}
> > > > 	isb();
> > > 
> > > As I_QXJZX suggests, the section K10.5.10 "Context switching" gives
> > > the flow.  I'd suggest the VM context switch is also aligned to the
> > > description in S_VKHHY.
> > 
> > I honestly have a hard time believing the sequence in S_VKHHY as the DSB
> > seems to be in the wrong place which means the TSB CSYNC can float. It
> > also isn't aligned with what the EL1 driver does...
> 
> Sorry for confusion.  I am checking internally for the flow suggested
> in S_VKHHY.
> 
> > > When switching from host to guest, we need to clear TRCPRGCTLR.EN to
> > > zero.  As the doc states "ETE trace compression logic is stateful,
> > > and disabling the ETE resets this compression state".
> > > 
> > > > and then the guest->host part is:
> > > > 
> > > > 	write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
> > > > 	isb();
> > > > 	if (2038923)
> > > > 		isb();
> > > > 
> > > > Does that look right to you?
> > > 
> > > S_PKLXF gives the flow for switching in.
> > 
> > Well, modulo errata, sure. I don't have access to the errata document so
> > I was more interested in whether I got that right...
> 
> Please see the doc:
> https://developer.arm.com/documentation/SDEN-1873351/1900/?lang=en

Aha, thank you, Leo!

I swear you used to be able to google the erratum number and get the doc,
but that doesn't seem to be the case any more. In fact, if you type the
erratum number into the search box on developer.arm.com it doesn't even
work, so cheers for pointing me to the right place.

Will

