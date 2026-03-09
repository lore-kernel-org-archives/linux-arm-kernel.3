Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759C5F3C241
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQwazpAS/p8xBP8ywiNVLcoVJEL1G6gSbs/PG65TAEg=; b=zt+S1fzyKEyASWGmz93CP0sJJm
	j8Y6uS5zwEGZJOGypK1Pa2UvdRI4Zg6qr5nehIl5NpgqZubD1myLbTqVvSOir7DHKe5H20hHcUIfe
	Hiuvwo63AM7x6AeZY9vbal0JRIhnE5XcEy4RKDE62TWL0yZWde7l/fSYkfoGVOuks9wy9yU7AsQCr
	un4rkp1vSOz939TZau0Nw/hD4j4lu2JEwHvuvLMCwOUlMcXVzeQuzApeUP7XQjSwdxjYBQKBqre5B
	hcZTa/1qGsiizMHEYEyVndOcNKqglRwXJUr/y7FiPqH1M2/drRUqF8oR1rWXj3H1QAjClYoPpx582
	T7Zg3aIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZx1-00000007KTl-2yyW;
	Mon, 09 Mar 2026 12:43:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZwy-00000007KR0-2LgP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:43:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WIjD3773575
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 12:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQwazpAS/p8xBP8ywiNVLcoVJEL1G6gSbs/PG65TAEg=; b=bqmHL/4VSNwRWM8b
	zRkOwuPJXJcW6NCQgD7/GLLOPdIJx/ohQONcGW6ViXOnvgJn6xsI0ZJVyeREi792
	XaWQuUNMQQltO7/iZLEc+JwdlnQAIeqsUUvnkkZEf69jnbPH3fGeX3tgn8bnDdWk
	YouR8i1kZZ7SnOXQzUTrfHZLTMfvLTwOMuaBiokL9Yb7r8dZrdVXesdVziwlGIMu
	eO7DFHN47nbr/+w/CjDYnHcGCE0aAcMkxuaCiqm8uggZo0mj1PYqLgKi10tOm370
	qyqgTwG0jEQLGNKeJYx8uxHBqLa2apnj9oZwXGUsE7InwozSFb4Lih/SuM6T/ALF
	/kO0Cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8ur3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:43:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so805208285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060186; x=1773664986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQwazpAS/p8xBP8ywiNVLcoVJEL1G6gSbs/PG65TAEg=;
        b=OM67+zY+2G7Ud16M/3fVr+S8L/1FI6rxiF/4HdXC27OOH7E1Xd/rxvfez+8y293jg0
         HX7dBYead29KwB/Qr13U5QSbtxAQUhw89PVjRwx24E2L0Evbc6QrOWTSEK3Dor6XzGIn
         PHNcAFJaHEE4x14/NBWXDgKSydY2uNKdcEJ5Td0Z6urxkabFpHYyU6kYzvNPXovyGP3t
         mN580PAxGdHx0231C+v0P5RIKYWwsNCA9BX1c9aNTRLOkvkEWqW+7EvBd+fu8oj9q+QE
         kdk2og0Wj5yUtFK8ICWLjwDAxN57g+5vko9/Xxy95L4CeBaQL6MlHvq6wag9EFFdcWcR
         vYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060186; x=1773664986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQwazpAS/p8xBP8ywiNVLcoVJEL1G6gSbs/PG65TAEg=;
        b=sQ5uNt4s/KEFSlqCGSSePEnf9G9DPGGzWUCzWznESHSOh5z6g3et2bqSvv7vwUiSiN
         /FSYd4H5pY0t38C8nY1TgPe0VeMapF3qCTp70hxd6oD3ar7v84Ja3QCEh7KVl/NQV2Jr
         se5AqGGqPxK2pmtpEhnLkXxuSQ4bdWJ/dWmmGRCxw2IsrFbsurbmd3OdF0J8Lto1+uFn
         +tJaARO7PJlXjYNmB44Gs/UiJNMFSZGv2M0Cp4dYCh7RXrmq6/PSBt9YhD0gxEvyVhK7
         WQxUcpljgI6PwIQFScqsGKMc91u7mwjEeSHSvhXut2L6/I+OFowltfFq0hmQVW2KBu7K
         2kmw==
X-Forwarded-Encrypted: i=1; AJvYcCURwoCoyS22IkJ7oNjj7P+YxGjqIDna8r6nLcoYxp5P/jK+z5EhOOEVw1x4pPl5vVqq8HS2qnSbPm2+cHYoQ2ZE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0n71fQOdAt3zQ2SIOlOOJED0/T/1UmYNMC7z6xM++6qi0FpUG
	hERWRUI4ErZodov4Y4tgomrHihss2yNbRD879kXhE4dN8yhACm9xWg7xXXPZNUj7wARbFwqADz+
	N3fnoA9kWm3RuiirsfUSo7JhIxV4Afjf2lEQhGTkPRaqyGSgDwekbifJHDuN1iv84q/+aKLAkPt
	OPcg==
X-Gm-Gg: ATEYQzyOxyfz9mFsZqKQWApATrTdxg+f6taSp55CBgj7rXd71aFX7Odo7OOuByhFe1Z
	ZG60kmylFRlhsS6g7LN5aunhZJjLCQphLwZuaEtVmnFv1a5muN5zVp/ZksNqu2LNTB532S7n/lo
	q1l698w+hIaypsxgJln2RsVbjxufTzMDmLmnAOZkwzQv7ay4k3phWy+Q8lvJH2xNeGazVEdUpNr
	t1T7pdBU8X3X4wKQGkvAAJpoxB0Bk4Q3E9Y9Z6Hv4Gj1EHi4zNH+pjCYkF0iyA9VdSYEB4NbIBi
	8RpaxzIaMtLkYPAB6Pw1yhVTLwTYqrKqOXWxiO6qphrrCVKdZTs/+2QmqIFB68mPYat53wnLUrp
	AOPEEIf0LPmSYxAAN4tOuxiBdglDjEzZw+cAd0oeOfG2z/0rtVkxz
X-Received: by 2002:a05:620a:4002:b0:8cb:3e86:d98b with SMTP id af79cd13be357-8cd6d49b8a4mr1509511485a.70.1773060186326;
        Mon, 09 Mar 2026 05:43:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8cb:3e86:d98b with SMTP id af79cd13be357-8cd6d49b8a4mr1509506985a.70.1773060185863;
        Mon, 09 Mar 2026 05:43:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:494a:62d9:d95b:cb98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm107803345e9.8.2026.03.09.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:43:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 13:42:40 +0100
Subject: [PATCH v2 4/6] ARM: omap1: ams-delta: convert GPIO hogs to using
 firmware nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-gpio-hog-fwnode-v2-4-4e61f3dbf06a@oss.qualcomm.com>
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
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=657u5VcsdCwH5K3uh0YA0oSgSY82ZXzp8LKA80Hy5Pc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBprsBK0MJaZuCEcNXm/8LzHDpWPQN1bHIaz1w2v
 TCs2lep/p6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaa7ASgAKCRAFnS7L/zaE
 w1F+D/4u8ii/H1cE8fIlALXnOq3ppXSQii0gcpwUkzxyl2aq8K2iP9cVIuRXmWGSQBm8jrGtlLI
 uEKZW8XuSSvPq0v1kKz7ocOoUX62HTnzfjnWVp/fqmt62t2FXJaf4e877htmTDMfuu4WAOJv3Vi
 aycFNT86SGgLs7TNaQR8pKpxpVs8K2OXwZkFBdAiWtYE9m3fmtVYO142796Ldt9ZJk2hLEqQQ1s
 Dlm8xOOMtF6PBpBCUjy1N7795nGEocaF28EagBGJ3E+hzSPDkhV7e7BETT2xqAqUV2+D5LtYYm4
 WvG/bcLqvWHzhuvepS3qaRzRBwdbPEDzKgK6NEt/FcN1zjEuPX+rNE9LXgmjOiqKD72AIg/nvMZ
 JePKfzK5cfgOM17iAOXpQCpnNgYdWqUGxZpFzfTMTBPEKTfgtoCF2wCTUWnVJg/Z6HE5YyTGfSS
 rFR+lZgSRmmoDexhb9G3i2US0rL4NW2s70miKvDL/8OGOurFkHImhCc4C1+HNNyhNKPOCmoP7es
 e1UNoclkcwxf4CIvOsOcVEV7yejTycZD3CzLRdAZ8poSH8lgPEqKzss/XQfySnVXDe1UmDWgnmV
 gLqXZvGZoHK5xrjEX5+eyErEz7y58ofVkYqFx0icSyFPJR6v3IrCuoCLMWqToRxANhsryXTsWJI
 DAiNr1FHZFSJGJA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fy5VM30dSYEgNJHntXOhosfv5WeUOEU0
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aec05b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=IpJZQVW2AAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=5psZAbpHc07LGj0ksyMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX+KcfJWR5ZjkK
 o0NYK4oF2Xk595cgQ6Dm+cvIKDbnaeWStKHTcpLNUBUV+npa3X6SPcfy2xQmIHExjRAYKVUxYfw
 m++Pl47qMT+gMd/gJy31CuJiABzNWoXWVocHe+8beQLKr4NCWCEfObRzwMd6WGg+W+ojIKg1zGl
 L7ITrthzf3uQG7YFa+rfumlBYQO8pVtWX5lC/n3R1PRFPnLYIcqtCySRTCPBCIdnhehtb5yOJ5i
 EdnN0Zn0Oy/2d97yiJu6GKRqISSysBX5KKb3QxSAlJi9mvH4Luw39r+1KD9xOo4jp1PsMZ0ipZ3
 aALGNx40pkf+8sLFr9bSGMzHxitQZNWoBI9a/MtsqwrcMvD/9v21Zzf1QYBjqg2tGiROO7ENjUO
 Nt0CWUagBfHHpJUiUK73j2gEzq/wumEeP2XmtxBCIa4SGBuwSVqE0HCq8dJBDIKYB77boVKaxHC
 Tebq6VNh9RNDHJEBnEQ==
X-Proofpoint-ORIG-GUID: fy5VM30dSYEgNJHntXOhosfv5WeUOEU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_054308_727094_FA88C9E1 
X-CRM114-Status: GOOD (  17.13  )
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

Acked-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


