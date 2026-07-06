Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38026C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqdDN1FmStg=; b=O9goURuR7Sp/jrnvdlmvwJCLrb
	IMRcQeS5u3AVhZmcot5On6DQXkHD7UQFzL1U1ud6SDxcnCUZ8vPRgOSNEG9nHWSANQcRZtgjsBijo
	Li+/+eVkOJqAEuKQEQEhlkjQ/M17GT7Nw2vepERrei3Y5HCYCe4miIkMUZpvX2MTvm6xkqXTGCd5G
	HzcvDWTvHOEU8/JXAf3Cf3tUF2gdLMnue1piGb6Q+cSn0rilRepNFv83K/Eydh1gEVESKveN4LONR
	Jku/LmVmE3ubXJlWL/F65A+IkUsbHxvzANA0yM6aGxDXTbf+rUndslWEluv28Jy+GEio1p5ho3m1c
	xIrTUiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPO-0000000CB7H-1LRl;
	Mon, 06 Jul 2026 10:18:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPG-0000000CB42-3tk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:18:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669pb9W237503
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqd
	DN1FmStg=; b=QVAipDdgnOnegBEWVFPNGDU6Q7ta3zSKVdl6+vvkIxW9v7ejUjw
	4vGz17FdRz7e8MpY19IaqMwtod9frSMn7IVhc/IsBBzrYFE/qAZO2ZilFcVEQ/Og
	ARelPn+jVXykqf1f1yCRt+81jL2mH+EiLLRyHIR30bmTBsLX5yzBtlDmG5sAcBdP
	r3g47USO1fNR5Gni708g19yOQ6UARkggFDfTmPGeLXNmZ6D/fVTId4qZvrzeAhOZ
	yiGJhGB2jGSz8jaC5lzuEHN0XBko47rnZasEgCKh+ZFSOHnOZC+LWnO2AR6i4+Zz
	LJ6QJIFOta4N/kWScA1p/7pDjM5ZoIxn0Ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r03mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:18:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ea24a2db9so184818385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333109; x=1783937909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqdDN1FmStg=;
        b=Ef4YilSTVKYeouuKk3Gv4YGjxRPeEY4jjudmcIlK+p4sG0DQ26EBXGWyK7XTJHfMND
         ow/MaZo36hWz69kPZnN2SujH/xr+3GR2o3oUwvpshhdRMpfOWud1AjxatYSLFlCzzMiI
         b9soTm9syRUEb/VO3wwG16nYRi/iOH4UJ1xXKfNy1I5qsMvAnfuUoZGXLer5f2DldM4Z
         R0JuqE4k4LXfbeMzQXPLMnnKe7CDIqooAgIaExxwrHq+AydK30sLwRIQiikPBrqMaBbs
         GVfRl3PgYDMTGzrNNM12b1SLrWajAAQKpZRCuyPLPepbijY9nBfNF2SZwQ/mU3WURTvy
         QhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333109; x=1783937909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqdDN1FmStg=;
        b=RjpKK8ha7GyDNpJgYjO8Jr2RcfZTLXBAWcfDV4hanQQp6o+hV6W3euKIRMLVWNgOdW
         s1JItLOzMrS0LlUWXfH41W360jFkwkCwN2mrwHN7084mUQwl3SmUii/p5oO7rA1cfQ99
         L6zjSLw/T7Nyi9KMiTTqWbxknrLXfxeBQx2tu5NWg0qg/NLFaeV9nJkwkMrZSaWxZC/r
         cNqVX25tcEDvorCn+MNmkJQAQCzm9uQ+WPf2cneRwlK2Nsyk2JzjmCLqO0LNBqUTAQwi
         7QFwkXrgMXs+5vWaFYZiDZnGHGVWxjpdANnOjcxmUyaelaIhj4UCb+jqaEkrDR0XvyIB
         Jh4A==
X-Forwarded-Encrypted: i=1; AHgh+RrqJIL/058x2HwvvFoV2zsJ2ZV9oJb8lk3SZsXfWUqXAWrzTEaPdODMQd2hB4amT3U/aA6PcKHJBgF2vU76S3HP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb6GUrO+mNEz4T32Zox5vNemd8gX2tGk8qNoKW3nCV4D6v+yKH
	MEeHp0w0SulDODMRF03M2Vx3Y8DRHg5JkkEOXm32BI53faCNjFMczjw21n5Hy0sOWci8MaeGiNh
	emwnO8DHaiz/TaM8YzIwsMqQWVVVSaU+byuEPGnFCObepj5qwatAQU8Lbu45JcOKWfjClFHhdxM
	SP+w==
X-Gm-Gg: AfdE7clI9YrdAUSOPWB2usJSJwW/imJvPOHuuBSZMdXAp/hAux1Hj0rT/gB0FF92vWi
	hf82yomVudwuIkB1chuKZiaYX+wju3Cy0yA1rkXfBqUm5UxhpFQWVuifBlu6VTvgu1qYtMOoduS
	QQOA6xqlsx1HNH4PZTuUl43tpW4IFfzKtt/OMee/6JN5H7UIY1J4gamHuH0L9uzYCKOyY3bmxLV
	2mPknOE+vaBVOgEcYbCK4vyr4NGfTRCV91wwkDBm4RI3PiTe56rthrLAhlQu5q7HBwd8RVAaogf
	cwkndwJ4T8mdzWth2c3sueBDUptp6/hyfR0xs6DhRL9golGsDBYyCf73FwfKHf4MHlQe9NehD2O
	LiIdGKjJu44fZyoGvsvthsAfHVhU=
X-Received: by 2002:a05:620a:17a0:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e9a34978amr1349009185a.5.1783333109266;
        Mon, 06 Jul 2026 03:18:29 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e9a34978amr1349007085a.5.1783333108852;
        Mon, 06 Jul 2026 03:18:28 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm24350402f8f.21.2026.07.06.03.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: st: spear: Correct indentation
Date: Mon,  6 Jul 2026 12:18:24 +0200
Message-ID: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nff7ht1yXQQDMNVSlXjX5TIDnXVQzTUA7YgPGwIziis=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4DvDRsgTbbK816wZrc6DJ9az0YAYQwCYh5MQ
 K8yDMBfIsaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA7wAKCRDBN2bmhouD
 16wxD/wNLAnDh7ULEKoI6+hQ3BIQw34nWRVPCv/Uh3YRBQM7E9DAeheYRgAW6UfHMvhggU289H/
 4OyfK4/9ZteddRjb1KS9hGH1d5y3yPnd5H5yGz+OzxnMeW2m3LTBvfk4YeKzO0fY1R1krRx5lN+
 gY1omWSpohSrIwRNvtxrnujAXgGENqPpXQ3sxqF+y0Lc+8wGVBpFtDsFxVcBd8nE9vf0yvm3DBn
 iFqgxTQkPWObGZelOTCkqAUn/14d3Dn/F22SkONfnwQk+Uc5mNxfJokrIZKT/P3tTyu9Ef13orr
 G4+k2vv8SyDUnoZRStdOyCSGHAvNxpKM7PUn1OupYPzVFecjm4YBk4gisqnjzpfharWQT8H+I2L
 Sk+cJGVrDYf/8OVHYqfgSrNHcJpQPrPpRUalqN+AOaGEoUJLKHlGWe4YimYT4q+oYonaJqYN6iK
 SnK/uWIPWbeE9hqrMGDG1mHJD8C2gYHvJAdGwNMusEh4rRAfXET08Axjo9LOKwuR939xFukA2NV
 Uy+wLKmJ6SS3nkriHxkVHP8pIvrw8ybCW8Eg6O6MVCprQdkdZVBdw1WmY59UlTcWK9iwoZ9ZyaM
 ZcE9/Eb3X086yMd6ByGJAavOqSn00qwoc3gMId/9xBO8DP4TGU9d1WYgv+G7RVe41MRlqbRayzK EOZtdWWNVELW9ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX2UXI3KYPt/Tf
 K58drFaHqwH2FEUo1IsdWihydMX8tBCvTgOsMusy6hD04nSkhc3ckYoNftk6gm0KcyqEYNg5lNF
 QRyB7KvMEV9YfX3HPdMvfTYe73fx3hzQU6H3h6/zHI87McA5MGkNKdJTAy/SgwTVMORTB1oK5m/
 Sbh8/l0deT+E422QtwTPWRIU3nL8VZ9U55mJ59UlAS2u/Tu0CFIoOBgpOeWM37rkdRHUTy0VO6E
 XeVVCLdkP4dw/w8oHUoruHbfsDdxuMFdixTj6tcHrSIV5uYY1goIsbfTWz22VkjCpkcrGTENoTM
 TmEzZkXqvMQVYr9FwP2dgP10CArIv1MoZevKNdywzVYdO8bKyK8gZjBWPM1D/DV4XiHXeSqleXc
 jnpC5Ca3Xd/gvRbo8ZeH/9BFmorlewonjXaG2EURZhO+2UIJulm55GILw6ZIBgyutWyzAuBrm0e
 FaXon0WmJg6J6mTyu8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX0V23dCAc2by5
 FL8+18Jl5wwZD3lCXyR/+TsoNzA1DcdFznKU68+N+CqWFDCLWOwBLGNRLBYZ7/3jvbg0pzBS8cm
 Cjb5QOnko/Xum/Om6WuxxmsnIluwwzc=
X-Proofpoint-GUID: G8gXgkILfcB_Y2M_koOBSSgleLCKxqKk
X-Proofpoint-ORIG-GUID: G8gXgkILfcB_Y2M_koOBSSgleLCKxqKk
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b80f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031832_746931_ECF34BC0 
X-CRM114-Status: GOOD (  15.20  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
 arch/arm/boot/dts/st/spear320.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index 9e7c356b1d9e..133015a5dd46 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -259,7 +259,7 @@ sound {
 			stream_name = "spdif-cap", "spdif-play", "i2s-play", "i2s-cap";
 			dai_name = "spdifin-pcm", "spdifout-pcm", "i2s0-pcm", "i2s1-pcm";
 			nr_controllers = <4>;
-		        status = "okay";
+			status = "okay";
 		};
 
 		spdif0: spdif-in@d0100000 {
diff --git a/arch/arm/boot/dts/st/spear320.dtsi b/arch/arm/boot/dts/st/spear320.dtsi
index 56f141297ea3..cbf494419f43 100644
--- a/arch/arm/boot/dts/st/spear320.dtsi
+++ b/arch/arm/boot/dts/st/spear320.dtsi
@@ -82,7 +82,7 @@ pwm: pwm@a8000000 {
 			reg = <0xa8000000 0x1000>;
 			#pwm-cells = <2>;
 			status = "disabled";
-                };
+		};
 
 		apb {
 			#address-cells = <1>;
-- 
2.53.0


