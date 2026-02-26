Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC1CFCE095
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grkJnEX07lHrDNJiuJunVO7wInXkycQ8M7cuQbWA5fw=; b=UJYFulZx1xSX1eraii3YAqv0sH
	eOnJ5ynFIXuhTEwI5i3trKCY1s3TxrQ1fQ2McLQPJ9wMFpgPN8g5rxkEMG5R8UcTxqB+dfq4yXwfD
	+rDwLgzpeVz7A1f5WNJyLl7fHTiermNnJ/CtUJYltUbFn/JRI81+I9QYk607XXh/vy4fsYZ7GyvBq
	s2efynIAgLpmBBYGq/ID+61WlfTd+Y30Um8tGV4NHSRK5tvtLbTxYDcZGvFfVr350zkT6BH5k7QwE
	AoyHgBsxPks84OHSqgWcOe4hwuZKnaY4c4gW9+PpxkaNGaf/tJjYyOWb5BD8YP18l3AWeq44sclnV
	s9norQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcTk-00000006M5D-3Xd6;
	Thu, 26 Feb 2026 14:36:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcTi-00000006M4q-0GSc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:36:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QB77LN3853534
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 14:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=grkJnEX07lHrDNJiuJunVO7wInXkycQ8M7c
	uQbWA5fw=; b=o4gGWjaRW7o9eTo36JNj68kkAToYGAOIj1tMAieYTMGZ48F3d0U
	rGw667x5myqcHVQ/Y64Ak3ChbRB0BIQI7xfILwNEm1Yqye9asd3fp8HL0tscGbWn
	kvGT+f9XM+C/1pXTrWcgZPp/F+8AtaU4krwuSZG28XZDzCOUcA05OtGJ6KNJtude
	4RSEFP1BvSA517S9Hj9F/m4AyySpxkxjnrUMR3qs9S2dfjWL/GTjccxTA12rSHT+
	uihTWBaw+yRX583mLAxnvmbYHinimjBYeTHzVeyYG/y1jMtOV5MRoCBcCxD2UIEX
	7TWadxc2c+QWcNhjjfd3K5cMcfKr2fQLIJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjn0x0hue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 14:36:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3d11b913so744350085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772116591; x=1772721391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=grkJnEX07lHrDNJiuJunVO7wInXkycQ8M7cuQbWA5fw=;
        b=CXTzfOxc/7Sdb1wIQeKLnc3eINt8CinsVGE5BmAM/ytGQopybYHpMQ+kulSjTySKjU
         jTKBKVeZuwlMmtk1h1Lnq+TBzxAD3jy26DB7xsg0GF3mWEl9uxXClkHBkw15FfVjkXz3
         erEmLDaMtFs25uUwmtqSvpFXzydwIP3dYkIAzcRRx+qWEKuITmEsRpHEwx5osUc5+AZN
         NL59R9jfQCwIfTBoSlRw04XNpWPPHju1j252JSTX3uLOXWi/CbZAAIsJYbOiZv6bWuFR
         VNMJ+m5inywuk4vMpdquHtyu5O9OJh8URbuO+FvGqNBGYnMnuZNjKkDVtSegUbGpojsU
         ytwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116591; x=1772721391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grkJnEX07lHrDNJiuJunVO7wInXkycQ8M7cuQbWA5fw=;
        b=KPY2xU730ZOQ5/HnDUdkRe9WSxjdT0jLSL9jYMS34mn0r4Q44M9KduYQ7Uw6eL7rap
         yXBDsizRiAEZQFOAIvezzoHTtv618l3FF83Hw8pk0ZJmxi6N2NuCtohSGYwRe46/2+N7
         UWinVwdRKbc20dmfpegzew57NvW2HZvzJs0NhEoHo3e3FBQhFo5f1Vxy20L6NnTG8Kdp
         w5KS5mkXi+1CZk4JMeasBbpjQaS1Fhf8AfN+BWx4Jb3uSB8XI6wJnfjX+3tStec0yMoS
         2J/sPDQzVxL5qyWuPf928rmwSn1mvRBleeifeaD8b9Gt4SC3Ttccq3yzODcAVzr61dNn
         AMzg==
X-Gm-Message-State: AOJu0YxF25RvNhrVc1dCcnpJw2AFLoJYHbLfiBb88jWBNr/jDKNBD0MY
	8aMYh4bT64Nv8nd6lFD4DqgeEL7aEpWzfLPiwT45BPAllTCwK+A+mRdRxMCEZAv5X9zRLsRx2z8
	2JrjfDYsxhjAV9c3iqWrROO8FKmjjjhwEcPO+t65a9cnRlG1KblonhMWS2wO2MUeWkcNRqyTwan
	MTgQ==
X-Gm-Gg: ATEYQzywDVUUIYDSbPU0W0LUBef/2Ohig2dD8JXjhEAYmuiimsGKaqPgK7ijWFHCByD
	aI7WhxttBvfJMKr9I6IhVPqIs2yP0P+yTVVLcypjN6EYZbulqBpx+JYUmLoFqTvTl11BIzAwtjw
	okFdqp1zlBIFo5L5maA7aAFG3VQL139AaroBQymjCo+ayRRTQQcOzK0WPnCCeRyrhCG/Q9oy/oT
	241RZTXgOfH2E1r+f0nKnkkDkoMEiEMzamoLsmVVW6aOirS8QGRIqBQoMGaGdWPjxdb7E3wskV4
	pQFjHFc2PoQEZyJPqhhP/O8mcCLMztm2DucVzA2efzLlXmtysUebwM2nqwcKqQWYxqeY5kvlSK+
	w8GG9ddHeHoIeO/yRXx8RJ6Ufo1KAKCGdzTjd0j4pmSh1ydfCCA==
X-Received: by 2002:a05:620a:1a0d:b0:8cb:b062:c2e5 with SMTP id af79cd13be357-8cbc1123e58mr247090685a.27.1772116591407;
        Thu, 26 Feb 2026 06:36:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a0d:b0:8cb:b062:c2e5 with SMTP id af79cd13be357-8cbc1123e58mr247086485a.27.1772116590928;
        Thu, 26 Feb 2026 06:36:30 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:28bf:600e:c628:6c42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4398fefa3f8sm11363834f8f.36.2026.02.26.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:36:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip platforms
Date: Thu, 26 Feb 2026 15:36:15 +0100
Message-ID: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fOjdBedC9kX8N0Ae0I9jLvN7Wi8gX9vS
X-Authority-Analysis: v=2.4 cv=I9Johdgg c=1 sm=1 tr=0 ts=69a05a6f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=jaURUl8ezSVfe5JvYb4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMSBTYWx0ZWRfX8iLzboAjoV+q
 OIIYKodx18P5HammrUD3guYuO9hTpDHhz9hqlkA/yaJbhBrbqFrOwJkae7B0QNV0CFlmzU2aajf
 8P2j5bmp2V4DFcxUQ2tZml5a8EI0setthPX0HRprqS6rVXpYjSUrpZEGXUgBEozB8DPU4nxBZfB
 PfH/64BiBtXpqpwIWJuCZrAMptSCA8T5LKlbqZxdGc06SfNRvGWHFPl40dPieo3bU8AMWhueZiR
 2x+jjQQd4gNuT8jyauls2ONzcIkK89jyRu68wngTYMF0JYxllt/uxZHAR7KgEEKSKnXhjyuclOm
 DqYLnPCmmKWzAOSrAGVitQxOFASxs9bf8PT7T7fQc32zSGCsE1lFwTLtmEhE83M3w5yBUmDCOyL
 xqPmt2hHjqtwa6kv+m0dD2Y1NqIRJXiLxN12Nf5ajWVZofWrU1JRFhZoyWqv6JrJW/N6o9kl1zS
 dgTmg7ZEeP/SPsxlvPg==
X-Proofpoint-ORIG-GUID: fOjdBedC9kX8N0Ae0I9jLvN7Wi8gX9vS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_063634_222726_E79EE290 
X-CRM114-Status: GOOD (  15.99  )
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

Microchip is the only platform that doesn't have a top-level switch for
disabling all SoC families. Align it with other platforms and update the
arm64 defconfig to keep the default config the same.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 10 ++++------
 arch/arm64/configs/defconfig |  1 +
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419b..72c812e76b0b1 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -188,16 +188,15 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
-menu "Microchip SoC support"
+menuconfig ARCH_MICROCHIP
+	bool "Microchip SoC support"
 
-config ARCH_MICROCHIP
-	bool
+if ARCH_MICROCHIP
 
 config ARCH_LAN969X
 	bool "Microchip LAN969X SoC family"
 	select PINCTRL
 	select DW_APB_TIMER_OF
-	select ARCH_MICROCHIP
 	help
 	  This enables support for the Microchip LAN969X ARMv8-based
 	  SoC family of TSN-capable gigabit switches.
@@ -212,7 +211,6 @@ config ARCH_SPARX5
 	bool "Microchip Sparx5 SoC family"
 	select PINCTRL
 	select DW_APB_TIMER_OF
-	select ARCH_MICROCHIP
 	help
 	  This enables support for the Microchip Sparx5 ARMv8-based
 	  SoC family of TSN-capable gigabit switches.
@@ -223,7 +221,7 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
-endmenu
+endif
 
 config ARCH_MMP
 	bool "Marvell MMP SoC Family"
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d1e894b988f99..580b7ab2ea05f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -57,6 +57,7 @@ CONFIG_ARCH_HISI=y
 CONFIG_ARCH_KEEMBAY=y
 CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MESON=y
+CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_ARCH_NXP=y
 CONFIG_ARCH_LAYERSCAPE=y
-- 
2.47.3


