Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83691CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=; b=w7guxsXDwxgIlZHs6yG+l2cuWz
	v8M4h1szFezaO7Bu5/W8Fc1JmEz9hfFRk+vkZfznLkLT6mr3VTkyl9BouEGH3PPHvAzBgg/RQjutV
	r/jVh1GhWicdfSUE5sBUG5h3NDiXbDZRQQ4UOc9YjSiT3YWL8wBq7SB86nIVhNQF/NchBm4R1JBMV
	mDNjNh/C/TToe5M1wpJgG8uI8to5+w+WGcI6dZnC3sodDCDMCH+KqckMIeUHZS650gBIpH+TIGY9m
	+3cD7u8B3YtvvKtHbgFuKc0gD1AqmkD6TINUQGD7WGEJTkVr0OwAVGEzfEUrCR2SahYtzMaI5cjER
	XDNuQQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNm2-0000000D7m1-15GH;
	Sun, 07 Sep 2025 22:22:14 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdg-0000000D5ep-20kx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:37 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-80aaf37b0e5so512583985a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283215; x=1757888015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=hYtUHf9CGUg8eP5M5fT9Cc6Xv1cTJ6IHNWwv6mwEz1pdeduPRQbUwNDsw6QNyqSy3S
         qMkR4UTheWr0wQSpBC/UQ8sNxiPFUY1DSKyUeGcrmcGizt3D0YIKCuZgqvf9bRzlCNnd
         MYKAeT1BMm2KZ8oR8yW+hQIKdRrYfs7RTjgK+l12NHW1PoGuL8hRfWNsuYI/j8OGOY4D
         s6G/qsmve8mlq7nWfBF7klwDCKbe0nuwyhzWFqOqgfv8ZHWtvECBprRIgaxC+GNv7cKO
         mUupDVldvXZygM9aANkUlMQ9r9U0vSC/xOGclOqWq6WMEYRtnhjEGeBRHzBQic8OFniQ
         jCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283215; x=1757888015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=uj1LarvA8KbGQ/kenClH1YRQtLBSiwqbGyzMguyqLFfKvXxa6+3MerwGOqSpY31dJw
         kYNHbK4ceoig3UQjzJUjVRRvXUKY90UQk+9saIWWtBJC8wTjVFsIqaBGVI+KVZvZwPUf
         BCKU+Yx7wzrSdVs1aCp0ldcvfwnR5Vu1IniXtP84BEp41ari/ZlV67klcrSWajEFJoOQ
         2ALNbBwR2MDuGYcgvQH/4u/2WKIv34A8IyksOWToFOrJi6wzhdESBmJTQTlBjCtzsF63
         XIJmSOKZr4pgk1pgdPwXZfpkIQ413Ak3qCjmjqHWdmkRy/dptcxG8EB8M0unnCiWOpzO
         R0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFMjpVbnvJewO0RdZorpV52FWGJP3oSmrRVI3wd0kVACXwkgY7syzewBvl+9JdWSXwKKwzqt4LI1DhELBOfEB8@lists.infradead.org
X-Gm-Message-State: AOJu0YzQmg1zhlA3Z9dnt5io77pznqmWjPlhcoVBVh+vT1pzpKLO5hOP
	tadSIsZopkpXz6zXEvnZYB98uF9eDkRKk8ebUu96jRaQQaatmEZoK9wE
X-Gm-Gg: ASbGncsMTu4kAinn47ov1L84MRl6bW8IuAUbfWezXfMUCw5BbI6k84onfYk9jB8K9C8
	NAKd3sYF6mtmgLqXFooEGL6wX96N8sqPrMv0EMh8o8Xzi5z1eNqy7b1Bt+Rdsi2LME1OI8P1iSx
	nTG9qoDDd8/W+uMWphDXPrvwciVaUh3aEdi3qDyePmpTH40j89521iSM5aCjK0PM0QKVpCQXP8p
	akgxpV3iIu6C9h0O2k7YkUjSc8+QrgTmWgblVMbPXEsd/lh44YW2secpNKcc0lFUg1HZp3Fg/91
	OZVCQD9E9xfFTiZEKZe3hyeRGjym+6Bn83iWxAKHcqRIiYz1VBgc+CsmmMmq5OcXG5cBva3sfPq
	7+2MQ1aufqxY/C22M109mJ0DSnS87AwQ=
X-Google-Smtp-Source: AGHT+IF4WBT367rc7xTWhxL5wmyvAoo/NmdxchMxfKtTg1zpZI4rxCABsxVs4Lm5bqd0ggvtwpcodQ==
X-Received: by 2002:a05:620a:298f:b0:813:5df7:1249 with SMTP id af79cd13be357-813c235fa79mr562041385a.41.1757283215386;
        Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:33 +0000
Subject: [PATCH v2 2/8] arm64: dts: exynos990: Add sysreg nodes for PERIC0
 and PERIC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-2-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1456;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
 b=odWB+qRjOJZoSfICr4ZcPLazr1kCkaC2Ot/yiQ8Lh0jucaF4J05DqG+NxYBGF9wlX31kGkJ5f
 vgIqMXjg7akDXA8JrtgPjUQW/+pEvX7A/75gjPI2MdTltHutRKxzktf
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151336_511248_2246F61F 
X-CRM114-Status: GOOD (  10.33  )
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

Add syscon nodes for PERIC0 and PERIC1 blocks.
These are required for configuring the USI, SPI and I2C controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 7179109c49d0b0984c8d8eb2d24c0be1c6e015c3..f8e2a31b4b7519b83aa31deefbc40e5edbb8186a 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -260,6 +260,12 @@ cmu_peric0: clock-controller@10400000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10430000 0x1000>;
@@ -277,6 +283,12 @@ cmu_peric1: clock-controller@10700000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;

-- 
2.50.1


