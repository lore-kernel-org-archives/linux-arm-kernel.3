Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 02:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rm7QBZ2TRjajMaYCqvf/rtcGfIdt/uUAyLjjoINRG/E=; b=dDa4SJN+oBvoCFunnshL63UJHG
	XYV8F3+okcj4U5FzDgeHMRTIsOoxWc8Gh/WdaTlY7Ov4EztI5h5gxcLcFA/sKVxEE784fNVkFFqph
	UmPwgsXXUtp6z7KPvbKCDrvlOZgnW7xhXVFZKGM9cq4auSqYLCD/cGka034EaRUpO3kaFOCtwYscF
	qJO29emO9J4zXX6pml8yK02gbXF84p7gCxaGK5EyZUcbdcOudoVT76bUC84czyHvU2Yruaeal/Fzl
	02N8h+C12A28yejy9NeAdnYAQHRjmtYgvRmETEPqXqE3wu4jEFreRXtQOUf/qrk1k+l40yU93Mso3
	sFtD4VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1tU-0000000DaUL-1VH1;
	Mon, 29 Jun 2026 02:38:44 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1tQ-0000000DaU0-3vSg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 02:38:42 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso855247a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 19:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782700719; x=1783305519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm7QBZ2TRjajMaYCqvf/rtcGfIdt/uUAyLjjoINRG/E=;
        b=RQNZbWeELOfiSi3rba1W5ua5E5Tle+KASOdT0KwjcdIEfA3gzdJ22ySsL5k5oSHclC
         IZt1Ou55m03t/qyu6V+SwZLuqiXqd1sV2tRxLRBECp+oKiXorPNR4Tw5alCxowiun6RB
         QVN3nXpIwQ7L9AnpsH895FTLC4Ab0tu6HgmROKBlofdrxgY+Ub9mlPoHvuocBp41ecX6
         PU2YkvKvCqoawT1hL84KhUokwSQjqa6OmKcoM3LbVEAZFc00vYUP5H3Oz1jLoJZalszm
         DjJrh3sBrFT4a0CqccsTfkUDtRBjDN/wjMOPirJqcUM3Uv70a7J9JvzHjXCk4ubFBb5V
         y0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782700719; x=1783305519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rm7QBZ2TRjajMaYCqvf/rtcGfIdt/uUAyLjjoINRG/E=;
        b=BdqM6p3hIY7M6nNnh8sZRK/sczh+Y+iP2/DT0PGsBxH/gR4BA4uBkNoPVHftDQAJqe
         xZmN6RAMl6oGqfLbvPKvKOAk3NK1dQXk1deSXAePaae0z9wizOFtLSsCxpO9pzDMbOeC
         AOjSdW+N8E+2cG88HhPZl0vkjVE53NMQ729Hpi2AftmzNM2FpRjrfDpFqQPKqZRHTbfw
         S0VztMR0osIgoAC38ackaTe9joWno6DgrKBxHuFXNteLjr5Ou8W5ztEm5JJVDmkeusit
         fuCjLupEPfz4uMbR7JLawNo5l8BC28AK6+NnBJsUf/CiPG+gVUlfVW7nWDepRMGgn1xn
         m5oA==
X-Forwarded-Encrypted: i=1; AFNElJ86hbt/AsGqv+vhkoPeMmYOlN3qpP6csgrBQoqfBqIAJlFWsMUQ/IqlB73FSuRNCdRafpg+Hf5k+BAuOrRFmqyS@lists.infradead.org
X-Gm-Message-State: AOJu0YyNUqOFJPO20CFmIyWVH0YLQG3v7aliO1mGBtbeLQ+NpVzvQikU
	ISeyyCXMG7IHGBJIuR9IVNR6tXzX9SMkNmSCMRlR723btQHB2Rd7xCcv
X-Gm-Gg: AfdE7ckInnt5QdF3W+qZ3oMd01B43U0yUgyf19DpaBk2P/Skw55UZzwvytqKJngJxGC
	TCFT+YVEoL3TxjUXujqNgUGw5Nd/A/pUuqZi3d6mKUGXkiXRyO8nquHHpvKs4L+f3OkHUc8qG/5
	ZJN5KjYdxiqv495uUGST8XHamjo3jfV1zgDy8zOYQ2RmxUtl+qjsj3c7Bcp5vaJK8Pl5GCdhCY2
	/3myoyno/ke9rHj5DQytp/ODoysGuEK7lxKIIrwzX8jH3XzjTdkYnY7OpCc+MzofojzasauqVB4
	t0wXFOx+ClWbrjlhqzqIp9Uf+v+YyH139ivonY3wmNXeCr1wZy2wRMmZNJcFr7R8DQbLQys5WKP
	3uBb75Gob9j+gcbXEErWrcUELT+0+QlhvBdnCPw8FFpVRyjJKBtXRlFYRq03fRKoqUz+1d8l0qG
	VvxNs/tY2dzuE=
X-Received: by 2002:a05:6a20:a107:b0:3bf:6c08:fb9f with SMTP id adf61e73a8af0-3bf6c091423mr8265130637.51.1782700718910;
        Sun, 28 Jun 2026 19:38:38 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm6914869a12.9.2026.06.28.19.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 19:38:38 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: carlos.song@oss.nxp.com
Cc: andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	frank.li@nxp.com,
	frank.li@oss.nxp.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v4 0/2] i2c: imx: Fix slave mode corner issues
Date: Mon, 29 Jun 2026 10:38:27 +0800
Message-Id: <20260629023829.152651-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_193840_977613_1D0F5BC3 
X-CRM114-Status: UNSURE (   9.37  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series fixes two issues in the i2c-imx target mode.

Patch 1 defers slave pointer assignment to after a successful resume
and protects it with the slave_lock to prevent races with the shared
IRQ handler.

Patch 2 cancels the hrtimer before clearing the slave pointer during
unregistration, preventing a potential use-after-free.

Changes in v4:
- Patch 1: reworked to avoid race with shared IRQ handler, as
  suggested by Sashiko.
- Patch 2: unchanged.

Changes in v3:
- Split the original patch into two separate patches as suggested by
  Frank Li.
- v2: https://lore.kernel.org/imx/
  20260625160219.55116-1-liem16213@gmail.com/

Liem (2):
  i2c: imx: Fix slave registration race and error handling
  i2c: imx: Cancel hrtimer before clearing slave pointer

 drivers/i2c/busses/i2c-imx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.34.1


