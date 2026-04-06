Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99748EF4EB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCXejvIvXzRonAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=; b=2bcOZeN93rCe6YdbD05frSyCDt
	92tKKHTBfkc1ZusSGBPWMg3a+u0Ad6SjgB+QUu4BTfNiark60fL061xwNKOU+jmNbkAmayTZfGFNx
	PKhdu0gUy7KNwUfdscz1agzXYUVJZCLE8M30hgUiBvW+y4uQ+0jIEsEHX+vB02pqgiJdGNNInpJl+
	aoGog2AD74OPlQsQUEnbEYjhtOHG502Eudnvran4Xhah7lIHeC/1ePN+sdwNgm+thrFeh232lX4yB
	61KafAUsadFBvSADq9yxHh3mG3FcjyBzbfoxORQry4WNgxiJNMxnIgebECzuY5JZtbdCz9SC0us9O
	J99qqfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dbP-00000004rI3-1X56;
	Mon, 06 Apr 2026 06:38:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dbM-00000004rGM-2FPs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 06:38:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6364ttNf588177
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Apr 2026 06:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sCXejvIvXzR
	onAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=; b=gtK6v6RnQVpWL0kdgpJjnjka7mt
	dGy7exiRN/TQ3vq4ereBnye38P519mZi3ZW3ZYIu/HeyaLMFjjJnjRBPkvaEdN5C
	cOdWU7JFEtpQaMtCb96BZIwJ5Q+5ISvL20KDs2rarJv8q/wRQ3v1zit0CM6VeyIp
	LncZ6jVu3lD5dU4mpXAbp3d3io4Vo//HPGetMAwlOeCbwMXlNSYw901PdAMsdvoz
	xgbs7gkLS93WsZ53+gz2NWZyRZcwCoCSbifa/8kfHBjZ0T2f07Ybwo8LEf5zKKta
	YLCzI/XpqR9v5sKBhgrQrAn2sHABQ2+lJCeLNL3deT8TNzkY6Z7pV7Jq76Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfmecq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 06:38:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso125144361cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Apr 2026 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457503; x=1776062303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCXejvIvXzRonAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=;
        b=OQcoefE7NUVcbLNYhFTQfSQzaGoIA0vl8yFYMXl5lu0ETVIPschB9wJZ4XYmAYAFfN
         ImhFFdMBUVopQyY2CM3FyCwiVR8vQu2EB9uzQbTWbexyvSFHGvmm0RNi1C9x3bfwlhl3
         cr4mb9Kc5gEgcDS82EwJt+i4pbjc2HxpZZylunvVXiKifHEWFbTabBK49B/QnKDXb19L
         07OYj4cM2Uv0U1bMVkIBiQn+/fIASz18wGzlz7gdbzmWORDaEoc4eaTihZlhjBsHwDNY
         90nxaYiBHWspEhLFczPAXkE7Dr/16uB13kXnhAzc6R1RumVBmM0C2kM3HR8n/rJjuMtO
         KZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457503; x=1776062303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCXejvIvXzRonAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=;
        b=A4yH+w3d8QzhC6ivG2+BwwQVlNOGYcPQ+ABdkKUbH75DpY+E4MFUTMqa0EG62iG8uG
         1tAhSVaPcOetTroqgdg59aitgOrpWZJiSHBG6WX+6i0II7j/1YmYf0zr2h1z2UKrjk8k
         L7lDlkbA84nXdEh2nI9tap1YBz97nk4Ma5XzvhbDHoZe9yI4CKHLEN88H1uMLCCB4kN9
         a0crfTAbo9BDl6RXyt1vKUp54BcELb9ZKWnI39Iv81uZAfo7at4dk8NgX58hYGhxpTvF
         kWu974JHgibuTRa45qXEGuobg184HTR1TQ17BvjLpAuEy69HIzvsroejT1TL5MqnW9aJ
         jjQA==
X-Forwarded-Encrypted: i=1; AJvYcCVrsFkJrs3bB5eL542APEP/2Ep/CuBoqQJqiZ/H+539X3PIWPXJNkVegaF+2rf2d+ezJrXauyZ4J7Z9ERa39GXR@lists.infradead.org
X-Gm-Message-State: AOJu0YyrRy5WApM+WNM6EkwWjABRQYssfvATqX4xX8vdJeG/L4ChTr1Y
	Q0+DaJn3lyqcNDIHdRIecfwm8OJbIADaus0P9NHbC8x3kWhY0g0tsNKROOGv1p1nAWFmaZF5Yzi
	iFOgN2H+yW8zd55bWz3yBradfGV/do0MYZ0hCiVMuTRCYs0rdAIaW3eWDkAuMU41lQdSBdZUmGh
	zWwA==
X-Gm-Gg: AeBDiesQLLuYdeNWGJcdUWNE+k5OLPfdaiU0SJXDX9j2R3iCgRcVU1QNHo5tczunSPR
	ZsMH11hq9cYEeWTDvMBYrIGqEKQ8xs9FQBspeF4YR/R98K/81jUboDMH6F77RhRm9v36pFy5qnQ
	zl+wG7ofKaS6xk4vMVGY9P6v7+kNqz/HHCmrjLKjfoFlxKhXJOjsUmNJQrOfoPgtiV8CLc1QgFO
	vHMOzB5EYDAljgEI6gjQidc8K75kZ4t53ujdTnflqXXFyWlEar/LvVjoJVBNo5Q/yjZAA40zOil
	/buKKVsmolZ2a24Iwhg9vkwOTFk1KsWQwVH3NBYHpawvlPGjTDqzbfLxdaFbY6wGNz2DyApHu2f
	Y/Y0da8y+z6ysaPy+ruviH43qhPzGlJH84vjP
X-Received: by 2002:a05:622a:18a3:b0:509:2618:cef1 with SMTP id d75a77b69052e-50d62a80efamr193960941cf.47.1775457503161;
        Sun, 05 Apr 2026 23:38:23 -0700 (PDT)
X-Received: by 2002:a05:622a:18a3:b0:509:2618:cef1 with SMTP id d75a77b69052e-50d62a80efamr193960661cf.47.1775457502818;
        Sun, 05 Apr 2026 23:38:22 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:21 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:13 +0200
Message-ID: <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=cnSToU0JVi8FNh9yA4D0xjNAQN16uyi+Yv/aqF60iAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01TWXJeeow51hO6xuzeuJNKOn8auMRg1PTfGN
 q5wYAjvx26JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNU1gAKCRDBN2bmhouD
 13WSD/wLwS38Q3CdR0ASwRG7YTDJkR1cjbPPWx4JIdVIn+BN5p2xe6dhzSBEeaWGHmBOufqCYzC
 NJOfa8vYbP00IBTtZX1xUjKOL06nwmW8nIGDHqOLBMxxhMaFFYOKdP3qQefszeFGBlH768yqsHW
 L0knMV2ksg7T+EMm2zQq0GPX43+mmrF8vlHrp9ZKZ/7mvcU+T7PQHaF93bfUJZReVa9WPJ+IGa2
 h6OanYKu+rXBvaxmyyRKxEZcHKiOzenPaudB1Zq9d5aAHeaayK6qZMmi1R/7GFYC39EzYLCm5lf
 /If92JAnEB2fPgeJpCrki8aD4++YO6rFoHENoOdBBoyMY+Qe6NH/kLAyIUOpAh/fnD7XIXc02s1
 Adm5XLAgy+9JiN0JUHUZJRepeMJr/4hVy/e57kcxFijBn1b4FURiS/DYpqkYEjvP3jhDnB1POoF
 6JkB3NffyCXhrRatEPFW5y26EueAeuQID/VubmmVwVZ1NKbcsRbO+vG//INPsL6Uh+4FurzVA0l
 dSJSLgGzG9BpV18FKkXHDicKvgaBdWN3pyr5//bd8pmZkdBFANtM8I8H3pKeGw0uRP+PtRlCmFU
 20VUFZW0yduQeYdCeGQQhpe+tc19MWW1NAt4t6NXd2InRYcgPSUjky+Dym+Es6WMEEee/5siIV5 0xQ7CQSP0flDPWA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfX/6on6kmWYjVZ
 v3CPwjOoF44TOZTBXaidOPat+OG+xA3Z+M2VNWr65iGozJtMORWZPmnJdWgJttnGi4T/nhNAaCZ
 69h3E4ZwYrU/okp33a5UtrIH6Zqr6xEXImqzE4ie9GjI+44iVtwd8AKj4DMqNr8F+XJaokTpISj
 D6Ef+wMekiTduDsAq/4lt//A5VG69QE7CVds3H5+I90evimPxUzxqzkX5ORsRrlITubPF8BDS99
 dgq9zVGOo2O4y1X2aE/FPS3Yh6qEC18ftLIYoNNvUCSEHWb5vtDinuwW739wZAo82wcqY8ZI4cC
 G5Ytsq1EfVod6fG9w/wbD30o7DV5CeGKQKw4DiA13tb+sz+ofweUeTfW0ld3owsu0N+L6uau2Jo
 0WbMng+YyIWJvpHMaNZOOGA9sqgCt6WTTMkU5SHDU9NnCsrNfSQxC4mDJ6xesCh5umBFlo+ixGn
 1vY52S8Jl9ThJ///ZVQ==
X-Proofpoint-ORIG-GUID: NYX0qP63RO6VUekpmVRLrn5CwPO06stA
X-Proofpoint-GUID: NYX0qP63RO6VUekpmVRLrn5CwPO06stA
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d354e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_233824_585407_DEAA0D4A 
X-CRM114-Status: GOOD (  17.41  )
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

Fixes: bf68c18150ef ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
index dbbc0df0e3d1..443e4fd5b9bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
@@ -281,7 +281,7 @@ pca9450: pmic@25 {
 		compatible = "nxp,pca9450c";
 		reg = <0x25>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pinctrl_pmic>;
 
 		regulators {
-- 
2.51.0


