Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B76CC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4qYr+BfI2d97uSVNI+YmBvuCgLID4BAS+wE8al32eY=; b=ltlIYpAJy7fN3vj89qhQHvF226
	bO+s0MnPMqfRzAwBKP1b1N/+brxqBKkoXlRXJe5kfH/AGwDYkxyQuh+0vokTua6fkJ8p1SALZSEUO
	mtcmVwVIJdE7JtSNtqvDvTW5qKpT6kwFcqCkqQyCC9lG73yAEozcJ9G+fJxZBW1aiwtYuX202z5lq
	dXGzXJp5jFIHy5ueEPqYzPcrVwYFEnL9fdk/vwEmDTEQG5WRZaeH525i8duoUR/ansoCeinvn93j4
	zpUlbb4beKU2SwEEKgNsDL4AJ3mfpm7oRwZ5TI7LnRFczBSddo4HUIoVOGyFURPo0/LP3zVosP5Nq
	ebsCaK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCQW-00000007ZKP-2w1E;
	Wed, 29 Jan 2025 18:04:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCP9-00000007ZDf-0OxV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 18:03:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0CCF5C5E32;
	Wed, 29 Jan 2025 18:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88272C4CED1;
	Wed, 29 Jan 2025 18:03:07 +0000 (UTC)
Date: Wed, 29 Jan 2025 18:03:05 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Message-ID: <Z5ptWRqZVI8grz6e@arm.com>
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
 <20250102160402.GB3990035-robh@kernel.org>
 <Z30adHnQ7ZFaU9UR@arm.com>
 <CAL_JsqLLnh1o4L1=PpNt5brBwZZCgp7mOygByOYakchrzc29Ow@mail.gmail.com>
 <86wmf5wo8u.wl-maz@kernel.org>
 <CAL_JsqKKiEOj=a1k6U-bB0F6-ht7QokDnh3bspHupp-QG=haSg@mail.gmail.com>
 <Z4kmlhnlpKjS_MII@arm.com>
 <CAL_JsqK1k7fG=yDZSbTbV63yRP5U9=GpuAiv=NWZJWdppUtRwA@mail.gmail.com>
 <7f5c68c7-8036-4d18-950f-80e55ac8ea11@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f5c68c7-8036-4d18-950f-80e55ac8ea11@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_100311_184255_D1E6F21D 
X-CRM114-Status: GOOD (  20.70  )
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

On Tue, Jan 28, 2025 at 02:41:17PM +0530, Anshuman Khandual wrote:
> On 1/18/25 03:37, Rob Herring wrote:
> > On Thu, Jan 16, 2025 at 9:32 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> >>
> >> On Wed, Jan 08, 2025 at 07:47:16AM -0600, Rob Herring wrote:
> >>> On Wed, Jan 8, 2025 at 5:15 AM Marc Zyngier <maz@kernel.org> wrote:
> >>>> On Tue, 07 Jan 2025 22:13:47 +0000,
> >>>> Rob Herring <robh@kernel.org> wrote:
> >>>>> On Tue, Jan 7, 2025 at 6:13 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> >>>>>> But does KVM actually expose the feature to EL1 in ID_AA64DFR1_EL1 and
> >>>>>> than traps it at EL2?
> >>>>>
> >>>>> As Marc pointed out KVM only advertises PMUv3.8. Regardless, guest
> >>>>> accesses to these registers are trapped with or without this series.
> >>>>
> >>>> And most probably generates a nice splat in the kernel log, as nobody
> >>>> updated KVM to handle *correctly* PMICNTR_EL0 traps, let alone deal
> >>>> with the FGT2 registers.
> >>>
> >>> Isn't that this series[1]? Should that have come first, I guess I know
> >>> that *now*.
> >> [...]
> >>> [1] https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/
> >>
> >> It's not any clearer to me. Does this series depend on the 46-patch one?
> >> Or, if we had the other, is this no longer needed? Or none of these,
> >> they are independent.
> > 
> > They are independent. I think ideally we'd want everything landing at
> > the same time, but we're past ideal at this point. Without this
> > series, if someone uses PMU on v8.9 and firmware enabled FGT2, then
> > the kernel will crash. Without the above series, KVM will have
> > warnings in the kernel log, but otherwise function.
> 
> Right, they are independent. Just that Rob had observed this PMU v3.8 boot
> requirement while reviewing the HW breakpoint series earlier. I should just
> respin this series after the upcoming v6.14-rc1 release is out ?

They may apply cleanly but please do rebase and repost at -rc1. Thanks.

-- 
Catalin

