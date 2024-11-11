Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4D4D12D5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93BLo7vL3etxPjTQR6dwhVFpUD10QiMUKVnZAGxoXuE=; b=AjC5h1Gf+3Wr/NlrOSOu5AxD/6
	iOi50jLs/yKZZc8h6azc3aQtzQLNdmr0E44ytmglBTXZY9/GOiw4xaBWj5L7kW6Qlbhom5SEIpKvG
	1xW205J1uDr6a6FzL0FTqFsyYAZceIX7qhgrL9l+9YaKIIoqcavhIlQ7VBkvZ4ZLeCpq6aLpFqZzu
	X2wMpMz4B2kA01lsAyudmNC/lREozeR4twmoPNO0mqP1xXHUSbWuY2emJQUSBdc3aeW/XDeAG4cdV
	YYK4w+LTDPWOMfShMdG18PQ6q9ejoyyHYB3IU48k/nkZqrbs++tEtsJQT4QNrs+4z4qpB6PRFuwsH
	sHcN7vDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJSj-0000000G3tU-2EKJ;
	Mon, 11 Nov 2024 01:43:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJGc-0000000G1rU-28Gm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 01:31:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B531F1CE2;
	Sun, 10 Nov 2024 17:31:27 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46C4F3F66E;
	Sun, 10 Nov 2024 17:30:56 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI controller
Date: Mon, 11 Nov 2024 01:30:25 +0000
Message-ID: <20241111013033.22793-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_173058_634360_F501CC1D 
X-CRM114-Status: UNSURE (   9.02  )
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

The Allwinner A523 SoC contains an NMI controller compatible to one used
in the recent Allwinner SoCs.

Add the A523 specific name to the list of allowed compatible strings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index f49b43f45f3d9..d4a86694a032f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -31,6 +31,7 @@ properties:
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
+              - allwinner,sun55i-a523-nmi
           - const: allwinner,sun9i-a80-nmi
 
   reg:
-- 
2.46.2


