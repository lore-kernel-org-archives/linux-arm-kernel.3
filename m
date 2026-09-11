Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFB0C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=; b=vdjSFpNEJQ1rpyCVeXBbJKIj/f
	omjgFFRH56dShfbxRU8Yzaemm9bus/HTK+xGgppbaw3l9P7NZ06YTfkCdF95TpR96y0f4kf0cPQ7M
	vLm8rM2W+GyIOgDs9EawcDEKhMS5dlFZ2cv+Ya/keSxASM8s2a7XdgnulGsYZnSv5bwetLoE0Q9Dl
	TAS+ZffXswBF93+2gajp2dHDeHtVkzlOT3ZZ3nqmtxcx6pFCxUlxG1jsaq0DE2DJZr+j6QXSWZJFt
	5HBSzNjLhnYz3iRfJdPQlL+PBGiMROqjTGdpkmpTTtfDnP2KC26E2xLe7gqwknQpymR+OOPT6hQLC
	h6QyehYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMc-0000000GMME-3NND;
	Fri, 11 Sep 2026 10:20:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMH-0000000GM8u-3dR6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kuW23513995
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=; b=h0oI5a+46j7w5qXH
	Lh/EH92KJacD6FE3Jmhkm7JGO6lyM4Lo0k+lyR803js+Nnqei1iwq0Hrbo+CmPgD
	7DUp0HxzfRgbu1GbIt5bTqBQrvfV/Ja9C4wi9XNVu9ANeGnlY7lStXPKHdHitVcw
	JPOWTTFlzZ0JT6DNloFUWYIjF4XafOIQGQAUmxsUmkOdJ/EqyO1RPEcezkRD8wkt
	WBwgrEg0nCI1mhkwzLyVcIs0h5ocWu0lo7rdUxygY50qMoDoSXEcsL9NnrL00n5A
	614Q35GadzgnY0VaDUdrM03q1wf/zmFko+zU/JhAo2T1eec3Xj7Mg1QZruyDVTA7
	hZx2dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd514y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so127974285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121988; x=1789726788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=;
        b=cpnHsubZ02VGCiOC37b4I5EeoGiC+t7AtpwP1p5B0Z03NmIW0mRCXRq/ApDVY6L1x6
         Bw0yhPKQPNbE7Ipkd9UomKWF+APc8jqpeXuyhRx4ayiiTM07Dranbj0Y1++wmJ5mkMB+
         rSHOOkWvUlhNEDxiey1NHX7IIIShaPo7TOlWuSNnPxbWDxaFqTitUn3UA+slEtIzvXZu
         EM0CW9AdBDKG/9BBRDCkUG23qElm7Nx5Etv9n6rGghek+MwOAY8sj/Fvw2BzkGJcbEI1
         qPTCoPgC1jTfEOOuxPAOHHJ8s7lY0JvvOxIpwqIbNsg9LGUX3ZHdOCr9EJjLlw/ZbRrk
         D8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121988; x=1789726788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=;
        b=GDTVeecGBY9ykq0FbvDcumxBTV/PFhCDzUjuOj+/nUPwKSht8e8tx4a0a+6fOq9FKy
         fTnI0xfecOyD/qeNTpMU/Q1hq4OhsBr4GEcXPYGVxMnQc4kwVZK/tLOuYcE4QI2zqltW
         MO4+2UNI+4QUennrvK5marQeYSdzmXEX1yKWqU5DWa2lxwf/yEej4EAAxtSTHSi6y8We
         igTnoxhz/uMqGyC9dctE+HdF0r4Whp96vv8sSXsfjsuA5rU2V1Adtds/2yn0earHDVex
         6QOO/+hB7YH7X7VcqFrVU0WXURavc4O5OL1DEjKOH3q3xVRhYoGrQr/pmB0Z8rutlMFi
         fY+A==
X-Gm-Message-State: AFuF++n8F9/sqBd8pOTZ0wweRW1vR8nBey/c+ZSzioUFbX6mI5mvYjs3
	8ID3cQI9PXrmFC2jpoSR1ai3MpwLgD4q67hXalkYwX3aCOuzVNO8DMoJg3ZjZu5K9WrQ0X1dK8h
	LkbY7fm/Legw1/h1L9TgdJbErqXEevnxlhcWez7NszacJK4ejJnIPNUeNl2yazHWpX5m/fzMW8u
	sJYZb3e+WjJg==
X-Gm-Gg: AYBFou3LKFkg14pTfhHg473v1t+8EbPTtTC5F6a+BN/RJuFGsA7rL+EA6KKt5tOK+6R
	0QyCs2iNpR1lS9krZSh3u7uXvUeMVNkjRLwjrET1EFAuHQWXpIIIbODngLz6SONaNKw5RbPE8ya
	0tQQcoO565iqinTlfaV2dji6DeNjR+ckbFxAUcm9fWFIlxa0+XwDo6GB6vufcqCZvfxt+91hGMA
	w2iafwiFlZS/02p+h2GOb0kN6t4jjBlTn/dtXtnntmI4CpyLpvXu3AErZU2zSB5GvEbGNXJYCLP
	5HK2l0vh9OTepjz943fa9SES5kt1YTSsCGJHum9ZYH5LeF5PwO758cYRFGvgXp98qjqgXvOt3dh
	2qggnq7BoxjBdyvlp2JEPNQY=
X-Received: by 2002:a05:620a:461e:b0:938:d7e4:7fe with SMTP id af79cd13be357-939ea28d90dmr377177285a.37.1789121988414;
        Fri, 11 Sep 2026 03:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:938:d7e4:7fe with SMTP id af79cd13be357-939ea28d90dmr377172485a.37.1789121987910;
        Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:15 +0200
Subject: [PATCH 07/10] arm64: dts: exynos2200: Drop redundant blank lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-7-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nTXyroLaQt342/D1uOTDxQ4VLOxeEnoOXRYineJExcQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WsRKh1H9BOmCvc5kCLtNi6rt9pY5DbWNDHD
 zBIwgtGfy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVrAAKCRDBN2bmhouD
 19nHD/4sotXF2SwfMxf8rfuKvpRrDnrTxU+sgSXanMpwDYNBOlfQsjBVMFljPu5DpiyNw5bPswI
 CLAIm57J276BQzxJynFy1N0J6+zKWVPly0pBXHqdDXFzRf756o7fXCQo0ulPUXYNYZBHhZ18JkR
 +Q7OiwsFNVT1plZovs5GZ/o7MFnfGLSnlDhC0PzTVdsQ1q3CwbvBwKA5HFrUOVDlV4YRUjplpQJ
 MtlXPF/R2h1b3gNb3M9BADdaGjXd755ZTR4AShx5QPFGuV8REmWUAizQD9WiL2fWsEpQO70HZwh
 K2uiKd5muhqdK6XPODgFcP0ENuORTboOPZYf2t4v4oIDs8BU5XKnYtjvfMd0d2fJwgL6DWkP8Ay
 4K7jahtyBE9K3iTg1J8EgA5fHuM+FcCgfkuw/AGxxkuSQOX3yx4dFEEAN+/oQZGoRFOoyAY+IJa
 Fj9NFoOZXA0BA+lakio+2XGW8PuHkAzpcJCFO4s7LriNnZelf5MXIyOAu6eFyp5baVHtBlgmpjt
 4aQtMRc4Ovt2POUw3T0hs8kd/X2nymXHQRt9dvaXXIti/+CZtvVMhP3bc9TFg8LRlpgm804iNxo
 dhAn+87Sgg5Jr0H/GZmi0sOEMe8wEubvpXaRLQJX5NzHy9od0OTgy0SaauJaNQ0VskvOY/gWarf
 tR/QZB/wanoS7Ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: -6yQw5wv0lzuXzyweqYbfdPE8HPo4JTn
X-Proofpoint-ORIG-GUID: -6yQw5wv0lzuXzyweqYbfdPE8HPo4JTn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX1u4Hgyhb0V5l
 JLJ/0RItgtLd4HhemhLNouoPoDzVPRAha+jqNDwKn8z3kP5EspHMoCPGXzOlYJ2dEVzpWw8j+a5
 2KUgP7M2j8sBJQ5sG9WhL0MLg+aMXn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX36ULv0JhK4kH
 AH1pbuY1TU74sOPMk5Qy8s9yLu/jTFvlYPR9qBwszrH3Hm7XzBMTCiCMEDHMRw/RMNyERFdEwWQ
 J+BbH6vqVvRN1jrK0Qx46XQMc5qHObEiBEMbNggIwNar/LhAPHBh0BpHnEBHgZ/0JLlTb8u9Q+Z
 4Xcnu1ogwxgVo0mO/A/uW/3vQxSeN/W9VtmMu0M8eo+bEzVlkibkk/ehLFTXcQ8z5l4JG5MxFWw
 Nc48qHn9Kpnr1k+7tiY4e3gGnHpc0LplVwkDt65oabuahuk2kxZfpwTPXZBzmPIfRYAv3f7vph4
 mC5i/OTYpthZHMf0jVi8fXVl+LjAjgQoLL6JtAN+Q0n8m66C03iYEg4qBFU0P01wva8zlD2W2r0
 cKAL+CpWiI608nMMroITw7UuTqCCJAGEPGy56mP4WXLGJhOc1R+cWuYDuHTuea8b15XNzIS4OsL
 H9CmSaeDgXdRGOWKPbw==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3d5c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xquRIdCsXmQ3_dtbOSEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031950_579791_B9AE256C 
X-CRM114-Status: GOOD (  12.67  )
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

Drop stray blank lines, as pointed out by dt-check-style, e.g.:

  exynos2200-pinctrl.dtsi:705: [blank-lines] blank line at end of node body

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 --
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index 5877da7baf5c..d5aede3af15f 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -702,7 +702,6 @@ uart20_bus_dual: uart20-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_hsi1 {
@@ -1171,7 +1170,6 @@ uart12_bus_dual: uart12-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_peric2 {
diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index b1c134f22324..3b853d66e19c 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -712,7 +712,6 @@ hsi2c_21: i2c@10970000 {
 
 				status = "disabled";
 			};
-
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {

-- 
2.53.0


