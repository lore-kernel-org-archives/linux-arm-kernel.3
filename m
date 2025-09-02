Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA81CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AzoOdR6sJDHEcKW2yNQOC2NaWtXxFSPPgG0odQCnsE=; b=koooA0m1UtScv79BDs+BWuKSog
	5ILwFp9NC7Z6kt8y9/sb7N39P4yfecl9r53yoRC6P9H3WbA74TnnWubookCf17wdxAoiYh41J8LS/
	efH3tVde2V01MMxHPppMjY21Z5F383tXIieLOSDUKowmcQYTwDfhlsWwsqmCMyE6uwKIcYHz+YkPg
	SFglHJjk4kcpplimqvPNx6B9K3vdC9Aa7VfrUbWY48e80lxtb1S7c4HrgIcu0tQ+dhSVRnEFLVOUb
	9/bbWeZaD79agkx8aZQxWtIJF6dVzRKsK7Zvumf4sNNVrSdEaoX785juXkVO17p0VUterEjx6Uo0Z
	GZPIRT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHz-0000000EbUJ-3rUF;
	Tue, 02 Sep 2025 00:54:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utEe4-0000000ES7u-17xc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 00:13:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so45135f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771987; x=1757376787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AzoOdR6sJDHEcKW2yNQOC2NaWtXxFSPPgG0odQCnsE=;
        b=FGfivP+H9OLf32tQ9BG7Hht4ijk17ctKYHmGEs25Wsg/gNAB5qBnKrEetNrLnJXJ38
         CAt5yUgbdZSQ5T5TyjsRnqENNmyXCnYLB0nQPYZcsPR0VwMy0NHiGZfS7RcLr3fsUlhJ
         Vhq9jn8Ektm9T+011kT1wL+6ZX5Fjw/hM3aA+3uRFdBi8hS+Rd2nWNogf9KLU2YMbXJG
         +VcQiCa2czpDA0ZHBixb9I2xlpudusnanI1k91oEUPpWLAsEJ0H4ATUCCsN9MjYWfP44
         fRjj5Iwq3nBWTZgo2WqO61xqg6Y0svmJ0h9aKEuqoZipV9JkvlculXWDvfTGjxPY1Grp
         Ajqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771987; x=1757376787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AzoOdR6sJDHEcKW2yNQOC2NaWtXxFSPPgG0odQCnsE=;
        b=iBujJAi1LKLLOVZCxKelW3gxiVSoTf9mk66nuCLvEOnmimVs0ZoQbQd3dA9ZR9dqbI
         y1AWRD6tl5JTnY7LIuWBYndaOdhDB4oWkI6JkYGVY7DGuq1Wz/Aiz9brHQijPB1sXZ/9
         O6XzWYseP3BBw4deJ5CTalXbNDp1m08SLG71AzULM3yPQN+t0vLz3r+vmw4uZqKHlWLs
         xwOd0JCHtuqjNGCzVOyfSidsS/CUBBI4rJWtVvr/uSBrQkzGTzgeYj+a+mJShfdZoxsV
         CunQHg5/zfP4kFPTgdh2kgBMh09bqo8LxesCsf8mCXAMgesMHxcQg0d7guCXr7LbY7To
         ofLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCGBg7jzQcZTdeO+WZUPATTbtcDvCS6rwWQybKxatgNQTqt4w4iJdwXo3BZDeyGzXKZP7NHcHYtT/3lnjW70Gt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9DhhZJWwfOb/L2NrcjeLzrlPg5dNPSGdeLrrPgjQI/YS7abE
	9ZnTPdNIsJCgt8SKCDucYj3wIgCzPm3W1TmKVan8z29qquqwAY7vwcsd
X-Gm-Gg: ASbGncu3TdPxr+QxZrUY+jZrrKz1Y1K+Q67AnqCqajZnhiqpJGurPVMEKu+k2sd1kyW
	kp4IkyvrsXtXRkI1iqeBQILVx6CEnDgz5fkWDYLiQRfJZzmt35OqL2RP+UPO82P0FJGSwcroQbG
	a6fvzGxdHGRphRxbKrV/68Mjb1cufdPe/52zJXxc+Y8kjBTkpYmh7NOqNnxp7LgPgct3yL/PWXf
	zNOnROcVXSFO/8XeTtVVXuOIA6uxLyhxwg1GDt6iLwIlhUBSFZXf1v0xUYr1urztb9NkOatvYmK
	m/lbuuZ7jl6NJe9GlR0FDMkA9INKpwxD/54h+AbiesFbde8j5+wrDD9zTty/x6OSTFZBhtOShVG
	LqC8qAHdkEpcrEHQEFelO5kDW1sVwRb/LA8wfTm2Fvaq33ho7L721w49o
X-Google-Smtp-Source: AGHT+IE3uKhYEY1h+tUV59URGGBQIgTcoq1CY3L+zPFZ/Z3aqPfVSo0apPvIpocUjyJSk/XhqU4+ug==
X-Received: by 2002:a05:6000:248a:b0:3d9:a7b3:1b05 with SMTP id ffacd0b85a97d-3d9a7b31bfamr745722f8f.25.1756771986610;
        Mon, 01 Sep 2025 17:13:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Tue,  2 Sep 2025 01:12:59 +0100
Message-ID: <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_171308_309754_FE6BEA86 
X-CRM114-Status: GOOD (  12.15  )
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

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to 19 to support additional per-channel Tx/Rx completion
interrupts on the Renesas RZ/T2H SoC, which features the
`snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e3cbaa06229..578553840c9e 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -118,11 +118,11 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
 
   interrupt-names:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
     items:
       oneOf:
         - description: Combined signal for various interrupt events
@@ -134,9 +134,9 @@ properties:
         - description: The interrupt that occurs when HW safety error triggered
           const: sfty
         - description: Per channel receive completion interrupt
-          pattern: '^rx-queue-[0-3]$'
+          pattern: '^rx-queue-[0-7]$'
         - description: Per channel transmit completion interrupt
-          pattern: '^tx-queue-[0-3]$'
+          pattern: '^tx-queue-[0-7]$'
 
   clocks:
     minItems: 1
-- 
2.51.0


