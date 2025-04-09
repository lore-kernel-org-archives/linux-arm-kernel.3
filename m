Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1007DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReTGoMS2vXkEoQxUG9mhQKtXUX9UxWUCToSWrUrmlXA=; b=jL4LkAkDEz2g+cVG/brh9f0yKq
	BZK8qrgXttXoQpYoreJA7H+xJeioNh7tor2+aWouHWi3cIEKZM0ZKOkaSzmfOPozfxvrB8PhNk7iP
	v2BLsKIROgC4uP/MmgFPdPVbWbsacfI9XzKSFJuAOz73FpJxXKMJmleYJIUW0qL7vqYJuhbDgThv6
	wEimkEPazqBoyOMOL45oVLEWYRQcIzVolysynHvHIgXu7aBQeACdSm5nWq9XUzZMjV5bRt7r8sRyJ
	KHAnQcM29LdNW2OZASWvXMF4GAbrLNOlDRasMMwkkjj1D35CpJbq+C7BWWKAlmXVT4FJ97FUZL7Gq
	6rkLibPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cHA-00000008U4y-32zx;
	Wed, 09 Apr 2025 20:44:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAu-00000008SZX-14Wv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso26347666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231050; x=1744835850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReTGoMS2vXkEoQxUG9mhQKtXUX9UxWUCToSWrUrmlXA=;
        b=bKVJvtE5CdMu5qCbz31TrmPehWkBYFZ5vozds1s0gnBfhuxI4+omn1WiQ+13l7zqLQ
         gmF3tho50ikzFYCwRIKUpOE4QEw080UzsOfJlFJN19KjMuuvWTGZK4FsmgzZF4vacpNt
         T/gNeHILPB7cdHr05hPVzZMPCB0eUV54Vkh1zyfX0HStBb7iN8lGcNwpa2/iumogLfjv
         DB5MUtt32HSe+WHob7eWR7k6o70AmUhXzaq7j5gI7Nklvu5+zcCeErfm0wpPbu0+AqFE
         FfP3dG3ZxwE35U1Kq55HwXHRlxTPAFQF/LlGnBWO/NmMTHDjCdibRy+x496LjH/E3wUP
         WADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231050; x=1744835850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReTGoMS2vXkEoQxUG9mhQKtXUX9UxWUCToSWrUrmlXA=;
        b=Oi/s9qqNwrDhy3meq+SXPAhzYrp4qaMalpe5tvhH5bT2BoKXdBo9FgSBsqxTuVrvQ2
         JKAExtmu2tckZBZAzqrqj7LOoeFAvJrYr4pagtEfTlTgiCqMZ9eOs2Mv3EZFACB8i5XS
         8aYGXVLIMQ51Q0A6FcpGmC0dIkG+W/cqSigaGLMxdtMTtJmr3NS+ajqJHdWrRp8Sl+IR
         rI6f04/Lk713zpoIxpTkO4vbw2pVGxMYHykkK0eeyhqE6pezD5rJnY0sLTV3RC3c5w3w
         H4RjETk/g+B/nNXBrVrsLkl6cOccbYao53Rcz/3ceQsz4nzi5f5p6+1wC1NGH2+Krx0n
         Dq4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWcTI28PfQIkRvqxeYChc77q/v2NzfF+X5Hchm+IyW+TWXMOI2Wp/xBK4vpGGG396IdAz882SmTEAWVf6HucLL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1hsoiq+IQpb8jdcrYttUIaWVvFOTdsuxU5CRRYzLmUzDC/kAY
	sPgi3UTMIRdwZprgwMIA/sUihlhdc731s4gks8/sSQ9rEVhwYffxoe9zz6RoqDA=
X-Gm-Gg: ASbGnctTkc9YFxiVCBxSjClVE7RgX2k5vTau1mgxYJjenStrRW/RzzFB3wQNcTNzvfG
	XFNPgUO6F356zq7kPHNaMlPQdg9eeYGuJbsDTM6qgf2Xn6JLNG/Qf9ALRWt71BhfYvhuGm9KmmL
	maJF4Tt3c/D9UApSixBU4YNtMFhru2euQUqYZa+PpouQQyUXDBuqz03oIXoYxPBMBOzTNZ2SCVZ
	Vw2PLpIo6wuqMf/v5lBoZfCCln7qHY1jRxDbvMwGXJmaiYJQkpzHq8fJAGpQhNTWLlxksa86ikC
	B4ax5Z0Y62S2jb4okGPnzYgKKLIazXwdSREj65HaZKi9juRl3d8hOSLXCP6jybtIaOvE4wNcDdJ
	4yVqQYfEEBenI1fgpbiCXd3u6uZE=
X-Google-Smtp-Source: AGHT+IEBlNxVh7eTUcIx8bavLvlvqPUje0i7F4RzY9BEv4lu5kBKWoWYEurWTbTU+YYGqwf664Lh9g==
X-Received: by 2002:a17:906:4fd4:b0:aca:9a61:c5cc with SMTP id a640c23a62f3a-acabd3c3b96mr7238466b.43.1744231050538;
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:23 +0100
Subject: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133732_296266_64E1A3F6 
X-CRM114-Status: UNSURE (   9.53  )
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.604.gff1f9ca942-goog


