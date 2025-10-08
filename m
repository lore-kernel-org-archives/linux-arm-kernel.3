Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6ADCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 05:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37OZMA1ahP4rR/1YHGb7OtZAePrK+tQ5/lS20oXfdJg=; b=t7Lt9aWW0XNFNDaDektXFNcYS9
	BgXhxW82LnliScFhXb/orZheRp9H9E6bneDlUNOtxHDTdL40t4+SyQFRwsiRhrst9XVDxEdFIv9Hl
	jobKvSrnHsFCop8/338NW0YgGGLQnQ7vBFS0Ad4DYVn4IEZBo1FiIB/Z697hhX5qx5cvBv9cmPwu7
	nQLSkEnrB4SF3Hox2H4/M1WpHQSyGFr3cSxL3xQCZ9Hm6uE/GWZ4YR/Ocuh7KGXZ9ZijajGZAfugy
	IsTJDs5jXdZ1v/VfnwnLuRGJHA6CFgeI3lrFVimR4nGldAZgnowrTR8VHCWS8KSLnYs0nzYnzZnC8
	DHF6eJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6MfH-00000003DQA-0MzM;
	Wed, 08 Oct 2025 05:24:39 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6MfD-00000003DPc-3wwF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 05:24:37 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251008052428epoutp0324b4cbf55ecb3d0b2df4d673573cd4b5~sbLKIELwn0685606856epoutp037
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Oct 2025 05:24:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251008052428epoutp0324b4cbf55ecb3d0b2df4d673573cd4b5~sbLKIELwn0685606856epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759901068;
	bh=37OZMA1ahP4rR/1YHGb7OtZAePrK+tQ5/lS20oXfdJg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vQiI2Yn/60l2SHMdACjGSrGhyE7wcDZB3oN06BLfqUKEGEinboJMoHavj/lYI3eyC
	 dQHrvUIy0AA0nWrueMt9KahLR+Zk/lTVrkUNXGKySeOt7Q0FUsOsLurk0G+6tN8iX8
	 XBfDBc+HE+ia0LQwiLdY7dCxAc+5d0eU8zSP97Xo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251008052427epcas5p1bba76aa459c3fee2a5529d499812f82b~sbLJduMLZ1701517015epcas5p1L;
	Wed,  8 Oct 2025 05:24:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4chLzG5Htyz6B9m5; Wed,  8 Oct
	2025 05:24:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251008052426epcas5p2e216f47cb17e3b4c8fafc458a60eeac5~sbLIF68Xl1998519985epcas5p27;
	Wed,  8 Oct 2025 05:24:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251008052422epsmtip1b0c0404216e801ee646f92e8a0bfcfc1~sbLE5pAWN1322713227epsmtip1H;
	Wed,  8 Oct 2025 05:24:22 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: =?utf-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Greg
 Kroah-Hartman'" <gregkh@linuxfoundation.org>, "'Rob Herring'"
	<robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>
Cc: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Tudor Ambarus'"
	<tudor.ambarus@linaro.org>, "'Will McVicker'" <willmcvicker@google.com>,
	<kernel-team@android.com>, "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
Subject: RE: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add
 power-domains
Date: Wed, 8 Oct 2025 10:54:20 +0530
Message-ID: <000001dc3813$d00ae020$7020a060$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKVekh1tGGcjz0jubEbe89UqPOX0gImOeLnszQBBMA=
Content-Language: en-us
X-CMS-MailID: 20251008052426epcas5p2e216f47cb17e3b4c8fafc458a60eeac5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251007155511epcas5p3a6f9e083226f902027828e97ed49af76
References: <CGME20251007155511epcas5p3a6f9e083226f902027828e97ed49af76@epcas5p3.samsung.com>
	<20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_222436_624927_79FF6C69 
X-CRM114-Status: UNSURE (   6.72  )
X-CRM114-Notice: Please train this message.
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
> From: Andr=C3=A9=20Draszik=20<andre.draszik=40linaro.org>=0D=0A>=20Sent:=
=20Tuesday,=20October=207,=202025=209:25=20PM=0D=0A>=20To:=20Greg=20Kroah-H=
artman=20<gregkh=40linuxfoundation.org>;=20Rob=20Herring=0D=0A>=20<robh=40k=
ernel.org>;=20Krzysztof=20Kozlowski=20<krzk+dt=40kernel.org>;=20Conor=0D=0A=
>=20Dooley=20<conor+dt=40kernel.org>;=20Alim=20Akhtar=20<alim.akhtar=40sams=
ung.com>=0D=0A>=20Cc:=20Peter=20Griffin=20<peter.griffin=40linaro.org>;=20T=
udor=20Ambarus=0D=0A>=20<tudor.ambarus=40linaro.org>;=20Will=20McVicker=20<=
willmcvicker=40google.com>;=0D=0A>=20kernel-team=40android.com;=20Krzysztof=
=20Kozlowski=20<krzk=40kernel.org>;=20linux-=0D=0A>=20usb=40vger.kernel.org=
;=20devicetree=40vger.kernel.org;=20linux-arm-=0D=0A>=20kernel=40lists.infr=
adead.org;=20linux-samsung-soc=40vger.kernel.org;=20linux-=0D=0A>=20kernel=
=40vger.kernel.org;=20Andr=C3=A9=20Draszik=20<andre.draszik=40linaro.org>=
=0D=0A>=20Subject:=20=5BPATCH=5D=20dt-bindings:=20usb:=20samsung,exynos-dwc=
3:=20add=20power-=0D=0A>=20domains=0D=0A>=20=0D=0A>=20The=20DWC3=20can=20be=
=20part=20of=20a=20power=20domain,=20so=20we=20need=20to=20allow=20the=20re=
levant=0D=0A>=20property=20'power-domains'.=0D=0A>=20=0D=0A>=20Signed-off-b=
y:=20Andr=C3=A9=20Draszik=20<andre.draszik=40linaro.org>=0D=0A>=20---=0D=0A=
Thanks=21=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=
=0D=0A=0D=0A

