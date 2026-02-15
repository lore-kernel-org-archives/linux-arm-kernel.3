Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F0CEF5872
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOuzpPA9uWV8J5AQ3WmBGHEpVL6AtcatIKQ7g9sh6vg=; b=1GHSvCGAD14tVmsBThLQl2eHee
	7lvDzqW86N76ASBkWw6E1WwwiZKIeq05HthrOx2RXagUuItdx8yHivJTidvDs6X8OVQe8/4SHBRWa
	DNYsl5mMInxfVqO5Y3ShXeKJQfaDkRSJEAUl1BSrETCx5TOOBYA98kXEC9DowgP0sGn6xCDB+lP9h
	V5D8pH63/FxyFfbBFXhrVD+rh41TOz8Yk0QQhY5ltBK1mKTpFDL9H8WBVmA5cqt0XYfN8+aTDB4k9
	DNtmvS3ibUoxi3c+BhRB+3ZBB3IH6nfSPx0Q5Al6BoehFUz8tTz8xOkBYkh7tH+WiJu3YMRSuPEdG
	uu0qx9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXuw-00000005HEe-1IZE;
	Sun, 15 Feb 2026 08:55:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXup-00000005H7Q-44Q3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 08:55:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483487335c2so19956135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 00:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771145742; x=1771750542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOuzpPA9uWV8J5AQ3WmBGHEpVL6AtcatIKQ7g9sh6vg=;
        b=T2DBJAf9SpS+l1V23UogKakaDl44OCbZb49iYtrJF2uerRZffXr4958033bwmaX9Xs
         eMakdl69mriDHPqOxio+LJF9zYhAmbUQVTscM0Kju58ybdzSiPLSNmbF1Epo0xzVOev5
         4tHq8QOBcT3incfnNxieiquLcIBvAke13QpZ2lB46csueeQqgc+nkcdIEk77UfdGI5iP
         ray7R24Nuzxufs9X6OuDyZ1w8DTo+rMDj7HEPNOeTH2eTogsl1L30cJ/B7/m5WRxOYUI
         z0H7nDXN8B6xDKQo8W7X/tfGJSAMdkhAS98GEDNKVxcaqPjTt+M3vKHgMqeqzge/5++B
         V8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771145742; x=1771750542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOuzpPA9uWV8J5AQ3WmBGHEpVL6AtcatIKQ7g9sh6vg=;
        b=pmQ2HdtZoGLqXvX+GfbMm7FSHl6E+wi9r3KM8rauSJCmotMMYo0N8nw7CX6eIcvY1i
         XmLJiyy+xEl1CjayGJj/g73xi4uIR8LSQUGKUb36f1Gmi5E20uUu4dLGmeK9ZFGdq+UB
         PlGit1+UzdVyyfW0ks5m0MnC4P5os6mNeYlY5OL+o0bMulzZIcNB0LFdO5ofG6WpMrWX
         jJwZwINQOjqQvopFttuR6n9lTFFrbsKtXiNjSXvd31F0U0XL7ZfiRRpaIgt29EskWBxj
         +5wW2rWrUAeTDcHa4cJv7jZAfR9pHJQPMOQtDlDKXTNL10lJcWaX2b0qJLmnw/6KXTxz
         k/Og==
X-Forwarded-Encrypted: i=1; AJvYcCXN3pCyVQR+YgK8sYWNrJ5ifYsEyHVK+fpVmBwr2lBDSsVy5+2T438Rg94Qio7g+FE0iv7ljQv5hB7Y1ceVZILh@lists.infradead.org
X-Gm-Message-State: AOJu0YxDrKnOiGf06CsBC59QhE00Cm+Xo4RGhYWsFzKq7XdislQTKSQF
	hvNYZZhUGyFU8vX45xtZPOHW5P7tkcE8eEbf9TZSF0Yf+3O6ozVt0b0o
X-Gm-Gg: AZuq6aK+KbwJ5Q96ELGx8nK88wnITtWhpZwju4GKGA+s/3sX9F1+BN8YQKCuK+9HUh8
	gnxIsYbmiKv7t9jKrf/DIOZJ9IDT8gqKfxUQCmB+yckknhe2+cyP9n9Mx8QC+8ViNwyCnL+WhTJ
	txHT+UoxN4cfNz3hKfTmBZbKejUhAlzW0dXrPNEFgldXI0nDo+0mxM3lt4IDd8fls1TAYZfo+UN
	jpgwU5DCoe3Vm0rPHiNrvdW0reFvhLMEuOHfSz/oxO4DaHpB0iPu7FDmpaCiIDENYSLeEK5fLba
	VP5NwLxogYgkdmcduz7fYADmm9/tv/YVR5n/zy2jOespFJVd/IZ1PgczxbU+C/fFfPBq7yTOKbr
	dueNj5DCd9irlbFeKbwChHokJK76sL4BQhqMHs1g0eiS9EG50dnsQ6bxg6JN14zMh6tYLAMUfWb
	ZJjftYGBy8GVo8G2qqrUM=
X-Received: by 2002:a05:600c:a43:b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-48373a0808amr107412955e9.14.1771145741816;
        Sun, 15 Feb 2026 00:55:41 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm547211675e9.1.2026.02.15.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 00:55:41 -0800 (PST)
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
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
Date: Sun, 15 Feb 2026 08:53:54 +0000
Message-ID: <826d54c75cfd1b8e4713431a9426e89edade9eb2.1771144723.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771144723.git.l.scorcia@gmail.com>
References: <cover.1771144723.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_005544_096206_0BA3473A 
X-CRM114-Status: GOOD (  12.11  )
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

Add compatibles for various display-related blocks of MediaTek mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 4 +++-
 .../bindings/display/mediatek/mediatek,dither.yaml           | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +++-
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml  | 1 +
 9 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index daf90ebb39bf..4bbea72b292a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - mediatek,mt2712-disp-aal
               - mediatek,mt6795-disp-aal
+              - mediatek,mt8167-disp-aal
           - const: mediatek,mt8173-disp-aal
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index fca8e7bb0cbc..5c5068128d0c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -25,7 +25,9 @@ properties:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
       - items:
-          - const: mediatek,mt8365-disp-ccorr
+          - enum:
+              - mediatek,mt8167-disp-ccorr
+              - mediatek,mt8365-disp-ccorr
           - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index abaf27916d13..891c95be15b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt8183-disp-dither
       - items:
           - enum:
+              - mediatek,mt8167-disp-dither
               - mediatek,mt8186-disp-dither
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 27ffbccc2a08..bcbde16648c0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -25,11 +25,14 @@ properties:
       - enum:
           - mediatek,mt2701-dsi
           - mediatek,mt7623-dsi
-          - mediatek,mt8167-dsi
           - mediatek,mt8173-dsi
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
           - mediatek,mt8188-dsi
+      - items:
+          - enum:
+              - mediatek,mt8167-dsi
+          - const: mediatek,mt2701-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 48542dc7e784..ec1054bb06d4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6795-disp-gamma
+              - mediatek,mt8167-disp-gamma
           - const: mediatek,mt8173-disp-gamma
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..679f731f0f15 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -23,6 +23,7 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt2701-disp-ovl
+          - mediatek,mt8167-disp-ovl
           - mediatek,mt8173-disp-ovl
           - mediatek,mt8183-disp-ovl
           - mediatek,mt8192-disp-ovl
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..cb187a95c11e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
+              - mediatek,mt8167-disp-rdma
           - const: mediatek,mt2701-disp-rdma
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..816841a96133 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -24,7 +24,9 @@ properties:
       - enum:
           - mediatek,mt8173-disp-wdma
       - items:
-          - const: mediatek,mt6795-disp-wdma
+          - enum:
+              - mediatek,mt6795-disp-wdma
+              - mediatek,mt8167-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index acdbce937b0a..c6d0bbdbe0e2 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt7623-mipi-tx
+              - mediatek,mt8167-mipi-tx
           - const: mediatek,mt2701-mipi-tx
       - items:
           - enum:
-- 
2.43.0


