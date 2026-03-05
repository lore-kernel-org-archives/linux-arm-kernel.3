Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75678F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzRzywPx0O0mlAF6vGhDfHihQLjnBGrCLr3m/uQi+Mg=; b=xnuSLVSSyLY0dlknEyFGXIlrUu
	KruHU8z1m7C+UUuILK7cOa4hNKYqqTt5Oh6kW+sAWPw0yNsjYCjayrtTzA+9KATEiu+5SiWm6p/0q
	CIfTpAMnnNwJbtsuwomlyAShxTGkqzCW6wllJs5lQhbQIv8AArN25XsNpwLWt7rJOo3jMQZqSF6qV
	Yu8yc0755KFNw/5tAKgArwAkdqwipJiQy5oc03pNEcG3ZLIl1oOrXrdkUOzt7iJKvglM2Edr/Z9U8
	s0TDnAfqlu5/kq6RDwmFafA5QgCrbbU5Z9D7AAaPgzOCxKsYBtI59KA//uyDo1hNjekQue/IHAErG
	s3r3eJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5NA-00000001SZU-0FD3;
	Thu, 05 Mar 2026 09:52:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5N7-00000001SXK-2uV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:51:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254taAT218456
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzRzywPx0O0mlAF6vGhDfHihQLjnBGrCLr3m/uQi+Mg=; b=LfLV3pQvclLyN8oO
	WGlEmqiZs4p5Tcg/XKjCFQZf7kaW4HFV3UqOlpEU9/saeKlugDqgksH/oGlDX6dE
	C9P7zN1h7dftsFPBdhDGSPa3AMk+8TXQgIokjjy37xaGhMps46QfCjRTFE+ptke5
	e3Cnb1gAsd+mXCg6Fn2ce23cnzrUbu1yOfue51hnOGdwFM5E9Q1VeHUy4VXODF/K
	G+PH1ie3w9DEuPEdbsGfwwNhxoCjv04Ju9t1WuVUYV5Zqw267+NeTxCto43Od1Mv
	yshpZ/YMTezNyfisZ3uCiuckuuZfaGa+mIaohtOPYF6pqz8bLM+ancwRlo5B0kkF
	aFF16g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380rymf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:51:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so4560589685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704315; x=1773309115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzRzywPx0O0mlAF6vGhDfHihQLjnBGrCLr3m/uQi+Mg=;
        b=krqkGTKGT4hq1Iz3Qx7K4iyt6nymatUSr9F/0cmWC+hPUA2+d771W7+KWBUgpFBwm3
         BN9fZjjvrLNdBfFpeI81HTAIuCp2m5PfIpzg6LbkrebGt6urt0BOoFX0PVTHay14Lm58
         xdDazz05P4DmaKbSs74SqlyP1ETLmhNEQYOKbPCtdA+sDLPNd0cWixCUASg0qlL+thsj
         8UEqf4XdZKkKQgf9Ov9/ICgXRvj8LSt4R4PI3hoqBxoavQM1PaYtETPS0wPy6nOiBWGd
         zWG2+ps32lvr73qBK/8qhBp12wD47T0vq5qrjAksoGHSF0LS2q5u8GnrWPKYHCVbAyL+
         MXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704315; x=1773309115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzRzywPx0O0mlAF6vGhDfHihQLjnBGrCLr3m/uQi+Mg=;
        b=IdDmI+hQC7TVUCNb0fNAnAKdlxGk6YEKMfBtu4mcTjGzC6beL6VtPYy4GmntzyNNAX
         QqUckqlAeAW6wEL6HS2bZ5mv7YFymnyjuhG51b1vOh4izPXh9R8Ln1LxuT8ob1mmI83l
         dPC0G3AwM0MEpHGuv36bVZZTzEBFkGy3WoaQpEGp/ftq7f8vfuz+fHFoRtIP1OWlPyH0
         7BMPAlihvHY4qAMh/hmSW0TSStH4+sXjt50IsHimgm0hCrjcFGzCMVhuTmpIoFPCH4sA
         7v+uU0lgOLbKEP7tdNoG0s0IZUCBtTAtBWueSfVNJRj/CsV3QArCGWjg6mbqdtzg3v61
         D3yA==
X-Forwarded-Encrypted: i=1; AJvYcCV4hwvtG6WcVGkzwHa5E0l2vx4Gw9POUseSblPCzyDYcg6OulqaxdKk/LMcFn//wS0Q8EGylvAo59PeFhs2T7T+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq+D9hmfyZgKY8j6WyRhZSHVrmu0glZdPbnVFA3RQQETxKpfWT
	+nsppfxrVi6ZrYlo86kAU6lYU8CN4IULUfFCKc2jBtDGVDJGywk7B1V9nRlPFW8dBN3q9SSiwRs
	p/sS161GzRLHv3B4CKj37bBa/WoTXYeFmXw1Dgw6J3GTW2cYMw2cFJ/B9Ad79y99gfu5pgzuqBj
	qjrg==
X-Gm-Gg: ATEYQzzjaBiffla5GSX+7T1aBJvfy9RXFCoqWOUY8xBXW4/Cl6Wju2o0iGYghCGzjWH
	dum1TQtsCOjlunYYoBJx23CMn7WBOq61QOJhf4bbqMj3mpDIKOnfdTfEDoknJ+Aj2li6+UUYiAy
	aDtvv8HbZH6gYglZF1zK73Ey55n6mC/bpdY1vXZyqgHxLaLZoSs3gwrdS+RZK2f/0KQ6XZleuqZ
	ZmaqzULUNi2HoGY4hhKFLeGEv6TTSkvv/L3D4HOrGM1FTIGRBtwD9AFVYmsCV4dgSGNRfVwcUnh
	ErGprbzxEwMptBTYIKTR+ul+6r28HBOrNWswcTEGi+lXhy8KglaISsNuuJ0TJ7HPK0Y6vAgQdrq
	CjAB3Ni1JmXSuJrSwdi+A70ouPlEl0pHlnNaDSB1Pt2tb/qQOLOyh
X-Received: by 2002:a05:620a:4713:b0:8c7:fdc:e84f with SMTP id af79cd13be357-8cd5aebfc5dmr661935085a.11.1772704315218;
        Thu, 05 Mar 2026 01:51:55 -0800 (PST)
X-Received: by 2002:a05:620a:4713:b0:8c7:fdc:e84f with SMTP id af79cd13be357-8cd5aebfc5dmr661931985a.11.1772704314701;
        Thu, 05 Mar 2026 01:51:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:29 +0100
Subject: [PATCH 4/6] ARM: omap1: ams-delta: convert GPIO hogs to using
 firmware nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yLeXFSR75ccR0iQLMahtPOCj8es5shZ6FJ/i3qInIHs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIrub3GKRGYVOnznATyf6cDQTE9HMMiXE/dd
 JGGx1EnnGCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKwAKCRAFnS7L/zaE
 w3yuEACRLeLuPAaAcj37K3QsyNwQjPOc0IB4iJjV4FzCiOgnjoC9UyKuFYAvefMNet2QRTI7ihG
 PIUxdCg8Uwbu6IBavAIfyYj+kYu2LKh7IK+/EoaWYcJ+vowqem2T5cDfR+T6wrOwkAMZcgJSjSI
 8jNwmLr7x52h50vitgs2AqEfzeQygMi2J8L7ZqLWMVB3TlYgOK7UUfGUs6/D3iuHt1/xAmPpF1/
 c5ux/zDcMHvl2UxRviEkq6/teNmO0Zb7jIy1NzZmlR91Rc//nBb5k+qSRlnP3oM0Fysl6cjWihQ
 BaV6v4fnvt6aeFAqX9kJwCPQtVFR8B22Bb2m6JdwF9X8Gy+Iw/wFPEFbU7L7FRha8lcqC3VM4AX
 +Lop3w9rtHrfy76f2jYO9eucsdRthzaQRQaHLDL5oBNiOtD9KtmTR6wYMAizArxZqU3ibeEIujl
 KSkLCUHyk0elsalUfwpWwZ9YWEgbdWNOz/M9MEqti9T3QUkkS44cjG+gnN2L+eUBu3XfCkkiqJP
 eCMcpWLeQmejZUVr0Zw0FBNzdFGvdaHF2J4+KeSDg9QnQHQIQErw8Ua2DtbYdBWvKGueczWHICV
 c2nYtImPF5WES/h14iVlNbJDaefOpTxc9K4tJaX6Zql2DHr7oHNqHonRZApPqJH5qA5hQo/wMGl
 eG/blmKCuQZz4KA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9523c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5psZAbpHc07LGj0ksyMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FASpOl018sfajbXn1nGV-f_QDiOZpfMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfXx2A6FhDtlMjY
 wHg5JjB4XBp25xSVtGrl51af0+emqDxfEQ8rntf1yWgS0BxwzpGAx7wpHK1xJ2NR8GUaI4YJ2lD
 bw/H7D+ys6EtGtRM4HGDvC9KIH8Ds02L/buqb3eJtK1Ggf2JBP1hlATN6ymqnJGRBi+vT9VvH24
 eohNXlnvKdvhr/+BfupZdcuf91nP9dm6BoTzZTwWEJtY37vfd25R04L1RAsMIj+gEo3quU8CC3b
 D/sB58D0ZmsTKEd8lOc3ebtMQeB5hHq+qpiy5kDxtvvHINpDDybYkgZ73b8gBfbUo7Vpkq8a3IZ
 Car7LQu01drkDayoevQbBWchmnSjYAB0dnThnB/RqQE/2vo8CBgPrcWSJ7YCe+NCniuhlPQmCyk
 zksih6QQXabQPbw90g7ryd91F6HDcVPIS+E+g7L/utjleB8qvDLEgwz+FYpZLK+iw0OWHTMjGZh
 NJckpuEdRCDj1r9ihRg==
X-Proofpoint-GUID: FASpOl018sfajbXn1nGV-f_QDiOZpfMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015157_862606_FF807E48 
X-CRM114-Status: GOOD (  16.49  )
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

Setup a software node hierarchy for the latch2 GPIO controller defining
the required hog and stop using legacy machine hog API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 16392720296cd224732450c85419c35bbab506f6..1bec4fa0bd5e8bfc58103d1f24b22176707fd26f 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -556,10 +556,30 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
 	&ams_delta_nand_gpio_table,
 };
 
-static struct gpiod_hog ams_delta_gpio_hogs[] = {
-	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
-		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
-	{},
+static const struct software_node latch2_gpio_swnode = {
+	.name = LATCH2_LABEL,
+};
+
+static const u32 latch2_hog_gpios[] = { LATCH2_PIN_KEYBRD_DATAOUT, 0 };
+
+static const struct property_entry latch2_gpio_hog_props[] = {
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	PROPERTY_ENTRY_U32_ARRAY("gpios", latch2_hog_gpios),
+	PROPERTY_ENTRY_STRING("line-name", "keybrd_dataout"),
+	PROPERTY_ENTRY_BOOL("output-low"),
+	{ }
+};
+
+static const struct software_node latch2_gpio_hog_swnode = {
+	.parent = &latch2_gpio_swnode,
+	.name = "latch2-hog",
+	.properties = latch2_gpio_hog_props,
+};
+
+static const struct software_node *const latch2_gpio_swnodes[] = {
+	&latch2_gpio_swnode,
+	&latch2_gpio_hog_swnode,
+	NULL
 };
 
 static struct plat_serial8250_port ams_delta_modem_ports[];
@@ -684,7 +704,6 @@ static void __init ams_delta_init(void)
 
 	omap_gpio_deps_init();
 	ams_delta_latch2_init();
-	gpiod_add_hogs(ams_delta_gpio_hogs);
 
 	omap_serial_init();
 	omap_register_i2c_bus(1, 100, NULL, 0);
@@ -693,6 +712,9 @@ static void __init ams_delta_init(void)
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
 	platform_device_register_full(&latch1_gpio_devinfo);
+
+	software_node_register_node_group(latch2_gpio_swnodes);
+	latch2_gpio_devinfo.fwnode = software_node_fwnode(&latch2_gpio_swnode);
 	platform_device_register_full(&latch2_gpio_devinfo);
 
 	/*

-- 
2.47.3


