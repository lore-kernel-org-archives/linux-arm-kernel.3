Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAC6C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=; b=CICD/RJxrZM/CL58tggZNCp9fp
	AD5c+O1331FdQMYnB8Zt89LvLrWkq68LDwSobaSnTCizZc+jecQhy93gwG1Tyw7cCaVcVtfCICCsd
	VysLa04ZHmGaShB/YMiuyH2IMKWtKIP+IOPZPiwKUGCdoXKOuAfdf+TY21crb7cmIxVhbb4j7tvXB
	YhwF6ypvjXmcBo1hXJvIGTNJJABhUp8NuZKVXtQpOY6F8zsGXM+7SI30D+UT2cFNkkejtUICA3osD
	hIeuuX6aFD4vjSfQHZ4OgAjLrqgfs/oGp7d5cbTt5qdpsm/TLRZrvF3x4ia2EPiTVjiC7MPJ3bkni
	z5iLnFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7H2-0000000EHbr-23B9;
	Sat, 19 Jul 2025 13:06:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud77C-0000000EGT9-0pdj;
	Sat, 19 Jul 2025 12:56:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a54690d369so2411629f8f.3;
        Sat, 19 Jul 2025 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929793; x=1753534593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=l090+j8Je2ASCu/lQzHhLRv7f157N8DTOHiQMV+sRe5BIdpNBNPgQ0VEhbUvsIQve7
         Vm7SjsURPNiQW01TOsSQKMtvoxpazeAnWaRnN7f9IF19qXs7yreJv1o9RlqIhcZGSAjB
         MAjoCADVCViBwvti6+v0pSNyKtCcjmG1qGDNjr6WPKLefsp9LGHN3U+PZvDs7dnP/xnD
         8lEuU0Tx9Xq41jMNkpYzf2ABo/2trnjegdtDLWG9DGCAvnLBrMUcFtmLzoXNZbWkdfkl
         SBb3O7riihMP4IYBt1xyBEDm9twl6m7w1YHTJ5ARKa17yuDRoIXttvB0vfWk+Jtsut9i
         1MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929793; x=1753534593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=Qs3z0lai0u/X8r2fsRDnoLFQIvBGxR3mOhMHMVavGPP2wgvVIZA+bJSewmhdB7xYOF
         aQw7EfIdqwNlzOayvqwvWRy99SwTpjcfzXaj8pYXMFkUlQ7ww86OVUwFJvNiuvEscgTK
         KRxQJCMYYYmuUinOa62zIq4XB1K8n+T2Lj5GEWL39U2yBdksJjnHwWx2LLhC+2Ws8Sae
         SFxwyRHhG2P0ih239DCdJC5WH38Q5bT2gUKdhm5a1lXQQfAWwma70VgxvfEAaoS6ILep
         Xww+JZMqfHA9/tJt++zNu4iEdhgCmDn50Bu+9tVQ5RcMAwuKSl3wtpe4dof8bn5m1gev
         Nd0g==
X-Forwarded-Encrypted: i=1; AJvYcCX2N6id4gGnnXkBaraFPwP5iXM2jUBLbHpjaYZYpNdkoK6TZ07zzzMPsb+K9zE+C1uj4M3etHhmWpiE1s7DFr0H@lists.infradead.org, AJvYcCXWBCZqYXsR8DJVUTqLgJAyswH+Wb/UQmLJGaRlSk56Z3yNb8sENk4KMa5obRPRP1joY6rTsvohIkUCSaxa0PM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMMvo6mQ5wi6Hj6E12HHTRkpqgsKbesUQ5oRW4GJNNIDOBp0ZD
	qMO+g5pZAu0PK+zDSiSWcc8XeS6EuQwLkbACYczqxLMbSGKLPBCyfQiP
X-Gm-Gg: ASbGncuFitPRyqAiTprsxPZcMg7Fl6YLffhUEG4MbkSZip+oiTN6nmWqzHJ7kt5c8RT
	oWnJcCFo149JaZ1vcYlFzStNfZIEu9cmUJQsrO1pAdfTnwYQmkawAZ8x/3oadUZgXjZitEwfK8g
	6CT+KMo6joycY39rb03aoaZTUrnij6Jz3T19NLHL3Lsme8nhDRzq2qlw4BnXwt6lLpBvSLZ6YZi
	YOPxopMcw9tGWrIiO43uzu+jshUpOn45WsuFU+5OqMQKtF4Nj7xQiCgw000WB8jiXS1/EHG7U58
	m2Hxa/N3jg5C9/ra19ELqqwv6h33ThPG4/pI7R6fBQnEcpLYT0rRbwBCq2I1q0kETPtgR1tGPU5
	enHj2ICt9pCB57rTBOwRo6lk0qWGKCK1UvISlmFH6BfqlrcPdT0O6w6/lNaQEt/ZVr+gylYNZJK
	6U
X-Google-Smtp-Source: AGHT+IEJqOmnIsKpuH3a4tDdiJtXnRHjaCXYYkD0bKPWYqXyqBE5DeAv6RMzSTFPplWMswJA772euQ==
X-Received: by 2002:a05:6000:1a8b:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b60e4b8576mr10995429f8f.7.1752929792353;
        Sat, 19 Jul 2025 05:56:32 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:32 -0700 (PDT)
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
Subject: [PATCH 2/5] i2c: mt7621: clear pending interrupt on i2c reset
Date: Sat, 19 Jul 2025 14:56:12 +0200
Message-ID: <20250719125617.8886-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055634_240271_DDF6F9C8 
X-CRM114-Status: GOOD (  10.93  )
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


