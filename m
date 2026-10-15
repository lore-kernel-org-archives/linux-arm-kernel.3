Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEA1CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/g4HQu5UdzQeNim7+4cxYTFdG2dsVY/hmSvjIkvj5U=; b=3jmff6+KQHoynehKNTLK8I8olw
	mAvTkCp9XEhBRO6Kdp2C2WTh7vsPf+6pKHr6hSsgZKtmpp1vJT+LMoEZVSI5zXdo4xRN/9XBnP1vJ
	XI6Merl+z+6JJKHiEpx0S2DVyIehtsRqHuYDrq4jetnahCn0nvzOAkZv/9LIg63RyldFcSf+j37hc
	IW+Ehb1L/rd2LYRl1bRc6I0aBdfMQECGP2uy1E0TL0rBJeCg4I3yd1sirT83O7Ng0x+K/XghEfWc0
	sPcxKf6YvGfnVqZA/OKr43qXKzaqJzmZ19SEXL3xIz8YV/PhZsPHb1a0M1YEv4CySxNk4Ap+jPTBr
	c5eOUDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGZ8-0000000H7Dz-1tTH;
	Thu, 15 Oct 2026 08:11:54 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGZ6-0000000H7D2-2xrW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:11:53 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c3e0e38c8c2so43583766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051911; x=1792656711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/g4HQu5UdzQeNim7+4cxYTFdG2dsVY/hmSvjIkvj5U=;
        b=qUq0EVVxy5F1l+sqpudH2kEPYA6gc5vyGJ5+5VjZnGgAipZ/tThxUeXHoQckUluG4m
         n9hfbV0JZ4pDL8tB0DKoQjh9HJBKAUc38fTkXYldlUVoTdsUpyTCEzIpxUcy0tzz0wgn
         vY4D9jeo1GPgmCBcNSG0hi7ibPyDTtuXE42PFrOiEv55FQxz5/OgP3efUpxr8lqZdo+U
         rHv6o3Rm/5bfiSsGUhOffWY9CJUzIj9y/hFLRXxBoe2OYVYMWwPR56ofdApx+Bc5mov/
         OKmEACW34bkXcrdxVsGdP7hQMVckFZC1cLeTeuTtZB2blaxflGMMXSP+DDp55hktlB/u
         GgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051911; x=1792656711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/g4HQu5UdzQeNim7+4cxYTFdG2dsVY/hmSvjIkvj5U=;
        b=zDPN/k2dbe4icoNNGVZqlleMemQmhW1kDyKlBcAz+wuCOlEoC3xG1sfNkaBrz2PrGE
         o3SU+iwKQ17zxGpJAbJ3I3+sQ5LywtOuecynSSJuaYFPN8vjuhcbeotQTz/sqtY56u4J
         VlJdbQ2yobpe9SaIV26GqfsxNIca27OVPIKk5LIxdHhfD2cOh+AEmX7XzxTu4buQWsHx
         CMmGfPfDbRrTIeVnRw7D1HElMroZAoGVqL50L5Pa1vnvI1vhdy0JtKuaH7lSBz3xHLlJ
         6GaTbwrl95FtC6zlEmuWGPx+tpZt8xN9mmy2VggyE2QjEr2mNjnZNw2v72seTXQmk5KI
         NVgQ==
X-Gm-Message-State: AFq9FYJAwg7yO8BuRdJuFA54g6ktuQuShVu0UMnUVgbb9cqKMMJzevv2
	ybbvNFwowJgcZPRDpWrdssH3zrNWCbt/RpvdDKcquVjYuByWdCUuEJa8
X-Gm-Gg: AYBFou2p/tME1SNZ9vJVXzronO6u1BB8DXtU7TrsgS/bxmOkmJxUl2Ohqw2lBepj82K
	g84lXTQBnf/Wtj/vPC9a09yaLymfY1z93zvPrRhzwTXduhjAI1i8jUNPlcrsXZgwfVBpnLrd6QX
	f2lrzA/KsqnAFjKv97x5iLElPpQpvVFVhOylHe/N/IqnmMUYvLS7I80npKAz99/uRgYCHx+Tnnu
	i8GdkRrD0Z2Z8w6RDCdgkc9q6J/4N9KOmi9wSbvPMjNOcR8tWyqShAitqMSxbbtSzWLP28XTFEF
	vTs/v3x4/3hlFHnEGudJIJjXDnl5khnbB3UrRn+XhdKjZ2rqeRmJvOVuEylfL+S5nkRKZ5eS2X+
	E7VztETrr4EzjjhnpU/nqDWmpGgIPj9xY8qG6bXg5/BbAQSGZfrjvFw1zr8lmyw2g6OHAjOSV/e
	Vr05LSnsoFck0jHc1mn6EJAGw9++JegevmGkQ1CCybeauvrbVz9r3CfxV8ZQHxb288v0zIx7irZ
	UxX1Pr+27rds+1nDZi6fK944c7FFSHWTh/Rer2Xh6UJJXF2mg2nFV1SNzIFrPgYVOCIhQw5xJo9
	D/UEHx9SERgAsemdqmWFohHPMA==
X-Received: by 2002:a17:907:3da7:b0:c26:2fc8:4e91 with SMTP id a640c23a62f3a-c31a9d579d8mr1702132566b.29.1792051910602;
        Thu, 15 Oct 2026 01:11:50 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda5297b0sm96080666b.63.2026.10.15.01.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:50 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v2 1/1] i2c: i2c-xiic: fix clearing of bnb irq
Date: Thu, 15 Oct 2026 10:11:27 +0200
Message-ID: <20261015081127.1566244-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
References: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_011152_765592_BEAACBC7 
X-CRM114-Status: GOOD (  18.25  )
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

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Tested on Zynqmp dev board with some custom logic.
Tested-by: Thilo Zirnstein <thi.zirnstein@gmail.com>

Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 42 +++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5e397a7e63f6..da9cedb86f94 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -230,7 +230,9 @@ static const struct timing_regs timing_reg_values[] = {
 
 #define XIIC_RESET_MASK             0xAUL
 
-#define XIIC_PM_TIMEOUT		1000	/* ms */
+#define XIIC_PM_TIMEOUT 1000 /* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT		(msecs_to_jiffies(1))
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -392,6 +394,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }
 
+static int xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	unsigned long timeout;
+
+	timeout = jiffies + XIIC_BB_TIMEOUT;
+	for (isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+		(isr & XIIC_INTR_BNB_MASK);
+		isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET)) {
+
+		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
+		if (sr & XIIC_SR_BUS_BUSY_MASK)
+			xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+
+		if (time_after(jiffies, timeout)) {
+			dev_err(i2c->dev, "Failed to clear bnb\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+	return 0;
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -881,9 +907,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}
 
 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
 
@@ -1028,7 +1051,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
 
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1095,7 +1118,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1179,11 +1202,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));
 
 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1225,8 +1248,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+						XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}
 
 	i2c->prev_msg_tx = true;
-- 
2.43.0


