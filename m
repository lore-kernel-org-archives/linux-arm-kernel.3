Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0B5CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=DsPJoINRFY8vfeqDZ9oNIQwbd3
	IKt7T7W9ZFKHzlXoHeSb0OU5zXqqxl1kulwUgQdPLUGtIwbveYPnjGxOZuZnpPccCs06jnf+VTTQ3
	EaJWdgWhZfbXhwjPHwLfRR+p/tb+zJ087TSfTukpXJa/u3o/r388h9pPVFcdpg/Jkb8bvpPnK8fPF
	4xlp3ArJ488kUI9lsaoBgsf2UY8/4q6q45hfOq+F6Ni8MftZC3u+wRqVYTyJT+wraY4Pn/5ZCC1b0
	tWieW0XW1dK0F9LeICr3/kjckMl0tmIblnYgD0C9Dn4URMLE3MSLdCBtcdT7MLGea3NsF9aTLoVd+
	F6PXtB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2mG-0000000DspF-3ruh;
	Mon, 15 Jun 2026 08:34:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2mE-0000000Dsne-1tMv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:34:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J0bb3344558
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=C5bCOD31o9X8JCPB
	EH2SV7jxXq7pOagOvmzO9qdzXMV1FzPgAgfTTe03s8GZtVAC0R4ARKpnb9Aur9Mj
	euFZsY8I13LIJlZYeBDbhlDLmuDi71OkTV/D73twgXMIEcdZ1V6Lw0ZlwKU632D3
	L4FJv5d7s5xXZgfEdhf8S6sjH+CLxMSMBVHljkwQMZirYPNFRzrWV83blw19li5P
	DOyU80Q6zRXw82R8F0SRWD4yeAG8iRcEPio1kTTpo/4QAFc51pg1ZrIWI5KKLjTL
	dYTDcKktDUTmn8TzNp1VMdYjuABtr8OKdee4cdwnpmoc7Tb+UNSj/6BuaJIeixLP
	UmDp5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9feegt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo13180225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512477; x=1782117277; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=EDLqEeVvyiyyyaQUoX3xKHkVWCmQg/nmaxiU2H3ZVNmEa0ghCPPjOtIJe1WP2X11TJ
         +T4bXl0CpahHojR39PLmBNowLAeO/yspK8L9dxAb4z5CgAjb98kMhSrG2Ab+sMYKyiS7
         Qy+iLe5PknMozh3fmIZa8T+eQzFue1Zkp5YpuqUU/pBArQ+YtOXocQIujpU120M5czf8
         QUR8ELrikSe5qNx3Bf72SM/mjnchxIr7tkaj85Gd/+N0jpBlRMb6WRJz48hDsXH1VZj7
         uIT6Oq3/lvi4RxkZLllEQcZ2rhq/AgEU85CrSBeoMEGmCJ6wE0rZN/n+lITuFaRW/ANV
         TFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512477; x=1782117277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=hp4YVLSMKFxc3PIbdV47esJMfXoNUeIQRxwD4t7/yr2m+i8jGfYRnJR1rmfdDgd/rO
         vTsh5orA2siB/Ix9UOBCxnayJSPG3j7HNvrvn8wVL+yDh6pc6zivp4/lwl2msPWGxRH0
         WR/GLaiPl79KAjio8k26LIA8Dd/cqswmo53lAtIuyJUkTnOQQbGCJnp/u2mvirb+hUas
         TiLM4ZpUpGT+Gi3OGTNlit6A6zjMGW7TXYMMEprbWO+F/wsIokCEWp8kX2WUfIU61xqa
         QLSrE7v0L4sCURxuHhTdFR/Gek3QiuVVmoaCZdXcGWnCEnhMhtgah0n6kQS0IJW3gpu4
         o7Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/tw3/TYH+80jhyzChEieUlGx/8ULfW+FZefqM2aKUgq+ZO2WkwxVAtDRwq8ds5iSK6ZYy9bF2SiL/ocVq90RyH@lists.infradead.org
X-Gm-Message-State: AOJu0YxdV/kWcKFs2WqVRwpZYsQZZ1vExZGLixTPzHQ7E5S1pIpwrF82
	Uwq4H4JSI2n1vvDR5m3/ACIXpLoKctwrR6li/439ThEU9q4Viejgk+dTyLHWQPvkYvlVyz/FBfX
	vOxPJ10RlGyBEIHN1U4aI5xcuXeN2cB3fiSZ9lPGdssbReVlMiyeIz8pztYoz4/zPcTQ4kEB8U5
	6o0Q==
X-Gm-Gg: Acq92OHFaFys2o6SNnYCoSnR9w2FPumba3NKlKVWJ/n1W0WD5cQQuFw/iywjj8+Mwz/
	aBLOz4zGy9jZGIlOJuE2U6LCRpUqgW2aK8uwQzAlJYzKKtS4Z+iTjJw0QOKxBkWHHq8s1ADatOh
	1T8JFzJTZTOfT1yWU4rU87P4bsxPk7p/eFqqr5X677JvZFoIoL0Eha3JLKRINlQRebVALrWrh7Y
	waH2/EFQrX9ckh8/EQeL7qpDjVKaExANJnPL6ofcV9aPZAmmGlm1upNqfNpyDEfv4GfInvcian0
	SyRJ4ym3Nm/O8Hf1dbMBU76H642P1JfLTtfOrCpiCJR09E1HhPXL78JpXq+U6RXkGMF218vCLwk
	lBNF4D10E7TkXe25Z8s2KUsLBgszqnly/HGqyynRzj0kdgYmpOt9F
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117854265ad.20.1781512477200;
        Mon, 15 Jun 2026 01:34:37 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117853835ad.20.1781512476725;
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:57 +0530
Subject: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1517;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
 b=/pRrOKK556VJkn2xvypB+WkA7Q98Cm4fvxRg787rFyzv9ZMhta35uNAd777+FV3JUGfvNTb4L
 we04eBxSkVqARtkFVUcK1QgfUuGB183k11kRiNV/HxlK1R5An9FDIos
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXyLbTs+mrmj+I
 0fLoxS60n2sPKEC3tw7Mzx+Yi25b4srGLnPtRo3uxEeuocmfFBGpODlG55STFGtWgOzABJ2l+HM
 JwSwS/k6VsS+Q077JZTyXQMZQvgpc4i9U6Tx26n2+ICSYJHeFeaMaDL7SeW8P4jgrxAcU+ovF8C
 +DtyzKYqKkz6W2F+e6BU0Pazx9MejFeS2Gm+ROKr458lNkMMMmuIiipWh/C33NBCfdnmOuxu6NZ
 qBzlNGPvBS4jxtLAIN5TPs0noxH0y+gOTA08iLsaWtgE3k7vaZ24eg+kqLPL/+uAjb7zAxHoV+C
 c+VXWAOE5kWSw4B/6OnbPRVvGKWQD8EOKx+msVM4YsJ5146ltJXSKslz5JVZa4WRDjKgmiUTphP
 42qvfBRMjkA5MUAIgCyX2F6OQrQF3HX+rFHJAJaBBMoHDzOVTG958/9/50LxZi8BsXRh5ICZ9ID
 YcE8XCyIqxsaABkpjsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXyQjBHEXt3vTP
 WsWFbfpIXcKwXmlVq3Q3CKh86EdZlBVgPzS20T3O7isBnGusJ30jcjUUAG5d7G5ogr2ojOtTff9
 y2eSNK6UDUhSIDqzXJLglFhQELRqStI=
X-Proofpoint-GUID: p5x_iF1VOvk9dGSeYCjuKzvftCBdFCkF
X-Proofpoint-ORIG-GUID: p5x_iF1VOvk9dGSeYCjuKzvftCBdFCkF
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2fb91d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hvkXKTiNP6R-ltmIA9UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013438_490337_7360D060 
X-CRM114-Status: GOOD (  12.83  )
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

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1


