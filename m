Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE5ACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 03:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8Edn55nxOCIaa5niYXYX/DJyG/lkCcCzwegzlb6vR0=; b=RgaHl6DkwZ6963WLO4DDnCa3oZ
	7p3O4euFGPHUrVYH2NmLiaym0IXE7ffjoSKjmxdgy262ka5o1yWUR9arMcooH5WlhVVutCpx6w6Vf
	+NdmOGOBuHwamLHSMAWpTGhwZcfvQULluCVR16RcA2zJu6DBHOo6mfpJHU1eggAh/Wih3DA47hSZh
	umXc+3Wlo3NWoOa5kK7q4UhZi6ejEByH2WL1ciw6phSWR5qREtv1xNkUjhV5AugjEfu0MQQXU1nN7
	QQxTaL9sjzhTJT9WGY5CxlbiunXeZa3fOmhrSQ24KmoZvTOzX7TYt2WoxRMS1K6NoIZR3WM+OH64i
	JrTFl0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5mA-0000000GBDX-2cQd;
	Thu, 18 Sep 2025 03:57:42 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5m7-0000000GBD8-2D2I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 03:57:40 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918035736epoutp01f75c9eea52041b8f005d670094ee4f26~mRFma9xsH1576215762epoutp01g
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:57:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918035736epoutp01f75c9eea52041b8f005d670094ee4f26~mRFma9xsH1576215762epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758167856;
	bh=i8Edn55nxOCIaa5niYXYX/DJyG/lkCcCzwegzlb6vR0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vIM4io042qiS1VxZYJO5P8rIaKDn9L5RLy9ABqzW7hFt+YhAOUgdzhnvzYOWoy20t
	 d8pC2Nbdu3paBi9jfAeBDi+q+58VL82WhxFvXH/CZPHuYimZ2JL8Cd9lSqvmZky8tS
	 LrvBiDJdtgKcpKy9yKFwZI0kWYHse4Ve/9Ll5gYQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250918035735epcas5p359effac4573f80c385f34c8c8af7d744~mRFmKc6vW1282212822epcas5p3T;
	Thu, 18 Sep 2025 03:57:35 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS20G6L6wz2SSKh; Thu, 18 Sep
	2025 03:57:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250918035734epcas5p21939d1d9ee21776be24f0b4c2ad16706~mRFkwGRrd1421714217epcas5p2h;
	Thu, 18 Sep 2025 03:57:34 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918035729epsmtip1295610fe0f8feed24b94091dfc046bf7~mRFgXzEB50435304353epsmtip1Y;
	Thu, 18 Sep 2025 03:57:29 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-5-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_CNT
Date: Thu, 18 Sep 2025 09:27:24 +0530
Message-ID: <06c601dc2850$5d468670$17d39350$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgJ1QaGFAgkrzD2x7QmjoA==
Content-Language: en-us
X-CMS-MailID: 20250918035734epcas5p21939d1d9ee21776be24f0b4c2ad16706
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836@epcas2p4.samsung.com>
	<20250818021826.623830-5-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_205739_727357_5C5817A6 
X-CRM114-Status: GOOD (  11.52  )
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

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, August 18, 2025 7:48 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net; semen.protsenko=40linaro.org;
> dongil01.park=40samsung.com; khwan.seo=40samsung.com
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kern=
el.org;
> linux-watchdog=40vger.kernel.org; linux-kernel=40vger.kernel.org; Sangwoo=
k Shin
> <sw617.shin=40samsung.com>
> Subject: =5BPATCH v6 4/5=5D watchdog: s3c2410_wdt: exynosautov920: Enable
> QUIRK_HAS_32BIT_CNT
>=20
> Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit
> WTCNT.
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


