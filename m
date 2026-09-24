Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EBAC98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bfxgkZZv7yMM+bRdt2rH/UQL8vijvkbbSdEXwbHmck=; b=IUBf7cjNWMA2pMUTRKUD/bZWGN
	soz8/4c52tRZwNG5Op25OzQuARnUKhPAVgqfYPtxgS5LT01Kxzm8fkidmUPIBU4BZav4h6773kx/d
	tdUDAe+eh+gtvy4fqtEB6Ur5i4d4/p1tvd/hOUgTNkAorNNX4x7ZW/UQjPE/dsCxjRCM8bwabojBd
	FIpIC4oD1cacjL888rlWfTw1syuZuLHaEWYzg2Io6b/rTEfhgxukpHQp5VcwhuCYz3OZPH2hPMzCO
	lo/DThE8mzlAvB1AQUElABKjEfAVTYu6XpRXU8Jx0G7KHPbArS3S2T7YvWHJd3sUKcFpyaN++ODNA
	2VEqbr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pGv-0000000C3E3-1bbs;
	Thu, 24 Sep 2026 19:38:21 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pGn-0000000C3Bl-1LiC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:38:14 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2B544240105
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790278691;
	bh=3bfxgkZZv7yMM+bRdt2rH/UQL8vijvkbbSdEXwbHmck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=ENiL8dslnz35MtWDYG7/wqTaq7FdMZW+HfA39613OAEYm1ZDpW8WQc6uZ0HbNIeV4
	 TF4quUqfY7gg1ke4mJBmGqrG+1gUE7Q+dRFuMYK6C0X62dt3nJ8MnSZWvV6qzN5SDv
	 wQ9sikeSG3vt6BmFQPJgI1/Bq5cLOCbY6U4vFp2Z/v1bARFCQMdpI7QyKek5JkleC1
	 XX4y6ssslHTtoqo7jFzronK/uzQarS+tGLEy858ARcbHBk1hKGwQQ6Qoid5adLXbQW
	 iseTS/nI9q0WYoINZjTG9lwVNa6nmydbgtv4ln8J4dSqo4I0nc+x1VSPs0GbCh5zlS
	 niDaJa992KeRw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrPJK39HHz6v08;
	Thu, 24 Sep 2026 21:38:09 +0200 (CEST)
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
Subject: [PATCH 2/2] arm64: dts: st: fix sai3b unit address on stm32mp231
Date: Thu, 24 Sep 2026 19:38:10 +0000
Message-ID: <20260924193759.27881-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
References: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_123813_517292_90E32AEB 
X-CRM114-Status: GOOD (  10.39  )
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

Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 0feb8943efae..7cc8d55a6c23 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -577,7 +577,7 @@ sai3a: audio-controller@402b0004 {
 					status = "disabled";
 				};
 
-				sai3b: audio-controller@502b0024 {
+				sai3b: audio-controller@402b0024 {
 					compatible = "st,stm32-sai-sub-b";
 					reg = <0x24 0x20>;
 					#sound-dai-cells = <0>;
-- 
2.55.0


