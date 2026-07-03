Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1833DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=; b=qJK0031mlYsBgu8YHlv5jzSyKE
	Q8KvH3c74So1BLvpSu29PMQ/mh+CVfyA2yuPu/n7UAKPnLtpE/MfbUrc6s81GeP7muQ2PPyg477C/
	KQaokzdmmMGEB9xbtNm1jnR35aRuZs06B48aSSlwgk2QzDwhwrrf9t89Mp96Y23qdV7ucT88mPiJO
	k+stUHt8lTjDOQLE8cUb+LBJKDNVreSVmESI6q5Gx8p7ng3q4QVVZu8eKSC891JI7Go11cCGLiwqS
	wFC+xcO22hXyQH61vRoFLldyAwXcSsW8CsJM1zm3eV+Z6gOq1d+CZG+Z616yHSsijzLcVL0kUr9Rs
	n3lETSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfalC-00000006Xt5-1t43;
	Fri, 03 Jul 2026 10:04:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfal5-00000006XoB-0ylq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:04:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rlKs3123718
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=; b=lKG6cpcvcQ3h8tet
	HtGjL0SGLJYrUoqDa1nzpVnx43ACWCpW1Sc+p/i3u9MNZnrSyeamEv+16o7775OZ
	ZqCaHNhvS2Rbwtbp1uSW3jGemO9ELLcoZThD2MQSj5Ncif8dnT/3SxjDQutqvljr
	RBPhojrdUcfQr8YyduMrnhcFBasN6nR70R4v9BfxIx1KFzh9hLRuY62wKBPEcTHH
	xeJPPwFc+p7a7OI7dJPy/jspjtH3vKGQ+kTzlh5KXQVePNQDFzpuPKBuIGwQy6Wy
	DLkDir8f1rd2GLvI/bhCD4+PH7NaFGOY4XXfGgWqlFwEyL2kbubO0jZWKNTgGgtD
	xGi7KQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcsf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:04:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e663c29f2so45538785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073070; x=1783677870; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=;
        b=NyX/IbfjyqHG9iNxJ2dLuo3M97ixLza4euM0sck7tX9+gvscccVh8ylwUUQoyigvqC
         L4WY0hISATfD2+sIOBUEe/Zt4yoDH5tXJgATz3U7V3VIJkWbHq7fBSPYc8lwAbKWQ2eK
         4/svBVv1ZYld4O8qzpr7YAjHzH2gKIQKA+A6tXMiolSeow/sa4vqDG6C/5TW08v/WU7p
         f4PSyDprax79EZ5chMcuTJZ56/uvzSLv82cPDf/OynjkR4zj8Ndk+F9Fm+p6wFPNQ+Xb
         fZmX93f45AP2PWPgR6N8YLhQr4DFJRhHnqqM4LfSn8cDlrzZ2zMgpD0hc1vHoAf6u0QF
         MCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073070; x=1783677870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=;
        b=Mwx3o5Rzl/aOOtGX/O3nZtoFiEb7YPAmuI1k2MTnQYqcstKNEawDIOR4kA3vPuo3hD
         n6d3+KxQUJX6DjDKxnl1FYtAvujl7JNI6NAWLw5NPzSzpgfkonENV8R+yxVZjh3RVmtF
         5mHspAMAYwHXiVTLWPvDI3hjzomgIA/Q+7+h9TbAj5Nx/BvMgq5AJcXgI/9Xdp1990X9
         YlMCqG8gJUc4g9IZoHgYshUPYVmThkhfE5r4T2RslnD3/+r8Kb/sk99pAyPgdSTOlZBc
         BC92rKh/Ak6Mf22XqQQXitgtKvLGVcnt3KxksvA2vLAOr8We0yRn+cHFy7ZiYOnqeSkm
         MLbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MQ14Bd/9jVQRbFycDqPvJdv37AlDpLI4nZPhwqeQB62HP7RoIp6epg5pnAjUdW51GRVyjlzixpKMbihSC5RFj@lists.infradead.org
X-Gm-Message-State: AOJu0YyHg9+cdISc/x6Z1zDFmEo1g6jCkzv1ldMVjercfNXSnhyJTwpH
	QhSwWqZ3NUbUEECPde0kaVw4iLWlbjxSozSt2SJKLS4AapL41RFbSm3C2aMVc2SncmBIwEqf1VF
	89BW355l28rf7Qawow/vPpeSGlh4LYxC1MrGIDnVMZOMBlraoj8I2T3XBoiHLH4Y2+ie86EmoJD
	yeRK+yioCCnA==
X-Gm-Gg: AfdE7clQ8VhXYha9hfbYXs6/qxFAUspu0lSA1PqTbpxgxKBHZAP8uFTT3e1lL+WpyEn
	S6/vlE2KBILNoTbks9HUcfa1lxzq5k797PXQg12EWQKMDaUy2yV3CW/KMP3ontNLPomRwH/QysT
	zD9wWdJMVgPWJjTaB39BjylK5io/6n137xrfhGc8youIm0gHvK3pE2egDvhHORSxD33VKg/ssEk
	G+lb9ZGFFrEaBa3AxB5oRGrkP/z2Sak1YzSW8YTw326HVxYPtN++UTWhapkAcYpLMGHAD8UwKmS
	kx5uXW3Ho9vyYLAjuFi4N2LBRTkDpnQ53B9PI1RldT8XGgq67tu/td/vunTuguJ7ngUPJJKuB0K
	4uI8GQWgqvOPUWD6PX7IFjw3gPNWiiPPMy3Q=
X-Received: by 2002:a05:620a:2552:b0:92e:5949:3567 with SMTP id af79cd13be357-92e8b29fac4mr405501085a.14.1783073069538;
        Fri, 03 Jul 2026 03:04:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:92e:5949:3567 with SMTP id af79cd13be357-92e8b29fac4mr405494585a.14.1783073068923;
        Fri, 03 Jul 2026 03:04:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:02 +0200
Subject: [PATCH v3 4/7] clk: qcom: Make important ARM32 drivers default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
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
 bh=XvPNC/3TSLWXK0qQ93RFWay5rDBNmpp7S+fJKAkwoLk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kX1Galk0cSKgQvqOBW5wQRmDqrV3b1EPcbS
 shBOczEutSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFwAKCRDBN2bmhouD
 18AfD/9R+ko3brYz/jvagH2FriBQ4sjlPYxKzZj2g/UTv9oLe7w5vjzOavreVEM8nJwr2hhrPEa
 cqQpUJESA9d9UquLIxMHlF99nc0yOuAHKYIJ9Is9lxUKDP/7fu1bqgOpxESw1g/mpdcTdkMgJmB
 2QxozmR5+LE39EGwf6sFoxEaPmlcRWF5dWHZ2kdjIV1/g97XUujrdK6itWxuFKRq0afIiDQ/Duz
 aNBV5xKAVtwBQ7wArGoaOaGtAdgejT1TG4VIjnt7vkSibN/3hPXpDCGgh7djInbyxUF6lVXUA9L
 KJkU14TVtymLwQiyqE8HqNUdjbF/Zyfwzx8bnC03UoXQLIph3AI2A3+H75R7RASUM3zDocCi5Kv
 zZcIljg1kKNkYEcpn1xre7Aq5ndZOBNIDPNxg0Fdi5f8oDXn5qTLgyze5S/b1e4ldhJmiaFQJU9
 zBPSNmPO9ffSVCYegokFgrVVErcEkZqMGAbJXD525CfkTFa237108ZYC8EiVcb4gf/TdGwoiemZ
 r8/gfS63U5snyikGiMzDgTFqeUhPxTd/Zv5sMQl/OyJ0ME/BsyFIN85ODW5tISAAIfX2DFtplvU
 546GW+MA814COXMizxcYAtyOHlaVuqgsir9pL0VOiq2ejJq7bwrBId1wa2/8lMlJBmmm0En3pfx
 sXQPegWpKoIUwag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX5SdqNMSnFSlb
 S2hS/+0dgEOBeeUPCdWlpZkVdRxWaiGcrVIXxEL3K/HOVyB2F8IpvIJv/txEBs1ZUZ8/s12UZXs
 6M/0WBZXYgOpPmrWwcMa+Fq1flIgSz0=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a47892e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nVu6gHFLEUU7Sl8RD4kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX+WwnD2hOU6bI
 4TSbKGZpEcLv9SFubPWsSCyckg3hesaqJ2xnVbC77VmUKfiztU69YeYragx5rJbuoicn53kLMsZ
 BgC/XruimvgXUaGfPzrj3K9BVyMc2fDkCaH7TnqsruQt7E2jEavKs4+G/T9dSKUKFukRI+cvUjL
 7Qczjr5NbpLojLTBlohjghYt8A+l6Wdv1yp0cuO3bgrzrCdASuOkMdWaMIRBUTo5UIJgEXGlusw
 pX2obdwTGLz523puwBdRvY4mNb0H74TGY9lcoTH+mjP5mSgaDHgUWvIPkKZspK/KPzhHwDjnjV3
 ePWkuQ/IZl5Lt03be/V6rdReKuZheLTWXqwG5A5IBAa7j7FuRJU+v7wPU/oH4fvbW1AdTTuImZK
 H8VzDadyF8QVpilN8rs7aJeRQgm+M+jxdQoNS4BURVsDPGpJRX/XrzdafMtMIktqR8VnNdJ9Zfe
 uxrMRDPuZkYdkeM8RXA==
X-Proofpoint-ORIG-GUID: ZtmQrEJsWhunFJ0Y7DJdCzRm7gpTZEND
X-Proofpoint-GUID: ZtmQrEJsWhunFJ0Y7DJdCzRm7gpTZEND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030431_713837_5AA8DB09 
X-CRM114-Status: GOOD (  17.44  )
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
index db3b67fafbc3..11adab354eb1 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -271,6 +271,7 @@ config QCOM_A53PLL
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -302,6 +303,7 @@ config QCOM_CLK_APCS_SDX55
 	tristate "SDX55 and SDX65 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -311,6 +313,7 @@ config QCOM_CLK_APCS_SDX55
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -363,6 +366,7 @@ config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8084 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -373,6 +377,7 @@ config APQ_MMCC_8084
 	depends on ARM || COMPILE_TEST
 	select APQ_GCC_8084
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on apq8084 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -424,6 +429,7 @@ config IPQ_CMN_PLL
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -478,6 +484,7 @@ config IPQ_GCC_6018
 config IPQ_GCC_806X
 	tristate "IPQ806x Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq806x devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -487,6 +494,7 @@ config IPQ_LCC_806X
 	tristate "IPQ806x LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select IPQ_GCC_806X
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on ipq806x devices.
 	  Say Y if you want to use audio devices such as i2s, pcm,
@@ -555,6 +563,7 @@ config IPQ_NSSCC_QCA8K
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -599,6 +608,7 @@ config MSM_GCC_8939
 config MSM_GCC_8960
 	tristate "APQ8064/MSM8960 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8064/msm8960 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -607,6 +617,7 @@ config MSM_GCC_8960
 config MSM_LCC_8960
 	tristate "APQ8064/MSM8960/MDM9650 LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on apq8064/msm8960/mdm9650
 	  devices.
@@ -633,6 +644,7 @@ config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8960
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8960 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -651,6 +663,7 @@ config MSM_GCC_8974
 	tristate "MSM8974 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8974 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -661,6 +674,7 @@ config MSM_MMCC_8974
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8974
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8974 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1234,6 +1248,7 @@ config SDX_GCC_55
 	tristate "SDX55 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDX55 devices.
 	  Say Y if you want to use peripheral devices such as UART,

-- 
2.53.0


