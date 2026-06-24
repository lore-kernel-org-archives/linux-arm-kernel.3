Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95B9CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=; b=IPK/7jD98+a9dIazCttDZn1Sh6
	BPqv1/Ir1Vmpc1DkXOR9MqfQII94kYklmlnN6eP8+pPn9NZATJLMXr1NZF993sK8cOPNqbHT1uBoT
	e99LOGY9JJXhLDIc3Zpxo078QlT+mQ9cVKm4LrfMhKdz0y7XWUd8JNu6QkbBZCbBkHd3YDgChYBbQ
	ymeQPP7xRClUfkrebnP4bPBYnAvqx//b3RPi7Shr9g+iUk3mGTJCEfZAoWYA7O8L83flKFBKi89z3
	RTdNJRSxl+cSBCOuvytfMAoN8cvlqGssdsEr9R+zKfx/UGAuoQP/oX/8Hhg0sfrGqU7PG8V3fJtXw
	+EbazBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRWj-00000008B9Z-1Q32;
	Wed, 24 Jun 2026 17:36:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRWg-00000008B8Y-21qD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 17:36:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-46cbf263113so778097f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782322596; x=1782927396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=;
        b=UWpEhhT+1RTEvJQOXjqMaLntDaOM/iaYxCphNZ1WiTDFTGXJdhEfMhC78miwZd5NpS
         K2jAqdUUESDrRBrj0H3nkE3mtdNGLEApoQEkcl1RrwFSTtyzZko6wVsHf03xK3h/1dR5
         JA0HbfWWpwmPeqJ+kp4R+zGCgB47a4788ie2UoB7wF/to6hlTyMCjaeqTYWj0hDE0CXI
         +Pg/2CMAL4Wbr6BZVFx0toX7Y8qmSZoj5p8xXjTvQiADpQiujxROfOtVDPcYHsJtxw8A
         w5zGOU8VJzyKPifAXWMa22rRFbSZFiGdcwXksdgvhHgCaDuceM7SUlUPUOXrdQYz1T8I
         sozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782322596; x=1782927396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=;
        b=g9RiboEeaBLR5zj3cp0sVPRoqP/vrrIx7FvDH6e8Yq4ULmA1+R8UDNo4c1kKBGWdWW
         I4Hafp4wkuHKVyxYR/vgZS6YA6VcEaUOHurDPj5ZO4Lm8maZjz/mePCDIfg4LKJB3pTO
         uesZKRZSp0kJP30e7vBA8l8Tv793ZBdIFPzXe6wy2KoLoHCu8P5AXLHVbti2WK69LOa+
         +8pT4R8WF53B0VHwsPRsjNWQFCWyNc6/nA+tDcWnEuUSv08JmFp6yNMc9GW9/dxCmUfa
         xkzrS+ugYDiXYHvlMP+uD+o8GLg8SxJdE1h3rpgyIvjkV5zlvbquH5I5Uv43CzEkFOT4
         r+EA==
X-Forwarded-Encrypted: i=1; AHgh+RrYxbmORVoEQfcNbkDw6GzhSwkT2jsM8CSghp9Qlk/2JoMbt+uhN8MQj1C7nZbdaCUv89M8/+01/2zXLdO86efG@lists.infradead.org
X-Gm-Message-State: AOJu0YzS5qkmBufuVALtVbNXFd2ncqBN01S3a+g2JbOEUM2OyHakWxfw
	QxduF3Z7eIazILcFdA2R5p+CqEHFX4wsKGVEs+WEas9Jnu9TH9swJZuguFDgzJdZ
X-Gm-Gg: AfdE7ckByUl4S/8vCegEOqNw2yIiOaSpIUE7Tfvzjsck3+8z8CetLVXC4gKRI8EZpnM
	s8n/FnPr781e5b0hxGpPZzEjazRSrGBkv6xZPBlAnoZgR4eXdkHrZq+3ka+HNiwrrHAQsvgWwv0
	twdhmy7phlx77RJ3KQjLZXDN/Ie75TGyLDDNOpJEnpVAj50iufjBo1GEfImOlyYdnfmpEH6Da8H
	55F+lN5mVvm/nRQZ7EcchfymB1601P3kEekPOgiPGwStktvqN3pTDAQ2L/EGawKh6EFkxG5WF/M
	eeMdX09aw5uHI1y6+TgSPwkDT8URDVAv1CSC6dEeDT2OgKZvmK+U1Sgk/rQ+73QhC+7QMXXckU9
	YnGAUkifToSKKj11Jou0DQbWdanCYJ/CLGjnvEy9AUg9CowHOtrvKFLwVYYbO2eek8xAHhUvtzG
	OIIFw33Q==
X-Received: by 2002:a05:6000:2581:b0:45e:d8dc:922e with SMTP id ffacd0b85a97d-46c0b3e3a86mr7091212f8f.20.1782322596297;
        Wed, 24 Jun 2026 10:36:36 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1b754471sm8165914f8f.0.2026.06.24.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:36:35 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167
Date: Wed, 24 Jun 2026 19:36:15 +0200
Message-ID: <20260624173627.19785-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_103638_532380_37B345B5 
X-CRM114-Status: GOOD (  12.61  )
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

The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
compatible as a fallback, but the documentation lists them as separate
entries. Correct the binding by adding the correct fallback.

This change fixes the following dtbs_check errors:

DTC [C] arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb
cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
  'mediatek,mt8173-cec'] is too long
DTC [C] arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb
cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
  'mediatek,mt8173-cec'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Changes in v2:
* Fixed yaml indent (sorry about that, I ran checks multiple times but
  it did not show anything - I had to clean everything and run them again
  to get them to show...).
* Added details about the errors that are fixed with this patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260623135757.5111-1-l.scorcia@gmail.com/

 .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index 080cf321209e..bc288b1c6f07 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-cec
-      - mediatek,mt8167-cec
-      - mediatek,mt8173-cec
+    oneOf:
+      - const: mediatek,mt8173-cec
+      - items:
+          - enum:
+              - mediatek,mt7623-cec
+              - mediatek,mt8167-cec
+          - const: mediatek,mt8173-cec
 
   reg:
     maxItems: 1
-- 
2.43.0


