Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B577CCC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrpJ3R8Qy/E0WIUg4/pXUKmtopn00SRG/AnQSF67mz4=; b=GVWfhSy8/L96lCmXDRkcwK4Wp6
	ihrww21CyU7wtBh98i0Sky0WPVfNroCEI623XAQ/9K45T6Tais5FTcmIlIEfvHZ6kdfGrdbp8G5Yn
	XowJM1YEyFMYftZ05zrgZgrSmclhgOPKS1o2kt+RS6mCiV4rXypT87Cj7nIsM8tHG/sBApZej2iVY
	5Nle8YlR5UNX7cXvu6p1ks7wPFHueiIOLTEKeBDOBs/zBfQdQPdOqQQ9xySHR1YOgSMbHnpHbP9gY
	S4PVyBqotNL8k4ANdIecdG9mp/IChTQQxnQRk3DZA1dJjDDMxQTC98KSlpbTvilmMgpMwykQEMGWq
	jrYM7FKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHJ-0000000DGan-06w1;
	Tue, 13 Oct 2026 15:18:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHB-0000000DGQu-2aoq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1639479a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904729; x=1792509529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrpJ3R8Qy/E0WIUg4/pXUKmtopn00SRG/AnQSF67mz4=;
        b=ns0xol1LzHQOU/3PQVmzlA6gKp+FKFduXfJW13pPm57oFshMa06/A3jsLLNNyR8f65
         r82Eza68H/oWe4ZZLS92EafxbLqP0re4vIUr/ZAbcIwjKuzSiWfWNhCb+W77dfCCcKEc
         KPCvVVRbzHu0gzvP/jANkFXKHQrcX56VlF7WPkxxNhi/t9a78aK7pFP9/unN6wosdoEZ
         aNNj5qkfDLpWW0YcOAs/mwUWao1PnD6n5VGrNiMiZUZhR0sUnGQyd9hx0Igd37/pk6i6
         5PkJqnHeOZ9gfBDcW0iBYtCkwLGPjIA6akqczECQlCqVtCNS5xHERS+aQvQ0tAhOgUvt
         CS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904729; x=1792509529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrpJ3R8Qy/E0WIUg4/pXUKmtopn00SRG/AnQSF67mz4=;
        b=OQsjZEt2cZJDHXMK8aMoJjxMvFX1rnV87DIwyxK28ZO/QBVcuhjLLf/ER+gPGx7CK6
         g/66JByaU2tUkMibmTzmND1PQAI9JwY98XIVnzAuvWuJwgS/LvlLf3WPGvYQgB8KC1KO
         fNUPwcp3sQjeW6fVyC6blbQMesqPphztEAWBDRrapQLGRatPJAj5qDODC16UvD++82GT
         n/K5yzLXrINZtNywfcQ8BtchGZJUdvHx0+mrPu0GnF1MOGfLvFX19qwohExPnHYt/Mw2
         CAHiMfubfGoPM0/+SIUVZqfWs6UsBVxS2QABviLnYjrEVgTFovmy/tzqCjRu1j4k9mxM
         Cp8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxds7LYimbz+KN2XtYI4AVt3EkSlr5wim0n2RmXJ90wLHCnHLe+1NxKrSnmfaMaPH3pYXb5yGG6/o8MKjQ3zYf1@lists.infradead.org
X-Gm-Message-State: AFq9FYIETVL2HxDb6XdTOIw44VC5PvtTvz+/wX4HkHNOlBEl3EtIpcAX
	BVEwB4MocE+Hx+msZ7FZri0SXyq2JBDm3qWhTjbpxkziu/AKhm0m9Vct
X-Gm-Gg: AYBFou2ncunqjfIeM9bpC4LUErxU1JxG5gD8ObfMG+Xp9nOoCZgoaBJhg4OWT+Nl39B
	pIwLl3FZ8wNFrqOLvD65JPYwvq2er5XMBW9UzktX7JsRx1Eyw4veeym9haLR+BTY77aj5/qTuiv
	FOscOK4Vdkh97DrkVgaoZF6t7UF+l/+j9JqzZ6uemr/UjBCTC7gCoP9w8CippmBcs6zM/+MQBiO
	P7Z5ubBuwqX5EAkvzdXZMj3Sixt2Owj79n8us6VBb3vqXO5GkbHPyS++8ExKqGZDzCK+FQM/qld
	P5CfXyAaMX66kn20GVHeHWnL7ZNezx2kTPVkBbgFkAbTmEKs5LiTJQn/eC1ykYBoLUiTtnNbJEI
	XvEHwGAckkjdZ9HkZbTS7u75/9zHgd/oF6kkmgPAacOviVhsekWUzNZaXdc8smF/mBNdqGJXFp0
	gNfOL5RIzDKZprMLgO2Rb0npgxUIp0hOaefJYuoGwBJU5vktwuQscVqK5iwuMKjxpwLLRXyCPyV
	wSgrcyPBnz52HW6TtRoEPSpNsVW
X-Received: by 2002:a17:90a:5184:b0:3ac:17c:6e82 with SMTP id 98e67ed59e1d1-3ac15d46137mr2707843a91.45.1791904728712;
        Tue, 13 Oct 2026 08:18:48 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:48 -0700 (PDT)
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
Subject: [PATCH v2 09/35] clk: mediatek: Fix index in composite clock unwind path
Date: Wed, 14 Oct 2026 00:17:08 +0900
Message-ID: <20261013151734.3177690-10-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081849_674281_8B3B46BC 
X-CRM114-Status: GOOD (  14.76  )
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

When mtk_clk_register_composites() fails to register a clock, it
unwinds previously processed entries. The unwind guard incorrectly
checks clk_data->hws[mcs->id], which refers to the first descriptor,
instead of the current descriptor.

This can cause the unwind to skip entries that need unregistering
or pass an invalid pointer to mtk_clk_unregister_composite().

Check clk_data->hws[mc->id] instead.

Fixes: 3c3ba2ab0226 ("clk: mediatek: mtk: Implement error handling in register APIs")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Newly introduced in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..0b10a4b14a6e 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -363,7 +363,7 @@ int mtk_clk_register_composites(struct device *dev,
 	while (--i >= 0) {
 		const struct mtk_composite *mc = &mcs[i];
 
-		if (IS_ERR_OR_NULL(clk_data->hws[mcs->id]))
+		if (IS_ERR_OR_NULL(clk_data->hws[mc->id]))
 			continue;
 
 		mtk_clk_unregister_composite(clk_data->hws[mc->id]);
-- 
2.56.0


