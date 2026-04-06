Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8DEEF4EB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkqsgi/b9ZE29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=; b=Sq2RNIL/gCxpzyXdkps4gJ7XQU
	CaQQCzlpkrxygGYEn5K5MkI9Qtsaz7sVcCOoYgRDlPBMMlEeDqxX0fN8ngDt39bcpfS+8usGgEdFC
	Hda8QDl5id+Xv95g7UO1evaJc4wSvAmWqeLf9F4f3Pw4lChpsIDjZQPc+kkSYYBD8j3miSUpfTPrH
	1zu4IZKlq3ZRobHVBWXAAClA+yJfrUwDFL5ja0Jr1Z//8zmY2tipbKq5I5kESzDh5Epq8f/u/wOb8
	225BzrDP209TAuMbGQiD+9Fm/tr3MRSputHaNyfRDHLrz+r3jLu576vLvRGxtf/yR0UNg5s0H5K2j
	Lr5xYRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dbN-00000004rGp-2MMF;
	Mon, 06 Apr 2026 06:38:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dbK-00000004rFW-3XTO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 06:38:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Hi0YJ3543138
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Apr 2026 06:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkqsgi/b9ZE
	29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=; b=eXpHbvDRt+Y+4uf0JmAFhVgxo6J
	13AsdqvlzVC6JgMSIcmZYjha2BPP+MIDX05acgQo764s9WR78/Ci4KTN2f6bL8dQ
	9fRW3259HTig6E5sno7GbNVbQpDrYUYsEk7x0IDf5Ke4CgRMhHSfIhxlusjj+apA
	TyWhk6OEqfAU8Y1jas8SgYNIE+nlQtJYQZm5mME1a7q/8ZesukB3hvr5b7DrYGnS
	5mmTyOhNoc4/QCLOKdVh+PvRorA4+rGVlItVuxMGrhO4kUFTMjHsuxP80DQafaOd
	VKlCwM1itQfh4BGOpsJdfbMgA6Gh0fnI27YmGBT2KluA37lb39slk/8nSTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1c59p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 06:38:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b6f869676so89004051cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Apr 2026 23:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457501; x=1776062301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkqsgi/b9ZE29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=;
        b=Ip9wv6ZZwS85JdQ5PMnKO7tSejlk1kVWIHk2orez9nL/XM3I1FEN2iO6hz6WtbbCza
         WBb+O2cadMFgs5cndGxyWjrvXoFW1CwbO2n/+KiFbVfVUOdNB8LUCxwJkZzXfH8tUf4T
         IFywjeU0+6EY938pjnA2hzT/FtWPCmds9p04mWCTEqMaf22rNwbfZdDiEtn88wbrBrZ+
         TRH+/cjJBflcZhX82XMhD/6+QgrOOokHDsoaIXSSF5bTiEuZum/Zx3h1Q2D2/Uas/EkQ
         Yb0l6GqsJ09RSNJF9UHc+sonv5qSm7SH00uPIzgD8k6EiF4zLPDvMiRihkQoEi2Mb7d7
         tCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457501; x=1776062301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkqsgi/b9ZE29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=;
        b=hSq4eCdQKoPxV7I8mZBQOc3nG0l2xhnOSYQp04SacY5henkrcNYOXjaATNMDjfD7L4
         MhPymXSiER2iEGN5rX9ceka7ucWKtPJZkXfUx2C0oEiR6F3d6aXla7fSFfyP2VOYEsZF
         h1acoUMvtJkjI8HzGOSVGRiKcWedxWd8/on9tJARXr7+e/4GJCX7wfMHg3QI/t5zHOyd
         GcG69UyjmTtyJvcoZOFqXYCk75uRjMGF9hpd0e6t4aKU3erJDwITu7VoALEU4Uo5ilbk
         GoQfCC+4GKZmFFTqQWIwvtNTkyEMe67xYj2qheUsWjc0T+MP3kh9CoKvaDvZPU1uC4Dh
         1iWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWejnYo+PYyPed+FBbVCfDWecfcaQ8YuciXcUWhYMkRj/Duo0kjQLL0q6VmA83deg+bICv4Z/tc8L/0w+EFimYi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/8T2UQX+KM8KEKcQcs3t8KvyfOH//9Zstuhpf8kiLpQZPv7N
	JXJQIc12NLQld4IrhRmnbxU6vDbnrn69Cb7utaJb3+1pPYZy7mbTZL1nqSsbvE0zBaWL1C0TwZG
	bGUl+ZmHS3XrPmFbDIfDwoiKsmjhRZPdzfKypUaFsPXXVDzCzWBL7BKH/05Yrp/9gaP8+9Jpm2J
	iSlg==
X-Gm-Gg: AeBDiev9xFO4ituZikvG965KysVtbGPSC3ngLtc2Hs08zFiNSwI80/Irp2GSWS+ODbF
	z68qA6k0I6vWRRtfsDnvTxOCOTz3ew6CIspjkW2/2JqW6Zer4I7HfXtfyfJerkp0wgCCRDxB9U4
	Nk7OOQ/CZoP4VWqmpm6AgjRdqgTftp3zvKxJWbVpo3VKpucPKVNTqrzk+fsFXnQbNDRi0jkFoYW
	osqkCFY4KW4MhCuboURAmmA7Hex4Luux9cL8o2JId2qfnb6ke9+eCBtFavPKdN5AmFmMay6GLdC
	uUffDYDRuM+oAP3luZLp6r/k7wNKaOWmO/BN2jqbc5eEUI0wraV/7EcM3scTtnmxLzfnm4X79ab
	FPNEq+JE7Kh2jgkM24LOeLhkwdu+ThrhdY+JF
X-Received: by 2002:a05:622a:14c8:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50d62b34a43mr169714801cf.58.1775457501158;
        Sun, 05 Apr 2026 23:38:21 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50d62b34a43mr169714581cf.58.1775457500656;
        Sun, 05 Apr 2026 23:38:20 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
        Peng Fan <peng.fan@nxp.com>, Fedor Ross <fedor.ross@ifm.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: imx8mn-vhip4-evalboard-v2: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:12 +0200
Message-ID: <20260406063810.25531-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NKTG5+SHcXAW1JXdbaucnX+WCRebKnrDUyFIgU8QTw8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnTVNWiBDD++YBNGt5UAEaKATYJxmG/RLk5maCk21XeAIvfO
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp01TVAAoJEME3ZuaGi4PXlMUQAI/u
 1IdB4Nmf2WXgCBhdFqpqbMpzPe9C09bOK+tFnYAmkWReWHVW1JjyneoNYzCEO6ip1VXva7jbC2j
 tKzCffLLXJda1Jyt+x23g0QKUQjE1hU092/7//R8e5mivTU6JjD4V+HAi3MF99z+iborvYGmUtx
 QOiPDFBwg88/5DDBiqgtFi7vQ0PY3O6UVfxix+kkaAeWZB5CaDUDNYcST6yMRZbKv3Q5IQyEJy8
 BEfAfny0udjyM0AkP3/aIPh1X1UbqRuGYVusV4BgVzSMnMOYJ+G/0eUdb5wjMZ3ZFnqQpR8xWdd
 lpPHuI2KGVJA4Nyquu4aIqo/Rm8VKm6+sfogP6iq4qXFN/nzPvV+r2IQ/st1tR01iUNNnLG/kTP
 Rl1vByDF7vJCeft5MkBwMbzcNdULXbKvd055EsQ9HqhrWcQwQsRLnd6AdKzM63VFGbztLvH28Cp
 0tiMmB8z/Rg4vuAXDJ4QtHzvZL9pigTWjAjvR+WsWWBXxuZwWUW6iA7TeTQIVPuB+zxkTzRa9uO
 8bGwn7zhxHr5ju91o6IJn3autdOVuEj6JGq59bbwPdoDHbu2BrqpIkbWGOx5xXJl8QphVzeoJdF
 REwy/HU6a+jdahbQcjGFdsXECC4MGwLgY0E2UhVWI8cTkOvIbsBsc3G0c+P5reh+JZRS1cB2mqx LJfY2
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a5_j7lK0ICeuFyHwtvFt0Hvjk8rdeXXQ
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d354de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: a5_j7lK0ICeuFyHwtvFt0Hvjk8rdeXXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfXx7kolhZLeXsm
 8HdHwqWz+yuQ4hDxrZk6KAMmwJEl9r+ftFILZGF7ZqOhurJs8/kiRkaecbVN2z4iGDI+e8SZGdB
 Ip+RSPhpDZGI2Rd3wkN+nGHyOPyO5zohaBJaFMJVGjHIJuGLkRGT526S3Hq6TR2Ku4qPrH9DBGj
 nI46ThryT13bBeha9YfGMKb7rK4dZM86hnfAxR0JJozF6TPzymY+i/ofucDi4DIG9rfjUsPpd/U
 +aJfeUwE1/paJsvBXtwkFya6RFhnuiWhezhIDBRnEcp24ldBJnIc9rn0nZN2X6P3OBZABQAcfOK
 jBN6PuKPUJx1WNdwiVq0DIxslM1aALOC/5zkt3SpaAi1bvYp3efVvbaR/tH38tPVaKyyNtYAa/C
 dHiG46IxD/sUbk0P7rCzf8Qao0t+3B86PDCrLp8WAAztg8Kh8wWnXhYvd1ISmzDlcA/ym2Cqt03
 HCqEXlBwx/ndE7nzHNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_233822_925480_B53DC807 
X-CRM114-Status: GOOD (  17.53  )
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

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Correct the interrupt flags, assuming the author of the code wanted the
same logical behavior behind the name "ACTIVE_xxx", this is:
ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW

Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
index 4dadfb7f78de..43fd4d0041ef 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
@@ -99,7 +99,7 @@ &i2c3 {
 
 &ifm_pmic {
 	interrupt-parent = <&gpio5>;
-	interrupts = <17 GPIO_ACTIVE_LOW>;
+	interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &iomuxc {
-- 
2.51.0


