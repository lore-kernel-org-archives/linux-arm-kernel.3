Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112B7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qO4/MlQ+euAcocjybqZdlbu5PsUJFB1R7sp8HV1RevE=; b=d9K+nraMa8xw7QXBc0wf09K/yk
	uFB46gyBzB3zcMso784A9Vm8TicU/v9vSr8QMnX5OK6xrsnXWHUJviFFJXlHU8UpmvH+AoGVfHjH4
	ykVzy3XtBDWVprQjFkq2KfZnclFLcpiVOlSzIGn3mr+RFkZBtS3lGTiByhEyzLjXctwB02pfMB1wA
	tCE3vmP9y8A8N4onuIZ0ktWORDdNMdBVl44DNb0GyTxw2L+SYRVtMZZOQKNv+2ISzB1VL80LGfjFT
	NVsmEPN1RGRgB1eeVLzuqe6HUNZ3Nf6GJ5iGVF+qFtXAAkRxHkSg50IcFH/w/GKbjp5X+mNxe5oWl
	aDC55Kow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXhz-00000006ZWT-15r7;
	Sat, 11 Jul 2026 13:25:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXhw-00000006ZVw-30Qm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 13:25:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnONo3434182
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qO4/MlQ+euAcocjybqZdlbu5PsUJFB1R7sp8HV1RevE=; b=d3OBOZAkxamoVwOX
	KAvo/y9f+5d3TGQyOT4aCiploATnCnZbxohh2tDBPdSXYcH5c+NYPoKK/5eoBtFv
	ndz0ejIPO3mshYgIt/++XbtvfRMW9St7cKT2Kr6a67upO0rVr+9bchh14cNxoI0M
	IiX2voXB1vHwjf0lctKikTD0SoYgGDgNF3t9Yc/FornK+yCAhJ9PzgF//yHpiVJc
	/6w/7/q9hm9rOuzlsUaAj6LU2i0bziaDPb5dBu69e4/SJGbrLCHYjUevimPgHzqm
	hCyiBlnsKT7CsblEqaYNS8DW6TqbuR+JvSzQ0EwjlLTMf3JwDAj4VCbaQ5R2fTyu
	4itHbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0ggs2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so23825001cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 06:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776327; x=1784381127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qO4/MlQ+euAcocjybqZdlbu5PsUJFB1R7sp8HV1RevE=;
        b=cSJuGBJg0hlAjXUL9rz4Li4EpurLYkXjCwTbOWhGOD7RCYjbDRncbbeg8TDzGkCGm1
         oFAPLAp9ZRMQkGPb+faZHTtL4naP7u3Nph4IDYWDsMXKp9CoRpAX1/aGcyKClb5vnz8Y
         8Rqki0clbqXlxAHPFB3lT94XOO8dQBGzTDcKaEWFyWoqWYPS46YIHtxfnnQ94AUnjXbE
         y1nDbq2+NMFlRfO95etzsgjj1smRVJvWsF7JE6LrtrtdgO3OI3BEzzydx+Cf/m+srTlg
         gllIWoxChfbUD4J38pDcY9D4lJiCBAPqd+XHjJKyghP5eWR20N1uJL3F42KrUODwrwro
         NTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776327; x=1784381127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qO4/MlQ+euAcocjybqZdlbu5PsUJFB1R7sp8HV1RevE=;
        b=AL4GbSix55kAR1bHmJR5B6VoxxG37aPybKBA0ggAdCmAx41xtFymQ0CAh37qDFFCeT
         YEB84miIPEAlR/G9aJfq9vpGHyU/sNkaISjKLwGFSQkgjCb+QZ54twqhVbPaAocobMGA
         avGg88LJZJLwGNkIFH3s9Gswumfc7+b+jeTOHTRKBmp5KKW9L0mYzePSiX4kbWJAkXdH
         6HIELTKY4hy0KBiiZbWcd/6taSjK9gFeqTQeeJQivW278vl6r8Yn02+Pyewts8epmk6y
         M5ONN12tmM4/aK5p07EDOK0jYEWtfysuXaWaEzRPzW8NdU+OBwbonCpYu2/0SSryJ3yk
         buSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro00j364v5gj//4IGNleVuUd5W5kGNLC660B96OmJ9TAqu518+zKgtH29tVjl2Ps/XeG+iP697UrPEnay+DmYjT@lists.infradead.org
X-Gm-Message-State: AOJu0YytcETN5/k45cMJk0WDWYP+ONR2WvCNQBpnnX021kr9VIsPCu7j
	CHnvZlynRUdQZr2MJsrdsx8qtyLQME7aRFgnBrIQVGAjNU5Vx4AJbFlchAhoZhhj63d7kyJmUmv
	CKB25SdqqFhodDD3vEVAHlLMy424J2P4sbduk3x5m4Ezdo4qn4Vm5YHn+aI2m2Su8ALOdcNATFT
	fDPQ==
X-Gm-Gg: AfdE7cmjpFdP927YPWZu8KsaFRSYshY8AlA81utT36ywtUcoAn1wPwGidlGi2+K3hV0
	0dI7KHcjgNdBGaIMSWdCzgNkTaZswI6mYq2a93jnra9ya5aolNNYeHDMncQnMcu+8jf9aTkllia
	JAnujV4PkTrrLPk2WaGURZDh9IWMgZW78vl+MR8fg19RhehSXQidM1cK911HsN02sA69l5o7+7Q
	4qAXS+pj1ZI93M9XlWAX1vomdiflbRQ8DM7p7vLeq8b5u+CkRrdFx8u4+tToMWzzZdBiBE0HwWr
	H+Zmo5NJg7BFoXk2cqJDg8DObf9lmVoSBRRXUsVa2OxXcS+2g1ZJkjb++gmWJo+P5ZXhZuM15On
	Sf+C/kpCJHro0JJW39xRue/+gdPaFTO6+UD4=
X-Received: by 2002:a05:622a:1f19:b0:517:71d2:37d2 with SMTP id d75a77b69052e-51cbed6d58bmr27295581cf.0.1783776326982;
        Sat, 11 Jul 2026 06:25:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1f19:b0:517:71d2:37d2 with SMTP id d75a77b69052e-51cbed6d58bmr27295261cf.0.1783776326495;
        Sat, 11 Jul 2026 06:25:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:01 +0200
Subject: [PATCH v2 1/5] soc: qcom: Hide all drivers behind selectable menu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7919;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NoJcwEis72oH0kak4TSjKdV5nUFDbSD+wWlJMFBu7uE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQyk3HT92RW27YgZjJ+Si87K+3th3hgYZKKi
 aP103Ja1yGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJEMgAKCRDBN2bmhouD
 1xAMD/963LwJHOeZmAjdYnLN/xSxZzKoas0w0NJPPrn+1XSojez+1IhRnEoi/e/Q58xz+ltCY54
 z8aTV/T8edkCE64CuTKjoU98b+o2IZaMgZpMlCZsz31zqpxUHv6yAJoHjpG6JngxqhOXS12dO9m
 2InSlh1x9srwQg490ux35XlUKmXMO1s8io6WPUPwP5lHXQGRebi9oU+jzazdZEgkW9ZV1g28ugB
 9VJqzwsPyMCRUIlQdDEd3cRSi//al9RAcXoundkrgZdPi2MctSBRjY8mhMrN/5JYePTlJZli6FZ
 cSCpYKPElAekH3D3Sdzw9P7MgJeRSQT88Qw3oevoJSFWo+IcZjzyy1Fw1YEw32Tl/mWh18Yj6I8
 omCyor1S0XFSq4LCuPvtpM/SMGMsCtlKtl3chU4sVnUkfyNXb3xfsP+CQMUSqsQKVlL5Qg+ZvL4
 mYULlRdFDMXxqjo/TJV2i+puSqb6y5jFtyV6CO30emr2OONvhmuU1LnB1EHaW92TsRa7NeD+cAp
 NeJmh0cB3hxB86OTPbzWurXjMZ8pvsaSSpmF4EVMfOoNtw+xHib8Bo2iEhF1RMH+jWqCRIawXDf
 pKy1L7Wtjdlv1OajWheC7d68S/QNRmwZ5B5vKBC7nz7R3rMGHRJjiSJDPrIJDtcjVXoH9jjTRCP
 i8i/9YyUcgoYVdQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a524448 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6WWCBr2p4RQoEn8978QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RXwVDzk2JkS0L1i6i2Eg3nqvgr5u1fw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfXybPXQgLyexv8
 28jSupCDOJJ4g89Tyb9Sgszcp1ePaqDWLAWZcC1iGkC9dBXPz0N03e4BP31v3oaDfG4cr/OniaF
 gR0NSUPjBRA0FVssukrXyY77i89asDs03QmqINE6VVnKYN12O/nD1ldyQQD2OdUao3MWkXN0a5q
 L/L0FoT2IItanRW1jVXtI6JlBKVoxT/9HhJJSkG+VkMgqN3nbFWpwwPCocEuRFJRo9FK1MgcWQk
 uvljljZwzQbItBrpfzXb/avHYGGooMpl8+sE8l6JVION+114wNSxbPW8+HmiqVdbvtil6AWhvyW
 fz9N0fB9IoMc/ixWcsZiTTqgIq5MKkKcFT1bbpSlAj6BaA6IeILL20TZCbdVLUVrOT+Oh8YR3iA
 SLolrkJAoPt5rq4Rjsax+5H7y+RXnU+b/m0iG378I56ygLrg5LPiKeeneF9jWfakVTEGejlYgzR
 CMOJ/FYyzG+cqzs8FSQ==
X-Proofpoint-GUID: RXwVDzk2JkS0L1i6i2Eg3nqvgr5u1fw1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX2JEwaibRATl4
 OIjHrUEQAstiXvzyIoFPH44VvJdkducb6+FqkxRY/H1BS6WCwmijDgVm4HOgsuIgJW2+FMY4WTN
 NjS1RsJRguQoXxEmUfLeElb1015/q6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_062528_800893_7C765770 
X-CRM114-Status: GOOD (  21.88  )
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

Switch from a simple menu to menuconfig, so all Qualcomm SoC drivers
will be under one selectable option, allowing to disable them all which
should make kernel configuration easier when preparing a non-Qualcomm
kernel.

This has few benefits (functional impact of this commit):

1. Allow compile testing of QCOM_OCMEM, which previously required
   ARCH_QCOM.

2. Hide behind ARCH_QCOM or COMPILE_TEST drivers specific to Qualcomm
   which should not be available to other kernel builds:
   QCOM_PMIC_PDCHARGER_ULOG, QCOM_PMIC_GLINK, QCOM_SPM and QCOM_PBS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Hide also QCOM_KRYO_L2_ACCESSORS
---
 drivers/soc/qcom/Kconfig | 82 +++++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index f6970431d07d..f3d9c9d776e5 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -2,11 +2,21 @@
 #
 # QCOM Soc drivers
 #
-menu "Qualcomm SoC drivers"
+menuconfig QCOM_SOC
+	bool "Qualcomm SoC drivers"
+	depends on ARCH_QCOM || COMPILE_TEST
+	default ARCH_QCOM
+	help
+	  This collection of drivers is specific to Qualcomm System-on-Chips
+	  and most of them are necessary for a fully functional boot of the
+	  Linux kernel (plus a few debugging drivers).
+	  Drivers can be skipped when building Linux kernel not intended to run
+	  said processors.
+
+if QCOM_SOC
 
 config QCOM_AOSS_QMP
 	tristate "Qualcomm AOSS Driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
 	depends on COMMON_CLK && PM
 	select PM_GENERIC_DOMAINS
@@ -18,7 +28,6 @@ config QCOM_AOSS_QMP
 
 config QCOM_COMMAND_DB
 	tristate "Qualcomm Command DB"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on OF_RESERVED_MEM
 	help
 	  Command DB queries shared memory by key string for shared system
@@ -28,7 +37,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -37,7 +45,6 @@ config QCOM_GENI_SE
 
 config QCOM_GSBI
 	tristate "Qualcomm General Serial Bus Interface"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -46,7 +53,6 @@ config QCOM_GSBI
 
 config QCOM_LLCC
 	tristate "Qualcomm LLCC driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Qualcomm Technologies, Inc. platform specific
@@ -54,17 +60,8 @@ config QCOM_LLCC
 	  SDM845. This provides interfaces to clients that use the LLCC.
 	  Say yes here to enable LLCC slice driver.
 
-config QCOM_KRYO_L2_ACCESSORS
-	bool
-	depends on (ARCH_QCOM || COMPILE_TEST) && ARM64
-
-config QCOM_MDT_LOADER
-	tristate
-	select QCOM_SCM
-
 config QCOM_OCMEM
 	tristate "Qualcomm On Chip Memory (OCMEM) driver"
-	depends on ARCH_QCOM
 	select QCOM_SCM
 	help
 	  The On Chip Memory (OCMEM) allocator allows various clients to
@@ -77,7 +74,7 @@ config QCOM_PD_MAPPER
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_MSG
 	select AUXILIARY_BUS
-	depends on NET && QRTR && (ARCH_QCOM || COMPILE_TEST)
+	depends on NET && QRTR
 	default QCOM_RPROC_COMMON
 	help
 	  The Protection Domain Mapper maps registered services to the domains
@@ -85,12 +82,6 @@ config QCOM_PD_MAPPER
 	  implementation of the service. It is a simpler alternative to the
 	  userspace daemon.
 
-config QCOM_PDR_HELPERS
-	tristate
-	select QCOM_QMI_HELPERS
-	select QCOM_PDR_MSG
-	depends on NET
-
 config QCOM_PDR_MSG
 	tristate
 
@@ -124,13 +115,8 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
-config QCOM_QMI_HELPERS
-	tristate
-	depends on NET
-
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  The Ramp Controller is used to program the sequence ID for pulse
 	  swallowing, enable sequence and link sequence IDs for the CPU
@@ -139,7 +125,6 @@ config QCOM_RAMP_CTRL
 
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
@@ -151,7 +136,6 @@ config QCOM_RMTFS_MEM
 
 config QCOM_RPM_MASTER_STATS
 	tristate "Qualcomm RPM Master stats"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  The RPM Master sleep stats driver provides detailed per-subsystem
 	  sleep/wake data, read from the RPM message RAM. It can be used to
@@ -162,7 +146,6 @@ config QCOM_RPM_MASTER_STATS
 
 config QCOM_RPMH
 	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on (QCOM_COMMAND_DB || !QCOM_COMMAND_DB)
 	help
 	  Support for communication with the hardened-RPM blocks in
@@ -173,7 +156,6 @@ config QCOM_RPMH
 
 config QCOM_SMEM
 	tristate "Qualcomm Shared Memory Manager (SMEM)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HWSPINLOCK
 	help
 	  Say y here to enable support for the Qualcomm Shared Memory Manager.
@@ -182,7 +164,6 @@ config QCOM_SMEM
 
 config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	help
@@ -229,7 +210,6 @@ config QCOM_SOCINFO
 
 config QCOM_SPM
 	tristate "Qualcomm Subsystem Power Manager (SPM)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  Enable the support for the Qualcomm Subsystem Power Manager, used
@@ -238,7 +218,7 @@ config QCOM_SPM
 
 config QCOM_STATS
 	tristate "Qualcomm Sleep stats driver"
-	depends on (ARCH_QCOM && DEBUG_FS) || COMPILE_TEST
+	depends on DEBUG_FS || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	help
@@ -249,7 +229,6 @@ config QCOM_STATS
 
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	help
 	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
@@ -257,7 +236,6 @@ config QCOM_WCNSS_CTRL
 
 config QCOM_APR
 	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	depends on NET
 	select QCOM_PDR_HELPERS
@@ -269,7 +247,6 @@ config QCOM_APR
 
 config QCOM_ICC_BWMON
 	tristate "Qualcomm Interconnect Bandwidth Monitor driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
 	help
@@ -282,10 +259,6 @@ config QCOM_ICC_BWMON
 	  the fixed bandwidth votes from cpufreq (CPU nodes) thus achieve high
 	  memory throughput even with lower CPU frequencies.
 
-config QCOM_INLINE_CRYPTO_ENGINE
-	tristate
-	select QCOM_SCM
-
 config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm PMICs"
 	depends on SPMI
@@ -295,7 +268,32 @@ config QCOM_PBS
 	  This module provides the APIs to the client drivers that wants to send the
 	  PBS trigger event to the PBS RAM.
 
-endmenu
+endif
+
+# Options selected by other drivers from different subsystems must be outside
+# of the menuconfig if-block:
+
+config QCOM_INLINE_CRYPTO_ENGINE
+	tristate
+	select QCOM_SCM
+
+config QCOM_KRYO_L2_ACCESSORS
+	bool
+	depends on ARM64
+
+config QCOM_MDT_LOADER
+	tristate
+	select QCOM_SCM
+
+config QCOM_PDR_HELPERS
+	tristate
+	select QCOM_QMI_HELPERS
+	select QCOM_PDR_MSG
+	depends on NET
+
+config QCOM_QMI_HELPERS
+	tristate
+	depends on NET
 
 config QCOM_UBWC_CONFIG
 	tristate

-- 
2.53.0


