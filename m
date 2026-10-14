Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1EFCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=; b=PYQrotdpfwYyGs7iu97Qwb4Cnd
	cdt5qpLLbjGTX7RBtpWhTBqnhCShvJ4ALhoIMC4WQhT+XOhs261YnVLyDikCA12kMzjxgjpfyP2rB
	xIpOav5Jmi0xs3MOmfIjAjcwF2dITfQ7UVyOo14OOIFRYKH+WMpzZMFfmj3KjUFwnHbLx0cmu9b6U
	CcuDP1wkFvO3FgbkEx2XpPve0tTzeR83pMK6ceUJ8PHcceIKyM1rCIsGk0G+xD4pmrEI7o4I8dsF6
	b/Kk25LTdeMWyD0o9/KwzMovxfbh3w76V6UWhsBRNqnPhWC1h/lrlvVyrYCW9IQ2xqocI88E0lmhK
	xb/7t2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKX-0000000EjQP-1V47;
	Wed, 14 Oct 2026 07:23:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKJ-0000000EjFX-0Pm6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c4207ac26so3560885f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962581; x=1792567381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=P6FpZZknJOfHt57PJkhoeZ2C7oyX1CLMeu2SdP6WiedhDzbE3QhYnJaFmF+Mhx09Ux
         bfSDRFffpUeuwtc4qX4bA7nbFmwsNByuxKSvptQo3yGhjK1b0baoN46m+OBuj1Zdo1aT
         XrOLZMxFTnU5rKroY2auUiWuX3CbN9K6D4fZjq5SdCJ6IHoCm+tZxk/twMfYIyoz7Wa8
         cVETCrY2X0p7olMHaosEDK321Y6k0sx3gIDII0Wa0NBEhcCIsFR/VtJ5voSi/2NT9wEV
         URnbGHTR3Lz2YRHZDwfEqSyoRIqMkCWaiWw/2sQQzIix5Znvlc8Sgex0Ee8dh/uO1Bfy
         2Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962581; x=1792567381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=QcSVbmDQMMGJrgGtPRV/2bijOtCtT943er+2psxnSJJnn7kRieiP7rrxZd2We1vgxc
         MpY+zCo6POdZGIiseDT7zcR1f4A+4SnZQhVRNtwsHgmYKtvArJhuBz0MGf/gedBA1uBo
         2eEcDfW+TKo5d5prX0o/hru3HnOqIqrozv5Gkh6NL3SKA3lpTPSxucjJxu1mVF6Fev2x
         91lZihWeO4045kRjdPoeQblO0WrtCIhzZGQthK07lQYemP92E6f/AFtfr35H4Cfbm5rn
         Wbn1oOfWlme6eoAx4k6TQD7TNeqtoSOQPSefkNwhw+VbyrDyCDTesEBxdiVCHDWzRNIn
         vmaQ==
X-Gm-Message-State: AFq9FYKHQui0NwEFCvJVdmiaa4rs+kNu6XjkyIzR9Yj589DL4kEZxXUD
	4lgdJ7kIBzpSuv3BIybe3XXQo/kLe+Xt/USYYvCnUPWpRlD2Gf0HaAwpOWafX5rBAoVnrw==
X-Gm-Gg: AYBFou2ZuivgJORvRNQ1PLoYH1GnIusrKybTXihGX22hGjodBC/nu7NH6It9ohhBIrj
	kxy8ihbSO/yW7gTOe118Rgc7UNP7tq3b5y34y31Lnp2pBH7ketpmDgOXyrZFVpHXbzUh33b4HRj
	s6Wnw1C+qNCA4Kx4768a3/PRZ2tVtmo95ctTsEDMQrQGuhTjy5MnTUXRV7Z7q2kT+kUB1Ps5xRy
	eBhO2lVoO3Kcvx4+Pw20WI0rQtfCte+7GN7lmyK9mzGhlPwddOJEXvumTgZAEMMy77BaJ8O9u6p
	K9TDnxN3lyytkLucI3/hxUZ+LcYEFJkyiHXdnh5E1A2qQzRztzOIJPfYukQFuzMU18oVpf5Penk
	ZgBCZM9Lm3yJAL3kHDEm4gmictgRR3zJ5NlmTC4icmasGAUNTjNVNfTPtO1pHUYfZyHS2SWlFuq
	piwizCpt5fECSX+obgtBqmYBN/l1tth4dxb1xf1qEr4HUI4WnsxqNs9Cjqq3UJd0PDdjsyk5E3z
	uiSLhaZINL3iGHdS6OVG+ZZZ11FBUzWbM5BmlLvvTDP8SocJXgKTrsyY+Fq2oegoNwcAemPlE0D
	PN4+/DmR/lzL5uBfDwp9iMe9vY00Mfg74e5fU3Ux0jNPe8ydKJxl05awxLZDlw==
X-Received: by 2002:a05:6000:4b05:b0:48b:60d:2b28 with SMTP id ffacd0b85a97d-48dbacdd339mr26410465f8f.39.1791962581434;
        Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:59 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
Date: Wed, 14 Oct 2026 08:20:49 +0100
Message-ID: <20261014072109.1759502-10-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002303_351156_AF229355 
X-CRM114-Status: UNSURE (   9.86  )
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

Use pinctrl-single for the verified PCIe and external-PHY bit selections
without guessing the unverified field layout.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index afe7329a1d..bd57b41f1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,7 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
               - ti,j7200-padconf
+              - zte,zx279128s-pinmux
           - const: pinctrl-single
       - items:
           - enum:
-- 
2.55.0


