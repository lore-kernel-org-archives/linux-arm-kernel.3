Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D24AF30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExEz4/DFiPUvRA1okzAQrYU3w++SlZSrUbTH+yM/Ouo=; b=OMfhjH0Y7hOiJt/m2l9xYRW1Kf
	p4W5e9unq2HaLh5qk4AG7eSiQatbAuf6/XPg4S2EjoAVo1dmlAljQulYMYDytbHDJ2W7cRqrdvqEB
	j5jelxG1dw1MiOxGKUh2g47L78tmKAeT+JBvb2EDaklFbLdMAaKSovJJOjf/mXPAORWl0epSLHcsi
	KhWDpv+XxW0BFDQImIMG3jdG4VzyEKlA2Nb/4iuPCerhP/KA4qHNkGcNjjxDZXb7PfQSvOjLaWBqd
	VbUOGFB9BPw9mSy+R5jYSZJZwUxy4/3mcLMSwLwQHZfBo9lXr3PYkToyJQFtAvFYQwM3adMxGY4JL
	hgpL42NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5N1-00000001STz-3F0O;
	Thu, 05 Mar 2026 09:51:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5My-00000001SS2-44wT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:51:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625941LD3160367
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExEz4/DFiPUvRA1okzAQrYU3w++SlZSrUbTH+yM/Ouo=; b=DE1at4dGMoW0MPoj
	fkTM1XPnbaXH9aOtii8tMvhXZrHf0+cANP9OsxrvjZFRsMmqGtC6L8yRzmPBUjnB
	0bZb4g/2M4jJQPf2/9OAno2qDzeFI6D40wtuqXeqFs/IHqUl0i5EPWUHZKVVIY/O
	rwgpXcQDFhXpr3mW5UQY8n1mS8ePYv+Gzhbt4XN99Bn0ELm7TbaP71qoS6SCnV31
	jWY2dqSMvz6jnGnZycfawLKRE/xFmFMQSaRxb4BxnUxtBzgNCexoCgiQkrPD7Q4U
	YZmDIJIaJJ+BTsntuEuxDhA/rTQ/TZDX+SSJXFWtfdeo+ikncpU4dYalpZCl/deB
	6/3fJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v4x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:51:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899ef673d82so89341676d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704307; x=1773309107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExEz4/DFiPUvRA1okzAQrYU3w++SlZSrUbTH+yM/Ouo=;
        b=MlMeBH+2EtDK0Rcox+Eu9sUEDmiz0WF4DU/GV59uf4a+XjzcvW1T3T4yirxwmgIBAd
         wvc46a/dR1ga47bt8tNW97GOH/0FbnR246awJAiqwiiXaJGbgrKJ6FUDr+0jazlhYtTc
         xyI1RS9C0f2H5AM098cvvSsYnSORebunJNwzf2Tr2kVkCLvt5JpeU2QUBGeuC8JysFQM
         dOWFZ4rJWGifdYMm/jwylR5YBiLRlXzlzhMPE3zBlfbpUKS4jVi90w2jAZh0cmWMu31F
         HKnOh09O0pAPN22bLTYpPtsTbAXEy1SNTGJ6WTQnQy1dDXjQJGaqSgvYfQQ139+lg17K
         +N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704307; x=1773309107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ExEz4/DFiPUvRA1okzAQrYU3w++SlZSrUbTH+yM/Ouo=;
        b=ED0zX9s/Mcty9NsZ+5zMpnCC9+SwV3X808Zq0ZLeS11FphOlN8aqwdZYAtMUViAVJF
         h3geCgjPKPbfGAyYdZ+J0lleqv2RseUysQf8ZbHiAumlOY+hIh5E5e+T3YAxyHt8Q8Tq
         6918eF9pYJlMpDDo40q9j1DJccBkgRSleYTvBiiA+ZAUmgGY58WRrx7uLWUPcqYNOSyn
         PX8lIIEjJt7SK4DYoN2O0LwQuTy7qpAnyyjDJMqRF3YDVKFxNCIIEpCjIq0aZLADZVKq
         ozKjiNw5wQ0SF2mWIA/k9y/270p3gw0NTjo8GcDgAzlbhqqOrdrWeNwbrWXVc6JJfO2e
         u8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXwCupUMcex7bMdI8Cjgnfc+DXHBJ0NfBmvEN6cIm1C7T93+/NokH4JCJpXu05DHDS+FEVzp6gkrbSzp8nNWOox@lists.infradead.org
X-Gm-Message-State: AOJu0YyntrZq1WgThUnElLlWLNwNMGSEWVyKPalpMyecfou/At/gdl0f
	huWbWHOLfyWq8XtWtr+3xDMT14irfDmRGLPAtF1F/ACL8xCa05apHLEOLEUkeTlTNs98MIxKaio
	xUQrAnFMfuHQchGzmOqiD4q693n2MjdZ6WohAUfs5rzPXBJQsVnonU8CSfAqKQzxImPIQJDBS4L
	dAJw==
X-Gm-Gg: ATEYQzwd4RXz4PAY5ois6UsKFMkMMQQS6+pSebWnxiLNLoRxIVGA/RGZqsuf+Q+Z8lD
	Fs9RVr7AYRbY1/LJ6Ui1QyDFjlITX5eKmgOW48TFNqY08PbAX7vNluFRiDTwkJv+lAAbxaJT2XS
	tbAWgvHQr2fPoESI/xo1UoXTk4Y57xsTZ50niLTpcpU/np7lG6bkcbxZC5K6HU7FEC2TczPGhtO
	NpSMBSuq7B6RhCzhgvHE8KKLfDTBc6qsenvtXy2dgeEa4ltLtpePq533/2lyrbadEtQtkdpGjhY
	cDPlDFLtwdcFHH7B6AthXqna4WOpa0oVAVkiJCYfKW4VdosclS9Bh+DvupIHe8yVQ6Nnx23e4p2
	jZ81/OHHCauFPCqRAicjpj8UsVOiUwbqOEJjXkOytYpSzcE4PVa1K
X-Received: by 2002:a05:620a:4405:b0:8c5:3067:903c with SMTP id af79cd13be357-8cd5aec446emr644636885a.11.1772704307398;
        Thu, 05 Mar 2026 01:51:47 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:8c5:3067:903c with SMTP id af79cd13be357-8cd5aec446emr644634385a.11.1772704306918;
        Thu, 05 Mar 2026 01:51:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:26 +0100
Subject: [PATCH 1/6] gpio: of: clear OF_POPULATED on hog nodes in remove
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-1-97d7df6bbd17@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=asFRYbS+mWsBdMTNaAjlr1kv9Sq3WYDbm6irXLJp2J0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIpxm8mmJ89njb6VW6uBXMeoNjLVFgEK4G/7
 o5qRQijDnGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKQAKCRAFnS7L/zaE
 w2ZEEAC2PUZMyFEneqHPYBmxvm7P6SHUaTj09ZmnewmcmRX1Ifjnh5Owxce4J2PXBfO51XuviuQ
 3ws20+W2Dijv0XJmzoq1nvGp5TLupbdjCSbyQJUFx0ra4QKROzaeuiDk1zVjKxOdxN2Mq6mWsI+
 ZlPluD8qWKSXqyl7F51SOEf2A3g2mZlYMooA4yXeYXW1/BdB42IY+L01RH+Dj1rJUAXyHEOQG+P
 U8Kfj2/UF8LR5XXWT5p14hdLAjUoPPQgXGTWwGykCZAQ87fvt2xofkwnYQvg5AfnJOtN3Q1z4Rb
 tAhCKqWUmyuGnM1cxyrYcmUwGyHxKu/JbGD8sHTiyhcr5/fNv0usioIXka1DEZ3AOJTQw+d8wmI
 I7GLTtfU86WrlAGhUm29Wiuvs3M2eoJzdOPwtCsPo8h/a+p8hTczNCsCu36zMJ2P3zBdQG+qK18
 4gkv7hrrC9HfvUV0GM7w8dzGf4XIYnh+G4OlakqRfusunUJEHOP02Qul78UfSEcXCzLbLigiuSn
 6WmVCIKsJ7XGLKM5Gbx39Qo6WlVAjrF9PYKHeyz/Hl8XsWUjEO324tHHi/ZbZFIYFqUcJcE7nOU
 cmH1y7X03mA+ecUrM2+7VkLkOq8SSkSK6J/0CKFWpOvOfbE5jfo7RPTULOkoh78+xaYksHk8Ma0
 x9BWcpJG25QWsnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Dvb-13hRwZyrz939nx2Q41Lrptk-St0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX/E+XSabVvK3b
 gbWFSvgPHygKp7ri1XOjgqtkN5MSUwFijmgpyiEFnvR/tFjakQiaIPTkAF4DbWprZIGjUiN1lfl
 j60knOcLJeOb5m6FX2//q8G418VkgrtoCyxIGkxPbogObEgv2y9nyFqm7wpzW23AkxRUCM2+bxr
 gYodU3QLs/3n60FkuJwoKDx7fHz8VOIGQb/TDrzbPKH+Rg47em1nsa1wCkV+Ef8Re6D7TiuMq3D
 5cuxCJO5kXWEAKkPS2UH1nXRwiEttRXGlUuoF0gAOoj2YvHZs0AgrkrBRSYMCBd5ejM0a2VjdB8
 NnIul3Eeor2FVURIHTMKdXz0BO1pIZWjDQqCgId+og6ssl2Nh/NfAyheBYZaiECaIliSpPZZ9pW
 iFVFI3q1xcScbMs3ztzmLR72vSzqToZ3gX1bz90S11yLAGuEKd3SnTxNvGpMFJIiggGtMTCG6dR
 Jy0wPcEB9+IAfg9YzeA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a95234 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wIkqWORfvUmHQsOhi0cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Dvb-13hRwZyrz939nx2Q41Lrptk-St0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015149_135758_6CF93B18 
X-CRM114-Status: GOOD (  15.17  )
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


