Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BC1CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0M8aFuc/Mt4pPM0F4HGxyoaCM32GJ3Ozi/GdicAL7h0=; b=D/dSLdbGguEUXgUU57zSUY9hWO
	EFZ01ewOqbuvia9PUYlg8aPD8d3L8WdUGSlliVviuXXTmPhe5yVv6D2z6JKyR6AMaC9CXN0jf0FVv
	hFR1zbW2zoHQH/fWxk/p4/QY8Yk6H8a9Je2NeHHQkv4Lm5dqZLJJ9EfOvjRh/c9rZxX/uJr9Pa1UE
	gmfFS6UFPH/s1n++UJLF/pdUmOMRwpLn7n3GYzJHe/DFLYt5A1f8Drlmg2hqN9Dn3b8kjEfpHcI91
	YhWHB5YQaMHAnb1Lvl+8VWAsJ8P0TR3j09qMJKOQ8WJH//jSbm6Emd8d6uuXrRyodMaW2a6skPkeO
	mnXqxSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRy-0000000CIX9-3i2m;
	Mon, 13 Oct 2025 05:50:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRw-0000000CIUQ-0dBL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:50:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n7HY022230
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0M8aFuc/Mt4pPM0F4HGxyoaCM32GJ3Ozi/GdicAL7h0=; b=MxD+DjPqYW0HvzNf
	qaiS5tAQtkO+rNzRf/QPa582C5tfg34zPuedcH0eUQbQDhw7p9Bs9uoYbOsMBokG
	lJxA3Rl2YjZeKSvoTeTuysaGJYNYo8VL2EpEvsdYHfwh5rbng08Bvc3Y+rIVi2Em
	j/oEIWdAUPuOhnXmUJxz6336lyXJHdlrEHLmol64oRU5TybKfRuFYvCCh0IQQKCG
	scW47yaAZA/mXs8s/xz7pHhfdR2oekAhUrngtadRIaZ+xDUnRyM1Gd27IMBlghbY
	wOVW/XXNXNXoVCXNEef/FbAuuEqU46CeEOVKfbEXYf9A2Be5PzQh2DYBwbm4Q7dL
	xLq49g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfu9yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso6246965b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334623; x=1760939423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M8aFuc/Mt4pPM0F4HGxyoaCM32GJ3Ozi/GdicAL7h0=;
        b=HFracNBY+pSg6+14x8NXfq/ySESvP8nD5neKIvFoMIMRinpTq1RYc4EQjV5bRTIuai
         5uNKCIMUNBMU2ewGATr0eI94+fctVfLbiQx6ciGabu7hKl9JdwaJ/0tpgf5cOO32hp6u
         1pM/eShTR3S795pgs1SvfvBvAKAT0VkopJqR+HE8VK0ixVkvh6zIx15BZ+bg/msk/l9D
         NrWTHi7LRkgz+gJvYv/0ZZAAja9SS1UKCQVt/mHtg8NCNGw9YNeT4jvTk7NvZ5FBEk9j
         H/2pYnnrFCOLJO93zZaFhjUV81rit6Q0yzClbocOu7DxBX78GgZIF2UDAeVdn8WYx4hv
         Qgbg==
X-Forwarded-Encrypted: i=1; AJvYcCVsod3NwHEws5bzVGump2R2uJvU1Y4bEK9/8Nph88Q7D9QGbWx3a6dtL/xRoz5qZmWoUcHFgZEaOo1HGbcbuhnR@lists.infradead.org
X-Gm-Message-State: AOJu0YyMnaMjVrUQ7Fc+XCpKTusTFpmcVK5an8+s/UqH5+bgr3WNjQOS
	DcZodnMUpILmdkccU5IrEVFnp+Eu9rDZ8/TclnZvPPd27/OSNPZzSHBMxeqVOUuHdxpAFYihuyh
	bkqzQ2n7NkSXl9ZKkiicdVB5JtEhtskunKQXag+G7Xjg+wzb3K6Jm0wMXq5SxlghUZpcZ+jbvxh
	fhQw==
X-Gm-Gg: ASbGncvxlcEpFL7yYka2WiaOMnd30kmr1rZeguULwMT4bQSbAfrSPXkopep58ENrBHP
	9iBLcy4HUcThslCwNihknfdU/jmZ08UjgFkuPiHW0TLz4pcAnJtZR3pkqQ7cnJ7tizq3WxlRMGR
	O1/LduT2c2Y8IAow9l5Ws97bbl0m22GLeEJ1WFU/Osgfje/IOji1qNS6mdEWM8OKgfvzzW4rhJL
	rU0gD8VpDJRme0zgkD5OxSy1bSuaubLfmkmi27t7ItJa7ye0SZe+TwncJYb539aDAU6XACaKmb5
	Ri/jQsiqJvTR2butYt5Jo/P2OFtRxX9bY4NBuVoupgI0I2dH52uJzLdWs91oaF5eR+b1A2lKOnY
	Ul8nsrwgJBiafKbRsVZFWbDgDKNE=
X-Received: by 2002:aa7:88c8:0:b0:77f:143d:eff2 with SMTP id d2e1a72fcca58-79387c191fcmr24271684b3a.28.1760334622725;
        Sun, 12 Oct 2025 22:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhxqXXmp9aEfaNdrdawUKaKA995gCx4boRuFrdQ2UN7/P23mvgjKwBh/cZOO4Q72gPOn4TVA==
X-Received: by 2002:aa7:88c8:0:b0:77f:143d:eff2 with SMTP id d2e1a72fcca58-79387c191fcmr24271663b3a.28.1760334622267;
        Sun, 12 Oct 2025 22:50:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:50:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:18 +0800
Subject: [PATCH v7 9/9] arm64: dts: qcom: lemans: Add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-9-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334568; l=820;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=puH6v1Vw8fFe9wl3mkMKP3E/RzmfB2TkYXSNm520xS4=;
 b=lCVal94BR6nfoZj9iRzi5oLBXkX2bW2qsDWgbK4ssNwarQ8S6PvoWe1Jr5TdL3CN6BcepOykS
 LOZCdkfTNQtDl9LIWvUXgPqM3VB0GER4lNl226C2t3sSICX49l8WMez
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX+DBAmnxhRSQZ
 wl9R5wwARg4d4tBfgKaRwAvAoCO/NhLo+vqQi4stF0pU2sr/A1YTV6PxDskHJJnxdXB7S5Z6n0g
 4wDCTG9sP89ESF6sxYkQVxAhrDLYgCNN+NzF7tMOf8XEkbvbbuUN/sa6wfLEfRP+g1vA372sa7p
 d1F69wo4RFKCIy0+bHPkcK5dgsYyioldom05WgWrMcUh4uTBhZnGW/kxaJb/gYhPPAoo6tG9vRc
 87I6SV/2Mp0d+l473SF7mEn3dgrj1/gePCFx1127eKN3+fSXII2GTSDZjQgBpxI/++MrbcMFLZ+
 RjexjqqCrh+up7wNz7DM6o7lQb1uBkCB1Rl2essft6Eqzhup9LyCgNNlKSE7ZmtUEgcgkrX+t0X
 PahP0lVV6mbI4K6VrbWa/OPCUM95uQ==
X-Proofpoint-GUID: Cqohj-Hd3PU0cGz7-P-3Dhz5sjaJqpN8
X-Proofpoint-ORIG-GUID: Cqohj-Hd3PU0cGz7-P-3Dhz5sjaJqpN8
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ec931f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_225024_339945_A9F19C3B 
X-CRM114-Status: GOOD (  12.60  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186ed..9e4dbf7c4a11 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


