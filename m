Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907DCCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=; b=NRpM5WIHUPkMLX2jJjWUw0LT0+
	Nv62pThMrHqh14XHeAHvOBs8A3kXsDxbfeGBGab6tYh8cw7w66xYtaPplSrkUOuxAuE8x3SQEUaOx
	rg8YKX5UEi5wkllgqdw1UqVcC4KqMDRAFTgo+wQ+OGblpIz09G5EpPzgi4I6BBj+ULMxkdrcvf/5m
	mzJqbZfp4YpcKbOk/h8sjIoo4kKS2Y5elvJU/AHyFWJrTz/HM53Z7KJP0xDK/5QxIPpDIVlEP/I+E
	hdNXoEtf0h8D6K6I4ihkwYs6gN5Soyhrgi3ixGbd7qVNZ9LkY7ok52iHc/No7N1FFTV3y4hhS7a2t
	cbCzIIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiwR-00000009kEw-3P94;
	Sun, 31 May 2026 16:23:11 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiwP-00000009kEC-1MJE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 16:23:10 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so83997466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780244587; x=1780849387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=;
        b=cmaI1CPBEzUNSt/4oio6zSpXUiZLLv/yGHi738ndj6EB3lAeYQYx8JliMfrVpCcFgo
         jlBXx+GHGpFZVvMxV8Df7gRfViFqSWwF+1VC7BGO12943RJzfkShexDnhT6nM46YUTcE
         /KDn3NHbL/GrJFNN9a78fnyOMX1y5w2cGlJZV0HJIO2xSmr8Ye3Louu8AUEzRKGtN0xA
         tJY3YFM6EpTvpFDPJgM20HBdAcr8PZS34Cy+v79JDklGwhDbiOUZejbyZSot5S3h/vAS
         fcTB/6lZtOgoONpfdrmcwJXqtKJHrow4bVr3WTwmNPJLzVqkSBjPjnhDP1/WVYhsyYzt
         0lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780244587; x=1780849387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=;
        b=FzD1aQY5JtxGb3ZxHKTQtOhEWva48uGyPMEMgYYUBdNnPNoynAdO3h2kTgJeIQH+Eg
         zFhAVZ42B8PzScN2Dx66NTJLWGi/RUjM98PvqzbMn8ZwoKGC2pOsowGO7l56cqSh7q2n
         yiDUyoiEOQZyoHmIjc2/zryEVbr5N3EiXDt4x2z4GFqM//EeoPzqflip04HjdOTRfmDX
         JBfk3ok0wq+Jvc2qL6JlMLC8QaGtmfJxC9GtUumS2QQszfPXOAiheDoZIL84hKAGr6Zl
         RDYfrYsiVsxmIWvxgTA6Hw8CEQwqOM/jkhjHEPnRApolUZmJPnXS9QESVi7vBgIFAjC4
         Y1dg==
X-Forwarded-Encrypted: i=1; AFNElJ8KvUZ1a+gfOs7snsDrlynBxos2LAe1/8FF4bqdVoHdBI9VJj+PMs9xa0QWaA8qC1VzJJFIw0dE0G8qkpzMl3Wr@lists.infradead.org
X-Gm-Message-State: AOJu0YzePP22gHmkhRvGVC9uXMO/en/MzuyC/ou3HksVNsl3YPpVRA3C
	1yHpO7fLL/+jFr7jlxTqm9haQA+DCfj6Cec4h2VbBWBc5oip9CwcsMvE
X-Gm-Gg: Acq92OFxB+oJpsUY5Ccx/W4iGXrRTId19rmhfB0QmrRjsmwTIYtigjg+DgmYUavcj7b
	aKA1wJ4Zi1kLbhE5rcJ0PvMus9O4SgiOsY3coI9oYZrBPR3zInPVetCNKirSGWz86Qs1hAUzytk
	M+qjDIVAvGZWuFL5LItYNHSj+1H/VQpErnW7pcbAF/Pa361azJr9khIPxgBwNqs/gR335XMoJ4x
	is+41m7WiuuedBUsjB9hGNFzDppTzf4fF7GjYhWYqm8I0vqHzkklsGhvZsi2dtO0MZPGqWUAg7+
	mcT7sPWf+xJQDqRsA1kaml3LhKdj8HaBmIFVtrUWpetb+qDlLJgLB6It+3DNEBj8Pv4eH951OvC
	tFOuEnWW3L0Lr4yYdLgthQ/awpI30cM+gfxmmCRN9FX4Zqcy8U66IKZ6Kv3/KPv22c1VO+1uKpi
	t7cw375GJzvRRgDMbN3HiW7KrF/FhG+G7Np6vTkUqD84mcS6QiwUHloLq10g==
X-Received: by 2002:a17:906:31d3:b0:beb:cb43:f928 with SMTP id a640c23a62f3a-bebcb43fd4cmr125626366b.7.1780244586655;
        Sun, 31 May 2026 09:23:06 -0700 (PDT)
Received: from localhost.localdomain ([77.241.232.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed25666221sm29131566b.29.2026.05.31.09.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:23:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: mt8516: Fix Schmitt trigger register offset of pins 34-39
Date: Sun, 31 May 2026 17:22:30 +0100
Message-ID: <20260531162237.5290-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_092309_376370_3AF1D62C 
X-CRM114-Status: GOOD (  11.24  )
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

The correct Schmitt trigger register offset for pins 34-39 is 0xA00.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Fixes: 264667112ef0 ("pinctrl: mediatek: Add MT8516 Pinctrl driver")
---
 drivers/pinctrl/mediatek/pinctrl-mt8516.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index abda75d4354e..68d6638e7f4b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -244,7 +244,7 @@ static const struct mtk_pin_ies_smt_set mt8516_smt_set[] = {
 	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
 	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
 	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA900, 2),
+	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA00, 2),
 	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
 	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
 	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
-- 
2.43.0


