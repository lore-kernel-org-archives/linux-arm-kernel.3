Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3344CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9bRHPxLwovK6PU0Po6jIKDL1vV/N2dXW6wJR+Cfc4w=; b=1b5veAAJHjh+cFA2ye8f3ZPRwL
	y/Zn0G4OzYnfl+x1n7SpnbsbsFTYE89lobCmq+4O0t7AmbaNuztL2nZgBbrN4dBiP30DtS9dLPVfh
	NQMZAtE67BfWRuMNHSZ9IB2RKgSyolMAjSsvgcNyvYXAc3KXdCCGfjjSKQNLwjwu09+HnkWnb8ZLD
	4e3SMyU5CyDX56FlxKvZgm29leN3NGJ9it7N3eHU72rjtn2ZE/062sbXQuV5bPJkTb/C3c3rIDodi
	LGvD7La0qU1QVADB/3ExeEvyYwT+hZheiYUVortOi1XFPcHqwYw0+USxxj9ohRIC92UQNsCo2VgQG
	n+fD4Grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRi-00000005vC3-0VR1;
	Tue, 09 Jun 2026 15:32:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRf-00000005vAb-1BIP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:32:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmRg72625178
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9bRHPxLwovK6PU0Po6jIKDL1vV/N2dXW6wJR+Cfc4w=; b=ZP4a3aaZoVJifauH
	g7JuQJpNNzq4qUKHKWc01J8Z6gy0S5FvuVTsLwndxGjdShGgv/anqu2hFSDEZU5T
	8RWtfm+QXwh1AE+6aIxKUaJTWHH0eLGT0CMbG2IG0pvsGwN7ALt/i+3hsExTHcVZ
	DsmSHopth2pja5qm2ykYAs4VQZurUAgT63gK0wV9eFX7VJqfKQPXILtvKRb0jDJJ
	L08dL70zQE05rECJew1vnSMOn0UDnpNz4h7QVz14TcTO8751ElSoM59I1cP2ANjC
	Zbbq5gVgopOqYOq5nz3XqPdhnK9Ck2VM/HYRQ87lF9g3mN6hxkh+kk3s8I2nSIbm
	T5E6KA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsajjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:32:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304f1820babso7069816eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019169; x=1781623969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9bRHPxLwovK6PU0Po6jIKDL1vV/N2dXW6wJR+Cfc4w=;
        b=N7aAhuoSUgRnToUi6LpxacKpBJ1mWqGN9fJum5/ajzTB61SszQsx5Hb8IlaLW0/uEG
         lOvJDROQEwhPuTFb+3rgEfqdeHoOqN54zAyUuUhWAkJFcXor6XvU3XSX7aQIhKYl6qvV
         qkCRBe5heQqNBUB3HFRjXrjoSlUH5SmE5SHrWCAjI9M38S2Wc7Z/N5vNWH8EX3ESPSvo
         Uxpg525tRbG8joTnfLVUAmYlzhD7tfdxFw26kj7qBi5slsL8Y/UGVJejvd0qdJZrjQBc
         JBHu0a+mqrPW0H1F0kLFH1UIjOwnD15e+VSCIoCPHDUFSIyy0UA9BIvBsysfDw+fAaM2
         c7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019169; x=1781623969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O9bRHPxLwovK6PU0Po6jIKDL1vV/N2dXW6wJR+Cfc4w=;
        b=A+y5UTnYXJEWAuYkBYzT3g9yNLqSYaoFAfQkQuEGXcw39OOFW26AvyzpIDk2CbYaJL
         m122mNhJL9MK3a7XcFQDlRnjioG3+7+uoJprXS4q5jM4FYtXJiK+RS14b5FJKYUWs89T
         CKS6PoiIcm13RzZIGOn18CsqDjj/5CVvrpr4/vulRazRBuwOh6n9clZ03rM4UkiEBo/a
         6xhsWmN1zmAfX+NUudK/ZGUucV7KiZT5Uw+SmqzY9hSUiUCVnySRIQEnXLVZRDPwzibn
         2gpV0ySWI+IOYeKL219PKbBb9ogbjCtqV2xdK1hqv5nZyuyorrpAJDvjxlxz088Wj28z
         i64Q==
X-Forwarded-Encrypted: i=1; AFNElJ9qMVa/MOIwZX1xlKpB1b4qNuOEWwz95jO60YAdTPnR31jUmBSeL72SKI034W/O/XdJ6TINsjE0EmKNdephSdXF@lists.infradead.org
X-Gm-Message-State: AOJu0YwWVFxfLR9MTK9WoFDcH7+NtsPfyDbag3l2T/UNm69kCWB08Buu
	Ec1+1c8ZfI8D2CPvNvbRTVcuqaE0xeat54tVlXNIry+t4OuK9ODbFe8TOsJs9t0zJx7NjJlCvOk
	iSD9KoUFBt/MPf1N6mwc8qVccX/ls57Yb/LFaWmuGooap7XZflAlIUG0Zih3H30AFqUpjJvWdmG
	pENA==
X-Gm-Gg: Acq92OEUfdY9jPxfMm4mxM8GSpKF5TqQxWu3Tktsyh+KPvcTbyjbfDR4ptSUlcYdT1U
	dWTelJKiXA4gxQOyk9qes8d4cA1gO6ETN8m2QGbXztTYdrNpUPh9eKqidbSnIdo6NM5Jne+xHSP
	pIB+A9O52FqnSgcqIsy629myyAanJdSUBNW/dW2INfBW95DUEFxVLiTqErv7JWo8sC1ZRjD+rlH
	eWfawmib2weKlluyFmzbxu1PIfSuy1OzONNuEDfmRH/5H0yVab6/4Je1wkYedW5RbaYhKXzAk31
	HL1a4DBV0Sfig6HFsTe7DedGDfV+4Ho+3X8ZJ9BkvL+MDTbmUMrA1f0p9/npzNav1Rlt/+8CC8M
	PZs7qsrsIdvgPTx785T8f4qtDCcoawSnzztjbiI06j61fESW3hgJyNpmx
X-Received: by 2002:a05:7301:d81a:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-307d4e7b305mr1892717eec.16.1781019169148;
        Tue, 09 Jun 2026 08:32:49 -0700 (PDT)
X-Received: by 2002:a05:7301:d81a:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-307d4e7b305mr1892665eec.16.1781019168356;
        Tue, 09 Jun 2026 08:32:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:35 +0200
Subject: [PATCH v2 1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3513;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oNTHsB5TowCBlNgjoyzytUoDnZl8C5a4JxuYWtTP+9Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIVEqeWyYK5mwyOjfUWIIiwjdoS+kSjukFzz
 TjHs4IdkA2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFQAKCRDBN2bmhouD
 19gXD/4/kKIytRMihYOmUDbc3xE+CGfjETm/27Hp8ZzKk0JqB4xauGt8PFAWKY8IfYpnaVBwJsm
 GwABprq4zScmJqIjZS8D3IPggY53xCB7eyC5priNFDqBnadbxX1vWVmls9gSgHCOZ4rEApz5EDN
 NUGmHYssLvteDFUQ4bLE0h7eCA6NPlkO5NNSMbdIMF+EMPqmJWvjQ+Z0kL75st7Z5ntuKMat9lT
 PcmnX4iDLHsHaEJ9M8GcZpJtvBkEnwGKxHnv7eNnVaesqcdtKDZGCPtMFiTbpX43aykrSjUUFuo
 zoXzdoczUzt0Yq58/kOxVr7YbmZ1sFx34TDv/XqBjKSowgDNVQCQ6rjYleqgNuRvlDFIX32oT5P
 0ILv4JcT/Sw2MWmEopbxyGNo7/FqVO7AF7qTqJQJm4DNL5ymBBjNWNBGuSdUWk5vnJYHwOwWoJf
 /0ne2Dlbegadc6pYiKB90FaRU8gWpWqCkZIm4vUO5fauCJEb9G/DdBFPEmozM90oPd4YEZMdqRK
 +qFsPR1uJe/OEBa1F8Yv1e+/8k210ztedijyfkQOLYhs+tSgP7iARK9I1fZdTeLN2GZ8qAW296Z
 MEupAHp55Y4rMuhfoQQav+uSsYcbnh39SR7XJ1ZMeqqjor39rOSYiwFvGxWwTDvdeGpS1jx7RHs
 qiY31FzIKma1Phw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 5DST2yq5O5B4OPNCqyiE1V_STjXuBZiG
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a283222 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oh4px0T-8jNy5rkF8LYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 5DST2yq5O5B4OPNCqyiE1V_STjXuBZiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX6KeGxJqiuS3A
 ejkTkUTm12lxOcw33lhP8Q1mKVUZSJp0bKCiKsFACVCeeEbr5+YAU9NGkfcOZUf/ZvBa7at//ho
 IQ6jh7AKBMsGAQueOIu1MGnulTRV+cLpxx4Gzi675sHJt9uoiV8EpLnR3CDhVbiVf6i2F3jJAdf
 u5mBK8Yh3+z7FlyXGLsEFhqxdZh4LVn7+aOSe7RSoB9IcpuZx6jgIUDEQGrrZYcBLKN2If38bsU
 kR6ZWcrCVG27WbheszqXZIIa8JwKyj1aSNes+vWlGHatmixNSwUm3JMBMELipvL5yGakkoxjnyI
 rsgzyQBgTTIDcxgaium4LSg4VZ9CJxw9aYvVRzhWl2ImfrzY1N99AN15IbOv3R0BWyKjeNig44g
 h4cPd13yC3mqq3QN81vf6gjUWzU61x5o6qUhxvN/ftstyXX7w5dWRbnb2aPnHzmsyf88k1DJAYk
 kx+7QPqHF/Hap/lzYWA==
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
X-CRM114-CacheID: sfid-20260609_083251_500603_18F712BD 
X-CRM114-Status: GOOD (  14.32  )
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

Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
so should not be a choice for ARM 32-bit builds, to make kernels smaller
and user choices easier.

IPQ_CMN_PLL is used only by the SoCs already having clock controllers
restricted to ARM64

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d..799de35c5ee8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -341,6 +341,7 @@ config IPQ_APSS_PLL
 
 config IPQ_APSS_5424
 	tristate "IPQ5424 APSS Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select IPQ_APSS_PLL
 	default y if IPQ_GCC_5424
 	help
@@ -351,6 +352,7 @@ config IPQ_APSS_5424
 config IPQ_APSS_6018
 	tristate "IPQ6018 APSS Clock Controller"
 	select IPQ_APSS_PLL
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
 	help
@@ -362,6 +364,7 @@ config IPQ_APSS_6018
 
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -410,6 +413,7 @@ config IPQ_GCC_5424
 
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -435,6 +439,7 @@ config IPQ_LCC_806X
 
 config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for global clock controller on ipq8074 devices.
@@ -444,6 +449,7 @@ config IPQ_GCC_8074
 
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -668,6 +674,7 @@ config MSM_MMCC_8998
 
 config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QCM2290 devices.
@@ -676,6 +683,7 @@ config QCM_GCC_2290
 
 config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
@@ -847,6 +855,7 @@ config SC_DISPCC_8280XP
 config SA_GCC_8775P
 	tristate "SA8775 Global Clock Controller"
 	select QCOM_GDSC
+	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
@@ -855,6 +864,7 @@ config SA_GCC_8775P
 
 config SA_GPUCC_8775P
 	tristate "SA8775P Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
 	help
@@ -1057,6 +1067,7 @@ config QCS_Q6SSTOP_404
 
 config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QDU1000 and

-- 
2.53.0


