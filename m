Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7BCC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh3CNNvRBoX7TVXDcHJxqkfkaJkOwYjEATrQz4KoURc=; b=qg8H6CX5Lb8vyotSM7xq2xP4M6
	tnTpLz3hKVC55WqRx7FPN5z+FvUC7PJ7i2Mu+WnELSOOseMXVqhahSMWtYGjdigQWlGT06EJibA35
	OmnInHCA16p3cvW4Gwe35sOko3hvg7VbJQInPleabmKO7WuNHlBX0iFkjL2gCYr/GqDGY/K0i3GHN
	bCKAoOVVI0XP4wKwaGBI/B5UPZOirq7G10S40iPTSCkj3zEpYnFZfbFL7oa2UH/hOfBG0AebadIWy
	+36fDklzca2Zja2CxUeKkjqa0HFhy4s6Xku/7M7XinkI25a6qeVGUTYPIC7aLOg5GwuQUq/Ls3UT0
	otqnem3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSPv-00000008oKB-0dNe;
	Wed, 26 Mar 2025 15:11:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvW-00000008iYi-1sMf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso73993385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000017; x=1743604817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh3CNNvRBoX7TVXDcHJxqkfkaJkOwYjEATrQz4KoURc=;
        b=DaGeKazhU0coltzNEwyBjhH2/DWYCg8BjfeQlZJ73wEVjvpiseyeRYr6YCBTJ6VqYF
         wFv3vG2Bt103+t1stbdlEkn8kwgFEIHBx4Z+SOAU8/DiRQcgSduWofxcvvZt7Bf5Ayu/
         E0BB1DgrJrBzmgMY3LYJ+t9oFzRrWNddrCoghqJS/tA90e7sH2aLcETYvLrxFuNLzaxJ
         yRd6DWoudTa9UJ2WPpYro3lgRiXKoJQpmDbok2xuL5Mn6QtmzAKGju/AGdJNtG/aiV+k
         Q43x7Od67WpuU9DZFM99vaCN7XPlxW/e2WbgLFS0+4f9ldnXCStRgVkxsdDk9XoJODRI
         0Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000017; x=1743604817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oh3CNNvRBoX7TVXDcHJxqkfkaJkOwYjEATrQz4KoURc=;
        b=Hv2IFs7VXAsx+qv0REPgEtFeGMsz39hGrMPoGejNE/nEKT9VwyMat0ltPoVeqBSyLI
         Db34uD9eDX2oHnSGGNTbIFInKjWxRdvse5C2xdVo9R1Zbe2vxtQPB5J+XRCwtsWdFeGZ
         sAiVzozpLVEOYk1ZBcrnJe7oLsAUv2Y7cMaOyDMCnzjg8+27pCVs9F0ReJobTgL3h4v8
         hTvNwb5+m36GSEoJX6po0q9dyw3NCmGZL/ECLd2Za6Tfd0ns+zEWO9Na0OBKfkwX12kV
         sRd0UuIpknGxfuo/a4fXOFjLIXSitvQHWeXKrYEmeLhQHG9O1uxhb4phDO4Kgvoytw7m
         DFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZbmrtBQscU2zHxvaVtJAEz14+yTsptKAn/RC31z2dq3J/USBhX+i9BY8DtHlhgZTPdbZwTYlaEdpUk6BVWnMr@lists.infradead.org
X-Gm-Message-State: AOJu0YzQaGgLiE9HLrN/7/np638/EHA35mxvKfTefOmhHO5vGuqkE9Zk
	Q7c3ArakRk9BJjL+SMgm+1Nx4On5JqrJO97tX0eymFIJ7cEXby58
X-Gm-Gg: ASbGncvmGw4VXT6qKTmeW3k74tdjowH2eK1URO3GY0sEoNyeRfFC8Pe6tTx1EAfH/qs
	fy5oJQ50Cr9TG8chpsJEgF2bFGJWz1LjYFRQS66/LDZRQbZPEn2daF7+bsBFq2L1f9xBa5yAaaa
	3gTT6oSD4usnJ904j1yEAUilYQSPLUlFR2vUXc1TR2dqNWNX4+NMvgCRaR5YkrDrEEQk04grhhh
	L2Qlk7mSgXAFy4VT1wrb1BcQ61G2CstLhWojpJwpnbyC9BB6PcEBSHBS9nglGMmxYQWuhwE/D2L
	J7bQdc6ilyQWviV8L4QUv8QZEqn8tefo5an+1tksnYnSNwv68ygxTDQeG6iULWrIvHMQ6qu3rqK
	3Eps=
X-Google-Smtp-Source: AGHT+IFS3943lenVZZ8F3Rv9er/EfJngMgScjrNWzlOZgNty3csF8GqBJtNIJJuQ2lTosciCzIcFdg==
X-Received: by 2002:a05:600c:5ca:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43d52a8ff36mr137475145e9.22.1743000016374;
        Wed, 26 Mar 2025 07:40:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:15 -0700 (PDT)
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
Subject: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:45 +0000
Message-ID: <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074018_483790_E7762069 
X-CRM114-Status: GOOD (  11.19  )
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

Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
defconfig.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 11e7d0ad8656..c7b41f86c128 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=y
 CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
 CONFIG_ARCH_R9A09G047=y
+CONFIG_ARCH_R9A09G056=y
 CONFIG_ARCH_R9A09G057=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
-- 
2.49.0


