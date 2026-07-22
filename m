Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BF4C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 00:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G3zas7MpBZKk+oDgMVzjx3UamWGdsP8MxVU5Ixr7UTA=; b=iX81sGPs1xs73Ygn6HO9BlWYk1
	72Kl9EjVK48YlniTM5HSDw8jL+Q/c/xSZIgF+aEeNGwEVZAaGQwcX2J/q5MdEueJPLt6PduYpVOzV
	RwQ2iD9Dx/gjDTv2Z7DFNJ3DX6m3xS/8eGImTS8JGUTZdsAXXw/vxrcbq+ndyC0RgjIbSjXJoSAwf
	NQu5fxmfA7z6GNR8Xu725vrmDdbW8pe1EPplCrgbkXe9W6/4QHY2qXP5V4V7WhUEu+AnFDpSsZfFa
	A/3EFInkce6jJ4tWPWZzOG2g5QfvbH69WuONzMd0ytvAHoMUg0UrLoKKZr7kzDGnv3FgJRAauBejt
	HdDzJljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLGU-0000000AfRa-3PTg;
	Wed, 22 Jul 2026 00:56:50 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLGR-0000000AfR4-3z3V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 00:56:49 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso56643206d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 17:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784681806; x=1785286606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3zas7MpBZKk+oDgMVzjx3UamWGdsP8MxVU5Ixr7UTA=;
        b=fCSAVttYlDUnjIY/RBAgcqs3XnDQtI56+ozYu9FhCj0aaCj+6oZ7a4w7ulLTUM/TUE
         mRCGC10jX/DyzOgIc8v0WwLalg9syvbJVvfFpO2/Vweio9qXvddoyfUGXGaEEsLaU9ei
         ShQHTMSGHYkZlpf0qaDHXLwAQ/2XOUAQ12VDqZjeyYtpFMTp6Ik2nFEL0SttmRIjn+a9
         TGFVrGE9NrVR4KaBjyebJe6YiKWYSjyyHbfOFhyswDA/XD2tb3XI10SQh7zVprOo97SC
         AX/MPStadZ8qYqarFM6HEDAHxwUM/i8M6qQQxlubUSOOHKwR29Ypy1Z2cYkb3eraNXZT
         iPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784681806; x=1785286606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3zas7MpBZKk+oDgMVzjx3UamWGdsP8MxVU5Ixr7UTA=;
        b=p3gXG8J81rXccYBGjyJwETbfVn8x7ZJYW+HtlITGObEqu+YkVptKxffFQ/1ELIkHTO
         SCRQhXI1vWINslRVhX0JSxdDOA1bwjqV61LdEJSQb/ZNcq2xjroZBYmXR7/xB57jpWbJ
         673y7BaGNIXR50a7mSpgdgN+mHVYBA6GL61wdm0NSj7yzZBlL/veaq7VryWeUqefXMiD
         Bm6A/Se+omIiF2gS8vsviTMXx4G+r+HjpfD5SMD7zbLZPpz0IZ61lk2S86tf0wdAMd6j
         2xXIHpvFS6j8Us+XyQ8jgF0Yd7W0zdC07UJOvOKeC4VAuDksArs6S9Z7xQZkW5WrmNQW
         7ziA==
X-Forwarded-Encrypted: i=1; AHgh+RoNasdTM0908y+4E4s/W0Rhy+Vwfk6TbPa+S+fdgylzsinb/jf0l16Bo4pMjq4MM/O3scGOvPIqehx/detoK9PO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6YfnjtT4b4wFJm+7Tvq6CEXmHfWUBUplEi0kAxbM/0CPhU7Em
	sGD5XnwUmP+Ls2Je9M53YR90LsItf1ugfbDDEAVCqk33Kbz60zERWg7X
X-Gm-Gg: AR+sD12dE4YQfGoaQKtqhWsPgDDsY1UirU3YE6M/nnJeCLVzxzVi4K0OciAAJy+sFvj
	Kq4WZgB9nMLR5ltUwjllIVN05j6PQkQMHqmsO67u/RMoEJmKtGqruD4H3wsIcrcxAIUAIZamKGc
	jKk7x/AQy8MwKdoPtM2TJl0K166FBi8e3FtyOrZX8Y6HO3Dk5D5YHwH/FiXg9pv5pu9hmjGy1Lw
	4TfjQ51JGGmKba71fkP1/XiKujz0xwR8vlxv1q6T0i7QHWmPoBfNLgTnHGyszx1mYFW2L50ufId
	I82G7XigcNvY+jgiLu53w6I53dhebVcxJu0GL0NLuoCU2Uh587eK0OcdAtiKkKRd8e2XPb9znrI
	swJALhXGEVi5OV19/rbwzGO8X8OjZLdE1rr5KURMJh76vOSiOr7m35ofqP1CxjjNi4dwrf4Flx3
	XBEwxa17+EB8rz0+wvP1NK6bm4zmhJM9H3AYXIxX/GXeSiGjL7vHgIxQ==
X-Received: by 2002:ad4:4ee4:0:b0:8f2:22c8:e71b with SMTP id 6a1803df08f44-907b9bfed43mr25560426d6.24.1784681806174;
        Tue, 21 Jul 2026 17:56:46 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cfcsm8623966d6.44.2026.07.21.17.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:56:45 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Date: Tue, 21 Jul 2026 20:56:43 -0400
Message-ID: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_175648_002571_53BAECA9 
X-CRM114-Status: GOOD (  13.13  )
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

Some sunxi-ng MP clocks have an M divider but no P divider. The A523
MBUS, IOMMU and DRAM clocks use this layout and also require the update
bit when changing their rate.

ccu_mp_set_rate() unconditionally builds and applies a mask for the P
field. With a zero-width P field this produces an invalid GENMASK()
range and can clear bits outside a P divider, including the clock gate.

The callback also ignores CCU_FEATURE_UPDATE_BIT, so hardware that
requires the update bit may not latch the new divider value.

Only update the P field when it exists, and set CCU_SUNXI_UPDATE_BIT for
MP clocks carrying the feature. This matches the existing sunxi-ng div,
mux and gate helper behavior.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.org
Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Based on clk-next 8cdeaa50eae8 (Linux 7.2-rc2).
Tested with strict checkpatch and an arm64 W=1 build of ccu_mp.o.
No hardware runtime claim is made.

 drivers/clk/sunxi-ng/ccu_mp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 7cdb0eedc69b..aa6cb20447f1 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -237,12 +237,17 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(cmp->common.base + cmp->common.reg);
 	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
-	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
+	if (cmp->p.width)
+		reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
+	if (cmp->common.features & CCU_FEATURE_UPDATE_BIT)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 	reg |= (m - cmp->m.offset) << cmp->m.shift;
-	if (shift)
-		reg |= ilog2(p) << cmp->p.shift;
-	else
-		reg |= (p - cmp->p.offset) << cmp->p.shift;
+	if (cmp->p.width) {
+		if (shift)
+			reg |= ilog2(p) << cmp->p.shift;
+		else
+			reg |= (p - cmp->p.offset) << cmp->p.shift;
+	}
 
 	writel(reg, cmp->common.base + cmp->common.reg);
 
-- 
2.53.0

