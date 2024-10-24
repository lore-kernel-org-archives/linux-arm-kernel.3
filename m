Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EF9D0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REUvKdAlvm77Y+j57TeyGIN8QeQ3OrJBLD44k4+2Y8A=; b=wLRIUw6lGUP1fe8fWkz288Yjcm
	Eaz9KDZfMK1574Ke/E5WkvYfTGfB+yDlDMC57kcJZ1LNBDk19+2UxjL5Z5xssX/M7sg6XxcUGpY/r
	2xuJSky+IvURVou7TwwmZ9giN4KaLIuroY89wu5yLnYpxgJzcors62pHB49EOBVffGFNwuHUy3FM1
	AuwBfFob9At999nHBWrN9qM08sijiN3S+8/Qon+5uUszuA4AidLYFTEx1Dr7Bg43HwoOxPf5JnAhv
	ZAoXOOvoHp/V03SrMkMHeloTHc34+T54reHkoj6p8RXBYPOKUS8y0JBDLc3qgeFK/PPdygnH3VVik
	MuhgQamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rwT-0000000H1g4-18UX;
	Thu, 24 Oct 2024 07:07:33 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rgV-0000000GyXk-1tTP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:51:07 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C22C8A06B3;
	Thu, 24 Oct 2024 08:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=REUvKdAlvm77Y+j57Tey
	GIN8QeQ3OrJBLD44k4+2Y8A=; b=RSD2mKmNiQD3HVPIe4kTtusuYd9QWpcd8NQZ
	2W/K+Ubbmn172cqm/rR7yt9G7bnNq3oxixEe45YKe6qUJ0zQs9UQXC59nnoiqgMT
	J0WF3hlZKxJmHIUTCDN0CmiIjVLaM1DpTTspSY/AV+GCychkyuAIt9E/S994WUez
	/uXZ7X6qKaEoW4xMR0GHkRHNqtdQjLCxcOpjWhp6ILUxCMeZ9ddhcLi5/7qmEGDx
	hR6lpjzoMIKfgC5F4gJIs/CKga1LtQ2bFn9IhDh0A+1/oFS4hVvHUfbysbKDxCpU
	+NxQnlHLX2ISI5nq4ABlfYxYEJCM9boi57vJDUBPvy/Er6qUa5M6RznA6/Q6Jjlm
	ZPj50sZypExkrfWca7qaFaF2ZZDu1VNwTRGX8ZltasSFfCZ5AxweU0gnOjQhaD3+
	fjFOwYdd5ur+24utWJsGn8PmH1k4ILCBfImxbcEzWEangQ0kkCR7sLvZm7fyn07g
	jcqSv2RJ+d4yD784cqdHyxcOU49QHGDkVZlRfqq1tIHDBbPO2XgZG2o9DOpIvoym
	HACMF40TvjiASuvrePIJEjKbmYw89O7rp295Fj+QwMzuytmL914eFdPAWv1HkkKy
	BH2C0V+P6gm2p8Cc8ApgEr7hrOYQYobEPN5ntH5lHd69QuELPIwErihUTtoSJd8f
	CEWxfpA=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Vinod
 Koul" <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 03/10] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
Date: Thu, 24 Oct 2024 08:49:24 +0200
Message-ID: <20241024064931.1144605-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1729752651;VERSION=7978;MC=2906467838;ID=135550;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235104_002114_294201AB 
X-CRM114-Status: UNSURE (   7.43  )
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

Add compatible string for Allwinner suniv F1C100s DMA.

[ csokas.bence: reimplemented in YAML ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
index 02d5bd035409..9b5180c0a7c4 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
@@ -22,7 +22,9 @@ properties:
       number.
 
   compatible:
-    const: allwinner,sun4i-a10-dma
+    enum:
+      - allwinner,sun4i-a10-dma
+      - allwinner,suniv-f1c100s-dma
 
   reg:
     maxItems: 1
-- 
2.34.1



