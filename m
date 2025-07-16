Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DDAC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=; b=0o8XCzx9RZKpQXZaajof1CgkKU
	WKwS7flh+a16vfvwubicMRRtFlGh9ubhkhJgxEPXV5czY/Pj6lxNDhY1ZNRrDugoTuJF82MEQ6VAH
	fJFvCxRhNWdMlkSxRrCSYRJY4tRZEbPbdMIaU416YHKm0VE88v4GBUqJ54efKN5J+kKzuJtewrace
	yga+lmSlVQgzRv4PNDgjAK3SwvtzIqM1v+Tr7vsc/e+Fj4Vbgj+hBDuVYos6nwBKnLoUlCK4jnrwW
	JUQVIvrJaghOCNqaosIf3aFWUqvALTXhyBE4Yor33zPaOCgmVyqqisp1FvL50ilqu2Vqjdyocrp6S
	+2WcL5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc85N-00000008XdW-0oOF;
	Wed, 16 Jul 2025 19:46:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qn-00000008Un1-2TN2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0de1c378fso27967066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694292; x=1753299092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=e7QzI2gMtbP0dpw8QUDqu1Vz/Fp1kgRtMzlHuMmWc8x0Q6MYeP9JkEPyiLLUZpynev
         sDkRXn6pUiqD4PSNAwJauWTzPhX+sldn3QB3LIv46p1OQZ80otMEMWhnT9noV1S/xX0Q
         CNwD/HuSZ7uNGiGtoeWLTxmw6OEojkiIgMQDvQVz7S28RdsbhcQ+FF7i06080ANM+x+x
         aR7ZokG3KrdsZ2aJyn1xCQoG4QK+F0cugypnSz961FSSb9YCRNYgCaiR5sgHsXy5DpMJ
         qrNtYp0zea2H/Mar9VzrT529wsQx+0OibOyi1EUjgyNbkZKFRBLcAC4rJ+W1qhI252Tl
         AmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694292; x=1753299092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=DYjshgmGy7wYqBY3d//Sd3gOlwxpiLqR+DojDFOetpIqyqrrTUEneX6Oo2nEAjcFQ4
         ZfTI50a9eQr8bZ7GQjiM3Oc0cb/t0FxaAgMrHejTaV2criYJV5vHqitR+tKugnAEVYsu
         XMW1eJ9O2h4e9UgO9R5/K4Gt1FWQF749IPZbl/hat/rwCLMpde9ULqoxHARmBfa5I9Fc
         rLfnJu19BeV8s1MJnYpUwMEpgP0diQBWAS4/mq7Fq4fxDWUzsYOHbQaToiUJGad8eST6
         dDJsl3Xweow3cDgrbpV2S2jPc0UEo8+xqm42Nthmbc/YgaQFO0TWr4YBqkY5OXAO1NL9
         D7hw==
X-Forwarded-Encrypted: i=1; AJvYcCVNAFWa5ECrKRK0DzjAAe7cYg2klqRYHckJkD4mbC4wgF43lpRVKb8+yWnd7On2aSc6oBT/OO7icCNk1TDKLA6L@lists.infradead.org
X-Gm-Message-State: AOJu0YwhjMDaonlpAJuEUNKAJVAvDeEw11vmPuEk135CMslr0Sdh2eny
	yrfREEy01FBcvR2ln8cPgoScKYs/QWDxN1MufauQkF241BdX3bq66hA7
X-Gm-Gg: ASbGncu6eSBDmHBwwluvc+YT2G5D29Hg7xdjDe1mnn3jE9AB99FNQiiL8Rwo2Ryh+Gn
	9J+Qohhzw59go80GZOuvxyDAsF8e2LChqJwpb0TkVI5YYa5wMoRhVm46aH9889Xff5iGfNe/e+c
	nc3z3QStkVXoVyUNYlAktmfiJxPSRdCtVG32WfuwjfFDuJOt2mCANMIlZeDG4y5pmUYJi0uaEhW
	z4cqB0SNKWkjcZKnIIIaelYC8T6we75rdkaV9Be/ke1MXTecGBJKy/5gC+E57O5oqgkOHMBmHwD
	p5usAxwXtD9LGfG1PKGl6vyHwT59yLcA5cDklyR7bph42ft7UzwYWAYeXOm0Q94Ktmm9F02x4jy
	S4yMyi14nH2JZt/hePTEsC7D0ioe/EG0HRI4=
X-Google-Smtp-Source: AGHT+IEZMD5Zc3OOnACa7/C5CBcH3nlthXXafeTAcO25bIUK50cADPzmkF5lGfh1XauxfD+fLFBGwQ==
X-Received: by 2002:a17:907:3f22:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae9cde0032fmr402005466b.16.1752694291809;
        Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed, 16 Jul 2025 22:30:50 +0300
Message-ID: <20250716193111.942217-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123133_632022_5DFF298E 
X-CRM114-Status: GOOD (  11.39  )
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f52..78ecbab8205a5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.1


