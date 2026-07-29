Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1948AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 03:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:From:Subject:
	Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=kyg5rzY90hhDhLDLHmSGbHFlONdb32qcU/dO4mwBsso=; b=A9z8dcMg0VyG7ECHh/nKuxfsoW
	l0/wvGvyotaDA9nNugT8mFisVsEPOfz59jR98oqyFdFAuLahWQkhLPgNdG+/n2lTWELN1FJPhD4nH
	vJ3ucpRZxcOoA6+S+NoEMMJJ1NSts4XOW7nWIbXXiH2NET8CnGrrUjzRNieccuksC+SSMgk9vOTex
	MTMqeqBlpghPa+Ct3h7DR+DsqXdbB7PSDNyNI7CLblDfKBOMAQpWFELF6cUkzhrYTduhzIDI2inlC
	KwOWoYs8ab1IiRnfemveQlG3+UN5nnBDpL58wDf/lCvl5cNtfxjMzJL1zveKeXahj6r7gsR/bg/AZ
	7QXqkfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovAP-00000006ltB-2YrH;
	Wed, 29 Jul 2026 03:41:13 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovAL-00000006lsW-3ZYA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 03:41:12 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260729034103epoutp04f9f8144db4013d68445d1f9722163455~GpayYBtwB3143731437epoutp04Q
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:41:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260729034103epoutp04f9f8144db4013d68445d1f9722163455~GpayYBtwB3143731437epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785296463;
	bh=kyg5rzY90hhDhLDLHmSGbHFlONdb32qcU/dO4mwBsso=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=o+gNIbZuglU3pJ6E/08bcqgXiDLLj2QuQLa5HVyjFlKgt5G0x0EFNapHwOWpivqQF
	 RmRSinAEBpISCm1r4CkjhUXpdzpY4W5zs2JgFXHGOSSIb+oDJCghT1sjukw/MlTd1H
	 AsjBz73iGEM3sC5IfRys2NPg1xsgC6igPW/8ZMMs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260729034101epcas5p1a82e6097e73bb6c7ba322230094ba9c1~Gpaxa3qtv1874118741epcas5p19;
	Wed, 29 Jul 2026 03:41:01 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h8ymF6k2Qz6B9m7; Wed, 29 Jul
	2026 03:41:01 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] arm: backtrace-clang: fix wrong sp usage for
 unwinding
From: Maninder Singh <maninder1.s@samsung.com>
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "nathan@kernel.org"
	<nathan@kernel.org>, "nick.desaulniers+lkml@gmail.com"
	<nick.desaulniers+lkml@gmail.com>, "morbo@google.com" <morbo@google.com>,
	"justinstitt@google.com" <justinstitt@google.com>
CC: Onkarnath <onkarnath.1@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Rohit Thapliyal <r.thapliyal@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
Date: Wed, 29 Jul 2026 09:11:01 +0530
X-CMS-MailID: 20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5
References: <CGME20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_204110_553107_501F81AA 
X-CRM114-Status: GOOD (  12.01  )
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

Ping=21 Any comments?

> show_stack() can be called for any task, however c_backtrace always unwin=
ds
> frames based on the =22sp=22 register. This results in printing the backt=
race of
> the current task instead of the target task.
>=20
> Try with normal TC:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0=20=C2=A0=20=C2=A0=20=20for_each_process(p)=20=7B=0D=0A>=20=C2=A0=
=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=20sched_show_task=
(p);=0D=0A>=20=C2=A0=20=C2=A0=20=C2=A0=20=20=7D=0D=0A>=20=0D=0A>=20=5B7.433=
271=5D=20task:kthreadd=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20state:S=20stack:0=
=C2=A0=20=C2=A0=20=20pid:2=C2=A0=20=C2=A0=20=20tgid:2=C2=A0=20=C2=A0=20=20p=
pid:0=C2=A0=20=C2=A0=20=C2=A0=20task_flags:0x208040=20flags:0x00000000=0D=
=0A>=20=5B7.433633=5D=20Call=20trace:=0D=0A>=20=5B7.433640=5D=20=5B<8011341=
8>=5D=20(dump_backtrace)=20from=20=5B<80113510>=5D=20(show_stack+0x14/0x18)=
=0D=0A>=20..=0D=0A>=20=5B7.433676=5D=20=5B<8016749c>=5D=20(sched_show_task)=
=20from=20=5B<803cb324>=5D=20(meminfo_proc_show+0x6c/0x930)=0D=0A>=20=5B7.4=
34019=5D=C2=A0=20r5:8158e300=20r4:8b4882d0=0D=0A>=20=5B7.434024=5D=20=5B<80=
3cb324>=5D=20(meminfo_proc_show)=20from=20=5B<80365788>=5D=20(seq_read_iter=
+0x148/0x4bc)=0D=0A>=20=5B7.434045=5D=20=5B<80365788>=5D=20(seq_read_iter)=
=20from=20=5B<803c044c>=5D=20(proc_reg_read_iter+0xb8/0xc4)=0D=0A>=20=5B7.4=
34060=5D=20=5B<803c044c>=5D=20(proc_reg_read_iter)=20from=20=5B<80377104>=
=5D=20(copy_splice_read+0x228/0x308)=0D=0A>=20=0D=0A>=20It=20should=20unwin=
d=20frame=20based=20on=20passed=20=22fp=22.=0D=0A>=20(CONFIG_UNWINDER_FRAME=
_POINTER=3Dy)=0D=0A>=20=0D=0A>=20With=20fix:=0D=0A>=20=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=0D=0A>=20=5B13.933732=5D=20task:kthreadd=C2=A0=20=C2=A0=20=C2=A0=20=
=C2=A0=20state:S=20stack:0=C2=A0=20=C2=A0=20=20pid:2=C2=A0=20=C2=A0=20=20tg=
id:2=C2=A0=20=C2=A0=20=20ppid:0=C2=A0=20=C2=A0=20=C2=A0=20task_flags:0x2080=
40=20flags:0x00000000=0D=0A>=20=5B13.934165=5D=20Call=20trace:=0D=0A>=20=5B=
13.934604=5D=20=5B<80afa1a8>=5D=20(schedule)=20from=20=5B<8015426c>=5D=20(k=
threadd+0x124/0x208)=0D=0A>=20=5B13.934654=5D=C2=A0=20r10:8100bbf0=20r4:811=
6f440=0D=0A>=20=5B13.934664=5D=20=5B<8015426c>=5D=20(kthreadd)=20from=20=5B=
<8010010c>=5D=20(ret_from_fork+0x14/0x28)=0D=0A>=20=5B13.934691=5D=20Except=
ion=20stack(0xf081df9c=20to=200xf081dfe4)=0D=0A>=20=0D=0A>=20Additionally,=
=20the=20extra=20manipulation=20of=20=22sp=22=20register=20appears=20unnece=
ssary=20in=20the=20=22current=22=0D=0A>=20task=20also=20since=20the=20=22fp=
=22=20register=20is=20already=20provided.=0D=0A>=20=0D=0A>=20Signed-off-by:=
=20Onkarnath=20=0D=0A>=20Signed-off-by:=20Maninder=20Singh=20=0D=0A>=20---=
=0D=0A>=20=20arch/arm/lib/backtrace-clang.S=20=7C=204=20----=0D=0A>=20=201=
=20file=20changed,=204=20deletions(-)=0D=0A>=20=0D=0A>=20diff=20--git=20a/a=
rch/arm/lib/backtrace-clang.S=20b/arch/arm/lib/backtrace-clang.S=0D=0A>=20i=
ndex=20290c52a60fc6..993410a6afd1=20100644=0D=0A>=20---=20a/arch/arm/lib/ba=
cktrace-clang.S=0D=0A>=20+++=20b/arch/arm/lib/backtrace-clang.S=0D=0A>=20=
=40=40=20-105,10=20+105,6=20=40=40=20ENDPROC(c_backtrace)=0D=0A>=20=20=09=
=09moveq=09mask,=20=230xfc000003=0D=0A>=20=20=09=09movne=09mask,=20=230=09=
=09=40=20mask=20for=2032-bit=0D=0A>=20=20=0D=0A>=20-/*=0D=0A>=20-=20*=20Swi=
tches=20the=20current=20frame=20to=20be=20the=20frame=20for=20dump_stack.=
=0D=0A>=20-=20*/=0D=0A>=20-=09=09add=09frame,=20sp,=20=2324=09=09=40=20swit=
ch=20to=20false=20frame=0D=0A>=20=20for_each_frame:=09tst=09frame,=20mask=
=09=09=40=20Check=20for=20address=20exceptions=0D=0A>=20=20=09=09bne=09no_f=
rame=0D=0A>=20=20=0D=0A>=20--=20=0D=0A>=202.34.1=0D=0A=0D=0A

