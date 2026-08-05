Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB3C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W+FtOkXSTFNOnduj3n3KSEKK3xwTvAgLSzJMwQ5j5vA=; b=AP0Oa5iZMIoe05iTN8GLg7JLkb
	hSN2S2RQwoMslGMyi75UVrfRzsn5NgyKdNJQ580TxZBc/piJlvLflpecu9LCZ0Ak/fwIH/FX4usQg
	e6oiz86LR0ATaELIH/R4MM9at0U5fTghhZokX1lxNMWP2/rCS3vn3YS672K2GT5BBkh+sNq5uhw7B
	/3cshXeinvJUFLQIbqgwtsnje+3cqtulwiCNuaep2FdF4lYugQQF9QEIgtGcbtNrDk6sqIhukFtuI
	PS4TIbB9GWq6dnWz4Q1lW67c91PE8J2SS6LwB+EDXwQzMNW4HAl6RmuxZ7zktuxJUpUacZ9v7zlsR
	Gt8UukBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3v-000000041ec-23tp;
	Wed, 05 Aug 2026 13:53:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3s-000000041cf-3xfO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:53:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954aff6088so10698135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785938014; x=1786542814; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W+FtOkXSTFNOnduj3n3KSEKK3xwTvAgLSzJMwQ5j5vA=;
        b=jnkR4sz7y/UlaVYQwvZJTY6a2EvuAE+i0ZiXeqd0dGtV2VQXZkxyrgbsu++bngYT/O
         TQR9xMsEFLWY81Djoa8t53BrWaJB+CFSwX00P43SvZ2L7TGN0CJloDPxJtoZcjQJe5Zu
         Q055T1yWH0+LxR7Qp6Xv9ZJreLJ81PMz6xNurR80zcB28EGmDV+do72aS1hM6d+PpN4P
         vdo54XDNIK2bLnYBiON2o4ehE8kmMVKYkovG4YcI/IyFZXDSUrffuJjp17BQ7rErKQe6
         gd7bx0UGvkq3k81AwQuWhksSCHLLIMItU7vEB36AoHnmgO5fDhFBrPLB8Gr1gaXzwrFB
         v1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938014; x=1786542814;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W+FtOkXSTFNOnduj3n3KSEKK3xwTvAgLSzJMwQ5j5vA=;
        b=CEoCcNEEqsCwp/hOcyVckpLKMW04IFjR0eyflEErqkJXPGgZ/RLGhM0EOyCWAh40Iw
         Wf57E2aVmniDBnpXHLK/qtqUCVLhNFz2q1LmoQNvNyYa9/BBcbIj27P0gQfxxDna3SOg
         3weC3cwtY5M689of0hBfyyrhEPn6sgOHTfBw8hBP6K0QkLWxkGlBVnkM0cw9qNxm1b3e
         bGDPxqvX0bLv1pdsNrpfo5tuGjytU+kBXr2l2x/dhywuCfN7+1fwPomRYtYZuzwntESE
         CdseYNGMs4YkAomMXBdGhDYHQFWmiUqnDkYNagZQbwq7ut3lbBwmjZyzMUKFlIy7zZKX
         CiPA==
X-Forwarded-Encrypted: i=1; AHgh+RpVYk1YwX30TaQCmQ8hFRgk8D1Um3lsFkkbg5FqpcUdgju4xGcZ0s45U/Q/fyKQ1Ai9VPeIPT6N+Fqtdvb2SVJQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywahwt8JCzT/9FJDSUmaQJTucoXZDGJ0XycbgZC3p5SnJOoRM9t
	WSGjIUkkDHTs3bySmgFO1j5rbQY7comrinRxC/SLOPN3nKyRCNljjCjwzN3deBrzyOs=
X-Gm-Gg: AR+sD108XaHG6w2bNt/WC6ub/H4nDA1GEOxqI/U9ed09IPeWgIzv2oqNt/5bBPuAzcc
	JrvOG2wiSttR8K8sLJ4AVohbuhoWhdbzmqXDNF0u3mCrYRmxrY9wWy90goPix/c0WrIanoiGbrQ
	m/04d01QhRI7PHbaQVMDr9dAH+TelODYBsiq3NkaPn4e5fLaRtbGiz08uweaJIoc+4i7311DrIM
	4HUf89znBVIIZMh1Ob8ZaSmENF6f+iHOjtgWMqPwxZW5uQq57s9NcRJZwkhUGG25sxk1dpb/yKM
	G6wvCedSJvzYTIsmcGNDJknzsEq1uMWiT4/yNe7hYxBYd2CXIKpseVG9gkvDnSoWh9oN1oB3AID
	+01nplM40wZCmLRfBSiYPEQ+7vONh6uVQTXK4vTMzypKEDXe4sTSJVHZfoNbXcAmnlmaEEE3XE/
	oO2CtQ30T+HdARhuhojCwPn6n1NGVtfG/3qeeek2iLlEwDidnFhoGp75SnpNM=
X-Received: by 2002:a05:600c:1991:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4994e7448d9mr86632895e9.2.1785938014491;
        Wed, 05 Aug 2026 06:53:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b779:ffeb:9b9b:3a9b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49949fcb0c5sm159237985e9.4.2026.08.05.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 05 Aug 2026 15:53:26 +0200
Subject: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFVAc2oC/yXMQQ6CQAwAwK+Qnm1S2SDqVwyHslatIcumBSUh/
 N1Vj3OZFVxMxeFcrWDyUtcxFex3FcQHp7ugXouhpvpAR2qQh+GtKYkhtyGgZ0Wfcx5tQgnEJ47
 UtBygBNnkpssvv3R/+9w/JU7fEbbtA4Ss/Np+AAAA
X-Change-ID: 20260805-allwinner-a733-spi-support-e30a9ac057a3
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tjeFziad/u/dJ8yWqijM0VUOkYWgyCYz1BsP1SGqSnQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqc0BbXNtMYSp16a3Hz5iAvHlZOspwok4eoydFh
 URQ8+kp5z6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanNAWwAKCRDm/A8cN/La
 hSnHD/9bg4eJC/YmvFzaaazakPMmXy47hHzZTMg8/pNF4kPFEnlvM9fslRS0ZwyjuRtEbXsaB69
 wVGH4/Jv9q0Yi3S2CsCLjgoPpVpNuD+cAk0FG4tC1EKhUyNQ1FYRPQGsT83ZvKeQU4Ex2La07Yz
 /NfEwieKVxTMURRYa2m6EcCAY8NSUfvpXI8ha+RhOiiCyFe6Yjf+IEIicp7UVTu9XCAnoSMeCQ2
 nBBCsShgom54uci+PwscGsy0D4024hWtAhMbRMLR/bUbLjuF5XCnFXByOQ3w+gcl2y+7EXU8uww
 AJfKY4FjoAroPWc+mjtVfDfVzMOCNhgNGz46AEg0fHyGf5ovPYN/tO4yheAsQymjj+Dn17I6UeR
 fV6p9r8eWz1/w3YdeQkpjX0jwkMvdH6RIsoi9VZmW5t+xdb1avkA6OZiMg5JDBdLa8RKTuBUju1
 lnzq4gt+yuYMAgqgLzvxaqFTM65nGlk8a5tDuqR0lWIPOoHi4CukQVK5yKDXXpQs8AvInYlJ0WD
 fWYlKQkWeqlyNihvdD6CALUD0nS+dQwpy6kqkEOxzsVtFD3M/PBM9C4ZVJM4aCf09KLdjj8pl+6
 PSzYzxo7OdBJHYyDXWdb1yddEjF9y60nSF8OdxNxvEaplgnryawqp7Ub9myQdCSAembuM5VKCg9
 1T5laTUca2aNlTQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_065337_023228_A756B9A3 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

The A733 has six SPI controllers with the same IP as the A523.
Like the A523, one of them (spi1) also supports DBI mode.

Add SoC specific compatible strings, falling back to the A523 ones.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 6af4ff233158..be47c6e00409 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -36,6 +36,13 @@ properties:
       - items:
           - const: allwinner,sun55i-a523-spi-dbi
           - const: allwinner,sun55i-a523-spi
+      - items:
+          - const: allwinner,sun60i-a733-spi
+          - const: allwinner,sun55i-a523-spi
+      - items:
+          - const: allwinner,sun60i-a733-spi-dbi
+          - const: allwinner,sun55i-a523-spi-dbi
+          - const: allwinner,sun55i-a523-spi
 
   reg:
     maxItems: 1

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3

Best regards,
--  
Jerome


