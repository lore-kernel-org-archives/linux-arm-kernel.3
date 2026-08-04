Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCEEC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Elx81wKiFvHIBGMAjiuzWwDTmSw0D6ljnUBG1nDCbuk=; b=RrN7xSBRf33xL6LuEHl3HFmXow
	L9Ab5PhFLFsc1ntd1EEc5rvYegdgfmuvw+BQ3B0Ri7ayxGJbT72ELmeR7naNfVqrUpRPMbkS9sA4j
	MXcOQ4ZP511HnmFD5iGyd5bAhB7lxaHQOIMN2wXd4y4rfXz3qbJgoJkd78X/jqPhw4rHgs/dCtu9E
	FSNlYaZb5e5TQileU2XLTpnzdaneHc6snc7b9GLkEyYmktDmC4tCcznt8opSt8bCNha4G6y0U6enn
	bZSuexUO9za/rhU+IMWFWluHhq39yecVx3rBUtFR1p9KseHmUEYq4oI5zw2yIrvcnFzyQBEWQSAKx
	2hVO5haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfq-00000002omu-3K4K;
	Tue, 04 Aug 2026 21:27:46 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfn-00000002okC-2w15
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:27:45 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-497deab2d66so331923b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878862; x=1786483662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elx81wKiFvHIBGMAjiuzWwDTmSw0D6ljnUBG1nDCbuk=;
        b=shILkRqjARON0GwCA+b8ctHsXBXKfcMqoWKXpWV4vvg8Hhndv7kfMsj9wp+Vy1SvFq
         E5SMkymAKt6o2ysaF+/QCNccFXJ8GO/1VmZEaBjN4kdpeU5UXzatR4/kQ/OKNIUDnjT9
         4njZ3Hv2QgmGXmgbLL1Je7MHuL4o2aOrX6Cpcu8tGJqXPpr7VMxRddg+rfDkKDXYNp/k
         9sDRqvwB2aCO/J5VKppic2Nn9bhYioznS89fHIEWUW0UYWTydkGXXLJ4daaFyOmEeibh
         el1fZstij2S4+qBM5a02+tDLiWZ4kgBlfDFUMrhiqgJKmMivzBX5plaWn9+/zVi97b70
         UQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878862; x=1786483662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Elx81wKiFvHIBGMAjiuzWwDTmSw0D6ljnUBG1nDCbuk=;
        b=s5AxyohaCgYMOCXDj+fMYtLyc8iU4kmKQB9BP36gWyv5VlmYqww6pQPhv/118HU+nW
         9UE24tB1rw2dHOOWigVPCLLPrhdmsPIDE+Vieu5joHsGrdboAa3ivO2S8wFnnYuNwn1Q
         pVvsB7s9VGtnMbAP5DPn8//wg4hF7O+5vCQRH5IO0bTgFaXWziNfhM5vs4xSOH8UDeyq
         dZdL3gb/U7Kb+P4xgHSM8ERBBE02j1x9ZTEgTm3oeNiJ/h3BZy+9VXg0mo7cvBbLNRmR
         i1jEmQwpRDBcgJzW+P89CQx3y448XhA/DKqdDO/K6bdUVjomq2X0ArGTKIUw9di+sy3+
         dU2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqhxCsF23QRXJ5HZr/frLxYLwHJKUgyY8NwE3u+MozaufQWLLj2uYABxTt7M2QEqvIIGFKKkcXQlMDDRUuHsyYe@lists.infradead.org
X-Gm-Message-State: AOJu0Yxep2+f50c+2ijLSx2x11wSH088KGFtncMhEtrzxPvx+du5bTOS
	/rrZY1b//wb8dWUvvI2IA1eruARn1I+StS7Uh1HUiJHmVMnk+jYKc3cY
X-Gm-Gg: AR+sD13bBQblmzUIMBe9O2QwpjXJcVKvW2m2YNxN3tldW3C55x5uZeQlb6mAvz4O6+0
	En88oCwPiQB7cWNrhsv18oFkWDz/HGnpEyjzUIdUujyfXD06fSYHhH7x+jWS+S9E65cnrMezEMU
	Z8ulkWYucS5fAOGSuKZwv0TSlBP3FZzUZ0I3pwtkBAkvvVliZN/3EQvzvLZENiif587KSVgW/wK
	5WOxu+BoHq1NYjHtT5zbWsp9yRENYg3jldiJQPIiz8OCTt8P21mSGlOsHfN2HWa/k3oSr7C6/o5
	/iRQI5KVf5P/ckUSxQtE+ZRJE6hU8F3TEX6PoWQOaS5ugajjYOIiEER2q3DYRodrbwV/94EthfB
	odXQtq+jN4j/xBgbHWPIJ804q9J673dPrp9iYMUfv+8sH+W8URyVoIMTdCMMnqzzKjNFnumgdFF
	dGZlt4v9tWoxXSqpQS/PsE0qmB5fHUzsVSUvHDY97Vc4bwdwYpGvAvBnilOKV1gdeZ4iSRz2QYS
	MZPOcuoDVcHPIi5LPOe6I9BmqBfjbkQRIo1paFxmLiUlHgPD3H0PN9i7+gCvalx2owgq0XjJBrV
	OlqhDy6ZjQFFa4zID3WWAJ/pKXtvPKlGyYx+NRcA5WCKAghlIwyCGhYLAegyW1zL91K7ZzA0KZD
	oyy4VZPmAxH2+I4YsqUhkST4vx3A=
X-Received: by 2002:a05:6808:3510:b0:4a4:989:bb1f with SMTP id 5614622812f47-4af98935a91mr6058342b6e.9.1785878862648;
        Tue, 04 Aug 2026 14:27:42 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:27 -0600
Subject: [PATCH v8 4/4] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-4-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_142743_778920_9185DBC4 
X-CRM114-Status: GOOD (  10.81  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307..9a778d1242c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -919,6 +919,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0


