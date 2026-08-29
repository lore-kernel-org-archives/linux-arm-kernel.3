Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63EDC61DDC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGDbub8U4HXvEWoNu7b7TUqir4ckSWpnsJ/08Cf1vHM=; b=1l6RkA+SF5UPFDj4g1bZDfmSZN
	ZiPXkk9VIDVtbs+JsRy9arfRG8f+EMi1kTZzdPOXOGVQ5C+LpaebtPz15eUzSSiS0Ek2kt5e/KVip
	wGkJNlYZ/ggIY6GPBB8cPr+WVfeL/m3sT5rF87QSLkloSCt3kTjmctj3qoFT9IKSw0yzQub26Zq+m
	yjZX9/DrY4yDaF9BxFjFnMp/bGcZIG3wL1ICN78POlkXHnHQ5Hg0P9WQlXFu/6wRH1lo2hYHz1ZnN
	bzQf66mgCCLczFc6CY1piXoGEmBnHGnPYDlRYMQPy7okOJa8JM8Izey37gkBHXRkS+H8/QULt8NVE
	YOwKgW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfX-00000006tim-3FL1;
	Sat, 29 Aug 2026 09:48:11 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfO-00000006tds-3CUr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:05 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1178229f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996881; x=1788601681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGDbub8U4HXvEWoNu7b7TUqir4ckSWpnsJ/08Cf1vHM=;
        b=MWsuXNQO6e1f6eH9oLNpoUUjyD1topcWKmtEmDKD8uw262Lgo68Fc1WBGpBeTk2Aji
         8Ufa46LtloUcDwGRZOFHokjIQeXouKNw8YNzt2t/Rt0XV1E5Zk5sdXvZHJj50ZEvZZ5h
         2TreS5itD36e5nS8nszyRPYmzWvi4nzv5P7DFsxAC0yx/uyoOL376nx+ff08eDOipAin
         1gm28lzm60GsByC4JB3NuZX4hhQ+lTgI7ULRKzkY4M9qAzh5zh4nbc23eszloUyEqAIS
         aAN7DF3XxFhB7mfMn081u5YwwescOp8v/eT6rGOdwsKSwToCItwfA2eeHMw7m8Kvw5sV
         Np5g==
X-Forwarded-Encrypted: i=1; AKwUvByVpv4WupdixAhwFMmtCDwwY4/PvN+HhowKv4jiVLnJm1/ezoX0hEHj/Aw+wGF3T6/NMDFhUqQY4LLGMIwm8KSy@lists.infradead.org
X-Gm-Message-State: AFuF++kOVDqsq36nkWcDLDcmP1wRJiYFGkbGAtJS7KiTSWXm6YTdqf6J
	MUrDNREGgTt+AEeIKkRzD+XQrwbOjOWGZSuKf8DKCJCIxzwiBdmlIBP7
X-Gm-Gg: AYBFou1MDT6JQmE2j96benMnFjrHigi770jkuNNsshheuPG19v9Ud5wlqxsxlMvNEk/
	MLHMx/zKcVE/UCqQTYpP55JjhskeBKasLZkkLMraqauOqGUMiZ1pyVGvhlWMNDiyTxVlJ7oKFDw
	3XKdN/6/UfMVmWsJ+jt6LOpNJm7idyB3c35lvkmymKAy0YHDRJljAWZ9MMg9jzLx2cnsOIv6yGi
	9vOqzrIHWF+eO9clnfRQXlILYOyUHZ1KTsBCI0fb+ql+23PLNWsO0BP4uVEICDwCXgE4i/goxc2
	wubNLVkyi58aDJWuCKpP0/UzDb40xVdmSKS085VtztMQy45LOtIEOxLgd/LmzJjBEaU4jKtd+O8
	thQ5aNqgTm0T99heOZbLFpRl8XEhuc0ROejztao/a4tB6aPZy4nbOU37Tsd3ZPdCUGSUhCfSQ3+
	StJxR+N7YzlyyShdtu8JQjzCwKun9iV9OQQnPZXZeJ5IAoZOOl/I6TV3JV2N9tPgCnaMUBEyuFQ
	LKLAOPwdfQ+w4R6+vWddLnVrss=
X-Received: by 2002:a05:6000:2207:b0:484:3310:f398 with SMTP id ffacd0b85a97d-4843310f455mr2068417f8f.25.1787996880459;
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/4] clk: meson: t7: keep the memory fabric clocks running
Date: Sat, 29 Aug 2026 10:47:55 +0100
Message-ID: <20260829094758.23248-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024802_854432_D98F2C27 
X-CRM114-Status: GOOD (  11.68  )
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

Four clocks feed the bus that moves data between the peripherals and
memory. Nothing in Linux claims them, so they were switched off shortly
after boot, and any device that started a transfer after that point
simply stopped. The SD card, which comes up about two seconds in, never
finished reading its identification.

There is no device these clocks belong to, so mark them as always
needed.

Fixes: fab4d651b592 ("clk: meson: t7: add t7 clock peripherals controller driver")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 214db7850d86..55d09e78593b 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,11 +945,16 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+/*
+ * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
+ * used for DMA between the peripherals and the DRAM. After the clocks are
+ * disabled, a device that starts a transfer cannot complete it.
+ */
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
-static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	0);
-static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	0);
-static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	0);
+static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG0, 24,	0);
 static T7_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG0, 25,	0);
 static T7_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG0, 26,	0);
-- 
2.55.0


