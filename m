Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0EDCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlltQhIVxMyq1e9Ro8ltY+5K8aCIgHvVGgBB+YkVAF0=; b=MBvd/ln3x7csKBuWDaF+KtRZnn
	5hQIXNyNOXJcYmH4IJqiAABcOmqwyOX1K+LmL/Ni1LLrS3kWwoJsFse1wKuumItNo5RBKkfXLqS8b
	XM1f1yWEK+lyg86WYH+A5ssAtgG9Mk/gAD51Q4gy8RSu7YDJ5nc0XPCjeGXykt2L2M8chwJjcrX9G
	HpsXnb65ohDTx402pQ7aPdmU5nbW2fuUCT9ojs9f66kryRamkzus1/6pusEnWiaWyZNWVol8cd4xI
	LIS+d2a2iIXN62kNn34CrHbWt0Zvcxs4Y4VaCt4xcqbR26m/e8S+L7zsYCDYoUATBtRFwbzG8p3XP
	x0Tz5erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYm-0000000DVDE-4BYA;
	Mon, 04 May 2026 14:46:13 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYk-0000000DVAJ-1Vpw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:46:11 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8PbN56Smz9v0Y;
	Mon,  4 May 2026 16:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlltQhIVxMyq1e9Ro8ltY+5K8aCIgHvVGgBB+YkVAF0=;
	b=ykHhV3z6oaBEp38KY+f8VJ8xq/RjUUWoigIT0l2zDJCPuAII1Z2cEuCqZsUe6JFdlzwVOO
	wmeG7+t8jPONckJZX3pf502vhNGfqWLVWNBtewNQzUn/ErDFEL33SkgqjLnWyQ3L8qILR2
	Yqr68PxCNCHkVCMzV4ujm9RKf5vxX6HziSP3TE+tcc9p68CSdE9lFUBeY9x8/tFlJn6o9L
	k/6+I+xjwXLJwDmXslFs1uaMgXc9ce1qpY39mBduamE2DQ84PD3Ex4y8rkWY1KN/5a6k48
	1tXObpKBMvJn8LdAelWLjlq05VCwvgKdU72s2oQjRYqSgCqFfIoHOA3D5OL0iA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fzAAYaac;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlltQhIVxMyq1e9Ro8ltY+5K8aCIgHvVGgBB+YkVAF0=;
	b=fzAAYaacp/GBRhDAr2uRp93/ep2GDcqzlZYiBx6cBYGFFxY/p+MMYlLJ56Jvgo+tZKe4zi
	u2OxCv8ELZetLXXxJXa6CpaSN2psTuNIag/4ig72clqektIgEXnznf/zGFPMGzneqPPo0B
	eAr41jI7IA6/IUW1TsYNFziL6vZYTSGrxpS99LUNO49eQ3T8kWZSJnvfK3SH9MN9QAz48z
	AxLPfWZUUixvP9Bk+vYDS2ZsKVXNq4wUB8rh9GeYdCMMvmJn2CLVw4bZTwGMQFb2jhVxLD
	dd1sMASq/HwqCEU+i4A2toe6lDiBV9y9uBXFgQcrwHwvUGwyL0SxtTsw36SeYw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/7] dt-bindings: soc: renesas: Document Renesas R-Car R8A779MD Geist
Date: Mon,  4 May 2026 16:43:26 +0200
Message-ID: <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 90dbc4e7c687e2116e4
X-MBO-RS-META: f1nshgbcpf4ioiirujq6fmkunfwxmjb9
X-Rspamd-Queue-Id: 4g8PbN56Smz9v0Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074610_548256_D2FA3E87 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
SoC and the Renesas Geist development board. The Renesas M3Le SoC is
a register-compatible variant of the R8A77965 (M3-N) with reduced set
of peripherals. The Geist board is derived from Renesas Salvator-X/XS
boards, with adjustment for the R8A779MD SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add AB from Conor
    - Fill in Geist (RTP8A779MDASKB0F10S)
    - Add RB from Geert
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5c22c51b1533d..eeef34e3d7d07 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -473,6 +473,12 @@ properties:
           - const: renesas,r8a779mb
           - const: renesas,r8a7795
 
+      - description: R-Car M3Le (R8A779MD)
+        items:
+          - const: renesas,geist    # M3Le Geist (RTP8A779MDASKB0F10S)
+          - const: renesas,r8a779md
+          - const: renesas,r8a77965
+
       - description: R-Car X5H (R8A78000)
         items:
           - enum:
-- 
2.53.0


