Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273F6C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qJQtueKY7DcQgS7lfvQ6xWjiCToIdui2BYDzzrpTxG8=; b=EULzOWZj/AVZBB2Mtd54pa7g2B
	ksYiWUH8PTqxJqKY1b8xyKF+BfS5xz+dEM+pzegQM7Z4y7OsZIQ4dBJ0Oj9l93YPWO4dCyctahVKg
	nICNSAMG2jsAuwNO23xuNoTI//E0C8rgjdyjMNEUtRqFou7nQ9ixIqIzIbLLmAykXFy2nNc6ADZIh
	1ZAzDQ/DxkVtNvu9rjYP5U12E7yg/4bbJYNmGHfgweT/eFr9/UoN54ENM2CEU0HqCL4sQ3adM5BAH
	+pUXJuJsm5GGddttvlWH9NuHcG2io7ea39JWZNAP9g1TLmmnSFLAt70Mt2jlrh4AXae8jCktBrCX/
	UxPw3gLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp08B-00000007I8k-1pMO;
	Wed, 29 Jul 2026 08:59:15 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp088-00000007I7v-2KKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:59:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso429964a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315551; x=1785920351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJQtueKY7DcQgS7lfvQ6xWjiCToIdui2BYDzzrpTxG8=;
        b=M+PqA0Syof8n/grD2nQJIwwoGg6vlvV9iwCg+KDETBVgumqY7o7qYoTUNhq/M2QtnG
         aAau2GhfiWFBZjjWsDnawGwlG1GvBQk+PqGodjfftyRsv3wd9d94I5U3bRTdR4pjMBCb
         96fzvoe0IjEQV+lr9HyKXeacTE9OZon+wMGQjZkOEx08XKhBRoKyQvKX15ytxRKsV6FC
         TYBihFPLlSRj2AHm+vNNKa+cfFMbbZjwl4YvF5Z9kzxLRzFnKIBSBGnWQAhd4QMzfmRI
         1EIKo8geGEDzi+im07+xl70l5JQJyWqUBDATiaDDvkkAAPFepLf6K/kT9Zo7YIk49DBn
         fnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315551; x=1785920351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJQtueKY7DcQgS7lfvQ6xWjiCToIdui2BYDzzrpTxG8=;
        b=if5HGC7vph8HPup+aMr5zANiIZA0c3xlhQhQ0dJFJa9YLFJFm2gAS6kx/m4cltsGfX
         BowJMdGVXEsJzxGFSH1ry88s9AuXcO5W52bPi51vqz+Mre1iGaLPTEjWm/JtqmmAxufy
         HDtv1syRKRIFde+tYSlDVc/aOfcCwhG/NZN8aoxZd/l59ZwpbzWNimKbwGDXSexd2QRy
         6lXPIXqd4B0f9tUZuAexyLZVVnjFyrOv0HccRlYwZT2xSuwxw3uBmm1YAMrnSn/oS4pZ
         /3pCv4uPbd3W2AjDfKYIwY0EcB2SMT4gI5XRedg5d19mSwnh85ZBXEg4cUDMJCT5zJaF
         GRgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjFifiMvHguydNki+vjne5x3SAoGKyeQDkmqKf3YMZAYOSYH/7XBf0mO+MbKiJdy7JOU/zUxG8wZvTdMRYSZb1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5GQmtleLSgclJ5IDjUz1qazzodhQUq0Jwdrr0ECCjAC3kJwLr
	CLc0gZzJIPNtbKcg5yUHc9qWrwhVRg8uAlTg72ybQezfZOkNCe8tuzmU
X-Gm-Gg: AR+sD12EolcV7ZF+/Q83NE3+K4NoM9rJyco2MDEwF4FHII1QNNws9XS5gGGYOeccI9t
	DVwuTigtUHj6kbNaTbKr5NRwp1QAlXjt9dZ4FwbCN68h1g5UoCNwB7FD27UQZu6jONirkCl+PmG
	HhnTUe8rosC7tDSmHbEWuHFIL4MNwcz2EWEW4WsiNl/EfoNDkXG5tmMXbO9K8kT9T+03fiKf7Rv
	A4mM4nNGr1YJHh9UQKTBvgBwvtjkTUkqXOH6dUdMYklW+uX3H6OofjToGXVLTISHr9IBONwSZs9
	glQK0WxuV+l3Uj+UR3GAh247F8We2qT4sURoBqh/A6BQWzUUIHBI8I6A9zAVHwNGp+zcIP72T2I
	+Eff6hHWDZADKZjO2uJgCWpxme5h/0P+26LT9m8y5wEG5z33Dq0S2Pcf0tKmeeYcvx2+JnThkEK
	+195MQiVHea1F4gwRPEHJStJiVd3EoAAPAu7ZVmybDR67ur5wF4b/28DBX+pDFY7/jN8C3xljhj
	21z5w==
X-Received: by 2002:a05:6a21:7113:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c8ba5eba0amr7062835637.54.1785315551272;
        Wed, 29 Jul 2026 01:59:11 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm8179352eec.14.2026.07.29.01.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:59:10 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 0/2] nvmem: rockchip-efuse: add write support with VQPS gating
Date: Wed, 29 Jul 2026 14:28:54 +0530
Message-ID: <20260729085856.226001-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_015912_594875_974AC386 
X-CRM114-Status: UNSURE (   9.82  )
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

Add RK3399 eFuse write (OTP programming) support, gated on the presence
of an optional VQPS programming supply in the device tree.

Changes in v2:
  - Replaced the rockchip,efuse-write-enable boolean property (v1) with
    a proper optional vqps-supply regulator, as suggested by Heiko
    Stuebner. The supply presence acts as the hardware-level gate for
    write support; the driver owns regulator sequencing entirely inside
    the write callback (enable before A_PGM strobe loop, disable after).
  - Removed stale debug dev_info() left from development.
  - Fixed checkpatch: removed blank line after while open-brace in
    rockchip_rk3399_efuse_read().

Link: https://lore.kernel.org/all/20260715110107.409204-1-hrushirajg23@gmail.com/

Hrushiraj Gandhi (2):
  dt-bindings: nvmem: rockchip-efuse: add optional vqps supply
  nvmem: rockchip-efuse: add write support with optional VQPS supply
    gating

 .../bindings/nvmem/rockchip-efuse.yaml        |   5 +
 drivers/nvmem/rockchip-efuse.c                | 178 +++++++++++++++---
 2 files changed, 158 insertions(+), 25 deletions(-)

-- 
2.47.3


