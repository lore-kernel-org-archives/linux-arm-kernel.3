Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B55C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79FJThuLWiI8wI4jTZg4M5KJaU3sfd86ekhAyk1kKTw=; b=oZS+RfuW8PA0DbZqsotqEbYJ4r
	nLfaMKR11mR8ukuGUHOovGBV7Nfn+URCJtAiGGCKQpn+fXJtW5SyJNZdIPWL+TCO/q2XZX+yhxQZN
	XneeTlleMLaq7NfkLyzscIJdtGVNTqAmsZq8dusSOVPQmpPiVdbzvcEiM2jpi4XTZCF8nL3+x6pYm
	CbFBDM8KqkfpChtflXpv8P9dzs2X6QVPW/taaC3zj6XOSQGMQjdakoHGNrgYk/n3dP+y7Ip9ki1kE
	yZEGaePxMyoYHgOQiPMYkEYQigDvoNuP8jJT466+UgDqBHk7O+Xt9TAYaBP1wfYabi4MKANpnKjNy
	rsaTzANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfalD-00000006XuY-2ZlB;
	Fri, 03 Jul 2026 10:04:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfal8-00000006Xqb-2tmU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:04:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rl3s2995006
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79FJThuLWiI8wI4jTZg4M5KJaU3sfd86ekhAyk1kKTw=; b=Ul47y63mZ/6v7clO
	HAyrat3skp5YfrHzuoJ279L3m1GO3pTbyAQqkkONmw9kw0dtzOjHb+bk7DRbKcZv
	Echx/lQU5cbXKd1pkoJe/16GWkzmkG8ZN/+JjR2Q98CUZdA/favHQkn0t9nXqfub
	gPp6QFry7CrM9V6ROH8uUS2JXaqZfkYJQgL8G3E4IKl26vW90HS0FWgO2gw/H9YD
	rvrxu+3DUbWNoPsIDJgziG0Rt8xVkZf7Os9Kvp0k/4qRxenuZVrSkC6PrAcJVq+O
	a8F64Fo6khu3dCJ8k45LsQjLFb1IJmcB8I7IT9dNBf7ba4MrRN98bnvYE91aZ8Sh
	UeQKFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1t7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:04:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e606e8f3eso25860985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073073; x=1783677873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79FJThuLWiI8wI4jTZg4M5KJaU3sfd86ekhAyk1kKTw=;
        b=cEKq4Qk8/fyJve7S5dhXSYDdbE9EsoGX2zT/jfYX25Yeqj4glHKttPepcRqxXHWC3R
         l4o42u6T6qq3drjeWf4t97gOCL3herjpgvY+fEBPc7HARf/sTCCmQlz7Xu+xo0s1WfPN
         /5I5ArMgf0fmUgGmeRNmCOaCxDxiODOGUxsb+OIUwddYLMqNf3pZdjGltRBZU1dGhQQl
         DvY6Uzkle/O/vJ25eaMwXTnxdtoAizy2bfGx2ASLqNk8H31dl0QJenKRJc76VjENUdT8
         pzjS0JJgo+wX1WVW0NIqRVEyewJoRH7zRlwcb0hE8rEol/OgEwPA9oMTNydQR0mygeR1
         o5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073073; x=1783677873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79FJThuLWiI8wI4jTZg4M5KJaU3sfd86ekhAyk1kKTw=;
        b=IEEAJjYJY7eltMXLofJlmkdFpHQweYgBCGs32sEuPcc6LKA70xZmSs0VDmVd+iapww
         5F+1OKl6qz/A6vllfU8lvlv7wO+9VAmyk25bCNV7yWavvny8iZvD/+cubkVCvK+QHMyX
         8IJOOoCBfdgujfTAmHAcM99XffVN0wBIeCOZkfNY6418C3CPRHkOFOu6rxYXbEQC/huw
         97elv9gH6hIwFDQUYq6Zx3LbmbyRD96ZA8HethyOqIQ98qahfjtg3v8YsszM97/4MCkp
         Xi/vPgtWxghuhjaZ9EieQOL6rXHBnvGons13XdiKO7VfPCf9scnaNkKYnYKlPWlSMPic
         IJHg==
X-Forwarded-Encrypted: i=1; AFNElJ9BycBG0qC6rRL5KyILHUBUvNq93RfMwk1HjP3h/+QYb7CmLxA5T6l4vCuMektt/Urt5lCNb3tTu7+o+Eg9V0rU@lists.infradead.org
X-Gm-Message-State: AOJu0YyDxzC/4AU23wMP0Lvb3hlPiWSArX+NCrfFXlw5L57ypudQdS/W
	0bz8usIUANjTdqnNF5r2yz8pJ+dnehopagCHWWuGA4KlZP69P4+6hOO1MhA3MXtNWpTwKhz1kuf
	FAmj50i2Wj50Y70bPodLh+xYMteAiBLB5XMujVvUA4TsOdcgjr5jQFRXN2RjG3qEElGF51gKp+S
	2Y/A==
X-Gm-Gg: AfdE7cm4IXpacHX3lK2ZMOhm5CPBPMUjS0jfCxsCtjOEOq/fb6pnH7Dggk8DXYDshVo
	JTtVMWhEtXUl2pPKbe3uNftCZYcQkUeX6SwvA08fc+XoTOyLEd7QzodBJomuuPuD1UMupxfTrIJ
	RdhVJwjUuXXobAKi80OZ/pZD9+8EqxrWZZeg5uDnasfw90rXDDn9G6J41KauS48tBb/yypKTt3V
	d8u2dKUHt/8Jc91d1MGPjE8ahFWc+vwfq52H7M78+Xz58Y7AE34I4jflNpHoG9qYwjCjczMyZb1
	ugMQM8Ap1xqoMeGdLOePxzzZ9FQVxdoUJYK7hDdM803KVVSLGeoz46FU1GePNJ+iz8kIM8RS3W/
	7wO2q7CqWRsGXi990kYdoQh4CKo+SfU59YpY=
X-Received: by 2002:a05:620a:800a:b0:92e:600d:b9e3 with SMTP id af79cd13be357-92e784e84c3mr1205443985a.51.1783073072631;
        Fri, 03 Jul 2026 03:04:32 -0700 (PDT)
X-Received: by 2002:a05:620a:800a:b0:92e:600d:b9e3 with SMTP id af79cd13be357-92e784e84c3mr1205438185a.51.1783073071985;
        Fri, 03 Jul 2026 03:04:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:03 +0200
Subject: [PATCH v3 5/7] clk: qcom: Add defaults for desired arm64 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-5-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12243;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+aK9kvGHZhm1bGs/Wkf1edno9WOKBO800F/6MDlu6DY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kY3Cm3l//WeHPOULPhTHFmpuXoFzkow6eN/
 lVDiavbfNCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJGAAKCRDBN2bmhouD
 16tVD/9EIr9Rs1wZqnvLbTZdf2mOUWQq0A4nQP7tZaNwPQdAb9aupr3OGD+gok1cCm8gxTEzzKy
 KG33mPRPH+rnCh0QGYFGYpDE4ts3lD9jDWM49xaAsKjJqq8bzXOJ053f/nYQtvt10xg5agwo5GO
 9eWHONCZFt/zPMZeJ0CiUy4NxhQMPkDjkCxlCgvoZOnyzFUM4VcL2qS9g+C6lqxjdqcb8fXCiyr
 M4VpsRYONEh2BK93YR68S81y4+xkCU7uDHF+7AwRLV+3du1rQfjfXN5lwfogoFziYYL1jywwPJw
 CC7MNqX9CHw57PN1fP93LxrdMOdeu4DmyiEKmqAZ/Y+JHy7UGyR3xr/KWt/G8+wongN7JOhXKqT
 A7o7S2CiuxPXqtXy3xar0w8wkHD++7gHGL3BZn701otlBHUQU0375NBmO+GL64ni50TtTpuVE2q
 P7DLsqg/BzwoeLupwwpNXt5QXN9Nxoxm21+6Ffnrg5Rsc/MSm97nYg8/CAOhfBxUd50gq7L8JXh
 fyJ7Ch4gBcltBNR0zPTzV6Vi8TQeWhKpUII5aZr8oG1sgCS4woXlLpRPaCIUPih4d6wHt4W6R3S
 xGGs9d6QMlCqKfi7H2hMdgFiJxp6sLe22fdqutkliHmVL0EfCCsJ1/aosrGL/UIu6eJrEM471sV
 C/MRPHGDM+fQoNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX1lPxq8NW4pms
 0XvY6JQ1I1wtildc1bVV0hvzu8jZUj2uAl6g87nto7v+GHwgKIMjmE1Bszf5Ki0MVzl5PAeHaTW
 rrQ9T5uWHKSLeFlmFJvCLMRQu7ZZLMg=
X-Proofpoint-ORIG-GUID: zuyRk7GljpTmSOelHh4f_aVw4X8WOcTm
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a478931 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oRM-sv2Ew5iZelD02ewA:9 a=_dTl747PDKSlraET:21
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zuyRk7GljpTmSOelHh4f_aVw4X8WOcTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX+tKN/SnIOkQP
 OTZG/D1t5wvFfqXN0dDn56TdASOD3Qk+R0tVZ960pYcCwuk5I8u/UjCdl54a/ZruloHVofwMLP5
 pYLB3OZErULTDdUK5Ij7d1aluGWlLTssMlO76lvbPswjNTSqK/0zTym72n7sy1PnyHgEGsiThbm
 VbW/swpbi8ib7sM53DOQMFsxu+n5RSCOzWmCOayzJU9uHKOhfkzBvZBcW/atLjuf/wXIapcbXrM
 KSfuPppyVhyw6P7/q4Kavvdp1MFoALJq4pmiK7bzeAHsF8EchmDkGGsZvPLB1U3R9g245btyiWt
 jhFxMH6uTfrcF3kdAunI6Ome2wnoeQDHO+pFcef/VMSvdoPOxsleuAjBK+zvfb7BUvnXQ1inmdd
 +lSTXrRdA9xviSLWnBh3cIgmGgnIA2eR2qNATgE3RH45ql0FIQLHete2OegPq73TmSMuVja+nk0
 iBtbx6jIGIHNNW4EqCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030434_863944_B441D65D 
X-CRM114-Status: GOOD (  15.25  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
1. Make builtin SDM_GCC_660 (Konrad)

Changes in v2:
1. Add defaults for: MSM_GCC_8976, MSM_GPUCC_8998, SDM_GCC_660,
   SDM_MMCC_660, SDM_GPUCC_660, HAWI

2. Drop the Konrad RB tag, considering above a significant change.
---
 drivers/clk/qcom/Kconfig | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 11adab354eb1..5b421bee001e 100644
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
@@ -350,6 +353,7 @@ config CLK_HAWI_GCC
 	tristate "Hawi Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -358,6 +362,7 @@ config CLK_HAWI_GCC
 config CLK_HAWI_TCSRCC
 	tristate "Hawi TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
@@ -683,6 +688,7 @@ config MSM_MMCC_8974
 config MSM_GCC_8976
 	tristate "MSM8956/76 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8956/76 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -738,6 +744,7 @@ config MSM_GPUCC_8998
 	tristate "MSM8998 Graphics Clock Controller"
 	select MSM_GCC_8998
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the graphics clock controller on MSM8998 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -807,6 +814,7 @@ config QCS_GCC_404
 config CLK_NORD_TCSRCC
 	tristate "Nord TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
@@ -867,6 +875,7 @@ config SC_CAMCC_7180
 	tristate "SC7180 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -888,6 +897,7 @@ config SC_CAMCC_8180X
 	tristate "SC8180X Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8180X
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8180X devices.
@@ -920,6 +930,7 @@ config SC_DISPCC_7180
 	tristate "SC7180 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -1036,6 +1047,7 @@ config SC_GPUCC_7180
 	tristate "SC7180 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7180 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1065,6 +1077,7 @@ config SC_LPASSCC_7280
 	tristate "SC7280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC7280 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1106,6 +1119,7 @@ config SC_VIDEOCC_7180
 	tristate "SC7180 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7180 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1134,6 +1148,7 @@ config SDM_GCC_660
 	tristate "SDM660 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDM660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1144,6 +1159,7 @@ config SDM_MMCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on SDM660 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1154,6 +1170,7 @@ config SDM_GPUCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SDM630/636/660 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1187,6 +1204,7 @@ config QDU_ECPRICC_1000
 	tristate "QDU1000/QRU1000 ECPRI Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QDU_GCC_1000
+	default m if ARCH_QCOM
 	help
 	  Support for the ECPRI clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to support the ECPRI
@@ -1276,6 +1294,7 @@ config SM_CAMCC_4450
 	tristate "SM4450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM4450 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1293,6 +1312,7 @@ config SM_CAMCC_7150
 	tristate "SM7150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM7150 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1310,6 +1330,7 @@ config SM_CAMCC_8150
 	tristate "SM8150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SM8150 devices.
@@ -1329,6 +1350,7 @@ config SM_CAMCC_8450
 	tristate "SM8450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8450 or SM8475 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1366,6 +1388,7 @@ config SM_DISPCC_4450
 	tristate "SM4450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM4450 devices.
@@ -1387,6 +1410,7 @@ config SM_DISPCC_6125
 	tristate "SM6125 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6125
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6125 devices.
@@ -1397,6 +1421,7 @@ config SM_DISPCC_7150
 	tristate "SM7150 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM7150 devices.
@@ -1429,6 +1454,7 @@ config SM_DISPCC_6375
 	tristate "SM6375 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6375
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6375 devices.
@@ -1504,6 +1530,7 @@ config SM_GCC_6125
 	tristate "SM6125 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6125 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1523,6 +1550,7 @@ config SM_GCC_6375
 	tristate "SM6375 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6375 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1532,6 +1560,7 @@ config SM_GCC_7150
 	tristate "SM7150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM7150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1622,6 +1651,7 @@ config SM_GPUCC_4450
 	tristate "SM4450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM4450 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1641,6 +1671,7 @@ config SM_GPUCC_6125
 	tristate "SM6125 Graphics Clock Controller"
 	select SM_GCC_6125
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6125 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1650,6 +1681,7 @@ config SM_GPUCC_6375
 	tristate "SM6375 Graphics Clock Controller"
 	select SM_GCC_6375
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6375 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1750,6 +1782,7 @@ config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SM6115 devices.
 	  Say Y if you want to toggle LPASS-adjacent resets within
@@ -1810,6 +1843,7 @@ config SM_VIDEOCC_7150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM7150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1832,6 +1866,7 @@ config SM_VIDEOCC_8150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1853,6 +1888,7 @@ config SM_VIDEOCC_8350
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8350 || SC_GCC_8280XP
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8350 or SC8280XP devices.
 	  Say Y if you want to support video devices and functionality such as

-- 
2.53.0


