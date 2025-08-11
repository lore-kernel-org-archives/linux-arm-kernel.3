Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2FECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zhh5zaRs2oIpYFCywf4aV1Gc4V+uvx/WgvPXoTIlm1k=; b=uaCKi4SuVLMJO4jX+D1BBzD10Y
	fijTRHFWtLrC6yJWEgtGD53w4VeRKyMr7tVrl0/dCctBLkCc7/GgjyzoacKWmxBKpOcKuivpfminr
	/mv8e9pNcID9EMpK4xCcoIO9Z2RNZ5fxv3Budgs5VYmXByOT56I/7jFWuNttrsbyyg+3HERPfJpd6
	X54hogGnmpdNugW/rfjqEeqsoBcXGxGPyrMhPgyv5CcohdXLiZYXGuPOl6PlEHp597HXayLVZWzYt
	yHme2TPiL2fm80QOubWWrVmPdl0If4qC0NiZnIznY3Fu3OW7t1pcL9rVbc+IjC1pnT/RhaYlhR5Wk
	mh8yNtWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWin-00000008bke-2YoQ;
	Mon, 11 Aug 2025 17:54:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUHo-00000008APu-00qG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so784902766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925486; x=1755530286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zhh5zaRs2oIpYFCywf4aV1Gc4V+uvx/WgvPXoTIlm1k=;
        b=bSC2ssIDcj3zq82Ocy2pLFrmNYdwoPIlz0WF94Sj6h6haGEY8HDeRS602NBmeNDT4o
         s8W+k8nn+znKbee5moINMTrXa8sKACtJMY5+ecQ/VHwPcfPYoH391wBdrMczb3PDE1ss
         XoD3iLa0l4Cxtl/MojjU/bGa+VlbK9VoPc6LFPnqu7ppIIMD44B8XNN9054V3vnPxKiD
         mUG98GugdW3XqrW/+Lwuzwj6viFszoDN3ijIRjddJBSzOAUNa5wFJGNCKwRIer9upP/t
         MHlEQvu+hNq9rKGT/9eJV+mQTWOZ1eiRUnZUQ92xctfnkTotladImXQK2QrB8Q0mObsc
         Cy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925486; x=1755530286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zhh5zaRs2oIpYFCywf4aV1Gc4V+uvx/WgvPXoTIlm1k=;
        b=MotCzhjDBlrrtDmGpG2m71KI3I4iRL/czk29tAV4Kx0DvHNqv0rEJZKePJpIDKig4X
         P0blRCuuiBtEkJbILrnGx0322dabYBMYNXDNnUnvdGdEpaQ06UXIHAuZP6hcSVoes6sI
         7+pj+CTnpX7mh1PHYVPbVIJ+OAIua5LwJbRjI3qpHkMYggg4+snrlT24PRcAmJVv1WOu
         PYkU9UQhN6SFJPBWCdDBDIt0HCBb/MpxmmTl837GgT4Rlq3IVtpRrVOa+LeeNxNLKb7I
         nccWFF9wV6JQV6a/0jNTLMHxFREWxPzWz3KT5m7orVNwoVa3CenX90qaHlxZ8VGJvc1s
         YvFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzgv8mU2XWgqqr9jFbVyAu60BMZBjeh0qMl25Z0OkU8K7FR3OIuh7C2ta0bDYo1JiA1eqtYsiRVQCuu5BnuC3H@lists.infradead.org
X-Gm-Message-State: AOJu0YwajhHghYIJgMCFNY2BShc08sfYZv3MaYcWvsWMNpA6IPGjawpk
	pcE+3GZcfRnuhacEbPcZb210sIfZfHEdNFWYSbo+AiJXR097SPN3OPCmVBq7+Om2goE=
X-Gm-Gg: ASbGncsjwGx00/coZ5IrTwqKJv3G+Q7iVok2Ztz0FH/lWDQj9n/zB0zWp/19DpXTUdg
	W38RtvP8GTdvA4K3pQBOTHuAfFVNthFbciQkpe3y4EzzBW6+Xt9//9g1BmGunra9qa2UIBvWfwN
	2wTVYPvMci6k/qi6AlbkhwBO5DuAXCJZXkBKs6AKMEM4vQb2naRRhDtsm8FAfSMIuvY0FabeHct
	2I7NbI6mEedXo3RhxNdPa9gHgtnaVEcFeRDfNdP2CliMcXFnKuptSfZo6PYNUyOn/j0a/epDizL
	C/PyWEVnMzVYdjT7MFOASehfkNHe29TZxqe5bJcVfYcbfAv8ECcZwMQRw/zELw0t3I/lMehgIkE
	k4VhcxRbcuZ2k9MxVhUS7qjOcOiw9VKyNYdmN8QZmbmWYWE3GB4NMsE/wpXImKNpEhg==
X-Google-Smtp-Source: AGHT+IGNa3UAEq/Ce3/sswcy3A+j3yXj3Hu9QHzagv2xAwHzDuZRAXkuzsWUlKzyxvuIXzuGjI7OUQ==
X-Received: by 2002:a17:906:9f85:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-af9c6373614mr1374008766b.18.1754925486344;
        Mon, 11 Aug 2025 08:18:06 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07659dsm2020105866b.21.2025.08.11.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 2/6] dt-bindings: serial: Add clock-frequency property as an alternative to clocks
Date: Mon, 11 Aug 2025 17:19:46 +0200
Message-ID: <419658ce1a1009c6f8b7af22a02b278cd695dab0.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081808_045398_EF7074E4 
X-CRM114-Status: GOOD (  12.59  )
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

The UARTA controller on BCM2712 connected to Bluetooth chip does not
mandiatorily ask for a clock connected to the high speed baud generator.
This is, in fact, an optional clock in the driver.

As an alternative, the call to uart_read_port_properties() ensures that
just a simple 'clock-frequency' property can be specified for the clock
value.

Amend the bindings to allow to either specify clocks or clock-frequency.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/serial/brcm,bcm7271-uart.yaml    | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
index 89c462653e2d..96697b1428bd 100644
--- a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
@@ -40,7 +40,15 @@ properties:
           - const: dma_tx
           - const: dma_intr2
 
+  clock-frequency:
+    description:
+      The input clock frequency for the UART, Either this or clocks must be
+      specified.
+
   clocks:
+    description:
+      High speed baud rate clock. Either this or clock-frequency must be
+      specified.
     minItems: 1
 
   clock-names:
@@ -61,11 +69,18 @@ required:
   - compatible
   - reg
   - reg-names
-  - clocks
-  - clock-names
   - interrupts
   - interrupt-names
 
+oneOf:
+  - allOf:
+      - required:
+          - clocks
+      - required:
+          - clock-names
+  - required:
+      - clock-frequency
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.3


