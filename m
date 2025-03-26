Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1011C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBeXjQIPHX/DPtw6MHzZgLXu1uaUvVTtJA5pM8jD9SU=; b=C8CmcMB45RAPqCNsZV8BFopnAo
	bIhOv+inwN7Ym0uARX+o0LjLT8kAYvw0XBs7fj3E1XS7U0FndzrkvezFUuEgZow2zmm7ckKOJHbvY
	qqmVtG+4C8zwEjyLM1kt1qpzDJQUwmoKzwk8+FH8nN1UzjOtwKYSrFLuT9S2N3ch6XHfEQ0KOI/0n
	hinaHykAFoAQbADrN+BQ6MeeUSNjDvSnUKVHUHs1kj0s0j6+pH14daa1Jqgrebj2u1a8DKD1JcxCm
	PnWEaw6GAl3jOMVAhO0PdyjFYwCeKypcy6w547guAYQ+K2Pz8XtUfN4bDI62s4OK2QiEgychq4zO1
	yHooKTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS8n-00000008lBo-1DIV;
	Wed, 26 Mar 2025 14:54:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvK-00000008iTb-2zQ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3912c09be7dso4615211f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000005; x=1743604805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBeXjQIPHX/DPtw6MHzZgLXu1uaUvVTtJA5pM8jD9SU=;
        b=FhOm/cr5C0bYHG6INn+nZwnIqrcAu+MHn0jEMwiJAcUdoyU3ns8fEsbMRoROLbm4by
         PFPKgd+RV5WX+oXiSyhR5ul5VM74MIsWZSGqRv2rhPrumCYBgo+WAlW5Ww5RVs20lxhh
         onFH2LwHjiZVcmQptZGdV3hqu5Dz3dR+A+UOJiuafUaZBwr1j+tUjk9SdiMFGuktRgXW
         c1Ub4/jqwOiTeqxz+FtpZ3+1zK4dX0TQ3UjsxeLN499hAwjfy5PprmvrR7Gc/r6YP0W2
         zPwxa9OWXZN3MG/G2BkiiO3vb3kbVGd/Yz96qbOYz6OTZhwOMvCX0Z2/iLV6NwwwHWso
         U41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000005; x=1743604805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBeXjQIPHX/DPtw6MHzZgLXu1uaUvVTtJA5pM8jD9SU=;
        b=vJsGJmPIEA5gVfZnm/bqwUJ2RzUe/kvjJRLCo7k2UvWXapSR1fojS57WVhn2jdAB+Y
         UzgTBqhjkpN1NWAkel0vB+guT5y0uEv6gvqDdRYly7/QMukyjeTsyG21TW+79fP0N6hL
         cafWA2Wk+YiZzM/zUWFdg+TXmL5kSruqvsxQuGtNn1MRuo7VNIFWfshrjQnPYLCFR4I1
         fpOoOatsX0rzEk83wkvyED0QJeMqdOhh9jJutFCrNHsH6S+2VfwgqI4Cdc7cHmEAJlMz
         YZN8y8uF+vsh0392v6FXlI398SUwJpK9Sboaw1FP99m8x1rHYvOi69s1w06p3yc52jhT
         NOAw==
X-Forwarded-Encrypted: i=1; AJvYcCXcUamWG8nlnkDoXcvO2v7k/LXD1YRO8ZKDL5yxRTkgki7r/vSNiWiZpxXoUJsGTrpAUFASOm9TUEwNjTYQXqNT@lists.infradead.org
X-Gm-Message-State: AOJu0YznlO68IdkgyrjktYfbdmlOs+0mforuqFfaeWtt/4zTXo/xpZU7
	vC5QLJmwSy5RMNo/EgxnpTCdYLnAfM1XaD03gblwUy2ABKrC8CN1
X-Gm-Gg: ASbGncuZlWNua3JalXTU1NNI/mowYl2c1mraTaoVVATMKMM+zk6B3NzM6wu7p1SebzI
	Aby2yST2VKLCXl1UBpmXBfo8tT6UPbR0hHXWX2/k1fY4KC2e3r2K+TTnYKohktKIV8Wb9PrFnOh
	ioHPGHUzq33CegaB7KgeO/Noqbe4mJLJRBvSpMn/u1f396W50jtMDZPyHV0YDwUAaGRhjoOLOqi
	fEBuUxMf3eSGQ+nVVe+zbEksRZ18BdaydVBtGk6v8vYceu6uK1UJWokm2ouknzzSYPFo1JncErv
	uruZaMArj8xFq+jzwokHG5RP7BsIku5QIwkwMvZCjwYOb4p6fFIHVE9KBwnq6Jsf60NN
X-Google-Smtp-Source: AGHT+IHGBMJEO8+R7DqUEz8hzHGBbhkdsO5wRHl9G7dczHcBO14XnWfcboERE9FalZfCBAPnpCJUfQ==
X-Received: by 2002:a5d:59ae:0:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-3997f9336f0mr21916870f8f.40.1743000004776;
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
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
Subject: [PATCH 06/15] dt-bindings: serial: renesas: Document RZ/V2N SCIF
Date: Wed, 26 Mar 2025 14:39:36 +0000
Message-ID: <20250326143945.82142-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074006_753212_470809A3 
X-CRM114-Status: GOOD (  10.92  )
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

Document SCIF bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC.
The SCIF interface in Renesas RZ/V2N is identical to the one available
in RZ/V2H(P), so `renesas,scif-r9a09g057` will be used as a fallback,
allowing reuse of the existing driver without modifications.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 8e82999e6acb..24819b204ebf 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -86,6 +86,7 @@ properties:
       - items:
           - enum:
               - renesas,scif-r9a09g047      # RZ/G3E
+              - renesas,scif-r9a09g056      # RZ/V2N
           - const: renesas,scif-r9a09g057   # RZ/V2H fallback
 
   reg:
-- 
2.49.0


