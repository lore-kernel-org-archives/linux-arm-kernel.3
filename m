Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A940C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=; b=aAnj5ZW05AKux4X6L3SZ+77SWr
	wZvd28iXZmLf33SyBdCl/if+dk7IYinj3T3fWw6yOvlfxhqvfpdKedV1c1qmQmBUX6qjv0aj9t3zX
	VJL5oH1W86UMGJIdCXvaVoDJPuYw07lE/O2AF7LXehnDDxSHjbDSJe7VVVOpv/r/lCvFYnzyGaQsn
	9JYd29dDTmFgHvMgNL1RbxWtRHaRhPrDcW5ZOv+IOT4gRzNp6HVAVb/FhhHuUOtqLBpKnYs4tn9g0
	IWr0YjhqVj0vqlEABGLHEVypIr5rUQ8b4WCUWbEdT9BqlkPLtOkYvatzjv8OA9GT7vrEt2+m6MHqg
	PP30u3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNv-00000003JeR-0d0A;
	Fri, 04 Sep 2026 21:23:43 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNp-00000003Jav-1q3L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:23:39 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4b1ba286f6bso1951015b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557016; x=1789161816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=hZzDFCEs2+Xbaco9WepFctFmQvXVLnTPBAy1/dbjRwhLKjL5h14Hyw7Z2wEy989DJB
         8zlfYsRX2nDmwb8NlIBIexuNdM8Axx+sziymyspIIAqj7j4vH/9aDttoGC8SP31uFR4U
         I7bSd0sFsogCU0ZDa/8WPSK1KWH/pQYIy9O2+QLqJ9N/kGzb/HxRT7g8Tw7uUHL6T+mF
         z+OxVvTXberv9fW6aOJvDvVO8fYW7z98f9amBTPwGzLY90Hx5DcQx1abHOTv1kPsHKP5
         E92cMI5e6TP1G62sdQNr0COgqxdZ9zakhYUBQtKqBUausm/xJ8D4x5OUTLUnbjcVrHqP
         Wtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557016; x=1789161816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=L0mVETjwKBK0IATPHDyvUgtLdsenQAdHbvacxe+lPJFmyT0dBmH9eRYlF4PX1eRWJT
         0Sqb3O9SvbZpVdH4Eivh8XUZTPFGyYZqZwjoJ0ojbCO2JJVrpuzIy1ZujS2frGvoET2z
         s7taw0JhCX1e3L1vpbZEeyd8pBue1JrjQM3CIyXOFUaZe8RVcfXUj/ACdCXzpvK4PKx7
         kq4plsVkQnwxxc4fmmNr1axxrhZ+Zng+M9OBaUMne4SgeuwkWg4z+R2/H9AerXie9F7I
         P/d5tvghFlFYMN4rQWSydwjUKK9Eq4hfaT+JKq/JjlpQgk3dQx0UOrny4hfMqRhliblZ
         KbPQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4SX5OLDBnzI5rVEH/XTWdMVFE209vt7z7J34+JulteJ0tpLYtRfVnNQaIOXlB23ms8bnvujnVouNj2DihbuXy@lists.infradead.org
X-Gm-Message-State: AFuF++kiOj9TJwuwS4kL5vT7zQC2U0bicyAOKm+G5SW7heJZTpY+6GOb
	5X+P1kqtA14eTc2+yj81X5L2P5no+KHeaWEFp8hCz3RDsaNhoqWx4bMiwSUzAw==
X-Gm-Gg: AYBFou1DTuQoFAydlnAPLAln8knKRmR5SsYvty5sbwevIFJHMZ/qHmAJTEge0JGih9i
	UwyQ2uqTTurCCu9TXgngy9ouPn6hmftBkWNj6NGrM8PgM5tfumEm+LwQalAvQw/7SpM/xOdX49q
	MPBkMRG3bpLv8OVIyJaDdZtJgN9FWnj/xHcv12OHRpDp76hj4OOlPo9p8GN48GATUV7mfgEO1mU
	Y5keaCiii7vwvm0/tqIVczabYfVlRKBQG3tOWU1BaXLj/DfNFoGuOtrAcEMo4LH/C17tuA+MMGv
	oACPi132SDgPCm+qJtEHHvJrdq/3LEVbwOtTK26gStzs7Hj1xIn1T6TJLH0c7HB4MZPemxL38FG
	dlol5doOGljGbXgqvMt0JAfIfEhXl9mDLDxLYW4/o5cMZy33IkZPehBif013inJVGtPOwEHSuhR
	/s6k2nFAIJgSxsiJQ9Raslxgv/tBxccP5Oa0Qnsg3XEgZoNqt1iyGsNwyRkQ9KAXt11nfLJzWkQ
	XGZexyObgjb1+FQ3rQd4NYWNK6iNMfomHwwlfQNCicLeRawBNGfegelF7mDc0XB2zqf1c6rmBCl
	nKjWCEuf2fPM2fDSYVyAUvLbfkMxXoxXSiacLtKPXlD+wee8mRyGsn0WR0O3J35ttjoMJ0DMXA/
	+KI8S9IBpl2l0KGMyIU0=
X-Received: by 2002:a05:6820:1521:b0:6b5:ec3f:4983 with SMTP id 006d021491bc7-6b71ff594bfmr2962915eaf.30.1788557016267;
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:11 -0600
Subject: [PATCH v2 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-1-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_142337_485222_B9FCE31D 
X-CRM114-Status: GOOD (  13.22  )
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


