Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B345E68152
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2IsP8/jgA76HelB7TVtZGVRqfenaH3elI0PUUDx2/w=; b=ZLTX0P9biXm6SeauMIDLKezNS8
	7ND/LbFEf4GMFDA570rXc3aWRZ8PnjVxhmGsMWerFh3P5++X9NpAGdgkRFw4EnKzXpwaSzLsduEwO
	3yep5XJjKHKhu5rOeBIekluxMirJRyX7iamWGacKrJp8atsF4btM9qiASGtKK3fm+dO//jxi3XFWs
	LHadTsP4QD/5a2bOH1XTPuQd1VypQPbZnHkRr+Mza6Uxorxnt526fzZ3ySGEzj3ta3JlJ4jrOqm2S
	uqLsKW/o4iC+7YzSbKyNFrFgWOkR0GTkkq7wxXAS21jaDVh0eR6WDsSKEyVrcZN8DgE6sCgLa7H9t
	jrPfqPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCP-00000007vD6-0NTH;
	Tue, 17 Feb 2026 09:16:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCM-00000007vC8-1QgZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:16:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GHbdoQ2802096
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2IsP8/jgA76HelB7TVtZGVRqfenaH3elI0PUUDx2/w=; b=jJ8Yn9UnzA/JSFxz
	IPgm5K1oqfcfs98QxCDraC6Jw201HURmzHiPn5FrwmIvd3S221v7HLpOBaDI2rsT
	Zn2pIng6sKsBr/Rl5CT9wxqXTP3a1szuLoKFzQh9o8iyARXQAzGctR8Kh+SBfGtM
	fUSyMk+71EryqB/q/wiOU6U0c4rdAEb2DdNK40xmB+niQDvOBgAZPL7g3re6GxWQ
	3hSHp+brqy4WeNV9K49ycy1xnYLg6RkCLUU+g0MW7RFZiFW6MaFHc8VSD9hztUZi
	z9o/lz6UvB7hfp5/7zvhiqIAZ+rzpg9mr+Ei9DlkpCWjxNMZ3ZQo1DpI7NLQ3v9k
	KrYPeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujus5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4817f3c8so2070784185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319809; x=1771924609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2IsP8/jgA76HelB7TVtZGVRqfenaH3elI0PUUDx2/w=;
        b=J9A571LK3o2sfc3R2NMZKwNpEecD1whJ7EX0NNSU1pbd0T2YKxEqWfxhSkku6WjJTX
         2LYIPINxhqgxfehL/K7bjnAXCATMxGjscfSNq7rKlL+0iTIjs5f2kGwS48m8nlFBEaiA
         S9slIz8Zto/vEjFE6Tu1uUExhJdQ4dprrapHdD4pXXNawcr8cqREaJTsXmr9oh329ZP1
         kj9LJC5ySzWNi0Nctm61wKcjAuEix3S/XU+cEqxK3gjnCvZ+75PxAFjcTp1GnJHse0XH
         x5iclTzH5am53xbnGyG9076THduhJfWERry/cBxtdqE+R/2DwNJTycsdWM7Tn0zdcO1D
         kpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319809; x=1771924609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2IsP8/jgA76HelB7TVtZGVRqfenaH3elI0PUUDx2/w=;
        b=DoBUA3xd1/SlKEuuHJWjd24pHH40c/UENhYM+CtNI2oD5Y0yWE5z1GFCb+xP9wlB26
         GmC29L+KC81QkXZeWOQRVw9smiKXG6IFo53OxnbTwUMKqmoLYtydhUv1oJbplfESdDat
         vlGFeug9ZfXzuljPgRLR9kCviZ3xaSbDkbCFf4E4+JZTP602T6qLdlzHJ8KpHRGAFSdl
         eKBU/uIj/scC6H2y50aEDAzZnaTwcWw6WEaW6lY68nNfq/mKIS6G7pkTXGh3YUuiXvps
         nDmbhKyfOqq/mqn1OBzKgyICfwdTU3U1lmmjNr65t4Y58ajFIsft1cZl5w5hX9ZWKtik
         3NPw==
X-Forwarded-Encrypted: i=1; AJvYcCXM9Wcp48VrWQSRFXF5S/ZQTEZeC3jbuCgeGjKCudyJK6y5XbCns9YMfuujheJnRQJQzGrc8TpNJ2JV3E3JhjtH@lists.infradead.org
X-Gm-Message-State: AOJu0YzN5q9N86D7LhIWVmUdi5qXfBfYKL99p5jzu+svNcwFIYL6Qhyn
	hz1wBt1wu8b6REzWMvQfV8sW+OsbWyJFB7k8s4prJ5AAewYzAQP4nbX364TVIRJs/dzYKwKeQ/F
	jxTz8qvjtLGOPqWhEXVklIKDn8hOKP69Y7QvAw666LK0l3SKhEV2m0x5ppXL6gt1MDf4QEq40wM
	29Yw==
X-Gm-Gg: AZuq6aLqHBL5B4VSUZKQFQdqyCvzHbGz2Gq8iPIfNRdBf7uu/zBaI5qleCc5s8MZp8b
	UdtduY9nGlAtDFcpNK/7HpapM1vsSqguGIE29/PYzA0Uk4z9Zz27UopQHNL54kxiYnPIVB7tatc
	KR4FgVhhLF5/0JOKYhGN6J5L+Thl4r8QNomlpIvkTUMiSPI4P8hd/i2t5UIw7DFl4HHmy+Zo0o3
	T+QEGftHXoas5SULvqQeULFqQsUPr+vDlgk2oTiwbbCbawblhLbgnkKBVHfTUBdOylBNjLwEZfn
	8yFOj4OubPwOZQmh1lsk0c7YPPQ7LvBgZTidVLu059Le8/Jra/mDZEX5/e/zVU5DC72jl2slWJY
	R5Jl0AfOI6an094CMjQ8jr2GygyPLJQ8WqswbFLBDzC0KqA==
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cb66dca40emr322126985a.65.1771319808795;
        Tue, 17 Feb 2026 01:16:48 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cb66dca40emr322124485a.65.1771319808333;
        Tue, 17 Feb 2026 01:16:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:16:36 +0100
Subject: [PATCH 1/3] soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
To: Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3335;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bqDjRxVs8N/Q5ZrspI/TWkpKsVqj7iN896A7uBcshw0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH6QW+MOGCK5XyT7x1kVp4DNOhOLdnK6TVMv
 BpFEjy80U2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx+gAKCRDBN2bmhouD
 13xYD/wKO+BcroimNHNVHXfTzxMAdsHpdxdSyXcF9pUbPY2oQzXZhCeNZQ95N3PGXXGtGEdA2sU
 VYNwe8bfPQq2H6BWRF3kdjktdRb0+3F2lOXks0lp+OIa110eR1fLVlWbboeEA1g5lGT5ZH/eXw/
 HtxIii4cJOLOlxcbExjmELSHPi/TqG+l0fRTAzhkijw81BiEFaIymfzwkeyoIN9OAgt7tR6abIU
 +2HeIZ/J6jC6ag5oHdbPGNfpd7g3dibnsny+R6+vFzSbtIePyC4MYY3jXlTwfLsHfHS9oQLrmYV
 uGjKmcjCfHXp/zAswYvGiw/zItZcX+e8DJ2v+RO74admlyQFrU6Ep0bx/oKUoJ0ap05uqrzISH/
 5cL5GngRhrxlL0mmcI16cYOqQfiF7bw0E7WSRecxGpgDFLhi7Q3Nmk4N6fbqExU4+hteG8pty/+
 W9tlaKq40/dF2pw1hvjpKcurIu7Ft2fzRytGuTl3F3nyJbZxuvpMk09SeiqdgGeXXt4axqCjGvV
 saO0/OILpRir1Vi5ja69lepqKYmORg4xsizXP/hTBjOSgEDPnOLnICLGFevcoFruMOiIzJfP1Nc
 qsraCPxElbRgzPyyLNRPrqUreVV9k5VAoveMFXcfA2Y2e16mj7qSwqcNlLnoWp3DqtI9eyuibn1
 I4srIXHmRPhuPuA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ebUDfLRahv9Xm6TSBm1OW15Sf4mo6Csi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfX4Z/yZs+BEnSm
 Uzr5Bjmi6JYlLCQ9xCC36jTlydvy+Y6j64VX8LQtXtTdGrNHFNvRWtS3GHH+Sx2NzZ+41ZONUzk
 yrQyQUos5Xb4CVB4SeMYbQclS7jXkKP5XexsTsoyqtCFE9eKeL9Nkto3io3qOPQYLRUNTuMTStB
 cSee4cFGwuaRFdFDKaYPch8C7YfXukMgrVJtKeaLtgrcEpEYIp1pxg2c21YD6IhwKvppOhmAUfM
 cqEUXP7okswbQBCkFfeNU6+0YcHNyYt0dAEaMsoTwNP6W4JK72raUyhQOIJB6ZlYh+jsTMv4B4A
 1oNp6FfLglka3XOBitn/oHbZ6CCB0mpiX7OCUdLU/83E0JnZoGDDsX3NffiTM1vdRZ6OxQm+AYb
 6dtjKQ173BHpriFw7/51fOsmMXXduSdVCCWtxwPI9fTri3vstdIelxKq0UEHI/xAAG3SyJVMekI
 sPhBIKTiC+Ai1d3evlQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69943201 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=H7KHO4RPsEdM4UCB5m0A:9 a=isR4AqL0EaFW8Alr:21
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ebUDfLRahv9Xm6TSBm1OW15Sf4mo6Csi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_011650_499700_28B78815 
X-CRM114-Status: GOOD (  14.35  )
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

By convention, only one globally selectable ARCH_PLATFORM is expected
for given SoC platform, defined in arch/arm64/Kconfig.platforms or
arch/arm/mach-*/Kconfig, because we target a single multi-platform
kernel image.

Platforms wanting different granularity, e.g. due to size constraints on
their devices, should be sure that globally only one ARCH_PLTAFORM is
selected in defconfig.  Change Tegra per-soc Kconfig entries to default
to ARCH_TEGRA allowing removal of these per-soc parts from defconfigs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

1. All further patches depend on this one.
2. Year ago after my complains Prabhakar fixed another case - Renesas -
   so with this patch we get rid of all single-ARCH offenders.
---
 drivers/soc/tegra/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index c0fc54c3cd35..a1cadfdb356c 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -6,6 +6,7 @@ if ARM
 
 config ARCH_TEGRA_2x_SOC
 	bool "Enable support for Tegra20 family"
+	default ARCH_TEGRA
 	select ARCH_NEEDS_CPU_IDLE_COUPLED if SMP
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_754327 if SMP
@@ -23,6 +24,7 @@ config ARCH_TEGRA_2x_SOC
 
 config ARCH_TEGRA_3x_SOC
 	bool "Enable support for Tegra30 family"
+	default ARCH_TEGRA
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_764369 if SMP
 	select PINCTRL_TEGRA30
@@ -37,6 +39,7 @@ config ARCH_TEGRA_3x_SOC
 
 config ARCH_TEGRA_114_SOC
 	bool "Enable support for Tegra114 family"
+	default ARCH_TEGRA
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA114
@@ -49,6 +52,7 @@ config ARCH_TEGRA_114_SOC
 
 config ARCH_TEGRA_124_SOC
 	bool "Enable support for Tegra124 family"
+	default ARCH_TEGRA
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA124
 	select SOC_TEGRA_FLOWCTRL
@@ -65,6 +69,7 @@ if ARM64
 
 config ARCH_TEGRA_132_SOC
 	bool "NVIDIA Tegra132 SoC"
+	default ARCH_TEGRA
 	select PINCTRL_TEGRA124
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
@@ -76,6 +81,7 @@ config ARCH_TEGRA_132_SOC
 
 config ARCH_TEGRA_210_SOC
 	bool "NVIDIA Tegra210 SoC"
+	default ARCH_TEGRA
 	select PINCTRL_TEGRA210
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
@@ -95,6 +101,7 @@ config ARCH_TEGRA_210_SOC
 
 config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select PINCTRL_TEGRA186
 	select MAILBOX
@@ -109,6 +116,7 @@ config ARCH_TEGRA_186_SOC
 
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
@@ -118,6 +126,7 @@ config ARCH_TEGRA_194_SOC
 
 config ARCH_TEGRA_234_SOC
 	bool "NVIDIA Tegra234 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA234
@@ -127,11 +136,13 @@ config ARCH_TEGRA_234_SOC
 
 config ARCH_TEGRA_241_SOC
 	bool "NVIDIA Tegra241 SoC"
+	default ARCH_TEGRA
 	help
 	  Enable support for the NVIDIA Tegra241 SoC.
 
 config ARCH_TEGRA_264_SOC
 	bool "NVIDIA Tegra264 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC

-- 
2.51.0


