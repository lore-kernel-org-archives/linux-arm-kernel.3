Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C2AD6406D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MLdaOBVFsd/izW/TfLsuG1WooZaOmcXkxRbIL5DuhU=; b=zDnD59dZTakM05rn+MpgI7PmLA
	6xO0x5q6kCvE4F+iIxUxEwx9Ttk2piLQIniCiPJTiFsnu2M23Ti/msOPy7ZOy0FX1KU7EEYLd7/gw
	iIkp610i1E4FZNWg+xJgHszSUJp5Qfz90zhbGMtia12JNhACqwRqPX5nJKuD0sEhLtSulLiBNS2an
	XsJiXEPIMXx8WIlpR0tqTp6aVo4deKVu3RGyiepNBmJoOejFmTO7dZEgFYPYCeMPKD8qEAa82Zu2T
	pf99rm/r4GYl45MkOlkF5p+t6IYPXzFxbY7W3KF/RK1QtklFFKBDVQhtf7k5B5Sh2e2eeUW0YhsU5
	i6eXMXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj9Q-000000069qy-1HNv;
	Wed, 17 Dec 2025 04:28:36 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj9J-000000069pw-1Zta
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:28:34 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251217042818epoutp02a8dc312a8944877af557f7fc5631df2a~B5kGGZBC_1361013610epoutp02p
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 04:28:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251217042818epoutp02a8dc312a8944877af557f7fc5631df2a~B5kGGZBC_1361013610epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765945698;
	bh=/MLdaOBVFsd/izW/TfLsuG1WooZaOmcXkxRbIL5DuhU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oNZkn66d2du3qczkRk5avXr6T2yY4+VNv1oidNdrPcgup1tnBmYmFwusmIifqmP02
	 +Pma9uQ+9T0iBeGFbYgzM71UpfY1eqEO7+1xRJob3ZkO0wdNdIms0EQOz6v5P7n7D+
	 4EO7k5vWtLE0hwOXIPArI10EWr7ka4e4wDw6fsjs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217042817epcas5p4d5b2133483b819fec15422a08f151ccb~B5kFYj5AG0716707167epcas5p4V;
	Wed, 17 Dec 2025 04:28:17 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dWLQ81B5Kz6B9m7; Wed, 17 Dec
	2025 04:28:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217042815epcas5p422dc94c78156fe4dd27a55bf5a3d77e2~B5kD0_GeO0716707167epcas5p4T;
	Wed, 17 Dec 2025 04:28:15 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217042811epsmtip2748351ac61ebf74c6fb34be3fb116b2a~B5j-nm8bu0203802038epsmtip2P;
	Wed, 17 Dec 2025 04:28:10 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-2-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 1/5] pinctrl: samsung: Consolidate pin-bank macros
 under EXYNOS9_* and pass bank_type explicitly
Date: Wed, 17 Dec 2025 09:58:08 +0530
Message-ID: <12a301dc6f0d$8fea7ec0$afbf7c40$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQDpeEtOAnYPzUS105ikcA==
Content-Language: en-us
X-CMS-MailID: 20251217042815epcas5p422dc94c78156fe4dd27a55bf5a3d77e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093026epcas2p28ddfd32305695df996841fd73b231b6b
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093026epcas2p28ddfd32305695df996841fd73b231b6b@epcas2p2.samsung.com>
	<20251202093613.852109-2-youngmin.nam@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_202831_651933_0E5C1E0C 
X-CRM114-Status: GOOD (  13.85  )
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

Hello Youngmin,

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
> Subject: [PATCH v3 1/5] pinctrl: samsung: Consolidate pin-bank macros under
> EXYNOS9_* and pass bank_type explicitly
> 
> Modern Exynos platforms have several near-duplicate pin-bank macro
> families (EXYNOS850_*, EXYNOS8895_*, EXYNOS7870_*), which makes
> tables verbose and harder to share across SoCs that differ only by
> bank_type (alive/off) layout.
> 
> This patch unifies them into one EXYNOS9_* macro family and makes the
> bank_type an explicit argument. The common 850-era bank types are also
> renamed to 'exynos9_bank_type_{alive,off}' to reflect their reuse on
> later Exynos 9xxx-generation parts.
> 
> Naming rationale:
> - Use of the EXYNOS9_* prefix indicates that these macros target
>   current Exynos generations sharing the same register layout and
>   EINT wiring model. Compared to SoC-specific prefixes
>   (EXYNOS850_*, EXYNOS8895_*),
>   EXYNOS9_* is clearer and more future-proof for modern parts.
> 
> Key changes:
> - Introduce:
>   - 'EXYNOS9_PIN_BANK_EINTN(bank_type, pins, reg, id)'
>   - 'EXYNOS9_PIN_BANK_EINTG(bank_type, pins, reg, id, offs)'
>   - 'EXYNOS9_PIN_BANK_EINTW(bank_type, pins, reg, id, offs)'
> - Rename:
>   - 'exynos850_bank_type_alive'-> 'exynos9_bank_type_alive'
>   - 'exynos850_bank_type_off'  -> 'exynos9_bank_type_off'
> - Convert pin-bank tables for:
>   - Exynos2200, 7870, 7885, 850, 990, 9810, 8890, 8895,
>     AutoV9, AutoV920, FSD
> - Update GS101/EXYNOSV920 helpers to reference 'exynos9_bank_type_*'
>   instead of the old exynos850 names.
> - Standardize on EXYNOS9_* macros while keeping SoC-specific
>   '*_bank_type_*' when layouts differ (e.g., 7870/8895).
> 
> No functional change intended.
> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
Thanks for consolidating this.
Feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Also tested on SADK based on Exynosautov920, GPIO EINT works fine. 

Tested-by: Alim Akhtar <alim.akhtar@samsung.com>



