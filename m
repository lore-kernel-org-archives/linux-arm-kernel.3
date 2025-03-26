Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6133C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lXjgaJ30mX5cDcOLM5e2+yWI/YHl60h4te+LJZ26is=; b=iH0c0UUGA6MkosA026Rn46fZTB
	ACzcaA2zdBpoJn6ZWwoTlwBGCqc7WwfFBKtIGhHvPWV0N17QHErMNuO64cmSVaa5kakMecKfzPhU2
	XOpqf6T5HFM2Nujd4yliXH1rwdp7DD/83hGrooLUR6POeyar98W94y/LRK+NiB5jLhqEDndLk30VO
	ZeonSUDPl4rO0o9s8d5Kl0cvfXgGs6CLqz7fgQfVK3TigBswxuxQk4zjH+MPT2HV6GzTUirBI++CE
	yY61hwM/ULN9TwsF12LV/24M6eP5pxUWhXQffZ8THrF8nAl/C2BgC0FwiQGJckO5xp86muZd5x2ap
	xwi4mOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSCC-00000008lkH-37AX;
	Wed, 26 Mar 2025 14:57:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvM-00000008iU0-08vB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3912c09be7dso4615243f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000006; x=1743604806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lXjgaJ30mX5cDcOLM5e2+yWI/YHl60h4te+LJZ26is=;
        b=kR8qqyatoaOqHMEGZhd4AZs79FbM6oYEYVN87B2oY3SAW18FuqLASmk089jhv2Zdor
         4YDkM3FKtJwkSzQW10I1Fz2d3rqWJLIKpcBMDeHVHxX9x60po2aGvtfLjtm/zTZw4dnp
         P0sx7SjBHDPgg+g86f8XcrvENQ2RMedeYW8XfBNn9PIxGu5zJPajXwyJKqQ2MkFxLcKW
         8epYPYuhFFkewMvSb4KOmHUVawpiCmmiPLn35HskxPC0Dqbji64h9IG6JhbkEzYzVQtF
         p/aqpB48lXX2/qYSmDxqMRlKd07RJCzS/OASwJWHCw1vmVO7Chc6rYljgsNcfCAJyHXg
         4LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000006; x=1743604806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lXjgaJ30mX5cDcOLM5e2+yWI/YHl60h4te+LJZ26is=;
        b=XdL0p3N55OXAp/RsNWaOZkcGsN/12TRRu3x4HSSWp0Cy7ZhZt+yX8jnJpilTgKMnCs
         zKUDKQsLlu71PYNSGhx9vzECr4l+WS4d0rcj1w6xW9jnvLqFjmznzCgx11o6bAHhcoid
         HLrXhBh+yRriolMC8naf7TUWJNR1ycITV79zlWlAe2VMRglGfobdH9Ctsna2jEwh3Mvj
         PaNV5yY2k3YXp6rqRJ6tGBPosoFcCm3ZjgMVQY7fQDQjrhlFRO5sPJeUKLwoMLDKcVyQ
         KFilYdDZZlU1jWWfwWHLnSk+AhnWPe0uuV0Q4i1D9a+sxuWtRtbsp+YJY0uqbmQSx6IK
         WQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCXmuCPVmQxfgYNPEfDcHUIaby/sbbU5nQPxbPWS8bifmMYENPiP84WekZa9d6x244ZVHvB3rXboEG9+k3wdHLji@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4/mhA20U+YV50AENmJmKoZx4YkJEniPbOYQQUHyqwfcEjJrO1
	5lOFkZC/opzfzxfX+JLEg7CcJY0o+5eazdZJ3z4T2qvN701FrW8L
X-Gm-Gg: ASbGncvEOPWvztBVqGnpTcfGXFAwrh7nnNDfMhmhmDzBrXZe6Uv+Chxo0Wg5dZid8A/
	RtYhMFyQfduBTnbqWkHkvupSxSC+N0DTbIhZyGKjoCdAL1Vvrsm+6kOxyfYGJb5FCwH4/22DEXf
	6HOTLLZimJMu4iEmxAJvm6EQXwzgFk1xXkPK6+BABoYSurPi2vL05wJSVSxU5QVx3Qfgu5kOKyH
	GnEB4tfkPvA+0NpM51o/enHwY+lrLpJ/MvIGsmadXYaRoWuxMtaAXFrq701f56bYS/TGhmJ4Xuo
	A/6mQ0BOziPHBiTHgeM7uMNNJ++ctNrKPEMcLa+x8hO6LUXvsaPdlAj/z6rPH3TJavIx
X-Google-Smtp-Source: AGHT+IH46KfQuYDthexFM9JOF37fPKyd4C3Ozaj4K3acaAOPvFJgrgx3LcP7JO5sXYRF9Zdn87Jt9Q==
X-Received: by 2002:a05:6000:2b08:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-3997f9104acmr15697964f8f.33.1743000006086;
        Wed, 26 Mar 2025 07:40:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:05 -0700 (PDT)
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
Subject: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
Date: Wed, 26 Mar 2025 14:39:37 +0000
Message-ID: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074008_077654_E9846C85 
X-CRM114-Status: GOOD (  12.53  )
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

Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
`renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
existing driver without modifications.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 773baa6c2656..7563623876fc 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -69,7 +69,9 @@ properties:
               - renesas,sdhi-r9a09g011 # RZ/V2M
           - const: renesas,rzg2l-sdhi
       - items:
-          - const: renesas,sdhi-r9a09g047 # RZ/G3E
+          - enum:
+              - renesas,sdhi-r9a09g047 # RZ/G3E
+              - renesas,sdhi-r9a09g056 # RZ/V2N
           - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
 
   reg:
-- 
2.49.0


