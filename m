Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A16E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzWNauLbiAQJEp1e2/czwTEEh3hDEGYbQXYIOeAFLNM=; b=LoLXNbyzT0BYRw9k1Vy0K8UhUZ
	rcxkMBC4p/YWxHiCqCUKPJJH1mmHW3hHQ7bCzvhlTn6kZSUFWIBCYrM/9SERA5MX1TdBgWBk0p5Ot
	66GxWZ4UhprTUgcROSSnyLTs/z8sNSEbVKuSJMxee0plhtAw4BSxFXd5ODU924Jnmz80cTcY3I1yE
	EaSCNwtM4w130K76jvnD/SR1L/3JkgZOeq4+MVKOYiWg4qJjFAPPQ8//UCTRxzYZzrjxOPeJAYV+I
	L1U2rL/DFwnqRXUXuR2uNBrzXqIE/pqUKbwiEXO8LFJEqvWvUkduQ3qZOzwJm4OWQpQpGlchCHclP
	fFEpEFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRA2d-00000000Ex3-2R7Q;
	Fri, 27 Dec 2024 13:06:11 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9yF-00000000DPQ-2m0L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:01:41 +0000
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id QmX6tUbCJxoE1R9yFtlH6k; Fri, 27 Dec 2024 13:01:39 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9yCttjDB65gFR9yDtg6ir; Fri, 27 Dec 2024 13:01:38 +0000
X-Authority-Analysis: v=2.4 cv=Z58nH2RA c=1 sm=1 tr=0 ts=676ea532
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=fsIbZEiDhnbgyVT8DcoA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OzWNauLbiAQJEp1e2/czwTEEh3hDEGYbQXYIOeAFLNM=; b=oFVqE2lnEUtGsbzTYsXrDTd2zE
	wEdcOjhxRkIX/ZiFrQw4ezwSHQd1ctNrkb9JHQ24r7CXgZ+i/uz+t6sctoyG70xPBx5tjM3WCDnhu
	4ppItwDQlKTVJnOWCeAgu4IxRVa8sECl/9kIjx/eat+dqTO7Oc9yQYGikaBJO/zRZ6Sx2XAsThua8
	8V9nfI+uZwgfGwxgKOtZ+czLvdXTos/lWquHOMdRT8NAecgJiq1P/aQ83GstGeCajOKLyUPllMisb
	qBpGkU6WzVJo+5XD8b+l4/P8NOvEZRUwRYakJ3GarT5QbXgYUMj89MYnTgxO9Ok1RyAfrkcyYN0le
	uIPPPfnw==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9y6-002EaQ-1H;
	Fri, 27 Dec 2024 18:31:30 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:52 +0530
Subject: [PATCH RESEND 03/22] dt-bindings: clock: sun8i de2 clock: Add PLL
 com clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-3-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304468; l=1074;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=sPElRYsF0jt44ZqeUcZ4OkMgH7YItvc9UU2klf48oOk=;
 b=lwXYbdY0YXtFp0SteDiUJHQ5o38UVvpR04ckUCMWN0HNrgpE8nT7j1I3MRNHoRqGGO2cKj5A/
 b0mNa+S2m4zCeQ/1LWrttU9hIVUQX0nMfexm5qp8SwtS52irX219hFK
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9y6-002EaQ-1H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 116
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAmcas/bB64P4WTtKgCia7JUwG/BBLn55iL4pIM54kG1Z/+I2g6GCfrhNBon2iN1sxMVHr9hPjzFuRzUsfrJEOOUqIIG2zWNP//V70QQbVc0yXM1dWUG
 ECdCfKaQUQ7xovRmipGPrDaq72MT39136fULHTRhT3X17ri0DXxQ/SzvdLlEH8Nj/jutQd+VgstdtA19I+WnfTfEMRmj5bFT9Mn6w/+TfdIiN6L9IseWN4K2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_050139_772645_1D1381B0 
X-CRM114-Status: UNSURE (   6.18  )
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

Some platforms like A100/A133 also uses pll-com clock as additional
clock source for the display clock. This is not documents both in
user manual and DE 2.0 specification. These changes are mainly from
vendor BSP.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e4..3e00905b66ca 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -39,11 +39,13 @@ properties:
     items:
       - description: Bus Clock
       - description: Module Clock
+      - description: PLL common clock
 
   clock-names:
     items:
       - const: bus
       - const: mod
+      - const: pll-com
 
   resets:
     maxItems: 1

-- 
2.39.5


