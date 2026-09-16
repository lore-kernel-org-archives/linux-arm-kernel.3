Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D383CC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQBLZZIoByJkwhF/TFyPtlGrfpslHyh5fbM5pCr/2xk=; b=vZeQ5AAN95yWyX3SSF7MQybq4w
	cSzzPOcD3e+Qwlxx2ocfMNeiRRdtp3LL4OaNb/iADSo7+oow7NQUzMC00x+oenW52XNLuwyTKhY09
	B4WOX3uuHYSd4jx7Wxxd9CD0YktouEk0+l67NuisLnuQIyXi9vgfqS0XaOm2FKU1DAF55K/1tsmxW
	AN3LAtCghnEzRydraVEfeLNvtWLFy36e038pxRgYxzIrRQkYnBPt5nWsDxlsj0mIrKvSCfLcbEe0x
	7TK3fI7tVV0pH+1APOMrhIR7jST8DUczr8NOf6noS4EsKOr8slmoROZwmWVOCOdSc+CJFNCZPiXr9
	qMigzh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWw-0000000A5vm-1oAa;
	Wed, 16 Sep 2026 20:46:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWn-0000000A5sV-1bB7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:46:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFf6w21855975
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQBLZZIoByJkwhF/TFyPtlGrfpslHyh5fbM5pCr/2xk=; b=MUdlrjxT9MOtmtcv
	od+86KLoClScwNI7pYxvIsPqZEE6lV3ft3+7ZRZiGPiclPQy+9C5WAX9O0acjz3F
	A1MaU+7+tLz1OTZ129+qfXwFClpKxVu6b9wJzTSBzfrk3cAeDyjUXEUXxHFy6ODx
	j/D32a7VSfCROqwFuC3uOmjpuKkGNBuGtYzLEnepWyM0AdlKBcKl8G8DSfOfpMj5
	ArEmSNtzeJBkQEVtsI3X/NvfNtbZXVP5zKC6GaEQD9HCCQ4Xn6amCF78XLB32vpO
	GKDEuG60TX2+/fSKHYJlTMNGYz2A9xVMyn5k/zsRT3muJRD1LO1OnHleV8vZSfni
	oaRchA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3u65m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so27547285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591608; x=1790196408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQBLZZIoByJkwhF/TFyPtlGrfpslHyh5fbM5pCr/2xk=;
        b=BceygjS/h3PLlz0rkfJCnMYjscYQTD/BDcdzTTA+l/fC++hhrrTF5UeaMAOEuieA1e
         qAHVKsT6hvcAKO1++aLnreHcbACz23tVuPYidQw59YSBDZ8aH21rnpvCinZreLzux4hM
         Z4IU6PEEx3FzUBwkxYeOizo2ul4au4Sb7pSJHRnxHGgoxb4wP8aoTU8dy2OL8z1uZ902
         ue0nSAGPJkBUgxs8o7YlrM9MipTjIs2nDLZU6f+4sujH3cu4WhyitDDGu3Jaza93N55z
         B9DpLInZR3+z/npvXVIrwGV5td5iHaWweza5Tl2HKEcpEqN7Zizo6OoYjjUdq33gCXDc
         m8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591608; x=1790196408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQBLZZIoByJkwhF/TFyPtlGrfpslHyh5fbM5pCr/2xk=;
        b=V+T0gz8wZawFSyk1YOJaK+4GltLenxFrD+WSPpfYTeGy4QHjjOG1dOoL9HXfCj4pEn
         BBio8VEd8cjk/8sasKHmCtKp9MPj/98jatjQ46nQndYYLWNQGlG5zeVWs7pov6jHAECb
         kTEwpkLSWuAPgMRQq+fn6JdGV+fBYwpU4A8yKY2x4VB+2/kTcMSHc7rgBgRoie3Auks/
         /9OsbdO+/PT5WXWDJz9XAmHTNPR4Ztri5LW/eGlaXwabo0YVnqstJMbehMUJpOOE/lhE
         BlKe6YFQupnet6Qu9gCp5AHOX6DBVrkID/KSdQkz2i/0SvWwPhhzehoyIYCpCu+kxNYz
         uerA==
X-Forwarded-Encrypted: i=1; AKwUvBysSV4PlmoaGWpSytEXwBQE76i2sX2JNudbl+tF3CQNz1EuNwAW/BYqhiX6UJTg7CGw7GWcm/qBsVkezOx0qqQo@lists.infradead.org
X-Gm-Message-State: AFuF++kj244EjUyDjvcWu9r2YCZgTM3dHrvlNN+xG6KEu3BR+8N7+XRl
	y8dnawon/Qb/rrNq52Qwg6RWB50wF03bxBwhwt2WvefU8IGAewOWl8HuHnHyM1Hhv2qrwxP14xd
	EQsBDO2KpDqxEevT6HgBspDGWcp7Ky480N4tqOBT7RQWqKiXid5mznbKp2TbkCXuXBothLve9tX
	sh7A==
X-Gm-Gg: AYBFou0t8pEvN3XDZqg6KURL9K6JveYGJCs7frvllf0XFJH5P0e9cCnHMGbPugnNTYX
	xK7znbNNCxiR/Kt+jNr/K5SYNFw8FgXON1HI8JVKqn0DUeDLFMbYcAAX6SJRg5M7loY9NxcV4Ns
	bCjzuI4zgy3rRbSjaqUfhHpvFJnxIhbZrr3etaAxMs7PPEs04lANU26yMY3XKCHfEOnW0+/4Sme
	jgA2S4VvLzL75pJo754m5IjG9wRW/H1YugxGaMSIpJcqE50gMfjI9rfkPTa9EqONVAu4DIJzTy8
	DxYupZFW/wOUTT73lQRmRG/hpBhN3JVnZVe9DJUPPgNfdKwtcQC3i34ZW6PPC39kmDcSP/vZ0BQ
	VHNQQQHHFH3Z83uU/EAHCHLE=
X-Received: by 2002:a05:620a:3910:b0:939:3a81:326 with SMTP id af79cd13be357-93bb78ec108mr717316585a.37.1789591607983;
        Wed, 16 Sep 2026 13:46:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:939:3a81:326 with SMTP id af79cd13be357-93bb78ec108mr717312085a.37.1789591607582;
        Wed, 16 Sep 2026 13:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 22:46:34 +0200
Subject: [PATCH 3/3] arm64: dts: exynos5433: Suppress a few intentional
 redundant whitespaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-3-81b86685d068@oss.qualcomm.com>
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6GxNqUO2FgxW58rRGHvFpoo4MT/9X4scEBWR2BNwJxU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAt5aTPfhhsYJ/7S7ksGmX63laaIX5Kywcv1
 gwg9bETL/yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsALQAKCRDBN2bmhouD
 12EED/9Sq772ZYxvx6Xr/M9kb/T8RvmMQ2f2TQ21UPoaItGwCDBvRQijdnDonosMMahZUtbQRzP
 0q/0celNEjLYZyI7gxqcgFcUAdIkGBgHwf6DDidv1oVAG6goHc9VP0qopBiZPWs5lnmAX0LsHjm
 Xz85uI9y0W8jqnUK3gqq1I4b41GkR1i6q83tkDLOVXKy13JTJ9CaiVD6tQG46zLiDhAgoc+xPRQ
 ThEKQPXvaNd+bRhGlscwyDaW7lm9j13yDW8k+AnkQizQq5QI0pqYLTxwQWrN4E1CINtKUlV9lWU
 k4Dhk+P9t2AHUE6nWmUlMAiA1wsx1tnjbXFuEnCLGJiuy0Z9Fq/BOdg1V9UAaCI5gHfT5BidyJy
 ULnatIBD9OcLpuVAyxDFQXUhqL1CM/KOsSMJMP3VW1jHTL49YEp/A/KixLPIhxZfCYb/1y3hfMy
 bM2k2PjgxUBf8PdPO+LIVRtYwEskZPNCrY+m23IYWLomrZ+agYit7HhQsLvmltv1X4V6fRaIthQ
 JS/ZO5PQlco2N5GKmJPBnprfGaROuPIt5sxyAtapVinaRl8+LLNLCC6eec+avJ9puU83BPD4jm5
 DwdvduSPHzwZnslneOIfI8DfZYf0BC/Mk4LqvzPSe942bESua9YFQ+LzHSA9hynz8Ku5R8fYCh6
 msjUQd6S8pwTr/Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX0BR2odEeZ/p/
 FkNjueuh+hsKtrvH4qqH87MYF4FyYQGtma2DyRqQCFeVKeXm/x3NK5z8uECZNE1UvdiICM2aQAx
 FDiis0q1HZL2zABfNpj4G8HxYtFQOsCn4NT7WI7mMkMnl39OjaJgCUeO5jNd+pBSFVgATf5y51I
 awetRDyYgC5GbBKWarrD/S/waK/OmUwDRn+Mt/GXFv+08ddD1zLjaM/H99TMJylgcYnYjN7q7Rp
 LtcRvql82QOVajrxlkxL95zCt9Ujd5vEsL/vH/KCtcnQvwSs2wREmaQUwa/yet+rt59TuKfAY5y
 puHE2edc0BzDZ7L4viVr3HkLZAsqDwlEekSkPD3dfYEYLDw6H9dWYM7233zAmnjHcO4LndG8Vv2
 BcH6XWn4ae+IT/dSeagzzShwum/uDQGkMj0reRCvqKTULpz71IoDKVjgmJOejg4lIdIDGy+DX/e
 wPUAGY8HH3fxUzsgyFA==
X-Proofpoint-GUID: eIwoBgHB4smDbAgwRg0Hjw8r0fQ1pPRA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX89s1Jj/m5IKM
 cof7I36cLQxbdq2Rj5Cqm9Cyw1zwIFapgp3fxx7MqW8j4YnG0BYYU4JbXxewx46eFXbIW5c48AL
 nP8kDuo5VNTW0cLR4k+AVHZ+P7jCJxg=
X-Proofpoint-ORIG-GUID: eIwoBgHB4smDbAgwRg0Hjw8r0fQ1pPRA
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aab0038 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=M_DGnhg9fGpO6n-mJRQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_134649_430838_AB183FE2 
X-CRM114-Status: GOOD (  14.21  )
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

Ignore ordering by address in entire Exynos5433 DTSI warnings from
dt-check-style, because first (boot) CPU has to be cpu@100 and most of
nodes in SoC are not going to be re-shuffled to avoid mess on backports.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index d318c87effaa..ff3f310da5f9 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -11,6 +11,10 @@
  * Note: This file does not include device nodes for all the controllers in
  * Exynos5433 SoC. As device tree coverage for Exynos5433 increases,
  * additional nodes can be added to this file.
+ *
+ * First (boot) CPU has to be cpu@100, also most of nodes in SoC are not going
+ * to be re-shuffled to avoid mess on backports:
+ * dt-check-style disable=child-address-order
  */
 
 #include <dt-bindings/clock/exynos5433.h>

-- 
2.53.0


