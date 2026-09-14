Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B7AC88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=; b=op/qRgaXu9W3Fn8EwjN5JOc8tm
	Keu5pMxNtfslOTNKB9T6va44bKQt3MyquTLi82gLYMLnuyLbDRaNVmzmPjuaIx1bUaL1QIuxfQGtC
	Bpl+9xSDRRqYbUDrM2gz4RrrLYbjRnx4Y9v02fCt7FQF9ycee3RNc08p9U1QifsKUreQSfZy/u3S+
	4+SfFEAquC/i1QvUde5j8ajAUpib+fpR0tuhfL6mZUvDIRMoudwIRQgOsp3uh8GtODWmWpHtidY/5
	FsKLnFkW4dPspwUIw5jP8/QMEnD2B1CUELxn0UgTQhMGC4gkUPEtMvRrRucXob8khZd15MowSr9eJ
	KQEpZ6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxU-00000002DPw-4Buc;
	Mon, 14 Sep 2026 03:02:17 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxA-00000002Cqb-2Thv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:01 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-801a8bf8112so338830a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354916; x=1789959716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=eUopBvFRfwiATU8ZaIfDCAgUAL25Pn1ejr4/cnkg9q8KFLmofdEtXGaVtzEPvUwl+i
         rnyD7qMjUFyujIDT9DbkHZw6Y5wwszd9Yo/8lJS882gDjCsbnOIP5PUXAigUT7To4HfA
         I+Bqy4sopknqJ3Tz65G5QYolwu7oEUyYil2xU2eWYsNDKW7P1J120nTADyYxWogPlAGj
         sA3Y22Ux3Yg/R6NQBPLUsEvga29v6r1yz16Dome1ZHwlBPgI2qOnr7WJLwdG7FcB/X4I
         7870YbaqHxcwZiu+NyMqe1Go9qlH/fqMf6p0Wa5UP8PT8klGWFy9/5yA6xDi8yN9Da+Q
         pbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354916; x=1789959716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=fbQoQnnVACRb2/pmgtbMUi3AC9TqiWqW4iUFL8LWTLcVNb7OkT64cfbthP65mCQiOf
         uL7FVAYmZn6c85RXA01BD9nTy2f5JnyO5r1DevECq9hfYBVs5HJLX3k5rYOge/P2iv3i
         N7gGG1J4VO3vOGcIGSQZ5e/6XeEqdCluCb9aRYFzWsb/gTDxbUPVcoMlqBy3vpMnAGGQ
         ncLFP3l8uVSNsx9mWjDdpRJ7wtxBEhAxLTbGamGUJ6Fyv6AJWXAv1Xv5PpDwT6w3p4sc
         mEw/WoVqOkWEcDc292HNxMdb+GATbYHZEK1NGyuKSXCs5nKKw6pxkJjAgYQzeVmd4eI2
         /L+A==
X-Forwarded-Encrypted: i=1; AKwUvBwRc2b7X8ml0SZFAKT2K/IH+7ou97GFB33nj7asvaJLkt8NVf2xgUIgmgdAdcr15cH263YlgmF6GmvyMmgt2Trp@lists.infradead.org
X-Gm-Message-State: AFuF++kOLNz//Zq4o2QEKE19w2DsU8Oi9MHvbMZKz325A6kKJJ1djYtH
	jLBbO/fTwJ8UWlELiE4eBOn7V6A7jDV1EkZKvcj9aQjYsrbWvhU/Pzq5Yjs9gg==
X-Gm-Gg: AYBFou1cEWATYDJnRQkVIjYH2wWsu+G28OqRAaBxFEJJ0X25QQ5L0sd98vTinNvlQtw
	KwkfCy1fcP2l3IP3iEkn37IYPSGS1m+fcSyS7otOco0syknUGDQpz6zAmML/l9D9YLc0dbxexu2
	PF1QKEs/opThhEsSG9XDgNngVgbxCj9M5rseBie892ZnlfiSi8AUSJRJHwV/GphrUjIDyhEdBrd
	M8MZk8VCUR2tPu59jawiGJbcWBmFYhDts7os0HtBNgmDpv3zzNcwbGnRhvGX+/hyZrQQ/XOP6Zp
	D7fWrEWJ72aGG2BEaIr15WaBjJoz5hben1nRRE4fU0jZYFFRpN9zWNNga5ohB0ss16B/L7z2cmj
	7D/bB4gFq8JxiLRU0uE7wRxWzC+hzi+4u/xQlBx1j4f/VGdKbPNJvHDlwQFeQJS0jADAC38mEFE
	OmRGx3Y0HfOg70DsA8Lq8N4aHuLu3UbWsw0GqHSDch1bmpE+vzeRA9amldEX40FnPjWz544wGhX
	dqjpGJ0QxyHHMN4VBjilPOPJRxdYXjamuuQNF1yJP//2M43hjr1ABB3QwWOFRNdjnvlDUCN2+9V
	O+utYa58FsW9jWU0Kv27D5Ci+okNi0fwNP2F8oC4VSnRGKYExIMDFGR86nsUpDj8VkqnVgXgbn3
	0kb6qL3WfJHhQCeXhB4q1MhhO/hiq2BVvmj+ZUi+v
X-Received: by 2002:a05:6830:230f:b0:7fa:ab72:9dfe with SMTP id 46e09a7af769-80899b4c24bmr292105a34.22.1789354915667;
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:18 -0600
Subject: [PATCH v5 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-12-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200156_658296_0178CC07 
X-CRM114-Status: GOOD (  13.09  )
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

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


