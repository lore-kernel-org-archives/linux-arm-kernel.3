Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C4BC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdB1yxwmrhfVusAx61Msu2KYQKvjb4TsDwRz8D7wCdA=; b=HRY+97OwHtS1/tTgUdlXNFlms8
	WbLHcMBc18BSjS4+SiVI/3pqgKln8/IyJ+HDieBJyxxNktIRkKFi5Rj86mMiJ0SU3JqoGa9kujY1P
	SLHjPUh4jUh3NNygWtfNfpFL4z+rrZo8yR0057pI0ihTH27h4e1G/OabZ7QGa9LaA2bOxukhJSYeb
	rVP1yS7GHhUENBGLfjDErv26nGQCqguwNCEnQFQbJQdu+Iss+jXauGHsWOs4oU9RIOfqqTYBhudRw
	e9sfFcYXjUhGNKjmrmOWGaBbF6mstgjQZS50yMtRnwgZ+6HogvuKiGexBwykcv0K7EdrRsWdw2cDD
	fE30TFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsm-0000000F4xU-2OSe;
	Sat, 01 Aug 2026 21:04:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsi-0000000F4uk-1ASm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:04:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxQve3180113
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hdB1yxwmrhf
	VusAx61Msu2KYQKvjb4TsDwRz8D7wCdA=; b=hA8UE44W2Bps746tR8u4qpoeOgN
	jwRcmAVwGOaagD5bPcw25LLNBcreNjNzkIYrD2nRaBFraLtGJSwb9ED3LRGOAvT3
	F1RH8KaRnDbcBjZtYPSd4OTf2gJeYJRPlq/CC7uA2TOfYBgyJ2TWFP6xwDKeC8Hc
	uY15WEaKj8SalAKsg33M9NGEC8bxorwVXq/7+4rmFtwRW2l7YGGmPuHXroy35yP9
	i7nGic9ZXzIKVKDvPm+ssXyjArVgO5nBUAygMIDin2MlJTNsT6aqmcKFG9uEi+E3
	XgHBG/4K+U5Ue/TutaVNb6vJP54S5QZQ/VX8n6RlVtE+R5LzvhJCh0Vnn7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yghg5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:04:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so270089485a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618271; x=1786223071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdB1yxwmrhfVusAx61Msu2KYQKvjb4TsDwRz8D7wCdA=;
        b=bX5QiMqed0zvIQ2DIWuJz/mrS8As95FO1uDI1iNLtFfja6Jnntyn3Q14pq/BNwMpun
         NY47JuAi8phShYLdgvm/3p7tHL3RQuHfkqQoMQe3ecAx3eAQ+AiV6dYR2zkKYHl0oN1m
         BegR7AhcY7nxIV5w6cAPu7OcNipqDxoxW6KHZ3onB95yfv7ja7RRNLYX0SFvGbhOJ5wv
         mDo7an2xqXHW6lpcLrGAcyrdMWUhius5o4trVQw7rlFzthUCwRt35CEu2wpeq/LpnWTx
         fxD1wKKl2eOX+u1Hjy2BpZRhrWtm0xmvaV3hQicDS4YIawZ3WEBA82NAoYXeaPrApOqG
         Cv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618271; x=1786223071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdB1yxwmrhfVusAx61Msu2KYQKvjb4TsDwRz8D7wCdA=;
        b=QSZ/ThYXqJMBizNajx+BshpAghK+93A9rUC2a4m3I6/DZ/JWI4iMrmVygMtbxL9iFN
         nGolLE3yklf2cgfNHxwSphokJZqa2aLGPoiISuZ9CPGbMah5c6VGjLOBaNvHMnHfMi8q
         7nyJQQ/PMmAPhiJBwHSbKEfPAyoB+eOrsNYeuIW2LfRD3if+9qh2UaeEaCTY6Wb7DKL/
         iy/wqVXGNE2v9qAk6o1QCjiRJsFxw/eefDa7aR+Dvld+2W8X6aCLZaFycUt6Qti2uuJv
         7jNQhTYoqia4oo5J31yq/5Si0GtKy53K5vg3DJWbpUGtUR42hTgVFqVC/3Ur2j5NvvcH
         C4fA==
X-Forwarded-Encrypted: i=1; AHgh+RrlOQHbY/yFPoWMZTYke/9MkwcgqUbrHWn3Q/czZp/HP9LzP/8UosxH3QwW7wrM82p5I+5vrJ7PcvUsju+Ber+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+cQ0i3/8UpAg2fFR058Mos3Xzs8qq2eBgdS1mpHpqwrulewOI
	tI2YqyNexTYbjcdFtnoFHTYZYFTeCSoNII125fA3b7ASIi4N/vAW2Xo3Rm0GX3wGX14pO3OM8VB
	ouyjJm3HzBG8S4V45aUZ1bM1o09oRO+bpjQIt+HHYKT40bfzRCN4AaQURyWiTcTevQ56ClC7CAi
	5KsA==
X-Gm-Gg: AR+sD11RueR+egrqlF1NUVSM9tx2rqIHdawZsDDW6NAhpP7JB9h2kck+Aq/9bQ0PVZ4
	cZg1kiqldAlcI5k00Rz+RvTo81mTlJrUlg5SA/NsU493Frcda9cdq/qs/eVLhf70PBZ+eMsIgvc
	RNqpnDucdF1N3VYhMEOl/GTR5RnbWjURaDWxM2F3gX7jNhNNl6kM0CtqTYqb8EDqDG4BUKJ7h7Z
	7rYhKd+8bpOPfi3kWUM4G5BDoQnZ1GNchX+5MXJFTntFwUUIBdRNTHiSro2T8oGwXKKuBYarYvv
	j/bDIHYoBqnz+IvQMzmRLNSP+78G56waYxof/buNTRbod50DV4MkIZElhmXStOLQrm7ZsRDRllR
	xutnRsQ8CbIm+jT7Y
X-Received: by 2002:a05:622a:1e1b:b0:516:35fe:5524 with SMTP id d75a77b69052e-52b4c4343aamr121982081cf.5.1785618270725;
        Sat, 01 Aug 2026 14:04:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1e1b:b0:516:35fe:5524 with SMTP id d75a77b69052e-52b4c4343aamr121981591cf.5.1785618270205;
        Sat, 01 Aug 2026 14:04:30 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm16911890f8f.3.2026.08.01.14.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: freescale: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:22 +0200
Message-ID: <20260801210420.383984-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11470; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NekE8somN7F8Y1d0sfAtfdG9F87lu6hLh2jLmtahbJg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9V9xGX9Pdi60y/MF1EnjBtYNW+A0vizWJT2
 e8h6v4z8GyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fVQAKCRDBN2bmhouD
 1yFnD/wPTDAeGgQLKd6NpyPzyYQlR0j55HiABrPuP2ivd2e8jDy0a5pz+wb+ZMXwt+CEnVGyR49
 PZ2UD8HYkFoGaYHWVWaMwsXi6jR2yi8Y4GldKMa7QpAT+9AKktZsaojuqCg256VJx7EAqUbxY2P
 QD+bTp2SiQRzoYJ7DepyXbWgxVYBsPj+T0PyZ0LwinW87NLRxOuWwdQu6Y23d+4Mo02E3wcoHoQ
 dStujUOXGoX+wBOxPY2O9EaIRcMk0eGJPpxKjckYYlDAtPGub1eviu7dqHR+z+yFg/wVGjL084s
 iD5VVxkCnXCzISBmP+NxiUL41jYdbKddX9JLMkJbttF8sTKc7faRtjI9LEM0o3QYWYRO5HmTwsW
 z8FVLVGsU4KIwQEFNPQjd0LFmbey3WnHykX6ko39q/hAcx85B4XFTvVe/kLbcQxspzcfMijN9tL
 GY3s69Jq3xtTuVEYtygfgaMUHc4moo88ew0CMmFCUCjGcqi79LMCodWDs+Sphqmn0T0NOHAzv34
 Cms2dNo+SX2kyIisX0KDPrtdP37E8uUvrAXjOlWSIOFmrSLLofwZGp6P5n9zd4dGD4krYRWBzNh
 nPaLGR7xfSXq9kinkX9zUiz13eYZH2tGxwRaMe4tAWxMCPnYG7TloQpoWejkUwu9OVGRElZ1gaU 3Lv7mD8wm11rjTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXxVKeKbYjNmgZ
 pFk2K10Md0kq4Aard+lltveX3rLn/AbvPFmwgXAPj1j1O8jTtg5PBnZJ5EU+2RaOBDr85F4xZzw
 phm+MdlTl/I2YURpU2ClW0g9Kn9sUzg=
X-Proofpoint-GUID: wQwguaYwkuQuHdyIsMdI6VWKdPsQo4po
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e5f5f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=D7IV2cxBcrrAAi4nW8IA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wQwguaYwkuQuHdyIsMdI6VWKdPsQo4po
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXydv8+Y27UHGG
 YYWH9dYavKOYJ+gFfYSJk117OAF7sK6RjRboCrSlDHM1dh3AIWagwW/gRvYBWIJjnThh2iWDEFj
 plLjf0mmLCo2asvWhdU6Iwo1QIZbVgeV8HFlcwARri97KfdXgE1urXdA9bk7XqZNDkPXYf2NepL
 YiGcJQ6ODNMR/bdS37Z90wr+jRQ3i+jqfaqxSNWDj9frVFSPu1+gjLuVN7DZ7NRHlKjMgbrS/H2
 dN2XNTur5T7Wnjg2PPSoWMpNszIiHXPaEQCce5J696Y8AsV4uJnIDzaQvwptqUG20FpFAk3Bi9H
 P8ASMus/+C3/kdFwMy812pWp1WUqtBibAjH14LWTFgRFMcU47B3USsDNhZMGH49L4iFivmFrWjZ
 09o0bM+GofCOLVKyGfFtvph7AJOxt74aHcEuMaOG2gUK3b1LVn9YW1bc2FBPdtTNBsyfxy11c4p
 +Eom4dTGs8C7ZeTmiYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140433_791662_6AE0D9BC 
X-CRM114-Status: GOOD (  16.99  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi            | 2 +-
 .../arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi | 2 +-
 .../boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     | 2 +-
 .../imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso    | 2 +-
 .../imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts   | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi         | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi         | 6 +++---
 arch/arm64/boot/dts/freescale/imx95.dtsi                  | 8 ++++----
 arch/arm64/boot/dts/freescale/imx952.dtsi                 | 8 ++++----
 arch/arm64/boot/dts/freescale/s32g2.dtsi                  | 2 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi                  | 2 +-
 15 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index f4ba3d16ab86..aeb5000fffdf 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -105,7 +105,7 @@ osc_27m: clock-osc-27m {
 	};
 
 	firmware {
-		optee: optee  {
+		optee: optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
index ea1d5b9c6bae..94e18357e37f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
@@ -49,7 +49,7 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
-	pcie0_refclk_gated:  pcie0-refclk-gated {
+	pcie0_refclk_gated: pcie0-refclk-gated {
 		compatible = "gpio-gate-clock";
 		clocks = <&pcie0_refclk>;
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts
index a02b31c42db4..299d81a18c06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts
@@ -101,7 +101,7 @@ &usb_dwc3_1 {
 &usdhc2 {
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	bus-width = <4>;
-	pinctrl-names = "default" ;
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index 69558ffefa9a..affcc20b20c7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -49,7 +49,7 @@ buck1: BUCK1 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			buck2: BUCK2  {
+			buck2: BUCK2 {
 				nxp,dvs-run-voltage = <950000>;
 				nxp,dvs-standby-voltage = <850000>;
 				regulator-always-on;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
index 2cf1de8c05b4..9ce0744c88a8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
@@ -12,7 +12,7 @@ &backlight_lvds0 {
 	status = "okay";
 };
 
-&panel_lvds0{
+&panel_lvds0 {
 	compatible = "tianma,tm070jvhg33";
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
index cbad0cfab292..24f5f932231f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
@@ -12,7 +12,7 @@ &backlight_lvds1 {
 	status = "okay";
 };
 
-&panel_lvds1{
+&panel_lvds1 {
 	compatible = "tianma,tm070jvhg33";
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 0c3f1b20b3d7..a82af92d6085 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -119,7 +119,7 @@ regulator-state-mem {
 		};
 	};
 
-	reg_22v4_p: regulator-22v4-p  {
+	reg_22v4_p: regulator-22v4-p {
 		compatible = "regulator-fixed";
 		regulator-name = "22v4_P";
 		regulator-min-microvolt = <22400000>;
@@ -507,7 +507,7 @@ &i2c3 {
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	magnetometer@1e	{
+	magnetometer@1e {
 		compatible = "st,lsm9ds1-magn";
 		reg = <0x1e>;
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..ad7c0e7422ca 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1025,7 +1025,7 @@ &i2c2 {
 	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
-	magnetometer: magnetometer@1e	{
+	magnetometer: magnetometer@1e {
 		compatible = "st,lsm9ds1-magn";
 		reg = <0x1e>;
 		pinctrl-names = "default";
@@ -1060,7 +1060,7 @@ proximity: prox@60 {
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	accel_gyro: accel-gyro@6a	{
+	accel_gyro: accel-gyro@6a {
 		compatible = "st,lsm9ds1-imu";
 		reg = <0x6a>;
 		vdd-supply = <&reg_vdd_sen>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
index 767819cce886..b91509bfc9c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
@@ -230,7 +230,7 @@ i2c@0 {
 
 			hdmi-bridge@48 {
 				compatible = "lontium,lt8912b";
-				reg = <0x48> ;
+				reg = <0x48>;
 				reset-gpios = <&max7323 0 GPIO_ACTIVE_LOW>;
 
 				ports {
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
index c7d3073b4041..169811b5049c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
@@ -296,7 +296,7 @@ usb3-signal-route-hog {
 	};
 };
 
-&pciea{
+&pciea {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
index b11da10c5ae3..a44351133428 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -275,15 +275,15 @@ &lpuart1 {
 	status = "okay";
 };
 
-&mu_m0{
+&mu_m0 {
 	status = "okay";
 };
 
-&mu1_m0{
+&mu1_m0 {
 	status = "okay";
 };
 
-&mu2_m0{
+&mu2_m0 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 305751046d66..5f8ab994fb34 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1458,7 +1458,7 @@ lpi2c1: i2c@44340000 {
 				clock-names = "per", "ipg";
 				#address-cells = <1>;
 				#size-cells = <0>;
-				dmas = <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX> ;
+				dmas = <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1472,7 +1472,7 @@ lpi2c2: i2c@44350000 {
 				clock-names = "per", "ipg";
 				#address-cells = <1>;
 				#size-cells = <0>;
-				dmas = <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX> ;
+				dmas = <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1486,7 +1486,7 @@ lpspi1: spi@44360000 {
 				clocks = <&scmi_clk IMX95_CLK_LPSPI1>,
 					 <&scmi_clk IMX95_CLK_BUSAON>;
 				clock-names = "per", "ipg";
-				dmas = <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0> ;
+				dmas = <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1500,7 +1500,7 @@ lpspi2: spi@44370000 {
 				clocks = <&scmi_clk IMX95_CLK_LPSPI2>,
 					 <&scmi_clk IMX95_CLK_BUSAON>;
 				clock-names = "per", "ipg";
-				dmas = <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0> ;
+				dmas = <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 020de00e8285..887abb1c4784 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -1164,7 +1164,7 @@ lpi2c1: i2c@44340000 {
 				clock-names = "per", "ipg";
 				#address-cells = <1>;
 				#size-cells = <0>;
-				dmas = <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX> ;
+				dmas = <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1178,7 +1178,7 @@ lpi2c2: i2c@44350000 {
 				clock-names = "per", "ipg";
 				#address-cells = <1>;
 				#size-cells = <0>;
-				dmas = <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX> ;
+				dmas = <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1192,7 +1192,7 @@ lpspi1: spi@44360000 {
 				clock-names = "per", "ipg";
 				#address-cells = <1>;
 				#size-cells = <0>;
-				dmas = <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0> ;
+				dmas = <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
@@ -1206,7 +1206,7 @@ lpspi2: spi@44370000 {
 				clock-names = "per", "ipg";
 				#address-cells = <1>;
 				#size-cells = <0>;
-				dmas = <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0> ;
+				dmas = <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0>;
 				dma-names = "tx", "rx";
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 8dc0c5d9f368..7a846c143ae8 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -14,7 +14,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	reserved-memory  {
+	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 24fa3057e929..771c03caafe9 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -153,7 +153,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	reserved-memory  {
+	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-- 
2.53.0


