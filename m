Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46204CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIDyOEViNLE4KPweGmgFctKJ5qfBRnVS9bTwCoRCqcc=; b=DEaabPmqN6lSYVSP7CtayG8c1+
	AZ6YGvBtwRTwDMoNMILXgdX/++oQ2DzV2/lUYiVm7U1Wcwz1U+msiFOQqzivsvpdKpKUCjmsbevO3
	mfJCFOc+NqtPa31CTTGbDoTvydrccfem9W8P4geiWwG6512u+h3D3XF1JctnN9PW/HLHDLYQGhk6n
	TCJbcLXBTKQLA9ot9yCkJ5N4sVnI1j0pRyjSCt5ylJw2YlZDgozFJNAFKneXASsk4U700ir39LyYk
	3HuxFx7iadLAZHiRsvMAMvXl14rOcw2WZBoIok3vFkl7yTgJGM4fCRxGi++tqevAuZyJUtW2FUvRd
	aSMDdaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLX-0000000CeAl-1Zvm;
	Mon, 11 May 2026 07:46:35 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLO-0000000Ce6P-2Yib
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:46:28 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2c156c4a9efso5194176eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485586; x=1779090386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIDyOEViNLE4KPweGmgFctKJ5qfBRnVS9bTwCoRCqcc=;
        b=AZe+alyPYe4pkDra/gR/5bFiLLnN+0XfSzwY/s2IynwSVJOGz7I9/f+j7+AZN1AMM1
         c0JEI9Yvh8nPzAl9Lh9K6OsawrF5qP/ow0ledBjIFlmnAZ2UYYFi2VsjA/7N6E01Bews
         GESO7IWXzZlSED7pczrLnU1tIDlQmEu8r37aT0U1laWVW1i3j18TPErjau1pkp2lNei1
         I9i1NWyYNRfXAraX1c1aAavRfe3L5QGzGEjv4gtTSVYNrENCpGEBGCPjaJFSr/J0ryW+
         5vYlrHMD/i+DVOLP7NCBnajqgRA5boPJqHNPzbvrB+uQI/wIqx+3TgPbycT4teOk/Qdp
         whvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485586; x=1779090386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIDyOEViNLE4KPweGmgFctKJ5qfBRnVS9bTwCoRCqcc=;
        b=SLFn9mkYnqjCsCNlGR00IxbqTnBYDeLukoVGZ7EA9rYT7ZB5rpQCPDCm6nYn8bvb/y
         v+X+vdu3kDZWSDUt3pLiOZkbdrgNQevk1wQTc07VfYR2KbCaIB9Ad6QOTZWfuzAvXFhu
         9NhqMmwXmWIoJY8vTpkNfST9QDU2ATL5QbLWr3aHnkuQRvvE01FfbPaPcqgAHEdNcKdg
         VAl6ERiI/vRPK77uU+Ck2FaWZIt0bBDE+Jzigf0WI2KNN9zJmSB8cdZAijMBWBJZg7iw
         Slb966intu3+2HQhbJOyDvsodvPhcl1/TezUkSAJ1EomuoV51wAo9VZ7m7yGKJ/3dyU8
         iiXA==
X-Gm-Message-State: AOJu0YyTWCHRB3udwH9F2HYJns4YgCovoMmk0YvLvINd4faYB00nemwM
	eL0fxPnUuqeGOROovzOxefdram+fTDtSQs642yfU3SIsdZ/HLQjU+0rswXckdiXMeztfqt9e3Wq
	idBGsbSE=
X-Gm-Gg: Acq92OG40uR5+8TXRJ7M3eBq4O4orR9MfFsmsXlEUojlcKdOwcs4WVz8fwM+ZebW9ky
	ugaJw5hxGloKjSonmAQod89n66n0muPVO0yOuFW1Q59UpSMdiVLMZ2mH730DtXPVna6iqw/KpW+
	oU8RRXHdCneKG0z+DuuZni8gkDjwXder44xumUhj76LdDh922fB0y2z36rxfxnfbki24Hi8em/h
	pR2vtxHgVRetIr7+7oTNdC3dww8O9rgjwUdEyUPz9wRhBrhJ6e6ldHSxAadjTvRLaRRMIjo6Rpt
	5SIxBcBbBZrhl6b7BS4eV4m/g1Q77CBQLRYIzwNd4XvtAgMk53WmNpsmuPgLyt/bn4N2KIbnCBr
	gevM8MZI+kyax3d9MDGqKyyHkfRkx0IJOnnRGj+DmXxuQfPp6Ez0AtrqHAS4UVjA4Qq3a3TBuIe
	uqqr+7c7tP3p92U0IqE34U4dyF8Q==
X-Received: by 2002:a05:693c:2c01:b0:2de:c5ca:c1e8 with SMTP id 5a478bee46e88-2f54d696d50mr10433842eec.4.1778485585334;
        Mon, 11 May 2026 00:46:25 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm12205702eec.26.2026.05.11.00.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:46:25 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:46:13 -0700
Subject: [PATCH v2 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-i2c-xiic-v2-2-c16380cb1594@nexthop.ai>
References: <20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai>
In-Reply-To: <20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485583; l=2814;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YQInRzCWVXJBbGUOGvO2DPhTx2lGcEJzvpRvFC2WTNM=;
 b=dHsiGR14XxL9FvZ3NefbWYmUQ8oOcT+goVAwocjGBRlTlbew/67kGcPRS7gfnnbVhFNbdSGXD
 3xPF0HIIm95AWgaRGjDwtxs57YOhEBTVb42qu8U6FH7RXHBH/uRdLSE
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_004626_652939_B4EB170D 
X-CRM114-Status: GOOD (  17.72  )
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

For the normal path of xiic_smbus_block_read_setup() (rxmsg_len less
than IIC_RX_FIFO_DEPTH), RFD was programmed to rxmsg_len - 2, which
fires the RX_FULL interrupt while the last payload byte is still in
flight. xiic_read_rx()'s bytes_rem == 1 branch then sets NACK on that
byte still on the wire, truncating the read in the PEC-enabled case.

Raise the threshold so RX_FULL fires only once every remaining byte
(payload plus optional PEC) is already buffered in the FIFO. That
routes the drain through xiic_read_rx()'s bytes_rem == 0 path, which
reads everything out and emits the stop cleanly. For the non-PEC path
the full payload is still read out through the same bytes_rem == 0
branch; the only user-visible change is that the controller waits one
extra byte-time before servicing the interrupt.

The deferred-fire formula is rxmsg_len + pec_len - 1, and the RFD
register at XIIC_RFD_REG_OFFSET is a 4-bit field. Widen the
chunk-vs-defer guard to (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH) so
the boundary case rxmsg_len == IIC_RX_FIFO_DEPTH with PEC enabled
cannot write 16 into that 4-bit register; it routes through the
chunked drain instead, which already caps RFD at IIC_RX_FIFO_DEPTH - 1.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 959a47b645a5..a9452eca26df 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -542,10 +542,11 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 		unsigned int pec_len = i2c->rx_msg->len - 1;
 
 		/* Set Receive fifo depth */
-		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
+		if (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH) {
 			/*
-			 * When Rx msg len greater than or equal to Rx fifo capacity
-			 * Receive fifo depth should set to Rx fifo capacity minus 1
+			 * Trailing payload (data + optional PEC) exceeds Rx FIFO
+			 * capacity; drain in chunks. Fire RX_FULL when the FIFO is
+			 * full and let the ISR re-arm for the remainder.
 			 */
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
 			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
@@ -559,11 +560,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			rfd_set = 0;
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
 		} else {
-			/*
-			 * When Rx msg len less than Rx fifo capacity
-			 * Receive fifo depth should set to Rx msg len minus 2
-			 */
-			rfd_set = rxmsg_len - 2;
+			/* Defer RX_FULL until all trailing bytes are in FIFO. */
+			rfd_set = rxmsg_len + pec_len - 1;
 			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);

-- 
2.53.0


