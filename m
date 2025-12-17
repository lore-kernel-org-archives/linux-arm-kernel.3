Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA775D64072
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2JiDYg/fKnOFAo+S9SfpGr9ZWUTUAMaugsKPX8yXzo=; b=C2RJprBXgdnhEpIT+HdAeKjX6B
	usTU5s4ryp2cgMLzKtjj+zDJY1dS1JYZzvlK0MlC75Lnyz2252wNnL55qWR0cgSxQYbjd3uctY2/+
	r9ZCDHmTbUH4vWmTc/VC5ganHeixdjr79XGXiPmuEQVatTFZmJLimN+yAtb77I7aOCIk6P0Qk8DCH
	/aFvNgYK+SNdiVh7ZJgF3e+D15NB8MMiCerg8HzAnw4mclsnZvo9iRXEpPCtS38obcKhaCAE0cLrA
	Acua76IDq4fnaFq72aporFiGo1vwsbOiwVzKywCczQ0fOMQE+TrHYOnZ7Yo93KvnofEOmpnjPar9J
	SihidwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjQm-00000006AT3-2q0j;
	Wed, 17 Dec 2025 04:46:32 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjQj-00000006AST-2nKQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:46:31 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251217044626epoutp042990f7305b5650e7ce14d9b1bef37a84~B5z7uEFTx0884908849epoutp04L
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 04:46:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251217044626epoutp042990f7305b5650e7ce14d9b1bef37a84~B5z7uEFTx0884908849epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765946786;
	bh=F2JiDYg/fKnOFAo+S9SfpGr9ZWUTUAMaugsKPX8yXzo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BK4bpc5jD7cb14hY6vi6fzOCCxTocxtAXAm3U6K6UZV/saIuqnbzgYICzBJUK/pY0
	 XqFKVXMX6zQYjo6tYmjxjce6EsFsBmng65sEp2ivcJ8BVm2o/WMYpMsyd5GvXc5znd
	 FfIRnTTVqxpLeU/yR4786j4w8cDzVTJro8CVmrnE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217044625epcas5p4e2c71527719a25c7376517ea5b03e893~B5z7N9BB80334503345epcas5p4H;
	Wed, 17 Dec 2025 04:46:25 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dWLq453bMz2SSKZ; Wed, 17 Dec
	2025 04:46:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251217044624epcas5p2cec2c5dd5d25f253367b50767de8abac~B5z5j4oFz1778917789epcas5p2C;
	Wed, 17 Dec 2025 04:46:24 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217044621epsmtip2010fa4cce471f309c52c14fcfbf62615~B5z3f8bZK1417614176epsmtip2L;
	Wed, 17 Dec 2025 04:46:21 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-4-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 3/5] pinctrl: samsung: add per-bank FLTCON offset to
 EXYNOS9_PIN_BANK_* and fix tables
Date: Wed, 17 Dec 2025 10:16:19 +0530
Message-ID: <12a601dc6f10$18b46e30$4a1d4a90$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQJFQ5zzAUFeOde10mSJ8A==
Content-Language: en-us
X-CMS-MailID: 20251217044624epcas5p2cec2c5dd5d25f253367b50767de8abac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093028epcas2p456b6a2bfebfc76384f706a9962266fcf
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093028epcas2p456b6a2bfebfc76384f706a9962266fcf@epcas2p4.samsung.com>
	<20251202093613.852109-4-youngmin.nam@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_204630_046023_D1362BBA 
X-CRM114-Status: GOOD (  13.34  )
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

Hi Youngmin

> -----Original Message-----
> From: Youngmin Nam <youngmin.nam@samsung.com>
> Sent: Tuesday, December 2, 2025 3:06 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; alim.akhtar@samsung.com;
> linus.walleij@linaro.org; peter.griffin@linaro.org;
> semen.protsenko@linaro.org; ivo.ivanov.ivanov1@gmail.com
> Cc: ryu.real@samsung.com; d7271.choe@samsung.com;
> shin.son@samsung.com; jaewon02.kim@samsung.com; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Youngmin Nam
> <youngmin.nam@samsung.com>
> Subject: [PATCH v3 3/5] pinctrl: samsung: add per-bank FLTCON offset to
> EXYNOS9_PIN_BANK_* and fix tables
> 
> Several Exynos9-era pin-bank tables were implicitly assuming that the
> filter control (FLTCON) registers are laid out contiguously from the
> EINT base offset. Per the TRMs this is not always true. FLTCON can live
> at a separate per-bank offset, and the current tables cause the driver
> to program the wrong FLTCON addresses for some banks.
> 
> - Extends EXYNOS9_PIN_BANK_EINTG()/EINTW() to take an explicit
>   .eint_fltcon_offset parameter.
> - Updates pin-bank tables with the correct FLTCON offsets for:
>   Exynos2200 (ALIVE/CMGP/HSI1/UFS/HSI1UFS/PERIC0/1/2/VTS),
>   Exynos7870 (ALIVE/DISPAUD/ESE/FSYS/MIF/NFC/TOP/TOUCH),
>   Exynos7885 (ALIVE/DISPAUD/FSYS/TOP),
>   Exynos850  (ALIVE/CMGP/AUD/HSI/CORE/PERI),
>   Exynos990  (ALIVE/CMGP/HSI1/HSI2/PERIC0/1/VTS),
>   Exynos9810 (ALIVE/AUD/CHUB/CMGP/FSYS0/FSYS1/PERIC0/1/VTS),
>   ExynosAuto v9 (ALIVE/AUD/FSYS0/1/2/PERIC0/1),
>   Exynos8890 (ALIVE/AUD/CCORE/ESE/FP/FSYS0/1/NFC/PERIC0/1/TOUCH),
>   Exynos8895 (ALIVE/ABOX/VTS/FSYS0/1/BUSC/PERIC0/1),
>   and FSD (FSYS/PERIC).
> 
> Notes:
> - GS101 already programs per-bank filter control registers. This change
>   aligns the Exynos9 path with that model.
> - Banks without filters (EINTN) are unaffected.
> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Tested this series on Exynosautov920 sadk

Tested-by: Alim Akhtar <alim.akhtar@samsung.com>



