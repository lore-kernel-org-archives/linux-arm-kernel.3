Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F5EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ilQCMhL0zZkQUGRLRjUKYJt6Qmtnyc4KrCcRajmp7I=; b=p+zMEYEQxYsuyRi1n0bahdUUt+
	rAtlfTwr0jNQ/nVGKzumQNMb/wKcINE9UFqXgtPrU0+L3wCtH3QdxLxcAa6QjRl9v25x3ckuRs62l
	edNYpsq9e1dvq0Ze9zBCGxDHS/Z/4OasmehEwox5A9OHQCY5qeCrMoJuukdl27DTl0Xtn1yaCk36t
	d5bC9veMAj9XHHmJSZcrBJ78hR6njAuhm7IOF2uAytSakfnvu3Rkbu/vU9X/sU5Yy9yVXTZVJ6LKP
	5z5mY4zW754pQ8YiHSrCgBrT/T6rmR6X0yg8lk29nlfRBiOAvkHXQpYsMnWwWlnSljUWY1PzkS3Wd
	asGjFLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFFFb-0000000Fngl-3N8b;
	Wed, 14 May 2025 16:46:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDiC-0000000FWTL-2FsM;
	Wed, 14 May 2025 15:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1ilQCMhL0zZkQUGRLRjUKYJt6Qmtnyc4KrCcRajmp7I=; b=QbTh5f/qhMMGiEMrGavjA3oCyi
	HsoUQlnyuCBw+RwI+5d7zZhcOL//C0ciHmzAF3EgLJS3kQ+Q4R6Ot3v59nWJpBrNLgVcq90EweWXG
	jeQ3v4v7kqoL0Rx8i41sZxJxtS1PQMjZAH2JbDwlfQiAeyIJ4BqO4BymgBv8xkQAVa09dxIiZi9To
	8CRbjHqXsAcI97FA9lJc/YhQG1EQfpvMT8tjRWjnO6d4Pm2PPMSx84sNp05k2jw+sr0r4QBOE9aZx
	ysO8qe03Bli0+lKVKNGDVYloRZAbJjlqm2wBSMWZoe6p5G53n+wAsaYiYy9SY69uVY1uyOwBQCuIU
	XQM5QFCA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDi9-0000000HE2k-2ml0;
	Wed, 14 May 2025 15:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1ilQCMhL0zZkQUGRLRjUKYJt6Qmtnyc4KrCcRajmp7I=; b=ylvxwiUBtdYoHROVLUmT3jtJsF
	JG85aJtKwLIKNzRifY4y1JyYuTEr2/Kt6zNnOvCMWYZc+m7VdaocDY5P7C7jymsE0jQlM6xhfiRQz
	HIqA7s9vkMMlOAxN+Bj1K/kK2Rz3t1i5N+xMwL55Npd6ZyN2XNK0AR8pbmWsZdcRaN3SbzAN/de6Q
	3nmrL32XsjOy7JbAvB2JLEo9dQM1G0i72lcQ6LUEI7cH3uEQIO5jXCg9zDB7CzLwdvzC+3dYmJe17
	Mmg8mDK/C4a8dnxjAxNir6xbohg0hJiWn3vIWB6SzI+lxWCMqiKu+G6LjpC5rtBp4MeIGcIfzeb1d
	6C+S7mdA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFDi9-0006vE-1X; Wed, 14 May 2025 17:07:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
Date: Wed, 14 May 2025 17:07:42 +0200
Message-ID: <20250514150745.2437804-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514150745.2437804-1-heiko@sntech.de>
References: <20250514150745.2437804-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_160757_936398_D7E40025 
X-CRM114-Status: GOOD (  10.15  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Cobra are Touchscreen devices built around the PX30 SoC using
a variety of display options.

The devices feature an EMMC, network port, usb host + OTG ports and
a 720x1280 display with a touchscreen.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..6435c724e682 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,16 @@ properties:
               - rockchip,rv1126
               - rockchip,rv1109
 
+      - description: Theobroma Systems PX30-Cobra
+        items:
+          - enum:
+              - tsd,px30-cobra-ltk050h3146w
+              - tsd,px30-cobra-ltk050h3146w-a2
+              - tsd,px30-cobra-ltk050h3148w
+              - tsd,px30-cobra-ltk500hd1829
+          - const: tsd,px30-cobra
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2


