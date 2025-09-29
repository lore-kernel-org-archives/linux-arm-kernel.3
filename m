Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749E2CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLrq4rO43N5uwgEaMfX6vfw6nUoLOsIdWCvpc8PcZRo=; b=ObmCfJevza0y/hmMFwgVT7o9OF
	OYhBQZRg0X26kfkwMoga7s/rd5Z2B8DsRrzFMbMpG2PnDL2laRAT2U74jJyqEtHpZiEe8rPOAVYsO
	2DiB03b7uLgbNkwSyqs3xTy8T5CRRNnGwnQhVGCBc9t8Do4OFbrFP77IWVrW4xKT+IBVaVI7lAHU4
	Ae2DBkvaLXdywmJz6EskgEOVtEwgEovp0jR2pInQ55FAytSeCCSHlj7Oe22TbtCY0LEjDF9rvkAoi
	BkVKhxad71QQMZAkVHfgKTBrVLqIuJfUYTxdcXslPUkivO6zjx7UFTsm6bMpBlRAUgMF8EEr8eAzu
	+RX5eOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37hm-00000001Wu2-03Gb;
	Mon, 29 Sep 2025 06:49:50 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37hi-00000001Wsf-4BMt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:49:48 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250929064943epoutp02305cfd10fa6b24bde229a56a77bbadce~priBGhQf51354213542epoutp02G
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:49:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250929064943epoutp02305cfd10fa6b24bde229a56a77bbadce~priBGhQf51354213542epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759128583;
	bh=bLrq4rO43N5uwgEaMfX6vfw6nUoLOsIdWCvpc8PcZRo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=s9zTNF2HX5rIaaQbixw8LehUVvbOFhMX/eOs5TYhqAkyhmPgMdQXhWfpH769F9/jv
	 GmF8pjXlbPk6HimMguVc3SWQkORLpGP6Ne21hvxWAsvnwxfjalxxebgKoyAtssFhyo
	 Z/VQyh+AhRTP2d5ywFehUSK09oA7+BwoLiFpNq/U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250929064942epcas5p48727b6a24c89d39677b71492610bca36~priAc5c6_2608926089epcas5p4f;
	Mon, 29 Sep 2025 06:49:42 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cZsHn2Y5qz3hhT3; Mon, 29 Sep
	2025 06:49:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250929064940epcas5p4994a9e89543d79138f088c625bde279f~prh_9qQS42152621526epcas5p45;
	Mon, 29 Sep 2025 06:49:40 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929064937epsmtip15805f4c40f724e23936b5f428a4dd475~prh7l4ooi1470114701epsmtip1p;
	Mon, 29 Sep 2025 06:49:36 +0000 (GMT)
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
In-Reply-To: <20250903073827.3015662-7-pritam.sutar@samsung.com>
Subject: RE: [PATCH v8 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Mon, 29 Sep 2025 12:19:35 +0530
Message-ID: <001801dc310d$3ad95610$b08c0230$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRMOVGdWg5oRjNsRBgEjzIeIB8IgHrJOKSAycFebe0FycygA==
Content-Language: en-us
X-CMS-MailID: 20250929064940epcas5p4994a9e89543d79138f088c625bde279f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072952epcas5p38eaa34521236ad10d963783137748069
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072952epcas5p38eaa34521236ad10d963783137748069@epcas5p3.samsung.com>
	<20250903073827.3015662-7-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_234947_339792_18BEC7C6 
X-CRM114-Status: GOOD (  10.61  )
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
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Wednesday, September 3, 2025 1:08 PM
> To: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com;
> pritam.sutar@samsung.com
> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: [PATCH v8 6/6] phy: exynos5-usbdrd: support SS combo phy for
> ExynosAutov920
> 
> Add required change in phy driver to support combo SS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



