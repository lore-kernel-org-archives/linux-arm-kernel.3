Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9461BF9D0D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pdc35Ylej5ItvmLOneRVPWcqxy/OnSmxmxiLCyeKGpU=; b=kAURhw8hEoUESsioFpfudU+20R
	wbsRNnFLcGdA57rv6N5rCE3c0XQKSvZME7Khv4+LxcwZYkGEqMSDe+GIfnJp6HHTGjnjoMhB1OB1a
	vLJ2xbMcqYcwEs4aLvs9/W7LNIDPGA4zlvCse4C9+zJ5O3VQrUbVjRoDoGWdBEKDUzJO2gM+/li8f
	qFP0meIhT1td0todfZQrEcgAnFlPMzcEcZTUZya21CFYsR1Y9gyy9Vmxd3ZfxSQdnLL5fh5AOhIbs
	0a+dO4kX8ZLM9H9pi7NW+QNk7Wj0huPxIY6F7Q6SYfrBbvlE0db2yMYzzyLCQaNU9PobyEWdcaI/i
	uzHobXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVT-00000000Feh-2lEQ;
	Tue, 14 Apr 2026 21:41:15 +0000
Received: from mail-vk1-xa63.google.com ([2607:f8b0:4864:20::a63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVQ-00000000FbS-2TyJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:41:13 +0000
Received: by mail-vk1-xa63.google.com with SMTP id 71dfb90a1353d-56adf76631cso2535338e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202871; x=1776807671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdc35Ylej5ItvmLOneRVPWcqxy/OnSmxmxiLCyeKGpU=;
        b=AsEsZsJwPwecnQX4+i55eBVDvF/YwVdUIkDIq49XeEm3ky5zKVhQA16lv7dbZoK9NJ
         vravcouJreiaWVKPJzhbDonDAi3E/jOLLdTa5P7It9BQH1Yu2cJBkI5yTrwo6VQRsdkO
         QKWJn1SslKoSySUA/VnjH9+UXdDvmGQ0UkkNrWlEM/9G7ydze1SOTASxKjtAe10i54FF
         OIMg0SVMcppDXbEBzmNkHi93HhSiWYdwdgHhE8wKnTdncphsJiBjxIMl1LeFDkRpmvKF
         KgONG25UMXwpq8glCNTLcqM98NkVfFbxTk5wdQJKcqCrjfDCm0peDUFUQtcie4z4pG5v
         qxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202871; x=1776807671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pdc35Ylej5ItvmLOneRVPWcqxy/OnSmxmxiLCyeKGpU=;
        b=GLU9XxZ32ML4xk7oB2jUWdtIvUJ55nH4Ee/ndNWxwoGVNteZhqwzkZMaBKzapQlZqf
         YJKRo8C2P0Dy6D7hk3vzhbJ2pgmhNsDZtfxaeQRApWV/Kdd37gwYkLt/ApVU6MZw51S0
         /dzHozoXXy2bdqQl5sJ1Ig0viXoYIX3uZgbzn9grOR1L4TlxyefyNJ6AbSGLUjcth0nM
         GDBeR3GKmB7eBgvh+rj4vOiHxrmJvA+lnekM5qNNgn4081LBNs59HHg4LMN2k+4jG8CH
         SnrFB2rFKka1E30xUByCrZWFcF/48bhUtnaXsenEIEQBMtazRYFe6YclXYZXHqL5Ikg1
         Sz4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/FvpkCkMvnlypSuIDiZvUJeP8oAfpIxjw8vdHIJKCB4KUkwo+CWA+g4aJHZCh49ykoLuftSbML6BB5wJJkUicA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9fLKla1MWNo0e6T9aDuPhpP0OIR2Bw1hH9iOWc+umH091yy5L
	8Wzfnk7kMtbPltOZh5TaFPPXOEmUUCXqoSnV/TkHHcYpNVs5+d/b6XOXw5DkQBDOcWV4W24RVnr
	Jp4gCZe39GhOMZvZJOWQkKu6A6TKcuW2GRM4U
X-Gm-Gg: AeBDiesKjod5fcCAnGUYZGQsbDjMc9ZwoCrPqg+9kiVnzEnSg9/EaGXeuwokAMRoIbx
	Gt/7aKlbmxfUhhP/fBhSLJquGMGqhOrVx+qNmpl7T402ghQVjZHaHsd09HPtaKE3Jem6Ki6FPZI
	C6Qkc2kzilxfSin2pWYnkxb1extA0y5LhWSpBcPUnOmr1rt3JcDbVskCoOPvO7UIj14sVoga1z9
	zycApt9SjMMl4juY5JenEyQT3nk1agz4d5VZxPheIbn7/qnVFqGN2BcwL1QWt/UtnMbywA35kec
	/4CVv5NcaB5ZudqS+5sIokMmFSd3B36Iub7IhTXLnkSlkIHjjEWKRSAirwvui0pEhEwyTWgDlN0
	zGlgq8KVtOfWd97faN8T1y1MNBc/XmbJ9sUWj4f8hCiXZhMf7rr7tcvo=
X-Received: by 2002:a05:6122:4b82:b0:56c:ce0b:fecd with SMTP id 71dfb90a1353d-56f3bce78b3mr9047810e0c.12.1776202871351;
        Tue, 14 Apr 2026 14:41:11 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:11 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: 
Cc: Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 2/6] dt-bindings: display: bridge: simple: document the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 14 Apr 2026 16:40:53 -0500
Message-ID: <20260414214104.1363987-3-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414214104.1363987-1-dennis@ausil.us>
References: <20260414214104.1363987-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_144112_634344_0697E122 
X-CRM114-Status: UNSURE (   9.14  )
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

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or
a DP1.4 source to an HDMI2.0 sink.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index e6808419f625..752c736c8f85 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,6 +30,7 @@ properties:
           - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
+          - lontium,lt8711uxd
           - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
-- 
2.53.0


