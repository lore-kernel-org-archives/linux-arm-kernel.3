Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7328ECC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1BLtIj0xEvl7cfZrXbIf/98tRmcqVQkUnaAEHoiODWY=; b=A6rsGUr19IF9JT8LxCJJJeVc2e
	lCLjB2doduCiatY9EAPv9gqJAeZG84xgsqEJ8Bhso5mxxTGIIwxbilpkFWVsTa8m323qFql0SqtHZ
	YDz5j6GF1BkSDNOk6+gBgoWS1GMXgVruCCxkaam/fLTix36ed02kF74pdBbFX3wXcyeB28lxQdLyy
	t8suZ9R9EVHQphF1nyVCp3iy6znXzZGcMmKMXecFG7kgJPK/MehjJXjqtmwC2wbGjxhi13Z7HuXcu
	9u84rduJqdf8M5rq/f5rt3hK/bYbyUNC8kuhIbqgkcwYx03afYtnGeQxRYG3xzvA/lF2KeT5sOy+g
	A0zbT8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgRB-0000000DiXI-0HPj;
	Tue, 13 Oct 2026 17:37:17 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgR8-0000000DiWZ-0gX1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:37:15 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-8252259f6d2so1971302a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791913033; x=1792517833; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1BLtIj0xEvl7cfZrXbIf/98tRmcqVQkUnaAEHoiODWY=;
        b=Ae9BAE5SJLOuq077ZMDk6yBhII/f5ajGHqBRrQSH4yT3e7vHNwjJ62sCWrv4rnXQ0S
         uyVQOqPP8myD8xXMi5+Dij2EX/UjI0zjIA75X+2ZDcYdBeBt6OIYKmMu63zAbSkBzBPQ
         cJhdQpu8jxTAKTfLteJb0GC5/+KCRH+UAl5v/f6xklfy5aZyDyDtmak83jHKGEgvObQK
         9aO1wxDMVrNpnY9QBqCRHuLv6yF7osbbzeDMaEMYSfyH3CYFtr1iEPpAbGXuaXgb2zKu
         oLcq2VJC5irVMTJ1Jq4XkkJbvFcWe+d4Z13X4KcUxswK1JGKRouXYh/DAHTw+x+tN4nE
         oMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913033; x=1792517833;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1BLtIj0xEvl7cfZrXbIf/98tRmcqVQkUnaAEHoiODWY=;
        b=ICivsJPUzp3gZanKRaMLd5EStky2kyqNp68zd+K8T7N1JXEvHQwTPuSV4NGil/oB/X
         8JPQyIo7WF9Wii1ZTLntiXdPyCm8dO1QP5lkQ201yLzOfcmfvLsMojNg1eknnl0lkP61
         KwtmVTgUnYSwQgXZTGpCKDyXpwx1xPXZFvfUwMMfT1JTzT/LbLhSmNdUZiGmatlNc/hb
         ZYuyqb8MHDcNPiejzXNDmHBAklp8Y5+i4B0cWlp+cjllv3x0KJViaSnef9p4sw3yw1EA
         DPL/HU6eTogLgnL+UruEcaEB4W7JpDVnmSneEOYB1YxGg2vzcyKQZ+Ihus5sCdg+Ye7Y
         PZGA==
X-Forwarded-Encrypted: i=1; AKwUvBxn/Ar3T7nwDiLB2AMaVlfR/8wky9ANsAcDx7cEVSSab8FPyuxgXOfr2vf6Pg9J0nwgQJOkDb0bNckzgHid3G08@lists.infradead.org
X-Gm-Message-State: AFq9FYJoifwOJFJIjmmcjCpr5p8WeKm3ATlOaXZW6ei3D+PDpIe7QU6e
	Sj2N9V20NUtlpyPRVuJGOUIBDhTCFXgxEehvou1EZNRcl83wkjxhbz0H
X-Gm-Gg: AYBFou1Iqd2CwhLhM0Hx48GbJ3bjWZ4bj/2wPgcC1Z8o1CNi+WfScCmmCBtP1E9RFVa
	X/nFh6IQViOOYAIkWPzLKS0GLW/raMGnWsCeZSsJtGkLibtLlw//uRN0Dd7av5sOAlnAwrIPr/9
	IvFNTWLb46i4TvYgXJJkX8MFkfk0GyEoFBN0vw7Z3REDln4+oLX2SewQ9IfNdkd6mNbhsAbDU0x
	QrR6aUQe9sP7V6itaQSqvrIp93jxV6F3S21Kzv0pg09/TrEKgPVrDUq1J5zKmjw1ItlRK91PrNW
	MhWBCNW+YUhDstU4PjUc0SqyiXjL68GrABPlbW/dkvTd4URD9yTJ/QAKUmyYQOwi10vRRT98ifs
	plnzngGDyRcJl/lb6i1KfUggLma8zlsdfJ+JTD69l1YBC/NTQmwXhoSeJ2KohF0GGJo64BbGvfs
	MbQSBMzVwAxfiUbz6cMw6ZQz/rnrn4QnEIOWWmDKkB2ugcf9BN6+KqtJAPNaLoGunK+0dR+sKiW
	5K9JcaaJPEgJ4NH8khVCXKLQ5zBtu8g0EcJEl9i67w4vBi6NobEQZJdYP6pVciFcDIPqZSoCl1e
	5FtxpLBUL+13vx+HsE6RL63qeUN+IIH7zJFdlEx1UIZQRgXei+aZ6Zf0CZgIxPbIrsoQVEjK24E
	YRe5e9UpIzHHgUvsxcs2AUjS4ikTneDk=
X-Received: by 2002:a05:6830:a1d9:20b0:83c:73b7:e7a7 with SMTP id 46e09a7af769-83c73b7f03cmr848517a34.15.1791913032755;
        Tue, 13 Oct 2026 10:37:12 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303a60c458sm14564908a34.26.2026.10.13.10.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:37:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 11:37:11 -0600
Subject: [PATCH net-next v3] net: stmmac: unwind the WoL IRQ after a safety
 IRQ request failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-stmmac-irq-unwind-v3-1-fff4e2db805a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OQW7DIBAF0KtYrEs1YzCGrHqPqgvA4wSpxg0QJ
 1HkuxfRquqi6vLra96fB8uUAmV26B4s0RZyWGMN4qlj/mTjkXiYamY99AqMAJ7LsljPQzrzS7y
 GOHFwpJUBVEJPrN59JJrDrZmvLFLhkW6FvX01ic6XOlK+a2czcb8uSyiHDgY3ABoHODsjpXBgL
 EmahLQzohisBqul1806hVzWdG+Pb9iwf37ckCMHry0MYlTox5fjYsP7c51u2tb/CAig/hL6KqC
 Rg0GvR6ngt7Dv+yf4gEz5SgEAAA==
X-Change-ID: 20260930-stmmac-irq-unwind-0be86901638d
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_103714_215831_FC0194A4 
X-CRM114-Status: GOOD (  13.67  )
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

The safety IRQ is requested after the MAC and optional WoL IRQs. If its
request fails, stmmac_free_irq() frees the unregistered safety IRQ and
leaks the WoL handler. This can warn about an already-free IRQ and make
the next open fail.

Move the safety and WoL cleanup labels into reverse acquisition order.

This was found by code inspection while working on the stmmac MTU/resume
recovery series. Injecting a safety IRQ request failure in QEMU with
mocked MAC/DMA hardware reproduced the "Trying to free already-free IRQ"
warning and leaked WoL handler. The failure has not been observed without
fault injection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
Changes in v3:
- Rebase onto net-next and drop the Fixes tag as requested.
- Describe how the issue was found and reproduced in the commit message.
- Add Maxime Chevallier's Reviewed-by.
- No code changes.
- Link to v2: https://patch.msgid.link/20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com

Changes in v2:
- Drop the claim that later per-queue IRQ failures also had broken
  cleanup; those paths already released both IRQs.
- Add Nicolai Buchwitz's Reviewed-by.
- Link to v1: https://patch.msgid.link/20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56d89a696272..3ce2d5994c61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3821,13 +3821,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

---
base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
change-id: 20260930-stmmac-irq-unwind-0be86901638d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


