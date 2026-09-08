Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED53C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=; b=5GlPN0Kqcd+1ssEWDCY/SHnOQG
	aWLYj7Io9Fs9db4UfMPG6gmmyZWphTYOpECv5ST1YBfEgNvnw/8pQV5FVPAWXedcyBkmvDNCEP25+
	ZfFg7GzgFneiYZ8Fe5snfv4z8jDjkpr14EMx16hruBJc6F1KxthSyOlIFfSjd/X5X6IT/CZkI4acn
	SgVNYhtfOmenybdySJMupcuT3u4NuHXpmSmLrXO1nO4Wb3splSMGNJtw422c0lrUjzq4lekTdVHmZ
	/tTF8pU420QKJWKRTttUKpMLSOqmQgr3DMk+EADkQ9EbaFf9dJsDJkG9y/K9RRSRi2E+w5t4hf0GR
	yahFFk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40lL-00000009zlN-0Gw2;
	Tue, 08 Sep 2026 18:41:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40lK-00000009zkz-01xN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 18:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=; b=YzN7I0j9EvLDz6ua5b1Qb4uhYg
	Y4kLsL6pk3nE1gebz4Bv9ILTQ0BwuWkCgj9D5ZhYJTOI8aGh+iM3gcBGIeC5lsTXZSgEZDVh79JgS
	V31jcR/CwyDRLYaPcO5w0htaGIJFd+ONw+aC9QUCWqFHLopBVtLnGPO1XHFYw/rhOxI747gBdsmE7
	N9q4QMhZrZVtJ3BYeZTK9Y5A6JXzbZPp/twHnJ61vQjpNVIUQB/BltlsDC5zXIQYuOU9OsnNPxCI6
	N/20tPI8TeUwr8Kcb1AR7BUdUva+iqZrW/nVKC7BGZLk7UGK49tAtuAEVdcgVXv7UnLFd0Q3M2bpt
	je0lncnA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x40lH-00000000ERq-18fB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 18:41:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so60109195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892898; x=1789497698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=m4CMcTwSmSsrADGP9Hogxse6VTy6Ugg3Q/WWq9+kVOCr/TUF3MGuPho40mFnoxM+am
         c1UH3tk8do9d4ZoD3nAoyc6YZeP6ZUYJhW4h87W06dw0Bzu3BrsFcJmoY7AFmmmOv6eE
         KsZDDa+eoplctR4ydXnkWcKhlg/bdLmhpoN7h6xOrnJISTJ1J90lSIlHTuKd+h5tJ5bB
         ggVTbP4pKQMXhr/+V/ivclN9Ff4OnJJexBIxgBolKpOW1ieZ9QmrbuNao0DZW/zq1VH3
         5QgEfh7cQRQ5EYQ5uLiALGsNARJNaRgvsjM0doVfOkTkbiIWwkr/xgz4Orao2aBgvr7m
         +wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892898; x=1789497698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=ZkQb+omFosvQ43N84lUBcERJ8MOD/hgpT+RypAdMr7Ni0zO0i0IbCZVv8QeEQYkNxb
         Ape+KEu1SuLVpXsPLlwSUXADH3KpyZ50hLP4dFZX6CyMod/AyVERuZUpf7hzpV2G+tFy
         /r0ial3PhVmwWKugTDoEbD2PHDDGY45NHWw1XF9fXQ1Tn0yQO/95JkiH/1p+1f+v6HYy
         MOUCYfyTrwPgJxE7wlAgM1F0DJx/lWdxaNLW4bZ2nqFJ1E9BXsiDQgYvu7picb0ciRKK
         YWmVqAHlQaJ08eVQq+OijpAZyHxBcwvYIHQBv2ry/hqyPiUwJb9sgGso/kLg7r/1TlDe
         4Rlw==
X-Forwarded-Encrypted: i=1; AKwUvBwnXpYMgWI+2DpNsv5/56+tAEEFx2JXNq5yOhux1v9c/qshBFQ0UNEacXtaPlPMGHceHGzywATsGuFGULBB7NsQ@lists.infradead.org
X-Gm-Message-State: AFuF++lfoyNkGw/xzvjgqmZd33kkxv1AO3w+MlMU8BOpChV7lbA34sJS
	IXX22uW+gQd26sX5RW1WjdE/CRol7yyox9wFqAXMjwY0Sw7d5x5Tcq4K
X-Gm-Gg: AYBFou3e3BjfGhQSzlH1nvWoaNw2k0+lPtLLaEmCh8sTiAmPnojDYKv0RjuiqnjMA/n
	g61JyaouELn6zfH+grbFnaEaa4cS0pTjHEzn7t5XkStCvkMQL382w095nurVDBcsQG7SUJqLJlx
	SGNZDvoEKQjs+HdSNZYtf7aeOCHTiapWUzhtlTFK40nyePZ4zzHbQJlLmmpMqDM78PXcfvgXWNj
	kEDaohPyFVd9PX26gHJCwM9oMGHW3MdgT4KZ1g+WCKyjMqLGmo1YVYhAc7YrJXjt0GysSKaQ25x
	hzrzLw8jngHiHO8ClRQWzD0/wVU3cEfsKczdBI/n/pOssEIl8j9hpn0ilb1kCJnBtiLywTjIyRq
	47Clpo6NSfdcVCLnzAPtP7cvM9DMOc+PJG1QS3CQ6fnxE1t8ZG+EbDSdDx9adbpaPKv3y3p/ZTj
	MO/s433S1Rdy1rbacPztkWeJppWg5arfTaScn1DJCCW60vxXEzE35mHu9g
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr371178485e9.12.1788892897552;
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm38558775f8f.26.2026.09.08.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
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
Subject: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Tue,  8 Sep 2026 20:41:05 +0200
Message-ID: <20260908184125.10916-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_194139_393261_56DA1D59 
X-CRM114-Status: GOOD (  10.08  )
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

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
mt7623n-bananapi-bpi-r2.dts:

i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

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


