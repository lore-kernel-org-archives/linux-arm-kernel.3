Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6C9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=; b=aYK5ozDW3GeZWfKiDmFAgOPVzk
	W6I7fh5dqiJIqZURyhlBE8qX8uAYMccH6QTTGJ38TVflJcL17p+fAFTm3Q3FaWXSJSGluhrUfFG3U
	+NK86yrzHKNEh0g9nZWv4rMB9uQ4jdKT+gG42qzwSrlx4+lBMiGMaUHhX3xEQ82pPkCxM8lwTqmmo
	tNOdq6REEafv+aEK9/sMtQVbYw1zTBcBYtCjFcstWZbYyq8QG2+HiaDcJOS9OCdxC7PHWQE5yPiwd
	xl8M1amfXEMzDvXrAV3T2VYOMMwMICvckKuXN31Pv18ell1uV4rtnG5WGDnbb2hWIyn4FZ2aIAKBn
	HHz7ivxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YR-0000000EMIG-3ZPL;
	Tue, 07 Jul 2026 07:49:19 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YO-0000000EMGy-2frb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso2216345a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410555; x=1784015355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=;
        b=fXLhFvRFZ7piQVmZk/+3lHBnsqwgTQT8pR8RmAxdWslJCaUGBLXemEnDe/DpxtKRWM
         9hTu8EU2yLQQqY7IFFFMYbGZlYFvHBCkvi6q1432TOIwlEytsyogcdhC4lZW3BevsmP4
         11qOcrtN0E3SQDfvt3oN4HR2n0WFEqHti+2kkw71Qvuow0CDqK3Ab6vHiM1yvZfB5CXp
         qCV9rq+t4/LsRkVfJG1aOIZvLB9F6utid4xqjtMRa1bn1G68JMuoaK+ahk41GNkNsl7j
         Q/WEQe5LNwfhVxEm5ZFphHxpp3FPYrJ8dgSASeJSVttXOlAzVu3S74ia0+mc9sFaHS3T
         wsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410555; x=1784015355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=;
        b=ePfO7L1U8vtBHptQw3iUHThsHMSxc4Bts9l6F/6yWVdbH3JQCKcb0/XXskb9FG23Xi
         vHV/Bt/kxQmdn93oXj+oZqAw0nbxUmXC7lLhPzsKGAZaANPAr+XSSpm/0+5YVsUp5J6y
         W1zL3Nj3+Y1Lp5iSUmUKKWgSfnrpmylTq78TlVesFTVUuNFD9gZHOEw9h+2L7od9trek
         fRmWZt8WG9iNaFi8IfeWmhNPR0/Hz4K0NyjX8E54nAq6tBwazUIJEMY0JwERbhR2ZSTX
         GWUTdqSuvQPB/+Z9vF6Pf9lH61zW77dOH25mg/y321M1Ar8jeqwYSXWa+vt961jPTluW
         wi4Q==
X-Forwarded-Encrypted: i=1; AHgh+RodBxTDn3zjo6/BSffiH2r7BQ5bmkdUcFUsXow3NfgWEiQSxfRhH3hOvkyaIHC04Xd8/rVKOQolxgrZX22f79My@lists.infradead.org
X-Gm-Message-State: AOJu0YwCkJ2dt3mWxYP4qVSLFxIPRfZ0qYDiwCU3A3mRRk7YqLh5b1nu
	XKtJShL9nuPjFPqAihZ960ZU0sEOofc2tkSMQxGeHr1LAWGh3PpRP4xW
X-Gm-Gg: AfdE7clc4xRSUOp/JteIO64beA6oZ8ReBJL8afRMTCIUccScw13Yvy50JtRgUD+b9oW
	tZKalOwxvaPCY4BOijSkaj/KKAbz3hvfxA16I4yiheD8G3O5vFQcV88UxbDQ/ZK1ZWFYsf6YnT+
	+3xIwx1Iu3kzvFPScKL3QeTQdHc/xrY0AeJkPCc/0kyYhWMFZFDnqFvDmLTeNtnCEc8pHJPOwNG
	VQuoWFF55hIi9I2dKs/hVGQoSvnMjhhFAiUgzcL3KZnTpuOjE0oxMblXcqsrXS454991MxA0W/+
	UEtm+rjujRtS3Je2jnR8q5GseaLNBk7jir6D1Ib7ljc2voqW7NibLkkyMR57P2rLgAquxy5EQSR
	CTiMDL6kvnT6i9HSpE7q0c5cYqktqn0x/L24LHhkfuyh5EcsaqWP2rVynluH6G3RMIP0rGUyo6F
	RvQkQ4wBIZN8ccKknXuxV22f8ZRn9kePB94Z21VcobCPeW
X-Received: by 2002:a17:90a:da86:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-387597e83dcmr4179386a91.28.1783410555332;
        Tue, 07 Jul 2026 00:49:15 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:14 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 0/6] clk: mediatek: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:29 +0900
Message-ID: <20260707074839.240676-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004916_697748_893C2969 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Some MediaTek clock drivers do not call platform_set_drvdata()
during probe,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Changes in v2:
- Add a newline between platform_set_drvdata() and return
  (suggested by Brian Masney)
- Split the patch per SoC, (also suggested by Brian Masney)
- Add "Cc: stable@vger.kernel.org"

Link to v1: https://lore.kernel.org/linux-mediatek/20260629142348.273766-1-akkun11.open@gmail.com/T/#u

Akari Tsuyukusa (6):
  clk: mediatek: mt2712: fix memory leak on module removal
  clk: mediatek: mt6795: fix memory leak on module removal
  clk: mediatek: mt7622: fix memory leak on module removal
  clk: mediatek: mt8135: fix memory leak on module removal
  clk: mediatek: mt8173: fix memory leak on module removal
  clk: mediatek: mt8192: fix memory leak on module removal

 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 10 files changed, 20 insertions(+)

-- 
2.54.0


