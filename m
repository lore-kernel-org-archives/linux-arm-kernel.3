Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04605C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4c8vhB2QZ/uc7mLHC1umMx4jF3vYPM+rU2qJrR1C7s=; b=nGXlSfcpHCrbadPwYcbiY+tpha
	IPLWn1DHZRCoVGClMgeu7fZW1v/kLEiGse3HIHaSEvYfJo2Qao57ZcpfbXk1EvVzMupAM3UFdDu9h
	RvrknVedBsje3QiWsETtXRQebSeCfufXI+4o9WKFzIuwo9b23wtd0C8L35A0JWOwjAjhLE0hzkNU5
	EIhnobqisx9SOsz4Pdm7PRL5LhPj5WLL0kjIQ8A90oRleKRRGvKkB6ipjfPgBZ7tK8cTBMmgg5jfw
	jhLtIiuQsWc4notMKSBG/tDXfVnOjfHgqLGguOtoStfsSRdmKCbuA1fBPSms4x9ZoRiTQpCJIORbO
	BxB150XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pGv-0000000C3Dp-0htC;
	Thu, 24 Sep 2026 19:38:21 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pGm-0000000C3Bg-2DBV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:38:13 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9200F240027
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790278689;
	bh=J4c8vhB2QZ/uc7mLHC1umMx4jF3vYPM+rU2qJrR1C7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=fJGgdZFOXKE30iXWtuJ0wdR9z+cGGEqY1s1/y2xJas7BJ2GF5LYFa1m9hny5jxsEq
	 peCasXC1tL/hexMooSDvtQQCQS10g7H56RxzBPL4x9lQ07Rbuj5O7MAjndBSyZkMdV
	 7K+04ZeoswkgFQf4Zm/lHi7fKNV078K+NXBFTsx9Xa7i7ariFUf7K8LrCa/pSqbqoj
	 9JdpEhVWFKJHKwZXVXEmOvCWXyZi7258P1mp/EF9Vd+j3xbVINrcJzeCoBMbTYd4z/
	 yjMCuItF5+4QgTcJwYizDLwxnFAEZcMRHEgWIZPsPbMrukcZKEG980ip2cUrVMlrcx
	 J1FabCy6l4vGA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrPJJ0Ss7z6tvk;
	Thu, 24 Sep 2026 21:38:08 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 1/2] arm64: dts: st: fix sai3b unit address on stm32mp251
Date: Thu, 24 Sep 2026 19:38:09 +0000
Message-ID: <20260924193759.27881-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
References: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_123812_713195_6108DE75 
X-CRM114-Status: GOOD (  10.70  )
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

The unit address of the sai3b node, 502b0024, is the address of the
SAI_BCR1 register in the secure alias of SAI3. The reg property of the
node translates to the non-secure address 0x402b0024, which all other
SAI nodes use. Fix the unit address to match.

Fixes: bf26d75a95f1 ("arm64: dts: st: add sai support on stm32mp251")
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 44938c036e30..24f834cfee85 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1291,7 +1291,7 @@ sai3a: audio-controller@402b0004 {
 					status = "disabled";
 				};
 
-				sai3b: audio-controller@502b0024 {
+				sai3b: audio-controller@402b0024 {
 					compatible = "st,stm32-sai-sub-b";
 					reg = <0x24 0x20>;
 					#sound-dai-cells = <0>;
-- 
2.55.0


