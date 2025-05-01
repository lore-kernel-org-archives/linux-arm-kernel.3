Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42355C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnvyeixn+1Lgru4M/HCqjV6TyqEDVE1iM8aBdkxEhXY=; b=zYfp9Tr7fzIAU3Yn2P0TaGp8uz
	a7p7I8LkIdXNmqgZgo5YB5yeV1Nvsk5fyBq62OKEw759zg+VU+KI96Ai1g0BOUH802xFHFGByxaKF
	4I2hPnqM5EiPwOtoVD/3DsqQ6Lw1Po0T6ZIvCtoPffQPtFoyOg7rVYaEOVYO6wABlBucVtNUQZCTt
	MLc2A8TbyKCq5m8HMiSdfdBa+UqXkAzaMReyy6x0tiH7oHxxjLR3JuldF2bikHLN0QCqggCWeUOfX
	3gFKhwop7oUgaL8gCqvkgLIGMFiYVxQkpp6W1HA9+i/yYILmsDSotYIJvvZiTQhHL3qve4qCK7kuB
	EisiMqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATOA-0000000FjcE-0ZKJ;
	Thu, 01 May 2025 12:51:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATAF-0000000Fhnk-317D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:37:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10913665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103038; x=1746707838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnvyeixn+1Lgru4M/HCqjV6TyqEDVE1iM8aBdkxEhXY=;
        b=bemw062oy2KJnlxfLT0A4NiwxbIzD+4F4CZF37Qz94ezWwCxBue7NMoozxbWsjoJV9
         NN+WYJoC+px8rN4DDqUBub+UOWIShDZ93PqeXtruo6Zcotia6qUTaQLpaJn3PMFlm+Wy
         lkr5F8z0ps5aScjOBx0dK+cf9Vjxu9tufVU7BJGI/jq53jwwBtKLToslzYJuxX1Xhpka
         fIB1AofhcFBv64KZ9JfEKCQ2EbNGsgP8cJgwqpuQknm9+6U7HUzewfM2GSux0z5uB+fo
         d1LbBNe8dVdW+MfJD6W28wEDV4HvV5GXzgnMeBb+dvPRg5nQaz1nXD7f1QKhzmAEddD8
         FtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103038; x=1746707838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnvyeixn+1Lgru4M/HCqjV6TyqEDVE1iM8aBdkxEhXY=;
        b=PY2gh0PDYuzTdRYQTxBhznH97qen0sgUsiw+HQwpjyE5YIDPfNmDcaQmSMlf2F3LnB
         DUTlt0aQSbgQFZHvjTs/f3F145dd5Bv6c3jJcynZbg2jierB0E6A5qL7ih/jNOvSDDXp
         glim/5fdqaLq1xZiPpZdqw29HYKJvQqriEP+S3bBgRUxa8LrlneAkcfx8phh5lzAsAOo
         ehDEJQ8UP2ERxxwVvV1Ffv8COEJsk5PNO5wFvnoR/Bi8mUpGhvaU3PDlooHJrA+giF12
         KEwl/AQduruNsli+YnHpIOQQXaW6u1EXceZPTPYOVffUH4nGEyfFZrLmOzWZ5uJWfjzy
         uVIg==
X-Forwarded-Encrypted: i=1; AJvYcCV71sGCnKUIVe9LDDMlOp9np0Dq/0UV+u4mDNh71z3QLob299CsFjtXM0Mp3W0p8vaJSMlZ5a18LdflF9RFv4Cm@lists.infradead.org
X-Gm-Message-State: AOJu0YzaG7+LvAk5gDxeoNeJFGz2ktuWl8ZxM0aPZODTFDTo/lwxQMKK
	DMubUgBTG9Ytn8dAJPSejpZAj96zu3KAZbftIvS+qGZGG60SPXxf
X-Gm-Gg: ASbGnct0CpaMtYaz4bVhpDS2E8iDrgbt0ljl3r/WEuTOyppHal1Egx729sMoTOvTRTW
	6TcytlO9qUcIjJJqBsGeQDnr8yLfTnelKvA4Wq4TlvFuln7V0jiXRkNgtfP4RqTUenCPyr7TPA3
	WW7dGxPC7Otvwjz3t0eAeQwuOXId9iROHYQl6T9yjglIla5qMDwanGo51rW0/2dM2xhB8Ue15QG
	/YqTuEbWe/fmigPynYAmeUs34kT4iBVOBJmVszq8FA/oQgn5eP0hQS3/0UT3lyZXXJrY+u43ioA
	rHHiO078Ba6+x5gOp+KS9DxovPGdnYdCr+6f2N0EHbV36s7NYt/Zki9fBayBlk/+
X-Google-Smtp-Source: AGHT+IH6jzylsn0GgewBtvvu8wy8bqEIx48tCATSZ1CDXZXmV5fbpP4GZv7mMB68aJ7aMPXOZZnKJA==
X-Received: by 2002:a05:600c:4206:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-441b72ece6cmr13060585e9.14.1746103037909;
        Thu, 01 May 2025 05:37:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:37:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Thu,  1 May 2025 13:37:08 +0100
Message-ID: <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_053719_758000_09D0A163 
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also include RZ/V2N in the list of compatibles for which the `resets`
property is required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..bc421882cbc2 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -59,6 +60,7 @@ if:
           - renesas,r9a07g043-ostm
           - renesas,r9a07g044-ostm
           - renesas,r9a07g054-ostm
+          - renesas,r9a09g056-ostm
           - renesas,r9a09g057-ostm
 then:
   required:
-- 
2.49.0


