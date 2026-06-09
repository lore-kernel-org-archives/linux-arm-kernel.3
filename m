Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C141CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42OvwCVR1sO2H7O8XUidUVQnaR3TpDPd+Mconx0OdVU=; b=4LfrnfjcAYqOo1k2HJT4pj9xL7
	wtNvOTfoaJxb8s7YQ3kknYuVLYDADM5SXdXYthz58t+BIGgP9fyWT9IW7E0SKGQbTkZRrMMfnPWvj
	4bvW91mgnHM/Xl8ZdRezFTwS8AlHLqBRRUbXiRiEoMLglwVkPtCLIYtpxrDMlqOgLhczhmqW7fgkE
	tZQUzSTldSEUjRN4K4WeHNDW8IJrEH8YaIirmAOcuNClf2UTscQd4AstKgzykd34zgt59baNIfKMi
	ZCH9mrOpr7IzYp25EXRDcadG6aVnKBpRudrWeb3Yovxkef4+Z4jE2SksNs7gScLJJF1kyUtnet3qf
	dRRGjLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRt-00000005vKr-25Es;
	Tue, 09 Jun 2026 15:33:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRn-00000005vFZ-0RP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:33:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmRg82625178
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42OvwCVR1sO2H7O8XUidUVQnaR3TpDPd+Mconx0OdVU=; b=phqT9WP19YZ3PBZG
	Ry+l8ez+MNmRPCEHhtLLYAaQ4q6WYu+DJwpwBgefChLkYCgKPapBHKkIcoPjXaHh
	ToGDIH+HPiLNQX1O7/uuI11JVkIr5kQEyUoSPmpuqJpBj18JhtzJOW39OQp1zDc8
	7ek0QutbgrrvkRN/j/0RpcEAYOSvCz748ecdrKH15XjBTfGlDQyZ1fGDIaJmNCJu
	D9szeagm6zcCBsTQUvt2lGNoRmSFvfhmmrYKabMnxb5jvL14ZaWBAglXRXe68QvA
	Zg4VFjgFsjARaUi5kde2FtY81lQJgHzEUObxScY8qQvqg5PIlBzwCjeHGIh8HvzI
	9Dtj7A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsajkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:32:58 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6f7f4e47eso8728770a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019177; x=1781623977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42OvwCVR1sO2H7O8XUidUVQnaR3TpDPd+Mconx0OdVU=;
        b=VPsyOZ46lZcM+4izR4Kl3NcHg+M84lZIkprmV+5vpBAZEAnRMlbppG/OkbG2x005MI
         LxRsgmfcb6WHRVHD8eaLMqS2huLn4r3vGh7EiMwbn0csIeF+BBhUVZq1KN2bD0dVRIIX
         1FFGjFFDD3AN3reW2iT6wxBhF54tJ3KSCPK2qGgsqAPo/fPe9EptYJx3gLAHL4WpYuuw
         oplMQ56KxE+IMaoIG1vvKoCgaHiRl74XsjRbinQjyr2qEobhNXm5evva+ZHQ37LCoe0r
         PjfykNv7vQjrLa4G/zLmF6nzXg/27PTIm/ARs3UJjweD4RQB2fe3K2ybiBHjk5PEvZuC
         qRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019177; x=1781623977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42OvwCVR1sO2H7O8XUidUVQnaR3TpDPd+Mconx0OdVU=;
        b=LHC/mCSP3qSyINTPsG5qz/Xfq29tZteDO70ZpnCjpAoxiQkOshsodmT5lMDOwVSSDi
         xgFRcfBwq+rYg9WQm1oNEWwCC+pmaAjGN2243I7NsX/p56Bga9UjDP5Q8oAYlRtj2Q+Y
         VzHPLZWYEu0bRxt994C/CtqCHym5TZUiQjsGyxTcqnRirAbU7JQJcOxW4Vnx5/yEPi0G
         rt2uy6PCd1R12BlNvrofpoGz4dZZFpicuIctWjM+3WINR+kH1vqpVFVzH+WLGG9qTEJZ
         IXj8mwrbARYsl/A9OekV4H5X2WmggqOz5eAwNcLonOrQW7pjGaLWA0Nppw9gdXMN3jcc
         Jw5A==
X-Forwarded-Encrypted: i=1; AFNElJ+A/5+qmaaybsQGBsK35MYR0oeX9G4Ze81kU4ZEP3JfX2e8LGBBdWqYJFbm81+9I24eONaLKR68uVAM5zjpJZbi@lists.infradead.org
X-Gm-Message-State: AOJu0YxTXAIICjG/DS2xG68UY3wZCIcvvRvPAAz+OhkyAVo3ZCswlkuz
	SLOk8O6vFgrEniE5/8a9O4E0vcqXJjSBIQRo4hqoT547KyeKshGCfnXL0anujJQfGeguCEOSbve
	VNo/pbcXrBxmAE1qY1QPV5rn7QXlDmayN4xS0jn+Y/ft0i4tET93p6SyXCwxXC5FgedZwDeEe0f
	6z/Q==
X-Gm-Gg: Acq92OE8Zqzf2sJH4vcvXS2zfu3fq7xrKll7QuL8NZUq9VIz4JHc9CVZLeLCFiA9vB1
	P3iX5yU4SoxemurwtmM3ew1dOUToXSIFOlJvHkM5jb2mEORXuip9qFvBK5LygGZgRy4Yc+f/tiO
	l05m6lWAAvbjLf7kkwWVyyvn08HYWxbRq3Nt1ts2RDT1QBnVkyKj92BbUF0+9muYwAxmixg5vhA
	aTt3G594a5frEpAj2jVMm18t4y36gSqomSbw9U7MjZF8UT1Ub0/oRtEyIgaVm1mgqEzYGcLm+q+
	lT7VXNQTcf0aCbh6Nu7Ca1LGbCvR6s4GgfbdKCrMYv0KujMgi9iim0M5G8KRbkxQwWcN7lHVBw1
	5RnB0cGYQ8QyvS65LEt8yhAZjwUfk5/c3Tn3p7a5PGZxHU3rPKA1Y92Am
X-Received: by 2002:a05:6830:4122:b0:7e4:230:96ca with SMTP id 46e09a7af769-7e70c7fe87bmr14981518a34.21.1781019177294;
        Tue, 09 Jun 2026 08:32:57 -0700 (PDT)
X-Received: by 2002:a05:6830:4122:b0:7e4:230:96ca with SMTP id 46e09a7af769-7e70c7fe87bmr14981455a34.21.1781019176804;
        Tue, 09 Jun 2026 08:32:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:39 +0200
Subject: [PATCH v2 5/7] clk: qcom: Add defaults for desired arm64 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12135;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q59UObcAMY1V9mVGqT7Dy3nTkUBnxvxsdcJF9VMZOXM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIZsX//lnNginh/112o7kzseEdW/GcurQm4o
 vfrZcHVZveJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGQAKCRDBN2bmhouD
 1/jsD/4lg8zhI7ncEqMz7tMOkQ4qJMeqjR2MrLcBt4fPCV3GNqpzfgsaIJcgpQflvPajLK+Qx8n
 azRRvLyF6CBvfbBHH7qll5XnUzjmu4eelU+ePxV4dJPErJPduO1WywVhvLKjnwZ+sDuqvnPVHIs
 1BMmbVuhp6kAJKtuea6HW0dDbsbfmnuYbTTv0IHO2EoNJSqedRimNtnDI69cwupTdKz9BGOmf54
 sl+tjBCm/LXLkC1ftGRL+duf9XHxqfD7Aett9TFc8L+gCxNmtFMvVEFf4+25pptObmCNqYEIT/G
 pDtFWxlNEEZf7vNr084MHucctIxKFTZmKXYRKCSvN2EIOolnlbfFvWdYwJKJ5sXOmpBNY7cxoh+
 a6Ma4Ef4/Gev1Lysk8Ro84pG4CikBacS0aB/JqrEg+CakqmNt7FHPjCbzPd6xinC5WXk2fRZLFM
 XZXv6zcbr7+VSsYTV27j5oV436jaT/ywsOVS6+XGOECv6oCee1jP01fyGja0GuL9KmeVxoHIInn
 cb4FyEuC0AwNFS09MQUq2IpRtWsyQGhxXsY6rFdtSrDbdwXtnSUlRmmDp9MJtIRHh7KP7HyCeDh
 wMIG7u1wNM9FoNVdXdc7LBnXrbh83nAnV4ZzRHcSXTBUUocze0AVW9TwBm0meTkzg7S5Ba2ljgz
 dmccxhapvWWTVdQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vNTIMp_ExGeNaOe3dvPXV_lrdvVs21Xb
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a28322a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oRM-sv2Ew5iZelD02ewA:9 a=_dTl747PDKSlraET:21
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: vNTIMp_ExGeNaOe3dvPXV_lrdvVs21Xb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX6tYjxZNLP93a
 bis36SbCKkcs0eOPgs+HgZ1LU/+IHalCjgOleQ9dHQhKDAnIDT8syoZf6Ol/chxcdob7gcwa/7i
 kR2gO1JgbZvxXOYnWxu4RpS3U3xCgyeqVsv5G5wE1/zb+UnZFX3q3Fqotqldoym7gVhJQ2ZALoJ
 G8ey5Wns2oG70k/QY9NU9oFnoqmxF1XKyisajKwTRAZCTK7GKQVxNw5OABvwglAt1sYP4EYWbnw
 Uqs8q1oMITqrmPU0gTJRQkUVlbHiZCiXG/8mohZiztaBTARUSzUcAk2xgaLuItW9C2ZzOdR4p6v
 FoRJWD2IQD47nJKoR/fdAJ2NjJvG5s93OCIqrbNXoDK69CB6drJcZMgp62DT3rgnua+CjEp56Lv
 ffC81KXJeIrMRiZ5sNvFS73dqg9r33PSF78wO8xjN7R2RBMWUstJ/Ok4kmtC7gTworUgbAXNyj6
 VTCnfsxHhnb994rOurQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_083259_312001_30C9152C 
X-CRM114-Status: GOOD (  15.69  )
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

Enable drivers for upstreamed or being upstreamed SoCs, which are not
yed enabled in defconfig: Glymur, Hawi, Nord, MSM8976, MSM8998 (GPU CC),
SC7180, SC8180X, SC8280XP, SC7280, SDM660, QDU1000, SM4450, SM7150,
SM8150, SM8450, SM6125, SM6375.  Note that main GCC clock controller
drivers are usually already enabled for these.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add defaults for: MSM_GCC_8976, MSM_GPUCC_8998, SDM_GCC_660,
   SDM_MMCC_660, SDM_GPUCC_660, HAWI

2. Drop the Konrad RB tag, considering above a significant change.
---
 drivers/clk/qcom/Kconfig | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ed969553649c..9afd4d752f3a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -73,6 +73,7 @@ config CLK_GLYMUR_GPUCC
 	tristate "GLYMUR Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on GLYMUR devices.
 	  Say Y if you want to support graphics controller devices and
@@ -91,6 +92,7 @@ config CLK_GLYMUR_VIDEOCC
 	tristate "Glymur Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Glymur devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -161,6 +163,7 @@ config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -328,6 +331,7 @@ config CLK_HAWI_GCC
 	tristate "Hawi Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -336,6 +340,7 @@ config CLK_HAWI_GCC
 config CLK_HAWI_TCSRCC
 	tristate "Hawi TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
@@ -661,6 +666,7 @@ config MSM_MMCC_8974
 config MSM_GCC_8976
 	tristate "MSM8956/76 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8956/76 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -716,6 +722,7 @@ config MSM_GPUCC_8998
 	tristate "MSM8998 Graphics Clock Controller"
 	select MSM_GCC_8998
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the graphics clock controller on MSM8998 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -785,6 +792,7 @@ config QCS_GCC_404
 config CLK_NORD_TCSRCC
 	tristate "Nord TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
@@ -845,6 +853,7 @@ config SC_CAMCC_7180
 	tristate "SC7180 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -866,6 +875,7 @@ config SC_CAMCC_8180X
 	tristate "SC8180X Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8180X
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8180X devices.
@@ -898,6 +908,7 @@ config SC_DISPCC_7180
 	tristate "SC7180 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -1014,6 +1025,7 @@ config SC_GPUCC_7180
 	tristate "SC7180 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7180 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1043,6 +1055,7 @@ config SC_LPASSCC_7280
 	tristate "SC7280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC7280 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1084,6 +1097,7 @@ config SC_VIDEOCC_7180
 	tristate "SC7180 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7180 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1112,6 +1126,7 @@ config SDM_GCC_660
 	tristate "SDM660 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the global clock controller on SDM660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1122,6 +1137,7 @@ config SDM_MMCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on SDM660 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1132,6 +1148,7 @@ config SDM_GPUCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SDM630/636/660 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1165,6 +1182,7 @@ config QDU_ECPRICC_1000
 	tristate "QDU1000/QRU1000 ECPRI Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QDU_GCC_1000
+	default m if ARCH_QCOM
 	help
 	  Support for the ECPRI clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to support the ECPRI
@@ -1254,6 +1272,7 @@ config SM_CAMCC_4450
 	tristate "SM4450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM4450 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1271,6 +1290,7 @@ config SM_CAMCC_7150
 	tristate "SM7150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM7150 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1288,6 +1308,7 @@ config SM_CAMCC_8150
 	tristate "SM8150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SM8150 devices.
@@ -1307,6 +1328,7 @@ config SM_CAMCC_8450
 	tristate "SM8450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8450 or SM8475 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1344,6 +1366,7 @@ config SM_DISPCC_4450
 	tristate "SM4450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM4450 devices.
@@ -1365,6 +1388,7 @@ config SM_DISPCC_6125
 	tristate "SM6125 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6125
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6125 devices.
@@ -1375,6 +1399,7 @@ config SM_DISPCC_7150
 	tristate "SM7150 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM7150 devices.
@@ -1407,6 +1432,7 @@ config SM_DISPCC_6375
 	tristate "SM6375 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6375
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6375 devices.
@@ -1482,6 +1508,7 @@ config SM_GCC_6125
 	tristate "SM6125 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6125 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1501,6 +1528,7 @@ config SM_GCC_6375
 	tristate "SM6375 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6375 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1510,6 +1538,7 @@ config SM_GCC_7150
 	tristate "SM7150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM7150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1600,6 +1629,7 @@ config SM_GPUCC_4450
 	tristate "SM4450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM4450 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1619,6 +1649,7 @@ config SM_GPUCC_6125
 	tristate "SM6125 Graphics Clock Controller"
 	select SM_GCC_6125
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6125 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1628,6 +1659,7 @@ config SM_GPUCC_6375
 	tristate "SM6375 Graphics Clock Controller"
 	select SM_GCC_6375
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6375 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1728,6 +1760,7 @@ config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SM6115 devices.
 	  Say Y if you want to toggle LPASS-adjacent resets within
@@ -1788,6 +1821,7 @@ config SM_VIDEOCC_7150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM7150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1810,6 +1844,7 @@ config SM_VIDEOCC_8150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1831,6 +1866,7 @@ config SM_VIDEOCC_8350
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8350 || SC_GCC_8280XP
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8350 or SC8280XP devices.
 	  Say Y if you want to support video devices and functionality such as

-- 
2.53.0


