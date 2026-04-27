Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C709FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsbxN8Qz/wnXMZHP/0VohG1ZL4oE2/MEeGUw96S4+dk=; b=YN8uhjT577aajQc3IPm1KO/V6M
	b3yr37uMd8EBz+N4TAR6QEzU5Dvwi/dgPPlSqddKHH/HCmXvxDCxZ9Vky+kxijlF7a33KDD2PZP7q
	o4IXm/hFTxeqH+W5e1YHZTWuYezAXsnYRBeErMEx7u64/kT8FbPuwO9Ek5ffejCDBlm2eZJCFiT3B
	2pFvEnM98kHLTmM9uW5LBsS3HRzKupTlfyyTyfM3KFcUHkqlLrOr/4mi0Mdjk21A0p/LWo8RlbXtd
	Flf/poRrEt9YQbPEu0GKXM+H8EUmUTO5vcO4Xyj3Zcw4gymqeLqsrPUylttAutlXzehSTmYlFhhLa
	9w02pLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUT-0000000Giat-40u2;
	Mon, 27 Apr 2026 10:47:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUO-0000000GiZI-3USn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:46:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBa62793121
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsbxN8Qz/wnXMZHP/0VohG1ZL4oE2/MEeGUw96S4+dk=; b=n13IzVUyrBWjUim1
	8TcZfdLeoeKQQVrz38vDMMheKdB1uxd6Pnf/v0/u5xrGsCTJjgpQiWgb3eEtpT7u
	e/LnT7n83kCvDDwtgZr2e0c9dlBGErYZMHqvK/ybI2uZN/P3lNrN+gUAWPpBIgU4
	NQmYDfyGma83bXA+9Ec05a53DIKfY+IGpWeYS25Jt3dKk6Y/nzxSFB7bG7xptV5v
	5D0HkNJP0D4g+v9F7oePyYPlmiC8lFQYBBB8HyvonLv83COX4pQwQo7sM26db531
	PvSj0zoMj1a55DcmbuhDUVWExV1p9/4iSmK7TGDJ+zb1NluMv6AwzBYWNyGXU6hq
	3ZiGZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uut78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:46:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da31af14cso266691801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777286815; x=1777891615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsbxN8Qz/wnXMZHP/0VohG1ZL4oE2/MEeGUw96S4+dk=;
        b=NMDJXNgqsdgPn6x7PJ5KMxILqBTvvY0KZznzpAeVJuRpXUArSqFXlhfBDFSHw+nxgm
         nMRnqXgBx0nSwYeUACNxTw9bOFNAgJLweoayVmo8jfKAkdM/3h3HV1NvBPHSnrYdV9ZW
         IVhsn42wkcMLTm54G3PfNenDzyv7p1B7pPwbGRKJ8hpuvWc0r+PYpLkDwbBMkUlkd6od
         pd9McWUtCjw1iN1sP+RrEZTk5FoMbWjUU14P5H3SP/sbhzLkUwtYiOtkkMjnKNpmkSMh
         kxq0SkVjXqtUZ9vUJXVxtlYQH1xiXqXTUeLdYB2PfHJynJvHLrCkF3zcHhRCedQK4/AD
         gGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286815; x=1777891615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RsbxN8Qz/wnXMZHP/0VohG1ZL4oE2/MEeGUw96S4+dk=;
        b=SHznnsJwvyXZdUIbmX0otHiroOMymdzZ5f0O8m25zldXTqAvBdTeAYZHEyehuhzwM7
         qiXNUg0bJ3UM5mmnX2iX0qewTRzyak1/vrSDovOA155ilA2twlwVMArKQ+o23zjQud0u
         JOShnOuJuSAymZgRBLE53eQe1oPlYLnDN1qL3rHTtOrWQ2SgLQUhoaqJ/O7HJ3SOD0CI
         YzvFdATTUGrR8JEt1o8jDtDWaqIJgewA4K+Z7vHHfHBDOZ5AYXuDq6FSjY0k6oZCQor3
         yjDRLIU64Mvvo2D5BV4lNP4fHbcHR96DQdVE72UnYQLSAwkyTf7hHzxrBPkdw80HP/Tk
         k1wA==
X-Forwarded-Encrypted: i=1; AFNElJ/F5wEnbbhArYiXaDSwOLV5Zx1Jm6ah2iOzz5yDKoEOedYyuDFuLgY9teB2TkXVG5Kqhi5Ha8cOwzWve6sb6vs1@lists.infradead.org
X-Gm-Message-State: AOJu0YygeNBNTQ3aN7YXqZ8A1cwhXSLBProEWZCZgNH5JO0zJerWapKZ
	t54L2K95nlLV6pnYBISJQ8T0eeKjkKrpdRgMN9D6fFWbBnoXXTogVN8knHTrfaBsFUO8vwNEkDQ
	75qKTjMJfB06DbSgaB6P3nhXsaV/uW/XGzxRUnXS7lEAnAUtOaAA+uWKt+ocwIXkHBWqw8/HKWz
	P7vg==
X-Gm-Gg: AeBDieuVBGLsP1tMVgtywfVv+64MzfYUV1SFvjD1MKDqG+U3v5VAAg+lh0cSw06WLYn
	dzHcytxEEuZsjWHWbd28U81fDXQGE/IN3MtUcMN26VLUPmPfdC0cErAnuyL4LQs9Lptfl6CLJ9W
	ViqcRRu1ds3BlBiiyE5iBJg0O+iimaxbQAWliPg2vRsUVHrvjGwjOB5ZSlKCKHzxlyy0EeAZdxb
	YLE+kPTe279B+E++jhJV8uEXsW+WCPEDOTkbnlszusD23J+0TGZfKqt+M0mTNCadrAR22qC09dv
	/SccxnLnnoevr0MyW7f4NNi15R9S+bcion12CKtKPXoGmnLJC814i2P4eEBV4S8ncVeCtViCy6/
	ntIF5Ej8nqZXW3ibWMCDRKDa1OUtX83qEM9kFslPHxES0Om9taXeiAX5/DCRsPQ==
X-Received: by 2002:a05:622a:10e:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50e3681d042mr591454671cf.7.1777286815389;
        Mon, 27 Apr 2026 03:46:55 -0700 (PDT)
X-Received: by 2002:a05:622a:10e:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50e3681d042mr591454421cf.7.1777286814970;
        Mon, 27 Apr 2026 03:46:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm80353681f8f.13.2026.04.27.03.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:46:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:46:32 +0200
Subject: [PATCH v6 1/3] ARM: omap1: drop unused variable from
 omap16xx_gpio_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-nokia770-gpio-swnodes-v6-1-b693296c1985@oss.qualcomm.com>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/jdywlesUY0uBqaYDi3Ugol9q+X2MLKHVotp1NpTxY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7z6WM0zyqbh4rTFe9OeYaJ8UORQWZy1TpMzVa
 Fi0Grpi4emJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8+lgAKCRAFnS7L/zaE
 w1UuD/9uvinlbPHUtBcDETd4JBQI3tGcCaYm3dMANDM8oRPAx4ZgZRpNut+RMPa+oxZaFwDka3I
 brxWcXTUT3RjbQ0KTNxh4S6x8xNEOEkb0VKj7C70UzoP2RoWJvpwo27eex2M5pofd3hNSGQz1uq
 6FRf233WbY/AjCdPyA3JqEJILDUdvbiVDfJah/hddCsgmcDwtV3qHSSWIVfVajy8nXdR0rX2Ko+
 vzNiLh7BfTV0ysgr/9TjEEES8t5D36TI/Fqc3xhU8CAQ4JxpBwsirpui5JZVFTqYZnEbf0NFbqY
 1NSoKzPsHsS/dSo1cVe55n1AKjDHfgQ0SPavGRlR2VV/3UhINnXx1OSuRXOMOw/z/72LKK6tVPz
 3wgKMQXE1D5WHnkhI/5dUWa1oWrO+NE//q7YLCxpcr0vXVOx4rrYGikiCaxjDsSAu7XaWqjoPVc
 3Dko5ivSBAGNLKokNcJ6uy25dvKI/aKn9A6ihm6GqlbYLeSNhrDqdO9t21JnECFvs3A0xVXq7Qt
 VUaNnCV/lN4GzoNNFedQCEB5il1OeF+QbJFZh7fXUTEVpI2IrljJNcfG8SQ266oT9Vdg44I/mH8
 ctoNnn9h6Qey9aLjAbRvh5Qpg9ODbYJ73uXif6SGYFZfnNM0zi4Ciwis0VrL3hFGnMFTQ35CAIt
 x7mWdFJZKlwvJUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: EN7slgwis7hTCqJIw2dvW-jDksAHTCxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNCBTYWx0ZWRfX8Fry47nrQhUh
 FzRbxpz9WETsOKeqLBMJgAjKj7osD6m9Cq6HE1UBBLm4LxyY9fLzw2MK44c9PtfB1pf2typpp3f
 cYhzeJVZQbxRjibl+S6Utl2Yzzsy+DVh9zrRIgvh+VfqEGfDVNiUQ9wMfTgkMvGAjT06swb+igq
 Pkt20GzRUB+PxHFL7vtFmN67gwDIzRAuC0+CvB4GNb0XHVI8Oi9xM1UcKnuV+K1QSP0Owt1csNV
 5nmUVGMCzqoDxVGJJE+9ghrMAMrpQt5KIjSlUpTxUHjB/LHiYn0Lu9HfyVAmnFXKrhkAPxkPpKH
 MiwM4ZTZPXUUGWN8Cz+Je7Hi89pq7rdoO9BX9uCUjIb1x25LRIYGqiPsc8r568nG9EqumL4Rxgv
 e3s8ARDcPfHa/l62A+Ag2cv/gJg5V6TYZ5TjBp2wSgzqwMbUObOGxjvfeWTQb1gU+eo4KPB3e/7
 ZPVy0zkiGqPBlAD4oDA==
X-Proofpoint-ORIG-GUID: EN7slgwis7hTCqJIw2dvW-jDksAHTCxY
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef3ea0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JtOLnEVYxSPUHa-KuBYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_034656_945453_B6A012B2 
X-CRM114-Status: GOOD (  16.29  )
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

The pdata variable is set but not used. Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/gpio16xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4e73f20935473602ef6cb2f4f379c..e8dbe173bd33fae72c7c884f930a530f78096839 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -212,7 +212,6 @@ static int __init omap16xx_gpio_init(void)
 	void __iomem *base;
 	struct resource *res;
 	struct platform_device *pdev;
-	struct omap_gpio_platform_data *pdata;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -226,7 +225,6 @@ static int __init omap16xx_gpio_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
 		pdev = omap16xx_gpio_dev[i];
-		pdata = pdev->dev.platform_data;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 		if (unlikely(!res)) {

-- 
2.47.3


