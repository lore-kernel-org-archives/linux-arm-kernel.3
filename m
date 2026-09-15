Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943EAC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlZV+gDl5kHNbM3FapkIWa6VkdcZp6BNeCy2FJirDI8=; b=fbl/LurpNj52lRwR6vgy/k8wMb
	T4fPusHAqDItPlq4LSokBgDFfKAvFjg++PZFuPMwAPMCiot8DHqHf3V/hQWFxq5XPfJ0gacWLElOp
	wHDPByJN4Hz1W5rNYgUy+Il5Mk+vhkXrX0flwmlV3lNipZtwVZY8nMaWN4av4oALD/tNBA0Y+qld6
	yZboH8gLRCtYTpwxyUCtOqOHi40oHfYGPdVXIdWwES7diBdA1Rf/uFchJa6GIA3UUq3vXfFNnBixL
	u1Wk7467lFmPAempuk4juHDR8Xx3d73+eF0dWa1AW4jPhnDeQ6YIntT8sJ0tdSrIplzNXyMSzsw+u
	VVy4I0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QU8-00000005vhd-0WhB;
	Tue, 15 Sep 2026 10:33:56 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QU5-00000005vgB-15Jk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:33:55 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f560398so23446966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468431; x=1790073231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlZV+gDl5kHNbM3FapkIWa6VkdcZp6BNeCy2FJirDI8=;
        b=WiVw4r/+2o7oqF8frEw5zbIRGNEQ9lu93C2AWCYI5TJGca0YcK1G9VE6RbcQaeEEiW
         q2tt5dEslPVdLMyBVVomvh8DYE0ZpRdH1vo4Y5xq3BeXS5obWt3e7Ao4NNZ4qk1ONnra
         hSyWbiiv12D52TQTMWCX49HXNVr6lBtOrsfOyhS5Bwv/tq1LP/WOPk9DTQEXri4RKJ0h
         ffN+Nj3Jt0YjNuA5EbnuB1jJ8IACfeLWw9M+EQw2hejrwB3LkaPX036QeCgkoejUH93W
         oH/mTc7JDmTXl6oDGtxyE0PrhrhOWRRs+54hS5ajL/3KLGAN8KwWW35oXalDjME0xpVC
         JabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468431; x=1790073231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlZV+gDl5kHNbM3FapkIWa6VkdcZp6BNeCy2FJirDI8=;
        b=bQ+72x/aUC4AZ0VlrvcrcwO6LxTNYuX3TCgZNIumCAljZRddOJdHMk+B6kpv+EaRSX
         e0d7sNmYjcY7bQDkJg6kI57n4KKLIh3nbkoXCEOBZ/7VpsbGEGGx4iPYJDajeXTripq3
         +UGAm+OmbkRfogK2Ira76CKSoxtW3JIcf9Iu43Oh58mKZ3Rl0m0UcxP1O3KeEldaAtDE
         7srhTvBCxQtJraDRzfieU6snnwjzyZZRSboPIoijASj2DYMvWaIszhGk83iviIaN1suU
         DK31wOdzYn1c6mS27XO10JaWW5Oy4L/5QA+WpqNQNc98MqbGfq7ldJIc5tPC93cXPvk9
         /V7A==
X-Forwarded-Encrypted: i=1; AKwUvByZWMti8W/1YzIlyvFwyfdIvDl6K1YL9lOQWIFRv9aCI9whiwqp+K1UpY7VsoOQpXRdoxofz3npPzXd1Yclzx/4@lists.infradead.org
X-Gm-Message-State: AFuF++m4xCSyOQvWFHw8uuBzO9eaCyoxKLJn8ppVBTx1LDkn6hzTfnaT
	nYq2yonY9BEdc55SWzTXeK0/WmeNs4/H5DD7ifWyLNvEy+WI0i6/KYQ6
X-Gm-Gg: AYBFou0NlQ4TzAo8ru1ChDdJjoJDWvFicEs+7eqO+22QPPkIsFxgyBU7gHrF3Zt2/jD
	RR67UtlWri6WELpwbqW7cpSneeTyNhWcVfGSWsyXBMP++Ye7hk7vyXv+21W5kHk1uFSoslSiXjk
	2MEfrgxFe3GuKelxMWc42QDyVaNp2jI4Cs96sC0qJrCdglLxzBEb0L/hJNAdTLa5J9O1HYIRIrm
	FysIGR6WHV4C8xqQWlbVzbYZzCdumOwvQxolGb+q/PA71bkLOelwckR3HzuOEEzAR4t4IHkTVRf
	8aD77W/sL7AvWWYnbI2kdnFqpFgVTeG6l4IF5W7rYztp0odklPuuZSkSlV/oK+H0F/e4Dr6Sp9O
	yDzlPd/KUxuiTQ5Fa5mz5zMCwUMWVXfeMgcq/pqhmwgSKubP2aKdPATTQgdf+ZfdH9PX1OhB92X
	ZaIglM6dYp4nILz+4U4QfgXSKZX5eJjFURUdAl59bz1Cyu2wzjn1mkL9HjKiInM/3BrzKdbVTHO
	Ch7zIoPR2dT8wyYkxh3rW9dvHzHWT0aXn9mT0SwVVkdo0wTTIndBbOCn7nNdSfVsNtqWI9hywNt
	O4WJNH1M4QvZXzVqbu6lYYzGlPaJYo1ASoIqwx2I7kFTZOxKBqqDjUHbox3Fax9SGY33TlVmvRz
	CkaG9Z0XwivNc45g4+ggwfjeN/VjJbBLg7PN2hrk1SnJ8tJ4riHrm8+J7cOYtmUwVKhebEw/bbz
	u9CyU5v4gbHvSSIkP4K5fibsBnUMlRs1mP15h6SnEjKMXvyzXtGKhxhrmdiHRg52yJB6gtWCHMb
	6pVTVb1vbl8OLfjl9oF2Vk1aqY=
X-Received: by 2002:a17:907:9610:b0:c26:2da7:347f with SMTP id a640c23a62f3a-c29d734648dmr49184166b.0.1789468431374;
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] clk: imx: clk-imx8qxp-lpcg: add missing pm_runtime_dont_use_autosuspend()
Date: Tue, 15 Sep 2026 10:33:44 +0000
Message-ID: <20260915103345.1334-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915103345.1334-1-joshua.crofts1@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_033353_322797_7371AE23 
X-CRM114-Status: GOOD (  10.92  )
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

imx_lpcg_parse_clks_from_dt() disables PM runtime but doesn't call the
pm_runtime_dont_use_autosuspend() function, causing potential resource
leaks.

Add the missing function call.

Found using Coccinelle.

Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index f0cf6cf91899..b31903060361 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -279,6 +279,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	}
 
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
-- 
2.47.3


