Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38DCEE645A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h4JYUl3obqedwnElNPtlTIhQt1h0+gKAgoEfo61psA=; b=3cHfzPyDhCVdWfZFgREtMxEh0e
	zernFCOihbfsnA5fFMyzpNHwiH8yKDoyFvg1evACk/U2+EhFYirVd8op9FUYqkUb2wAFpduPOYqA7
	nqvPciKfcpyHnqpQ9bUBSGgVINMb5vJZPhw9U7aALEL55tObZKiGyDqDxaaFS1I34hdtYvKZPpL9v
	xa6veTMdV30VbbS1hmseCzACB+/7aUWzzAHbhtacgHDkg78Wx0yg96wJ0whgzA4rAXMZF5qwLUzI4
	cCT2y2HfHjR6qQN4yw/G2/DoerZAPoso3vUpKzJM6EgBDAGErW/Mzdz54Z/eJTDceTpt/dhddjq7R
	RkDKdEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4D7-00000006NLm-35Qj;
	Wed, 31 Dec 2025 21:58:29 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4Cz-00000006NI3-0riS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218299; bh=4OIZET21OivzenCd9QpQ2W7kxSGI4TD8QG9/7IayZc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkGKBTjANS2lcBjVxnTm70dgfT1Gg7Bdzc87sDcKzIx0th31MQxVgUxzh74fVknMg
	 P/fZoOpWYmWMqz6ofks8ISFxYXXITHzqhoFxVWHk02q2wAXU+0+ddzF5C3H3lDsgvV
	 uksovzW7Eb4VYZqG275Dv6yAKmjHWKY5Bt2ac7il3JSn1R3VNzLHJZldlHJLha0Yol
	 TYpHLDc5Dt+JE5pLezaC4uLpkCJ3mUQf3Io6s72W8BETqo10Fug5lWaNZ9ulNkoGvX
	 TCs4iPqob9AqL6yrGBamJmR4hWtYkFEIXzvJhFo6FHU4+/qd/fKPv9ouGlo4jIs/QU
	 74en5DHZVgPFg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C013E3E99A7;
	Wed, 31 Dec 2025 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218299; bh=4OIZET21OivzenCd9QpQ2W7kxSGI4TD8QG9/7IayZc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkGKBTjANS2lcBjVxnTm70dgfT1Gg7Bdzc87sDcKzIx0th31MQxVgUxzh74fVknMg
	 P/fZoOpWYmWMqz6ofks8ISFxYXXITHzqhoFxVWHk02q2wAXU+0+ddzF5C3H3lDsgvV
	 uksovzW7Eb4VYZqG275Dv6yAKmjHWKY5Bt2ac7il3JSn1R3VNzLHJZldlHJLha0Yol
	 TYpHLDc5Dt+JE5pLezaC4uLpkCJ3mUQf3Io6s72W8BETqo10Fug5lWaNZ9ulNkoGvX
	 TCs4iPqob9AqL6yrGBamJmR4hWtYkFEIXzvJhFo6FHU4+/qd/fKPv9ouGlo4jIs/QU
	 74en5DHZVgPFg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 30A823E99A9;
	Wed, 31 Dec 2025 21:58:19 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] ARM: dts: lpc32xx: Declare the second AHB master support on PL080 DMA controller
Date: Wed, 31 Dec 2025 23:57:53 +0200
Message-ID: <20251231215754.2222308-5-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231215754.2222308-1-vz@mleia.com>
References: <20251231215754.2222308-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251231_215819_806192_77669642 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20251231_215819_806192_77669642': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_215819_806192_77669642 
X-CRM114-Status: GOOD (  10.84  )
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

Add 'lli-bus-interface-ahb2' and 'mem-bus-interface-ahb2' properties to
the PL080 DMA controller device tree node, tested with dmatest utility.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 4f3944d6d765..389777ee6850 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -90,7 +90,9 @@ dma: dma-controller@31000000 {
 			dma-channels = <8>;
 			dma-requests = <16>;
 			lli-bus-interface-ahb1;
+			lli-bus-interface-ahb2;
 			mem-bus-interface-ahb1;
+			mem-bus-interface-ahb2;
 			memcpy-burst-size = <256>;
 			memcpy-bus-width = <32>;
 			#dma-cells = <2>;
-- 
2.43.0


