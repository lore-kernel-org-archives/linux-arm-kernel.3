Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1654C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=; b=UKvunFylEIZicxUSxW5Xp3yjJA
	ur/Wu1a+/h93k98vOMHn7Ykjx+INh2OGe7vAupxIceqIsKmen0OixyCfWq7QX8q07dBoVSmjAtLX7
	PappPI+wqxeF2lMO3eQV3k20XlvREf4e0kr5SalRRwSF6prW2cmiVYjT+9wiMzHUrN4FXflOhws9u
	39Usvgc51/7F4qPmSxkRLTpbzlrzrBKX7CTqq8YEtouZ4ack2lGDZHE2yAPI4D1cEKr+LQzrbzl2J
	IsBRwgDO9nli2NS+Iih10Ebon2gZdCbST3PoI3uz58EhYB2RgMXiPIXr1bW3tFelANulFOJgXNigf
	cE4psGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTy-0000000HJfH-1vnt;
	Mon, 03 Aug 2026 14:17:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTw-0000000HJct-15we
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:33 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3217199a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766651; x=1786371451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=;
        b=gzRZz3l/XuPhQNatbi4M3i3EiJV4iajBXTp7JqjOY6PLAS2YAECcOVDef6wt4kTkLC
         AkZJWyKa0wZ54bxg05Axt7PFCROOw0IkvYyLLFPBMoa8BSIBarSD6fCCMBtkRcqv2V4r
         8XpokDXrbEMaDEqmvfnCg3DnBXr3ivfweWf23w9E8qEIiwvY0vrB7sHfSfkbhs2hvPmw
         +WfRw3WEp5y5fI0fi3H8twdyhnSwImAki63YnTO0JcOorz+PWFTOIPJF0t+Vy8x67NAn
         E6GXmZdHMz9nOEFXRec28dZQ9RFw7Ji8YsluGnyr7CRp8z7FX6E5JVgJBbAQnjSIGLGp
         QATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766651; x=1786371451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=;
        b=MWOujjRV8nx7r0WrQV+NOQ3nzemEqPd1R56ElqfzKdXDra3hXgyaNA3ySHyJ9jbpgD
         0EjTcOf6WE6/+q5VEE6+KerkChm4j8GY2M2pgwZ/ZxeM85JxDUTnrwhtE64o+fvExLAq
         icURjwmHUcwnzBvBSvPVyHLrXn/wpToBWtmlDsHLtwKbAa/mNdqE4bx6C3RDyqtttMm2
         j5Gk4MBHmwkzeGHc9t5hBmdMGukGzoYZgdESVHzggCXgooFV2VXVrNCp0bCYdcs5Gn0u
         Gs23ayszXjXY5vKKHoMuqAYnxU46OUNNyXN1K0WXU+JC92ru4kdeB648rCapUH7IR/S9
         MSQw==
X-Forwarded-Encrypted: i=1; AHgh+RqlzMSuuegqFtrh7+rFBFnpPAHwjVmwMlYRDKafCAdVw0wsH2rPb3StfLnnlSf/o7fcd4e1Dub4yInilvNR5G9V@lists.infradead.org
X-Gm-Message-State: AOJu0YzPTHEpFyzvJSbnbiw+0Vx9/ZJg16ycav3j9WdGMK9ALYAeO1+4
	A2NdrDdPZDvdsOR3zzw0R7DgvlRzI5TDAgQJ7sh1YMbhndlo087q4QGS
X-Gm-Gg: AR+sD13HAeT1FNdZwVwr54aL9ovdKym7qT4zTSevcN13ZqdxzyomLcRca5dZZyO4FVr
	+quXxcaVzHRn55fW5iluculRhY8NqDNdvmu3+32ogOR9a5E+8t3STgjGuRZGGLPh5IQve0XQ4TK
	vgBHPnkhAcLWeeQLK/n47dAcHw72m6YUKXIsViq7Ss8L78ujme4NkZLjPhcL2LfeWKe+rtuDbQJ
	strPAlztBBtudIrUEwLMgf21m91qFLX7ft9mt4cJzY0srDIrw9Sw2XdpA6GQNrdW9pc8U0Rj7rb
	GSwyHKhRs8oq9XOYRu9c3oAGkFGZ8HDaA9FOgWZGVrtDc9dINM3PcWWcNiL06/KNXq98ARK2FFm
	dfpasO+dN24mUL0/AjlTpaH0XbSv792V9U5rAIEYlYcH6+JARWBtmQeRV2FwSPiLp5qHDKpASjv
	ExOBzECCUzmOgNugENfI8QeEo8MZbT5d6RWK5mfL5SLof/U5xA0TaZJhpaFvxTM7TCV5eO0ArMy
	hM6LJHro57j+OhvnyDT
X-Received: by 2002:a17:90b:48c7:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38fbc3ff29dmr8848847a91.3.1785766651087;
        Mon, 03 Aug 2026 07:17:31 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:30 -0700 (PDT)
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
Subject: [PATCH 01/32] clk: mediatek: mt2712: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:28 +0900
Message-ID: <20260803141659.559129-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071732_305560_1982E327 
X-CRM114-Status: GOOD (  11.95  )
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

clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..087cf574bcdc 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.55.0


