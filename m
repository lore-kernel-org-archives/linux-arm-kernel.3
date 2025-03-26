Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E8AC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAi2z0HFAw6yQz/HIvwLQqMf3Ner8YYOCdSxAbTT0TY=; b=FjKWzLdDnU/333KSB9cMgTcciB
	0AlVBsy61KeKX15NsTpt3NAg1Gg7Z6SOTJPyo+8/q1tU/7OF0nuL/1OLfFC4L5U1CczR3tN6Uwq0W
	7VfCicNZec8Ku34/jP8xIp1yj2iu8FiTAuNVGjrs1IBN5YQtXZm9A0DqfJE6zEV2rbBky83hktaFf
	zjoER53Olcwlohqe1Qr6LBTuEGjn0ezCAXYIhnW43KT2p5nhKXXLuPjym7kNTZc9L87WfV2xL+zmK
	F0njBpDdwViTB1GNvcYfeDmFqlLca++4dpfsEdOOwXl7roLG7F5ysuKYmGzhdt7L72tZ45MhEsMsE
	v8UNe7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS5M-00000008kXy-3Q4W;
	Wed, 26 Mar 2025 14:50:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvH-00000008iSO-37zJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so62906015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000002; x=1743604802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAi2z0HFAw6yQz/HIvwLQqMf3Ner8YYOCdSxAbTT0TY=;
        b=fdAgEE7dqyNYXm8NbD3uhxyjyxAcQ3Q1TIUcZt98Ebot0ITizulMv4lsTVIcSgZKf2
         HBCXoZyEZs2WCL2Q6KOd4TqxOcW6q7w/CuH2NG0iFO7Q12DaEXd8WaLfl+C3sKh+i6vA
         lptAVYRXNeUQkO21dkJe/arrjustb8sWIwDWlDEXYZEjNh9AzJRJcGIrGtunIxg8E06l
         laV+0XID9Tfpfd8Rf+xOfshwzLNd9Ha6exxS28+gH/zjWOWZdkXv1tW9/xjdAunlKVWT
         A7MJ9S58/5IZGZxdXLv8eyhbaMsDGDNe66pxJp0D3xMgNzUSSL+O/tVpAk1zPRsoJpw0
         iwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000002; x=1743604802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAi2z0HFAw6yQz/HIvwLQqMf3Ner8YYOCdSxAbTT0TY=;
        b=c+00r4hTKlltB3MKxeKBxSS1lk144xtVY4IuqTSjqq79q2oIU+nwKkl/jRBQlSD0R/
         cJzgfU8i1nJIDwaHUciEhjEFZgHwmBpii3JAio2FJCp9fi41H6hx2R24sOUOyHI9hAIw
         0w0OWYM1dLUCL2ZWg4ZVpDhla9omy7sOwAtPCqzX1Ypf9/PcP5ndbjo4wbNw2V/1dSGH
         j3LxAVWPeMlWf8HrlNXprfP4TB6EwpCKFpY9IbQJ8pQ7BxKMv+D+En7Aq9MI31OzQIXY
         ZqztSlF8Oq19RKTRNMpi/g4oKAo4N/vyAkHR9ymayKdi8In95/0pgv7YCALZmKSfBeSI
         lkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTmL1WPepT/CsrmInNaxIO14xyKFevAbgWhto4YP5qX+GyLFSKSehNSxC7GoXskvvYUZ8x3eyCe70PZVV7xRgT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5qpoyqclvVv2rhoPirYK6XTM9TAfhJDify1Nk2e8IR30ZtVQX
	A3oSLFsrzoqbgP4I9jDn4H+7pdvykAbKEVjerHFgzUjaqtzS1Juj
X-Gm-Gg: ASbGncsvBtT0SpvE8hvL8Bi4nyHBKf9PLSOB4ivzHHYuOQISaF7ahRO5z/Jo5l+Dzft
	mm4eJ6SMOHdq8uGzhfRv32IfhfmrnFmTzXPwjKsRN1EWTM16eOiuuFf71fMpuD25FuGO6EqGdf4
	qQwy5LOKbA8QOIoEmQkuD/NCTPUJk2EQfjo6ca/eTdVkdzyDdbE2C6N1KRU5nH5czN0KAEmu5mW
	wMMagebqbovIfUZ5xHfcCHfWpd9GRIFtnilT8y49tB04DlmJpxGtDBrHXJ+tDyESBYXsBmwzIaX
	6WNVN7/sf9EMkQ6FQijM8hbQlUx33zikuq36qow/w7kEVYXzGKrE9x09fZ/3SVlmnbKDHkqkEwz
	g24I=
X-Google-Smtp-Source: AGHT+IFZ6nLqJWKZ14xhUWYOlK3y85b3j/TwiAL0mkfZ4vDmpuUVradIQ80XoUndBnn5voQ7NeEBmQ==
X-Received: by 2002:a5d:6da9:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-3997f93643dmr19265750f8f.43.1743000002228;
        Wed, 26 Mar 2025 07:40:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/15] dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:34 +0000
Message-ID: <20250326143945.82142-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074003_784982_DA25A739 
X-CRM114-Status: GOOD (  11.24  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the RZ/V2N (R9A09G056) variant to the existing RZ/V2H(P) System
Controller (SYS) binding, as both IPs are very similar.

However, they have different SoC IDs, and the RZ/V2N does not have
PCIE1 configuration registers, unlike the RZ/V2H(P) SYS IP. To handle
these differences, introduce a new compatible string
`renesas,r9a09g056-sys`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
index e0f7503a9f35..c41dcaea568a 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - renesas,r9a09g047-sys # RZ/G3E
+          - renesas,r9a09g056-sys # RZ/V2N
           - renesas,r9a09g057-sys # RZ/V2H
 
   reg:
-- 
2.49.0


