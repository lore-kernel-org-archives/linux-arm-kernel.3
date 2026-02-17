Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA10E68153
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8OKb1SZv04ljEymqRWJAeV6X3LU2VaiujY5Lry1CIE=; b=2X2ZkwjTKKD+uge1lK62P7MRQf
	dEBre7uAKSyn0tKGNIPgsBahj8WOavXbQ22O/7Ll3oyv/9F03iO51/abtJOu19928sgPzvtBkPNWv
	rzIhnScTx69UTRTTQk024VGRQoLZcPZPnNIFIeXEC9hYG5QtblLX+FfCTM8NghWZb+PIO93UheXVB
	v8NwHHIvsdIWlX/sHJAjYBumM1R1jP9DwRqgNw/Ev/TmZ2e/Lz7ouvCdUJkcSPNnwkldwptOXjJ9R
	UHx9tgi4/yfeF3lXerQLitm1Q/gMBVlHz3d+I7HTaKpy3QPjDFQ95QNo7EQvAaEnMIr79t0vK8T0o
	0k7caz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCT-00000007vFP-1khk;
	Tue, 17 Feb 2026 09:16:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCO-00000007vCl-0i3H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:16:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL8W1r912069
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8OKb1SZv04ljEymqRWJAeV6X3LU2VaiujY5Lry1CIE=; b=UU29VoMaomYwyLCY
	jCFZyhZCp0jhFA8GW9nYs/8iUmIOzNKJP886PDZd6pYG9XeMCmBa/rU3mP6qXOC9
	5RxK7MM2Z48zkvYF6CINt1H1Shn3gUGeaGxNFpw8sqD2Mv+z7aFqI1XX2UOl95j1
	TEtXHxiMaXOEUFf4VY8DwhjJhVzjlF97Ijr+5eJF5fUMGbArBJRrRfwDkJe+k2RD
	RQtdM1jd9Eg0uPkzJhDoXxIus0lJ6bZRQwLD36l5QnXL01QpJgEp5kDminDyruJe
	830nueL4IKupC2bXvzfhUIa97ur2XhjRbjxzUKkyEYFusAUN+N64P6xdADYeCSZ2
	f7Pohg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9ss83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so426910785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319811; x=1771924611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8OKb1SZv04ljEymqRWJAeV6X3LU2VaiujY5Lry1CIE=;
        b=idjlapp/C7NsUmVDyBuV+6IsStRNj79eNN6rumadmiyuSrX6f/DqPxpUTa/Z7Fe3vb
         EjGpud6g78R+Nf9J7r/r48xYKKoW0TswKo8oAA32AC7jdF7mdFtzPwYUNnHFDnQgkOlR
         9kXrl7p9Adie1yOxsy9k0uhw/X71GiBD/5LItxJxXpAGub4ohMBrnkm2Gbih0urBjg/E
         RKp8CbJvwa4fEGexr2A5cZPUSiznK39uJnqCxX2K3txvqBsy82GyLuflr2GWicxg1CLV
         g5jyXioPmrLGSZHefMO8sU8jsEwVqV3XnskSThxp3uf7w/QrE3aQubjC0Ob4J8CRVX5A
         cm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319811; x=1771924611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8OKb1SZv04ljEymqRWJAeV6X3LU2VaiujY5Lry1CIE=;
        b=wWtkREKBKt4sDs5KR8c2t15qPE2WrPYhhbyI/GePQsIT3ir8m/IDvKgRJWE/Ky2aEN
         Yw0syjLzsigusTYaKn9wws0pc0mzJf8/Wh3td3tJ7RBN/SDDvva6Cqoim639Rk1l8cqX
         B631oiakhvnMyOtK4fiAzkQeBnP7PSc1w+BVMCrDStvWftc3UoCNj3Lro3THG85rGJB4
         pDH0soogxznoXPLMsN5fsIDqZAeebIl2IIlMxcQtXpvEKtSYB/E8KoNqIiwE3G3yOgW7
         qyjr7lks+nCaA2teneIcJTilp7DBj2HZ/BniHzYeb4fUzYwZEDoyeQ3reJ6wUmZPycAd
         sq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHUxL5wwOhPRKt62Pm6xAv1+IDUKyNTAndY1hsaM7022peD+u1gACeTET3njfAPybnVVtiVEN0U0YkgSPQU4dW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2k964NKkVmU5ZTloanrhtbNGL6CvysgL/rUz5sk4lW2N9PaYf
	M8Y0Cqc9VW9yxeUhSukTzsoQ2dpNqHbhXqIYnA1VepjLiXeGg8O6ZXnLjnGMULr1gswzL2q4Pa+
	2ds8Hq3dfOnt64ogtKYK5oK4v/ECVFPDNQYIViUTLSDtQmksyleMTVtFValZVS4fMvlQRXzETq2
	G+cg==
X-Gm-Gg: AZuq6aICrKTHf1Y+nrFaMI3YS+Tutu26DexqFdZsSzd67bmWbqHNjCVo6/x7DyYiDdz
	a9+mdo/Z/SY16b9TOua04ZQqa78BGs9nj1tG8Nm4TKTtiFkw+ykXCkXL7eZgt4Ga9JfSlGvXd2h
	NYNQpuBODnPbdXC84ErjtYjFjzMK+GfB+1tal9A85veotQymDpW5/SzUKsDWpDGXccpg5Ybop3b
	ew8+OOTnU5VST1WA8Mrx1YinFJVzANvoRi5+5fwhuc8m+rgdFE09T0AmDC6pD7FDLaZSaSmtcrs
	Rqi8iZcaLhb6PcV9rNVBPfuEJ8NPkzNBzySc6EE3KkBmKpyPg+xbA7D8FNGL817jqF+o7zkl3Wv
	mJp0q5KbxHJ4gtDBmYo9S59FNgZuudNHQYSKd00v4Y/G5cw==
X-Received: by 2002:a05:620a:46a6:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8cb424e450fmr1482610685a.84.1771319810647;
        Tue, 17 Feb 2026 01:16:50 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8cb424e450fmr1482608785a.84.1771319810122;
        Tue, 17 Feb 2026 01:16:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:16:37 +0100
Subject: [PATCH 2/3] ARM: tegra: defconfig: Drop redundant
 ARCH_TEGRA_foo_SOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-2-81bf5674d032@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9w4zoJ1NaEJJx7ERKQvdQ6eFS6T244uoqWIM4joR9Qc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH7tYIA03JtMS7xsrsGdVsNLg1nYo2XCpkLc
 d0JJYCUgTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx+wAKCRDBN2bmhouD
 11OmD/9uSk5txbCQIdu2j9VFRQ9YglRVFRHqfHcqweyKTNgKz5N7APH85V4aOrhQphKjM8OGuck
 VJPXWnXDMcDTwOuixnS9UKWtbbwFl1pjUZvCbzBxu/qm8h+smcmYCuy0es0deajyH7lDG0b0vDU
 cGV4RXrbYP0x60PhW+07z7WXdsJUdlGLTn5ivLiUaLIL2vSZZUBvmomEL52J+FdM+DszQ6ne7tF
 GMHzdQc7xtDqLcn+XFRGwxWZ+vCxx3Ay/YwUQezRszjBy5WrhwoFMUO0dG94WIM7gGeWFv+S/dS
 /Sr32WSUYzuFyJTwhICmmFGUQLyNMJwebEaV8nCBUAYz12TwGwxtbJoIJduTvu0Id0f64o3A8rP
 3E/T2y5clLKEPhc+3O/zAOaOGrw7hXMIGzOQf0FwgW/EznEJ1LQW+3RykG9UgLVekuvptUNxDvw
 deki9ZGoj45SBFDxkSeTz3HMpWXkX1b8UEix3DCw/2RIYO5O36OIjik9qCnFeDw2mf0aQQsbttL
 D+oFBa80dx7lUiDd6kvbe/xDVMTTQg2YhmmPDKEZP/fcVVpnC8pfVkhgXJwfvU5Tb4BV9j+Eody
 O2yfKRRvFW4E9WCoD2kcflRTE7c+6H0XNBM7ygsV9Ba32Ditk/Z6AGmtMSIxLzeyee4dF418b2H
 GJq7GGHoDhgVaxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfX8NYdCvHIgLlG
 YtETOZFaK0czjU14TGpt/MV7xW4EuBSLOt4AnvT5jYqetGxwSw97dH2/m0lYV4AX7VVZKs1gTee
 WGM8Iit3h+6Kz5HsYWfQP/d/w+yrFKtOkqlHn7vaTStu4uvIEQ52u65I+7XiP3l+07Gr1GShEIt
 oRQuRPCBlj9UY/bOjBckXYfkcRCxE8zxaX2rqtGlcZMKNweRd9Ckkb3PjUEtKuMZ5/J+w7m6aGb
 GSl/ad6n7V6mksBB+UIM9hKx7f5kCeD31C8ESJ7VuitqpgJ6HEQootQWpl4Lq0ZTbdRLdWzjDK/
 lj0fpgkHi7DHNb9KMNtPLZ4ci5d1cEXbW/L9sshh4vU+j5uidUoRW0F/ZJyGEuUCsJjIN1IGvSX
 M3Yme5Xg3APxcy1NevkSn7MjIqSt3bZV0qfH0FHktbc1M16FZguIchUZLN/yr63Vr/6LCUFLv5/
 4GP9q0xC/jFwZhRJeZA==
X-Proofpoint-GUID: O7XDIbcxTqzsBh5si8Iu7d-6HvQ4uQVS
X-Proofpoint-ORIG-GUID: O7XDIbcxTqzsBh5si8Iu7d-6HvQ4uQVS
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69943203 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=4ZDzmxAp3Uojh03Q1XUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_011652_329634_71B98622 
X-CRM114-Status: GOOD (  12.61  )
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

All CONFIG_ARCH_TEGRA_2x_SOC-like symbols are now default for
ARCH_TEGRA, so drop redundant lines from defconfigs.  Tested with
comparing include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the previous pach.
---
 arch/arm/configs/multi_v7_defconfig | 4 ----
 arch/arm/configs/tegra_defconfig    | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c8..0985b8b00689 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1142,10 +1142,6 @@ CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
-CONFIG_ARCH_TEGRA_2x_SOC=y
-CONFIG_ARCH_TEGRA_3x_SOC=y
-CONFIG_ARCH_TEGRA_114_SOC=y
-CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
 CONFIG_KEYSTONE_NAVIGATOR_DMA=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 68aedaf92667..66157e9721ef 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -296,10 +296,6 @@ CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
 CONFIG_TEGRA_IOMMU_SMMU=y
-CONFIG_ARCH_TEGRA_2x_SOC=y
-CONFIG_ARCH_TEGRA_3x_SOC=y
-CONFIG_ARCH_TEGRA_114_SOC=y
-CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_ARM_TEGRA_DEVFREQ=y
 CONFIG_MEMORY=y
 CONFIG_IIO=y

-- 
2.51.0


