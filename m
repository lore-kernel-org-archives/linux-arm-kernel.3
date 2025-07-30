Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6476C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 04:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CB1G052Ym6eC+ql2GG5IxULt6yYskrTaLEPsGeUfdZQ=; b=iyNDeeAFSuF3q1pkoeGxsf2gwP
	9kAqFpanUI/H5qAMM0Cyf2QaFhSIdKQe2ISLyPEJapFBTKzq1XNtA9PfgB6y1zoQb/BsjB6VwZIDw
	s+mplEY4Vfmpjd4lqYx2EIEfhtkm8Ua5kzoDLRzrhy5TPvPogiV+vVsoLpLYMKyvRWXdHeS45MqTD
	/wfVHQlNYbyEI4aAZyU3FRRZbGHSjXE/tNMHYdBIQVIh85G39cjiMiBXnL2YuzUY0oPAQcK7U/+R8
	4k6tOFqix0ibQBPI1DVPGIYU5nj8k7DmklzfHJw5Le2SuJvxI2rLMDNUP7mieHyzFv70CIb6Xx6F4
	ruhlpL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugyH8-00000000fVh-3OjQ;
	Wed, 30 Jul 2025 04:18:46 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugyEc-00000000fLI-0fvV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 04:16:14 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250730041603epoutp02ef9387fbd0977f1752f549af3b3303fa~W7Fb0gQWY0796407964epoutp02z
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 04:16:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250730041603epoutp02ef9387fbd0977f1752f549af3b3303fa~W7Fb0gQWY0796407964epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753848963;
	bh=CB1G052Ym6eC+ql2GG5IxULt6yYskrTaLEPsGeUfdZQ=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=SgUje2inFBOJM4uRXoXdqaQixjOrV3JDJgeAIY6cFPCbUfSshQiFR/dTiuLH1gFc/
	 +sJahnJMOacwcfEAkTf9g3hrYo7XSy4YNz8cWS/GULZJv+9XfYe7Vw5UswchnvFIKO
	 +mfeHiBpKjdr2h5GNuLCNlX4+qPtwZ4YoSfBeWP4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250730041602epcas5p3ac10266bf1f1b19e4c88cffe35a51ba7~W7FbaiNeo0782007820epcas5p38;
	Wed, 30 Jul 2025 04:16:02 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bsJmd5B6hz6B9mL; Wed, 30 Jul
	2025 04:16:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250730041600epcas5p19ee4c430c3f6d28b0ec1b8f962c33e90~W7FZyXgwD1206112061epcas5p1S;
	Wed, 30 Jul 2025 04:16:00 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250730041559epsmtip14c7f776d90e03c6368495aa9d94b3b3b~W7FYYBde90047500475epsmtip1F;
	Wed, 30 Jul 2025 04:15:59 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-2-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Wed, 30 Jul 2025 09:45:58 +0530
Message-ID: <36d301dc0108$a8423670$f8c6a350$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygIGWJ0zAVVuF6axrVxZoA==
X-CMS-MailID: 20250730041600epcas5p19ee4c430c3f6d28b0ec1b8f962c33e90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe@epcas5p4.samsung.com>
	<20250710083434.1821671-2-dev.tailor@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_211611_477194_927BCD9A 
X-CRM114-Status: GOOD (  10.55  )
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
> From: Devang Tailor <dev.tailor@samsung.com>
> Sent: Thursday, July 10, 2025 2:05 PM
> To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; alexandre.belloni@bootlin.com;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> rtc@vger.kernel.org; faraz.ata@samsung.com
> Cc: Devang Tailor <dev.tailor@samsung.com>
> Subject: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
> exynosautov9
> 
> Add "samsung,exynosautov9-rtc" dedicated compatible for on-chip RTC
> found in ExynosAutov9 SoC.
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



