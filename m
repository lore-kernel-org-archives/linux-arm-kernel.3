Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E388C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r3mxHe+i3LeXa5yS0z4WXJRqy9ymNunl85KS8e+g9o=; b=tad6y+9R6mX+6QqpLnahMJzEGh
	wkU8Y09aqGgxlRaDyd53kkhOQc7uIOciL2odZEgIbluBzhR0f2wDbq4r6k6oTDx/p9M7w7gjf7rsT
	NB3rZlWWu2Br2MLgZ/JZtCGA3urIMmAeI7taKhdaFYL8T6rHDYIjygt1CqyLKqZZebRxsrHMt8H2v
	lgZjK5c9VJngSOmGSdMwyqTP8RSBD+3PlxfFeQxuxc5J0AsWd2hnMTxz/dwYnafY2j+djZ6LKsOYv
	03CCfzWUMl2JiokKDUjCMHeE4DDAAZNYyRMu8GUYHPdcqkVk47UxVpMxZnq8dD2Ke0KBUJlpIfhfh
	V9dYzdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXk6-00000002RUV-0aoR;
	Tue, 01 Apr 2025 09:17:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXVX-00000002OwR-35KS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:02:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso2284666f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498126; x=1744102926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r3mxHe+i3LeXa5yS0z4WXJRqy9ymNunl85KS8e+g9o=;
        b=hmgrBmXQIYvVQpb7z4/EIEWJ+q9ygQI7otiLEeWULa+vOXibX6FFClCLItWWKrDYVP
         PzIs0yiAvWX8yywt7dG3OEkUKf+VcxOt2TEBECZ9ONzIcpC8x5ZIfzUNyxLm4N3PzcPY
         ILSz446nAXD9sZ8fbavBIkZwQBWRvgWEswCJUB6fThVl6kXPy+mMAsX/6T1Ds+SgS5pF
         lhnPz/u21WsrzILcUsC3ZC0XelvSjdZoQXyJLr5TcJ/kh/4jUsyfh9wGLKmr80M9/D9f
         9oa3nVBolqXZrmI0hlImcPaZiVsNuBJ+6o2SZSc/ip/tqQjOPvZQu38qFijsYL0cf0Uh
         QhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498126; x=1744102926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r3mxHe+i3LeXa5yS0z4WXJRqy9ymNunl85KS8e+g9o=;
        b=wG7gB2v3h6Gx7Kt9xCKoKkBb5euyNWH98Z3Jcn7Sbg+86ycwsvYv/kN1d8n2+iNj0P
         /3bL+f1bwTPlG7rXRoxQ2Wne/BMqofXgVDJolvB/tk6t9XNzaVKxLuqlB816wLcfLoDx
         XUuscguQbPPWoIakXRsWGInsPiYL043eMyuvM4MFa2rckYDcNFlkQMJurm+XHwqPL/h9
         pG3XmVjaMzdP5R98ZMQae00UpoO+ONBV9zV9iJI6Q6s0jlloZlXuwqPPHsTm5nTwe1y8
         CdVP2PyLAgm6NXfW3WUzQFfmsrutkNWZN5UL37eMx8VsbY7D7uyRJvuZhc9fT4Le7sRT
         F78g==
X-Gm-Message-State: AOJu0Yxl2DoaOfdYQ2cdr3E2CSUg91AYcFhNhj55vhj6vHAQ6gstWfzS
	1wgCAFLdzA6iVSBwCJdXBoG3TyKIVyg8sK+wxUhz/kzD6M+F1C1W
X-Gm-Gg: ASbGncvPjFc3KMt/vaxsZgmJM3y7QPkVAtOKK6HCgBIPHXP+tvig7Rv1jKn3IAjnCan
	+fT33Vxw8XJpGyl/BaPo6zi2jhlL6U5lijijOX4Eb6fljVXC48jfkwcqTsq3p8PTM0S8bjn1Fr4
	EOKsv35OJru6UAHSCamlfLIFlnrA/bvv+fzYY0BBJp2KxB2SnpzI1l6+uq4As7JsW2pwznnCuIW
	DNL6ytOUleBarKFJAT5svYc4OlinCw1b3oF0wG8rEw8/lgw1LhQDFFnUfD/nxlPHU9ic1mBSkiI
	G5Kf3WNCIGiaGrowOLli8814CPaKc9mgk6nRvrORqU+4JMWnElnZ8r1AwgpK58EGfbMWhr+U/CC
	AZvqe
X-Google-Smtp-Source: AGHT+IGmKFvTg/yofctMdQrb5S0LWZbbLHd3QbiAYm+NG01gLJytZaWUloiGIY2dPZesUFUEoFfQWw==
X-Received: by 2002:a05:6000:40e0:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39c23674872mr1516570f8f.53.1743498125946;
        Tue, 01 Apr 2025 02:02:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:05 -0700 (PDT)
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
Subject: [PATCH 4/4] arm: multi_v7_defconfig: Drop individual Renesas SoC entries
Date: Tue,  1 Apr 2025 10:01:33 +0100
Message-ID: <20250401090133.68146-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_020207_998372_3F10107C 
X-CRM114-Status: UNSURE (   9.78  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

ARCH_RENESAS is already enabled in multi_v7_defconfig, which ensures that
all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
listing individual Renesas SoC entries is redundant. Remove these entries
to simplify the configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/multi_v7_defconfig | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb..28a6ca750861 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1121,25 +1121,6 @@ CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_ARCH_EMEV2=y
-CONFIG_ARCH_R8A7794=y
-CONFIG_ARCH_R8A7779=y
-CONFIG_ARCH_R8A7790=y
-CONFIG_ARCH_R8A7778=y
-CONFIG_ARCH_R8A7793=y
-CONFIG_ARCH_R8A7791=y
-CONFIG_ARCH_R8A7792=y
-CONFIG_ARCH_R8A7740=y
-CONFIG_ARCH_R8A73A4=y
-CONFIG_ARCH_R7S72100=y
-CONFIG_ARCH_R7S9210=y
-CONFIG_ARCH_R8A77470=y
-CONFIG_ARCH_R8A7745=y
-CONFIG_ARCH_R8A7742=y
-CONFIG_ARCH_R8A7743=y
-CONFIG_ARCH_R8A7744=y
-CONFIG_ARCH_R9A06G032=y
-CONFIG_ARCH_SH73A0=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
-- 
2.49.0


