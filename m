Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F35F3C241
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ki8nOv3ANbax1Y6/vTexXDa+QoJVJxEjtgFCiUIaSw=; b=4vClnfOsIosjhNDAxN/scWnXz7
	60DjOBixdsfmBaI08FrH1vfqDqmWLMFPVh+6/oslxGAHvFVhDVkV/rAtrsg+/vOtEjiQpzWh2T92d
	vCoTCfMIBtdqoejCRXnRKAvrVmO2dnA+qEwvp+w9Q4dRLOchbkgL6M/9QrI8apCJxgmaUR+1BuBhq
	94wOkLTt1PwY+sex7BWPEuO4qW7UnEy2uahn2q8KR4nLHXKoJyQt9y+uDolQDYneZ3n20hjRBqyHB
	J3DddgPWtTqgg1FDs77aIAed/7YSzMzH5uU0yx2o4U9TKULSmQiH2fki7Kree1rPg2cU63nXmCwmM
	f6cNUBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZwv-00000007KPr-15zG;
	Mon, 09 Mar 2026 12:43:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZwq-00000007KOY-3JKi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:43:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298E0d42661747
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 12:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ki8nOv3ANbax1Y6/vTexXDa+QoJVJxEjtgFCiUIaSw=; b=EooQVqgbfcPpySxv
	m2i6sOpnTEEQdx2jOro/AlgXy6C2bNrvGDod1I847LdocEyOefQ28R2S8pFwWQir
	uvoiC+I8m720WemF2vtR+X84LmydBk1k389NhinCxGLOF7Ty5LJV9mEZQvJ95oI3
	twqKL8qJe55gfuwRJIUvZPFryRZIKy1jhaE+tLnLk4rHZXuiQj8lozc3rsg3oDNF
	ryd0MeUzjSipNWyz88X7gV95S6Who7OtsBhC0d4M78A/WHL3d6TwgxVyaAbaA/Iu
	WKQvNL9OXnSaQTYEYYCBBH6feKUUoHqFWRjUjO3aFbS70wq1Z7hSmXImvxYZ+/69
	KQiAwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpnpyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:42:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd85e08fddso998814285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060179; x=1773664979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ki8nOv3ANbax1Y6/vTexXDa+QoJVJxEjtgFCiUIaSw=;
        b=b4FKOUKB/J0G4z8GawF6tYuMyVWnOxhqyclQcX77lInRIRuSwgVkPx5f7weCakMImI
         nfQ7U8t1SUP1yaWL6NblbZRdAQZ2Q6vItk0StlpQVNvEBsnpyqDFUXG/k3/GpiB/Ouc8
         MOzuKH0p6moNzS2FGYyjkG9WLnmY1SVBjca1tlhrLqM2/4nWEh4R/id0AN2eMVn6CMPU
         CzYLj0Z8+ADvA5Kb3XJja5yQqGpZa8Q2OziEGHBHeDhTCGkL2Jesv0AYCQ2HAmaFjdFj
         KjsRVIQziK+w+jBbwqivt3UZwrd/0dY77+GorQmaYVRdGP870Wu0fjKQ9SqJQcGpxB7g
         kTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060179; x=1773664979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ki8nOv3ANbax1Y6/vTexXDa+QoJVJxEjtgFCiUIaSw=;
        b=XBDTNxnnXR3yw27EkEdS2tN6Ii3jcQexB/WgxYZUCjkqbY6WzZfUoJuLmCF1pM7fqA
         8QEcmQihdKz8pt1giS4gP23MeBfedNq/ifKIoU07IiaDgf7w9iW1EJHWHQ+HF5Xt18Zn
         +zzBSlfsj4XLZQgJwwyHH8A7u/+Dw/De9se8kPa+k6Rmn+0FrRS2zLlZIJ7j72rbbygk
         iauDqI1PoWv2t/85rYbLP8F2lTOo8ULDN54Yobxj8pXOMhq1iIurNR+FAKVfKcJELFyM
         YATm26ePohJlIwgZraoZrRls2pQizw/H84naKOnexYQYzfjLumbbF4U3w2DhPWnWl4rT
         g8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUeDsmLknCP6b9gJmOwX4g8IovtsCUpcGrN8KdQlK3ipfR6jf431pGsu6evFwgu7/+FHj1uM6R/aevXvqZ1BIh7@lists.infradead.org
X-Gm-Message-State: AOJu0YyKX6H5qInCZayXBd3cCS8GDdOcOnZKTX0r6TDL5qMGCBivJltI
	hGEeU7wsqxws5ge7t8SoyvHWC0kX64ztX/ofeCj5z1Y9Vcmw5H6LrPAneLn/cPa6BXfgs4I17DR
	NI2ox0AJbWptEv+Cgu9TqNU3skdiWoblFpXM5za4NyOlb2g/OUHP9cd4gTiPY9mNxVlyqnpZO/n
	bBbg==
X-Gm-Gg: ATEYQzwIFxzNkzGui5DholASzMlMEGXX0gBfE1UMj2nEGgOznKR13ovCtMqWwysMkMX
	EoFl1TaniO9lfxa7c8Z51223osLIo1FweU8xSAYGMzQxeZAV9NyvRW496vSfHrxM2LjGtVnCr31
	BHYqDjw3yrNf9LPJpyR58EAG8Cjj/xnmM0vAqdqWKH0PzfyCnEi7LP85V39reCvJ0dYoFaq63I4
	fw9QUmDL2XDbwMRgsRN5kOjO9OEr1vudTxv0BaJXaUu6bCp2d1nkYsYlF0xx9mEIb6wlwtrgCS8
	IR6MUmyj92mXXm6XPBzmiLdcmCzPJAEcyrVgRZPtnuVdUl5jXWRmlNRW6vR5MW6XbLLYNb8goxs
	V7063sxx7K/WTuIS0Tj6yarUxl0+x9Go6ifDEss8vMI8jPxyBYV8N
X-Received: by 2002:a05:620a:4688:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cd6d4eb0b2mr1430386385a.65.1773060179277;
        Mon, 09 Mar 2026 05:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4688:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cd6d4eb0b2mr1430382285a.65.1773060178835;
        Mon, 09 Mar 2026 05:42:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:494a:62d9:d95b:cb98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm107803345e9.8.2026.03.09.05.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:42:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 13:42:37 +0100
Subject: [PATCH v2 1/6] gpio: of: clear OF_POPULATED on hog nodes in remove
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-gpio-hog-fwnode-v2-1-4e61f3dbf06a@oss.qualcomm.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
In-Reply-To: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pDUWjkvolt9aVkc3THlY+/toYWrYnAZq17Xs7p08jFI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBprsBHLgjRTayL4zBT+0z81rGSe5BLprPXLVoTZ
 c0qyL+zRzOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaa7ARwAKCRAFnS7L/zaE
 w96MD/wIM8Ae5r7/4bUltHDXNPzgPX7vyGNhGbK6AaMf07BOU/jE0U5P9hc/NHek5F2elC2U8iM
 QmDj7wCBLAWMTYRi6Yuq8y3pviPQeJRFJ0Ln20uOsJyWjxGO3Nn5VFPVqxkXy/oKLum3KbtN459
 IVkRFAWynXtLJ6PM2XqnIkfyAewfvCCzICzeDYCcctbLpFU0JO+VsgBM7umdeklPD4X5h39WoEh
 D0zV+aZXhFDBEWZocpWFvovm3yDhnYFCLCIUkN5ICKQAlcRzP7+k4m3AEcWnaj3qnitspwbiqJr
 S9zTMKuo6K8KhXi3yjaxOmvpbSp8FoOLDRGAXrbdXrbosn2u+gqOu4nMvWeLlQy/ybuTAgS/UHC
 5v+y0RCNhSQXMEYR2fErUgNjiF2w/nVEeEZHDh7sOS47NboWLM/hHJ7L+8788JQUr4UQRy4gVd9
 qWG75cRoqYWZD1fwDRCoMIR/NOeW80SJPctYaKqwOCEmym0AAqQ3Zd+lRYmJaOZ3vlr92UZYhXU
 pUDp7cD89aYD6C1vZAJmWaemI/pmDIQ805+5Th0Iqg/W98EFIHrPfgDtuEkJKVzf8cIBrh0tC9F
 jDIisj7PVHz5AR+GOXTfEKu1wBjhg9pprHOfMGhMwSqZsrqXQYIkANiX4K/LNe5ICSbxMutEcut
 EGXzIu8rNHKjW8g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX//q/Igu3ZE8J
 NHdh3a6j7SkU8JKNDoNh4JGaekcA6h3t90ve0GUHaKLbVkrEdQ+BaVHW2iFYbnsQFav7yXnx08T
 o7rnwgg9clCI9a9uJgBeIaWrNAK7drjibSyj/GX11C9TcCBZ1IRBC8DECIeSQNtLrIWtZfMGdM/
 hDdXaHLplodiJJvh1kHrr+b5pxzNluSy/wRKLPG3bqfkTl5kis3E8Yk3HtyHI0iQTP+Yt9VyhBR
 KJsOXrCmWywIeQGSvVURblnD1gK/+xpnoPpN49c2XvL+0MV+KqHzhV6cioRZdIxmjl4MThrCSLR
 3OjAIW66NB5Kw3APJY9uTwjKHvd/g99BbFKF09ZxMx06GYW6h7chGYTxyIAt6akffbUTh4z3dym
 3YemIH4QnCNcfcxlPm6IRILNd+6JcVJn+zGA+D0myUvSjdy0nvzcSK2QyMCIKf2p2fpCH1XO75v
 RkuWJbpf7vGwiZi1/+A==
X-Proofpoint-ORIG-GUID: J7eR5J52BEzvC3GySscNJVTP81XZ4tml
X-Proofpoint-GUID: J7eR5J52BEzvC3GySscNJVTP81XZ4tml
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aec053 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=wIkqWORfvUmHQsOhi0cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_054300_952262_6FB95F75 
X-CRM114-Status: GOOD (  15.23  )
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

The previously set OF_POPULATED flag should be cleared on the hog nodes
when removing the chip.

Cc: stable@vger.kernel.org
Fixes: 63636d956c455 ("gpio: of: Add DT overlay support for GPIO hogs")
Acked-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-of.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b78f09e768cc740e893632b8817505..08b7b662512b825086cd70440be98b59befc3ffe 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1210,7 +1210,14 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 void of_gpiochip_remove(struct gpio_chip *chip)
 {
-	of_node_put(dev_of_node(&chip->gpiodev->dev));
+	struct device_node *np = dev_of_node(&chip->gpiodev->dev);
+
+	for_each_child_of_node_scoped(np, child) {
+		if (of_property_present(child, "gpio-hog"))
+			of_node_clear_flag(child, OF_POPULATED);
+	}
+
+	of_node_put(np);
 }
 
 bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)

-- 
2.47.3


