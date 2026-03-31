Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111CDFF60EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=; b=KvH/LvnKB21X5t6rSoepTNbd41
	Ks0HjGQI09BpIaZTZe24VoQKXimoAHWtVBE+iDouTemA+uM5o/mn18nhkC+tEhQ8Kfhm3jbyZ7Ca2
	8SMeffWl9YmaBqH7d8PZFpL/ZXv7LOVKrww8pypLnVPxoMYm625RmC9wL1DRm0nS229a9H4KYxot1
	kl2py0AYffjBrAoNTP40KgwNBd4qSV9PFcg0R1c80rssBt+rEVZGx/ihGtRATdMZfuKW0n5QhbLJi
	fUdT2KpUnPbo1xg7/8GhXxQr2MYjVUL2y8BREaE+eF/n7jBTr9RenNaP0i7Z7ZTwtiotRep2CsGD1
	IsYQ+epw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V81-0000000CezP-0DQd;
	Tue, 31 Mar 2026 09:11:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7t-0000000CewI-07mk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 09:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=; b=a5NTMLceKR+LqjvOV/M8+X+cMa
	XMqx9tHXAg5zgkD7sCAtWKYMKZTpxG7axH4cYnKZYNheCKgaWktkByDN0loA8jfYSfL9IMGVO7gVE
	7MrlfD0HFRBXL3so0rbu/YV4iYiNoL1K/aOQbY4tDme9aJOoQQGju31yeCtw17nm15qjfGlH8l6bP
	0SOjKcz0KCxze/zREIgkjjtyKgvnluaR92/7PZ1uH0O2hcPjlHgCwijVjLSG8XuJAw4wsObV4giGR
	pXzHeLVvxWEHz3p+tZejrwI7b/7IUuvSgPFAN9i/bPshwJ3wVAQzw2xiAwQznpvbSh+nGmzhYCCyx
	fACz5U8Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7p-0000000FUrS-2nMu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:11:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OTog2465187
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=; b=ArdJqIV92hGo7LI0
	LTN5FUViCm4vMFyX6FFaItBR8KioeKWDAXYutrTQWLlDTyCFACtRoOGN9yV9qhr+
	hNvDcFAjhuYmY28J/oVXgyHtzjuR+4DGlYM9k/GNGdKjfUZDrChdgP9VpDrbXQcj
	P/BzX0/+xBPz77kLgLwkL7scg9uff7GaBCbuyiS7JkXPvUEnRKsxch75uXUsklup
	Qk70V/aSxYAT1CeCq+AhK66AV/Yv2yJ4qBmoyotw/OgmLB4//LofQhOrTbuuGRcJ
	pEznIYEUv5/i0YWiyVVbc0+5aSiOTD0O3pu9NyZzIh/vyb93BZGPHlZ4V2QYmyTS
	kdAX+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8f7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:11:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so140717571cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948263; x=1775553063; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=;
        b=ICTqkLNm2A9WN0bBr6hurON1zsBVyfuxyBs6QCHFx2hFG/Ama0JtnzM0kxRgI2UBtv
         ceyJMDiyxuuwj6HiAtqRxGiqUpFDDiHd+9PPUk66LpXI2HUmuws0rU6Bogz3bUnAea76
         QtST0DeT8SD6bGsES08RZhGSECkpU3hTxOaXB7LrW4Kd68i4T29ur8bnuwoEfitTUk6D
         SN0XVhZysftOHRkJrVa8U04HMCnj8yDEP10D4LRqUXSdwknWrDYoQDIaCnj9ZGnOkjMh
         5WDyCv0Ce8duI1pmO/9SIA5tclqJDdoj2BwvhjOWQsDiHOminK1sLOpMHDW7o5j2Ktwd
         hecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948263; x=1775553063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXjqGWF3Hgozf12YWvW46DTDXZ7wdXDVfruy2HqwAco=;
        b=NX3wNjzE4y+BmZh3jUY7Hw2ZWUh+QrEOoeXObsQto0t4dl38ZGBOxU82N6vS7nRlt9
         JdyeqgrULHdt/nwQB+PY/AZIdj3C0LKhRCFqzz4i2Lgw8eZmQeGEd60kM1pYffLHFa+8
         67sGM0l5EdVACE9Juqy+NPkn6MJEvQ9CsU0e8D9rV4sQirFN+7Aik+6AN+XpNbwBwa6X
         H6vaHym1pPf55XkCGlFXLLBaMuj0InJdWF7vlhFTZcauqCBl6Rr9EZDtSkf8V0vctF/t
         ha5LAW2106SwcErgo2j0MCNIwI5/xVrondqxNxD9cf1+dAeabF2jKQ8r4ZaeOfMMCbmO
         K1rg==
X-Forwarded-Encrypted: i=1; AJvYcCW9V2PZ6t0lzKIEQyhcKjtEEDcS/72cyBKzCg2XIE7lEoigK7cml4Gcq9UvQK3F90PlKrkzXVYLGGp4g/utL6bW@lists.infradead.org
X-Gm-Message-State: AOJu0YwrIY7aojS8eWa/smPJg6FcxAfEv8DFPJ1wZQLCxthVIp/ohX+8
	j+r95tDU3MZ5YSpp6TRTQ44S6JFhaboTWLZydGA9TFdQouwEWzOCzpa1AQ3Mv2qk9F5CYs9xzXl
	Ah73lpM3ZwTq/quodTCEoybJ3gwSStLQarbUuVawnim/9B0PgiheL5gnlT+FwYe9cTnPNmIifRC
	eVDg==
X-Gm-Gg: ATEYQzzTUFZZhrxkedw9jKMbaGisI/AMxDjxZ1FDylFLJpEEIP+LUQf8Bb2F3PbWkF1
	D1OsiU13Go42mQlOFfSoV7fmh4SFpERknzTOMMNdIb0NDGoegajj1MsbTFRimqtnTFSEbAyFxgN
	onDtUj0LGJbeKpsnBhTtkGnVjfxfu9vLD+TNxRzc8deJYvDjZIraEKnv+JfxHHYMlI02ZQG8Shu
	z52QxulQ6FYaZn1TrabcNtXeSVFiIP7zw1414l1eOvtG+G2lLFxelDi/s/DbAM440cpkcZ9RCZo
	r0mbc3Yqhh36uknfsZxCnUvsR0i69WOh75EHNhc1ecOtJBInKCOPz4dWdP7RveCTPgLya+QeYi/
	L/JVE+Ge9PHXfzOJzmvq4XUQvQH3z80pqoPz+c57Tr09TNhpN9BE=
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr213552961cf.17.1774948262595;
        Tue, 31 Mar 2026 02:11:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr213552511cf.17.1774948262145;
        Tue, 31 Mar 2026 02:11:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:11:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:10:48 +0200
Subject: [PATCH 2/3] ARM: pxa: pxa25x: attach software node to its target
 GPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-pxa-gpio-swnodes-v1-2-f66d86d10d8d@oss.qualcomm.com>
References: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
In-Reply-To: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MggrnFNmxk0naPdd55CShBS9dBhFo3e+IIWyy6ZAXM4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+eJTJaOJhYYKrmHTnj/FYRzIsrwxAGxdqjY
 eY5kKkIs52JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPngAKCRAFnS7L/zaE
 w9UDD/wKlPtR2jkgbEGcUwqu/4G3iPPsVKXDDiCZ3KOss5xfDFeB9PpZ0/5vLAjJweK9Z1T31OY
 5R+4kR/SF3+Cl/AVC7aBQpYmRz4Omq8gJyRGH7UY1sQdpsjMxbCXC0+PXcM1ca1WVKL9WC0t9ne
 HBf34n+WU8tuZrlCpePgEfIU09bsnlujsDuE9cSCQpVtU615mPHFspniw1H0RhO3wxnYQ3Q5FkT
 Dgq2/ZqXKyfjx+p/MqqxzU/mloaLI4gzrp0FrV3zjLeeqHTaHBOTRf7XhZ20hdhzpRkyGi520Lz
 kpYLlj7G7SW3tLtyMRokZV+aHaiXEX6r03Taev+6RVPJspXK4DSCIikiF1xybsaurIDjl+wEo3U
 90BiEjLhBJXF1nDG6Ae7MNTYzTjCajJmNundWM3wT4c48uXi2MppZy34fxa8TDEN3vQG+llDrhk
 GpsfuVK6RS0AVXa/cSlbOjIoZ2i0PPjktyBwkfZhBH9w984j3f8IsHo7rVg7nTiX5hFmVJBK/3N
 i4Ky8newNbSqlWpABmW+PyMXN/S+1JvGQh5EUhAH0fBBgBMD4G7tfE4AVGeoQPljt05k7V+ngaL
 XnKMXtpVt9Mmy14gMrMyQhVADjreH//RLuu7uvSZZqf+9e0XslOEHAeB4WmZ0TVjM4c6Btjm1mg
 zFEG3cL0YXVIX9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: v-obzDPLPcLaxwK8kRQ8GfBhI7Erg4nQ
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb8fa7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=quDaMypmeenIOiKoCAoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: v-obzDPLPcLaxwK8kRQ8GfBhI7Erg4nQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXzdXEY46ljunM
 axBQwXjCAZ+b/3HOyOKrSsIgJ0YyHfSmMAO+MGPoRJTPT6gqnZKYZIUFTX0BQEeHSKP2vskoNAO
 3YiqryHtz/mU7Ef+ZnKP8L54Q7xnphThaV46oIjXYSurGGYoqIPITX6f8w0TPMtiy6hjay7esck
 gHQ/U9UowhV3WRj4u4m055GbwQ5x03TKN9o5iw1A/VUJxNkRU0vTMz1tKf+APSI50L+1XifySFX
 oBNL9Ue27MextWYeZ4NEwMP9J7vWA7g5Zy4kUBUXhOUYeBIxMEb/uf7BdBod3DXQWtRU3HLJ68i
 e8+BnEZb8L5t1SiZL4ypt16P+6druaDuRlpNvxLU4hWoRqaV8/wKCVd3Kcbgog8Dm/9csgYKOtf
 /WEO1+K40hrwau7MJDI5tRI3XRyLSXYPNHzi3lQ2DAxA63iRAHipFiFIj/KFpNKU6eKWJ9JH1pt
 CpUCV5+h++eFdsiNFFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_101106_054991_735CFF21 
X-CRM114-Status: GOOD (  18.79  )
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

Software node describing the GPIO controller for the pxa25x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa25x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 70509a5998142ec6b9c484e5f094751eda6db6cd..6875774f2cae1db4798d18c813f445bdc31b15de 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -179,7 +179,6 @@ void __init pxa25x_map_io(void)
 }
 
 static struct platform_device *pxa25x_devices[] __initdata = {
-	&pxa25x_device_gpio,
 	&pxa25x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -240,6 +239,10 @@ static int __init pxa25x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa25x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));

-- 
2.47.3


