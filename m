Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4F9C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=; b=dD7vk9RFr1nul4kyIF6ZrnAX2G
	agRZWOSiMDuKM/XI5V6UvOrgyUyJTiElwQsAg8cWvGpCec95Rp3A6/nKSo798RAah12Oao7Rk47rp
	1ooJFLCDXew+DVTJmH3ozYADaRwNoile2AfIVaBUFqL2uMR0oknAk/t6Pv4sPh89uJF90VF6rQSL2
	zttG8NNkvfxXGrFF+V9M6gXA6xX8FBijg4UnpIgHpFNBj1qWUD83D49eFbozsnNlRGM5kTJtVp7SZ
	nJqkXLuRX/BAKUkgp5eTOUekDijJtm8D5jHWi/x/z72nIs4BXJprprAzYwqRf20GYuLkwABiL22qw
	UzWlfcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDT-00000001gbj-3fZK;
	Mon, 21 Sep 2026 10:25:43 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDO-00000001gXq-345A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:41 +0000
Received: by mail-pz2-x0e.google.com with SMTP id d2e1a72fcca58-86efece610cso1924460b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986338; x=1790591138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=;
        b=WujphvEo8+Ag7piGmcTisTpgtgs1Adzjh0l2/WWakrYQ36UhmjS7iNX0d/PTv45JWT
         qOHwlJ1r81UU3uYIfcKAC/u6W21zQ7xrwEhtm/UJv2btcA+qyq17lZ8tiksnceLrI9DJ
         9TtSXs2QUTNGYyMgeJwWKrmvEms2nMUXrvzsADXr3hNyXFd/fYzbBKRVEc5V8n4hcS67
         DABbTJlnNtHmFUbFncVy0XlY/UEfsGWj9VkUhQdXDU42kbiZUPu53BQoJyRcBHR6zzMm
         c9uiBPitxzgXj6G3UI46RjTTIYLalMiOS3ix99s70FKRqhNqicR7/Bi3F+cX/RNYtpEF
         SsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986338; x=1790591138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=;
        b=oYRB/CzeJszHPphFE6jW519ncUCLG7FnjrU722NEhAVxDjkPvVBbCYXVarUAGd6n6h
         GuEsjgR59PN8j+FHVQD+CANwDxZTy+KG0NGqwpEnCxZlMHAsVU8Ow93BTN3MBtzv4G9F
         tmrM5e/PD0AprPmSSCtAbbGbUvdMsb7yT+h96Hunq93JApQqBNx3t1zIz1LINPAfkbIe
         K7x3mVMouxinsMeR6k3FWzEp1MVrnd3PCrYRzWtu5E9bfyBRByU5k79eDSJwCn+IWwcB
         ZpnyhAin3ZPZWU5rrBbz5c+zcXYT1ctHcb2uGMyQOxs6yog+7IOUCjOuUyoyXLEiyVO1
         tOOw==
X-Forwarded-Encrypted: i=1; AKwUvBzR0Adch+wbt2DkEYvdJCv8GpwAZkU36/NMw+uHm6r3YfITgihxLeCf6IzaI89CWCGwZYPSc+ajgW2xFD/cqmEE@lists.infradead.org
X-Gm-Message-State: AFuF++n+UCz2GDF1is0BFsEKT46v+4zdayNPCPy08XCIk5Kz5pif6dfb
	RmxOKjO5nnjloHx/s3bqOdwyXC+VxeIoYFnje/0LwD+V/DudyojvhnT1
X-Gm-Gg: AYBFou1ROxsKZ9vl3TnqvtddSLoFN2wilMolq2xw8YhdWs2xGBXZZ156HpIb25th0t6
	phNv/97DHQjJqMl+tQ+do9TxmMzuqrSpoc4IzGDo4Kd8T+XmajE9RYf2ypHCOu6UgQVgc0XdDm6
	T82PJmUsvWtODiMYfmMUkc+s+EKKDTzAykiLF6R5GBJj90IblQWETt0ex/DnCQvFtkjxIBwU5LC
	Hf28Y7VOWXff0TiHAMHC/grfYofk3RIq0DsYBU8kM3tHyqnr055oqmRC7qVAgZMNFiZ+8Unfiyx
	RDr3C/NFPNAeVvumPaC33Nkod8rv7rjurJuncaZdpioy+BXOfDenn9naVfd5qfuVelCK8ee88iM
	s3557JEnmCl1DfbxejsEKarcyssDZii6A4bVI95jlUNNxbeFzw9mDIHUptNzMlyulnGvUh6NYSQ
	5fU5i9IR4fg3czB9d1XO+cl8fZHZXVwTBK37Eqjk1MK3ETyRB/1q7m6ESvCdenQomlnI/nATtB5
	VxVdORLsOlgZ7q8Lfal06AXvk1uEFZCwEqgG1c=
X-Received: by 2002:a05:6a00:9487:b0:878:3507:8d6b with SMTP id d2e1a72fcca58-8783508a7bemr6555638b3a.50.1789986337806;
        Mon, 21 Sep 2026 03:25:37 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:37 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
Date: Mon, 21 Sep 2026 19:25:19 +0900
Message-ID: <20260921102522.1640072-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032538_771791_AC3E61EB 
X-CRM114-Status: GOOD (  11.71  )
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

Reserve the binding-defined CLK_TOP_HDMTX_CLKDIG_CTS slot in
the MT8167 top clock provider with a dummy clock.

The clock is not implemented by the topckgen driver, but the
slot must remain present in the onecell data to keep the
descriptor allocation large enough for the registered IDs.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..c88c41aa7fdf 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -746,6 +746,7 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate top_clks[] = {
+	GATE_DUMMY(CLK_TOP_HDMTX_CLKDIG_CTS, "hdmtx_clkdig_cts_dummy"),
 	/* TOP0 */
 	GATE_TOP0(CLK_TOP_PWM_MM, "pwm_mm", "pwm_mm_sel", 0),
 	GATE_TOP0(CLK_TOP_CAM_MM, "cam_mm", "camtg_mm_sel", 1),
-- 
2.55.0


