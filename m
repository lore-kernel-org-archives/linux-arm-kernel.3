Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD2ACC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=; b=ApVTcfbHpWYfZDkJsPSS6xOC0+
	++JhW2wCE3hup3mt6qmvbc4r8OIQXaLlDynWgpDuom+Xw9GxbZvxElxZmoljWugTqtxrIdzEcHDMz
	hlh2wITjZFrtw6xz9JVppGSVu+ZYmkigT7H+wzFG3vQmId4Oy1lNwISOH8MtNJAsSKgXEHVA4+Z+g
	mbFd/8J5joN3Nd5KOa61owiYaeZRs4p1E2ge/pOPPOw+Xt6yK1Ji+k7OL1fAppZjazhjdYc7FM/7R
	5R731ysX6iGELBP4a2cqeVlB6GRDAcThtW8mpKs3bGgItj19HBarZB/saqsFq1PoEy6UaxJ7HgL59
	jE6ulRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeI4-0000000DHHA-2pLn;
	Tue, 13 Oct 2026 15:19:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHk-0000000DH1c-2fg7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=; b=LjzodsXRAAjaRO+etrMUH4N/kE
	mjA0sIowu7pJo22wSIWkZevVBgQntrxnno1vEpJZy2avLYFShUH9xiBFwRvrS3P4q99IYaFXuBCNK
	vcf29OwdtsSAHZwkB2DhblxEeb4fx0TDs8ZH6D8xJl4y95X4i5aQpDvcsOnrW2lxSeEMbBvh3pohX
	IBEGMLcl+zzNdi3YscXKMxVDUB7J/KAUTWtBzF3UKUBNemauP5Gqe+mNEhhr3LiCOAJv4Mtyy3lnr
	8K1xZokoXKKUZDg2OvKAGuUNy84Z5QFBDDJ63jA0srVN6GwpBgty4UDrJu58ytsuO3y1aMFtDbsHA
	iNNxu1Pg==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeHg-0000000FhRV-465S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1368211a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904758; x=1792509558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=;
        b=CvH85/9thbgFOXCRkMu8c7YjkIcBTGFBqZK8tMDoSw6eqLD6q3rld2vNfsaipbLhFG
         98ObxGhOaA6w9ruyWCvEaYlv/8DPX4Il+ixvdmYgAf228QDucHLMxTJrkgfJQNHLY5O7
         51AGxNjawCRC9plOF59J66owAIUw25vwWH+5tlNnQFH0FFut7I6H8pxzaNiD66FvWqxb
         vylyJTkm9rlJTf0j86i1ANNWmqquVcZehVVZHYj85PGQivI2+FEsARg0TENZcCup3hmF
         BMwRJ9CWrEwpxk3/peGwILPabIzBbRR9d6tzA0y0EAH4X3p2Iapi5+UOyFpRGF7dNayz
         AaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904758; x=1792509558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=;
        b=xUo73rbo9XN3xLQoC8ZrZO0Rs2ZDCyJqE03XXKAOTPxxA3xmcxFviby2oM/zppxiNf
         8qfqkn+kpvQCRnQVGHCy7hTRSdW5fuYBLNoXXNMQBvmVdGifmPzt2XWT08j5UB4M7HEg
         D4Zz5guS3AjTyz2LOra/tcTj2rG+KwW+Q/cExFJS8lO/zp55cIL7bFO9G57aKCKoXbN+
         j4T6DM65JhM65mzZMuTwLkVZkYbpgmya2fDlBFGJhLOAn2EUt2fltCDzUJQ3UH7a8k6x
         ZuMZkXPhlXF0eukek4nNBGlz/WhRnG/+KAwTET1E/BvPuuCO6EsdZWoJZDg6wMKFv8l1
         ZN8g==
X-Forwarded-Encrypted: i=1; AKwUvBzz8Gs9F9BX3MOfwmpdKUkcj38XKzFCXgXIwkdKTXZhXhHZqpWe0evzAbCVimj6f55v29K7ZkUFyWfRMq29PwfJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLha/E9/pwK9N6RrX9UxH4Bx5Fv3VQk2sRQaIPOx73QFqkNGa6y
	BCMXb5CPyHdgy+z8Ek8Ne5BDkUgD50AV+MkHyvhoabV3p0zj8WknGSiE
X-Gm-Gg: AYBFou1wrVaYHGOK2RfqKqz+Vy2JQweMFA4Xn8dD1JaKYzJZgzCjDR/jViAardornRg
	40F2x9l/NUm3z/XQoG1aexzEPfcXA0QmpauLZF9OWL7Jd2VdkY41xcKgtSwJJEGvVjS0E2qyMrb
	jrDlvqp0n59UMZINPzqA/DghYrbOqOyQe64FAuoZ2F4FSBItxZZ9iYwteUz8jJUTj/VtHpLswoj
	1HzRAaADxtRnhD47+67Nfh1qDGPfBWgHYlHq3ZI1VLtsy38deigmpN3Uz4Gs1e+XSNbCsZkS1RA
	A9HvxY4xQ4QI7kPc16l4L5uV91tWj6fA3B73MgguPamP0/eSa52Si7x9LWTbAoxwMK1eAcc6n8s
	8AAfdWMyV3c/UfJr7xn7CXZQr47Sbp1MqMQGVH2dBSJQV3x6Jf0fgPAwYT5lAkDTDaQS0hyaVA7
	yo+/VMzfom9+nSNTCk60XWTHB/qd5uq4DgaS6Mpsu9hE+MVH435KasSFX1onv+rXHS/cBa0NdRq
	QsDsE2pWWQBLizcFD7eR6p0MtrPXNub6EJyDyY=
X-Received: by 2002:a05:6a21:8216:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-3e16bb71260mr12893094637.2.1791904758027;
        Tue, 13 Oct 2026 08:19:18 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:15 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 14/35] clk: mediatek: Add child-device population to probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:13 +0900
Message-ID: <20261013151734.3177690-15-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_161921_138703_6A6AE36B 
X-CRM114-Status: GOOD (  18.51  )
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

MediaTek audio clock drivers call devm_of_platform_populate() after
mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
of_platform_populate() when the new 'populate_children' flag is set,
reducing boilerplate.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Use non "devm_" helper (based on Chen-Yu Tsai's review)
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index e06cd40d995a..1172e76516c0 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -603,7 +604,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		r = mtk_register_reset_controller_with_dev(&pdev->dev,
 							   mcd->rst_desc);
 		if (r)
-			goto unregister_clks;
+			goto unregister_provider;
+	}
+
+	if (mcd->populate_children) {
+		r = of_platform_populate(pdev->dev.of_node, NULL, NULL,
+					 &pdev->dev);
+		if (r) {
+			of_platform_depopulate(&pdev->dev);
+			goto unregister_provider;
+		}
 	}
 
 	if (mcd->need_runtime_pm)
@@ -611,6 +621,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 
 	return 0;
 
+unregister_provider:
+	of_clk_del_provider(node);
+	platform_set_drvdata(pdev, NULL);
 unregister_clks:
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
@@ -658,6 +671,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
 	const struct mtk_clk_desc *mcd = device_get_match_data(&pdev->dev);
 
+	if (mcd->populate_children)
+		of_platform_depopulate(&pdev->dev);
+
 	of_clk_del_provider(node);
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index b6504b3e77ed..11939e3e0b38 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -265,6 +265,7 @@ struct mtk_clk_desc {
 	unsigned int mfg_clk_idx;
 
 	bool need_runtime_pm;
+	bool populate_children;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.56.0


