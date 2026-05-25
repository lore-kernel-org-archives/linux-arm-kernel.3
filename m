Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCD4CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvJSorXmXxmL+aeZFtdmPubxjaIL3PRnUEO9LNvqe5Q=; b=eI9/AyXZn/JKKouCXFo3nEIjSh
	Ddt0SwrUhr+ZsreTuvgLYc5rDLZmoJR0uzwIc1x2hwte4VHkb1/OEa2V2iFA7vFZfJ4lUPdXw/G4b
	QFXNFQzZEco9rfJIKnmURqAHtKVQSqw9OKwc67nSvWZ9+Sy9geZrHkS37T70uo+SFjj7FfpQAvvM8
	SWbAYDljAN7Xyuer1G/WWp1TDGJorPWIcJkxJ2K5mcXDHb+BdoYs0xWAfR7S5aY4z72XunzW7y5u/
	4ZKCDVLeHetAydtufVccaLNb5MUrl/2Gt2wn1P3plVK35fJb+DWuvdYOPnYrN9EqXJEq+kcEkh22r
	G5W6Y5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYJ-0000000Gnb9-0WWj;
	Mon, 25 May 2026 09:24:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYH-0000000GnZv-2pim
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 09:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OvJSorXmXxmL+aeZFtdmPubxjaIL3PRnUEO9LNvqe5Q=; b=Rj+wQ+0EtEpVrsaJR2U6ayVV58
	87cZ8FXyuuWZ2mZu1oEq90gHpGs05+pBnX+LofCex3D7sp58cyUz8EE0ljhEiPnS0rcWGT/6nWyU0
	kAPSj2ussiT/OPzMj8ixlcmaf1lCKsV3f77lZMXqCk0WyLJXDMSKTF7m5+4RCNkS+eWHSAXUZ52wg
	M2VLrzLuYV+asZtz95lX4ZUvifXzBNx2yOCn3ctm7DqyQnzwYyCiM4FKLDGdYWNmVPidMpitZGLky
	KaeAwd46rcZs3kN1t1mzB44lLTsk2hfeTv27NuCod5tgZJvc5/mcueN0znRt5/QPtk3EVMuMCE1FS
	8HcrI+SQ==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYE-00000008tD5-1Bin
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:24:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba928852a5so65026585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701084; x=1780305884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvJSorXmXxmL+aeZFtdmPubxjaIL3PRnUEO9LNvqe5Q=;
        b=AnSieK2CgpOntrYz0By/mY7FrDd0z6AL/Snd/FrFuqLzA3CyH12R2D/bk5iHdrBxNY
         8/VnUM/k9p1TTmXObGZx+g7ZfUlPeA1xWa+59WIq6GgnUerGOwzqA82dFaXWaj2iQldQ
         T905A+BxQFzPfwcGTYF9dAD2Zo5UlrhDrUOu75nNiAKGBbrVDszfkQI3qxaQ1fZ6Epv2
         kNTe+IqmIszXQqv3oUU76m/T9D5CzXfQ8uvBlf2FPOaWLP6xLjPwQs7INNgCqGRW7WaP
         snTNZ1+ZXL6JLyeISy3mDLfT4YuzgYBQe55dAuu2oaO3B/lkHrqbOXBShc23cepTlHtj
         8kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701084; x=1780305884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvJSorXmXxmL+aeZFtdmPubxjaIL3PRnUEO9LNvqe5Q=;
        b=DfLHJn7T8E0RhTAN19uAw/QewpPzKppSLcrIreGuKHW3y1x7mbymza8Kg52RyaFOzu
         NDGqk5oM6YrOh02IHQCctyHZHd6vj5Vy4NCKENr43DC3A+A5M18ibF74PAA7N9gxZ7WZ
         h8pWQRdiru6e35/cWFHgLZM4yFjYuCJc8GUoqKyiPULoHNYj0VjD7aZQyrK5Xz4L6VxH
         xe4KBisDzKRbNZ/5Vne3bP0NP52OoUiqnavxI7u/Tq97Im+fDz4vX+v1G7yEvkzznlph
         On6QGdEEG5pXSM9OgQ6JNTI2QVrfYGaQLMuzY79WwWZwKjtiFJ+yFG58jVDp8cifDSuU
         xK2w==
X-Forwarded-Encrypted: i=1; AFNElJ/NQOsmUFdtS2vdZtRq043e8HMCTWVfwZywLTrsqSH1lg3bGUsiEIshz9WBQIa+u7SSMSAE+rLlDd0tQHVFVHRn@lists.infradead.org
X-Gm-Message-State: AOJu0YwjBRhLIjc9NyIBTYBbFP+L2yvyZt6X34F7ZUGVfldV8yIZ4vNa
	9eQsTwM94OWN3Nn2zOgCX5Kq9d5DTUyVlEyx45ALg4ZwlcNUl/Covg/u
X-Gm-Gg: Acq92OF08CgTv1mDFvtYRT3r3nxryWPQmAEroFrr7H/05ZZ9EVHnGW+lCCavB6r0i8n
	hJGBN8Utx/aZeYbG1dknx6WuAb1h+FBcn4nQIpXlJnqMHhCfQ2Ge/NV74gpHk4u3C6D9asj7+h7
	1qFJTmduOwl5WTYUyt+pnSweYYxrZ9u+3zgRp6OjmqijXIPODzfk0XgUOgG6gjEz4xMraZIzs8U
	OGojguJzzUpPeHboEEjg0TXHGAQowrZy8rT4eRVz4IUGByEapccXnCr7v39Zu/eeJxlAwFGHY+2
	9D6e3TA+iGo8+qOjQEcCrudtM/PLAJ/1mBBja1Xojo3Rt7bo0CRGcBwtHICOPXDJfohPIDwjcDe
	dfLccdzsGKsC1+pFgvh75CLjklAYlMllqePZRIWPKffP3qmjyBkU9r0FFDn2h0HJ8yRE8ZuWkBL
	uBeX9kx0aMAkqPDLoqXcG4z3g6ZGpAGY3tIUPGfzpURQc1aI/zsYi9WKlNa0oi2hex34V7+nQH9
	IQM4kc=
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr143705685ad.5.1779701084161;
        Mon, 25 May 2026 02:24:44 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58db58esm85442675ad.62.2026.05.25.02.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:24:43 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: james.lo@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2] soc: mediatek: pwrap: Remove obsolete NEED CONFIRM comments
Date: Mon, 25 May 2026 18:24:37 +0900
Message-ID: <20260525092437.29313-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <dd1136db-1a78-4d32-a3ed-13691621c8ba@collabora.com>
References: <dd1136db-1a78-4d32-a3ed-13691621c8ba@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_102446_771544_CFFCF7B2 
X-CRM114-Status: GOOD (  12.60  )
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

Remove the obsolete "/* NEED CONFIRM */" comments from the MT8195
configuration. These values were previously confirmed during review,
but the placeholder comments were accidentally left behind.

Link: https://lore.kernel.org/all/2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com/
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes in v2
- Fix commit message (MT8196 -> MT8195)
- Add Reviewed-by tag

 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..87bcbfa2d5f1 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2396,8 +2396,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
-	.arb_en_all = 0x777f, /* NEED CONFIRM */
-	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
 	.int1_en_all = 0,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
-- 
2.54.0


