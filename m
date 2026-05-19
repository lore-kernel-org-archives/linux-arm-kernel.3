Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED78ECD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=; b=vWs4LPv3fsUTA9eK8lIJpv9BhW
	mkgpN9x2L98y8WqByiykLL0lCelt+ngqiARuMB67Pc/Iet04Y1GoC+7oESWdYyyUv5zRHOhw6VDNL
	4x7tI7xfjz/usP/FrPXmGCNVfdRN5nYyfdMtbZt39PjaPL2Uui0ckn45nli2JXGGl/6FbnNYavubh
	DicDl+abSkau5VayncGgGhjJde0Udsh1MnPxdLKstWKXLkpnv4dNwT0tHNpz5P6xlewNuiFpuCjub
	rRFgm07DdUTnRLfUBzxiPoPpBfzLHm62q3s3+CvgmOEr0uG5dfMbAmyjJ+2EfMEYj6F9e0e2TFV9W
	pr42PUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT04-00000002y7D-2Fr0;
	Tue, 19 May 2026 22:33:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzw-00000002xyS-25CO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:33:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso50272795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229990; x=1779834790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=;
        b=VFVOHZtS+0ZXMPcdIRkGXgP9d33kq44+Mdr4nol1qPOYCKO3A7bmWFW7WjwScfgWOH
         wUNUfHsy+o+aDFami0Nq3cOgxiKFx6LtJsCXIP+zml/cbfKl/HhIQUtSbpl718fuzQiG
         ZuOgvpLDk9VioaFDTG/mwE/G5MofNyPHiaBvWb8+klMyuWKGaZr5NFe1eU64wt+8pcHf
         UP3ewOYjrTIGulr2yfWH1q/quSyTRJyLh0bq8n8Vq2XG13lB0yNqaOasB26U8wQixIfC
         tGrNxSQflR7sAtO54UePjNR1UX+3R+b2JliSr7ktXGqxDhEeK/RSpJGJTlLicWYvuml4
         5myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229990; x=1779834790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=;
        b=R2Q5cUfAiBMcwn4sUIZegDKfKgPk0b8TYOXXYUjW1cpIUdxsuSPkEL3SdtrMN2NkcT
         UM1fo6zRm1UOFSopWVDBV8UFFzymL88I3HK9qu17LoPGpqVtTua/ovr9dJReZTvTy8NS
         gSjMQDDcYPuzaKt4M7r00s2Z4Cjj+i9lQ5XMYImriQFSnslHp7+n2GIMUVvEdYgX2xUX
         bLlSrQyKcruBEShp3eC22vUg9mq6RsxlrtZv0STl8mF5EuyIccNHsSXywigCqkcaKK8n
         aysQzV6avmE5UIEQS7MfWDrqVsi5AlPl18Oya0NzLIltQbDfkkVSbsGpIr2re8nbPeuu
         lU1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2gWoGGvVlhD7oac+iu93M6AvxH2FvmQrssd4zlP12JZ20BKJbSdXEYMD0njTMs+xbR20U7W6osMp1Rdfh+lUe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3tIqEkaI1uDNRTZu5s3Md5C0yYGi/BaFLY8gOm2yOBwPI34cE
	LXY0HQLBW0hx8kHqxTVZ6udaO9tKT5lOm0xX1Ws5EZq+zTx0mvHJ1xYC
X-Gm-Gg: Acq92OHsFfNZn2njo4ObGBmBsfXGJr9FBYhjZei7+dQw/7QqAsruZxtKzDZomzSwEyt
	s3k5wqs4VICC2zOpPwO20a+kyAenedgw+GyEuSdUoNqp3NcSsLgjqqnujwVgLMDFdWtY+7zesxE
	tp5zclaBt2SuZWiuZKk5lBWHJ7vrj7CbGGmrBk6gq7N9NevPO1GWXclklhIwjAWUImGlnLUDlON
	OC6vhSbHuEgzflQWEThBwKpsbAQk8SMqMa8CQi23BfxaYIwvsqy8cfIjvSevf0fz338Q4rkpeJZ
	xsefiIv5AFSjGK7PDMLXlsYHeqWuOG7ZcraDtYqT622Fp7MKNpr5ps9H4hdr3O+j8v0Hvi0DNyw
	9CVsb/asUKYun70FUkG73/N3qWLoA260Y8Rep1+WzTyOQfL1wg1ESqwNnBINqeLeuS+A/N5nPwy
	75iKsoAym6pnneD8g4TkBZW7uxc8/MMlF0pF43/y7DDCv4Uft0cZkKcxP1gKgOKRYeF83IwH/p8
	Q5XvEKMGw==
X-Received: by 2002:a05:600c:82c3:b0:490:778:4fe4 with SMTP id 5b1f17b1804b1-49007785080mr183034005e9.26.1779229990354;
        Tue, 19 May 2026 15:33:10 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:09 -0700 (PDT)
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
Subject: [PATCH v3 2/5] i2c: mt7621: clear pending interrupt on i2c reset
Date: Wed, 20 May 2026 00:32:44 +0200
Message-ID: <20260519223253.1093-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153312_556980_5C02DFE0 
X-CRM114-Status: GOOD (  12.43  )
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
index 700beb9e7b1a..d8fa29e7e0fa 100644
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
2.53.0


