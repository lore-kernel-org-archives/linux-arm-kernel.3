Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61D7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=; b=BzjMiemqXll+9asYAiLWbKanVO
	IFx7bXH9QdjfXT4wzZiG7xNcTEDH19wBUIrelND7w5baWZtZuzNL0itI5T33aWeIieefjxruxkuU4
	zr36ETWoAykZmt0bSsCNAXlBvsV7GRMFGwgpJ75O+PdYTD+C+yz1I3eq5xXvYS2sU501RJ08BJn6j
	fyTycS34U8ov6Xfh8fwRrEU3PxdbiCzwfQEaorMEOyWp6uidKjHC61WOZWOcGXdqobg987Ir4+Dw+
	3DH6w6NEk7Blw6rs+0x3gpcVG8lZy15xg+cQlQW319HzbG/ldeHE4JlcUS94Wu81V3Li1UJUfxpFy
	l6BQxwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whub0-00000003Ufn-3ceG;
	Thu, 09 Jul 2026 19:39:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuax-00000003Ueh-3yFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:39:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc827a68fbso511335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625979; x=1784230779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=DR2dqw8enPzJbvKW1pbCGOqy0OOK32Ls4kDKuxxD4YH0OJ3WjxjsITi7dziSJxkIet
         mFHt/G8LDIPoDDg9WA79hGDAN2x4bVeKbihY1VqF00p7ieqZkd+2TzRTwVSeZOn9TW4Z
         G0xW2+EZGNKtSB0KaO1UMOKQVuM5wrK4H+QvR88erQaDuZRY9QkBcYUbZIPvz5xXGU1g
         2YCMJWkxh016oeDOmvrUNHNYljsLbFbOKzMrbWAiaPP6g+bjXmSD1d/73oimGoKzPSmt
         F9IEoDpc1Vf/fX7xWGhcYJ8Q6kP1y5VJ6msotClNtVvhe8AJexJ0/QWz41hxLHLOGh2Q
         rFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625979; x=1784230779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=kAsFzrLCZzugGkUCX7lEehUMEdb1k/uA5Ph1DqdoG2xI+oBK+kejknGpicZ1zydVU/
         1o9FblHIuMfsnOvR+29bNMDN+FwgNjb/dfplay6kw/cA4m4KPtqiig/b044IYkjuq1NF
         nd/w0NyWjPTWTbXZKQNGhJdBWCWquVmSv1j0R1iR+AJ6QDZw2SjMUq4TMEnnlGrSyBD2
         moZnjdZ3xrMk71EuIFXj12ZKLyLs/VnKY+nlsXVv7l1QWV/uVLhp0XVFCbrBrZXj1hFy
         7Y2JdJC2QhSczLMere0gTjjyP/AmxYH/4sZfw9vsFje0iSMw6p7FvyqEgWbyT5hpE20t
         d79g==
X-Forwarded-Encrypted: i=1; AHgh+RrFT4mYw3s08omvoYbOHrobeORafGYJxvc3DGHXRIeORjERXLqM4c3mgl1kde69fCrzLqywmTdSa83E25JN6DQG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1+KAywftY/IxLZQBpWxK1RbAiQRYNZAPkal1YPKLBzNd8E3As
	hQynZyzknO9BxAdMElj3vSe0taF3m3OBkF1T9ale9lWTj0OK0lSEdEg7
X-Gm-Gg: AfdE7clVfOTrKbGiPpC4C1aTvPgAuUXM09S3slQy0pVCcZctELj6yA+c3kXL6sy+5LD
	tZBr1wQXzZEbUdKVIPPiq2gaOfTwi2Raq2pR8vpdcEqTjtBubK5ZDARsXSMUr4CQrv1BJ7tD7+R
	RPwjobgaKoBVKLywRP7Twghy/QjqaI7ZCfkiREr0pmHBzjfvyoPJzk3IWDfv/ebiTYGSPCaTDtW
	1R5wqTs4w9WNhoM0CeRDYumDRJKkRIpSPnTXyJ0DTiKX9X8yDswaeHhrlLX246tZ0Utrerd+6Bp
	3X2S0560sfftTWpakN2/1ACbfhcTo/Gdx1QTNnqepvDyqn+FWpVu5Xuwpj4miBmA9b9S9II5WFN
	FD2Gos87oQD8djBFDM0/OsYE16KN1Ue00C4BNtg1FALogBhQstQ2P2WvW9ZdWPVyHvzoe9fClgQ
	49xiXh6IFCLQy9Oe3SL6hc07ucnLjw73FQjiOMVo5pkCVBBxPamE89iQ0pEJAEtIcDHQ==
X-Received: by 2002:a17:903:90b:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2ccff09e0fbmr44702215ad.4.1783625978569;
        Thu, 09 Jul 2026 12:39:38 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm49018755ad.79.2026.07.09.12.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:39:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
Date: Fri, 10 Jul 2026 03:39:27 +0800
Message-ID: <20260709193927.108105-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123939_987020_5E6ECE65 
X-CRM114-Status: UNSURE (   9.12  )
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

Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
follow the GPIO hog naming convention, but the mt7622 pinctrl binding
only allows child nodes matching '-pins(-[a-z]+)?$', causing a
dtbs_check warning:

  mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl):
  'asm-sel-hog' does not match any of the regexes:
  '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'

Allow gpio-hog nodes in the pinctrl node, following the same pattern
as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
gpio-hogs").

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 6b925c5099cc..021307b6d801 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -65,6 +65,11 @@ then:
     - "#interrupt-cells"
 
 patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
   '-pins(-[a-z]+)?$':
     type: object
     additionalProperties: false
-- 
2.43.0


