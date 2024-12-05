Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB9E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdU/UVn3AF9xp/nf/fY5dZmscI+iJoe1dg85CIeC/X8=; b=wxJPlAcrUISV4wyZbD9QGrKNU6
	kefPyHen74+ZKxqPIvmREXGr9diJP3DXgKvhE40adZDfbPga9Q/LiuFLX8ahH3J8pV9N53kJDiWyt
	v38jC2WO/uVz5z/DuodsvPcJxsRzeY7jMoxt7XrFyKQ32mzgQT7jg8QFwny8NXRchI+8aZxfH7kga
	spM3i1RRZvuxCZxgC9d2OABYUtMXydM8YW4FeIsxYekW+yXznP/Oe/RLZXcnDO8yR/rRcvipApqwU
	MIVsmbc5F00Aw+DOmxkNEqjUBfJQX1loS/xEBnxOeEqHRBhmAQS1kF6BvY+vGeFX8WMP13kmlEEPz
	/ItloNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7de-0000000FFO6-2OnF;
	Thu, 05 Dec 2024 08:55:10 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7cc-0000000FF6v-2Sth
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:54:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y3p6n16b7z21mbq;
	Thu,  5 Dec 2024 16:52:17 +0800 (CST)
Received: from kwepemf200002.china.huawei.com (unknown [7.202.181.228])
	by mail.maildlp.com (Postfix) with ESMTPS id 6DB01180043;
	Thu,  5 Dec 2024 16:53:55 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 kwepemf200002.china.huawei.com (7.202.181.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Dec 2024 16:53:54 +0800
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 5 Dec 2024 09:53:52 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>
CC: Will Deacon <will@kernel.org>, "james.morse@arm.com"
	<james.morse@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>, Gleb Fotengauer-Malinovskiy
	<glebfm@altlinux.org>, wanghuiqiang <wanghuiqiang@huawei.com>
Subject: RE: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Thread-Topic: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Thread-Index: AQHbRHc1pIGPV7SGf0u8eV81r8P21rLTBiuAgAAE74CAAAGXAIAAAhCAgABrXYCAALdLgIAAGCGAgAC+UYCAALHaAIAAowSAgAD/uVA=
Date: Thu, 5 Dec 2024 08:53:52 +0000
Message-ID: <156521fbdabb428a805e38c99f8f57c2@huawei.com>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck> <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org> <86ser6t6fs.wl-maz@kernel.org>
 <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
 <20241203092721.j473dthkbq6wzez7@altlinux.org>
 <1847e34fa7724d28aeb22d93752f64f2@huawei.com>
 <20241203221453.mwh6sozyczi4ec2k@altlinux.org> <87jzcfsuep.wl-maz@kernel.org>
 <20241204182231.ovvj6rpvcs2f5gv7@altlinux.org>
In-Reply-To: <20241204182231.ovvj6rpvcs2f5gv7@altlinux.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_005406_787495_5B5BA1B6 
X-CRM114-Status: GOOD (  12.08  )
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



> -----Original Message-----
> From: Vitaly Chikunov <vt@altlinux.org>
> Sent: Wednesday, December 4, 2024 6:35 PM
> To: Marc Zyngier <maz@kernel.org>
> Cc: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Will Deacon
> <will@kernel.org>; james.morse@arm.com; linux-arm-
> kernel@lists.infradead.org; Catalin Marinas <catalin.marinas@arm.com>;
> linux-kernel@vger.kernel.org; oliver.upton@linux.dev;
> mark.rutland@arm.com; Wangzhou (B) <wangzhou1@hisilicon.com>; Gleb
> Fotengauer-Malinovskiy <glebfm@altlinux.org>
> Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
> 0000000002000000 [#1] SMP
>=20


> > > > Is there a way you can find out the BIOS version on that board?
> > >
> > > Unfortunately, admins of the server do not provide me with this
> > > info.
> >
> > This doesn't really help, I'm afraid.
>=20
> They provided me with this dmicedcode output:
>=20
>   Handle 0x0000, DMI type 0, 26 bytes
>   BIOS Information
> 	  Vendor: Huawei Corp.
> 	  Version: 1.25

The information I have from our BIOS team is that you need version 1.70 or =
above to
support MPAM.=20

Thanks,
Shameer

