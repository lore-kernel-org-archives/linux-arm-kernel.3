Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A4CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=; b=pTy2s3iuPBiFIP0rhiE5yquUnm
	uFPbvPL9QEigj3NN8YsJcOwS8OSN8bvviWXneJDYpqVIRUrgG3cdijG/APaPrPfp59aZZrnNdPqOl
	cREf8WeWaeqqzZ7sp09l3OsPIPNvbmKXJfaI91Aqu/eOAMYzXJGP8K1+5J9nO0ZR3QSKZZNiI82YE
	jQy3EnslBA1QvwV+LUwLeqZcX3ufljemHcGsrTrq1H0dLc8Gs03UM02XV5vOWmx390VUEHtcZtWZ3
	I6JcODPkgfDdbiQecnKzHYQEwkFUHo3NVhglbQYFDvzuRhu3KzFHnuOjjq3888JCd+60U5TEjl3Ka
	LT/MEAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHP-0000000DGiW-13Eg;
	Tue, 13 Oct 2026 15:19:03 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHG-0000000DGXd-3h6j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1050704a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904734; x=1792509534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=;
        b=gM3OPJgHRDMT3WwLsSNK4piqOY0auN9gDt1sSUmTPs/6ACCXUDWA/rlvqq2KfecCQZ
         J1h4cPjF+5V7oAA0oC4ZyCb5SJtb6m4Q0KRqS1QjOw6GZgSj+W2p+cGI21uIik0tNif2
         ZTL4QWt80eG/h5rWBj7qqnN0zKUz5vXHh3fqM48l0bvzs+3AMTGaavBRRW8qwec9rypE
         ZXkFSD56sthwGmqcxxQVb75jmRcP2wha614PocbQZ5+r/MeobvQoEC/m8K9rMsCoiX+g
         QJiNRDOCABGRbDIypEspWfE+4iPhKUlJgIHFtkFJjI97gWwuQprpuseD1W3gW114Zpev
         21iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904734; x=1792509534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=;
        b=yoKzeOKh1g374RlDD6U8LgnTQUh5a1gbDR7/ITorO2K7Gx+GFe/QCEkYQEXEt4jjvX
         yI58TpWlbBiwkp3it3WGfL10JUt/FiVnm/CRvySVCvnaI5T/zNTPCU0BjlWn8777snx5
         RxHT3OTFxI7NG+1hs6iPCipcDWSrgpajLvGs7/eLsTCI4n37d97/C1hfxvvbDlFv2C/h
         hlCSsyi9rzi9VaBS3PI9qy8h6zUbDpfpnn+u5RAEMXP9PWTsm1wefcm6Rrj2P7kIT4hA
         QdCrynmhO7gGnfmTrl+UdJxXfX649BMGY84rMxe/K/bBDTvGvfjm3YJKBAYh+kmWJ0jf
         uUGw==
X-Forwarded-Encrypted: i=1; AKwUvBx+Kgk6CFW2u5M5azykghEu6GYGuDL9Gi0VPrjwNygcCXnhFSCxOe5CdsJlO52vc0fbyhiCm6Hg5UigRq8ZBei1@lists.infradead.org
X-Gm-Message-State: AFq9FYLOYSGWiOWM2IPwzBx3xx9jiNX1UXgD6YqUlcFFgm6t8eJ3CH1o
	a4axLTaH2IgevEjQxnlQ7AgkzQBdr0q5xYQTmHhJlphwaetaYB/zLeMs
X-Gm-Gg: AYBFou0Grwf09KgaM+f4O09rvoOp1VlKP6zXsbfXPr7+2IhXRHc9t8Lf9J3FK8um2e4
	XMTX1fac4LK2ImDENZxel5zooLIoUI61lqZSTNftxc2WEEFFDiCwPPmYF/oWxjjdwr4SA6ikmdF
	V8uE8EvLqrSUf3wIDovoksgd8Lij4CsbYDdw1St9lOcw7+EsqE3VKNMPjSQ0vCXyS6po2zx11/a
	3ioR79bK21JDL2Y5pN3W1y4P3SDlWPpB/HHmmQtibsPcOK2mgXXkmi9qvvcV2bz43baiGNqrB/y
	5mTk9OcYiV9m/IyQ6b83x3q3WnKwYm3exWMte20XEYbqrunwgyHNmP2QgNMs2bHCgKUySmuy9Bt
	UeAIzVOociwNK54cXHoOaN1AlgLZ5lfXDU1Q4H1ZcKmQGvZpdTElEB491+wsrHUkMDjBSfoouMJ
	dgl1vR4iDb0C0Yq59U8q6DygB532xzVmfgsFlD2a2r/1pJjUefYUl6uLyQSI63Kq6wLvkHgKpPI
	v0B5ekzTXUI+dY48WFvxcNlv7Nu
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr9892006a91.20.1791904734175;
        Tue, 13 Oct 2026 08:18:54 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:53 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH v2 10/35] clk: mediatek: Fix memory leak in mtk_clk_register_gate()
Date: Wed, 14 Oct 2026 00:17:09 +0900
Message-ID: <20261013151734.3177690-11-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081854_987467_B5305807 
X-CRM114-Status: GOOD (  15.03  )
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

When a gate uses the hardware voter ops but the hardware voter
regmap is missing (e.g. the "mediatek,hardware-voter" phandle is
absent from the device tree), mtk_clk_register_gate() returns an
error without freeing the mtk_clk_gate structure allocated earlier.

Free cg on this error path.

Fixes: e504d3bdb3d0 ("clk: mediatek: clk-gate: Add ops for gates with HW voter")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Newly introduced in v2.
---
 drivers/clk/mediatek/clk-gate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index bd2fcd489a3f..0b1389993751 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -221,10 +221,12 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev,
 	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
 	init.num_parents = gate->parent_name ? 1 : 0;
 	init.ops = gate->ops;
-	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv)
+	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
+		kfree(cg);
 		return dev_err_ptr_probe(
 			dev, -ENXIO,
 			"regmap not found for hardware voter clocks\n");
+	}
 
 	cg->regmap = regmap;
 	cg->regmap_hwv = regmap_hwv;
-- 
2.56.0


