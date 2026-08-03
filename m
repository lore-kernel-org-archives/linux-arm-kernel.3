Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23103C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtdT0P59ZGr7qTzol1F8y7zPoONH1lkMlm/Fi5J6b9s=; b=FlsqchB7Y0vF3Lg+ZiEkeMe/zJ
	tbJRicFqL9EWJO3EQnMugtfuAlYcQxDM7j4yjJtFwdTKTvA3F26XwSOOCyDYs33VmsXWUnKsF+ygt
	7EJAHlY/AaVaYqpNbfHxr/FaOgZCNN87XB60BXxPQsPhRudaCrG34c/C+7EnsZ/GTU5cqvBhuQvn4
	eXxXcn+8CFQ4bVM7q9WFDifOkCTNZIVund+bYTTUs0g/gNGnyLUK++QIDR7fRhtMunHnpClP/DjCy
	iCAbToOW8yjkmCyIopWHYj5NY+ftGWcR1OS9/xvlM7CjD3xIrEUBEpnw/XGetWFezLEzKb4qnP7+R
	9fcU/Fmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUn-0000000HKhJ-2hV4;
	Mon, 03 Aug 2026 14:18:25 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUk-0000000HKcS-2Kg6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ceaf8a1265so40005255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766701; x=1786371501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtdT0P59ZGr7qTzol1F8y7zPoONH1lkMlm/Fi5J6b9s=;
        b=DTiDgAzagHIaapZbNbwmpoxupVYMr+Y/6SHeGyXPTvUtNwDQ24S3EOBoEbrBPDDn3w
         muoNamfvQ8yMCr9URQU5L88Ks1xsdotWt+7k3+7YBqy32zjQt6rJ+zlDl3llIaQ0e4Zu
         laU/HQAMUPoZ4SGgLRMyd71W2r80JFaKM7IxYWkJ7BU3uaMQFod09tpHHoYrVHTh+dte
         gM34fRxOVfAZknUi9QVNG0sPBtgT7JHk0KayY27HhFpI7LMORN1vEcXLTE+Zqh9QlBd/
         lMYdQFyAnmj/0L534g8pUdhaho52DpmrlIzkYs7rxxAcntkR6DNHfQe4ebdm54BI3Xhl
         CAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766701; x=1786371501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtdT0P59ZGr7qTzol1F8y7zPoONH1lkMlm/Fi5J6b9s=;
        b=dNs0FKw6yoG/iibz3CXEXajHQ/VBmUZy5YJT0dGNcESQSUqvQfnOyw0pphbbzc//n6
         ljHnlAi9EsB0EpROSNZyGOZ4OljXl1m4ujbEVq7LXog132wPKC0ISy/Uv8gKUjvB8yob
         /B95B25SEF0QI1b32VoMTxFE3KvZs+9jMrKMn6mvOiVfFuKVlHEUwonhqXAR9NgZWllK
         eaCpfE135FxaFAryrqB0IL/63M/+6FpxrxJ92nLVh5Ip5Oewoa6Epp9zCeI3UzSdub3H
         4azZ8R4wTbzezF1uyJon78TGxH1UpKqJPIQI0iQgbHfY6tgGeW5r/L1gKsxqDDakfwvK
         WA+g==
X-Forwarded-Encrypted: i=1; AHgh+RpMTAJSNGJfqGdrB4Lfdly1s8NOXBOI+5LXiwPSMcFNbo98mdje5TgATPKx/GVI1iFwTaw3v0Tz6T0xPG1TEHOQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzsQywusQfGyfhJyw7mTugPJ7veEhy+Jfb9k1wexvKcxxzWU0fe
	BaSJcul01J1cOf24wojMM9SDz415MIOPJZapvviOfd6q5XS2bHMWBjZN
X-Gm-Gg: AR+sD13aM3qH3x2GyUo9yXfC7Z+mg4xewFsRqsJF1YnD0g9R85pHENerV3vwwcmbScj
	a/2bs9v9w17HFhg2mDGt99HypdHEADELyeYxMI9M2lnR+I73uF+6nAtaRbtZYdMIj4ad1z2eALg
	nL/y9i228jvoHsHTGPUkz/u0VrBHyufQ0O12Ndy0kkBkuPsz/SGfHq+747p6YsCaqEkh+G8GKhw
	dHxMHJJvVFMlw6iaz95f5VFsCSMLiokEUajjKFd34DWD+kZo6cTMm6d331Qv59gt4nHX5gI2Jge
	cDf1o6uD1/kDj8d9RyDNxKtXEnzlglQmq7y1HjfYOZh3w1f89pYni+gKs0UeN9vZxDICGNmU2iN
	ET8cnjkW8G+I/DsOhORAJxyuh7dQPQ0KcTDbRDrhd/zg56PYJ2J3omv+PG38pu9Kl/8jaF0GiV2
	dI5e1XoU23t4jrIQpXP/lEROcV9Y82zW5J+r6hvX4mU2m0CdHLS394l1vA/2Vy/ZcXC7jC1WZbA
	90iAbzl0CvqSSRLRKVJ
X-Received: by 2002:a17:90b:55c8:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38fbc441942mr9078794a91.11.1785766701390;
        Mon, 03 Aug 2026 07:18:21 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:21 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 12/32] clk: mediatek: Add pllfh support to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:39 +0900
Message-ID: <20260803141659.559129-13-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071822_637019_909DAEDD 
X-CRM114-Status: GOOD (  16.32  )
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support pll freqhoppings.
This reduces boilerplate code in apmixedsys drivers with pllfh support.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 44 ++++++++++++++++++++++++++++++----
 drivers/clk/mediatek/clk-mtk.h |  6 +++++
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 71d70b5a9990..e80ae497fadd 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -23,6 +23,10 @@
 #include "clk-cpumux.h"
 #include "clk-pll.h"
 
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+#include "clk-fhctl.h"
+#endif
+
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
 
@@ -525,8 +529,19 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	if (mcd->plls) {
-		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+		if (mcd->fhctl_node) {
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+			fhctl_parse_dt(mcd->fhctl_node, mcd->pllfhs,
+				       mcd->num_pllfhs);
+			r = mtk_clk_register_pllfhs(&pdev->dev, mcd->plls,
+						    mcd->num_plls, mcd->pllfhs,
+						    mcd->num_pllfhs, clk_data);
+#endif
+		} else {
+			r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
 					  mcd->num_plls, clk_data);
+		}
+
 		if (r)
 			goto free_data;
 	}
@@ -646,8 +661,17 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
 unregister_plls:
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+		if (mcd->fhctl_node)
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+#endif
+		else
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -686,8 +710,18 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+		if (mcd->fhctl_node)
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+#endif
+		else
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
+
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 11939e3e0b38..4e959ec68da0 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -15,6 +15,8 @@
 
 #include "reset.h"
 
+#include "clk-fhctl.h"
+
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
@@ -266,6 +268,10 @@ struct mtk_clk_desc {
 
 	bool need_runtime_pm;
 	bool populate_children;
+
+	const u8 *fhctl_node;
+	struct mtk_pllfh_data *pllfhs;
+	size_t num_pllfhs;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.55.0


