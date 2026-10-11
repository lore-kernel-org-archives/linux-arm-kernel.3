Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8077FCA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=; b=iH4JF+1xpR4+2oXzrOC8KbcGDQ
	+7OZLrnOMii4IxbdO5wHSkyp+nJgyDchZkZOoAApcBn8UKpQS5EzDYSLVsJgxDO97R8epAxlaDugs
	1z+y/6Rcv1BYMGbdil1Ey7WATAHhoLMiT6kOlQJzb3xlzuY8o2CG7/YN5Eq5Bk5oUETpE393i80+v
	7SeynEH4LTCQLpyuHN4wYbN5NoTFmYGPW++kHsTDsN8HG9nFU1d4PP/P/a+kJGUNlqp3ndyhi+1xO
	8O5qnj4g4tCpFNyplCWY6USro8EbhLG9AdzEkyfTG+ZfZs8nTUH27xJF6s0I3hXw1nqBIhMEtydg8
	2alADKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhey-00000008abl-2Yu1;
	Sun, 11 Oct 2026 00:43:28 +0000
Received: from mail-qk2-x09.google.com ([2607:f8b0:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFheb-00000008aXe-3tIL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:25 +0000
Received: by mail-qk2-x09.google.com with SMTP id af79cd13be357-934956d1044so62606285a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 17:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679385; x=1792284185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=;
        b=doVQMTAKEcjZ+pUa1VoYFyBAPQz8fMiKlLuRuPnXHB9CVsJ7ZQmrt9h7Fku7Lja81Q
         GXVujIg0WWMHA6dQ9shuH1vW5YcnQ2uoxqb+XWfwsERYKdf3XY1/jcdCWw810iaOUghY
         LTS5fsU791gjadH1r0aT33ddkZ4yMqQdtsd6pzGROV82jfutJKMTN/QbWhxWyiCHhYjh
         L3BB3uY13VxtVTZGIwF2bgPK20J3wjKzj0EZ3HCLzLLT0T/kDjpE2j3vs+49QpW8HWdj
         U6aI83OAZy/1lW6EgQBejPvuSI+OxkfOGKivTCxzsCi0uOiN+0TExQVtY2bSv1DlOuhH
         nI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679385; x=1792284185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=;
        b=cIoDueXu5EulGpNh14bX/WqbW6nS5Ki8r/6cl6nLHu4LRmBOismJYAgY41Zg+otYRY
         G1YZpmlEih322vrJtFYkDmWGOB6pQYWqDa7J/uJn8vmcBN4CadEuc539Gz75sIvC31T8
         Z+GY9PAzska8mj78SNox+vObg6wYPsKcLWPu/JYEsjoT9ssgKQ0NE8EcJmWhtdDuATe+
         l2xHbVSKm2Hkly8kQYLiSc0ss9K5wrxlEbOOP6LExgU/feTk0aWwmWQOao1qh8QZMY6c
         xlJM1B1WMJ7wlHeZbfML57TK24w8f5/bs9U8sVa8s1IzbeZKQiGxMbR63H0aI8eKK6W/
         pwuA==
X-Forwarded-Encrypted: i=1; AKwUvBxqdncEnlR7jwSXn4TJW/YA3oivX6YdDv8BwzQ68gBEuK/JjkwZ4mhoqI1IApimUA/NXRW58nr6RZVK7Cq7eVqZ@lists.infradead.org
X-Gm-Message-State: AFq9FYIkVDtr5RuWj4iAe7QhbTl5I/5A7URbn/352TR3G3WGbxRQglLo
	Gs9EulQgvjZqvMbn7NiGgviTNNdc3kdYdOJ9ptZheJaXOC1EOT2a3QEk
X-Gm-Gg: AYBFou28XqR/0HnE/TPFk9g9OrmnZy3zqwgkepVdjas+3LjTsCJC7+kijUAJZqRj8so
	M7RMDE5Hw6C9e36qoCzESfpqerKTL69uL7O9QihTOll5JrL8zzhMY85vWwj8SDXNHnzuRGavWF5
	fos9P4bIQqFKXlGQBBMoS1YFwgXXgve5wP53YAtKbnK/Oyhg6x7uTOolnzqhgzk1EoQVoKr1ZCD
	tK3wjhh3MZt7ZHnscSBe5Ypw1xAE//+YCbACqwT6BlLHnmM1J/SeztzxmuDTFj/TWcWq5V264cV
	d4uam4Ub0CwUa2YDiw0z/zDXX8EvDrAsE2aXszMgQZMX4PNECPaYgjiiYoQT1kPlOMozDbr1K4H
	vYQW1Dt8TIdN0E2IRY0W/BXynC7+ww4/TNv+YMZLaApEP0GvjuKxHT5dFig1yK9GyVJ3QVoda8R
	ZlIm1Bx0ZPM6BnYj/dHfnttI8LypavhwbtDwKYWSFXJbTM6SMOs3F/tWtBuFppzDaF0Py3eQNtF
	ftiGw==
X-Received: by 2002:a05:620a:c53:b0:93c:677c:778d with SMTP id af79cd13be357-93ebd29275cmr999021285a.59.1791679384961;
        Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/mediatek: mtk_crtc: Skip the empty connector route slot in destroy
Date: Sat, 10 Oct 2026 20:42:47 -0400
Message-ID: <20261011004248.1117649-3-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011004248.1117649-1-agentzoan@gmail.com>
References: <20261011004248.1117649-1-agentzoan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174313_602708_757F6FAE 
X-CRM114-Status: GOOD (  12.79  )
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

A CRTC created with connector routes gets one extra ddp_comp[] slot for
its output component, and ddp_comp_nr counts it, but the slot stays
NULL until mtk_crtc_update_output() fills it in the first atomic
enable.

mtk_crtc_destroy() walks all ddp_comp_nr slots and passes each one to
mtk_ddp_comp_unregister_vblank_cb(), which dereferences it. Tearing
down a CRTC that was never enabled therefore dereferences NULL: unbinding
or removing mediatek-drm while that display path was never used, or
an error in mtk_drm_kms_init() after the CRTC was created.

Skip the empty slot. Nothing was registered for it anyway: the routed
components (DSI, DPI, DP_INTF, ...) have no vblank callback.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: found by reading the code; not reproduced. The same check runs
    on the MT8189 Chromebook described in patch 1 (boot, HDMI/DP hotplug,
    suspend/resume), but that does not exercise the destroy path (the
    driver is built in and was not unbound). Compile-tested (W=1) on
    next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index b54f8565d2fa..704931b369b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -145,6 +145,10 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 		struct mtk_ddp_comp *comp;
 
 		comp = mtk_crtc->ddp_comp[i];
+		/* The connector route slot is empty until the first enable */
+		if (!comp)
+			continue;
+
 		mtk_ddp_comp_unregister_vblank_cb(comp);
 	}
 
-- 
2.43.0


