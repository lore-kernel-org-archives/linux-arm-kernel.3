Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6182AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZWRhCcUrvPvTTZjoxUn5wLx5Cz3X6hhXARWRFQg4Ow=; b=bnySh9rtLFLJiLGeA2JIdsIuQj
	mHmEOXKljPjVwHpxEzUkIvvE7efpNb+7cTcdDq0SY18fktV0Akb7M8pWEUxjXwzikUXr2PsNNVBVy
	MXC2tMLoC0z7okVS3vZGukCKoL/OwbIjKuXNym0VH0Hgd+MKm1i6m7dM+GgQA88+6cnS1LxZb0B2q
	9n6Uqe7WD3VvjtHZaesYdjvVMAE+HIWLiNeODzB2xq8ZpEyviaOMUciV9xoS1vSC19bZAqdT1eTrz
	dFSfgljQlFSo0oO5p7AAS7AFvkB1aY3C6RNx9Uu91Wgb2klp/PKjCf9FGwRZI94tzUa/UiG8IeeGb
	2iEJ1g1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwGB-0000000Dz93-3ILQ;
	Tue, 07 Jul 2026 03:14:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwG8-0000000Dz6x-0KnA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 03:14:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so3792908a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 20:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394047; x=1783998847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZWRhCcUrvPvTTZjoxUn5wLx5Cz3X6hhXARWRFQg4Ow=;
        b=WL+XI020wgM7W7f8NbX/QWXuDuuliyLnHFnwbZY9XrltGiabEjmgixugYxKw0UHb9p
         Puhi7sIfu0YsptUAaziII3EGGo83DgrkNBivggYa+VVLHcMkfFxgUK1ZUYUObCAi8XQ7
         NpIkAFjMHaPE7syzCfswaw+SHEuevVjV1nj7zsoYPRvNtw3VVSM+N9wcapprysFcBwe6
         4hRxO2Pt6f25YqQstFPhrOYM8nZZxE3i0xAi46qDuBJdGdBImv88ogxhZzMztjwSPHMM
         8TVmrSgekwl6jTeUkmH0bRyd+P9VAgvhRFFsDrkfQdiZDZ1SNvW0brzR8YVW2QIEMf73
         w09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394047; x=1783998847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZWRhCcUrvPvTTZjoxUn5wLx5Cz3X6hhXARWRFQg4Ow=;
        b=We0uYugVznNuzAQ+sSs9cnFe3aLueVt8LVlD8kkIhp7pXQtV+lCoLAoRoUiOGrDPua
         iASrnxPPSvAzPGoP4JzcmTw/eCwlzhpATymUCrgK3Od026b5w34X376bh4+iENkyXerR
         Rz2z116aumvyTZ3h7hN/QCCD1WtZz2iDFVh/j+U/RVXif4gtZ6vz/wCSY17RYGkSLHSc
         CH7jFler184mdISp9BAb4FEQRbGvUPBrtQ7ph16bAQ0T51w4r9RKn3rlrbrDKO4SMGct
         osy+Khg+vMqhfK/w9zwEN5Nx+6ipYkfj+SNxYB8+sOn1Wsm1H+c1y5fQ0Y17ichyDvWu
         Z4Fg==
X-Gm-Message-State: AOJu0YyreynzpwnazH9Y4a3dlEu4MK+YNLkKoND4uBfDB2Fa84ZxXkPd
	EQPdbiRInY9V1R1ywZc4Maze5qDm9SUyQf+h279mYzQf/bVsMk/N3es3
X-Gm-Gg: AfdE7cn/cbDFetiEBieHQvwlHTGZA10vteiagofCccHAEchVf6+GBL20KyDJaUcJ1iM
	g1zZnZ/tl1qJiVP1mezs9BPeJ1BLyPqJfl6xd/F716LGox1gB34dlE6ExTqEP1OKtbenNBHXlU1
	Dd+gLv6YVdTCuFgUr5TT6LjQiKlKMak7BRbdTUlj4X3qiJoXi9+DImgHfBI8CjLlqdPup6uEtFE
	pmwz3tV+eWLQ3JH2OwriQnr+vwcEM0u74Ryuxphfw9yfe9ZHVVu1FSa2SorQToBtAPcsoWXMNfg
	/lQ8MWodLEJiZNM2V3p06d35QSzc1YCYzDlQ9hMI31mmPKAakFqlshCsnntjJdxZWPRKmaBth4y
	fQcxCOI7qehgd1rzPGruCzB/FuA7w9ZBPzTvlvPX4DL/WsPLneNJQlcYq2E8gUbAVwjgL0UtZV1
	VEkVVnkW6Y02u3C1pAy2bwi+NBFvdx/dRVY4XBz6P19L86tvrKgekagzQjcvUq9e8rLSJLD2ZBv
	/O8sz9/yB8pzkw=
X-Received: by 2002:a05:6a20:c996:b0:3b4:93b9:2b91 with SMTP id adf61e73a8af0-3c08ec7451dmr4414105637.12.1783394046925;
        Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:00 -0700
Subject: [PATCH 1/4] gpio: sa1100: register software node for GPIO
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_201408_125815_A0455147 
X-CRM114-Status: GOOD (  16.47  )
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

Define and register a static software node (sa1100_gpiochip_node) for the
SA-1100 GPIO controller during sa1100_init_gpio(). Assign its firmware node
directly to the GPIO chip prior to calling gpiochip_add_data().

This allows StrongARM SA-1100 board setup files to reference the SoC GPIO
controller in property entries when converting legacy platform data to
software nodes, resolving pin bindings directly via the attached firmware
node without relying on name matching.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/generic.h |  3 +++
 drivers/gpio/gpio-sa1100.c     | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/generic.h b/arch/arm/mach-sa1100/generic.h
index 5fe0d4fc0f8c..3cfe3b647711 100644
--- a/arch/arm/mach-sa1100/generic.h
+++ b/arch/arm/mach-sa1100/generic.h
@@ -48,6 +48,9 @@ int sa11xx_clk_init(void);
 struct gpiod_lookup_table;
 void sa11x0_register_pcmcia(int socket, struct gpiod_lookup_table *);
 
+struct software_node;
+extern const struct software_node sa1100_gpiochip_node;
+
 struct fixed_voltage_config;
 struct regulator_consumer_supply;
 int sa11x0_register_fixed_regulator(int n, struct fixed_voltage_config *cfg,
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 1938ffa2f4f3..ffa73dd3b982 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -13,6 +13,11 @@
 #include <mach/hardware.h>
 #include <mach/irqs.h>
 #include <mach/generic.h>
+#include <linux/property.h>
+
+const struct software_node sa1100_gpiochip_node = {
+	.name = "sa1100-gpio",
+};
 
 struct sa1100_gpio_chip {
 	struct gpio_chip chip;
@@ -317,6 +322,7 @@ static const int sa1100_gpio_irqs[] __initconst = {
 void __init sa1100_init_gpio(void)
 {
 	struct sa1100_gpio_chip *sgc = &sa1100_gpio_chip;
+	struct gpio_chip *gc = &sgc->chip;
 	int i;
 
 	/* clear all GPIO edge detects */
@@ -324,7 +330,9 @@ void __init sa1100_init_gpio(void)
 	writel_relaxed(0, sgc->membase + R_GRER);
 	writel_relaxed(-1, sgc->membase + R_GEDR);
 
-	gpiochip_add_data(&sa1100_gpio_chip.chip, NULL);
+	software_node_register(&sa1100_gpiochip_node);
+	gc->fwnode = software_node_fwnode(&sa1100_gpiochip_node);
+	gpiochip_add_data(gc, NULL);
 
 	sa1100_gpio_irqdomain = irq_domain_create_simple(NULL,
 			28, IRQ_GPIO0,

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


