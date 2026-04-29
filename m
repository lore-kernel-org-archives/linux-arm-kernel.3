Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0E3FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwSQ0VZA7av014duirYVDBBsW8ydQ2V2bYKdiM2Oq0M=; b=D5f5iYnMtHk+esqR/y8psFGEvz
	Nk9hiBeQwdCJLUKK8kGuQ/yZbDgdvROzr8ONzq1z4wAGdIQxVrROngN1P6b1Y4RgbtJgXfeJzGcT/
	zcMep2pRPhM1tf1VWqalmn95Hsjuc6ao0aEaK2lpopYHUvIGZtjJ/N6L0dpD8iZmpuFgBjxgaQERf
	Ar+F5FEf3bijwi3VRufMEFNLJGZ4PQWzxtu9rYdwtYwEOFz3KAdVKbADMe6+rGBsGcCQN0hyYhHKp
	YS5GFXj8sPfINvyo8vyW0ntn3S1m9Gwos9jrPqjWcDSh1nEulUuIiMmEFyplnyr2VQ1emZPWL5pQV
	Y+YYUflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0j0-00000003Gbm-2QT1;
	Wed, 29 Apr 2026 08:56:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0iw-00000003GZg-0dHK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:56:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7PS1721242
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwSQ0VZA7av014duirYVDBBsW8ydQ2V2bYKdiM2Oq0M=; b=DjtvgdbuNgrv3SNW
	TTXdwNBjqo9a7JGdBwnZ32wRfGS7pxMfMkZOu3jkuZOmBC1NzVdrVAkOBqaCFC/t
	ndgs67g2XUtrfwQHW0ZlPeIE21YE9KskAUJ0TqR12UnqgOne6sbXrG+zK70ehd+J
	3qSy6z/37/wuCKg3FUV1Aj4rgTikDDqWWU0oyV+1g/ou+HIUe+qKIR/QhtC88kzX
	Q0JPRBvya+43VhHDcJ0OC8lAHJPd+xsIONqbdSh6IvqhZdwbX1RHAl4HjhZJW44y
	Xz+KzWSpd+niRX8BsGch1ynnaJmalJ45+DZeUJZfa01chlaglx65eOe9A6q4RKUL
	vqf1Bw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7317hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f817c3240so132533921cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453009; x=1778057809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwSQ0VZA7av014duirYVDBBsW8ydQ2V2bYKdiM2Oq0M=;
        b=cSw/2cO9ddYBOCelusz5BqjkFGvLTAiQfA+KX0z0yIqHw0zaBqzJRm2lSsEXgEwLT+
         oqnqQ3OL/v4d1/87xvC6ojRHfbpRbxoL6zjJAxk6/j6bBm4AvrZ7gTNeCKW52JStEu7g
         Q57LqLGlSWOni4eA5ybYzhZUNxKM2OFedBkSubcGu8fMVEKNT88h8et0Y6kOghgq/FXd
         hKc2LJTmKZ5vta76vCBY6BIgqNaHkp9sTqxxJaMn/d2VmJrGJ1MK1x3VpAsH4XQ7S11i
         mRXhOq7yma7BCYHKL3j6eGuhpEuOZ8fb2UCet0Ox4SuLUgESldmBS3nzCHXufhcvb70r
         9oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453009; x=1778057809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YwSQ0VZA7av014duirYVDBBsW8ydQ2V2bYKdiM2Oq0M=;
        b=aw5pQ/lR9JAmcQezSLM7wtxeWxCf5pWDWIWxHPn0rZ6CpAU1OG3WUokDH+SRkH5gA8
         bbHN9+YFJxAhmoCMFwI5mK9eMBmxakrX4YjGhh7Ieuw0b2O859tIkYsLziy9czTdxqlw
         x+D3XTqv91SWYM6rP01Aub7MWwL74p+36Kr1tYWak1lmxeIoIkZrRqFikzh2fSQHBWFj
         nTAP4/fdI/dJawDpivLWxVI6Y4HoB9LeUI0r9JPkYGzb2njaRZIUWi1uL/BBb9H6zkni
         YtUhE2WNteMudEspq1KNMPqOz/QyYullmMsT7KAO6JOg3oD/0HbKnOHjyL3Hk0P0qQdr
         qjeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bGRukIio3yrcHGOmCPTdNj+ho+XKK2egufjSi1iAk/GtycJt7s8GQzhEYoRDiCTqF6VN3MZ4a+30sbNwVpvfC@lists.infradead.org
X-Gm-Message-State: AOJu0YzCujm8fyTU7IhyaK3vBejtE4lTBuZkejCYyHiotyYMh+dQRwJ/
	t4yUuAaRM1rWE1fnaPsOsQkgVrkEEROhGFrK31b4h0hNKLN6jiQsiB7x79FUrlut+u97lvxivjd
	MvdTHHhFgqN2/jenw1Q2LgIay2D+hWGIWxLG4xXJ5abCmc48qHBdAZDv6dWrg/skVJ5PGLIMs2K
	td4g==
X-Gm-Gg: AeBDieuhUMewi7f3rEQ3B6If1avkbMc0GJdhNHYSeeOBQffwffOa10R5IQndxkSZeOt
	Mp6484TVfX/XiL+l6+e/qms8DwqWFFzuY/5jcMkwNY2G0H5tfByMkpG2X3YeyH812xP/Q0v9r51
	5KwsAlj7xE27rLdzwvAxJgWZgbKVRN+BP5gudxTwrJ1d/n1T3+EALXdsEEh8GRJdWaHlo6LZO1m
	dyIG8F0FqXk5nRE1SXXAdHf9ou9vFT70FHT7z6ziKBeuurhQS6evsW7Rc8GOcJkEfz28aLFOVLT
	gmAJ2t+2oa99RlDPwyGMFpdPlcuX2pk25hSjyQKLgHIgOW2MGrD9GPh2QQaq/pkY8kR3de59ZXT
	M0qQJ+vIUxKXLGrDAMQeEk99EWv5k3lop+VuE+4CIqI07AoE//qz9RvA=
X-Received: by 2002:a05:622a:450:b0:50d:9931:7054 with SMTP id d75a77b69052e-510189744f0mr45386451cf.15.1777453008423;
        Wed, 29 Apr 2026 01:56:48 -0700 (PDT)
X-Received: by 2002:a05:622a:450:b0:50d:9931:7054 with SMTP id d75a77b69052e-510189744f0mr45386211cf.15.1777453007849;
        Wed, 29 Apr 2026 01:56:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:32 +0200
Subject: [PATCH 1/4] soc: qcom: Hide all drivers behind selectable menu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7751;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=giY/YtSTcAx8gF+B1CvPG9d6KQ+rn1XLGxVVedY1+HM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfJYD2+8z0Zp2W6Pmnr3t4mviwwpjG5OVrT4
 LjNCiT5X0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHyQAKCRDBN2bmhouD
 12hED/kBdE6KiJeIleNxBX36o4d1V+muBpIsoVt4YYfdNRIkQ6e+dS1HsKrjxRneEaFV8xnqMs3
 xNi8wAgxqNxtFuTx2aVUlgzb/e1Ee5bNg+ewCv52DFKx191WYBndBAa1iOajBccitXqO+jlg9CC
 HWXyCPLCWPv0vw4pg0NfDzlx3xCF2jHYPjb/Unwodflk06IGz1rqogLvoSrIX/4Ir5KBef2EYT4
 HLKCRo2VJ+ShVlYZvKbMAApfiOpy3akyu6CPxE+9vMiBq/azqKhjUnwJHqtwt2VOIVrXbOuGpxv
 25ljkj7eyFADlRtQEw+CI5BudWTfVDd4n8JxSVHV6GMygutrGmpaWCSZ9kyrL6QHpsozbJr0U+Q
 ULhKp8yV9ibD2Ma0wM0ElL4LMB0DM+sOiAUTHUlFF5UA47uSkOY6kP+bF93kaiiAX3IxMYWFc1M
 FdpPlAXlE6cJVWZiMuyx4Cu7p73zRASppWuCA16XueBJcOlZLfooYXA+laDiEMA+uiawBk699ym
 AL78qkxo4ciRZCknH9tTyVLVsb9Q+hUeIIk0n6KxxMRSA+i3jbSnd3qT7+IuO79EffTaDSmE1nI
 gOHIRO66ig4ur6+mv8WIlvi+z9kdepnNyzCRDVIG0Tq1/0tj2y89fsYchGKa8QDSICpagNyNwLi
 labrTyWwzrsjlpw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1c7d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6WWCBr2p4RQoEn8978QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX584lHUK2Bhpj
 clHvBFWliNnN+f14dicaQgqrrYKP7dZaRvJUrarKXxrIQ+xfSE0u/BNl+UsayP0LpJgSspQDMOa
 OTHp3Jzz2V+31PmYvHOrB2CB9RMUU99UdJ13db3duuZYUA/ki0mT++mpHoPtafYSCaeGN/SJAq2
 IjZoZVVlUWsqpB7a2rmxLvPiWYp92vCDxC6oIhaDSgZmfr90mBYJYSvX+ZT6TgzhxXgUwBSIhF6
 tUi/zhPX/KB5BBC2swkEojb/ng3q7loNRQhatUzno2w/sUPWzlF+fhd4ijzF0r+MrG4EBD7yEOy
 FDhF+9tyGZS1LqWepeRRUZINCmL5NixBq9Z3Y8B27C8lACcEGeP7WNA2mENh0A3CRiv6Jf6VAst
 uP8onulFrZ8d3bBhut2LxcYIN9sdY9/e9fXi+6XmrI6VWozsR5qg/BTHC36p9lLt2/0oER6IV3M
 OM+N4lyUSUNY2jja1Bw==
X-Proofpoint-GUID: n8MaKLZprznYxTX4mhoivXEmghoyjK1T
X-Proofpoint-ORIG-GUID: n8MaKLZprznYxTX4mhoivXEmghoyjK1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_015650_222529_41520900 
X-CRM114-Status: GOOD (  20.58  )
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
 drivers/soc/qcom/Kconfig | 76 +++++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..62ce1c67d684 100644
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
 	tristate "QCOM GENI Serial Engine Driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -37,7 +45,6 @@ config QCOM_GENI_SE
 
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -46,7 +53,6 @@ config QCOM_GSBI
 
 config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Qualcomm Technologies, Inc. platform specific
@@ -56,15 +62,10 @@ config QCOM_LLCC
 
 config QCOM_KRYO_L2_ACCESSORS
 	bool
-	depends on (ARCH_QCOM || COMPILE_TEST) && ARM64
-
-config QCOM_MDT_LOADER
-	tristate
-	select QCOM_SCM
+	depends on ARM64
 
 config QCOM_OCMEM
 	tristate "Qualcomm On Chip Memory (OCMEM) driver"
-	depends on ARCH_QCOM
 	select QCOM_SCM
 	help
 	  The On Chip Memory (OCMEM) allocator allows various clients to
@@ -77,7 +78,7 @@ config QCOM_PD_MAPPER
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_MSG
 	select AUXILIARY_BUS
-	depends on NET && QRTR && (ARCH_QCOM || COMPILE_TEST)
+	depends on NET && QRTR
 	default QCOM_RPROC_COMMON
 	help
 	  The Protection Domain Mapper maps registered services to the domains
@@ -85,12 +86,6 @@ config QCOM_PD_MAPPER
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
 
@@ -124,13 +119,8 @@ config QCOM_PMIC_GLINK
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
@@ -139,7 +129,6 @@ config QCOM_RAMP_CTRL
 
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
@@ -151,7 +140,6 @@ config QCOM_RMTFS_MEM
 
 config QCOM_RPM_MASTER_STATS
 	tristate "Qualcomm RPM Master stats"
-	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  The RPM Master sleep stats driver provides detailed per-subsystem
 	  sleep/wake data, read from the RPM message RAM. It can be used to
@@ -162,7 +150,6 @@ config QCOM_RPM_MASTER_STATS
 
 config QCOM_RPMH
 	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on (QCOM_COMMAND_DB || !QCOM_COMMAND_DB)
 	help
 	  Support for communication with the hardened-RPM blocks in
@@ -173,7 +160,6 @@ config QCOM_RPMH
 
 config QCOM_SMEM
 	tristate "Qualcomm Shared Memory Manager (SMEM)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HWSPINLOCK
 	help
 	  Say y here to enable support for the Qualcomm Shared Memory Manager.
@@ -182,7 +168,6 @@ config QCOM_SMEM
 
 config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	help
@@ -229,7 +214,6 @@ config QCOM_SOCINFO
 
 config QCOM_SPM
 	tristate "Qualcomm Subsystem Power Manager (SPM)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  Enable the support for the Qualcomm Subsystem Power Manager, used
@@ -238,7 +222,7 @@ config QCOM_SPM
 
 config QCOM_STATS
 	tristate "Qualcomm Technologies, Inc. (QTI) Sleep stats driver"
-	depends on (ARCH_QCOM && DEBUG_FS) || COMPILE_TEST
+	depends on DEBUG_FS || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	help
@@ -249,7 +233,6 @@ config QCOM_STATS
 
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	help
 	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
@@ -257,7 +240,6 @@ config QCOM_WCNSS_CTRL
 
 config QCOM_APR
 	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	depends on NET
 	select QCOM_PDR_HELPERS
@@ -269,7 +251,6 @@ config QCOM_APR
 
 config QCOM_ICC_BWMON
 	tristate "QCOM Interconnect Bandwidth Monitor driver"
-	depends on ARCH_QCOM || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
 	help
@@ -282,10 +263,6 @@ config QCOM_ICC_BWMON
 	  the fixed bandwidth votes from cpufreq (CPU nodes) thus achieve high
 	  memory throughput even with lower CPU frequencies.
 
-config QCOM_INLINE_CRYPTO_ENGINE
-	tristate
-	select QCOM_SCM
-
 config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
 	depends on SPMI
@@ -295,7 +272,28 @@ config QCOM_PBS
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
2.51.0


