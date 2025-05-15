Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE90C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwnsrpMvLC2QSW4QUvZ69ahD/8TwjGI5Icjzo88ho0E=; b=JbVKjiJ+tcxDxpfAXYahqo57mT
	ZUPH9kzp4/H2D+aReJOTrW8O5t1/DB+LrHmYMFfQ2PfLMNEvqOW/tWxGVxzBD81OarLY6L1ejSurW
	g5dgWZVk7kolYmCsDLdEmOo+4YuWtORSz2lifkKuEciXHv7B3lZSIEWA5FnRxS3jYw99h+wD6/bpX
	O6I1y3hPgzRxU91BXCyUAofuaRI5zFgCaj1IcI5nx4Zd52sfKbwAwqukEIweR3HziUtBvIxTtatmH
	MGofYGesOwlkw4xsiwOcXGAXimBFR6Hgt8/b52Czt4+HXHWa6sXt0VqCixNCL/+J9po1VYHbRd+YF
	SAiyXzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFV5S-00000000CFJ-2hWI;
	Thu, 15 May 2025 09:41:10 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUv9-00000000A8Q-3bWp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:30:35 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250515093024epoutp034c182d944feea0ff27b7a2a689bde60e~-qWNsILa52592425924epoutp031
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 09:30:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250515093024epoutp034c182d944feea0ff27b7a2a689bde60e~-qWNsILa52592425924epoutp031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747301424;
	bh=LwnsrpMvLC2QSW4QUvZ69ahD/8TwjGI5Icjzo88ho0E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Mfj/xQBSk2q1y0nv8nneqDcaNNDD+L35xHCE+dpQjT74oWb9Fpzgd0ySJFb7uChkH
	 qyF4CDyR/4z+XqkPkqeHZQOpaaOf74Gh+G8d5xEKM3cIobL6CCUxZA0WvXQUrYYDn3
	 Ohnhpajy1aSRPN4V1TUXFRYmFSdJXhy1VZmr4G8o=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250515093024epcas5p1e40dc34ff2f2ca956214a06054db9ecd~-qWNVLl0H1137911379epcas5p1e;
	Thu, 15 May 2025 09:30:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.181]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZylLR1RT0z6B9mR; Thu, 15 May
	2025 09:30:23 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250515093022epcas5p2bb0e66bb225d96634bc6aacf984b8921~-qWLa5I0a2807728077epcas5p23;
	Thu, 15 May 2025 09:30:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515093022epsmtrp227032d23c4c687f60f048b99fbe39566~-qWLZ9Lgu2206622066epsmtrp2w;
	Thu, 15 May 2025 09:30:22 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-91-6825b42dfd88
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	41.F1.08805.D24B5286; Thu, 15 May 2025 18:30:21 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250515093019epsmtip276ad656a8729e1e80dbc116905a54ea1~-qWIpqNm70035900359epsmtip26;
	Thu, 15 May 2025 09:30:19 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>,
	<gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250514140741.415981-3-pritam.sutar@samsung.com>
Subject: RE: [PATCH 2/2] usb: dwc3-exynos: add support for ExynosAutov920
Date: Thu, 15 May 2025 15:00:18 +0530
Message-ID: <0efd01dbc57b$faaafa00$f000ee00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHb4atmIwpdDAkGWt442tTNHGskkAJ/U0NcARvjAqiztljokA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsWy7bCSvK7uFtUMg+szDSzW7D3HZHFvxzJ2
	i/lHzrFaXLuxkN2iefF6NouXs+6xWWx6fI3V4vKuOWwWM87vY7JYtKyV2eL8iy5Wi2f3VrBZ
	/N+zg93iy88HzBZHln9ksli14AC7g4DHplWdbB77565h99i8pN6jb8sqRo8t+z8zenzeJBfA
	FsVlk5Kak1mWWqRvl8CVcX5xO3vBYbaKi5sfsTQwbmDtYuTkkBAwkXi7awJbFyMXh5DAbkaJ
	JdvvM0MkpCWub5zADmELS6z89xzMFhJ4ziixujUBxGYT0JXYsbgNrFlEYA+jRMfCh4wgDrPA
	fiaJab+XMUGMPcwoMfPZfLB9nAL2EpvP72IDsYUFPCX+/vkFZHNwsAioSpx/6A4S5hWwlLg/
	vYERwhaUODnzCQuIzSygLdH7sJURxl628DXUpQoSP58uYwUZIyLgJHFzTxBEibjEy6NH2Ccw
	Cs9CMmkWkkmzkEyahaRlASPLKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4IjV0trB
	uGfVB71DjEwcjIcYJTiYlUR4r2cpZwjxpiRWVqUW5ccXleakFh9ilOZgURLn/fa6N0VIID2x
	JDU7NbUgtQgmy8TBKdXAZBZRe+PH2vv7bn1ZpFAdXpO02De/gXthVNlvFibN2jP12Q7rl6tc
	3ijE5R+3xYN9n2PPNfF7N8K9rly7rSYvPi31RbKUIO/hVz/Mal+oWy+6uMvBObNjkRFLd+Yf
	5QN3Ul7YLBD9eFzq4W1Jrotpp7bEGMc/YxJ5vsPXcN2ugGUtDI8i/iY6V31XejL54ZHb8+oP
	6nomXz/tpHM53npn/ROW1UHOblM6joffvfXHMLOA9cCEk39LkqvDNx47b2wRtiQx8+H6dp9n
	t//NOqQ+g93PJv74Fm6p1rZamY4L3Xwdwk1vbrxSCgx49sb9RfmXF/9PrL3M25TG/b6wplfJ
	KNIsQ7lsSQ9LyaE/tcxTlViKMxINtZiLihMBl9lrLUcDAAA=
X-CMS-MailID: 20250515093022epcas5p2bb0e66bb225d96634bc6aacf984b8921
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
	<CGME20250514135757epcas5p1aab0db4b4910b689f76ad00661f2a8e9@epcas5p1.samsung.com>
	<20250514140741.415981-3-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_023032_514386_CFEC7CCC 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: Wednesday, May 14, 2025 7:38 PM
> To: pritam.sutar=40samsung.com; gregkh=40linuxfoundation.org;
> robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
>=20
=5Bsnip=5D
>  static const struct of_device_id exynos_dwc3_match=5B=5D =3D =7B
>  	=7B
>  		.compatible =3D =22samsung,exynos2200-dwusb3=22, =40=40 -209,6
> +215,9 =40=40 static const struct of_device_id exynos_dwc3_match=5B=5D =
=3D =7B
>  	=7D, =7B
>  		.compatible =3D =22google,gs101-dwusb3=22,
>  		.data =3D &gs101_drvdata,
> +	=7D, =7B
> +		.compatible =3D =22samsung,exynosautov920-dwusb3=22,
> +		.data =3D &exynosautov920_drvdata,

Should go below =22 samsung,exynos2200-dwusb3=22 entry (as already pointed =
by Thinh)
With that fixed

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>



