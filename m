Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6299FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NraBjweROqpLg6hW2dgHOEA0a8lbT4jbtHuBr1RDWo=; b=WRP0eSAsnOKM4gra/ZW+iWT1ht
	9GXbNN3yy2esqDE76/34eWVvx03QbKr69BvFv+saVAI8+tEATBq+qDIw8xodSmwtLe0C1N/R2t3mh
	kOjvIyfMz9XE3wXburSi8NNkfnGGMD7v11ykEcxGD3/TEWatKkRnqaFitJMeZlMR2SMvG0a59MzbV
	Aqmkevt9OWeCBU+jPiHmIYvFIdFqIALO9G+nIYfPY9rUW1RQPvuJt/1fe0OAoA6GnTp34tQqI1X+U
	JCSb63cJsJa28bQWM2K77NtyeDxizdrKT8VUddVvS+EQ762jaYKZbVUEa2Rxxb3zD713bl4BC/DwP
	K7WIDFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW9U-00000000Kbg-3zVd;
	Tue, 28 Apr 2026 00:18:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW9T-00000000Kac-3Nnn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 00:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE06860133;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C9FDC2BCC4;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777335490;
	bh=socDHfUvQqpc9gwIt9f18GJimPy7QixuJ0SteirtT0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oW+MLxvpS4tM91Fej4aIsS9mAPEi0PcRTJu5CH+oCKIaAfH9IIFPdT6p6k19DPPgG
	 B3LLM/5JRKhLaT6XUuicL3Vg/Xl4GAxBYmkSJAKQh4RbXq31FKPU3yl2bVmLujLEu/
	 i3erW4YmZsTV3pcSz+Z31L7BUAtyvIFSyjbI7aa6rvNsUt32u1WmKeoc4K5qgUdnkJ
	 /EtAamfuFYMYxZ0IOTALVrxMVV+bP4o8dZC0AdFPlFv7+atxm9LYb2ffw49tj2CF4p
	 wkER2m0yN+qdHhzD7Hj0j2xM+bM4VwczQcvUafhX5ORVx+evuErR+oVwP4TKgcRuuQ
	 oPokcYzNBwGvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDFAFF8864;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 27 Apr 2026 17:18:08 -0700
Subject: [PATCH 3/3] i2c: xiic: don't clobber msg->len to signal block-read
 completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-i2c-xiic-v1-3-e6207f9aa5ad@nexthop.ai>
References: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
In-Reply-To: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=OktgHJV/MKY6BGPhmYAbpjHL8E9xIEfPx0WNo7EeXKg=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZL7/c1D+/YWV3ude8c44uo171kVreYnc4A9ndzgYc
 5v1WZ2R7P3SUcrCIMbFICumyDLnkf+bto62iA0xh+xh5rAygQxh4OIUgImUhDIy/OkTW7nm6/x5
 1+NvPnzWVc+QrPBm6t+rbz7kn9jLVvuo14uRYXtA04SNf9iNs+V+fn4mfn3LJqP/D0ptNn9M092
 1Lc5uBxsA3YtVpw==
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

At the end of a SMBus block read the BNB handler force-set
tx_msg->len = 1 to push xiic_tx_space() to zero so the STATE_DONE
branch would fire. Two problems:

1. tx_msg and rx_msg alias the same i2c_msg struct during a receive
   (see xiic_start_recv), so overwriting tx_msg->len also changes
   rx_msg->len. The i2c core's i2c_smbus_check_pec() then reads the
   PEC from the wrong offset -- buf[0] instead of buf[rxmsg_len + 1]
   -- and either mis-validates or returns -EBADMSG.

2. xiic_start_recv sets tx_pos = msg->len (typically 2 when PEC is
   enabled). xiic_tx_space() is unsigned msg->len - tx_pos, so
   setting msg->len = 1 with tx_pos = 2 underflows to 0xFFFFFFFF and
   xiic_tx_space() never compares equal to 0 -- the STATE_DONE check
   falls through to STATE_ERROR, giving -EIO.

Instead, advance tx_pos up to msg->len. That drives tx_space to 0
without touching msg->len, preserving the buffer length that
xiic_smbus_block_read_setup() already grew to cover the length byte,
the payload and the optional PEC byte.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 946e3ed2d760..27715646a9fb 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -864,8 +864,11 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		if (i2c->tx_msg && i2c->smbus_block_read) {
 			i2c->smbus_block_read = false;
-			/* Set requested message len=1 to indicate STATE_DONE */
-			i2c->tx_msg->len = 1;
+			/*
+			 * Drive xiic_tx_space() to 0 to signal STATE_DONE
+			 * without truncating the rx_msg length.
+			 */
+			i2c->tx_pos = i2c->tx_msg->len;
 		}
 
 		if (!i2c->tx_msg)

-- 
2.53.0



