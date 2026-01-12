Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2122BC9EC80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMWrNodyPbH0cxOyXghaAdCqoid1aUqucu2YzK3hs90=; b=IBLKJXgZYnXVmoZ/fKPkIzA3Iw
	OzDREKtk15dbM0s5Dwcr3+UdBraxK5/s6lZBRJSfyz56hcDRsMEEHSp9SQfwO/L0GCGeD9MRBGnQj
	aYha1xu10MjLnob0wJfAAOe54+gAVYB2yppIDqh/86v0wn3HjmqHX0Dky1nLCftsU7pTGuYm9KiAk
	IBeD74RjoJN6tyDwOnjseo0U1MvRjkD6ZDOpg44Bz4cwyA5PT0dRTSQ0sAqWQLi3vau//6Wv1vxSm
	7opC1Lmxa1mo+viugxzmopmPQIQkFe+9l8co0u15TWpoL2yE0LG7VNp1eeZ4a83a3CbRfyEH7OhLE
	nJ405wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHFZ-00000005Kwc-3QTj;
	Mon, 12 Jan 2026 12:42:25 +0000
Received: from [119.8.177.37] (helo=sinmsgout02.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHFW-00000005KvP-0HXD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:42:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TMWrNodyPbH0cxOyXghaAdCqoid1aUqucu2YzK3hs90=;
	b=zD1UjWICSccTtmI2eRKhTbmbc6ZzCS7MrAwECZrg4sM4bW5c6vjY09H0kHYj9d5crjWv1LGzW
	/iwWFNvY42eqIir1KhwPiMGpQMTTn3pJBI8SRFxXI3+i32Lwk0rRThnvYWVWz2UzgIWhupoWjz7
	VhuPm6XGVIM7K27bkERVbls=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dqX5363Y6z1vp0g;
	Mon, 12 Jan 2026 20:39:35 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqX7J1bc9zHnH4f;
	Mon, 12 Jan 2026 20:41:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 37D0640086;
	Mon, 12 Jan 2026 20:41:48 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 12:41:44 +0000
Date: Mon, 12 Jan 2026 12:41:43 +0000
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
Subject: Re: [PATCH v2 02/36] KVM: arm64: gic-v3: Switch vGIC-v3 to use
 generated ICH_VMCR_EL2
Message-ID: <20260112124143.000009c9@huawei.com>
In-Reply-To: <4117fd5aca061db0857c0fc87f320b01f3347376.camel@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-3-sascha.bischoff@arm.com>
	<20260106180022.00006dcd@huawei.com>
	<cdef264835c24f1e2155cadd5a414fb34d06bca3.camel@arm.com>
	<4117fd5aca061db0857c0fc87f320b01f3347376.camel@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_044223_249040_755777D2 
X-CRM114-Status: GOOD (  27.25  )
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

On Fri, 9 Jan 2026 16:57:18 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> On Wed, 2026-01-07 at 10:55 +0000, Sascha Bischoff wrote:
> > On Tue, 2026-01-06 at 18:00 +0000, Jonathan Cameron wrote: =20
> > > On Fri, 19 Dec 2025 15:52:36 +0000
> > > Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
> > >  =20
> > > > From: Sascha Bischoff <Sascha.Bischoff@arm.com>
> > > >=20
> > > > The VGIC-v3 code relied on hand-written definitions for the
> > > > ICH_VMCR_EL2 register. This register, and the associated fields,
> > > > is
> > > > now generated as part of the sysreg framework. Move to using the
> > > > generated definitions instead of the hand-written ones.
> > > >=20
> > > > There are no functional changes as part of this change.
> > > >=20
> > > > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com> =20
> > > Hi Sascha
> > >=20
> > > Happy new year.=A0 There is a bit in here that isn't obviously going
> > > to result in no functional change. I'm too lazy to chase where the
> > > value
> > > goes to check it it's a real bug or not.
> > >=20
> > > Otherwise this is inconsistent on whether the _MASK or define
> > > without
> > > it from the sysreg generated header is used in FIELD_GET() /
> > > FIELD_PREP()
> > >=20
> > > I'd always use the _MASK version. =20
> >=20
> > Hi Jonathan,
> >=20
> > I've updated the code to use the _MASK version.
> >  =20
> Hi Jonathan,
>=20
> I've actually had a change of heart (sorry!). I think it is clearer to
> use the _MASK version when explicitly using the value as a mask, but to
> drop that for the FIELD_x() ops as in that case we're naming a field.
>=20
> I've gone through and made the usage of those consistent.

Fair enough.  I'd have argued that there should never have been both
in the first place in the generated header as the non _MASK ones add
no value. The only argument I can think of is that we don't normally
use _MASK for single bit defines when doing doing it by hand, but such
is life. I do think you are setting yourself up for a world in which new
patches mix these up and you get to post lots of review feedback on it ;)

Jonathan

>=20
> Sascha
>=20
> >  =20


