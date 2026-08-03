Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE88C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=; b=yO0U5hy0l0NsxyKvoeK1M4Xvc+
	OHhh4hVguz1RlXy2VpdGUXc1ORNFaHXkoZFdjmzv/Cz20RfHMRvl0FujL27k3rtYnB8Q/wuZe96QA
	Im3hHpM/3HiHR1P98mSa7Emq7Fe1h5qpHz0KDeSKFbMR+Esg4LV2xqR8M8HhYeX2Nc5xJdqqfIle+
	aGH3Dw6czDXbF1Jqh8Mrhnj3iQK48TxvFfpaG5zKBcNoAn7TSfou/iirwhSH6WpxD35TxTO5qMAeQ
	z5J1Ssv2C32iXN7RP2bMYsO9j4ohFkGXTBfe6vKVZhXRq2NUo3UqSO2y63xW7OdjQiPUdnBdSh9+9
	xnjI/wrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUi-0000000HKZt-1QIO;
	Mon, 03 Aug 2026 14:18:20 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUg-0000000HKVH-04s6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:19 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3407411a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766697; x=1786371497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=;
        b=XGLQiJpZuRoQGCMz2YOXABK7dMDaxxd/RT8sNCJpIWRwMEkbrHWBpMjU0IPU84ogDm
         lWP//jf7ttmb27ychbQgcG2G4eG5BxDF0q2FgNdapeKXVBa7NJmOdGOyhXsgEtjHPm+O
         l+eRUYrUyUzJ/UqqUiv01nSaTuvKow+Vc+eVIlju0455uaDlFgZpqhOyvUtY2yt3iFAM
         JOPXPui0ikT+p0SPYfrtk+ukG1XbskEWtgHwd3D6qQxFKSwlZGTRR4V6qDiFb3Ry0Hl3
         NcD4HMHp32aWwZgNh2MHzVA6M+K/o+/g3e8abem/n1CnxSOZswKAQQzmzFJn0TBxbNMG
         WKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766697; x=1786371497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=;
        b=S/ogqAlwDOlkDBda6Azuv5jNDiDY+fTy6x5dajaBmlfHnJpIyTe/2O407WfToMIM49
         0G81vYw2vcBeH2xREUHEhsvSLgS1VSE4x2LCOPadGf7oIDK6nRpapKCEVmIIfNbftbxa
         jATCGf9qXqn5bEP5uDkW1uvqtyHf2iUqfvjrX1W/mCdvDZVoveq30WzhT7xFv3ikdY9F
         2kHoAosA+iVmE0S/k0PpC15mNr1TPo5Lz94ZONBzzTGaiWpi2zeIbcbWMoJVNYCwCwpM
         qLgjzwZk5VWT+aOxHyDtVa7sy2Q23olGcq8bSMsOactipDLHKVMR7qKFp1MhRorXVShr
         l/fg==
X-Forwarded-Encrypted: i=1; AHgh+RruijXAxw8qUcLe4xCLk+r4ihF8NkQ59eYoMBE9SMx2NpOtZJQHmi5e1ZJCD4yW3TFy6Ta0jmGCrv9F+SsKll5W@lists.infradead.org
X-Gm-Message-State: AOJu0YyW9oIa6ZRuXhm4SCU8Lzo56vOEZuVl/LhNhNpEmyHf6h0ceOOR
	3Uq444UZJ0b8DtlPG/abr4n5LHBk9ZY9sJ4Bfy28wUC+VrWcFmOtojHl
X-Gm-Gg: AR+sD12S/XHNqnnD+B4HTkfUOga1LWtocU9KqzQo92PzghxQF3eUewYZyRtkQmMwPlM
	5Tu94R0qrzN+wBpmfa3sEKxdkoKKkDZHwS2isFSj+OFvYN3U3h9AFLXObpCO5c+ZDQ73Q98wVIC
	RTCQT9JZaoMCP4T3kl5PzSO6PAtyF0Z2xv4RPJvrd1peu/UAVwULf/rp9TAHkJ3rQc22CRqTCiJ
	eq+Z47DmZ/sQB3Gn0Q/22EIwQDXJkX+t30NO+aHw1Uh9XsZz4IACerpV8MCWKFXSxETUqtzFTDM
	8cTjWHmcxJYoQ6Hg0fKC54KNwI5ZJCBilHuhgzypbnj7RYtWXLAP39ug6t/jYZvmzxomM+e/mt3
	536P/kjeZk++sdWLvnu89st6h29CUQpbUSxXugaw3dVoEP3LLLp+Nssd34mpwiEIz4GIpLHHEAq
	Rbnfz1MO+F6rv7c9Oi1CITc4J1j8hXdKLjKyFSrMuvWenpZwQrMRbR5ekczGXbkrCMnquEInWIa
	orD/Q7EofIz19xWsYqb
X-Received: by 2002:a17:90a:d004:b0:380:873:49cb with SMTP id 98e67ed59e1d1-38fbc4d615emr9615843a91.21.1785766696772;
        Mon, 03 Aug 2026 07:18:16 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:16 -0700 (PDT)
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
Subject: [PATCH 11/32] clk: mediatek: Add auto-population of sub-devices support in simple probe
Date: Mon,  3 Aug 2026 23:16:38 +0900
Message-ID: <20260803141659.559129-12-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071818_081500_CA95B4EE 
X-CRM114-Status: GOOD (  14.49  )
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
devm_of_platform_populate() when the new 'populate_children' flag is
set, reducing boilerplate.

Note that explicit of_platform_depopulate() calls in remove functions
are unnecessary because devm_of_platform_populate() is managed by
devres and cleans up automatically.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 7 +++++++
 drivers/clk/mediatek/clk-mtk.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index c3369a04cdec..71d70b5a9990 100644
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
@@ -609,6 +610,12 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->need_runtime_pm)
 		pm_runtime_put(&pdev->dev);
 
+	if (mcd->populate_children) {
+		r = devm_of_platform_populate(&pdev->dev);
+		if (r)
+			goto unregister_clks;
+	}
+
 	return r;
 
 unregister_clks:
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
2.55.0


