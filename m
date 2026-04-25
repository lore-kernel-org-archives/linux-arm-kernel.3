Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A961FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nHdirXqhE4f6X9ISU7T1X5gfWDY1d/OSWRVD9jX0PII=; b=AGv8moCqAs3zW/UunDAQUZuilc
	g6wkNNDCBkb5Jdma7h4o0XD2TjnPdcieHrN4XG5Qgrt4DVTF/e1fV1SDJfNZo1EI0FDqD+aqM/p53
	1W0Nc/hQ+VGFGa0oaos7qYS/2E+AM21AxPINgXeUg0IsjVrpuQjymyP5TQXGwTcSwppsSFWdq/7JS
	Ruig0khtLGXqoLDI1HWZcLIO0cgqMQiytu0AxWTs5b/K6qoY0EWr2DbtULNO5flLbQMj9JH1MJtQe
	WZFDYZNPQeG19FFLRBBP8TiIxVx/S359ceHAOAdiictgBwntw24QCzz79/KiYV2KP19VZPLjTf/Ed
	CdCZIwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfMJ-0000000EYot-1StU;
	Sat, 25 Apr 2026 15:55:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfMF-0000000EYoU-47tF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 15:55:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3JjnW1728141
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nHdirXqhE4f6X9ISU7T1X5gfWDY1d/OSWRV
	D9jX0PII=; b=QH67l05XA6U75Uyd4949Wxo+dijfYsqZuGx212a06H67q0HoSF1
	Wb/uuUNVzDjwwppI/9Rar+x13umR8Dp1Ch8/G31YMVw56KSZBPL89G8jgWAas/MS
	cCNwjyMwxEypLAJQl+fisJPjcMDjIsEXYcOI+sh+ZYvAt4DAAZv6TVvduEMhzzaa
	YOzqnuTXp8H18nuYn1otRHkEgX1jk9UK1QF4dYCXMUzRom6i5RkYxKb3i2C+HVAJ
	DyaX/gfntLVIlxnGRQ+4sfNvaS5ZaKgZ8bOpKpFjEvAQKrHByP+xeGFdICr0s8Uo
	CGS5OB2C3WjXrG917s8851+6Q5GpXAGHFYw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx99h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:55:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb007bc36so146031941cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777132550; x=1777737350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHdirXqhE4f6X9ISU7T1X5gfWDY1d/OSWRVD9jX0PII=;
        b=S4MM+UxbMbbHRC5ldOwP2fk+FXn6E1bbuXfDbOASP/E6WVsyPi5DgITNnWCb0cVSy9
         0oSYU+mkHuhpaKTiMrxXA5nPj8naga17+Eg92NgZv1/AehBVoFyw0IIjkCQyrD5Moh3f
         d2U2XUUjirdItN2JXER57hWFey3GDdsGNepCTj1VFhxN/HyeInRMNBWuvCY56ApKfdEg
         Wzx6NK9FpcKJum1F/WMjPW/QNyjtZap1oiVF0q/S/LZnMFAqSs5jJ6nn7vIfZqN0MoFh
         IUli+w5G94l87fQYf58m4a7F+58QJKHl2ABDyaUk6Q1pHOjD9S2Un5AgS77set3ftJ9/
         DTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777132550; x=1777737350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHdirXqhE4f6X9ISU7T1X5gfWDY1d/OSWRVD9jX0PII=;
        b=gIBkeNQh4ah4jrAUyaHXqDNiyHEsMBJoq0km85pf5kRHvM0kKPJMo6spwezoFCmqgk
         IV/IWa+/j1Ho8a4m5BkIHY/32kneIFTlA+as20bnAzmUvXEV7P5VN8cIxyd293BBxzdR
         EK4bgYtEVbS/qkzWJ22PtlQwmu2Jy5UuhNj3tHexRi6PXE0Gb9UrlZlfHGpbVOhlvEW7
         lUvcBSvIBz3NX3iU8+lmAgmnHLkdmfXC6y2DFRqTLrhL/IxiQpeV0iDJTPnLqliILoe5
         xWqjrRToiCpYY6MrRUP2lo8bcl7jovnCbN5rpFPWdnuZHM69alV4f9NMLoI8syvdRDxr
         BUrA==
X-Forwarded-Encrypted: i=1; AFNElJ87iquNzr/OE3qsrZS6fWJZw20tl7BsrzM9uYChouTUIMDJUeBzh1JAj3StDaYAxe2YFMMf+Ogp30KpuzgLbXzS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn61PGFr1PCgdfcoyuilLhjx4FkgiArc22jS66KKZyLd0gokb5
	tw4dDYJZFWXZARkUp8WB1B8Au26kwqmC1Xm6O9AfyynAp+rJXkAM4j5q45QGoOxH0laTryzQar+
	QtF21YJ6vNK1t9d+ks/SNfFeHlxU08N+U/DONRdTerxqQRhUVwuSj6oYgEbZe2U8TX7mPEDcjyg
	jXhg==
X-Gm-Gg: AeBDietVg+X5GiLC9O0HRRuy6KO0SFyIZyKIfcvP7RwHO2eD6USZBILkQL93tnpVRZU
	8tvTRjZUnEd9a9v3C3e3XNq1DX7HZz1dLCEGJ7o1GTIKxuTPVz+FSrojFrtSOlNUM4i+37ovdz7
	dOI2E2TZtxHJh1PqcRnD3SUBjvLlpPvZkfENErwPSpJYzDkRKcyjLQp0mKWXDrDdjYh2Wvb9ENk
	E2VOM2FsoYdInfJ08BwcGfmWkVppRKXxXTbAhusaYcUkVssuGm/dlcUKXi7wt/XMlf9jDtzC4o4
	WXV5Nu3U1KHRqkSeEs5YFfc8GMf5nQV9jE7Ile/oAkIDO9vfrNf4X3BdQWaGHbo/iNIhnMRHhx7
	55Cj0GTYgtGEp3gPEY1c6EXOtWXPLBHmZtsD8Sam1wOfT/sDzEOOPVowfVTZ1Yo33yIVrokFWLG
	DQ+keppZUw/+2Z+1lKxh34dGvHN2JdcUF34IW+nAo=
X-Received: by 2002:a05:622a:429b:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50e36b865f5mr505994921cf.3.1777132549435;
        Sat, 25 Apr 2026 08:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:429b:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50e36b865f5mr505994561cf.3.1777132548840;
        Sat, 25 Apr 2026 08:55:48 -0700 (PDT)
Received: from quoll.mediaserver.passengera.com (user-31-175-2-65.play-internet.pl. [31.175.2.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm676083465e9.3.2026.04.25.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:55:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: qcom: Make important drivers default
Date: Sat, 25 Apr 2026 17:55:06 +0200
Message-ID: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=24919; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=P+4h5fwiOnJO1t6o29m/cyIkqRizFv8mO7bSwaelWlQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7OPZros0Cpd2Oh02GAmGI62SbiIH4OfBzFLAC
 FRwz+MqK92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaezj2QAKCRDBN2bmhouD
 17fwD/9Xaacev8/AKN2AsLk4O/ioR4qZk1GBiJXyFZ0lLegMp2OAF+Z+mUquwYcX67XKVJ55M6S
 FG5zmVAMWp7H5GL7Mv416VqfD9PXhfZQATCabq9fhxbStW8JHkuT5mRWVOkMtAYbfpApphEsSWX
 7rqusuOuoM2b6ryO847sQbi4fzScTqJrPSnahFAEGyFqWbQ09Fo3o2MIY73d65SQEkEMeye2zkR
 F5cDL02tlQyvYOJLXSR60ZWMjPubDzhJihsGlQP5llWEyCYA6UplXT48LnKf4Ns2RMn5aphahw9
 LJ4STmTLAHZXSEQJerQVPRRRcF/DZI5WUCg8BCEkKoOru+mw0rI8dxv4Tk2zyEnfosKatB8ZBPx
 AxZymb3RSFlWiLvaDncjDKShRR/ezFq0ovYVj+Gp156tVZdCSaj+WwO4B+jOxUkhENRmetHDgvY
 h0QXBp7fdVgBTrGlIBJitjSLidyddLjH7lQIyXBm59oVfKN0dHxPRdOe8XYfESj/zZuJTjacHK/
 P+rOkMHjZmgYuCXv8dHpF5QrEcTOWYRjMykbreWnML51lUaYZSF2flgyE0s4k8ZpTfgWyf0njUv
 s6V60cUO8J+xje3XdNN3Kdc3GNhEjVk9G5FAwe74Y+P7AArF/jsJPi/gijhZTdTSYayn+Xv0tCR LfEEyd2edN1l1NQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MbT-ZSBm9x4ru7oVDt2xD-yydAVsIY-h
X-Proofpoint-ORIG-GUID: MbT-ZSBm9x4ru7oVDt2xD-yydAVsIY-h
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ece406 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=0C0oXSgccRrV03aUni/DzQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Amw14q-JFhzbT9FOICoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE2NSBTYWx0ZWRfX0PXGFfUZ58mH
 rgogUkX7w1ypnCQBqRCoqzPGk5c58CGeumlDg8bhZzz1STfYiGSANhX3jFN7dU9F9anBb/Oj7uP
 tIjUgRmIRj8gncyVg876LQEZFWN1PYa2ibqPVAHsMmb0DDBbSDZsGFJz7EQEWb8ido1DKYWNoNB
 r9lMxXw3RvVpwP+aM3wOD2y2tzR5yTsh6vmtow7U3+GhNM8smVs1jZ+0SIqYHxDUcv71v4rnLyD
 0b9jCqH2Pii/TAS5A1on0Io9HyddD9/PJB/KaSDxZLBDpLkBHX756zPmadSDFnUuEA7G8eFSvGU
 Ep4BVlHcaAxk4LDlkm5Wxlf4lgTeRhTVDW6EdvCs9uN/9l0U4vKqmHPvT95POET257yk+95vUwd
 /N8OYOu0NcL1cbGsxhmt8bIFWmNSCl8n2biYg8+RlrGIS2GjPeOgCpie4v1z5iQXu536OYYrsIJ
 QVpKGOAOksCYBwCizRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_085552_252072_A65487BB 
X-CRM114-Status: GOOD (  19.13  )
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

The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
essential for booting up SoCs and are not really optional for a given
platform.  Kernel should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig: enable PINCTRL_SM7150 and PINCTRL_HAWI, which were
   not selected before but should be, because these platforms need them
   for proper boot.

2. arm qcom_defconfig: no changes.

3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
   platforms, which are already enabled on qcom_defconfig.

4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I did similar change for clocks and I will be continuing with
interconnect and other missing pieces.
---
 arch/arm/configs/multi_v7_defconfig |  8 ----
 arch/arm/configs/qcom_defconfig     | 15 --------
 arch/arm64/configs/defconfig        | 46 ----------------------
 drivers/pinctrl/qcom/Kconfig        |  1 +
 drivers/pinctrl/qcom/Kconfig.msm    | 60 +++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+), 69 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..3847a6c17193 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -483,14 +483,6 @@ CONFIG_PINCTRL_PALMAS=y
 CONFIG_PINCTRL_STMFX=y
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S500=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_APQ8064=y
-CONFIG_PINCTRL_APQ8084=y
-CONFIG_PINCTRL_IPQ8064=y
-CONFIG_PINCTRL_MSM8660=y
-CONFIG_PINCTRL_MSM8960=y
-CONFIG_PINCTRL_MSM8X74=y
-CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_PINCTRL_RZA2=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..03309b89ea4c 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -123,22 +123,7 @@ CONFIG_I2C_QUP=y
 CONFIG_SPI=y
 CONFIG_SPI_QUP=y
 CONFIG_SPMI=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_APQ8064=y
-CONFIG_PINCTRL_APQ8084=y
-CONFIG_PINCTRL_IPQ4019=y
-CONFIG_PINCTRL_IPQ8064=y
-CONFIG_PINCTRL_MSM8226=y
-CONFIG_PINCTRL_MSM8660=y
-CONFIG_PINCTRL_MSM8960=y
-CONFIG_PINCTRL_MDM9607=y
-CONFIG_PINCTRL_MDM9615=y
-CONFIG_PINCTRL_MSM8X74=y
-CONFIG_PINCTRL_MSM8909=y
-CONFIG_PINCTRL_MSM8916=y
 CONFIG_GPIOLIB=y
-CONFIG_PINCTRL_SDX55=y
-CONFIG_PINCTRL_SDX65=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_GPIO_SYSFS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..f4dfd0cc853c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -652,54 +652,8 @@ CONFIG_PINCTRL_IMX8ULP=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_ELIZA=y
-CONFIG_PINCTRL_GLYMUR=y
-CONFIG_PINCTRL_IPQ5018=y
-CONFIG_PINCTRL_IPQ5210=y
-CONFIG_PINCTRL_IPQ5332=y
-CONFIG_PINCTRL_IPQ5424=y
-CONFIG_PINCTRL_IPQ8074=y
-CONFIG_PINCTRL_IPQ6018=y
-CONFIG_PINCTRL_IPQ9574=y
-CONFIG_PINCTRL_KAANAPALI=y
-CONFIG_PINCTRL_MSM8916=y
-CONFIG_PINCTRL_MSM8953=y
-CONFIG_PINCTRL_MSM8976=y
-CONFIG_PINCTRL_MSM8994=y
-CONFIG_PINCTRL_MSM8996=y
-CONFIG_PINCTRL_MSM8998=y
-CONFIG_PINCTRL_QCM2290=y
-CONFIG_PINCTRL_QCS404=y
-CONFIG_PINCTRL_QCS615=y
-CONFIG_PINCTRL_QCS8300=y
-CONFIG_PINCTRL_QDF2XXX=y
-CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_RP1=m
-CONFIG_PINCTRL_SA8775P=y
-CONFIG_PINCTRL_SC7180=y
-CONFIG_PINCTRL_SC7280=y
-CONFIG_PINCTRL_SC8180X=y
-CONFIG_PINCTRL_SC8280XP=y
-CONFIG_PINCTRL_SDM660=y
-CONFIG_PINCTRL_SDM670=y
-CONFIG_PINCTRL_SDM845=y
-CONFIG_PINCTRL_SDX75=y
 CONFIG_PINCTRL_SKY1=y
-CONFIG_PINCTRL_SM4450=y
-CONFIG_PINCTRL_SM6115=y
-CONFIG_PINCTRL_SM6125=y
-CONFIG_PINCTRL_SM6350=y
-CONFIG_PINCTRL_SM6375=y
-CONFIG_PINCTRL_MILOS=y
-CONFIG_PINCTRL_SM8150=y
-CONFIG_PINCTRL_SM8250=y
-CONFIG_PINCTRL_SM8350=y
-CONFIG_PINCTRL_SM8450=y
-CONFIG_PINCTRL_SM8550=y
-CONFIG_PINCTRL_SM8650=y
-CONFIG_PINCTRL_SM8750=y
-CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 80af372a1147..ed5347cebb4c 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -6,6 +6,7 @@ config PINCTRL_MSM
 	depends on GPIOLIB
 	# OF for pinconf_generic_dt_node_to_map_group() from GENERIC_PINCONF
 	depends on OF
+	default ARCH_QCOM
 	select QCOM_SCM
 	select PINMUX
 	select GENERIC_PINMUX_FUNCTIONS
diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 836cdeca1006..1f77ccb2dcaf 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -4,6 +4,7 @@ if PINCTRL_MSM
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8064 platform.
@@ -11,6 +12,7 @@ config PINCTRL_APQ8064
 config PINCTRL_APQ8084
 	tristate "Qualcomm APQ8084 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8084 platform.
@@ -18,6 +20,7 @@ config PINCTRL_APQ8084
 config PINCTRL_ELIZA
 	tristate "Qualcomm Technologies Inc Eliza pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -28,6 +31,7 @@ config PINCTRL_ELIZA
 config PINCTRL_GLYMUR
 	tristate "Qualcomm Technologies Inc Glymur pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -38,6 +42,7 @@ config PINCTRL_GLYMUR
 config PINCTRL_HAWI
 	tristate "Qualcomm Technologies Inc Hawi pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -48,6 +53,7 @@ config PINCTRL_HAWI
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ4019 platform.
@@ -55,6 +61,7 @@ config PINCTRL_IPQ4019
 config PINCTRL_IPQ5018
 	tristate "Qualcomm Technologies, Inc. IPQ5018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -64,6 +71,7 @@ config PINCTRL_IPQ5018
 config PINCTRL_IPQ8064
 	tristate "Qualcomm IPQ8064 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ8064 platform.
@@ -71,6 +79,7 @@ config PINCTRL_IPQ8064
 config PINCTRL_IPQ5210
 	tristate "Qualcomm Technologies Inc IPQ5210 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -79,6 +88,7 @@ config PINCTRL_IPQ5210
 config PINCTRL_IPQ5332
 	tristate "Qualcomm Technologies Inc IPQ5332 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -87,6 +97,7 @@ config PINCTRL_IPQ5332
 config PINCTRL_IPQ5424
 	tristate "Qualcomm Technologies, Inc. IPQ5424 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
           the Qualcomm Technologies Inc. TLMM block found on the
@@ -96,6 +107,7 @@ config PINCTRL_IPQ5424
 config PINCTRL_IPQ8074
 	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -105,6 +117,7 @@ config PINCTRL_IPQ8074
 config PINCTRL_IPQ6018
 	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -114,6 +127,7 @@ config PINCTRL_IPQ6018
 config PINCTRL_IPQ9574
 	tristate "Qualcomm Technologies, Inc. IPQ9574 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
           the Qualcomm Technologies Inc. TLMM block found on the
@@ -123,6 +137,7 @@ config PINCTRL_IPQ9574
 config PINCTRL_KAANAPALI
 	tristate "Qualcomm Technologies Inc Kaanapali pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -131,6 +146,7 @@ config PINCTRL_KAANAPALI
 config PINCTRL_MSM8226
 	tristate "Qualcomm 8226 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -139,6 +155,7 @@ config PINCTRL_MSM8226
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8660 platform.
@@ -146,12 +163,14 @@ config PINCTRL_MSM8660
 config PINCTRL_MSM8960
 	tristate "Qualcomm 8960 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8960 platform.
 
 config PINCTRL_MDM9607
 	tristate "Qualcomm 9607 pin controller driver"
+	default ARCH_QCOM if ARM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 9607 platform.
@@ -159,6 +178,7 @@ config PINCTRL_MDM9607
 config PINCTRL_MDM9615
 	tristate "Qualcomm 9615 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 9615 platform.
@@ -166,6 +186,7 @@ config PINCTRL_MDM9615
 config PINCTRL_MSM8X74
 	tristate "Qualcomm 8x74 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8974 platform.
@@ -173,12 +194,14 @@ config PINCTRL_MSM8X74
 config PINCTRL_MSM8909
 	tristate "Qualcomm 8909 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8909 platform.
 
 config PINCTRL_MSM8916
 	tristate "Qualcomm 8916 pin controller driver"
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
@@ -192,6 +215,7 @@ config PINCTRL_MSM8917
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
@@ -201,6 +225,7 @@ config PINCTRL_MSM8953
 config PINCTRL_MSM8976
 	tristate "Qualcomm 8976 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8976 platform.
@@ -210,6 +235,7 @@ config PINCTRL_MSM8976
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8994 platform. The
@@ -218,6 +244,7 @@ config PINCTRL_MSM8994
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8996 platform.
@@ -225,6 +252,7 @@ config PINCTRL_MSM8996
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
@@ -232,6 +260,7 @@ config PINCTRL_MSM8998
 config PINCTRL_QCM2290
 	tristate "Qualcomm QCM2290 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCM2290 platform.
@@ -239,6 +268,7 @@ config PINCTRL_QCM2290
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCS404 platform.
@@ -246,6 +276,7 @@ config PINCTRL_QCS404
 config PINCTRL_QCS615
 	tristate "Qualcomm Technologies QCS615 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found on the Qualcomm QCS615 platform.
@@ -253,6 +284,7 @@ config PINCTRL_QCS615
 config PINCTRL_QCS8300
 	tristate "Qualcomm Technologies QCS8300 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm QCS8300 platform.
@@ -260,6 +292,7 @@ config PINCTRL_QCS8300
 config PINCTRL_QDF2XXX
 	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
 	depends on ACPI
+	default ARCH_QCOM if ARM64
 	help
 	  This is the GPIO driver for the TLMM block found on the
 	  Qualcomm Technologies QDF2xxx SOCs.
@@ -267,6 +300,7 @@ config PINCTRL_QDF2XXX
 config PINCTRL_QDU1000
 	tristate "Qualcomm Technologies Inc QDU1000/QRU1000 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf, and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -275,6 +309,7 @@ config PINCTRL_QDU1000
 config PINCTRL_SA8775P
 	tristate "Qualcomm Technologies Inc SA8775P pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm SA8775P platforms.
@@ -290,6 +325,7 @@ config PINCTRL_SAR2130P
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -298,6 +334,7 @@ config PINCTRL_SC7180
 config PINCTRL_SC7280
 	tristate "Qualcomm Technologies Inc SC7280 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -307,6 +344,7 @@ config PINCTRL_SC8180X
 	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -315,6 +353,7 @@ config PINCTRL_SC8180X
 config PINCTRL_SC8280XP
 	tristate "Qualcomm Technologies Inc SC8280xp pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -323,6 +362,7 @@ config PINCTRL_SC8280XP
 config PINCTRL_SDM660
 	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -331,6 +371,7 @@ config PINCTRL_SDM660
 config PINCTRL_SDM670
 	tristate "Qualcomm Technologies Inc SDM670 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -340,6 +381,7 @@ config PINCTRL_SDM845
 	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -348,6 +390,7 @@ config PINCTRL_SDM845
 config PINCTRL_SDX55
 	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -356,6 +399,7 @@ config PINCTRL_SDX55
 config PINCTRL_SDX65
         tristate "Qualcomm Technologies Inc SDX65 pin controller driver"
         depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -364,6 +408,7 @@ config PINCTRL_SDX65
 config PINCTRL_SDX75
         tristate "Qualcomm Technologies Inc SDX75 pin controller driver"
         depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -372,6 +417,7 @@ config PINCTRL_SDX75
 config PINCTRL_SM4450
 	tristate "Qualcomm Technologies Inc SM4450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -380,6 +426,7 @@ config PINCTRL_SM4450
 config PINCTRL_SM6115
 	tristate "Qualcomm Technologies Inc SM6115,SM4250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -388,6 +435,7 @@ config PINCTRL_SM6115
 config PINCTRL_SM6125
 	tristate "Qualcomm Technologies Inc SM6125 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -396,6 +444,7 @@ config PINCTRL_SM6125
 config PINCTRL_SM6350
 	tristate "Qualcomm Technologies Inc SM6350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -404,6 +453,7 @@ config PINCTRL_SM6350
 config PINCTRL_SM6375
 	tristate "Qualcomm Technologies Inc SM6375 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -412,6 +462,7 @@ config PINCTRL_SM6375
 config PINCTRL_SM7150
 	tristate "Qualcomm Technologies Inc SM7150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -420,6 +471,7 @@ config PINCTRL_SM7150
 config PINCTRL_MILOS
 	tristate "Qualcomm Technologies Inc Milos pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -428,6 +480,7 @@ config PINCTRL_MILOS
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -436,6 +489,7 @@ config PINCTRL_SM8150
 config PINCTRL_SM8250
 	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -444,6 +498,7 @@ config PINCTRL_SM8250
 config PINCTRL_SM8350
 	tristate "Qualcomm Technologies Inc SM8350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -452,6 +507,7 @@ config PINCTRL_SM8350
 config PINCTRL_SM8450
 	tristate "Qualcomm Technologies Inc SM8450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -460,6 +516,7 @@ config PINCTRL_SM8450
 config PINCTRL_SM8550
 	tristate "Qualcomm Technologies Inc SM8550 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -468,6 +525,7 @@ config PINCTRL_SM8550
 config PINCTRL_SM8650
 	tristate "Qualcomm Technologies Inc SM8650 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -476,6 +534,7 @@ config PINCTRL_SM8650
 config PINCTRL_SM8750
 	tristate "Qualcomm Technologies Inc SM8750 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -484,6 +543,7 @@ config PINCTRL_SM8750
 config PINCTRL_X1E80100
 	tristate "Qualcomm Technologies Inc X1E80100 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
-- 
2.51.0


