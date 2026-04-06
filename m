Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D5EEF4EB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u/gxhDv+dse1tdsQ0jNwId3EjvKmQYwVQA3lrMvYhgY=; b=BZSBIJKk7FkODIC5kHXkHydmBt
	xKHDw4yVkEIlcH0pfovoTuy3iD+cNs3KeLuP5tz8jebnmNBaADeeCw+ySoZwolH9UCUsAJiihHfw5
	v7t9g5CrUO4Vg7wFEcTey+oqmrc8OKLODU8pByYDySI+dcoG6BJ4CgpVRLI9h79Fjiw5XdN+TZqpA
	qg2atHKsyLLqBa4UTKD/Wg4ugwiHOXenR6s6NeJJ23PG8wRoPm01GR/sxe+16L/6mSQFmmi2AnmdL
	/aVlkLrkWWa0+o8Aw1WPCpO1+RSNholU0vN5+F+2M2JwUQDQRD3/+TYFaoffuCh2f2Xivzf5T2HBC
	8odt47Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dbM-00000004rG5-0rpa;
	Mon, 06 Apr 2026 06:38:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dbJ-00000004rFH-2Wte
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 06:38:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Nj7AD2792356
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Apr 2026 06:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u/gxhDv+dse1tdsQ0jNwId3EjvKmQYwVQA3
	lrMvYhgY=; b=QaTBnjDTHbYn4AkjRgJyhryLCzWUMncp9XDZ13J8ZzBnfVtpVUl
	VKParra5IlWQcfNgEZBccuJ9P/PFKUPrbVJTpRwGbFMNv4wnFo57TmlcdDp0l7RZ
	ORAwkonVC2a1hb8h9tQxiGgJimj7SOLPYE3lxjGiBHGAWETWYLk6W+CMpzgSetHn
	BgAhTm27GlvOTzGSdD2UA0A5OPJebKlXsv+LvBOPMps97Hi19MRGWuFFF9Om8lzv
	wH6BTxr7PaORpvBgmc1/cEKZ+uEmrHSKPJvfMuISycUKO35DSAHUleqbOsCDo595
	eaGTVcTeVEylKn9Z68gymWXoF0w8dFvBW8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfmec2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 06:38:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so103614911cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Apr 2026 23:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457499; x=1776062299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u/gxhDv+dse1tdsQ0jNwId3EjvKmQYwVQA3lrMvYhgY=;
        b=f72+2Wkm02s4z6OPjuQpmnsUjoRj1W6IGWm1MoUXxVve+hpMjckJtbo0mmsn65ywYq
         qI2eyeXVfxC5Yqt0QAP9FDF9pwJGgM8NnfaM9OeZZT+O3E9A4iFbimJUP8C6PUkFFoYC
         /Fwd/7QKHhBjgp700EoBarOb7LEuT9svPuUi5gjl1o+mhCdqtKiWZ2IUCmMkIjycoPwk
         mnVJodKk11oueBjAtlI8VJtp57ElxffGgopn31Ydu6+KEOR1Qnz9bi3BvdUTG+zFZfSi
         9C6pd7iTF/8W7BLmTuzVnWFYg6cLIIwWn3tFXD9rnXE5sKZ5uwxJLlDd6X5+yj9/IpcH
         yzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457499; x=1776062299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/gxhDv+dse1tdsQ0jNwId3EjvKmQYwVQA3lrMvYhgY=;
        b=ZESv+LCdJk0UyIJe8UBoKA9XIPG0gLSpRoMJ6VMaw/HI8nUR/suBHIR2Xq7eS7Mq0T
         LP+coidAeP2Rmlvin8t7305qnmlZ33zmvDxSYpkAiUxUBc8YM90WSNw9UL6EUCy7IbEu
         CEoTUVY1J7Oa8H+aEL66X/fFX4HpH+7BBbcBzX1Q3TrLQ8rFoakdzjQNCA577wsrEqCF
         7AcZqYbFzLqLPC3qdmB7gz32iG34XFmvMIVe3WI/G8aWlIg5vhhYYx1MHqdWJZkzsixI
         C5sOcnU4f6zDTvLLzfJ/8J04+gelhZRq4WIbRRrWbI571muakMCLTTmKWUE09Z0mlPQe
         xAGw==
X-Forwarded-Encrypted: i=1; AJvYcCXq74tli85H+qOg6nmIHZ2bARN4Zr7tPVozq55bV3t24IJcfnmueRhoVEfGtomBlYbGSTgdOW1AjE+v4tk+iwTi@lists.infradead.org
X-Gm-Message-State: AOJu0YyHCwSF8ixk1bvT13P7DP555HinRCN283uLbcR8dVOwfv4ub60e
	Torm3aQfRctvw8Rg9BgZb7yuCqgP4d4nBxJUq5ks9WNuaewCy2POPa87/GbL/RJxeA/uhMjP+0s
	QqlVdxF0XhNW1pO/GSFRImlGZZ4U7Mg0u3X5O3V+67o1Uqh817ZwHAGnRK67dh0Biq0RcZx2O1b
	DNug==
X-Gm-Gg: AeBDietSlpIkOBt7SNoHxaB7iaSWI2+xNDJ9GPv1dLFvib4H+f3/4BiuMKw8WCW4flZ
	e52Ol9f9auZqLQt+3orzL/av3lys45dURKd8HVQGKxMDjs/0R2eY8W+Kw+j2Vc+DCACcRX51R5h
	wiL+3fYWsoxnb7FlCnH/PF5snC/6H28RBcLIFhPms4wqCZiY3vnOtl75+t7YNNSvJeVIIhQkQko
	rJTNiBBv2tEvI55a3ZpMzi6K4z2KMhrMUT4VgTPO66YvwJEynYH9ZU/f//Hy/H8g4KkVjeDhoiz
	wjuY4ENHb2YY9zaKKHkiRNpfj43+ojL+r5CTPh1/41Kq7J1ff/JhdAfVJNMVu0AacdoD7p0i1Rq
	lT0Ru3Fu3DvAn4tHoSWq4EHCNgqnVMVKaxev4
X-Received: by 2002:a05:622a:5593:b0:509:25ab:f545 with SMTP id d75a77b69052e-50d62614e3bmr170907301cf.11.1775457499452;
        Sun, 05 Apr 2026 23:38:19 -0700 (PDT)
X-Received: by 2002:a05:622a:5593:b0:509:25ab:f545 with SMTP id d75a77b69052e-50d62614e3bmr170906911cf.11.1775457498777;
        Sun, 05 Apr 2026 23:38:18 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:17 -0700 (PDT)
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
Subject: [PATCH 1/3] arm64: dts: imx8mn-vhip4-evalboard-v1: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:11 +0200
Message-ID: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=t3X4myeEM2pMRgsbKfWAsvjQVVUHcbGX2tomwiNFOsI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01TSBAM+SreyDUs2Xv30dWAqtMC1N5TYX8UsP
 HrA+orZi52JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNU0gAKCRDBN2bmhouD
 104YD/90K5P95Kv86zN8mLXa7j9vmSSYq1vdZk5QfNkapBUNfKP7JvkxVxQFdritonwYjIxtsQ0
 VDgiWp4QCg5/zfGdCV/S+Lpd7a/kmLxPgdB2S91eFIFppk+/17LY11cmwo7KDmlY6k1GsBZxiC1
 JOvGY6WbyNmip+h9260++UU7O5f9V/vzqau7z/VLCECssYL4SOj06Xp5nAdcxhrc5URU3636Bea
 pfb2uIGRbxjOHmhozsv6tFEhi6UJfLFtT/xhR06F3spI5X41QK8LJvERGX4VvbUnfXgy5o5X/I+
 3mUVvRksKrRskPH2Ig4MvUG7fUc55AzA+SX/iLyD+8GZCUjt76js+5jD76fEKokHK8dqhV+dlob
 Pvyyl/52IvnEE3E7E+BridW2qVx4bEsM64VzL4OBRophBsZODg2Iu061ddKcNSSgYm3+34jLqxD
 NMRb+6eIJ15ifG4pl1NWfUj/FLBa8E+Ujer4GZXyMAAl+khiRlrc9QDsxtxe206+E/4CJ4phsmj
 VYX7pHvLBfVM62/3HZbEuSV9pPnf+w1GuGcJ3Ol6LXuhyECJv6IAvwAUdoxSGC/mgMiVkljXAFp
 I6LkdFZCmVJmnWbSAG/BRMSLAMR9TV0m9+DtTVN1VppQkc5PCcXfr41XyrCATKJoxPKxZ8tiuvN 5sxD3zvnwyZtqtg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfXz5FCtLBzN8UM
 w5RnzynJHgKt9lELeE11i+zt5Q5jCfs8wE1z4DQdeMDPHGr9L6OFqgaNWs/nacxj961N8CZmwc6
 7JaAy/o9vFIcpx/mw8mvwZro2r+EwC8ClzFFM6BXxaGROt8qji/NYvxmXdzGofUrSZy+bm8PzHj
 vk1cUJ0d9/VtxAK0vZYo7Z2JJWuzfO1N0earVYTQ3nTpMaLLIUnUAxfGTu841rSZ72rwixU8hg0
 vVdmcD51P7aSjI+EZJaXlr9wvWCqCdf3kPKYvbMqQ7R2gVIJ0R4t+H+ded2vp2JTqIoOaF1drNd
 uiB0hRFkL67jOC4jghcrApEWBiDe0SYSKMd4WeES2nfEMwQdKUf9iHngG+Pc8s10oY4uVxjM15D
 XDZcxBcSR6GfY5RV5L+9A6gZJVtzwG5eTocJ16d/FKjam55pTUagGz1VzVPKyrFaTtq8IdsxAYe
 fp09UUmvrf2ol6eghaw==
X-Proofpoint-ORIG-GUID: 1I6FBec_8tuaLjkE2Ssi78w3yTpgraJy
X-Proofpoint-GUID: 1I6FBec_8tuaLjkE2Ssi78w3yTpgraJy
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d354dc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LaLCeD5El4-HEmIGaUsA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_233821_676835_7A37402A 
X-CRM114-Status: GOOD (  16.98  )
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

I fixed this upstream some years ago, but people still send copy-pastes
of downstream code.
---
 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
index 5f37065bf43f..a8f7c226a61f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
@@ -112,7 +112,7 @@ &i2c3 {
 
 &ifm_pmic {
 	interrupt-parent = <&gpio2>;
-	interrupts = <0 GPIO_ACTIVE_LOW>;
+	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &iomuxc {
-- 
2.51.0


