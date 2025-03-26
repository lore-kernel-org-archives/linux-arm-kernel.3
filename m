Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2845C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qo8yUbF4wUa+z6nQkW7SJ0WhcUVRPGZ8Y1rGgvU8CHY=; b=1Ekl32ZLRJStejAPnyrAeFPbR5
	aEvGcerFbRzcnJA/SHb9Lr90o+MCM0Uz9ZuJ0y0oWRqV3c6RiD15B0QehnmcxQY6CO6zveHG09qA2
	CzyCmMqnsC6S0jtmppvedcQ+djOexEVUKXpCaCGcmXLsPKPBJlcTOthUTyRE802pFGjwryVHGOs3c
	BLu+JB/7dlyXb5cNycRcHXi6o129rc5zSW7/R3joSj7fEBTW9b3bkC0RQpiieUxkgfvM0cLHop81g
	5wqH3maw/5kaVMQ8RhRwnRmuHlQY2THLgqD4oxYhPG8OQf0TcXOLNUb1UCK7JLJHFqj1vHlFxVk3V
	eSag0llw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS0E-00000008jTV-2pLQ;
	Wed, 26 Mar 2025 14:45:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvE-00000008iQX-2LYs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1730512f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742999999; x=1743604799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo8yUbF4wUa+z6nQkW7SJ0WhcUVRPGZ8Y1rGgvU8CHY=;
        b=WMJ/12Al9T/9Z4YtOTHXJRBLZyYUQChoIAwF9jFuVoEjgp0eIVtKbtKYeslwN9Kb6y
         ncKrfBM0QULpbs4AYNcTqn8db4tpLZBsqDi0gPf4eWvGvgTnANlRcMbHiRDPzyShS4CA
         dWLb4TpFUd74ELt28uY20/+jCwMPhuUAGqm1C5r/ibwpVhCMQw4bx250H0E2sCFv8Dtu
         gw78GXrhr7LHFvr0qqRoBzZNLzLb9SgWdQ0uCeFpNtLkB+eGIRgyNoQUbMFHHwvg43vw
         5H9amCziPGn/5aRtfAIrki/8wT0fBcFHcI9Sw/c1VOGh6jmK6aIHZDzgwX9FExuTCjfJ
         WfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999999; x=1743604799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo8yUbF4wUa+z6nQkW7SJ0WhcUVRPGZ8Y1rGgvU8CHY=;
        b=RqdiR6qRdc7qD135kXHaDS2Fv5TgjSkLBVn7mfm/FynH4rV+8rN1J0ZspTV9YOXIuY
         qo8WWDjFkIK7K+JyF72rasb3bXkTpwql/LIGGH330I2tPxCDIkkGMj2Bn5gq49/voqiJ
         0hpcaQru8Pd1X2HULF3D0+WooL0iFl95NgLJ7SMf4/W3D8B9HJW/APut0UN2r8IhMSGY
         ho0RNA/SvqeoeDk5IxQz/DnVnYuwWsn6zK0h6NNAHgUVkmeq4SQXnFBBLOd6Lcdj+IaN
         Ap9UHF++xQDSukbVy0jI7AI6wEl8gLWiUWGq3vd6ErMyYfUYSaapl6Qb+Ci1PpWLqysQ
         SI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBokBYNaSpY50352aH7dROYYWpW5uZuQxeU2M4NeKu+uXZC4JTwfdpJyZfdaShdq1lTlchaSdvQq+AHNadYoLu@lists.infradead.org
X-Gm-Message-State: AOJu0YyYeO07d4iyTl0FJq/ytRtl+xPfiEmAM5g/uuuu0G2lwqooHI/V
	97Z37nY/ClhEMXvRpU+7BezneQf72/ZQkaBf9DhFyxLN0GN3hJpH
X-Gm-Gg: ASbGncuDhqaQ/i4bdbXIRc1zsW3T4630VKHBnn4u5NHaR2cRpN6g6UWJuzMvIPtWYKF
	6Usz5/b3nTT2R+8zUezBVAr85MyRlZRRVUKw8J5iNBSrjuxFY+p2v6Q8g24p1nPjfzdiCgL19J4
	2oz6SyjUKrvApBrAO/kVebg4ZIlnG/l+F2rwpwj7BGRbe8WLAVs1xGLA3tYChWO+cik14Ylv25y
	GVs3u9jJaV2ybR1t72ncvp7mYCaUMrOMPtbRNaW/u6VLw9yuAZjOQL2/ZPRkZj6JwlQay2Dn6B+
	SXIaTp2yoszMPSvdxdKkccQ7JPSojPZu+i2ZClN6QaR80oC2ZgHmzYXzTRGqjrsPsTH2iqFQiKk
	4dxc=
X-Google-Smtp-Source: AGHT+IE6Rp51RN1LfJrB6Bp9z+UyJ9P34RFiyRNq4eRxazayC6Uni7bHPn19MEPTytWoioXjDEuABQ==
X-Received: by 2002:a05:6000:2d08:b0:391:306f:57e4 with SMTP id ffacd0b85a97d-3997f92dcf5mr11606091f8f.34.1742999998593;
        Wed, 26 Mar 2025 07:39:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:39:57 -0700 (PDT)
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
Subject: [PATCH 01/15] dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
Date: Wed, 26 Mar 2025 14:39:31 +0000
Message-ID: <20250326143945.82142-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074000_602982_364827BA 
X-CRM114-Status: GOOD (  10.71  )
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

Document Renesas RZ/V2N (R9A09G056) SoC variants.

Add compatible strings for different RZ/V2N variants, distinguishing
between configurations with and without specific hardware features
such as GPU, ISP, and cryptographic extensions.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 51a4c48eea6d..3e61ce372a57 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -551,6 +551,19 @@ properties:
               - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
           - const: renesas,r9a09g047
 
+      - description: RZ/V2N (R9A09G056)
+        items:
+          - enum:
+              - renesas,r9a09g056n41 # RZ/V2N
+              - renesas,r9a09g056n42 # RZ/V2N with Mali-G31 support
+              - renesas,r9a09g056n43 # RZ/V2N with Mali-C55 support
+              - renesas,r9a09g056n44 # RZ/V2N with Mali-G31 + Mali-C55 support
+              - renesas,r9a09g056n45 # RZ/V2N with cryptographic extension support
+              - renesas,r9a09g056n46 # RZ/V2N with Mali-G31 + cryptographic extension support
+              - renesas,r9a09g056n47 # RZ/V2N with Mali-C55 + cryptographic extension support
+              - renesas,r9a09g056n48 # RZ/V2N with Mali-G31 + Mali-C55 + cryptographic extension support
+          - const: renesas,r9a09g056
+
       - description: RZ/V2H(P) (R9A09G057)
         items:
           - enum:
-- 
2.49.0


