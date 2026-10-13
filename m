Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89784CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=; b=JJktZhRUxcmM1Su8VydHym4/L+
	Mw5omCWRzsqaiTOlrUWp/GbE15r7MRLzE6GIOauGcHeZUuccWoPaJx1crvC2EQKfefvYs/c3CXYjn
	jvbV1OJ1Ggr6FDppvf8LwohaoG4oTs0Ep+ab/lZrvCkEkhVHGvKV9HhU6a2rw8hBBiYq7Dm+POlJE
	tt8TfRecEnmB7APr0taG+T0TtAutgX8kHRqCpnLzSdtyTdelIpJ/djrKmwqwCB09VMAZP9BdXrKVP
	Y4C2OTc5Wk71lo1lGkWR19rd26mDaUzn7Yz4zdPjZ6iQeYr5oSx9Cb5WNA1kMwqjksGAyzMKTGIkO
	hs5Rz6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGx-0000000DGCA-1qny;
	Tue, 13 Oct 2026 15:18:35 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGt-0000000DG5F-29sx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso1054737a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904711; x=1792509511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=cTW5sdBAjD3WRX1Ayjgl1AvpieUu61j/I9RquHwwAS/xcd/xKBwa2n7nmI60zcHXZw
         aTPjyJsRbhplxAW+dSTtV9S8Rrr6E5/j0jCFOomEOmKiN0W8KIVWRLevshZRQNVr4cdn
         FGqTL0x7LYhN5VN41vrcUk4EFAeoPYXVJug03lhvam92/Et79WlAHBwngBMFFMV42PTL
         sGDEILRxQSV7mI7vaTmBahByaR5qtJa40/KqX7NCOvOh6wm4wSfgMcndDcRnvn00goNE
         5JfMr7KDrasJz7iKuN5e6II7WU+X39E+JeyHdMlHyVlDPAJIAt/2YXaV0Oxq07dh8r92
         p6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904711; x=1792509511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=KdWiHYShSJkzM1vzstk0gsWFDgyvr8YBKrgr8wa9r2RLp7/ebmYc7SQpV3MY7UeObP
         8Xn8aK3vJAQfGfq29mASBofSrUmADTEsg4Md6R2vsgvRZAtfSXMQ7RqYu9Vc/BZBqdmW
         LFJQFp4dNP6o8tCq0iqv9GchON2XFTPXs0T/t2vmdPd+e//qM0wAJNYOgpw1K3cc5Dzz
         xb0uwGezBPys/+THhuKAynU5BkT7R0E+XhrZ3h4uKxM8lin7qs3IloVQ3CTlIEuJwYlM
         Lp9hAB58IffCyiA/3z8U4pFlvnb2kXgIvIb+H4Pi74HIWs9d1JjXKfXHkmNHjPiLapZm
         LoKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOXVu4Tz7b4sTui39rcBD9Kqlp1c7R21KMkSGPSC7talQHHSyVGoOwrPZ2Nvl5O7j7ffbFeGnU59ifxWe1nnDS@lists.infradead.org
X-Gm-Message-State: AFq9FYLHjNzC1Z74pCPmV7K9LVxIlwv670z30mw49WDqHwANRRk70f8A
	ccUd8mL2N2Hu181OYcGTlpHlTCLiV7hpyfcggol2stWR48W3cEf5hOw8
X-Gm-Gg: AYBFou1gAXfbzLJJEKKXhId2J1MbL8Uer5XwLL38b5gjrR0lxJBHbVFTLsJ7wAn4/8V
	K4V6sXXhtwmR+74zJrNkHORZSUqnLAzEWAqC5sEi+lr0dyLrX2Z4CPdR4ykQV3zCTRU9uB4PCIM
	M97tlK1Dt+wm9dFqUhP/4g1sKPJnaV8EeMcXxjdB/+6mrojUizXieXMnGBbNjdXdGr7Xb7GFdXx
	R3oW6Rp9PBXpGqTLQ6+HEhaBHiukQYZYez7jku1jzTcw5/oYkUtekJwN4XLlsrzfwEbB7ly5v0M
	gXhti58fD0nHwJgijMu25PDX+NO0wyNoj0o9Ataf7geb7AKZEwFZhunNH+xtDhrsO9rayY3DKYQ
	GwNl3NHNpgb3KGmCwbMgix6bumVRZ9jYGAq5VEw6yoYLlOiVRLdtEWlbEUMHPNwSMe1hicnznon
	L9RRiotKLDUus4fKsxk2P180sQh9xdx01W/SdipAKQSlsn7l2t2bk43qkaa8uxLejRb4ELi2n3Q
	horwjTdZZzmm9wlniCP4xrYGevw
X-Received: by 2002:a05:6a21:394c:b0:3de:3f4d:f2bc with SMTP id adf61e73a8af0-3e16badf2a9mr12154427637.1.1791904710777;
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
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
Subject: [PATCH v2 06/35] clk: mediatek: mt8192: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:05 +0900
Message-ID: <20261013151734.3177690-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081831_561692_B3C0D1BE 
X-CRM114-Status: GOOD (  13.51  )
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

clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..e6ac40e2f12d 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,8 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
-- 
2.56.0


