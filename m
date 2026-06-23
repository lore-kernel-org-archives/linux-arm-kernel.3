Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D0CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=; b=qx6KcGQgwnIccn6pYR6AkoUsG6
	VTbxg/2Pokdd62ebUHIKfayTDFA5UpmepJ3FRjb/nW1Wo9mqqwpvE4SeLOtnL1UZxrZ+lsuUZOgtW
	72xqwslTjBJA86WfSHTTqopclAHE/Bfyt5gCJZwt+j8ScbeLxvUppPAU7di+hY/P1QUoK6a4D81xD
	ZJBrID9lFQvSt6oUYDtHPnIfv+2NHXExzmcEmFH1YZcD2G4ySzF/qyV2CdjZc0oFhMSSh/xKb1yAi
	BPuef3BbRBqfRZ7oweqywLoMTqhRqbmNgStThMx+GViEj8a/PO8Cq4bLHHw/D3YTKKEHJ373cT0Vy
	tyC13WHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28J-00000006RRH-3k5V;
	Tue, 23 Jun 2026 14:29:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28C-00000006RPh-25A2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:29:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4924593f45dso40675925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224978; x=1782829778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=;
        b=bqqlPEMOh3zjoExgyQQj85aiiWfVUgtuCgFJBcr0lXmWIO4VEMvxUM5XmYujZMjTAa
         YIYdEQNL1ua5U6b5CLbiRQDoPjBFbv1LC5bx0X7wkuq0aklg/fJyLiDwX2/QOYR6ZZco
         voFxCpr3qSPkytGcoh6XC/lXFKaWWEVYgI0DzbVxjlK9OCv6mOjF2NC8O6ZXi1NjZ8nZ
         19EJTxWMJbGNfbVU4MD+odbsVLAmb9NxkbjruaslYI8oM/DJdyprQ5cwp9LA5sKuDiPO
         3FuV3Om/fhdAHVTQiWzjXgmab+10I9TpFrPRZ7+747F1vwLtNZmN5sWLmE9bsEPy8aAR
         kE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224978; x=1782829778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=;
        b=bGEtB4cQWUq0mmbw9pmv1DmYxobu3P6JrRfNMb51o9GsSf8g/bfiYPDpnky/GoxuIi
         Ys5K3/VO9Y15CRqUVVY9Qn+zVu2Z4/c7H233y+eAV7WsmTVIUv46gEbFS3q3eXUtqmTe
         MYb4DvYqcUPe11qC4lirofpAzEpAQCGpIkfYdFd6g71S4rnQ518bqdZXDkZw8QuHlwM8
         5RVAfht9FJ9mWQxA6J5nB25hkfNoklkbwZ3+DsRKXE3B/HIH5j/DseoCv7q4ZjuJ5chv
         nkOr9QVtgZtgyBH3klxigULr69pf5tPbqjy/+qER2E9lQDWhr59cpYSOT2HXYoa3bBup
         dhyg==
X-Forwarded-Encrypted: i=1; AFNElJ8uYg44ZhrJibnj53lkVq2LpOSUp639cfutizxbQHZ7FItFRMsOR6a1zDRTz+qsv3QLhfab9YfOIg+LyftuUYmA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnuu0Zk2Zg5UhJE31mfhwUdGpxpnbrsNNxbqndD8/imPUwoaA0
	3wgpbYVHQJPZVKgKw174rbIbHPwYpQqn6j9N3X3oNqaaLrJlFd5bUQYMSJ8SdKm74hcKbR57XgW
	utUbe5F0=
X-Gm-Gg: AfdE7cnE5wPqEwmi1UlqvJeidRvhNzGE0veggYiJ/ToAx58HoUe7ro5fQno3rDETR5S
	VW2K6U2Pp3LL6WVHc88kgGkgi8ejBvcb8oo9K0SsE/FDZFk/b7xuLF5/d4foEYD8LVxeNYmSTv6
	yeL1kdbwaIurS3TppZrg6M8Z9kysYEIqitUxn5I6ZmH1qWlfx5XWqXIoTyyR3EId3uSnbApUjYP
	/zqYtQCCC21s3+bMh8bNRaTvQ7WCEKFi2UfCi3R6E3PItk/zT7Lfyv2WwrVC65OSEurR4tLsDAM
	30twWcPPAWtXlvR+a0z9hqQ0qEadsAei7uHKMzxa0msoSzaLrxn5NU3vZR1Ys+eHy4X8niQTrVD
	7qMaZFdu7+xNbgp+juVoYxtovXWOAVrsiBm9mwiQAOO4s0jBQo90/jglVVCNKuanbTWpQpiFqko
	nA0xm9M4FOr7rqeZBOkttxKCTAQEHwGdfO8SD15FRctZ3QE8uwMUpw/mNxDvB5VWdtfzLn6OHUQ
	XUrM7ccQWFn0jhRJdeV1MRSXAz0
X-Received: by 2002:a05:600c:8b2c:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-4925b3b1732mr44346605e9.28.1782224978401;
        Tue, 23 Jun 2026 07:29:38 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:37 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add compatible string for ast2600
Date: Tue, 23 Jun 2026 14:25:39 +0000
Message-ID: <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072940_576517_65B29EB4 
X-CRM114-Status: GOOD (  11.12  )
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

The ast2600 was using the ast2500 vuart compatible string.
This change makes it possible to have ast2600-specific properties.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..3cbd0f532e15 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -23,7 +23,9 @@ allOf:
     then:
       properties:
         compatible:
-          const: aspeed,ast2500-vuart
+          anyOf:
+            - const: aspeed,ast2500-vuart
+            - const: aspeed,ast2600-vuart
   - if:
       properties:
         compatible:
@@ -287,17 +289,19 @@ properties:
   aspeed,sirq-polarity-sense:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
-      Phandle to aspeed,ast2500-scu compatible syscon alongside register
-      offset and bit number to identify how the SIRQ polarity should be
-      configured. One possible data source is the LPC/eSPI mode bit. Only
-      applicable to aspeed,ast2500-vuart.
+      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible syscon
+      alongside register offset and bit number to identify how the SIRQ
+      polarity should be configured. One possible data source is the LPC/eSPI
+      mode bit. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
     deprecated: true
 
   aspeed,lpc-io-reg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
     description: |
-      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+      The VUART LPC address. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
 
   aspeed,lpc-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -305,8 +309,8 @@ properties:
     maxItems: 2
     description: |
       A 2-cell property describing the VUART SIRQ number and SIRQ
-      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
-      applicable to aspeed,ast2500-vuart.
+      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
+      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
 
 required:
   - reg
-- 
2.54.0


