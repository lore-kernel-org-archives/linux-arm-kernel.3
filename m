Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32597C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIV+HU50AEtRbtVbE/kWRl5gYNOX4lr3tpB0iIeyarg=; b=JqN9/M1/XjYc8Jh8592jgsVM9U
	yojkIF079ZfOGlqLvSFQzfsAf7+fE91HjcE7VdK3UKEVF5i+KP6TnOo1iFr3JM9SgD7HNWRanM2Fm
	i2VTxi7qy6eD96m7kB7tNHTXZM/i019VFR9ajX5he1dajCqfPC+HS9miNKHv8+3glMmz0kB+Cf4Rf
	2A6Xt+itT8YzcwqBN84R4uAEg10ApN+UEiP/bYfIc9EswT0NraTRkJAWdjLBjFpzH+cqKVENyj0yM
	g81QjuBaJ0axcTCmP9yf24Qeru1u12fLmihrUvqjIpe2mLjN70cXoWlL/S8qlfkU1qx03oHwIbNbs
	bsTyqTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU2-0000000HJie-2aeL;
	Mon, 03 Aug 2026 14:17:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU0-0000000HJgu-1SVp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:37 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4208624a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766656; x=1786371456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIV+HU50AEtRbtVbE/kWRl5gYNOX4lr3tpB0iIeyarg=;
        b=jSgeKq7hnF+W/FROMFZTEac8jSOT4Z4P5/ceIZs6+DbBVNx9nQVJWiwZSkyI8PWLZ/
         RMFH028909zsEk6kZGT7snxnJBsPs0SBIh1dafnSz6L9eQHGWf2Kln77zhcYvzSX7fED
         0zC7YbI7i/Yp71NC4P8rSrqhMZLxpeGYyyMevQu9JTZjnJ7B48aKVBEkRHNnttnJ9phl
         XoEpGN5Eo2CUvhXHkApAVJKBR8H9ahI1OozqgrRTrK7HZ3a1E7Kn9qI4E5La8CKs0Gdo
         JXrVVgsagSs6o42A1Y2e96ov/lpH5ftXQmpMl0IyzjPWsCeN0pTtAGJlAZw10gNn6W2I
         pHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766656; x=1786371456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YIV+HU50AEtRbtVbE/kWRl5gYNOX4lr3tpB0iIeyarg=;
        b=aVJJIBDBZz0etEYKAnmLg5UZC5ZMSKFJnbZwFUd3UyC25ezoWhpc7B3xOGx8vSwOQl
         VDgRt+hciU5VAi+2rRpQ1lhaKTVDSRJP7PecMXBy5J44GLwUDFLI4kELkx4KSEpn7hmD
         pFJPKpBSk7hO1EWgpFaJnqm1/qbdLxqwv6LShW6o2+mkBuVa4Qg2YIT7uQ/eoTbnQjyg
         LIWOQStt+sBk9kL5INsg590k+s3bXHGPQ72jutY3uXF9VwUvQ0/bTVmncTOWD/3mLZho
         ueTvrDVLO5RpgqnSf1jVWfuggSD2XoYeaHdILxJ7VAzAqBS1yCsJ77NmtmvGmUk2IXP3
         0WOA==
X-Forwarded-Encrypted: i=1; AHgh+Rqi8TCWphpeD8m7CWKRhI4W/j19wQ2APShzOyK5vLv4gRgeimA642wlP8SCcFZQIVMfKvdK3MZNOEdHyqjP6B0W@lists.infradead.org
X-Gm-Message-State: AOJu0YyXSiPYpALL9WA1nNGwOy+UECGpAwwmSYycZOyDyJOS0hOuCxQY
	Zf/CF0PPm1xCbZvmNpIzLLr+eptf57NbXdnBAQWIsbBD6VA/GzzqmNxT
X-Gm-Gg: AR+sD13+jN1xW/VFIkwyFco5T5m96GvIrVQRKbK+9dE6xs3k3dsYl1co49KP12TLdcx
	zJP00L0Ned6COkyk2cFRvvouGAPE1lQLhy9hXpPiSf7rimqT4q2KvN1f+iPumuSz/6OeJNw4HyE
	JPL1iAQza/g4BGWGE/gGQXFE3kYMndlUAlfLk0qe/HWhhsQrA0JWnk+Sk5jJ7ZStz3SZjq95ykM
	aGIC7bd9/D2/ycCnJG/jLv2/VLtN9ghzxVenWU5x8fvh5xhrQHnSpdsdSlP/RTrgeLVW8IyAywQ
	9++iqxp7OzQcGml+ergBYqwCxqOYisSj37fEIhd69+Lse1aJxDw3kiTqY1Nx6JBK7JRxbplSQlH
	x8KEpHn3+MZbtw0Cx/ixx9yFLutVM01OKhlOO1TXivl6RcXNkeDQlBxnTrvotHxn/fws2qdTLxt
	SXVctiita8j7LzHEAFFBDT9cYhhGkEFi7wjNfRYEp3Q6GomuxIQtEmbsV+GfY62VdWeqeW6Pg8k
	ebe8SrHD4oceVLm0Cer
X-Received: by 2002:a17:90b:5690:b0:38d:a8be:a597 with SMTP id 98e67ed59e1d1-38fbc56732bmr9286831a91.37.1785766655662;
        Mon, 03 Aug 2026 07:17:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:35 -0700 (PDT)
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
Subject: [PATCH 02/32] clk: mediatek: mt6795: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:29 +0900
Message-ID: <20260803141659.559129-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071736_394200_E7BB3190 
X-CRM114-Status: GOOD (  12.31  )
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
Reviewed-by: Brian Masney <bmasney@redhat.com>
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
2.55.0


