Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DBAC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xy+7YTnauU9oxJWZBuBQAQ7UutfVpvVMJMRQUq4fm7o=; b=MsFd73uDuAI1rYu5YYy5RWnBC0
	rgG6SIB8Hg3wI6HvTWO/xVIp/HXfj/BOgVsbW2vVEbNp/n2FC2SebMsUYfKTgnCJMvPPUzw0ZSG2W
	bfm1XkA9IsS5sw63BBp8FuleUdTViPgIFFqVwMK9VQePVMmCnFwBNivBc1v1XVqXCdL27gNY/us4o
	reRhW3RaFe0Pnc/bM6oWeFd6ntoVLfWtjlKJV26F6+YNYxNkUNQPz2SOvIh9t4TopN2Q3O13skV/D
	dlnCBXQ5aEQpw+caTk76EtMPjStAljx7NK7eXQLf5C7S8+BUVF7sYkSWUbDZ1B0eCd7m+HHtfIo3Q
	tgnqYSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUXF-000000049sf-32zw;
	Tue, 01 Jul 2025 06:32:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU94-000000046OQ-406j;
	Tue, 01 Jul 2025 06:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=xy+7YTnauU9oxJWZBuBQAQ7UutfVpvVMJMRQUq4fm7o=; b=l/fczaNHD6fcL1EtsEQwfgiL96
	oGBrqD+ntX1GhjMRJ/O+6gENp1vdijEnz3PP0O5psNe3DiIqB5YAWA/TBmzKvpqtQ3+dMjK3iC/oT
	NgaH0SzDwpjU0KDs2PwcZQQ1ZwNVGHktLnSeGaRaYQ0JrL3Fw0GhVLdiiPB5v3In+hnAOsgqwDx3C
	5kBfJmVro07aEq+7b+L/E92VRjO5IG0cOd8eyczU1HI18AaftFhveAnhqfNUarxonBJl9GlLNo1UK
	g6f6KJpZSo+Va2R+wC0ZNx/CAkuRjyWxK2z9XIWxkfZGHoc5emnh1ByHge66LiPR/m0ieO0tAb53l
	FMJjM7Kw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU90-00000006wo7-3bnC;
	Tue, 01 Jul 2025 06:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F0A2A50F3C;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AADDAC4CEF1;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=+qw9STpx921ZvRbNnhmcwiGWbXEwmuoqRUHJicA/m+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F6Cwxjt316ZGig1tlGw7ch9m216TRj+9exZ9GVKgPHfddW6UpBwgZLffWnV6DSW0C
	 y7q9AdXkpNjPMMii+5mYDR1bH3SJ3sUHogrnOLGzRNxZddKRuY+pCJy60J1mu6DRhI
	 pE/NuSPIQkiUVjwGrHFYfQlSgjz46NOYwAxJi9pXO7OypiDixVuOtnzhkCtqI1jQ5V
	 uxXyc0gNig0+0sXwI3k64F1EYFOfQpxdoo7vKUivK3a63CKLHXecikpYakhvAg1axj
	 GLQItRIOUyJWmNseOqgO0i7qYR/cuF6D9F5Aa6UnC0Wi7FhYEs72Ub8yEVtGU2zGg0
	 yBpX3ZawhRR2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1233C8303B;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:06:57 +0300
Subject: [PATCH v3 03/11] dt-bindings: timer: mediatek: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-3-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=993;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=o0ix7fgxDyGX/dNwoXME14P/IebZ5vKxE9iUMbF1tQw=;
 b=bMmAZgKeoncqK29G1cdfBQz+qO+g6RH0tldg21aARRClvtL9nleKHUfrB5cL3Q/BqgD7NqkNf
 W4HhlKJOZsBDd6Sbx3fQbfEqixpfbnaUIw3APZAoQ63fuJDz7OQxwW6
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_070703_468941_21187487 
X-CRM114-Status: UNSURE (   9.27  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for timer on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index f68fc7050c5687930e2ca6b6fa8f0b7a208803da..d5b574bfd2caad1bc54ef6bd1768d94055383727 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-timer
+              - mediatek,mt6572-timer
               - mediatek,mt6580-timer
               - mediatek,mt6582-timer
               - mediatek,mt6589-timer

-- 
2.50.0



