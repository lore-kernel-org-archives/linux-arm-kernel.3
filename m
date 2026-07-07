Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E79FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=; b=h7hS9AEVBxEPgjHtGUHMzgSPkq
	0/kBV/1Ym85v7IyTINQTK1tyS2IQCneogZtZeief/frJE/9Uy/zDY3lXCg2xm40GUnSYEUMZ6oXA1
	rUfH03/LUUv5bt0x4h+ISEMhkTCV4Z/hUcXEkVq6GpkC7spoywLz2nx09zOGGi/Tn4Rjo/yuSH0iK
	Ac6COciFeJZCfnIASQWIc1FH6IMlzy1UarqRJVk8XxdWBO/yQ9EFTUH6inB/+YaT+pHoKDxbSrzTu
	/CCtk0IWZQ7+bg2tcZezwhqhHaK3+aBifGL6oZWfRGZfJQxR6vsY8K3ipnzFki/pWrZZm9e3M8TbK
	omFRJqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Ya-0000000EMPD-2W4Z;
	Tue, 07 Jul 2026 07:49:28 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YU-0000000EMKA-3p50
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:24 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-381891a9525so3598470a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410562; x=1784015362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=;
        b=LH+7pPx6eHz0oRIdYwrmdCX5WvQPVcN8pUvBUXvViy2HxooPfcO2ZGQKjKJutERE1F
         o3QJxTZBNb5jPe86NPNajAj1hRT0M9tsYqUFeHxEqZCIhi/YzzLjSrfMJYe9qcCFZusf
         gxGng7RaUIojgRgyqfjhBl5ZaDH7gDIUCCoxonPJr9oagDEytYhPA69oS+YsV3q2AHos
         Zo2RkktEO/In7Ai5HV3Ulq7hYDwkUDDt0Vsj7zwVPogfVe2KJ7OzlkANMx3OYGEMYvlJ
         dVWN97Ati7rXlv1aG0w2/490rUtChjOk9/AncoX4rGx3xFuTJTk74Lp0A1H3+GGmgdJz
         qePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410562; x=1784015362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=;
        b=W0YCm4TzEv9kfbXG1BEZZtRFZSYxoWFFh0JXyG/LfIA46XVO59kkBxIZFsL5SCTJ3B
         p3REnCaC9PCbv/Alq9csZ48I73a9xAr7fRHwmGjfr5u7QrCKkg5aH5ZpvviI634taU0E
         xkiGBo+5EGX++9opkpa1ENAfQWuw2X2Nm0G5VsoytNNf3ldBXcu9kFRHQAXOymXWz/fE
         N75JNNdTmiN8O43BXNrpzKX+Jd4yxTsLW05Pwb5MiUIkjsHZ0XU/ZSSxeO6tOtzXoKmD
         OSaEo0VTfA1KDfqyUUQbfOOtKeAZMcGGuy7aM+3a6MSJvUnocxAzQIR+DFx9sTqggAvi
         ur+A==
X-Forwarded-Encrypted: i=1; AHgh+RpIYY3FNrn9DBrH16kQ3uGZ13oZ9tWEDXxpPb5i/QyVkrgcIg0tvd6UNFvjh0/tXVxbWOhZMrHfu1M5pDDIMZG9@lists.infradead.org
X-Gm-Message-State: AOJu0YwTNT7Jvm1smGXAYAs0TCbPV8Fw5M03Pg4XlsB71e8Hpz3NSCP2
	wR9/x24KKWU2s6FrAj8++4eAjw/VBryziLgJhvWM9xmqQdsjtYEisdlf
X-Gm-Gg: AfdE7clkJfdhZe94yQpEDugSMht2p0RGCwfP2fcBSWqoddt939leel8HMcoqQPT5FZi
	1UyN4CZyXS53d+go4HxMWXZXBAKTFwR17+oEr4sAduQ5G7obT4JFC6rHlhIWuqrOtTAVMN/mo7O
	k8FllIE8erGvJOz8yP/UuYwMrCWfvXuslChcrPyHyVLIWdgwvx8Wsf/Znw55nil9ToKDwnkBESQ
	HLXIQQKJjE3yHXNuN6dKvTo2ieIVDpUyVAiiS2fbejOvMbh9viZzxhi/YeTLZ0FMkjNHQWF8ZZg
	+LIkhfgHGeP5ddO78VSjUbUPRns5rESE7Hf46OqxBldiErf2NGuT8isgY5CNrQCN0EnvnTy+t85
	Gl7LOdVnsDjk1n8cMNysOMzCvx5dEwftcLF4ytQo3lltFLqBOJd6xY6GitMRwHZEKSNyiuwxJ/u
	S406tZGft+mGGHvckxn6W6Lg1lP8jAcClyT65TxtTImtWb
X-Received: by 2002:a17:90b:3d88:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-38755573768mr4083401a91.2.1783410562030;
        Tue, 07 Jul 2026 00:49:22 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:21 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 2/6] clk: mediatek: mt6795: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:31 +0900
Message-ID: <20260707074839.240676-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004923_099821_8F214A1F 
X-CRM114-Status: GOOD (  12.97  )
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

clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
do not call platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..239a3f5e1760 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..914bb069aa85 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..27d0ef7d7b2f 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,8 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_composites:
-- 
2.54.0


