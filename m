Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487F2C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=; b=S76LegDCigCjPCxmWYwjIcEjUK
	Kp3isDtrPeZiYhQDwyX+FB5mezB1kW2Lb29GN1bNngwvsfR3Vc9XoMuVh/Pt7mcnjeGkbZlm24wqe
	+UgpwYpYIFhkdATp8ZRJE+U88cWWAFvqZpDYIthG0XW9quX9fqzff9fW8l8JBJ59wS6ysGhbc6AGj
	zbfRKG3VNxOztBj61njp3UJqJox8dcZtyTxWL10TefKrKjczCJvGJuvTCcTrRKFYRgYTSgrNu20Mp
	Q+Co/usBVDeEvUljpSjrkiF+V9a2nkLGLLcLUhdPvSq5R3Io1vfiS0iCJcwqaothDHmEygx7Fflgn
	fJGmT6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dil-0000000B73J-3B7Z;
	Wed, 09 Sep 2026 08:31:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Di7-0000000B6VK-29RT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=; b=BMxg8o3HdkfkkgWgGtMIa2+yd2
	bZBvmCtIi1qJhH/lo51y7PNyoE/wvUfvgDqdK/fwCGZwgSwYhZdaL0I9XCSr1j4jGHLzW64ipvo3M
	bDjEHRRQGA2KXrrdKcynoTSclOmfWFimMZh2KFvoYkgL7ao8/SYW5G/ULV8j1cvMfgNODaMBRoVYh
	0d3vL27WsxsIvCwuZ3bMuJC99XQJsyHLDg1C5hdY2TlrSsIpEjkYaSVk36HJMuVlrZ8BcVufLCUXh
	3gSZr3iWuc26ZdFI+wJWElVYZPGbnJnkL9u8acwt1MLYsnM+7bg5LijpQgseJX65egq2iTdGNOFkH
	fZrdvinA==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Dhz-00000000ulf-3qBl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:10 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6b1a0d75a4fso3248462eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942666; x=1789547466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=Y1S93XEK6pEPlaEPCLDDhuYaab+YEG5Le0RcbHb+6LnmNw48oVKnU81QtT2OM0/VEu
         V/1F3n/qWeB/UNJJDW8Gx8ULOEenAxjFFkCqKUkxtD9PgH6pRhBaNYmYA8gaxaZypiUe
         U4FjdwSKyrd07Ouydv6lR8AmQa9E89j6zND0zYwhHfVGLme/TesuljFkWIeullYkrX5C
         CwkJ6/tuMyQJBjp2WhWrIJdNa0sN2Jse3Z3Ij2LEJHAuzwdfZJK/k4g3ZeN1kmlq7+Wj
         DLpGdJOruukoiYfiJg/mZhoWB1k0v3B8329hcETHRrWGzAp9f/Z/N6Yz1ErdHPkVTw/r
         aMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942666; x=1789547466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=ApY1FBuhwNxjqbes/moQ7s0h57/dJl9lwddAtVt8/Ecl4MuywI1Z0M2xJR1eZq9Kh/
         KT5k1GVmeHosuAC87TJgL/WLqWMLeSnLaKEELII5oWqoJJlxskicEt18LEAjoxNTftGH
         4I2SqAh/PPxHvrhtYSkVkdHDfFxYzrAXSFgeXXHPIKnPj/SIAVtP7itFTRA8ugvXfULW
         47F4ahgb3pyxT4ve5CAqbtNY68j0pOr0AmemrK6ndFWW4NliyZ3S1KqqgfTG2MpR3wHa
         h9PadBZJsClmGBsx0f/gZpNDC8GTJcoF4nx8mWZVuGG/ekp0o80XlAEKi+bRMo0TdWO1
         PLhg==
X-Forwarded-Encrypted: i=1; AKwUvBxH0ZTbM9fkRPEpxHtsMjFJEr6eaRy/WuYkFCr6QpzRPzVtj+NiMscSLSjUDiZdGu4j7NWzRfG4Se3iLAMPYsJ1@lists.infradead.org
X-Gm-Message-State: AFuF++kgTsYwZF9LJDn2e/06Pw4opJ6PrcWr6dDoa/QUt1hO7w1wM6ZW
	jTLz4Hh5AFw3MQITgt2vybN9l/hfFmfCGJ+wCWzsHYQ0p2eh6391g3sz
X-Gm-Gg: AYBFou0fyGKirrh2jy0TOPKopQsKdUnU510evKhYj3L4iHYdhYcLkhIm1MK+O2kYSg4
	EobWcbs5Ssvf4KGxd823oD+8V+bfjV5oH4up7thFAAkMOOaMAEikdwx6/tqgIQrHdk55J9aJAYY
	r9bKoa+y6QP+ruVJ6udQfOx0XfRwc4ZgjQEoWIlN7FvoqAk2KMolZI+ULN+kASS2v27LBKoy4hp
	+6nhSf+poTPT5GIW5UnJy4jN1KNGZ+x1MWpxoRKlGSSieSpbi0ALXZpuf3+iivU+6moD7n7Bhba
	8c6vi/3hPdeyQGnHqh4+ENSTUuruQQP4o4Jsn99SzJnmMfoSia5sq5hAZZUXzoCQPQBqnW+OfTn
	Nm4QAyDF43xZRfWjr88jsOwTtxc0DiZJ19ZHywjie98olOLDZ8tzC8tJwA0fDrE4fGzMkkBpCkI
	oBShflaCIe7EPz1+ofhSNfkqed6lXIfLnlZ+qTytnbi13tFUO1kgNBRsR5k1eZ5RtCWMyVplHBy
	qutp/7A5lC+TH05/dBRqqlBRCJJ7CmVLlU/DoZ8r590462B7xVYh1bbwsf5t189842UBfbFgvSZ
	tAzPfUOqNjsO7gcj2qJRoBe75lTur78+eOUn+p7HHRoY9vqtCurqLe6nGnNOuG7wS2s5REPmoHf
	JTq1Y13m7SUN0+Jxm23y0MRY6hP5w
X-Received: by 2002:a05:6820:c84:b0:6b1:a0b6:72d9 with SMTP id 006d021491bc7-6b6fd3d694amr18766040eaf.25.1788942665879;
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:42 -0600
Subject: [PATCH v3 09/15] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-9-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093108_796357_B4217885 
X-CRM114-Status: GOOD (  13.32  )
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


