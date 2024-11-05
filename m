Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09293D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=; b=vwBFWxSR/AtpHZ
	SFVOX7dp3l0zYCAn2h/CI3yJI6jKNHixNt2+YwsBb+hs9JKLaFMvbAsA/RkY2gWmLvBLisVxGYUrr
	RU6PL87Yh8M8jhmz8q42Q3bV3Bouvram3wus2Bfx5R1565TANLbYTv/gSKSZszAkAboHFnga7lsWo
	gPuzQjDXPDGECyZuen5dJNH93bIUKrTqgcDz9WRI+h+WEIxPxf8P6Kf64pJRfeHdp2G+l4kjnU989
	wuZhgGGzwNpnNi/bbB2DqaHOhabgbPONVhJinG8cM0KuHSdbYZwRBY35IWq+eLaq8zDtU19vxinP8
	bC2Nrom89o5eV2unsPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Exq-0000000GLUs-0Kzt;
	Tue, 05 Nov 2024 08:31:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EjL-0000000GItE-2ot9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 08:16:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43161c0068bso43381025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 00:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730794561; x=1731399361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=;
        b=acWZOVYDFz8PhKoBJm10IsUpIgHd6a7mFq/+DPwf+JimPOi9taDYHj62G7mS5B/ENj
         o6mpSubsla8XU3MEapgnOmsAnHhVlINjJmhJpEvnlqdO+9qaYuzeadqAD2ZDxI+JNqEF
         lOJrSo+ZDU9/u6gqZc3NjQ6UAQhte8dHxlOCVgHcmYSC5+a4DPCgCWPygyJWwbqfadlD
         ucS0n8ZZViCCsieJ/+JL44G3CdBG8h5G1S8MhlBEw2qbc8OT2v5aAKnQSuYcZYZldYns
         WdAiYMasR5V50aeOQ4NZwU0gHvF2kJhuz5dcInJA6zj8Jr/mcr8SUsmpZdHdU3SJ1C+L
         D8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794561; x=1731399361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=;
        b=Uxkj520/t6J9hWClmkI++7AlMwJLL3NOGxMurKxJ/XkPbwFWmtnirK6lw+ZSui3YqP
         7kTGorje751uDwWOgq1eWL8MI78PS8HPhEp/6lH/OVpEx7MeYqU7ta8EQVscYD+pb2bH
         ZIjIEVnR8qjKMqD2pTgg2yFqiX07R5G2QdFZlo/Nw+4K+3FFrlelbl9U+BBkea2RkFKw
         I5czkeqb7GGFNNrZtLMM+qCTMynll7Cej8Qhq1i/k1TGVL56x9A+Y7cUMYBFJRqhFsj5
         Q6HL5mKb2jx5Wypxspok2RQ9f7qpolv0Yh6dHwlfGDSnjIWNWe0nFfb9ie5ur6zF8wuQ
         91oQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7qp7le7hsc8h3WfE90QFurMhr+vNQSP4h2EBOC6mh8sG/f/xSCB7IDH3lkH0X1Rafk/ck5L9hwrKVWBenIfK4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/fzAgEcYGILd85v88qxtdWZLhcTgEtics+9xxy+kQg0IAc9mB
	n0x24LYhKEdsCpeSU6sEhHdgtAl9MeVUiUpeoyZiys7dku+rHrdhgoYiQonXa9A=
X-Google-Smtp-Source: AGHT+IH9UQ11fNXpdFOhjy8kl7X4IJOb5t3oapl5tk/aAZXx+Gk5rB624QCYrq86lUsZIjDr0Ae/Tw==
X-Received: by 2002:a05:600c:3b25:b0:432:7c08:d11e with SMTP id 5b1f17b1804b1-4328323f5f4mr125645285e9.1.1730794560804;
        Tue, 05 Nov 2024 00:16:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917f0bsm203801475e9.17.2024.11.05.00.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:16:00 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.13
Date: Tue,  5 Nov 2024 10:15:56 +0200
Message-Id: <20241105081558.3980044-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_001603_911442_56DBB8E5 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
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
Cc: alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.13

for you to fetch changes up to d1312c5c06f5cfbed55207cdef4a319015042579:

  dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x7 compatible (2024-10-13 18:33:02 +0300)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.13

It contains:
- DT bindings update for the SAM9X7 TCB block

----------------------------------------------------------------
Varshini Rajendran (1):
      dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x7 compatible

 .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

