Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2816106ACE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=; b=E/K6bcM6S9YBy6FaxZhM2Tri8S
	Psu514M5JLSRx07mE+NgYHYIJbAcABYcg+6sjws1sV0VB181HR7/apMqwRRITqWfwnCvQaFRfHNho
	4PFwo5IsR50zDabUW4NMJlPOhtQqtqUwn+w+Y/XgVtXKMmg/tKup9dhx9KwDFooeXPWfhkXi0yloy
	HGZ722Kt9jfwfWkBPyHTf9pHzjJYxYB0HDb+iIMvvNbu50+2OHel/1apqhtZ1THyG+qhf18AWjrdz
	p02rxBOIGD5IFVqpBE8OS9oETO4mjZJdn0U5ytxRZkWWWtya7qzJuQ9pEVJp0V5W46KqmyxHBKJwR
	Kxa+lblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYP-0000000F3N5-3COE;
	Thu, 12 Mar 2026 19:18:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYK-0000000F3DQ-27yf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=; b=HcT3BM6aBnJuYCKZHUrXl2ReHz
	byBeXkXQHclEWgqLV3ql3bA6NLAgFVm9zkrDgDXz8Zs7mOpy+iZ+w6lN5KnGipEXviCfAfM/R6qgA
	r0zY0AA7BPOOtfKD+R9Oey8ZkTv/p0RJB6g0S85Y6ABVgsZj/TK0XOF4xrNqtcE9vpUsJiBBTcXtE
	hjKsifYjLRT9W3oVH1ZJwnjkpkt7luIiG3CKJdK3uBzZKFQnH9ZJcNeGO9C6p1LJV8yWoqB/QgoMt
	KuEr00LVr9l/mon8zC7tXbHDg7i2fkfDsEG4K159BvInL6BQIeO6c6BBuDRnmlXs0duPbtC3+BlwS
	xw6BT2PA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYG-00000001r0l-2RLY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CI2aCM3136575
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=; b=Iq7XI1dQfCqeDGhx
	MqodbWVBYaiRaZ1GNmPRT2Z8cdwGMFN8txB4dHKtdgMUgM+eyC5nreuaOKArF1gI
	LWXydwLszlrUGQMSHenTs7WexDy7n5pX9WXqh8T+bkNuCyI9FHr9A1wSoi/s4H6g
	4iD5ZqTCOJL1a8OCGaLG1EKxzcIw0e7tsRoKS8ADR7TFvIPUiAPYkmTe8RFpifxr
	YJgxXRfEdHEXMVe/i45nbvmw4Zsy9z9t8fX7oOhxXlMIouXTMsEYE3IQQ8LMT2mf
	NMbKJpaurEwNes86yLujIIKl7fVu0//dfDZtv7INGfZvHA9jwbA1tjn1X532qGd6
	JBZ5/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wba13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0684d05dso166786306d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343110; x=1773947910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=;
        b=V9/9CskjoSnGVwDuBSIsy4XXeK4CK1phjOgTJ8w5AWwd+hsKakIaOvFf3u10KhuF3P
         PY8p1tY59v/K4Z8jVlgR6UlIAZbyyG3KSZD7CgmHJ2DRZ6f6bD19RWXjwPohcRJtS6Ab
         6WuPFg1RrhzrduDdAau886dAjxUhZraFAEG5s1pbXBHP37ZLmh1LmDv3kpDng5UvMHQL
         yVIfDQWhUGZJZIyeD8a6kGusqSsd3cCHU9rBOJ72db2/XJiJFXoFK1volqqfutrq68wT
         P4aDICMpTFEkY7Hi9wLn+9XTb7+AVjOqbUPh5gMTgQCJPaS+XJswbacgl7ATwwaVptbj
         pfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343110; x=1773947910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=;
        b=qL5c281n5d9tuEpvBXRpFIiXpBMfvei+7340d9/iVVxpAecWBdCt5599bOwdpxbu9P
         VgfNSQOqySvbb0MKbtjUu3h9cnNskZuTYkkMPvWGZsD0wIwdiUgVx42enPpQEVDaPzyy
         +LfFlWveYzozA68zmRWFQAVnJgwI62kcsAKfs1dA5Xd9EOY4XmH6g7gRS43OBDofN23e
         1IHHOWkmzT3kPuvlpt8ZnBcHpIegeWZ0GX641VolEUl+BBDdfs2g0PZgqGazgQ3JzhoV
         PFkESbRiy/jJBnt1NUXCszCsccJREAc9dIc/IX+yDmM0ZZL6ccrJxpfI2vaI+8HU9eBM
         DJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8qpiL4u6CGVn63oLV1U2dxp7If4MsUhXaATmt2y/HfYoLpMkguJiTeO8ji9lf2+zLos1YW4j2SBCkyA4AZrqw@lists.infradead.org
X-Gm-Message-State: AOJu0YxpL0hnJ37YjEPlviBNl1RF2EuLPVlaG6sMQEa3uMhviU9aVqSu
	mpopUtByIBTsJUto40voeotGM3u4eQ7kz2ISJNxoGH6aZa/rqZb+vW3443yQmhFNt68oRNm5sqM
	A3AtbMRYkuM6fE7q6PCcjQsCsODJ8PCIlBNGn5ftFWI7ZhMrZw2kc+QyuLyaZBB5tS6P3x231Wk
	nx4A==
X-Gm-Gg: ATEYQzzAfT3Lj7dp0FPSON97Lt2g5GifJobdwhGKlAr1J9TUzKmSlYTXFDPYsm3xxmp
	kgXdeJQffmSG7EUDT3XFLQgdw4ymxuv1RZGaPB4IeBnR9q8ovEzihxii9PzeU+2fQz4rURkuS84
	stNrdE4qpfwp1fhBw5olRWrpf8kQqZP8uypFO+HxrH2cOAu3GlfNZZ+k+cDNZE640Z1dsZGEOO/
	yfT0FHjq1TP5B4OQtbjP5cHylxSA19NDdbOLAe9gL103nt6EugFnWSMtirQgqs7+T0PnBRQqI4U
	NGnH9IemssvMWNfldtDlB6UKAIgwlczn3vraWL3WnmlGSWtMaA1ZaZQN/C6lj5NUN1m0U+RLczA
	F29D+vM/XyajrmXnVzuuoxVBWosuOp7hfUejyOEA6ZfSl
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr588749085a.28.1773343109836;
        Thu, 12 Mar 2026 12:18:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr588746685a.28.1773343109433;
        Thu, 12 Mar 2026 12:18:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:56 +0100
Subject: [PATCH v2 09/12] arm64: dts: imx8qm-mek: Use undeprecated
 reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-9-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rimSKUgKUB8M7kBDvMqD/j3DAOlWykchI/HohrWjDBQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFoZ2/9OulzA+k10fMju5/S5LkYZG/qGMou6
 K1Z3jdZ1puJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRaAAKCRDBN2bmhouD
 1/BoEACRIp3lO5mFFb+28o+83UC92NjUKR5da1brtzO5tE4+bkBdnKCnsuVtHdJyKvCeM17ECx5
 z/yz/qf3dP2nknIr6Zw+8MuY0U7uPpzXL7+xxncAdRTGgIe476VSqG1Qi4mtHFnKZsviG3QRu0Z
 Tgs+ygsAW7Vefp6q+IpyUL5TrmxjmJH896MOe96HvedEzzV+pbHfXbHk3vau72VHdajSS7+dl7m
 rx8qajCxLxXNFHJQp7PiNFzzBcfBTPJwHw1jarOm5BFzEQa5QXXeNsjyK8dvSL3o0A/9kYspWVd
 r/ByaCnWsAADG/DkVnVRBRGVtbLnjXroA3McMA6Oo0J6hsmWDV3R2Qswod6/f2kRvs2/mK2bpoD
 hkfArOshfpam8UXAgCLIgP/abNojEANuRrhXxBMjNVb9cr3KOwqZzML3AtyZOi8IwsavIlHUDmm
 R8cz2gCiNCOjbu5ytE5nOZHFp8SpyjNnJ4uG1n/3a4Jf27UJAqlkXLxGYfaBJgBLwrlJucOotvU
 CZKHuA9Oa7wBTFKHsZxD8ju3bz/4M7efzPUnEW2Z07MVb3IFeI8rk20Jwjey3ORy6/Q8uKIXLVA
 c4x8uCww0y0HLkyZcZeiXuuDdhOrD9ah7QQMmw/MXGMknQo/MVVQq8qp/r/z5ZOoUE73qiq6kkR
 LlAzD3cdLik40Vw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: b6uqTQkcGXkfF98JMbCtLOeWR0oSGgxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX/HcWVQC1R1Nc
 aSqYn/FlJ/A/4gIbN3NQoTpAmAmFNx2nxPkOJLWJqe4Yw3jEtVjgufTj1yEFW2vqBM25y0XBNNB
 DSr7GVj2rphmoyqKDhTuUuuQENLbBq4jhkhkjw8LLpJmnT5/V1/rIR0Bewmiw7XiiVJydc7/SGy
 Nts2C1Q+VpnG6OSplktdOqJWMMgeqD3c+iBGXGrt5xO9lrPSWeFFPWcxNrT4TITru3NpPnFoRbX
 K9QMpUMenWXQFYvPiJE4BkwK3okhP4u1TYntVxhRPM+LDDiS5oXu6Gl6N5T7B6RO27LuwUuehU9
 Fzpe88/7DlShCm62DiYNaB21k/PY+2pfIaFkJ9TxOp+NO/xcwXlkW1iXjXVFg4rbYGcinIlp0QO
 4y5l6h7j77yc5ap3kSjv4eq6X3N03bzZlcofS3Qek0Ret33fHE9akLE5WSWPoFyAFYaLWJU/kSu
 VYJ0f/l/wZA5BFFhVrQ==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b31186 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rBNLUka9-jj59pslBkYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: b6uqTQkcGXkfF98JMbCtLOeWR0oSGgxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191833_018975_9D4BA473 
X-CRM114-Status: GOOD (  14.67  )
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

Freescale i.MX8 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index dadc136aec6e..2595181504f4 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -802,7 +802,7 @@ &pciea {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pciea>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pciea>;
 	vpcie3v3aux-supply = <&reg_pciea>;
 	supports-clkreq;
@@ -814,7 +814,7 @@ &pcieb {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 

-- 
2.51.0


