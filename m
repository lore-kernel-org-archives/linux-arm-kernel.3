Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFC2CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=; b=3I/pXO3UXkITKMprYYv3XKRmoC
	iiOLvS5CyAz8bUdR0pYTf8gh3qnGURd/XxsfAL0+zpfEqDhIL5PIQkzDi0+DASNcOl99fLgc8ca0u
	jatJMAFBHJd6eAqWAS1kfgC9FAV7pzyfMqEFsZWSjixKbbRY+laNkd35bVFrImxnGeR0Sb6QkOKxe
	fn46udr6pKZ/LOdwYymOk7enntC3s5zl3BySMv2TRtB32HjUILJrn34xhask3yLqVEgHdqZVUu4XB
	pjYUmujnKELk5TbG0t+9GHk4w00rtAMIXRVaD4FRAegRfThzwWLMpXzU6o1ArmFZZluWosy4xMcmD
	L3YXPEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGu-0000000DG6l-09HJ;
	Tue, 13 Oct 2026 15:18:32 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGi-0000000DFxy-0M2T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:23 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1063894a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904699; x=1792509499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=;
        b=fZqk8GaQVFidHZxJ9tUM6jAUMHEV51Gsz6FwohOhBL6YQeOjDVIbyLQBd+5zCqVbGw
         /LHkp8hmP7vlKVAJksTAx/QaXGKdEZT4AgXuptaIJ+3f5fxVR0IZc6eeSH3WxZtQCzZz
         fIGJNPzqBOFbUMtuMy10MGeMQvMcLJp6qW0jxLWXy6Ap8/zWR5SROzizY8GEO5WbTJr/
         SXiLRxztSNrCG+TawJqRhBsCBMkXvb0VIf3cytmDdZ9m4Azo3l+Fhlnjn3GSA51x8r76
         alJoacofDGFDy4CDm3nu0hACZePAq/1tbs+QYJIGBpYBfKitm36vk6Czjxw8er855ZzF
         N+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904699; x=1792509499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=;
        b=hGNNcY3iPjoJxDDI+QaXVry4SXpDUdE8fTtfO+GBztx7QGzQxgRTnFAeZqY7l1swDq
         rRoefKLVDPVXahskCGgQ/mAU8cGkARqA/X2X8oM+HIcVujRXttv0hQPctgIZ+Vi02bN5
         98EngNElOD4eHeqjbEmhecjwghbiqf164RD9L7jTJIAdEpdIpOzVgTkPXyaqnnh8HQV8
         5bNjJgsY4nbSeTMGjFieJnu+89H1RdVbRNZoaTHN6WzNOZ/QgrecHOJP8U6le87p4q09
         CcQROMGofE8lNceoi2GweS7XKHXUCUMWgiBNdnSgOSBcDqbITSbAUycyc6eFwJpKA2DK
         DJWw==
X-Forwarded-Encrypted: i=1; AKwUvBxviSz9F5uVQdb6A/eVgxyL7VhgVxhEz0sEoSTL+Tu5sSXnvSt6sXofuxjc/ANscNLGA+w8mRi9dCVIVPGOoDZy@lists.infradead.org
X-Gm-Message-State: AFq9FYIgJccDkbbLbuUlMldQefG5h4eidXwHM9rHpi13+jYkWl52jH7M
	DLMhGeQ5FyLSAzXPu9wbjf0Lfc/jzv9d65MXp5yZtUdcDJJ6oUIRVxr0
X-Gm-Gg: AYBFou1ule0TqgQQhy6oVVv/RKKxzM60Ajv+k6Id4mJcNWRDD6kELE9/9GUIxEwn4zI
	Wd8aBGpyz6KcvyVWw5GqcHHcBBoFkZkKcgaV7yabHhmj07F+3wgT0qIadZ+RC4yPiN3EGPWKXOS
	UfCjgtjEDnGE2jFwtHtcW7MDmGZQIpwNJu0VdRRnzAifXLswMvk0POwHYWQ/FI6ynTZ34w7jOC9
	AbavH++HOB6fl7JfEeDY+tCH0PlGCOWxfXUHIizqsibOwcTQn885lZe5+23wpiTVOEFcbnCyhkO
	FPjEnjVK1/UUgD4X5d/KzLHzCNyPBcAFpCMxEmUU8mHuwK2Tvp4uVp7V+0ctMcfw3tvBKwGFDo4
	/BbydJdtOukul4Uijdu7F5jLCywzHj2yxLstxfjDeJFKMpCoV5OebVEeM9+HbSt7t1kI34jCQre
	t7rq2Z/ZhEq/ckR0RzNn6H0/7XBYpDVhODRfeiB7doJpPQrScqaYux7m5H2LpDAkUftywTiSMeN
	o3qD4Ea752FcnuuoseDGXgaKzRN
X-Received: by 2002:a05:6a20:9c98:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e1c04b92fdmr2161022637.70.1791904698979;
        Tue, 13 Oct 2026 08:18:18 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:18 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 04/35] clk: mediatek: mt8135: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:03 +0900
Message-ID: <20261013151734.3177690-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081822_894633_281EF9D4 
X-CRM114-Status: GOOD (  13.44  )
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

clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..e3b7dc13b458 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.56.0


