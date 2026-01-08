Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456F6D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=II167pzCsbhjN5TOjj4CQ0NIpHKkpvrf/kifcZQTHBY=; b=oHtVk0LghURw5SoxrawslwJDdU
	diCcxuqQWzLz/3uqgQQ0z0SuUOKbbsObPhZcP6V9KgETqvNF7jQ7grpwoFyEls+a5LOk61ROqxpx7
	yHfsbg280AAoSC85tgTuDE6X4Z04fiv9yysMdL+JuCeoQavKG6ozhh5K0gtm3yXHgq4rgOvLQqmw3
	ZQE81iv13ScIOsyQmZKTtW0VI+ERKAnnBnaSG/TEvxJR0sti38f/Jg9TqoBtlkenxTvfT06FHBvmD
	Ur20JDDy1PkKMZDWMtm6TM82rRy6HT8ZrS+aJXdmefI3JwO/9rRJsAf9ECDvYWS0UhvL1wWTSk0fN
	PXhqU9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtFt-00000000DSY-1QQB;
	Thu, 08 Jan 2026 16:53:01 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtFp-00000000DR3-3j8a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:53:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=II167pzCsbhjN5TOjj4CQ0NIpHKkpvrf/kifcZQTHBY=;
	b=A5h/5rvLd+kC++bcaxicFm6aogjaeuE7BzIbJBYncalWYr5m7fLQILnx/0J1WS1TTx3CK8bHI
	TZ125i2Y8ZOT5Z1Wlfa1QMLnDZFat8lW6nENgCfaeBW92KRMc5CNsnAOHZFsjmEF1Rb2UFR4JQB
	88T6wa9cNd9CXAuPHzcBdKo=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dn9rF56Zmz1P7K9;
	Fri,  9 Jan 2026 00:50:21 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dn9tv6ngyzJ467w;
	Fri,  9 Jan 2026 00:52:39 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1023C40584;
	Fri,  9 Jan 2026 00:52:45 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 8 Jan
 2026 16:52:44 +0000
Date: Thu, 8 Jan 2026 16:52:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, Timothy Hayes <Timothy.Hayes@arm.com>, "Suzuki
 Poulose" <Suzuki.Poulose@arm.com>, nd <nd@arm.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, "maz@kernel.org"
	<maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>
Subject: Re: [PATCH v2 15/36] KVM: arm64: gic-v5: Implement GICv5 load/put
 and save/restore
Message-ID: <20260108165242.00001ed7@huawei.com>
In-Reply-To: <7d0defd915db9ca1a3fcb4dce70697d97622aeac.camel@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-16-sascha.bischoff@arm.com>
	<20260107122853.0000131c@huawei.com>
	<7d0defd915db9ca1a3fcb4dce70697d97622aeac.camel@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085259_089101_3B10EE4E 
X-CRM114-Status: GOOD (  27.05  )
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

On Thu, 8 Jan 2026 13:40:48 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> On Wed, 2026-01-07 at 12:28 +0000, Jonathan Cameron wrote:
> > On Fri, 19 Dec 2025 15:52:41 +0000
> > Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
> >  =20
> > > This change introduces GICv5 load/put. Additionally, it plumbs in
> > > save/restore for:
> > >=20
> > > * PPIs (ICH_PPI_x_EL2 regs)
> > > * ICH_VMCR_EL2
> > > * ICH_APR_EL2
> > > * ICC_ICSR_EL1
> > >=20
> > > A GICv5-specific enable bit is added to struct vgic_vmcr as this
> > > differs from previous GICs. On GICv5-native systems, the VMCR only
> > > contains the enable bit (driven by the guest via ICC_CR0_EL1.EN)
> > > and
> > > the priority mask (PCR).
> > >=20
> > > A struct gicv5_vpe is also introduced. This currently only contains
> > > a
> > > single field - bool resident - which is used to track if a VPE is
> > > currently running or not, and is used to avoid a case of double
> > > load
> > > or double put on the WFI path for a vCPU. This struct will be
> > > extended
> > > as additional GICv5 support is merged, specifically for VPE
> > > doorbells.
> > >=20
> > > Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> > > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com> =20
> >=20
> >  =20
> > > diff --git a/arch/arm64/kvm/vgic/vgic-v5.c
> > > b/arch/arm64/kvm/vgic/vgic-v5.c
> > > index 1fe1790f1f874..168447ee3fbed 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-v5.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> > > @@ -1,4 +1,7 @@
> > > =A0// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2025 Arm Ltd.
> > > + */ =20
> >=20
> > Why in this patch?=A0 It's trivial enough that maybe it doesn't need to
> > be
> > on it's own, but the first patch touching this file seems like a more
> > logical place to find it. =20
>=20
> I wholeheartedly agree, but it was unintentionally omitted when the
> GICv5 compat mode changes were introduced. It was originally in the
> first commit in this series to touch the file, but then things got re-
> worked so it became the second. I'll make sure that it lives in the
> first commit of this series to touch the file.
I'd just throw in a trivial commit that only does this.
Then any reorders that occur before this merges don't move it.

J
>=20
> Sascha
>=20


