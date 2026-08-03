Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B504DC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=; b=kNEqz/RQfKqvsASRB3mRm94abP
	JV9ohYoLPOEM6YxN/TlLCA9updai+NQjmUm8VsIWg6aEh1+dWQxBg7o8pWf9WuUpe0TP9N/Lj46pf
	Ib95C3TWhJ3tCcwyCavzl4qRDDd+TriFhMUedEPoDyPvvtaZPpdD/uZtzMZyXmDGzpId4HCAW5lli
	S78pOmL36/K6b5ocPd+/opMuZAtp3M1DZwjvbr7jUF0U8zOgmInpYD8GydHSIpJa3SYyQDQsHXym9
	yvPTFhXWb5zBJpNWX7szsMR+IcBp0Q9Fnrf+Cis92q2wDCg7pXUmWf34JqQ3+S6GINl7B1YJAzAg8
	9Z9syPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqm1G-0000000GQzX-21GF;
	Mon, 03 Aug 2026 06:19:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqm1E-0000000GQyf-24HN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:19:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVhOm3299633
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 06:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iAA6AR4Qa5O
	wiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=; b=SEEEBpb+M+APqf6ZY6CjXDw0iaX
	+OriZpKKG1NAoTn8SDyil3a92eoh1XYpD30MoMgvXoNzSiRaxbxYUC7qZW0mOe3I
	JleXhU9IEADo7lwFppoP27CaNEdBewRB+WX+DFn7cNs7cUQgjlqh8cDnQNAkfj7+
	t1jMH5Ul2NcWItEDqSTaFXTTg2ucZ6uxixpZwnh6ABq4J+09iAMothYHN0mqmfYx
	9yNLVEqvfGLkOUsPpLaQzvozC6S4X309nqVwLZdoGvtqUKDBo9xrTZYUl9MMSzq8
	Wn4g3OjjGzHv7Dh++MYoDEoc/Ermbt7MhIv6C/UVFUAnEVjJqvcaD4N+iIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpvs8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 06:19:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so22662651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 23:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785737963; x=1786342763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=;
        b=Cz1elSYjdxsvtvXeJ6Xv2z/9Hx9CSovywCBpRqE0lnpm0dz1OZYB0HSFcx7TP4JKBV
         WwkHMTDllC8kZAoRnEILwWNOWhEqpmPtNwMQ0S3knxrBvvbDXPo/dIwuvRBubQ+7UuM1
         DCFV7s2GSwLvaj0M/kGpIKf5Bkzdiz7r2o6dpzFRbZPO17eazlw0uwMpbI1ylMNnx2m0
         LRep5qm5/8aeTItaQkr0zTJjKC32Q24Zs7AiqUmqQ1oBwTsjb13cwd7o1xJOU+artxVl
         sjlgYd9X2OnFUlYYzLQn9bWkajWmIATxIwBIZpZG1KaJAfvgdtV8MLiepYvO4xcpTCX9
         6bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737963; x=1786342763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=;
        b=r+5aNPDN7h+X9onHq+5fSZi36olbYmEkhf6xqJQ6sIxSsDPozhrFuumKoYDeH3QVtQ
         BVzBLe1UlYuAfgk5ODMY3Gmww5iHN96HqfmbzqFjt97+oZjOJDw9Fr0h1irxb38UzZtw
         /CpdxI0rjH8NzXSfy22luK3WNoVUeOrO9TvUgaMqE3K0y1WZnOoz27NMgeG2YuY4TA/M
         0s8vQ4T60fPpzSBCYT+JJWv6CLHP1EqlM5jyqflPshjWjh6myAESnguYeyctfbjMsYRE
         HeZR5vUWEsYm+OjyfKqZB9UY1FA1Biq9ImO0W+Gd0LIFTSdxkaoeQW4FUEWXL+VC5d2F
         rGBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7qjKbFnnuZMXBa3w1RG+EVg5GOcMBdHIdKI3bExJQ5B7L6TCnh84IfTn64Jop4/xoM6zO250u8iBxfN+c8N47@lists.infradead.org
X-Gm-Message-State: AOJu0YxEaJF4ndDjkWU7h/TDfufMFS88Rp323rqVdA9JDTZCdyR4qC5L
	jIZSJST0xUgR5jOPOzFPegovz45qiq97loBA+ES3nsa9WYpA0XE6pHa4ywkrTOEwqKbCB9W0/gi
	qd6Ns+INxm7n8lcBgoPUpXKCIZnq9XO1ckrWB7l8kWKrcFJyfzHh6MhVAs2RN6sij4h5Slv8jTW
	1SZA==
X-Gm-Gg: AR+sD110ANabsdgYJIoEMvrt3h5N6tMStJO17jqf15wFqLlOHml+4jRS00pnfnT3xqq
	wuy4yiwsuzrRGKDtecQhrL6t0QdWgBSG5HUvdub68GO3VqnuYR6rXYJ78JJaVZhDi1NX5rCCvVZ
	VzWE5nc/kzsP5aP6i8g1pFk4jWnz+GbWNSxL2Yf/0sThTH9AWhwSJrvsZL9Hodss7g3QPElSM/+
	ivcujANUQ7qAotgudk0FCY6472kpM+q6V6h5Gr6BArf+Nw8ACxwVnTJSuqVAinJr1wAFJH6ZuLP
	7+2lCQcua5Wcy/4FzKDFMSs29w69/b/PaTWBNkk32wS9QE5TJmiBi6SY0hX1ZOb5UNOrBAVIV/D
	jguDYZ0VVMAnc4nXn
X-Received: by 2002:a05:622a:1f8a:b0:517:8a18:7624 with SMTP id d75a77b69052e-52b5667173emr187812321cf.3.1785737962992;
        Sun, 02 Aug 2026 23:19:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:517:8a18:7624 with SMTP id d75a77b69052e-52b5667173emr187812111cf.3.1785737962593;
        Sun, 02 Aug 2026 23:19:22 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b917efsm318457575e9.11.2026.08.02.23.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:19:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: Correct white-space style
Date: Mon,  3 Aug 2026 08:19:12 +0200
Message-ID: <20260803061910.13973-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803061910.13973-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260803061910.13973-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=a9Uuvxnh6ZCSM3JKuUBmksfHVLpBRtAfPN4ynlQ/SVE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcDLh8ba2URPZj9v49PxHB2Btr1v5mqRTq53wU
 lOFbLEjMNGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanAy4QAKCRDBN2bmhouD
 100oD/4329LqWzRRWEqlMFKWjCm+znbGRNk5I7HVjIDUKojAQ91ZpMQ/59uNLZUKFvagc7jhyad
 MP35uMOme8NKA7NjId8h2VERGvTuoPCWVf7KbrhwSfLrDkwX1i1+scIdIWRfbpy8mgtS28IRh8/
 2XY7dqkpsQvOhwavbXbyUSpoklYRj06nDF3ziTEfzoy/UMGJ07Y+G38RPptt+/6JmQsFoqNPcnW
 0APC1ILBBeQqh7LUu7v88eaoRE4vWyOa2p5h1na/mXhmO93tna6oJchvmrF1HgPWIi2H+73+k8m
 0AAbafpY/CPaXxKCd99p7VPir2ie4a7pnNBZQMIKg8C7OgnMYC/CPxpVzRV5OQ2/RDxMmL9zyjY
 wC/3K0fiOJmrzTNAKZP+bXFCnIau9wk34Mq68Pbkpeo3rXLQPhS7SdWxOSRrQdtI0g2yXaRwgdP
 S1o5qFOtgWhRO/iJJ8YsjuOEyuyfq9LpQLQd89viPHv7PhfkaIpo3/VRHK2aD+CtejYu8gA4U1m
 KGyNc7WrUCSyzMXveERcUmkg6PIVttUESL7ua1wwsG8B8bx3Jj1fETihHc4rg2PmeXSrC6qTiPu
 vaKJ112LF5maGrMwhCQxfhh4z2WuSS97IE18YEvPd2E9cvF4YLUCJAmC3JygLYOjTsPim0mYv4+ yXT/Fa7uZ+GUM1w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1NCBTYWx0ZWRfX3Gz160SvCa8L
 zoOTWtIynwv+08MmtSR3sbk1bqcvpU04xY5854mgZc/rRaeN+yiQzf8KqELPWSJhEtTGVDquMwL
 y1mNGz5EKnsJ9ntgioNS9mxcXKtoi9fTT9ZtSkbmWwNBWN0UmtXy4zjOZKpVKx0Jk1dNqM7ATM7
 zn9010sS2zSbcVClBfeZ+sHFLXuUHHbLQ1x8Pl8ASyOwXGx+aW9LKyaMQJumomyVFUfdL6Nwcn4
 tYhqRYW0tkG8VqqY9bRNf5znKQDCGyQ2b6UHfpBBtmb1J+3vM4K5UcUpFTLQ+zP1w/2Abn3AJlv
 75IHSWCocKfYb1I77fXLcI6kuiZTI0fL/9wCWEOIZi/9Xs5JlXeNh5QRd5+7S/gawTRwN9Eby8k
 Q134IMrkGWeU0hWySLQeAOKzkAJp5ldX83LQoaYXj5tyDzGhJa6zycxoMUwpx3octdeFPUbjmgg
 dAEnEVVA14lNbdoCzzg==
X-Proofpoint-GUID: khIa02xF36fakq81UQfxNVYIYIiUgRuF
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a7032ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=4E_048dy4KWIn0a4eT8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: khIa02xF36fakq81UQfxNVYIYIiUgRuF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1NCBTYWx0ZWRfX9Iey1LR/1gMk
 PDs1zNqyH6gtJXnQlVDTGXftt2tgCZ+xFyK0bQwJdPU+tjv0OeqpGL4J+YwYKajGaEdvpfLFjMV
 MlBaoBTktxybbAJfR6zqNuue+FNOq0w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_231924_538768_890A4A80 
X-CRM114-Status: GOOD (  15.45  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
index adf4da7dfa2d..a1a878d88e96 100644
--- a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
@@ -54,7 +54,7 @@ AM65X_IOPAD(0x01d8, PIN_OUTPUT, 7)  /* (AH12) GPIO1_22 */
 		>;
 	};
 
-	main_spi0_pins: main-spi0-default-pins  {
+	main_spi0_pins: main-spi0-default-pins {
 		pinctrl-single,pins = <
 			AM65X_IOPAD(0x01c4, PIN_INPUT, 0) /* (AH13) SPI0_CLK */
 			AM65X_IOPAD(0x01c8, PIN_INPUT, 0) /* (AE13) SPI0_D0 */
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index dc0d3cf2f985..3e2377160d82 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -143,7 +143,7 @@ &main_cpsw0 {
 };
 
 /* Aquila ETH_2 SGMII PHY */
-&main_cpsw0_port8  {
+&main_cpsw0_port8 {
 	phy-handle = <&cpsw0_port8_phy4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 689ba2ff81f7..d66e71db4697 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1068,7 +1068,7 @@ &dss_ports {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	port@0  {
+	port@0 {
 		reg = <0>;
 
 		dpi0_out: endpoint {
-- 
2.53.0


