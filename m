Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4B5C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=; b=Rgt/5J8typQpx1KCvdGxfUTyrf
	1sOPsnTFHKyVtZdI/mNnz9giqvnbI6PhotF7VGdEp5yxmeVYwF1YQLegnlXZGTiMUobC+c8yN1ERc
	EvA0T0qc4f8xpEHpF0xZlqabpQ/3oSpoMGaa3OasLEmc4ODviS6SAvlwZZA6w9IgIOFkadsS+yHAD
	bDLAxBDuYnpU3BvITuY6MZ1QmstevetjkOj2pjZPP8Vmbn0KbkBwHckTi/YYKSqmKMcN3ECuGNr4T
	wgHa5fXSxTmj2C43qD+RAbgDA5SRkZCAjFHSe1gHH2CdbWKM9HmkVfjeV40TpnI+YeZyRkFbEZjlZ
	JzcyOIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhu-00000000Rnt-2M15;
	Mon, 21 Jul 2025 18:57:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvD-00000000OMR-2BBs;
	Mon, 21 Jul 2025 18:07:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso48923785e9.3;
        Mon, 21 Jul 2025 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121250; x=1753726050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=Dp8pNHcQHEVQVUHadmj/8mx1H8fFhHrS/lD65FOxXSR39ofWXSkyKjiQWy8ncWroTC
         lMdtYIlPV/McFT5oR+uxXLhtebBZDxL+tZaUiyXhDE4FMd+8vtgHedKoHJ6TLKvAukJn
         68ltXd0vpxuQ1yKciTom/BkNnHccupQg2oIjN3TjUbyg8Rc7X6QBYVwt54WGbsaUk0Y8
         /HnTmyvFmO2mBH7JADsczHIE8maIFJnC2mkjWgJvjIydswVXYjicIlNtGK0m15tEQrXt
         8ibSrmebMqW1+oMluDEpDCgufdisOWaFmzQQSz3cuOaAqvvengHsBDxOmN884BckU27y
         mAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121250; x=1753726050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=KqnWpEPbtVxm0nrbmSLp6bxZkCY45AJccaT5wGHpM0n+lBeqg5I2UP2asCpmJR2jXZ
         yaPGSUkfzMiq2ZL9pWZLTGZ5sbIYaMxoTAAgzW5AeUIEvyCwIGLopRtehdWxiH1maqvJ
         q551OfeWkINuLB+T3GX7JXHjzx878ISbYMoY2gF1BrEuaCVWbKRfRuOygPiy1HQyTCrQ
         BOfUMnN6XpPMLx59NjPRYQDsxLKuR61sx3kwLBUxlJREPqWSREZkBGZUmTpLMYbrr9b/
         NkhYvLLFzVIEqB/xJ7sIw+Q4ml2wJI3XbLIiJtGbW5+x6WjgXS/X8/QgpsWtiNWjCbvR
         n6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqCIf6MJx7ENESDxRhgMVHoN4z6u4aC4YDyxlCSvOnQBPtX688jVq6wCZkeE5NkRE1luFCcVDXVGJ7KkzpWtE=@lists.infradead.org, AJvYcCVqGo7173eYbqQQfHAcaQjwxT6rAfM6+3bWRQxi7C9+dp0YQgwA1ox9NGN3zXfk2JrH8dqYX5UlvR65Fp5REWt6@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZzHyKfeqCm71aHpdJxWsYWbivOned/UTAXrJdpd5mFw9XhR9
	MkvNGHjzjQmQGnsBDhxdMkFYoVYzqFqV/F7CtQCRk1oGEMRB2M/sJ274
X-Gm-Gg: ASbGncsrlbIjQE/mpP/RPfUTlQAlWieoGYAS6FRLRJ278+PZC0yopIQWlKpR2di/RyQ
	MKXqgiNLHAGpoUmSNgYmCeDgKEFfakzGu/ipvXeEdBlzKTHgKMfsPWfb6LBUXbs8av9cMYBlC47
	Ofy2kmEn86rGDs0BXgDnI1A4cogKOGyDB+VHF5ySbT0ayLlE5RHxIn0nnxE8JXoENduio/P/Qgt
	mF+WbuBcZkviz2lJvvGO9vUEtjId6YDq2NlJy9Rr+ktpd3BOSftQzSH12b0UGClDW2cwAHlmrFA
	636NAY+HA8PZwAHF22sE7HDBj3ql6DyEUS7PfBkhWIGv7PmCgmHGoyoU0H3Lw7tZSJvxaAqTMKE
	IB9d350I3xBNq7XbACPCg9dQ=
X-Google-Smtp-Source: AGHT+IEaJ9IKclVWpAiI/LNl2Pqjf/7hnj98qH2PFtCovmBuGGl9+iOZcDYxw7D2OIArZ9QiG9oQOg==
X-Received: by 2002:a05:600c:a00d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-4563ab1fe93mr127073725e9.27.1753121249509;
        Mon, 21 Jul 2025 11:07:29 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:29 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/5] i2c: mt7621: clear pending interrupt on i2c reset
Date: Mon, 21 Jul 2025 20:05:53 +0200
Message-ID: <20250721180710.2116-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_110731_551180_4A6561DE 
X-CRM114-Status: GOOD (  11.07  )
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

On resetting the i2c bus, clear any pending interrupt to have a more
consistent state on the next operation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index c0e13f9af3e5..58c3da92cea3 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -101,6 +101,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
 		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
+	/* Clear any pending interrupt */
+	iowrite32(1, i2c->base + REG_PINTEN_REG);
 }
 
 static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
-- 
2.50.0


