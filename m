Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7837FD65C43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc8F4P3UwgpqXgjYXPX9FB7Ly58IjY618ESDQQ8MpP8=; b=kBIMHoYQON6rdiReyjOuIKmmr8
	Ga5SB9mhnXm/i/3sZcV0KyxIMQijlYv/nOVOiPh0GYnt28JwCA+Vd8PQ6/GU0vClJUjFsAmOZbTLW
	F1k+P74p7LEVyYDhwJAjkSA7PwME9Vj2l8fT1tqdAay25TQbMf/z2ZREYL+HfKBKciNVUmV92DX8W
	e5IrDAyumHLooOfdG065Bt3QFjv5lH9nbDdirTj8uDcCOoIspuxyElFDY7qv5wz07eLegG1CCpxg0
	uwXfPzAq+y35qk2uk8abGcuaq3/NGXSSE+N2VkPnwjbFPS0AlmdUY2jmgtn6elTO3Za7eKYzDRq1d
	BGhEvn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqva-00000006oDV-3FZW;
	Wed, 17 Dec 2025 12:46:50 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqvX-00000006oDA-3Dx0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:46:49 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251217124640epoutp01373d16d14d61670f8e1a6eeabdf7a073~CAXPHNx5i2105421054epoutp01T
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 12:46:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251217124640epoutp01373d16d14d61670f8e1a6eeabdf7a073~CAXPHNx5i2105421054epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765975600;
	bh=Tc8F4P3UwgpqXgjYXPX9FB7Ly58IjY618ESDQQ8MpP8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jvdB1Wz/5cArVBXW08MfqqkvUbuyM4oK7mXYjZcjc/W+vUdh8vEWroesFUrFNqcxu
	 dJOWf7hFpGrzMrFX3j9jpOi5xVcxLYAo75+5dlJBzj19ldXsoL39P7OPUZ6EhHi0Cr
	 1OaWR27nyrZjWbayoPeKOP7yeS3wpD0EFsUKZVJ4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251217124640epcas5p2f2733d2c0f8e9b6a15045e6abad62b6b~CAXOiJo191898218982epcas5p23;
	Wed, 17 Dec 2025 12:46:40 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dWYTC2XrPz2SSKX; Wed, 17 Dec
	2025 12:46:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217124638epcas5p4faa585d6d891780a0d685b374440d44b~CAXNMxoIo2400224002epcas5p4q;
	Wed, 17 Dec 2025 12:46:38 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217124633epsmtip261ad2e48af313c7dcfd4da5022b5cbc2~CAXIxNvpk1684916849epsmtip2F;
	Wed, 17 Dec 2025 12:46:33 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20251119114744.1914416-3-raghav.s@samsung.com>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov920: add clock support
Date: Wed, 17 Dec 2025 18:16:29 +0530
Message-ID: <139a01dc6f53$2f861f80$8e925e80$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7EhboaEaVd13SrnoN6ZCnkjrAPAC2bvr2AlNHdSq00DPcIA==
Content-Language: en-us
X-CMS-MailID: 20251217124638epcas5p4faa585d6d891780a0d685b374440d44b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56@epcas5p1.samsung.com>
	<20251119114744.1914416-3-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_044648_124589_E71773C5 
X-CRM114-Status: GOOD (  13.14  )
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

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Wednesday, November 19, 2025 5:18 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com;
> dev.tailor@samsung.com; karthik.sun@samsung.com; Raghav Sharma
> <raghav.s@samsung.com>
> Subject: [PATCH 2/3] clk: samsung: exynosautov920: add clock support
> 
> Add support for CMU_MFD which provides clocks to MFD block, and register
> the required compatible and cmu_info for the same.
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



