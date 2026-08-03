Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46279C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=; b=GxsyTta+Sf2fymhW7fdMAnF8h3
	RyndGZoA8JqqTfjd59Nt5+anYS93IX4gQ5QD+0BkZ4Ff3q85W2ozVxAG+1Kf7AIVDRtf182qwkk1F
	lBXTzilj2zlwAjdRhD40LNRHdlRB7rot+0ZeP6YldYrWpVk2cYrqdMgB+z3VuxpzZBMhduS19I63w
	CY/my0XuKZRqI+FdWs36VA4KJMgyEqgfPFfbUhzr83l5D5Oo5qKbUWoiRgtEc3rHvYn+7h01X5x8q
	IFZbPxEfMj5yhell/nMU/S2bLebojubA45aAwHSHw6tB+HEdtQoZOOZmgT8vEoJi2IAF0h2iRuTCh
	ApHrJOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU7-0000000HJnh-3onc;
	Mon, 03 Aug 2026 14:17:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU5-0000000HJkl-1Hvg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caea3f742bso34940465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766660; x=1786371460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=;
        b=MW6+132u6DsqBtuWhCdZE+24wYVhv+SkYKSMQI3fPGHgT2dnlUvjgfCQvgrGTxi5KY
         CWYTtRehqAxNXrN8FvkxS2aczDjlKqSQEESO+balkXpfxfRve9erQyM75UCDcxltSUow
         7U14FIKbdl03iQm7DUx6Fu4/znVmQOJaYCLC2C5gYT3hseWLaWi8xeoRnbJsgG55Zj4k
         QH816SHTgLeKKSZfe/AOTxneOifsq0m08Oo+9MaWnpsO4lrw1Nz6TQXLBWsxb6+hnEoS
         VuGtngEMxDlH80Q/dLvaEnffbS9EfQ5x/+kz4fjH0zVmANFvPxZfZ2BuSXWR6a0EeRdJ
         TiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766660; x=1786371460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=;
        b=SoRux8EwMXTm8buLYNKkpdSGEv9A03ZHPg0eTF/hvk3b6MeYAYH1LbkGhqFMGxoRPx
         XHVmepslVThP0darrDz4JNSwylN3Ga12jAxGt1EpB8kNKKBbPXmN45AoZAD8Q4+oxUxZ
         6attOpzK2EmTyYRF1Lnl/FDlY4qNb6kFx18c9nqQ48ix/JO5MghOr7p1k8QwzNwlkEIE
         Lg0bdqPtvpx4PKjEqHsTC5Q7VMNzK/1R3EpNWxA15lfhCkuKTRBo6DELohSWDmszfMJz
         hN706eMh+ttbOrYabg680QiZfu4bxsnKy3KNcc6fL7+VdijP1tsvM0BfvhPd3qYKO2ew
         2edQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIdpmZcuXAWEn5uqZRQ7MfMNG57Wd/JNELUH/bz6kzlgNJN4siAH1YaddT+zgdzLGvPtwC6ZxQa56UXVIf8S6t@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdf0bV6MGycPz8kt8inwhHJYUPOh6lKueu8Lt2EKoqZcLhV+to
	vGfIDJhoTsJk80ry7mMG6LE0sBoFkEU9KaEkSn6uNt4KhogKbY9lfMiW
X-Gm-Gg: AR+sD11kPWyjG3EqBmyKrVTCZD7SJNaKgCVqaA663m5RaP8Or1slVrQT2F9QEpDm8Mc
	pVf4ZpfHisX7Hf/qJn2vAy2zNOWEvSciAk2W2UYEgbnmacAqsx6JKdy0WXGvNYuBC/eVT/6KZIJ
	sRZXyQ8k2W+C7GGx2DyD2waqPt7GUPd8dvzQpVaI8eXOTAt7cBsWIb3gB5Y8FApLpL4fTUijCzQ
	+bnUhOvR1GpsP78AhZVeNzdYnzYQVkpFFLBwuzvD0qbo2KSHZyRHLkXwD0B6ZFb95IXEjrk5SdG
	fBGFWsy2FT8PKYr4LQgoDeGJj3evhq5NxhuEh1DW+SlQ+rCwnOaEnWz5w61NfHwwQW1sRh1g9H/
	xr4BFObOINAnhfB/a720KrWrKukRWP+8RyXOkOEjkk024gWrgGatrQ+Si2jmCQ2CLTh/kVYcdep
	yI9I88jf9Q9kmqc11G+DwJgnG/MmgLxmbFU6LMktvUDe6nICVl6QJQQJdxZUDIVgi10VvH8eS/r
	DF3hxiNqhwDMCdi8ahS
X-Received: by 2002:a17:90b:51c3:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-38fbc0b4881mr9861203a91.0.1785766660245;
        Mon, 03 Aug 2026 07:17:40 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:39 -0700 (PDT)
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
Subject: [PATCH 03/32] clk: mediatek: mt7622: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:30 +0900
Message-ID: <20260803141659.559129-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071741_356125_4FC7BE69 
X-CRM114-Status: GOOD (  11.94  )
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

clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..fae8abda14b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,8 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..cec19447d637 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,8 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
-- 
2.55.0


