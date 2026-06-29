Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C5C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 02:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjYx+8tIMWDajKptnVsnfbgFJjxKrPWEBY6WEuIFPcI=; b=1iu5mAWe7KXiF8UIQKYuoX1nw0
	TEJczTkmabKp2i68nDvviYA/3a4nR2uNx/6d9FPFKTuixU+90QQcNUanpKXcHtmhbuBCy2iXj7M8/
	CZ3+vaNN3rZVxgfmHtPHeqc2+crhxoX3LvMbEVrXCdX444CKpo5aWjj9nvoZYRmEdJqDeuHxxqJ5u
	uZdPlIQCtgGEuIc7+2+GaorGxu11aM7iQfz9t+s+eLDwJ76uAdIKy3cu0QNY5fr/IoasrdwV2SHDy
	nqCzLsgNhrtNvHbJSWInzlVTFIZdATVsBIKtSTcdedxE0CQUpkxUQoYesL3/ImccIYoASoUcaDtNz
	OWI/5XIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1uA-0000000DaeV-2owq;
	Mon, 29 Jun 2026 02:39:26 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1u8-0000000Dadp-2wdy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 02:39:25 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c8ff15af279so1584617a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 19:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782700764; x=1783305564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjYx+8tIMWDajKptnVsnfbgFJjxKrPWEBY6WEuIFPcI=;
        b=BR72KsN7UgeQvT5BOitgKNmJFVhx+GSmlPUSS6Fe98XKx5o//TJCnLDMo0MkZ1GjiP
         /M04Kz8nQ2BOzjPxat6niIxgIbuRWYNgyd7kmZDokVYb7YeXiW2n/moeX+Dqn3bwrusy
         EUVUdr3wEbn24tWFjZtvMW0F/olQmlr33xLKDQed11hApU2Et+QLsE39xoEZn9SpYbEu
         s3I3QwFXFKpLRvwLpmnhlD1xauJBW7XC0jfD+c/Y0q/89PH1zUnVJml2M/S2TuQvN47E
         gz5pCqsWGsebu6KBU6dZkT5ZopHXAWFdgVdh/O/jInez9zP0pyOAkPlYYEVFJaSX+gX5
         xOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782700764; x=1783305564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjYx+8tIMWDajKptnVsnfbgFJjxKrPWEBY6WEuIFPcI=;
        b=IAkG27PS0SXokZ90RG5VvY9C4wneoQhGCjT4HOVr6xqgElqaT+M8QM8eBVb2B8P4v0
         ty58Yeekt23x3wk3L15bq0pMSY3NGBSprGuJJ+VNmXMYDxV01ZBprrVgXdg7v9XyimiA
         TbZvXHkj/W0XyIJe6d0wkUGHILIjoay7nG5u9UgV9G4tIFQSYu5RnNtqxDfwDBnU/i67
         90Hdy2fTv71QEhbv+747Y+Nb1X7YLP8FDRmvp+wKRznYfNfgT4Db0tLL0on633a08gDT
         Wqgag8tkX581Hc5CwdIDrTmc0/jI72By5hX8jjCC4sud0325A7/nBNTvjJYuhUm/M2XN
         8trw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZcP8Ji4OhYWftM9nlDVKNpQpl/LBA8kfThCtmvwzDd8Oefv7KTJZCXy+6B8gN6rphflEPiDnwKFggR9AkF+oO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ov4q2mKdjYnF9Z4XiP1OJLuQuxCMs9LnsIPtj1qrFgei+m3a
	82aGeisom0FkMuypPekD/X+K7qtYGOHeSeuZxee2fA84GCqhTwFENKh5
X-Gm-Gg: AfdE7clSPiaoGCyNSYOyAk+e3AqItCWyu8RA4sueZ7YM0FcRnbWmPBnpOlfapGWGjP5
	gFRFM0DJlmk1ksd0gRBpvRV/H36+Sz6tMCa45cLsRAxn3G9AHZu86l3e7m1Z3mdjGjthndnKyZa
	ugspHXzP+Uyx2ujMVrkS3ulN3GNsS1KU4zjf5M9zPhiB3emHSseOJybmxEkQTmVVg6+RK4uIfs0
	eWbDUmfWcijy4BAYX5FOOYNDmFK3XkIKxgZGLUSK9mF+bOHxMsjhgoFD98AO2WyIPJ22tBS11fB
	X0RrK0k5kxwIBMiMTyFFZUX5FAEQtdpUuAHE0ipAdDS3oaPVnQf7qGKTBGWwH0RYaWpM0sJ1haZ
	lMQVs5lDBw8KnsHNF18rxHViIoybs3nRB32FWjsW7FCyGy7ur25j80OTE8Uy0/zBF09/KnvK+AA
	q5QUXJ33wEW9q0uVVY8RdM6w==
X-Received: by 2002:a05:6a20:a10e:b0:3bf:6c08:fb8d with SMTP id adf61e73a8af0-3bf6c091306mr7342972637.47.1782700763765;
        Sun, 28 Jun 2026 19:39:23 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm6914869a12.9.2026.06.28.19.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 19:39:23 -0700 (PDT)
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
	wsa@kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v4 2/2] i2c: imx: Cancel hrtimer before clearing slave pointer
Date: Mon, 29 Jun 2026 10:38:29 +0800
Message-Id: <20260629023829.152651-3-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629023829.152651-1-liem16213@gmail.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <20260629023829.152651-1-liem16213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_193924_741953_5A0DBBF9 
X-CRM114-Status: GOOD (  10.53  )
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

In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
disabling interrupts.  However, a pending interrupt might already
have started the hrtimer (i2c_imx_slave_timeout) before the pointer
was cleared.  If the hrtimer fires after i2c_imx->slave is set to
NULL, the timer callback i2c_imx_slave_finish_op() will call
i2c_imx_slave_event() with a NULL slave pointer, which results in a
use-after-free / NULL pointer dereference.

Fix by canceling the hrtimer and waiting for it to complete after
disabling interrupts, before clearing the slave pointer.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Acked-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Liem <liem16213@gmail.com>
---
v3 -> v4: No changes, added Acked-by from Carlos Song.
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 2398c406e913..b1c6581db774 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -960,6 +960,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 
 	i2c_imx_reset_regs(i2c_imx);
 
+	hrtimer_cancel(&i2c_imx->slave_timer);
 	i2c_imx->slave = NULL;
 
 	/* Suspend */
-- 
2.34.1


