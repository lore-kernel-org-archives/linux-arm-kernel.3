Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86DDCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMy1R3v8/cknJGc/Ns+zpumuALOM+zMl+dD92JAI70U=; b=D1VH7KdNw5q+YTfHnC9bSXkYns
	t5wXXkztIdCBVD6DFfdGrRTu8iQVuyAOMPlBwKv8lsXt+P/pbTc3ZcAgBd2eaG6UIm6W+Dk8uovPi
	qjdaKuk4coTlv3ax0aPqqXzBtonzBTqsM7zxeQ+oHUw3WYtGWkiT0UUs5QcBGlETLa9AldNwKCnvD
	pifRkPUgaPRUTBUPObpJSPvksKUHFPbDCfhppdwu6n6pVryBxQRnGvivigwOBl8vDYyiJaMpdPq+O
	UWEDqJMFO1GJMaNiiwGL7mkY4cpX8nF5TozCDiaihz1xEcM13seVfLv4O5gxmrrGjL2dJcLTQzTWM
	JoW8xzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6X3-00000002794-1iUx;
	Wed, 13 May 2026 10:09:37 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Wt-00000002741-1tvh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:09:30 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1329507c387so4386383c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778666967; x=1779271767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMy1R3v8/cknJGc/Ns+zpumuALOM+zMl+dD92JAI70U=;
        b=QjVkeZh/2fSdDBlF4OgIWK/x3u9WGpw6cWclExsYyRtlKQAmadt9oShYdOMxorw/WV
         DZUa5fCjGfM9bA5zPL53EdW+HW4Ntp8YDz+tYAyJO8iNiEu1Trxyo5eZi5Pd4bJtGXyN
         zvMdf8hdUWZ2TSMuPpPVw5vvhAEp1HDRwL/tlozsLaqAQxPAHqrukS/67NSfeg5zWHiV
         i+IN3p3mLtexP/ERBjV2SXC0PEQ99cVYw+4QzqWKNPXReokPkZ5+YG8ztjh4vq1kKDlk
         wBU/ZdH6qf3SNz64y6fta8uOe7flW0aLpNzQZp+vP1UztMe4qPWCPasr0OHmN7fIQqK5
         KX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666967; x=1779271767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tMy1R3v8/cknJGc/Ns+zpumuALOM+zMl+dD92JAI70U=;
        b=bzmljjYj0ohmjVC0yfGudg1V8QTqyhiyCpdfsEZU0xTyC5DLGns/llptrWUA8Vq7bn
         5R3to4NklMUqtZz/4+xxGa5io6cA20QIjRleqFsuSaOYNJ+2Fe3Gc9+Fv8UleCVgCVBL
         W0E3kgPx/9DeyICciTgIyI6oJapZLFMUB2zYfx7HbXj6ctQfpk58S3RJTO3QmPhy+6Na
         7PGVDtuMP8cZnejOnjDGqMTB1G9aTHkJVTF/3Sj3uJUoYv2oMYX1IfIKjvtTPJm2Ti5i
         EwChU3adNJ8ulAsC+uoICpAWcU74LCJLUEKrv5j6Hktyn9rW1e8pOjSUWI4pGc2v4B3L
         wvBA==
X-Gm-Message-State: AOJu0Yy9zpb69eZIOGkc9ENvKcoBNG4hWSAuwc8kdLSDkp8J8JU8e1UX
	v8eBKA3A3gc49xYo2GKtEHW93f0um3QF8ZZEADVsfyJYhwtiywtacSIzpG8oXd1R2J8=
X-Gm-Gg: Acq92OEudmHNI7W0ZOQbVbkrFOB2BKq1MPC7B8P3SQ7UmMdCR486wFUq7duaf0NB9HZ
	STZ5NjZm6r4bCIJWMjYKivUPHWfVBKtSiRzd/YlZ/XaTAJ14lQ1f8C9anbcEfffUScN8s3FMbD7
	iHL76jVnTyQO8ZzxWwRw4SHJU6gI9IH8OSto+YNBid7Qo0L3BmrUn6HIXnO7vKCGyVFNYNldRHT
	+bzAQrCqCrdyLaOc+BK/z/Y2QofVI29n62ZDExoKqo0S12+CAEOgQDvJqv+8Cg0WGUQp1FLScU1
	WZ0AQ64KJFxTbccXdstmjxRWqdFu8VWfO7dEB8CaO5FN6ngXglh4O61q+t/u+pi5l+1PebK00eK
	UHcgu2tyUcpAVxgsk2D3i3nztR29lwqo8pvWymfetDslpc69RPV1FDvhSfGcC35cOSIyw9TWUWF
	yLcw4NwY9iRD7Gle3NOnzTSt+6HQ==
X-Received: by 2002:a05:7022:221a:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-1349a1371cbmr1363410c88.0.1778666966786;
        Wed, 13 May 2026 03:09:26 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm29430265c88.15.2026.05.13.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:09:26 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 13 May 2026 03:09:23 -0700
Subject: [PATCH v3 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-i2c-xiic-v3-2-ccb3cf70ba03@nexthop.ai>
References: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
In-Reply-To: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778666964; l=2850;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=IcTTcY79qLYulJ6DtpHIU8j/lmilEm/EM7tnCfD/M8w=;
 b=8UzUUME/YlH55KnDDiPY7DoH5eRhIrJtdDWJN+ZdsYZdmJv2TNw+RDEb56gmi96+eB4cGHrvn
 NcNUmEzIP1QCKmqoa4Ww1l2y7NtSLi/b4E649DTiFNOGaoW5qwoQjrC
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_030927_728465_800E9C6E 
X-CRM114-Status: GOOD (  17.88  )
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
index d4308716d461..2bdba6c0931f 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -548,10 +548,11 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
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
@@ -572,11 +573,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
 			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
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


