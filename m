Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59ECCDE00A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=; b=TAe30/ELGJZweRfHfH5zksln1k
	l3dsgxVmhfEGUZeZjPp642NofpVxj+Vm9C3wRoUgZcNxqim5GzCTCx8Gry4eqSiiuficHzVpDN1Ll
	vboiUyvsqOOD3LiQy+R9rJcDI6LlxcJTHf4j0kyAkD4Q6e9dqkJBX9tlC/0nvSgSkPAD3D/7Ckm7m
	OG0xQ+gzfE1RlkQRKeLbAIJH/G5YLK5jRLmwf2dy0td3ixh9XAOlRp7OMJ02GxNNxLEUEqHqntfeH
	ckW/BsXRXt7sQgoJoitfarKBbkjmljSfDjyWXa+z1TI/x6cGkKoDL2OWl9q5wqoMuULAmgCTcrNjT
	LFlet/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcw-000000091tb-0DGm;
	Thu, 25 Jun 2026 10:48:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcr-000000091ph-2yCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:48:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-46dc0d0eb2aso419341f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384484; x=1782989284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=aichpx/hjlBYnpeM/EqYSLYEJoCbmBKWexSrF3L+zl3XS4Gw3NbtauJGu47L4rwZR7
         8C1Tw6pozFb89t6kIL2LZ6o6kiDMkFfMmO6vfKmrEAzftH56Ugvzxq/ikFYtTn44B40g
         nKqWmOMjSHXqJyQmZeu/5D9OUNI5uoEZUCgXs0NVJWWJXwTSI95nsHxP9l9K+UlYvPy0
         5b9+BukEbWOyLxdXwHuy2t2uvyHQzSR7FRiGLHS4DR6V9KNV8JZSFMxoQIslF7UYmJ1e
         KlpSB1YjZjDvwO2ffm6+6Zlp7sMg37csR4eeG6IEULdXe4VapudKeVX8smlCDATdhdBB
         sknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384484; x=1782989284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=DU9vrOeLYGoQNuGejc2q61D06AN218L3TFr5PfeOnAJxwsqZClC3p9Khk11fXxt/DG
         b7JXkNrvJ2n1R0obUCdlwiZXeoVZzwveoXx9c1sCztXy2WHaWH83krvwXwg87IIs9Z74
         DcR1pGsYuCPiAyyNym1kUhBK3GtuBsYxzH0DUK3D3bgYmCaU5CGkPLJXXuZFTKGocadO
         1obQn4VB1vw16zHoLdbmB/30FTHjtTddLQutmyqYb4XT1EcDW+Ta/BmmZw+xOuIO5sqN
         mrdyAT9yyZzSofNIRalgHjRr7evraBqsnlBQNDjXikWueNyMNpHpIwRgRlfyid23cfVW
         NwGQ==
X-Forwarded-Encrypted: i=1; AFNElJ81Sv5yl6eiQf3vY+TPS52uMS3mO4+RtZb160QGqyUDskeu7aM5k1qWjylgJt9gJI6u2ZpfVsocUvhi6eOsop66@lists.infradead.org
X-Gm-Message-State: AOJu0YzhHIcK+bd3ZHo3pRHuP4aQWcCAvO0r5RMCxolBnGmCx7WtT6L+
	2gbZdfWTx3fLi5jnewXHDDeq2x1cmKvqpMPJncW8zsqvS7oHzZci87Xq
X-Gm-Gg: AfdE7cl/na7OCBDVGVdZEjL8qC130JbWzNgkvQeiisjJpLrclUwtGp2nV1P29as3IJ/
	ealAXDkDoMkxZmJekB8YgQN5qRLIaxbIVN+sEtdCqBGt7Bm8rRCAriTTmMXVwjCU8BuSoq1P90w
	4xY5QRJGiW9MS9hW+ewka01KFnMnjoXhTFx7yXZdiyTokhYQXtM8mpR6iJsDbJsSt/5f9arBj4w
	QVQ+d4fy59A1eu05auacdbnMNdbpfYmcU42QXU0PKm0iB9FyT0/NLF6WnIHqYfgFb1o597otama
	nOH35mtoc4vQ/2iEKbj61wkW3zdBtlzN1wu5YYfTKrFa8EQIwSfgEReuyzBotmaGaiYDrc4Lux6
	8t3hnKvBc2r8EXt7QT32tAHzQDSxZlLLpxR+AJyuIcRVe08GAKwldjVMXHV7tf4FFSy616BYGtP
	gpkgjdZQ==
X-Received: by 2002:a05:600c:4f43:b0:492:660c:5fca with SMTP id 5b1f17b1804b1-4926688582fmr26319285e9.23.1782384483738;
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to mt6795
Date: Thu, 25 Jun 2026 12:46:30 +0200
Message-ID: <20260625104742.113803-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034805_765463_283FFCBC 
X-CRM114-Status: GOOD (  13.33  )
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

Pinctrl settings for MediaTek mt8516-mt8167 SoCs use two reg base
addresses, one for GPIO and the other for EINT, as it is common in the
"Paris" pinctrl platform that is described in the MediaTek mt6795 docs.

Move the binding compatible for these two SoCs from mt66xx to the mt6796
one as a prerequisite for migrating the pinctrl driver to the
pinctrl-paris platform.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 2 --
 .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml | 5 ++++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 1468c6f87cfa..0cff2a352b1f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -22,9 +22,7 @@ properties:
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
       - mediatek,mt8135-pinctrl
-      - mediatek,mt8167-pinctrl
       - mediatek,mt8173-pinctrl
-      - mediatek,mt8516-pinctrl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 9a937f414cc9..c703de72e1d5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -15,7 +15,10 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt6795-pinctrl
+    enum:
+      - mediatek,mt6795-pinctrl
+      - mediatek,mt8167-pinctrl
+      - mediatek,mt8516-pinctrl
 
   gpio-controller: true
 
-- 
2.43.0


