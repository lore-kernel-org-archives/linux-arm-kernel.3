Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B8CC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=; b=idXMofg84unihjjwD682vaqsrU
	Ypg1hdtu8CMBDc77wEiAEQxYcXcBxvS8lq02yd4sNOJtobSiaFAm2pp/9xfZx+UcwPZTG84BXgOvp
	HiXLqugzf4jMOoM4/mQ0LTCdlZgNqyq99H6hGtdSNJNscMvHwffgSuypmFUV/NWGjaUU6tTrXPkob
	ogDsbMUJG1vYg88NhVfbcP6rHokl678n5fRztWjd/I6jlNmB5vW03xPgGWKcjjG1qPuqffikJPByS
	jdPE5r5A27pvegt9wzx7IQ0GT8E/bayaHwtI5ycWXGl0An6nEAm9cZ3iay3u0itLW+Ut2D6qfWGrJ
	sOaUs+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3VE-0000000ALmm-1P2E;
	Sun, 09 Aug 2026 13:23:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3VB-0000000ALls-3Bgd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 13:23:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so529002f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786281823; x=1786886623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=;
        b=Eoe2Uie0MhSG6MkT2Qry14u66upwKPHeKBbtgXPIrCnM3UxBMA3NvEk4bmZ+4/AC+X
         THYOkxW8IH7nIyTodhkpU2TNKvV+J1p/PAUfFIq2C+HlrpUBKPzkO1bh1fEp16c5/B+U
         5x0PO45eCyPBC067cO6pmNkDrXRzNwaXtoE59vq7/tstJ5Fyc/eIj7robSCsWu2hTPKI
         N/5yZvHSdnIb7qjt9XHWEkCFkaGlGWC2PzE0uK7KYUfDlmUb1AxPuzjvT5TGV5TlQ/SK
         +UyoucHhM6wwLNzzd1KvAL5EFOvxRuES6smTj0r/mnlwi0bI6r0/nY05YzgKuYdJ88t8
         ybMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786281823; x=1786886623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=;
        b=L/WoQCPuXBPwVn3TTz55mg1Z5AFftbsRJFuZTbVmg6GRIZobJa6AIsMpwST7zfAMHW
         lwjAcFkn2aY0mnTCfcuqoC2JSMqpIwBHz55dGE2Oe4yQiDIGE8/cv2wsCa3OukBTZCLh
         5QIBsXsmP6ZS6ExYN1BWdezzlYhfCiG4YqSWvQGF7e6+lvZLPqPNGNBodMhUGXRr7c1i
         y7XOUKju6xE9ao+zIvgaFRj73MLWKs8nkOgmJ9GrKyPZpX5+E3+p6uNnCEnxTQ3NXInf
         Xy97pBE66sRSOQBsLbkaR27fKd9DOC6IXmVqfl00JKXSCJobSdhU+KA3uN4R0SNQky9+
         gLjA==
X-Forwarded-Encrypted: i=1; AHgh+RrCZBFBH5z4g8vSrbQmg07fd4+RYepJ8M9FSjBd2DQ4Mg5GWXPa0h09g4/bpa2qRhMTfuJ74zk9yjeiRjk3GLq9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9mvuTg8FR1ykOnrzpn9PgnYY2SDN4LDHQkuJqg1IGbWxBJxny
	3oyYt4kKE3xrBo6jO4k5QbdkYfD4iHUeFIt5luyZMKvGvnqsq5kGFmID
X-Gm-Gg: AR+sD11q4V0j72EUAB9K33N3HsTv7RO1ttyqr2a2/akYKxj0bfnLWjjL/Gdx4hzCDnQ
	Xym+Md0KZ+teAKvI7wEiFU94S69DaSC6XIEr3cAuMtXlwWR2prnPbWN5Uuco7Rg/EydDUbGr5/9
	eGXCaHeko/duhoNBQWNVS0hgme698huAZOCk67M6zfR5VpsJdhPeasrju4UVneGVKgEjtRvlJ3n
	dJI6rF4PBLf6PyXlDg++DIaejv7TYPJvd2AZ09QxlsXNLC5xRI5cNUC/hc7Y7/CclPd2AENh/Mo
	9pf4++fukKAQodzmF/CBeWhX0YRLwWM+F4wxVElLbB7g/m6Vcpb2WVGEQ8U8pGozzSEi8GXs6/a
	1TZUTSNhlaENJ4bY3G1MU1X5p8AU/3eghBaNAl7frNZYaOCq0Um3+phu775ID8WQTYkxt1sMEeE
	d+prhZNwlkjCmfOv+V03aNpRjkFOyvzAcbHX5NWTcw93f2zw2goa+7kg==
X-Received: by 2002:a05:6000:2913:b0:47f:973b:71c8 with SMTP id ffacd0b85a97d-47fec62e4eamr46608879f8f.21.1786281823240;
        Sun, 09 Aug 2026 06:23:43 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm22476356f8f.2.2026.08.09.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 06:23:42 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v2] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Sun,  9 Aug 2026 15:22:24 +0200
Message-ID: <20260809132241.6153-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_062345_846078_0D2E0E91 
X-CRM114-Status: GOOD (  10.74  )
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

The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
them as separate entries. Correct the binding by adding the correct
fallback.

Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
mt7623n-bananapi-bpi-r2.dts:

i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2: Simplified error description in commit message.
Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260624173514.19752-1-l.scorcia@gmail.com/

 .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index bd8f7b8ae0ff..966127e1ee63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-hdmi-ddc
-      - mediatek,mt8167-hdmi-ddc
-      - mediatek,mt8173-hdmi-ddc
+    oneOf:
+      - const: mediatek,mt8173-hdmi-ddc
+      - items:
+          - enum:
+              - mediatek,mt7623-hdmi-ddc
+              - mediatek,mt8167-hdmi-ddc
+          - const: mediatek,mt8173-hdmi-ddc
 
   reg:
     maxItems: 1
-- 
2.43.0


