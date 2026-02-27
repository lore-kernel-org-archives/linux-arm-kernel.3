Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5C5FD9E39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=; b=CYdso/UvOuYfXYy9ajgcmqmwOa
	Ov5O/cuc+NrGFqE3GPko1fyPYLkCNvb4lHwcxOV7iAM9MtDGsc5qqDuujxjI3xVNRk8mOCkB2Sjsm
	bqTU+0WaWUVSzoDmvPwtzwA7qZ2qbSHWouBmdoa+DpSgQFpIupxHZBDj3vtmz8+a95W20bYbay2Bk
	4VgXTaDN6u1+rnhZY/Cmha0pjbawi5BXgDsmPfylrv/uIhsRmEHTKs/t89c/hkVQjYBb7bcanyI7U
	ZA2VERW9THCSkDtVv8fl0OGx2dozuxUXOxz1CfbISxXn71gewxbRb1o3n+Dfpf564tHVMr59LNuby
	SjwCoyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqQp-00000007iJi-2FpA;
	Fri, 27 Feb 2026 05:30:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqQj-00000007iIa-3x8x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:30:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KJOh2440245
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 05:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=; b=KGuh+4E02b29G3iK
	uei2w9gFmGEF9kqf7+If44Tr0n9m5Jo7rlWrQwo5DXYlpxJ9nHmOoEG3V0n1Qk2F
	+N0aFzEj9FfuzOxFs+VkOzUwyWCDuargARpERKWuU+0uatLrF5ERzUR1WPFEqvrL
	R641gQlvVZHYgw1cX7BLf/Ezetm9wWCU8dDPOJ5ytjMesEILTtgcDfj6T/PLQ99Z
	Jxh3Afgk5W60Y8Y5UXy7MvZUMH0j+4YYJclKaA3WD1gpGMOWxeO8MPQ2WsUuqX1y
	k4xT66/kP+FTMZ+uxIyOWX1O38GkCqbSpzxexyCwupwjlxxkMEFAt/+kWm4Pqn43
	8lnaLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r227c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 05:30:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50336ebabe0so288168061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170224; x=1772775024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=Qaj9aYtspGmpNDyHLqbMjgHvvj++mL0c+i8SB7BFoGaz3egbCCB5KS9SuTBCgM+ooE
         OccGRr3KVxB+RLX7dFg1wOYk22+JDs3tvqwnUfqaYD8vFwVFN/cioa2cT4jDaw799UOO
         A18OyPfxFJXMjJN+renDzhX+iC2C3WVxKPBWDgK5qhDXEN/C0O2PeoI3RvFExNB52Nq5
         faLk0ZtkW52A08rmsEE4O2urBjWQ6ISb3bU0p1DQ3oQ7ms78SOgQILAid6FgSmdkll1M
         k8M+xA7Qd6QbGOlxsj6Eny1x0QIS/tZS9DadbAgjMU8VZXZb2fpMzXP4kf6Zg5pkWGIT
         q9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170224; x=1772775024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=bgjSkR9lcpnJzcLHmxvMcyLYiWTt7ieNIeNgn+peJBPyHX5BfRILyl73MoiTu3haAw
         YNjfDpICXnw9BW8kEwjSAkzaqsUkfmHDOLjqyPx8N1Txpj4KcsHpqRMXXxzfeokkjMEY
         4Q3/1LLNnxyAv/muDy6WJGMUt+TpPrydJExoPxZTni4vb69sBr9dF3pMGcgu6jTIpW4E
         GJDFkjMf25eLS+077452hPRYmp1Psk2fxKcwWNm3VopYxZtCIrRuNs5JekXddVFsfKbb
         3m0w7yXkikfpG3eaVbbFzw4s8rTvL0zY8ddURb6QJ3CVWRz+t5zsPtaLbqz6yLxVzysh
         K7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWCtV717dAY0t23qpGcsmLG+Gi+88D5k/4LPDhyXCyy2Q3m9Wreu6RMDCY97uAiD9t6pJNSJQLck5DhsHxO/RZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPFvtQ4E5TVcJKMB+epoJRck0qo8nO7/qt8beXyela9vIPCQjO
	SF/jKyqopfwKdWUjArjcu2bMG5TXANJHkXLmtT2gLakx/L3Nvs+ugCmnpFBKbQ/CHuJgikYFXH3
	fFipMnuTDQI4vhBlqZQEpfFwVJGQ6pxfj2M1A7P/auBfrGzhlWyFy1IMuVjCGK+kmSMugKAGxHy
	ZG4w==
X-Gm-Gg: ATEYQzygBFBjbwcJn2RLSLrEMjWkyV9RP+jW2XqPsrZiVoGefG6NsGGhDAPSbOfztr7
	Fm9hO27HsEmozb/5vHpnSzsRTwTgyswghFEy82BWurtMVfY7tzflJocTdCNI+yAgNGT3Ic4LnHJ
	DcpR2xP03nAF76/Hk9gU+P85nhzqusDijZvIxMsp3feJWHWzVL5DnqQaGkQ6J/G4ydNwSFmhvRP
	lziWahqNokto6Y9sKYp0ZtHSSNkI6Xx9L44tuae9UXXGgKj3QPzuIZMicS2fcWFgDBsHN4gSCQI
	mtjHa1ew7hehIBQA6l9llYOgSuKt67ddhoDCsfOr4xtFY3i/oSPTAeTaQ/RKRut9wWPNr78KAHN
	gGhsDz9/3wmo5M6s3rgqZX4taiXPqQl4PSbeMtDjmcasHBqb6kS0cQ9yediNn8AuRH2Pvpsz3/O
	LiK+Lq4ogwWUIi
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358886d6.4.1772170224393;
        Thu, 26 Feb 2026 21:30:24 -0800 (PST)
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358556d6.4.1772170223962;
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:29:39 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=IYed/TsJ48NYi3YoYbst6rSy78cyZz0ZOFAmgBTc1rY=;
 b=wcDlf/QkDAgruk00v1eTPzarMz1jhDFufYxGfhLpm+N+2tOKBdGxcP8oE/vadjS6BrYi5JBJb
 aNQq5XBz2O6CeNBibWUQdjQeMjYGsWsx9DQ9sEo3CsF2XkVn/zjQChr
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfX9KnoJI0J3a+p
 kUDRu+C1BbC1ZUNAn42ygQNTO7udeF85vBTRUjZkEwV0HhufgGf1fxHWLlRPICfUBJAoauFvkLm
 iJGJUrNU2JxY/m9Mhj6uI11aVOmzSYBMCexIfi2tmG0vc+hlkRv+XklqsaYqkMagC4Y6KQMYvZq
 tCFy3/mm7QZUCqj73iU2GJnMSqYaQ4akez9G3Z+nALvhK8XNxtqFY1gcxmhbI0PKQrU+uZ7308y
 AyFek5WHLabtfRuijA4CJVC9SjFS6qddL21r5N9ShQqb+Opd3XqgMUVCHnEXLiaKygeHKsrvaZw
 5UA/4kb4u3b5ZbulJYcSLmrzv2OAeJ6hRqx9CR1WbM3iLlIlMIaEyukjf52bxcud5onodF1WoSJ
 V9t2NxU+gReLa/bBl9d3lKqtbwyRpRRj2alanHBefsngJf72L68WbSd68rK1TscJUDt36HDNVML
 +qDSKYy91JrLen4uEVQ==
X-Proofpoint-GUID: 1Nr-4YK92rL5vzSu-T_MvdX_e7KA9UKT
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a12bf1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1Nr-4YK92rL5vzSu-T_MvdX_e7KA9UKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213026_016755_7227AC44 
X-CRM114-Status: GOOD (  12.45  )
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

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vrer_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1


