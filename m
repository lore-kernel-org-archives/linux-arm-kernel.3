Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC2EC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCKDTqb+uAHktuv4ggRzrPoN/1B3zoVL46D/W98jRPs=; b=sb69GjM+yV6DDrH32iHDqyI86b
	EoQof5QyWWwkmhacOlKztELwEQ2G2YLqVg3BBzFgSlLoJW/AQTg2vb0gkGyT/jH7R5mW8ftNmSk6M
	uWgD50lzsv3gVzqv2NRslKPL3e4pSmQyrTKTK3gaQfG6zl+GN7FX1LGD29FoR5FoCcD+Rc/1jicWp
	G+6CyIMUzngudZUB68poRErStpzpJSrcLXD2is4+Ds9zbf4hqDPGh/9ygmAcmOhmwqXenvislXmge
	XlDTVTf04dgRO3GeC+zl4y9IMRCAREWFew1yAB/hgurT7COwO1dXJcTQKfDQJ11S1GvxyF2dfX0Hn
	yVt9j+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXdm-00000003e1l-0l4M;
	Mon, 09 Jun 2025 08:13:58 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXbc-00000003dq5-2SFc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 08:11:46 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250609081138epoutp01d6dbf4aa09c45a3566b36687bc5d1ca9~HUZkYGlGE2094220942epoutp01v
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Jun 2025 08:11:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250609081138epoutp01d6dbf4aa09c45a3566b36687bc5d1ca9~HUZkYGlGE2094220942epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749456698;
	bh=cCKDTqb+uAHktuv4ggRzrPoN/1B3zoVL46D/W98jRPs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=V+hMvXortCjz7/ycaM+ANIn3tvVjKG5syDeDrRzVdJpMospVaW3o2WZueE8JXJ7sq
	 f6mPhixwNFzfwKMmu85rw/xAHYp8OUVPOFFk5Hvb40QdRTLjdwC7BGsMBqHEf1Ptwm
	 KiPvilaSl+xr1PqF90uyQj7F/oBj++PulZ4u3iLU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250609081137epcas5p158d45542b2752659b3c1c338c9cf0ed7~HUZj61i0M2901329013epcas5p1g;
	Mon,  9 Jun 2025 08:11:37 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bG4Pz5pMSz2SSKj; Mon,  9 Jun
	2025 08:11:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250609081134epcas5p1c89e67af7350711fac95686a82981f74~HUZhNrfn72723027230epcas5p1g;
	Mon,  9 Jun 2025 08:11:34 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250609081132epsmtip18db79fbd3b3f0d3e4080c9fdb9642fec~HUZezQJp_1346413464epsmtip1L;
	Mon,  9 Jun 2025 08:11:32 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <richardcochran@gmail.com>,
	<sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<chandan.vn@samsung.com>, <karthik.sun@samsung.com>,
	<dev.tailor@samsung.com>
In-Reply-To: <20250529112640.1646740-4-raghav.s@samsung.com>
Subject: RE: [PATCH v3 3/4] clk: samsung: exynosautov920: add block hsi2
 clock support
Date: Mon, 9 Jun 2025 13:41:30 +0530
Message-ID: <043f01dbd916$1d8decf0$58a9c6d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRyuXPQglR2pg1tLiplohNF2WAzQKeHRX1Aq1ypKGzZDlhYA==
Content-Language: en-us
X-CMS-MailID: 20250609081134epcas5p1c89e67af7350711fac95686a82981f74
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111715epcas5p19a63894e2556d2c8005845e01f67c783
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111715epcas5p19a63894e2556d2c8005845e01f67c783@epcas5p1.samsung.com>
	<20250529112640.1646740-4-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_011144_941497_CBDEEA60 
X-CRM114-Status: GOOD (  12.71  )
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

HI Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Thursday, May 29, 2025 4:57 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> sunyeal.hong@samsung.com; shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; netdev@vger.kernel.org;
> chandan.vn@samsung.com; karthik.sun@samsung.com;
> dev.tailor@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v3 3/4] clk: samsung: exynosautov920: add block hsi2 clock
> support
> 
> Register compatible and cmu_info data to support clocks.
> CMU_HSI2, this provides clocks for HSI2 block
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


