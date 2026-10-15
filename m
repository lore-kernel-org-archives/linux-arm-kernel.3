Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E0CCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=; b=N84/Q0Y8AVHG9mFzSNp8+3w04z
	eMGaF9lUWxE+6Jr4sv6SVT4LHn92x3HVA91OFdnpR4nN++dnDQ7lkmB4D5PQ7DnnAoNq7yA2o+OyG
	rmDuiNgGrPxXakxaV7vWuRxnLJMbHrENBpqMJj3/0q25+WWcxfOP2CYgIRfrnQhIylWUarQ6ybp/F
	MWe6oEt9FUtKiN0rY3Neza594oQ5M2yz7ki0MZJFKrfZXME1I8V91rncQKFXXHPgC/KtafrD9luLt
	MQQqeeCgFCHLUK4orbrW3yaGDgUTtCFnzlw+7UfKN4mhKZ9I7ijywjBF6CcDe3QXPckzSFrQYcj0/
	jsBu6y2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHANK-0000000GZfq-0QmN;
	Thu, 15 Oct 2026 01:35:18 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMi-0000000GYZX-45sN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:43 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6dde81a6820so1183976eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028080; x=1792632880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=eF+y6r1UccFu6xdutg2mJSN5sp1hux1ZWvxSZBmKM5h+rDMiJFTeT0zcli8pC436hO
         w0t0gFWF5pggPWItwtaLqknAPlFABGPB2nQpC0ROtPFinDLo9k0UkypJCCedOXNRGB+2
         0Pb74Ur2F7E//F+O+wzNzhEaUrFsw5u5T27lGhwMIbLXStEVagbrwZnwnDVcJbVEoKnz
         fiEjzAue/yWv/4BF6Y/W/OORhoCbXGJJfyMqBcuhsJ1YrqYkUSdNsZ7FTOgtHWJqkjbJ
         m4JR8yWc39cTTwCiXOc/tlNlJdyKnu0SXxC9KmMA86mUjoBhaOtqUHE6PJ8F1BfaS8mh
         DuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028080; x=1792632880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=kyMY0UUwF9J3Yx1vwkTa2Tu1DGjJ63MbphtsIb61qlix6LqzpDaaSLxhpFznjt4wxa
         188tHWHF2tUsfu7yXyIxjKHa2GBOwfTA/5i+jGLpetKOubOTa4My1d+39wzAMDTHoBmr
         BwPsoAEiZ8AHw/7YTZWHuM1oLYCbh5jM2NoMUdVc4zM0a1RJLoVO5lExBuINW1HZ8QwM
         JAhbjNCdoaNxO6AVTZa33FpcJV5aj4sQ68r1Qn1svnQ0oN4JD2dSod9E35bfYtTjFr7v
         /wgGbVlYFua7L1ZU/abUwNheUdiGlQyKpUjdw3S7SDnaNixqJxcv7o0K/sHdu61Y6kEr
         xp6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhel68Oqfa91VQnIrzviFSx+9p7G1by5yL2y9/HKiszlooPb/Wjqem5kUT2IWlr0QH8aGUhMt/1Xneef/WGlgZ@lists.infradead.org
X-Gm-Message-State: AFq9FYLbYAqJZl72a5qLx64C9lVbGgjIasj/bc+1ySDpc+s5282epEI7
	c+RK/1EMH32rAiU3pHD7CqLGl++NllIDKsWSq0dsjf480fQ1qjlAdL7P
X-Gm-Gg: AYBFou2FVbZkck8huwTUbfyZ5NFFoiJaDYZEnBnvWbUqoibInqGtvUlCMQgw0pB47l5
	rM42PCXhfS1ta287JsLWOqowHFO9fBvlhv4ypJCXYxcA/kEOZWLEMx04dL2H/OTIVrYhpfBHMYJ
	t54iIA/bJgTNn811RzLLamHtWzUiwDN6dPOsShSXSJ1HTjUXlm7ju0rpVzfBdMVaCvmgmbv8rwK
	cxqcwIP91vQhHHfbGFs0v43lCKirguQR6RvcguVjWqjKlOIUZS5lISG0aUEgz85hyeq/XJQk1gD
	ja1grhaZzqCQOpb4ZhQo3M9i/J0bqRCRiYJYxbgncyVGwpVWyTurOICum4WXPWnlGBq5IKPzU42
	JiAVU4Jg0ZgJPXjnGCodcZhMDz06sZwvgcmSmoOm7l6UiD74OZ/A18sYIruCq2ErAQVOm5z6MgF
	H4ee6MU3/iopsSFS+NuSfhWAeyQQtICdhV3Oxf071XeC4+tVRh1jjGcQWWhzjOl2eDfw5kFM9bZ
	SQAmR1Dn+5cXf40ltXhTXbplOX8ne1aH5DOB5PLOOzXG7InMI9jqDL/sUO7wbokc6XY7Pp0zWIs
	cAoHsPtCDRNwFoy9tx/TpBBOYOOjSR/AxEAhLiTg3+NHX//BKvNf9dilzcWncLADM+4BBgkPd26
	baM/J56qkaqKBTZebT1El
X-Received: by 2002:a05:6820:4b0c:b0:6dc:3be3:bb81 with SMTP id 006d021491bc7-6ef10492c39mr14343257eaf.35.1792028079883;
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:02 -0600
Subject: [PATCH v7 15/16] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-15-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_183441_047030_9FA98627 
X-CRM114-Status: GOOD (  13.60  )
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

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


