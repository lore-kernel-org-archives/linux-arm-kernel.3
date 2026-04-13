Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E082EBFD1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=; b=3gqUuMvou+M4wE9A0Ohfxfe6s5
	nXmrGfhZspsSugwFQF5Om4XP8tiTMZ2s3IQMtb3SUwS75keDwW+oz6N32soNV/sqMSZx50qkOcEjB
	IkEg5iK2hTsav99rHB9c983wbchgCHPjUsaJAkuT9Fj/pfvOJJv5uvBUSKeKAvf5v7B2iUxb+HDRn
	Im035AnBc7d6X0yJkcqwg4AAFfnJqj3xULsfTBuyBrh86ik74tbzZi70zQ0z6hCOWEKc4oyipqwbK
	aT1Xgd4kr2kbrTvDMQ3kl6ozYi7uIUgBV9TxOQmxvxxvAj9LAus6kfjnWZFgP2O8FUwEwpdW2eUYq
	6ZHjw1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDGg-0000000FKhi-3RNu;
	Mon, 13 Apr 2026 09:07:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDGe-0000000FKhI-3byj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 09:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=; b=IYVdwtkbZyKrT2yA+Jzu6dg1Vt
	254vW+nma7ZJuXxEIZ7/yONdmBijBQRyWo83I/epy3AAxDMMw6B9gWmFaRX1C87IwJqQGFWwmZy7g
	2X7IKz+ZK6Aw3L3RfnHS2eIWwTAKro9oWwkMXZOzhD2HzhriOo+448y4OWMC2zq+f1PE4pSY0K45i
	sTygNuJoxe7q09po5IyAephcVVUrRUzqtLf6Du4bYh4YfqStUP0Dw7X6L9BACuXwGw+JF/vHkcVnu
	IxEqvffvOCAkpyV16u4TxBFVOFRPfzHjoWWGY91b7aLCTQwJIYnQyUuvi3EudNrtLry5qIVxuCUtK
	OcHT2qxQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDGa-0000000GSZ1-3Wwg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 09:07:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6xnoH2662866
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P
	+f8uMLn8=; b=G9KXiMLD3IsO13FTdHHxr3afEcV3tesQP4+fGLFzwnK79WLH9TJ
	z6d0QgIjp2YiUG9vjG0v2mS17+o1toCL2c9Yy2iWZ75RG78lPOQ+/PdvjKxdqeib
	uAwHmBmPbaAhs9N76sZmVJMWmvALWHvgLIzrKquunVScEC//lIrWlk0qveE7zLpI
	XPPB3ILykMeMEP/BD+Ju4Tkk9sBJt1CuPslXvz6RWzTu5gwvrHQSXmm4ThJqIFvZ
	W2Xit5OEKWxt0lUgAodvPSXPszPQwST3DIpDiQD2Sw5k/eTIBMlRyA6PUXgfZ/+c
	60ha2IjnkZfABmIZrfVPc1dpTaod7ruEu5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6mk9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 09:07:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d84b5f73bso44999501cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071249; x=1776676049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=;
        b=V8njoDvskSM3cboiyDsVKOqnBynDAmLfCLc5TgROIltWZV+h352xC9edZSv9Bc2sOz
         3p1bVikOeu7v9HXMWr39/A9dRfkfVKX97P1D3iFchPQw6DJVqQFx8h+x9XaUBE3b8zEn
         Sqi/WjuRi1sK7cOKi9G1fGBxC24M7Wz5It9YsYsnHi2dgLWClhIgQjHCMOuMD7cjbC2X
         fjDifDqY1yFvdpgYMBXkHjY5d8ZZK6OZjRcZfzGUgxwghdj5uTiKpGJBNUOMsQHF1k2t
         I35occTXSi1ALJTcTbFNUKDXrQfyroLr9GBWu7y7Xfw4RMaVi3vch+88xdYecdKmEx57
         stmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071249; x=1776676049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=;
        b=F+vAzzKUH0laSkPN+8/6dp+DZpiqflueCrOtODJmwbx8MjJxBfioDPqpp41Volz0yt
         bYmgt3ebGbP2CDWpjK9vqNI+Mutx/SdQCLRwkWD0CtDiVWzgkq8fTQ/9knrPtTHRc96V
         tafgE9cW4JlNoLYAv6cYar+J/FhmCaH6sK7eGHwxueafj791WQ5KPDASfJDi+zQJ+xFW
         mACu3fniuOXXdPyfB2VSjT+02VJEW1idOQh4AWdfHPrA8bPliCXFkNcW6Nw4L6+xHWjJ
         eFlQGJKKnlw7wewAa34x53E/vmW/88+9cwRcsd90esUi0nFaZi7k67HSbZJZ8kHswdSa
         XbzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/80Wbm855VIR79y27qEHgJHgyB7Ti1QMqJdPoYF5NgjgdDv/dt4D/ZGhUn7JQcXR1wq7fyy7srIY2OmXIvmeNL@lists.infradead.org
X-Gm-Message-State: AOJu0YzKnSTaTcxbkfI9uz47ktyKOh2W70j+c33q4Y4HwPLMHWBeR+BH
	BciseX6N9J24Bi2Zs0oFjbbbdPKRr34g5RZztez6g0ACWxAGz71aE3P/jfYcBafN1mC5Gp47W1o
	7hRTbn1GndeD1Xw+tFEl19VwGBbMe3FJOk2S0crIAQxljF8leLZNR10mialWFfkVtA2ygBepZTO
	9dfw==
X-Gm-Gg: AeBDievRi0PdAQz/isygyeapcFYxVz69qV/98ETI3kikdxfdXwR77P2cAazA7n1QkOi
	w7mZ6zSNBoH+ntapk7vQjui6pE5trZrB3y6efvECAJHyoUYQ7R+1ifTdbzFIE0tDWrxqXwOLYq+
	VdeoEBQyQFvkmboRHW7acuupb0BB+QO7IZNwUtxNaKUzL9F7tIpTUcXe1JwkomTt5GE/HHMMdD3
	rEwrFqJyvkPhHxjWxZ8j9u19v6uvzJLATXjH43nIod0CaIpUmF1HQTRZoKcSo8EN7ncIrohniM1
	B30tY316ne3JsNChD7C2cWtrUhu06tgCdBTr5ZXGDXEooxdjEvJPwOmdwsdy6bW/qzqJMQp2Rp+
	WsC3GG2cQ/ve5Zv88+++Ikptal2d6QZ/D6pUb
X-Received: by 2002:ac8:5944:0:b0:509:211e:3624 with SMTP id d75a77b69052e-50dd5b15e8amr185842791cf.4.1776071248840;
        Mon, 13 Apr 2026 02:07:28 -0700 (PDT)
X-Received: by 2002:ac8:5944:0:b0:509:211e:3624 with SMTP id d75a77b69052e-50dd5b15e8amr185842301cf.4.1776071248352;
        Mon, 13 Apr 2026 02:07:28 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c98fsm30759347f8f.35.2026.04.13.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:07:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8ulp-evk: Correct Type-C int GPIO flags
Date: Mon, 13 Apr 2026 11:07:24 +0200
Message-ID: <20260413090723.53277-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=b1tENQvXY+F8W/xm3g4+DZZXahca+UgV07xvDpCrdHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3LJLy1g4Z3wLsTX9TEjDy5k3oRMGgxKGR72pO
 vd4nUJlFOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyySwAKCRDBN2bmhouD
 11ufD/9ZfBbErQA0qwmvgVga1ZWnncoEdQfgPmQ5Atvcd8AjusNJNHwI3JxEtW4603nVn215Wat
 sFBZ5kd/GbFG/fQy6AIBQjANCQKaCd7Iv54odcNpyoW3SDFeTDDImTfP8TNQZE/acMLO+yxVrdJ
 mppQKhxN9bUvlN0tvBA1xLoF1unBTLUONg5gRj9LA0N8TKaghrtY5sesJrLaqAj0INi2PurPF4Y
 Py7Czn7wu2B9CMUUN+UUnKVsh38kguO3FAgWrVZ0m0bah3VlXQQEbbbpsmvp1/BA7ioMZp4VY51
 yg7rYiMy0cdhO/52ohzD3odmMaTCYMLeH9vxogDPUAf0HsDLnyNQDZm8EMe9lOFQhdQdj136rIf
 b2YZQYEtt4QBjPUNOS2KucLApABH8lbbEC+jecObhc9vGanpi7oXlJQi/2bIOEauFyxCYEvSWGK
 LNgfXXMMO0dsnQyouIR3LZJLEZ13StW/7GWs1+lsuoQDpdQeJm69e0Bly/VJyRoX5KiRK04Pc4t
 UnA4SyICpw1YXR/7a+jFA1O7wWgvufkIBSrLEmYBzrAviVxEIVQuFmSHvHAmP9OLjlIAR/+j8cl
 zRFc7DV99va+L8jJZWfncZ8tkznxc6FCjf74hhFRensYTBrFHQS9d6N3JOD5kOkZredA3CkyFgA pPZvVLJdACruOkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX054IFoIcVI2S
 vIOWPbH1Ry7QVy09RWUchPIifmlK/HvlN9MNEv1ZvaOdPEKgJbJnnN5Caj2+6nX1PBuEjnTw6su
 cXMTV2Yv8uG9R8uIRA33fI+oOUofcgomN2ry1qGtxgPI3YbE8kAScXrOE5o+/UC4c8oXDQ6bvxN
 p4FjYM2jweSAj2EnziUmEunf4rU5A2cYBQGJ2w2A9XEm9THWKL/fZ1S0hqeUQAzLJMYxsefVG+r
 oUPf/VIiX511zOWZSr6G+WPg8JG8HXmz+ZEaYS2u2/f6WfCV+go6pItyrssuTIgIium3oYni0J4
 Hs0/bPSusS7Fvffcx9UyqZxr1LcXSX+E9JsGWUnX3wWuip0t7wfb52b/U2vZVCDZKxv24A7Jzur
 uWve3u3q4YBnvaXJpP1Yujdaxt//aKEVKP/1Qo8sNjjV+QYiqP2MYMGkuZMM8yJwu7TQDD5Ngnt
 oPD4lXiHhcrJdMg4NEQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dcb251 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7SNBkYlbXATC84MHoTAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 7vFFn4BIw0n9GGYinMEfzpVkS_DFYXnx
X-Proofpoint-ORIG-GUID: 7vFFn4BIw0n9GGYinMEfzpVkS_DFYXnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_100737_814656_75FCA556 
X-CRM114-Status: GOOD (  15.82  )
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

IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: IRQ_TYPE_EDGE_FALLING = 2 = GPIO_SINGLE_ENDED.

Correct the Type-C int-gpios to use proper flags, assuming the author of
the code wanted similar logical behavior:

  IRQ_TYPE_EDGE_FALLING => GPIO_ACTIVE_LOW

Fixes: c4b4593ecb0b ("arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..5dea66c1e7aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -166,7 +166,7 @@ &lpi2c7 {
 	ptn5150_1: typec@1d {
 		compatible = "nxp,ptn5150";
 		reg = <0x1d>;
-		int-gpios = <&gpiof 3 IRQ_TYPE_EDGE_FALLING>;
+		int-gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_typec1>;
 		status = "disabled";
@@ -182,7 +182,7 @@ pcal6408: gpio@21 {
 	ptn5150_2: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
-		int-gpios = <&gpiof 5 IRQ_TYPE_EDGE_FALLING>;
+		int-gpios = <&gpiof 5 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_typec2>;
 		status = "disabled";
-- 
2.51.0


