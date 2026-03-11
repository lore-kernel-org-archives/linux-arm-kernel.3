Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30834112584F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/GB542IMmzWnaIj2pnKfeVpWqji25xL6rPmBPjh2hk=; b=ok8v9wOVphqm2zEpPEh2uq/EkT
	4Iao8f3W9ms9zQuFai5hjmiLVdPawwcgA7iVk8v2C9/vK7oldLATAc82xKmXtnQXWiL+m1GOSgBLc
	aAEcRSW2pwWVfofMgxGxBKD6nZAbx5aWrq66w83dNb866tqVhOc5MonoPZ3szp3cyMK1vcrz0mTlY
	8S6PziclNZZqCz2MYwMOyzJlSK9e1mTpOdpbi7Kzqyi9tsRZne66z8v+NsHK1+JmPPadK6uPC32A4
	bcIQFaqMP07u3sSJqzS0HaKcajCRY0fVgd6ynqSROSHBg0Yv/ThKau8iy17SlIY0OyGJ01zWQ+cTa
	qFSU7lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M76-0000000Bsf2-2PpY;
	Wed, 11 Mar 2026 16:08:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M73-0000000BsbL-27Zp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:08:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD1k6n2030820
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/GB542IMmzWnaIj2pnKfeVpWqji25xL6rPmBPjh2hk=; b=N2BFa8vrDnXDmhvh
	6Ocouxdh10aJnRY2siGwomoymwu/WkRw8cvaAH/lYKhQu/aTvO1RVl3Sx5iHvAhL
	Ed1XEvlSZDPS4GMHdmmHtcSXkQv79bt1S9RU6LJQ524wP3rzW5nUGX49odwDxxy8
	tb6grplFGr7m3h5WcVb7QMM17oVE41izb2RismYrEbGkwuF5/J4+h410ugqA2+Bo
	51gtu6u1Z9WdzNy4aU62wBKgQ7U3k0YCmhEOsYxtatyO9s9FdHteufoNBQEIYBBO
	Y4kgJpOkPjMpQesR4K8q52wFZEn2GyQETTx6EF1oIdBrp4m7VVwoCBjfteFJfCz1
	jpqcsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h2097-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:08:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd900cd3a7so1591027385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245324; x=1773850124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/GB542IMmzWnaIj2pnKfeVpWqji25xL6rPmBPjh2hk=;
        b=Brkyhou+W+L0YGtCYrl08l14G0kA3Mt2K3fP4DCb51+ONYBtgSff5Qt44gPfR4ekul
         TefmDpb4YhvpxLneWBVjkKCI4YVrqYuzK9qmEEdovtjUUbX1d4MqCJ3tdNL6T2MtLMtk
         w1R89ZODFVY1q2VkRW+IA3AkNw423s9O3LEqJ0KMCj/pf7xg6ba54JXS+2R9pVn2N0VY
         /QbQP0cEFrMI4v/zFGjBlpJoYyLXiZuwO+I+BDzk9+2M1grxjQDlz2U2CEKcCFSPu6J5
         /a9ZWgh23uCCQD9LrSVZKxL8eyhU4dFxjw1aFtoP0oJPaPWjraRCp8xdfU48YmfS0m55
         2crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245324; x=1773850124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g/GB542IMmzWnaIj2pnKfeVpWqji25xL6rPmBPjh2hk=;
        b=BDx5OVvG1nUTUcZUrRhQVxZiKhvmjmdRwTcIYeAGedEjmhyh1u4Q1kX9TRCc+KVD/Z
         7RXC85fNKqR8FMgs0N8w12CmBR7aO0cg3Prr27JAedOmWXdtN/Q3DYKbHqguY916WOeu
         1mefy33Kg1lzjppLHLj75V3eLaVDhNKpqjZBsOge37Fxathl/nxmFVswa2QgBHbOyyYO
         zy5tkJesuuTq/Si4TnubkO4Tuw35R0DZvH1d9MCY4UCdBr9Rj6U3KkDHTTbk8Itf8fcZ
         Y7hJ1NVWtSgcet9l3t5LJyshayucb1p0/hoKw/bKcqYhDMVi/lxDUCyp3HZpviOa6/sg
         91dg==
X-Forwarded-Encrypted: i=1; AJvYcCVEEpaeYVcnNdhaa1BXHzhb0NNaRrgxrITpIizoQOXmTtL7REw2lJC+9jxurWD2LcyQgxmhr/hC4NZ5itsAQkgr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5fLvaiWzpW/JsJdis8M0x86fZu3+5P2JfnsGDCHzR4a4Pp8zR
	ooyE8ucRf5zQVSIFgiNycZK+CKTV+flx1jcO58BZKGNxazHlPI6gRwfMmLy0NZULFGYuiMLvJRB
	0/aiAaXhs34tBRtH4eR1T9dbuhV70MB+FjQMftVtu5BdJftkHSnCKFCnXQHbwim6KjpP2k5EhVT
	bMgw==
X-Gm-Gg: ATEYQzxfO+fHLOQt4WYUk1NqUw4BCl6/N9XJ0+GDiCtxem2mFFeNaBCEnSEHonZg7Ie
	MoAGdnp7wriyvpoXneyIPOY/IOJU3AQDXi8lNpHoeFMuAX81xdIJrhAFWy2uawUj4k7zoITMP98
	XNI0NZSAgC4xwmNSGqQ9CqNfnGr0yMnI/wqCwZJ+50gEnoiC/wUUpDM8ABReYaBP/UHbGD6k9KV
	+QuNIIDWXozFbpJhOJWmXUiT4W3OOOd23/ZeH58iWAVGNoBPprJOEdWun+IUHazwxGfYkpAEBTy
	E/qlZ+K+tmL5wivZqpVyhX5bh7qauJ0KrtzZ5PCh4lePfW5VY1QNxceDcXA5hu76CxYSkqXN6zq
	6tQi6T8TM+USkPMoETy9Oivn6nCkRg5gHkNF+PfEJ32W4
X-Received: by 2002:a05:620a:198c:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cda1a2d227mr390678385a.40.1773245323428;
        Wed, 11 Mar 2026 09:08:43 -0700 (PDT)
X-Received: by 2002:a05:620a:198c:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cda1a2d227mr390670585a.40.1773245322571;
        Wed, 11 Mar 2026 09:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:07 +0100
Subject: [PATCH 11/12] arm64: dts: imx8qm-mek: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-11-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D9IKkSDhQkZ4CBlACMDv5In+s6nGyoHpMlWQxtEa9Y0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNokQ8AYwYH0RS4+Nbm67yN/nyBv0zU6Tz6R
 v49hE3+HXaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTaAAKCRDBN2bmhouD
 13ODD/0SuhEHzZqwnJhU7xI7M9xh3DKYpLg7HXx3ohOLk62EHJ6v+Ls5DdcFS3H01409qPjQWKp
 Z1W0+g0wxfUFwEwYyNx5gNNLYD1Eotl8+Oii3dMU3tIFWCE4PIMfo4iPp9bqttLNIEt5XVmMVXc
 OcSWcd0ex3pMt4s3DKFaWAYVBZFG5g0nZOfaeYqEpEhzyLdkO+iMHMOPMy5spDXmaq1ZqVO1v2S
 CTkjud1EguPQBWbKEY/LBKrRNp85SOIb8fEbZyUeBz/XE4c+rr7swVAh9BN/+p/n7YX8TlznN9t
 zWAmbL8dhqhNDp+BGVmbzGlN5wrtJ/47micS5AhqnZOb9kjPG7bVcSbDvd5gMOB7U4qIhbAuVR/
 8+wCU87J5bNa9o1154CcK9jUGVpBRqVUNIc0x0ZmyKNq49q8Qj26MB06xvDTxDTkS9lqv/yc9np
 pDjQC3ptptr+DiM5mXXHgmCNox1PpP7DmRTwdqB2MmwEoBP7nouO/Xfn2beTwrC7rIktscNhlou
 XEfFBMno4c4wH01HWazHZkzFqmQYxG9TfVF/ODJEj7s8YflADILAoXuJGbeLpIsKwfX7OM+TttK
 pLJlo6bAZTT/qNnL5C6mgv/URRZtJACq9phdh1+jIwOS5d2JOnKhftgmA2X1whrJWShEwx5sp6G
 y63PyVeIzPJBEwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX7ozfvRqo4Du/
 9gYx7BTSdcNVXhDMKCAG+FtFVf0/+vDxT3F783DpCTNbZjj77o2eqkzFZqsIgDmrRjncvUQtePg
 cfR3hjzRw9iqE9Y1yU9X4XY9xtEQCalaE1XUjN9UDBY0prPgJ/FqbVuwWSiGJBvP+m4kDXI5HGR
 9NEyLh6PLdMJjw+dbiv4rcunfnhHaOGRIAerpoO8q40d4G0owKHAwR7/GJl3tT4xINCvbmfdps1
 VfnrxvusALcL5Al2HIrOnjUvLT+4AkqrnoDRxIYF9CsbkuGmJmvlnuBh1fxbDOlBcKYDyuBXwVk
 /RWYBU3sr2X4A4IX3AqsLZi6kpOkHK3gBmHSC0xX0iSBWSw+8et6Eq0SLwIeM96j7rjA/mWVivU
 BDAMfdALwebsY4+JRkP7aLarXpEL7hFcs6EwyJbGCTXi+4UJ2uRFcBMCIt50fPY3FNPnVkL+ugx
 YY+pxaAKxvK03PTzJmQ==
X-Proofpoint-ORIG-GUID: N02HbJhb4I1v_4QEI-aHlhSkc_KKDFLF
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b1938d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rBNLUka9-jj59pslBkYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: N02HbJhb4I1v_4QEI-aHlhSkc_KKDFLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_090845_561667_927B32B7 
X-CRM114-Status: GOOD (  14.57  )
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

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

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


