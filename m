Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72819C55182
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 03:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hZs9Ix78cG9JiLmKyTk8Go33VSZmsG+AqSGCjUXAAM=; b=0k1wo1cFDf6qU0hEZHhNF3JEEH
	I1ajufI3Zsc6xq+pGWF17zDF0h3HSI6wBHX/yEete4xpNvLBw+5brbvHSpCKvBRxIEWQkXNhQJjvE
	QXvhlAhmkGwbAs1+VPXFirapwdc8WZ9ekiKjUCZRMUWhzr6H9qPaNA2qa3UvRPJ42yJtOCTiIO+tJ
	88rC6Tahy/4h9mBnYk51Hk19T7UFwAxryDSVtcqgwZYF84/yETPs1pDTgefC3OMspauswnHDCMMJK
	vmxp9zJzxMIrhC4RCTmVA23GUyrDVpoLg0/wFDN+aKKsq7wUTg2YXdw3Zze19XoNCTx/WGooWvZZQ
	cWTaZvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSmt-00000003CVT-27Kd;
	Wed, 05 Aug 2026 03:59:27 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSmp-00000003CV6-1qHG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 03:59:26 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260805035916epoutp039c33f8a154493d169eb4bb783cedeeb0~IzLsPX2xC2432424324epoutp03Q
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Aug 2026 03:59:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260805035916epoutp039c33f8a154493d169eb4bb783cedeeb0~IzLsPX2xC2432424324epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785902356;
	bh=7hZs9Ix78cG9JiLmKyTk8Go33VSZmsG+AqSGCjUXAAM=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=c4RpI0Cto38a4GK00G/UXpfd2ogMJIBZLlx/vN6zws12xfJhiifkhEG8i7H6izXCR
	 oh+bLnLA1Aq8eczGj/hyh5Ro14FoB7ZjbvXtyjJy15drEP0Noo/gBW7mwJry20K1aE
	 Ci7Zp5yiijfE6uW0HuXp50i3qe6Kk5A5cREZuiM8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260805035915epcas5p2ac9a5531321fe9f472572880f5a2c750~IzLr0JVUO2674926749epcas5p27;
	Wed,  5 Aug 2026 03:59:15 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hFGr33wxyz6B9m6; Wed,  5 Aug
	2026 03:59:15 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] arm: backtrace-clang: fix wrong sp usage for
 unwinding
From: Maninder Singh <maninder1.s@samsung.com>
To: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>
CC: Maninder Singh <maninder1.s@samsung.com>, Russell King
	<linux@armlinux.org.uk>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Onkarnath <onkarnath.1@samsung.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Rohit Thapliyal <r.thapliyal@samsung.com>, Nick
	Desaulniers <ndesaulniers@google.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <07e390cf-05ac-479e-9c34-d02b9897104c@app.fastmail.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260805035915epcms5p8b47cc0c9349e1a5178cc6e4c6d3ee918@epcms5p8>
Date: Wed, 05 Aug 2026 09:29:15 +0530
X-CMS-MailID: 20260805035915epcms5p8b47cc0c9349e1a5178cc6e4c6d3ee918
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5
References: <07e390cf-05ac-479e-9c34-d02b9897104c@app.fastmail.com>
	<20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
	<20260803182255.GC1067866@ax162>
	<CGME20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p8>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_205924_142402_A5281C8B 
X-CRM114-Status: GOOD (  17.76  )
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
Reply-To: maninder1.s@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Ard, Nathan

Thanks for checking the patch.

> The existing code does seem to be broken, as the provided frame pointer
> value is ignored entirely.
>=20
> However, by removing this add, you are skipping the false frame, which
> was added to ensure that calling c_backtrace() from dump_backtrace()
> does not miss any frames when regs =3D=3D NULL.
>=20
> So I think the correct approach here is to make the add conditional
> on whether frame =3D=3D fp, which will be the case when c_backtrace()
> is called from dump_backtrace() with a NULL regs argument.
>=20
> I.e.,
>=20
> =C2=A0=20cmp=C2=A0=20=C2=A0=20frame,=20fp=0D=0A>=20=C2=A0=20addeq=C2=A0=
=20frame,=20sp,=20=2324=0D=0A=0D=0AInitially=20I=20thought=20we=20can=20ign=
ore=20the=20extra=20frame,=20because=20we=20will=20be=20getting=0D=0Athe=20=
backtrace=20till=20show_stack().=0D=0A=0D=0ABut=20=22YES=22=20as=20you=20sa=
id=20to=20ensure=20dump_backtrace()=20in=20Backtrace,=20it=20should=20be=20=
there.=0D=0ASo=20I=20will=20send=20the=20update=20change.=0D=0A=0D=0ATested=
=20with=20your=20suggestion:=0D=0A=0D=0ACall=20trace:=0D=0A=20dump_backtrac=
e=20from=20show_stack+0x14/0x18=0D=0A=20show_stack=20from=20dump_stack_lvl+=
0x38/0x74=0D=0A=20dump_stack_lvl=20from=20dump_stack+0x14/0x18=0D=0A=20dump=
_stack=20from=20meminfo_proc_show+0x4c/0x908=0D=0A=20meminfo_proc_show=20fr=
om=20seq_read_iter+0x148/0x4bc=0D=0A=0D=0A=0D=0AThanks,=0D=0A=0D=0AManinder=
=20Singh

