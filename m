Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428CBC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wri67Ds5kiCiIdkC26EEYx8SzSTt/Dvo3KGL2aYUzYg=; b=ukW0KLITj52ApIGFBXfdFkOodj
	jgpfp5koAbTsSqTkt1VO85r6Id7Tlty/uMIbRu58w/22l7MZQgFTu+xKyJPreIt5LdoHTD44Oexo/
	U2ngLIWNVkKWpaz9LrWftNFssUKNUNkFPyvJS3DpreodAShIcz1doMK72SbWOQ0Y615WG3V3Om1zE
	y4zUCSrra1NyuR670NwfzClin4vcW2+VpKU0VVEZ7Uua4AUJrbLOJeph3a0ca1il3fr92ly6fYF6u
	peoMVXeRfo2mUTQPn/Jao3q1A3CyFQi0z0Dq1fE6mi3xhDLIO1Jz4zGTZICUMGLBiDr8lS4D294px
	EJqYm5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXgb-00000002R4w-1FMP;
	Tue, 01 Apr 2025 09:13:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXVV-00000002Ovc-3aB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:02:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394036c0efso35076065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498123; x=1744102923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wri67Ds5kiCiIdkC26EEYx8SzSTt/Dvo3KGL2aYUzYg=;
        b=VwuUpOWHIzDN3WdQJPSQKGDNq2TY+KDprs2GF01ahGMpAQAVK2TXm4NO4ETIykWyJG
         QsKWZY10nieuXSDFiLw3oN1f5u2ZEAE0zPrffO+L4gkcWfv++2tsxHaZTQbR1vdgs/V5
         GFJ+sdjrxDwzGOelgRTPY+DEp7qjDNZX5crTZNmtGQeBkUCtVLbv3rt29bqwg/+dfUu8
         0XclSOH9ZUZnt199DnZZ9qXWFsFB/jnIwTZPxF+KnH+x4m/R6wfBs+W2VDGMu05w48bl
         c8CyHM8cyzxW4Rb95MYWlrnmNXDRnXUCRAJxgtFK77xqseqkWu703t3HIqa5RIQ5kw86
         lnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498123; x=1744102923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wri67Ds5kiCiIdkC26EEYx8SzSTt/Dvo3KGL2aYUzYg=;
        b=URqXCfOj/ImYYLEgOhgmDkxH4ZPdxI0tHWroDvuhsmdUmxrO5xgidTK6rBTzp3nCHM
         9uRmX9Z15R7QkpBw7KpacLdns1l5JCY3Fy4jlzSPSAuj7OBmmHKGyRO9EgxJrzUloHGK
         UKaBS8BFLxmvsHAUESHRv33+YbxDG5P+y09EfJrDWgI0lybqbVQQ0pBthyRvkzZ7cepW
         5yzKxiWGCJWjfcT1/Zvn6lQCAjThLmuUQOM2aG5jb0/T1y/lPRzoNmGdSsdy4JkL7I8M
         IBPB9yu7gGUgFGS0hsxLP4rylSA1LbpbtrKLQVh8OCakY0tkeja/SqlKjvfeZW0Ad+ra
         TaHg==
X-Gm-Message-State: AOJu0YyV9gd+XR0eSMTl6oPxy1LwXqxThOGoMWi2+5ukwkggri59dthP
	mN7jMVF8q5mzd2hntW1rNCaJTO9rkMiM4kfomSSWeutv8emKgjk3
X-Gm-Gg: ASbGncsjt4TAy3vc5Ox0tFOdUCXxDjqyARoD7fLRHQmWUoWBnJhWoViy/9IX7oz93z5
	JKRW0g0r75sslp8Xms+QutmTTWiP+014PE7qJ+MIyNwZAapnVu8ODKnBT22V3BIcQWO7g8GGb/N
	hkrLIkPgUg7CKERKOnJQgwEjcowEUhFhTOopRr/ESaZfzInfya+A1UXnsZdmufg0OOoow1kxU65
	Lebsd5sp51LDJ2rVxdYz6Y6TJeFQcUZ+B4fAsI6hhoe0MCbZrU1ImhTOPgmliaDaoEhSpUrcc7y
	hAIxee0rzfi1voGHw5kC+A+URi6iQZwEEJ2Y5qvlgNTSfPj+uL9lkm9zR+86gsT36k7RjA==
X-Google-Smtp-Source: AGHT+IHnMxzA/8B1PiCr/qwFvdZvG7nBK9Fo8jFLt/kNwQbm8ABV7/dfU79cFcWveKYMQPUNsgJlAw==
X-Received: by 2002:a05:600c:4e12:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43db628c48bmr96989015e9.21.1743498123327;
        Tue, 01 Apr 2025 02:02:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] arm64: defconfig: Remove individual Renesas SoC entries
Date: Tue,  1 Apr 2025 10:01:31 +0100
Message-ID: <20250401090133.68146-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_020206_441222_880C2068 
X-CRM114-Status: GOOD (  10.12  )
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

Remove explicit entries for individual Renesas SoCs from the defconfig
file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
is selected, and ARCH_RENESAS is already enabled in the defconfig,
listing them separately is redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..5494b8a2380a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1474,29 +1474,6 @@ CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_QCOM_APR=m
 CONFIG_QCOM_ICC_BWMON=m
 CONFIG_QCOM_PBS=m
-CONFIG_ARCH_R8A77995=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77951=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77960=y
-CONFIG_ARCH_R8A77961=y
-CONFIG_ARCH_R8A779F0=y
-CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77970=y
-CONFIG_ARCH_R8A779A0=y
-CONFIG_ARCH_R8A779G0=y
-CONFIG_ARCH_R8A779H0=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A774E1=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774B1=y
-CONFIG_ARCH_R9A07G043=y
-CONFIG_ARCH_R9A07G044=y
-CONFIG_ARCH_R9A07G054=y
-CONFIG_ARCH_R9A08G045=y
-CONFIG_ARCH_R9A09G011=y
-CONFIG_ARCH_R9A09G047=y
-CONFIG_ARCH_R9A09G057=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.49.0


