Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1884C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=; b=y805FK9RxeJ03J0mkFAeQPWaxm
	8rfSjUpTq7fwg/oHytmbOZ4KhUcGXj2M+TNFYdtW+YchGEoqCtwh5oNvRIiee1AhF4PkXPpZ76BTI
	Fdy061efuYAjqM6qEfxt2E9/Ke4crCn0OP0vgPSe0VWgNTnDDyFjf+hAdKzGrwsIWXDKkjAid9eKi
	+xUCBaWGO0BR3Xf7bgYjFSaUvivYvoLFHqKFmorQJi1r301mPvVM4RSSTyv9V8sNOrN/b9m9PzGZK
	PcJqWb/ODcwEf3wOZNZcjsFjf5TPBRYRFWyBXqnAXxu1VT3fHOv/pCRGpE1HxtHiuBVRMjyCEjEQ1
	PFJu6HqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3L-0000000D0J0-2eI2;
	Mon, 10 Aug 2026 23:05:07 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3I-0000000D0GQ-16QS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 23:05:05 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7ee125ec926so197574a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403103; x=1787007903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=U33dNvLqUopn/SKEsYRRhfSYInHXKw3OoIGDgd+9Ubvnq0YrAkNXkirj77v++9ao20
         rC5tkW4v9ePzKwjXLBSvNhmNgAI6SQbJMoAPnQaXcMGVMrOEZi9ifmPb+FSdDYR0JwLy
         3wKlNZfFc0uCWbbFxhLdpoaU7wRD4glr9m2jQ5rnyVlyhy8riANLq7PNRzvCXQW7/ErK
         4KbMuaNMXuH9EIETW3TKrbp72Y0K1OIRdsN8BbWFn124LTMmSV1fUow+Fbzx9WFaMaIe
         rXyzu6q+Q3UcJTSCxovboqh+ziuek3saMv06JwOtkoxn6pEpDk8uKlZFM/kt8eqK3KgA
         auSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403103; x=1787007903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=BhXl0y7qK3qJAtz2x9ZNsIzkAxy9/r/CtdP2I8vCWwIyWGEKh7R7/eCOs8CGufb4v3
         dAzdOI6VL58XfWdQ/d3sfKSD6hf8fo33M0VQw0JCoh0LGLtiDdhvOm2BJRd2orrBhLDh
         g69D+HUe/ZRs3F3StM375gKyxEwzGC7iyYZrYZc+oyC+Rp6vyRusCRYSQexZ7P1R9ATb
         GfIhNZJKxWY/7MC8PXjI68XTn9d7rIrUrRsbiurMNI1dydUZMcybnqkdPfZBXH79HvDL
         fhWagx+jLdhm3uUqoo/x/JHQ9jWOElwcOoNvJVwgt+LDgvTt+sctJ8wc3SpIi/iE4dAl
         0PQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpADMVuldG01ODt863Dv7WvmXHHoEKEZ3yptYFqezpIk8bivFnMq5KfJ2quzhhyvq1aVq8UtpHQQ2fpyaxkwVV@lists.infradead.org
X-Gm-Message-State: AOJu0YziJRsWLx4gR4YmA/TkG4dURHNotRrjS6K0y0TaL2YJiuIbFztx
	UFTd7VT9KRhKYoEf1JxIj3SjFhJnduXtkcikOBxj4kjhHtLyDhn4PXzp
X-Gm-Gg: AR+sD10CSWBgwnaJauAC1xuA4P9rNIe9Eta6WRjNg5Yy94uu9I3XQCddjjQayPKsHVR
	fmlNp4vJlM74H5ytKdc/nv4iDVg/pmdaazBU+MzKNe1n8w12XVUyw4ZfPoRIh/BhQSzGCej3gOx
	lU951k2GwFh5MgyMybyBwybXo6y1K5bTUyGwWw7yDPbTJnH5keq7dPRXPHD+pHiz6M9A28jQ15h
	PdgSIJmNpkjw//qvMTySRNmVeeTi8PfWfIkNM3ch4yyHqg18MpVsdWxCEfwDWtkLfiEfkMCg7PK
	0ne0KGwOw5r9Qhhrwkgo5cKKs/B1GS4wpBMA3KF29TwH2xv9axh0kQqxT8r3QStJP04FhvI8zuK
	LvJEtZX6any+Je85d/hxoM/GQtRW4RAs8djE/FVX2B4R7c7mlk9JHvcJHdoNluwjMGXuD4IfbZf
	Ry2+sQxZnLyYI/EOLhHBRHmBqUvw5eum5delMt19oigLSOSGGVMXuKOY3lrpvhDGUn0pXbc4Gu1
	LMqQKdBKmHOWMFTwSK/CCd41SSVtDYCGgPlIernWf40tiebdqwUqtmxA15T9zfoOukBYdNQ3ve9
	X6YCoaCRPgow4KgAyM92xU6hc+7amL4ly7qwuQ6IWMDSrHPL/myOoCmBrIdP97k+22qI424uI+j
	b1GjobOiEV5ryh444
X-Received: by 2002:a05:6830:4414:b0:7dc:d967:63de with SMTP id 46e09a7af769-7f1e5c98e5cmr32808491a34.3.1786403102967;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:49 -0600
Subject: [PATCH 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-1-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
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
X-CRM114-CacheID: sfid-20260810_160504_336742_0E475180 
X-CRM114-Status: GOOD (  12.84  )
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
opt-in property for NAND using the randomized normal-page OOB format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..7eda1275135d 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,15 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Use the Allwinner randomized normal-page OOB format. This enables
+          the controller page randomizer, stores the bad block marker through
+          it instead of compensating the marker so that it remains plain on
+          flash, and selects the controller-specific protected user-data
+          placement used by Allwinner NAND firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


