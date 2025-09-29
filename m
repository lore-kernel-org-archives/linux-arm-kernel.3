Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE95CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEcpI5UHajZzcOgKwh0ZSahyLNRamKTjcsRj6A5OzRs=; b=2o5/COJaa2nWW5xOfpGswAM26K
	BAkxr278zorO6wz5jMFldD/BDg9i7+cWKanIroU0VzufLq+f430eh7n8KdJFYin2CsVxkwoOIacBn
	MFkN7Ds4B7lFVPt2fJnPD4DeDZ1K+0WPcrZ91zw+nX/d8CkZLsEoe9n8rFp/drVjYu2wgxBR1t6aK
	oSg643dNN1AJRdI93KX0TT3BoHpfpSSWZ9nJn8Wtcmaspbzj5XFkdcFEtX8HwCTlgN4aVqGOTM8z4
	mpG/2oQCZsiTfE7tY3SiOIVYBaYGaoBALxYQWtzLAJv3C6HH4BSeeVKPOSedI3XpW5PxXbugkDhKz
	AW080fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37eN-00000001VvY-0jXY;
	Mon, 29 Sep 2025 06:46:19 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37eJ-00000001Vtw-1o3q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:46:17 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250929064603epoutp01ad1aeed80888267da6399220b6c5ee6f~pre0MYg921826118261epoutp01I
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:46:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250929064603epoutp01ad1aeed80888267da6399220b6c5ee6f~pre0MYg921826118261epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128363;
	bh=tEcpI5UHajZzcOgKwh0ZSahyLNRamKTjcsRj6A5OzRs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DT1H1tqNqhbjc9LyomxUMXC/CTMq/GHzDlmjSDD1B4PrE8yIw/d9D9XkFL4ZYe7SO
	 d/GX2BCZGovXORXJnqwgxEkD77cTtZNhSjaltD2dATvxoxqm9qVBWgOs0gjn3v/Zfo
	 BiU3U8VOFmKa8v+unIuPcSaLJrxQARLqhb0hX5HY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250929064602epcas5p45e71a950ed75ff05f651d9e8ea81577c~prezjA47S0430204302epcas5p4w;
	Mon, 29 Sep 2025 06:46:02 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cZsCY1ggDz2SSKq; Mon, 29 Sep
	2025 06:46:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929064600epcas5p2aad3d7244d83c6751ea7b1dbd0b63dc9~prex_ExEA3230632306epcas5p2G;
	Mon, 29 Sep 2025 06:46:00 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064554epsmtip2d133b1f85860186fda42b9aae1351b20~presS4JLU0831808318epsmtip29;
	Mon, 29 Sep 2025 06:45:54 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250903073827.3015662-2-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Mon, 29 Sep 2025 12:15:52 +0530
Message-ID: <001301dc310c$b7a78550$26f68ff0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgGabj6EAmTXuDe0H7zKkA==
Content-Language: en-us
X-CMS-MailID: 20250929064600epcas5p2aad3d7244d83c6751ea7b1dbd0b63dc9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
	<20250903073827.3015662-2-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_234615_843926_149FDD3F 
X-CRM114-Status: GOOD (  14.30  )
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
> Sent: Wednesday, September 3, 2025 1:08 PM
> To: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com;
> pritam.sutar=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; rosa.pila=40samsung.com;
> dev.tailor=40samsung.com; faraz.ata=40samsung.com;
> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> Subject: =5BPATCH v8 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: add
> ExynosAutov920 HS phy compatible
>=20
> Document support for the USB20 phy found on the ExynosAutov920 SoC.
> The
> USB20 phy is functionally identical to that on the Exynos850 SoC, so no d=
river
> changes are needed to support this phy. However, add a dedicated
> compatible string for USB20 phy found in this SoC.
>=20
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


