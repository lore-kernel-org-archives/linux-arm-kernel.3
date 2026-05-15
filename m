Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD339CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCOsasDawVrQWTPiXvcD18NlLj9WtkVfANzKNJcSpDo=; b=wdCj3SZPq+FabzpiU1r1OU5lOg
	8J1vTm5duqYPDyO/l5dD9xnMFyLUSOWWekLJsD6qB0omkeUoBwQffVIMjOKmzbFg+XbI1T1XtG1Ua
	/vw9XYqR/9LD8T0Q5pZOFAkt5XaDHKWx67UKAuoEutdCseh5efDLmI/0SEBisyVOql4ZJCY8hKvnR
	5UsFAWE8cseSgh+7gHpfXu4CKPoPaCqaFNBZmOupGdGVX7R71SvVeYkQn8MuqRTJF3GiQ47fRrlbP
	r5N0NQ/JRflJ0GzdXC1aFN23+G+9O6NAkXvY/Jq9SiuGmIKD5DzeKwvffgqAey8BNFenkCjjWfF21
	UZltschg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrOH-00000008Hzt-1IKu;
	Fri, 15 May 2026 12:11:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrOE-00000008HyU-0eKv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:11:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9HdSe1714936
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCOsasDawVrQWTPiXvcD18NlLj9WtkVfANzKNJcSpDo=; b=VTwNQOrH4Kk3NVgs
	0d2RqxG3C/G6x9OVPpT3fxbDJDlWAPeYtzXCGDKVXoUjnJpj0qDf/4Z3hb3vOa3G
	+vMSpCCkYrfvfUy5m+nGVKyAO1uI7jVeUH7KrynWqMCuiOhvF0tmbCCkZy4GIliv
	a/LrXMXb3TvH3erKClXHf99eLgVAkmE0V6a56PJjHodbcitcVVkFy8oC4lOlSIlo
	fvSOcCGJ7IXquRW5mkZCyglQQGjR7p+nnMwMAAdVNXuaEdPHhKN0+6vUqZiTPRPi
	gD00rf1kxyg16AWfiBH+cNtDtKOddEj665e4I1QtdAcalC2dMlNz6bhdEYDfhcvM
	WZLbyg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsxwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313c9d983fso220057137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847096; x=1779451896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCOsasDawVrQWTPiXvcD18NlLj9WtkVfANzKNJcSpDo=;
        b=FukPMGlZk3DJUAZWk1FQ4flYZxfw1hbENM7MuM8cHq5imKZFRZY8tH4NIPVVHvCtiB
         ogrXcCUAVIoOoXsa9KgvB8sO95LP87eG1h22dmMijcxOw42jwE3zqvwT/+7+MsZ0eNd7
         w8yogWoy2qyq9cHv3ZYlhimhzRGYQuHqUOZfJiZOG+q7gRO3gVqCnled03c/Bz4XWDoI
         ULKe4JM5L761Bzot3Qfoym1mZ2IWSyJuzhzKl+mE9EnKCYHgLtIE7PnLY8UpuAcWgrVU
         8imVVmAI1lF58RbIWY+w5Jy0VYDMcnwaC5r8kdjZnK4T1w5zNDnX88P93drVOaaxtfxn
         ksVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847096; x=1779451896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oCOsasDawVrQWTPiXvcD18NlLj9WtkVfANzKNJcSpDo=;
        b=i/F8PfVb2xDZS4jH8DqHAgTErlB5BAKl5ky4KMSs44o5imbc1y9vRbce6w/3SqG1zS
         D2KLIWWSF3yPM4K0PF5rymp85BxN5oZrfHPAHsLb3cHSfnMEa+icyWmSXI5Ak7EoDHWm
         GrykV/dEz1vL7B9L2zn3yRoUIhTcrVePDZ6Sw8r1kyueCkqIYBp3YZzjEITRfH2jGxpj
         K84X829934MTRyaU71M4nNb51JP8WhZlr0EbpDzD87U5t+9oPLdvEQcuEnxG4nI+I6uQ
         XkChnP2KwQGzFljovsOK4eQAvsbReEe8K9sAms4FC+fTx2xDbc5T2cWAAAPP/lP3FO8M
         SMPA==
X-Forwarded-Encrypted: i=1; AFNElJ/QPLTGP2SF62tmennlZDmZ4bypVoHEMrva89nPSBzf2lKihaLgnK+luQQkgiwKckr++jllzzBYswiR4+tm64OO@lists.infradead.org
X-Gm-Message-State: AOJu0YyumUl4VMUKTgqcZju8rRSajRj5dUeU3jc7T3kcQU1JQ4HkeBqz
	igVMZnWJt2OVt8GmTYnpd9vOT/PG0TpuZQlTprLls9FPtzZp22PJzfFtuNC1kVwXHijl/138h94
	uLsurcWtzgUiwKwSMzCydPGxqK5rL2qdL+9p6tqke8WOk24t9jYScSgaaNH3wNP5zN24SO4a1YN
	y51qQDlTo4KA==
X-Gm-Gg: Acq92OGUQwsZrjGcuctI77QgiBd3zzFwJRL65HFQR5iLJWLjOQpK5aAqUL32XwOJMcg
	9r0plzBQf/osBjJo8LVXqMRH/YFasQr2wHFtcy9Pk74ZaRrOVobwWPZjuSwpqNDjtCsXGYYwKQq
	uBHU41cMjkdj4DSbsg+uHIgztKOTgOINkLbCpJgiXuqeZJWmpQWBot/VvtB2IVjfQdb26zH7Hch
	eHGSclXkroiLHw5fIjnq6S147lw3I5O+4kwzDNwoNvpMp5OdWpC2A1ZkIlEqTRU2Y8YNP3uEUar
	zBPmRYMKGcaW9ICxAsRmhTx+7WrMJ629IsUnCMc/GUcLwnCrdbVflCnYy8zR5tNvJB80Zf7cHky
	ddZkVDzSX5AIE86N6TjUrVQ/Qu5z+e1lguwk5PLHAkRSy
X-Received: by 2002:a05:6102:2921:b0:632:4af0:4133 with SMTP id ada2fe7eead31-63a3f391c51mr1405369137.18.1778847093337;
        Fri, 15 May 2026 05:11:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2921:b0:632:4af0:4133 with SMTP id ada2fe7eead31-63a3f391c51mr1404828137.18.1778847087687;
        Fri, 15 May 2026 05:11:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm66855685e9.7.2026.05.15.05.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:11:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:11:08 +0200
Subject: [PATCH v2 3/3] interconnect: qcom: Make important drivers default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-interconnect-qcom-clean-arm64-v2-3-adeebc73596d@oss.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15234;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gdrFliH4JwIF1pRuxXj/l2fpx4b/l4K4qaME/RKYJRo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqBw1oSXOkSwek4fb7EvXHEX+nW7kvbBLQg9+nr
 a7AjGYiDRWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagcNaAAKCRDBN2bmhouD
 17V3D/4oE4jPewYRq1H0L4yL6Vsaqf+0LhQnAuoTwtkIt2KlvhZd04wVzKvst8RexjXCcH01efn
 uFEdJ0ETly3GsDt0QPK5DTyB6DtoHJDS8Q1ZRO2D5QP9Mi91rEuBs71823B9eR1nBc/gLJFTnfI
 iX71DE7d1gYx9N4z5Yc4tKJ1D5tuiKeIEh37Wi7qOGGz/3xxibP44KSpP5jBEgfDacTbVXbMRVb
 B9LF/kVYxPpL/Qah916WXmyTfBU4Qx+iW02fxBeMCM3W8B/iWeHct3x9bFsEZ8ZzHr0Wqzu28GF
 05wUBywdxht6gpzfyc0Rxlif4DGIS6o2BmOLdFk8v93I527ePIrO4i/9QVz86500yPrvmeIPmdT
 IABn0cKVdfVH1p9C4wNjxy005Tt1bOU86Z4vS7YCHi95qsrLuLMQDAok8kVovScjZbO65PQkDML
 XJ3tDs/liMPK63Llehyj1ZJ03C/Lxv3/keR40cgDbWkIKNoNSe/Zyej0PlUl9w9u37C9oad9sBI
 PpjyKruN8xjwbRoG0MN2y7HoyEza6i7Zm4YuUEDj2rdeRlBkrCyse//8lj4u67ZgubDeH9sJehw
 oYK01tCBCcb9daEsjvRKrm7kuZkPiK9kFDpl29azOGMXsoJG8ymQw7el9/1jQ0Pib5Nvlq29sOu
 UZ/h0sDMhAQCyyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a070d79 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=O8YRFC0p4ozDlASnGw0A:9 a=-wcPzy_K7TQbbHLX:21
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: P0iGmpXL_Sh-8nZ7RJPJAte0FpglKTON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX9pxnXabnhQaQ
 Zh5ndO5lZx/Y0q/ecxuwFNzFI29jrr3FJVBqSsa7nVl3aQ8CsTFWb+FevMPwEL40yo3B3Ho6EgB
 3FGU82w9buLQokRbWxMFZoA4DOA8cP1TZd4zzSXC3QryADjeF9EorPyMiu2nk0Zdk0+Rg28K+gc
 sJ1bEb4LrJVTxwLMfa1rEwkThAcyCvpAnHygJPmQtYqMHueAEyeJ1PAqUNNgkB9KfNhPbyOnfVu
 LPRG40uQLirv5bQCtbOkKnaokxxeLpoY0xlyVVmsvXfS9rX9AWYsXnFrSGiUvgjo83DgtAUbgfq
 LaSjCdGfIn4TlxLZNnA2j89kJCsKNyEz6kKR/SY0UmcQ43A97cGa9co1dDPk9BevzJPrA96P0Jx
 0SiwI0qgRTL0YpZlwluztZ+2xqgDzDScDNf7gdgoTR6hlCx5qJP67am2ohHArvlcO1rsGZ25IeD
 OZHEbvKkvh9PhpAGb8w==
X-Proofpoint-GUID: P0iGmpXL_Sh-8nZ7RJPJAte0FpglKTON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_051138_216394_9E96B1B3 
X-CRM114-Status: GOOD (  19.73  )
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

The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
basic or fundamental SoC feature: bandwidth management between internal
SoC blocks.  SoC can boot without these, but power management or
performance will be affected.  These drivers do not represent any sort
of buses visible to the board designers/configurators, thus they should
be always enabled, regardless how SoC is used in the final board.

Kernel configuration should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all almost Qualcomm interconnect drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig:
   a. Enable as built-in INTERCONNECT_QCOM_SDM660,
      INTERCONNECT_QCOM_SDM670, INTERCONNECT_QCOM_SM7150 and
      INTERCONNECT_QCOM_SAR2130P, which were not selected before but
      should be, because these platforms need them anyway for proper
      functioning.

   b. Switch to built-in from a module INTERCONNECT_QCOM_QCS404 and
      INTERCONNECT_QCOM_MSM8916, which as modules would not make the
      platform bootable in most cases, and INTERCONNECT_QCOM_OSM_L3,
      which when module might slow down boot considerably by having
      caches running at slow speed.

2. arm qcom_defconfig: Switch to built-in from a module
   INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_SMD_RPM,
   INTERCONNECT_QCOM_BCM_VOTER, INTERCONNECT_QCOM_MSM8974,
   INTERCONNECT_QCOM_SDX55, which as modules would not make the
   platform bootable in most cases.

3. arm multi_v7 defconfig: Enable drivers necessary to boot
   ARM 32-bit platforms, which are already enabled on qcom_defconfig:

   a. Enable as built-in INTERCONNECT_QCOM_MSM8974.
   b. Enable as modules (other dependencies prevent from built-in)
      INTERCONNECT_QCOM_RPMH, INTERCONNECT_QCOM_BCM_VOTER and
      INTERCONNECT_QCOM_SDX55.

4. COMPILE_TEST builds: Enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I propose the change to go via interconnect tree.  It might conflict
around defconfigs, though.
---
 arch/arm/configs/qcom_defconfig   |  3 ---
 arch/arm64/configs/defconfig      | 31 -------------------------------
 drivers/interconnect/qcom/Kconfig | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 03309b89ea4c..451f2c4cec55 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -271,9 +271,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e5f1901ee408..4909a8824ec8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1848,37 +1848,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_STM32_TIMER_CNT=m
diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index b2c4272ae48f..dd3ef920a16a 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -2,6 +2,7 @@
 config INTERCONNECT_QCOM
 	tristate "Qualcomm Network-on-Chip interconnect drivers"
 	depends on ARCH_QCOM
+	default ARCH_QCOM
 	help
 	  Support for Qualcomm's Network-on-Chip interconnect hardware.
 
@@ -14,6 +15,7 @@ config INTERCONNECT_QCOM_ELIZA
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
 	  platforms.
@@ -24,6 +26,7 @@ config INTERCONNECT_QCOM_GLYMUR
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
 	  platforms.
@@ -34,6 +37,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on kaanapali-based
 	  platforms.
@@ -53,6 +57,7 @@ config INTERCONNECT_QCOM_MSM8916
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM if ARM64
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8916-based
 	  platforms.
@@ -81,6 +86,7 @@ config INTERCONNECT_QCOM_MSM8953
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
 	  platforms.
@@ -91,6 +97,7 @@ config INTERCONNECT_QCOM_MSM8974
 	depends on QCOM_SMD_RPM
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
 	 platforms.
@@ -111,6 +118,7 @@ config INTERCONNECT_QCOM_MSM8996
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
 	  platforms.
@@ -119,6 +127,7 @@ config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -129,6 +138,7 @@ config INTERCONNECT_QCOM_QCM2290
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
 	  platforms.
@@ -139,6 +149,7 @@ config INTERCONNECT_QCOM_QCS404
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
 	  platforms.
@@ -149,6 +160,7 @@ config INTERCONNECT_QCOM_QCS615
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs615-based
 	  platforms.
@@ -159,6 +171,7 @@ config INTERCONNECT_QCOM_QCS8300
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Technologies, Inc. Network-on-Chip
 	  on QCS8300-based platforms. The interconnect provider collects and
@@ -171,6 +184,7 @@ config INTERCONNECT_QCOM_QDU1000
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on QDU1000-based
 	  and QRU1000-based platforms.
@@ -195,6 +209,7 @@ config INTERCONNECT_QCOM_SA8775P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sa8775p-based
 	  platforms.
@@ -205,6 +220,7 @@ config INTERCONNECT_QCOM_SAR2130P
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SAR2130P-based
 	  platforms.
@@ -215,6 +231,7 @@ config INTERCONNECT_QCOM_SC7180
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7180-based
 	  platforms.
@@ -225,6 +242,7 @@ config INTERCONNECT_QCOM_SC7280
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc7280-based
 	  platforms.
@@ -235,6 +253,7 @@ config INTERCONNECT_QCOM_SC8180X
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sc8180x-based
 	  platforms.
@@ -245,6 +264,7 @@ config INTERCONNECT_QCOM_SC8280XP
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SC8280XP-based
 	  platforms.
@@ -255,6 +275,7 @@ config INTERCONNECT_QCOM_SDM660
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm660-based
 	  platforms.
@@ -265,6 +286,7 @@ config INTERCONNECT_QCOM_SDM670
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm670-based
 	  platforms.
@@ -275,6 +297,7 @@ config INTERCONNECT_QCOM_SDM845
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdm845-based
 	  platforms.
@@ -285,6 +308,7 @@ config INTERCONNECT_QCOM_SDX55
 	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx55-based
 	  platforms.
@@ -305,6 +329,7 @@ config INTERCONNECT_QCOM_SDX75
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sdx75-based
 	  platforms.
@@ -315,6 +340,7 @@ config INTERCONNECT_QCOM_SM6115
 	depends on QCOM_SMD_RPM
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
 	  platforms.
@@ -325,6 +351,7 @@ config INTERCONNECT_QCOM_SM6350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6350-based
 	  platforms.
@@ -335,6 +362,7 @@ config INTERCONNECT_QCOM_SM7150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm7150-based
 	  platforms.
@@ -345,6 +373,7 @@ config INTERCONNECT_QCOM_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on Milos-based
 	  platforms.
@@ -355,6 +384,7 @@ config INTERCONNECT_QCOM_SM8150
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8150-based
 	  platforms.
@@ -365,6 +395,7 @@ config INTERCONNECT_QCOM_SM8250
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm8250-based
 	  platforms.
@@ -375,6 +406,7 @@ config INTERCONNECT_QCOM_SM8350
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8350-based
 	  platforms.
@@ -385,6 +417,7 @@ config INTERCONNECT_QCOM_SM8450
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8450-based
 	  platforms.
@@ -395,6 +428,7 @@ config INTERCONNECT_QCOM_SM8550
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8550-based
 	  platforms.
@@ -405,6 +439,7 @@ config INTERCONNECT_QCOM_SM8650
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8650-based
 	  platforms.
@@ -415,6 +450,7 @@ config INTERCONNECT_QCOM_SM8750
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on SM8750-based
 	  platforms.
@@ -425,6 +461,7 @@ config INTERCONNECT_QCOM_X1E80100
 	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
+	default ARCH_QCOM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on X1E80100-based
 	  platforms.

-- 
2.51.0


