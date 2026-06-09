Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C08CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=; b=jKEMtalz9QBKPnF48QUVr1dKqR
	V7T1cdFOjaCQsQdJ8OztniEmGGaBoVnWqTHwkaeeXL8Gj9jHR6DpYyWXV7LpfpnKuh1YkxMeEBoP+
	jDuI2gCSSLR8AhZN2AmPWg34Pnvtwfwxj+h7OGhGzZhFAldAgsi2fRpzHVu+OMmDZPGxhHfRKViAH
	1M4BtaX3ZyVcE2SRN4r6MHVqI0pA8G42jYs9BlCehJSqwt10bJHsbDYZU//NYjvvrs7LL9MRGH+Et
	aW7shgW0XaE+9q+hrsf4FVEax4zzC7mIoX/TzdY27RQcALVi+/ZziBIYAs3Zct4Mx6l653IamFdV+
	t0jFKhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRo-00000005vGr-2QIx;
	Tue, 09 Jun 2026 15:33:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRl-00000005vDf-1Gnx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:32:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmmM62700902
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=; b=Bplrk6K68e8hUO1I
	cDeb1LJ6SG7fIslSAwW3xMowylIS9OX22CGqR8HIN306WKETv7Wps+4eyx/OHorU
	ozv098GLKJQX5W+RJOyysGBidcKsMASHHespZPFaJ291ioOwgcYe7Rn2zMgKechO
	0NeU0WKPElh1PMcBK5rLCA2zb1INfZMiWKiPGUlzJxw4XS+E+aFuJQ8BbOmucrRy
	IwwATNEHkI2VlxevxGMxZsl69D0OtR26/xkbgNVeBSQfJ9fes+phkWoVyBjojOQ6
	GXHISFi42y4eqGuHbTJQXiy+Wp+uf4SrGK22w3Ytm6hFeWNAqLd3Rozgez1Bh0Cy
	0Ur4jg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat7ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:32:56 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6f7f4e47eso8728545a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019175; x=1781623975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=;
        b=Wdic+/AsKnMSppHuXzaDXJUDm64TWoxNesaLBPUHF4Z0UKy7w7Hx7XYnav1bi7Zzoz
         tdVuE0RY29ZximDF9Zmdxdia+tUOIWYIjcAlxQmgmOaZfdNQl1aF3dgzam9Xg5xR6kSM
         w7tS6ok2SqrNZ/MUYC4ZCsHzmEqmidsrXUM6eQ7GoSMi6tE9SxDPpPqtRFCJqU5aE3oG
         OqarRNrp2jhR+LFsKNy7HxSSpVxVc7HCyQ1jBjUA7jiWQXZanptgoawryEsCqzrnD9Cg
         4Mt5IlIyDrirfAPYi9JlmDt/gtiFshR9MxZdKGOhKXi7WwXxky7pRdacd6XSDAEc9Px9
         f4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019175; x=1781623975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=;
        b=faWAEkYI4Hu17Olxd+fTNR4EVVXAfY5PTXo5cg01U68P802Qfvyt/Lx0Oru2Ou5CeI
         7rQ+S8M7F760KD6YP3503YGw8lvdbbh1X+xyhQwXpg4RIx3S/Gqd/zRXfMKk//Vbu7+e
         ku5wqV6Zxujy84x7+NHuVcYuexVIOfeUKcNpvDMQ0uQseT1Vy3D++2x1gVxI5/7VscH+
         Oih0/aIKBMfwyizdOtxOOBrp2s1cQYLCTPGXHn09oapl7Is1hYoA1BpAgz+QsubSfFIQ
         FA7n3Yvr0miCCULgOrpmqzVgif63DDASBKqHTFhzdSmYv6lf7mrUaiYcsrK9dlbv3z8I
         nMJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MOZ6Z6kmv+7Kz31kUie3RBatkx6Ec4wGTzEXuAloJ4FtbTE86accx3TDM7Eu+CoOzSvt6K23s7Xe3K7GoIyiQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0vahr8Dzc1Es8KjF1e+YJODhqG31HBR5pDnUFgkhklIWWvrFw
	VPDPrixhFnZB/8tkO/EQL5QDHw18x0+YvSkLHAtaUU0z3cbjpWbhFFncmMtITNg/eMKFuoY4I2x
	Hn/bfkda83I3CyEUIyWaey5VCoyZ39+i/unm/GxRQEQKgzHIeIsSrOZfddw8Oq16eppxxQdTedF
	GamA==
X-Gm-Gg: Acq92OFq1SeWVAWMzi8Tm0+qhmwMzXyzfOGuzeH9ILMQRc5nrB5rSp1j1SzF7J9AEIj
	TJo2Q8M6tqQVQ7WnZkuh7njj3LKBaT22XFyb/DEDwNyBPoegoJ2uMwuK+SO363yX2bCHm/VYIQf
	lO3MVXZZ/bNWuHBakgTnlV+p1+RTk9YN77iTcVp3RofEEuDSxTfJBEzJX8QrE1y7q4eMCW/2kEx
	ivu0bM7WvAA/7GuAhlskCLM3yrJpgFfvJ9DxuHUerqJ+OqbY278mu4ymA6sgWrJK1aLJeQ3YmBx
	wV5qAvNwlsFRzV7KFH7o37tUm/W/jXHMBL+8+5DyFKJPBWj8qi036JImIhbqALFtaWuSX15hBwd
	X9IimuVJQ66Vev1bSyqFOtmPm4VGeUFLXMTIuOFYwDDFpHPOCJ5I5+rzW
X-Received: by 2002:a05:6830:270e:b0:7e6:1e3c:912 with SMTP id 46e09a7af769-7e70c5c188amr12136451a34.2.1781019175547;
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
X-Received: by 2002:a05:6830:270e:b0:7e6:1e3c:912 with SMTP id 46e09a7af769-7e70c5c188amr12136384a34.2.1781019175057;
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:38 +0200
Subject: [PATCH v2 4/7] clk: qcom: Make important ARM32 drivers default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-4-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5676;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VhUpIZusEDwNFbqFlc2LibIE0jDqP22f5bKnLwzbnmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIY4Pfn5koudJH+mfnjIyKNZEyH+Gskr2Qi/
 Pg35c9Ft1KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGAAKCRDBN2bmhouD
 1z01D/4jmDMsz26CKN+LYCZcjTH9MlvvLWZHkPeGIyVg7AO3D1HCVFsT+DmnU/0xXtHM+k1cZe8
 SXNbAyWF8pDNKPjvDO8bog3jkSsnXua8vrX4NeCaY8coHalKtxA9Pvp9u0qeOEsvXgkPgK7x1jt
 +HwLKGuR8k5GdvyIokFOkZ1VkDH5FY3JC1vdK7tcIfVhc7IIu0CXr5S1Vb52eVgTtLhPPu1DV4e
 qhmnMoYLuVJcFG3slwCQa2KVJPJ6gULSIHAGl+pTI4qYBAo5S23HWS+wJtFg2nADJiTLVwsAa73
 I7G5CmBYeHvC58fwt71/JS9jFU145yd+yGYuFu3oqCHrNnYQTWEPdkVISPH2U0OAX2WWmvhWIUa
 VnXmnlB20QnT2a5/OBa/hW9FtoMLd42wjCml1bTqdkDpoPo9RqSoPlof/f+c3bp8USxLQg1p8rs
 scAUFGx820AREfkY0RHRTQzfrFg01Rk/sumljTn7IvC0BTsskEpDsekuxLcIl+KcbG0A3t14uzd
 eM+dMLNsHfV7ONMQUfrAt45j0xGuLNfaGu58LBkxc30gJOVAeUWxQ6Ztsa2UAwBJ2hexOptFQAr
 WUYqtbHrnWGsYKpo0vbbGMa6WMIUKTpQMtCGyGP0lTMO3+5nfDF++K/vRH9wareKC550NZjqu6V
 xl1Znqdej071O1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: HJAhvBXwPG0TWPhyLIr-nhze7vI-YhOt
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a283228 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nVu6gHFLEUU7Sl8RD4kA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfXzQljqIKiwMYK
 QgLeGxFpWV54QGInpYGBL0/+6HULhgPMr+LmoJOVM7dIXJpbSBd9VrWoODEJTmS2UwundkYYjMC
 aCTXS2L3qSLpMONUg+kHfaCwHkTpLp6R8jI8jS8k+AF919cqM00vcokZx7LqKMLUCBKRD+POChc
 mHmuLPnE2K0aAjzgn2sXUtb/JIJVhE5BtgL081sgFN3D21xoIeLNx4ukYDFDEENlhGe3YGiWMBN
 W4v9siI37hiT+8Z3gqbXfwuQ7nNOctYb5PSPkCS82JaPpLg+WRoYiZUUXAWPmzeJ9jM/kO+AIAD
 GAXU5thaw0pO9pn2RoJA67nhUXwsIg/hh2ZNhnV8pd91F5SenTFBCFov29aL4Yh5aIa7FCuTcZQ
 7XT2B5JOdg+8USPi2hjt1F1rSJpDYoBByXJLVMKI/h+JCAIq0+GT+fUMxQd/+c2zDEe2V6W6PhD
 THxJRvWorK9c095eqJw==
X-Proofpoint-GUID: HJAhvBXwPG0TWPhyLIr-nhze7vI-YhOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_083257_520761_9CE4E123 
X-CRM114-Status: GOOD (  17.84  )
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

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Switch all Qualcomm clock controller drivers which are chosen in
ARM 32-bit qcom defconfig to a default 'yes'.

This has no impact on ARM32 qcom defconfig and ARM64 defconfig
include/generated/autoconf.h, however enables a few drivers for ARM32
multi_v7 defconfig: IPQ_GCC_4019, QCOM_CLK_APCS_SDX55, MSM_LCC_8960,
SDX_GCC_55, QCOM_CLK_RPMH as module, IPQ_GCC_806X, IPQ_LCC_806X and
QCOM_A7PLL.  Enabling these on multi_v7 is expected to properly boot
these SoCs with defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d8281ed68dc5..ed969553649c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -249,6 +249,7 @@ config QCOM_A53PLL
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -280,6 +281,7 @@ config QCOM_CLK_APCS_SDX55
 	tristate "SDX55 and SDX65 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -289,6 +291,7 @@ config QCOM_CLK_APCS_SDX55
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -341,6 +344,7 @@ config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8084 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -351,6 +355,7 @@ config APQ_MMCC_8084
 	depends on ARM || COMPILE_TEST
 	select APQ_GCC_8084
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on apq8084 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -402,6 +407,7 @@ config IPQ_CMN_PLL
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -456,6 +462,7 @@ config IPQ_GCC_6018
 config IPQ_GCC_806X
 	tristate "IPQ806x Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq806x devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -465,6 +472,7 @@ config IPQ_LCC_806X
 	tristate "IPQ806x LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select IPQ_GCC_806X
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on ipq806x devices.
 	  Say Y if you want to use audio devices such as i2s, pcm,
@@ -533,6 +541,7 @@ config IPQ_NSSCC_QCA8K
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -577,6 +586,7 @@ config MSM_GCC_8939
 config MSM_GCC_8960
 	tristate "APQ8064/MSM8960 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8064/msm8960 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -585,6 +595,7 @@ config MSM_GCC_8960
 config MSM_LCC_8960
 	tristate "APQ8064/MSM8960/MDM9650 LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on apq8064/msm8960/mdm9650
 	  devices.
@@ -611,6 +622,7 @@ config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8960
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8960 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -629,6 +641,7 @@ config MSM_GCC_8974
 	tristate "MSM8974 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8974 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -639,6 +652,7 @@ config MSM_MMCC_8974
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8974
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8974 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1212,6 +1226,7 @@ config SDX_GCC_55
 	tristate "SDX55 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDX55 devices.
 	  Say Y if you want to use peripheral devices such as UART,

-- 
2.53.0


