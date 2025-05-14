Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3374C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=RqwC3QsYzgcIDxCAzXIe5yjcLc
	qMJKolYnrT/hJVjpbxRjcI66VLW3jR2CagwA1LFVCcVpXPe/mqqktyqcrjEhmO5LT7Xt8VZFBLhHZ
	/q/vYwrvznxiJuQ+5MpzVax9Nl2lz4XrnLcIxt4PtR2zShzCcw2z7SxUXc+8ooSHSnoluI7/n73P2
	LfgTcJM1QEojXalMjhtro3w7DrmKTnNppZuKPxUPjmvE5m1Yylx9qAb50ndsa/4ajQC1KUALY75k4
	LF8YCZBmZ+t07ILAtg7snKf6M+zaQS9xPTk3XEZ52PIGuDMKtFAPFL1wqyWBzNEg2Sn8ESmOHoguR
	LgoviyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEBP-0000000FcPB-3rMd;
	Wed, 14 May 2025 15:38:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDiF-0000000FWV1-2008;
	Wed, 14 May 2025 15:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=O6fMk4bcju0lInhXRJiCNXkZAL
	qAETkwRL5gdZlY0cnEx5X7xoxUJidDWL9jffRQXFO6ryrLKPedu24Hf/TFv81ehvWKZTMBi4gRtJs
	je2yq7j5sfmGH9LPi3cjAA/gbG0hFiqednwL/D2gMbz46qO5QqUUwY1HQUUvAJwC2qAqvOPAoXTzc
	E0y8Ia9F9ocP/VKeFewRmG4fO+nLVF1b1r9P4EghKgvETnbKz7wbQ5VQcvGd5nd7v0RGnq3k7s4BV
	odZIluSLWvPPG368t9RepLpKfFJhsAVrq25of/b1uTHC1d9qhiJAE5mNXgxGvJumH2ZxTvPiRtYB6
	7TB4+sQQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDiA-0000000HE3i-1xzy;
	Wed, 14 May 2025 15:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=g4Itdut8mRNhSCydg08H9xwyeX
	HrO915hAMoYhShCOabyVkDoM30ztfZNgEUrIO0OYa12C6/ssIstVn5Mzivy9XyXhBhXp4CpvC6Xkh
	xk4vmr559MrlJU8EKgQxeRxSJrKYIBmlV6mZFn5VGOt00hGuRW8blWrAF2LWUzFFuAgO/hsG5W3/C
	OkIBafsYv3VurWLjtZULehw8gv07UerARiQGbzMy+4/6LFmRLYO7ydxq6UbUuaEWTxw75NiCMJ5+b
	5opDYwbfPnbEEzqXibxGV6+JaavtpKWtvl2umd6Me0IOd+dw4XqLoKV02UywA+1ILsu5g2pZTFAVV
	u/od+wJg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFDi9-0006vE-Uo; Wed, 14 May 2025 17:07:58 +0200
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
Subject: [PATCH v4 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
Date: Wed, 14 May 2025 17:07:44 +0200
Message-ID: <20250514150745.2437804-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514150745.2437804-1-heiko@sntech.de>
References: <20250514150745.2437804-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_160758_624377_E3AC1E91 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

PP1516 are Touchscreen devices built around the PX30 SoC and companion
devices to PX30-Cobra, again with multiple display options.

The devices feature an EMMC, OTG port and a 720x1280 display with a
touchscreen and camera

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6435c724e682..58af37b4d6b8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1119,6 +1119,14 @@ properties:
           - const: tsd,px30-cobra
           - const: rockchip,px30
 
+      - description: Theobroma Systems PX30-PP1516
+        items:
+          - enum:
+              - tsd,px30-pp1516-ltk050h3146w-a2
+              - tsd,px30-pp1516-ltk050h3148w
+          - const: tsd,px30-pp1516
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2


