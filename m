Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7E1CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=FNBSw1feoHrOGrWsyA7dCvtXGP
	Z0wtsKO2s5QVQH+E8otSjztAnoMj1aiDpI5/5y27by8TgXIRYS46DCYyZg4o3CyxkXNjK5nAfdsbT
	VBp76YXz2BvRIT2xeQZYeBqQF3sbk9Tu3N8Z7hm5T9mdpzPV9UteG2BXeE18Cf5/GkKzNr020u6Zy
	AIeulSvfmLrenjxvL2vcYmmVhEAwUGLbPO0rar6NcQ2x10X2VnIS2+qsXfwrCERu1dryzcLgPk0v0
	1TB/inYftp6UMnUkzIqUv14SZVdxLTIP3tlZQpzsQcTe8fXkGIhZZRsK/NvivNaRCAbmM9pIiBHLu
	IQH1Y0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VS-0000000DkQ6-1Pt6;
	Mon, 15 Jun 2026 07:13:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VP-0000000DkO0-0ozy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:13:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6L33J3888570
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=mpaDXtKRhMK7OYTP
	RwOaN5Doek4boMEUJmviyJ9rMmt7btz0zrYzJy8L9NEfcTj7E9l9UPe0iZx8W1Ph
	shR/llTRbdUUZfpzCWfdAmk5oOiKSHs/M2gXSJlA+CsoFydSx6jm+pm5eNkRpbmD
	hLDwhBXjIweJKIfRzLip2z6YmhHfnDvtl9oMva4yQLMCt7zkOSy01muoc1jWxhEY
	CwelikNIKaRIns3MqeYpmUFFcR5rtcR+XhHIDHr7juGcgTsf0bgM4W2Z/zJlwZ3E
	48S10s45ofrJGIEdWgMzylGutOXWqXA/KN4fZwet4mFxwtjMdNBKfL2M9K5bKtYB
	liJPGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wx4t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c3620a6faso1077941a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507589; x=1782112389; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=Z97KmEs3Q8XrpD/ROtV5FTlF9MdO7DiUOOf2iJhE99meubHmGZgz9EwsQ77cCkZK2j
         y90SBFWF9zI4urcgf/3fspD86PHdgqkbah0Mc0XPhZOCx8tpQcoiJfqKkbZizINRtkdP
         iHfFCUh9UXv3dFEWZY9s8IYdFJWCXXTPol1oDOnUdND81s7jGfr71GZeJ/nn+D81s4i8
         vDhUPAr1K8QX+6wLLhyZ8P8+jVgFiifdbw/g6g891E1AuM7w6korehoVcjoG5Zc81HNt
         7HYK3ycnBC4QqUhOiBs3FF0MLAMLZ7eWKmQSsnLEeS4B9Nnfx9cy6kqzg2yTdQEyzK2J
         pDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507589; x=1782112389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=GGE0FNJ9lapuO36GqTDmNOqVailtPqSRk21nqQBCGvYWV5iRe5a7aIijoxVlCaX3CW
         A0ItKDutQMnWN7LMUb2EgHvaJIoQEhC0r1dRzTc8Nsqv22lzban22+fj+4vt5L3V4s47
         2DEfMnVUqwB/HqVydEqVHKNDAvMXGWwXMwe7hXIvxew9jeWejsj3f2x7YcGdD4shpnXb
         S/imNYALNQv/HlOpjCaRy5Sku5wMq65X0b3/sR/DN12ZEmo9Qhfx7grUEuC9LR+M+y1v
         fGIBDsfFGZsEMLP6JsjS9eqyjFt2lrSNMQHUkJxBnlUe/KWlDaQKPDuBwzyxpmrPCHdh
         8cWg==
X-Forwarded-Encrypted: i=1; AFNElJ9CWTXknFzCWqjpaRYa65s3fbKR74+XGA3YudfwTNViY5DcoPVUlNDML0s2fK6y30zhsMB/eCZCmmJ66IhJblDZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwf4/N0ezDgRD9KjD9sJuOcVgA5VjvML+uWgxD9iwOibD5zWnb
	vZzF0KJRGiqQMoGud2SjEhF5I0ozB75TZIfF2HdLbyon804z3npeJQ6jvnOPwObrEIgUYRldsDv
	PQUXwcaFOE0THpQSi5ENBIe+cnAdnMqsBzlwYYMYVezvv9DZ/N6spwk6LlvzvRRP+FLeHCVDsNI
	9eSA==
X-Gm-Gg: Acq92OFz0dapDLCtt/xO5VeXgbk0hke3ZJddu6bCPFobJiBMvinkK8iSSmsCDFscasl
	cu4Djx5Wav/Ob6oc4cdr3w75Zj7x/0qZfv+e2DceZ7HvBThpADTjodeNocLbLYv0BJogCvTRdZX
	KfIGnOCRlC9Xvo2N/LvRgiqgBcLmrVhUuctkEm0r1OQj+XGUOUGMvLwd2Q14ESwxD/cXiZ6FxD4
	oYFGNognn7rmEYT/jd083KEd7oHIFVZC1b8gpOcWLxUWF4JZnGNY/wvz56TeGu1IXmRYTkEUA4i
	WeuDqTZedzmRKvIENji6D069lOD1IhUz4sXZwgqaqYTvFiX1+T8qTD7qR6dMadH80Y5kGXc93ov
	ibajE2X7z4CqLsKdJlWFxQ8Owc9maXBWrV8FBmL8VHwmZ1S9Dth6r
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37c2bc42814mr9470968a91.1.1781507589234;
        Mon, 15 Jun 2026 00:13:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37c2bc42814mr9470940a91.1.1781507588775;
        Mon, 15 Jun 2026 00:13:08 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:07 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:15 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-4-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1517;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
 b=BUXma6q9Gyn2swW58JKf5dAcZV8fecETY7r8PGWQEBejEnOm6JzM24v7xnDk/1CRwSH5xQIw8
 Kyn9H8F/NuJA3m0GP83IuA5KK6byXRSK8tcHmhsiOsKBH1ngD0WjUAW
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: vgMdFvswS9T1N7Fw-tIcBRqjDSvXj3wU
X-Proofpoint-GUID: vgMdFvswS9T1N7Fw-tIcBRqjDSvXj3wU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX9UM8tAAtuykw
 7Gxvit6eCXgVi3DTRhCwsYOKZgpDrrqo0ZOAWCY4WL4EKIEcet6X9i36hkTsOOMtpg5j8QDMzQj
 H3z+ojxToyyi5HGpYftsBbV8Bceqsaw=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fa606 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hvkXKTiNP6R-ltmIA9UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX7gtzMb1Vr1EL
 JZuccnkXSg040/OscRMOfmzMTM3+D5kTfTpVRrJqyyTJB9RgVGLqO3ic71cGQ5ZkTScZ2frisTf
 K0ViyUAJHQTjczZM4rolCEcAUVUIPclApGdQLdFdqka+/TNRpZWLqBDkxrZzZurSRBUwg5/CkvJ
 R9aTAsapzgaHd5VZHbGKC0fSbkbPwgju3U127PnFpdWQbbxzfU7nHGVDAvqcVpqdYJUV0zVVKRd
 csyyLG190uwPb1+NDHrRaUotHKknnhJHnok8zmxNII/mOP0TBB5kgkBxoB/C8wC1WHWX2+uOmRk
 /HK132UDGUMFRCMJr3Rf70hRPoGO1DnIChzqyde2gQTXFDfSzqg7TUt9gCSihlm2OhiuNI6NwLG
 IdJG55v4osFuidjJZuHGTcRAuLpsQZZtU2g8Sj1sdj7IRsX17+vkGZZcn9BIjJVbcc4/QTFHC5c
 zNv0QIroIyblhol4Wvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001311_359020_D02CE4F3 
X-CRM114-Status: GOOD (  12.52  )
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


