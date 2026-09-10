Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FCBC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGGb1AqMqEgtlYCXRtEKduBwX2irzbcK3U23NUL459A=; b=4B1WU45xu+8JVETqMN5OEw75Mn
	dCuYkXwz9uhGq8GuwfAqHizW+hPGP4Vl1Beax8z2m4lRr1HpYLg24Rt6gH88oPlta3jK2h/xos6in
	kTA8n7JrDB7jvlCs5aX/Nf5Q5FXSmTrcjwb3qp70vKgiWjdhtp9umD4s43ttYWrmrYYklKM4chIiQ
	/vMlO52blhc+Kl/S3om9kLCtxEpHtWFQOuBfHkW8tx5I7k0BdOTC4LN2nmD+FI8Xc1OvhZFuw/98o
	UgqyZPQ0jGWH1ZIurQ8NGduISB+G3g53t4FqZI82FMRxlPNugxK6MZeRBk+h6/883Y76HRyUar/et
	/PYsGpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ve5-0000000DJby-25ST;
	Thu, 10 Sep 2026 03:40:17 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdy-0000000DJXV-1RI6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:40:11 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469d249c6so489449b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789011609; x=1789616409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGGb1AqMqEgtlYCXRtEKduBwX2irzbcK3U23NUL459A=;
        b=PjaDLeWykZ5INTGTnIQHJjLtsFBtND2m4zS1dZbN+WWpBdS05M/OzH1fkNecPbcXBf
         Mbn2iCRDF2Pdh4BXLaKUdGoPbTF8/QBPnFbQp1nNm9EneBNeRAHIqXpyOItZI34nGivZ
         SYUAs8qCG5xudJ9+De4576G9q1C6fhgWHk76ZcYXa0bZp6P1qUbPBff3oKCheD8A3O6c
         CR4MLZ7KqFcKC10MHMlvTWMlNBEdwMki8im9Qc2qZiqFM/f3k2qTQ4p1gtvVogg3vz5q
         XRUC0NgCf0SJMBx9hTGnthNOIUKv+sngp6sS8f6apfGVtzEIQGgv7RmmaDAj7/4DGmTx
         7Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011609; x=1789616409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGGb1AqMqEgtlYCXRtEKduBwX2irzbcK3U23NUL459A=;
        b=fkunR7hHN0Njkgpoy96CfHO1o4Ox5vYtXsunrA2s0wl+1rD9OYrzvQR83sNjYTWsdn
         0o/ZlP3Md8NbyUWH+73BnAGLJLo7Arp67q27DfrMl5rQMpZ5MIS0dlaOl2+/T1sE5PXg
         adH6ZTLFDNofFBboDsDm1Gfl+MX0BzNIVbP5Q7IJazXANvrMvOBMOy7cAoP4WdMbieuT
         oQ3J1XDQqb36/YXHk0xOX9m+FU+GUZY6JsjVQ0x8jKplEdzK/BYp5lfWPrCmZoh/tY/s
         H+fb0LGfV5qxCOyHXb/oC+WIinmJc0ThXxOUXYC3SLRzIqpJvWg24/upEIx8sKcZHitU
         54Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzOVYuxAloQyFqf7WuGeO2nqbC+/hw1sxHgmKd1YQCWQeH6FCUUbzLr9QDaTmX/RiAL2An90kzBZjwEWAySAQGY@lists.infradead.org
X-Gm-Message-State: AFuF++mdTLaq51HSLK0YdRPf3uO0YeJkXqGuBNLbBfg+tIemSBwBs6F9
	fB6WDUy8o0E8rOYvPdseWguLNgS3w7kZank0GAeC5o2Mee6UEO0+lbYGk2bjrLCw5qw=
X-Gm-Gg: AYBFou2SIwuO7D2Q+qjCeLYdCAfOlC/IcM05YFCU2IuxvPEZNTY6L/KUWY0kcqwh9Uw
	zWnddwwrOkiEDJAOVQUqSOypNWqv1mUyOM1hTB7H11QOy5ZTfi7plcpciLAxUms+MOZmwJIiC29
	gyyg+//XNvfRrRB+6TNO8K+x13iyGqByYcl3nT8vRrTpmUOIaEXm1gYt5GasOTz0FyjydTsg9dE
	rt2YeckseC+dbfWAmygKEDtF8WvnblOU6/JYj0SCXiJ0NA/pdYP+djAK6PP5Lp6t/aMymSeywvR
	0MNxrMKLhZH6cAlxGnwwjRpPSuKX8kIOdUvZ8PKaSGV4AXm3OzfkcpIK1rzW4tpz95pFBkJN1oN
	9Zzl2cVfjdgbLzD8P9cq/jLAEG9d5hiQJp0FBN28er5UYDooLSdBW6+VAI8IU7i57YWuDQMPfIA
	cbmLX8eHim/nh9q3RlUQtO50wqvScGuhmBrz7DRhVdEZ/ZUqcEeTX179nNlVUrqowVCCq1dQZTt
	w==
X-Received: by 2002:a05:6300:6702:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dacbdba23dmr7846333637.12.1789011609291;
        Wed, 09 Sep 2026 20:40:09 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58294850c88.5.2026.09.09.20.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 09 Sep 2026 20:40:05 -0700
Subject: [PATCH v4 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-i2c-xiic-v4-3-218df31e9d3b@nexthop.ai>
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
In-Reply-To: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789011605; l=2277;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=nou7d5wdvtm0ZSXFArEeFJh+YO34NwfkEsOlW1AJ7Ho=;
 b=zv+8OaV48dE6a8fuYTEiejGziZBr2QFmPlye9Nl6XoHbC2dZdx4WPijhaETqjKQ9/VNI4nE18
 tUSgNHxdutHADv3R3C1iogVivH5Z5/TSY7eA8cMW0+VNletiLWn/LFe
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_204010_413294_0569088C 
X-CRM114-Status: GOOD (  19.33  )
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

Also clear smbus_actual_len here so a subsequent non-SMBus transfer
does not see a stale trim value from this completed block read.

Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2bdba6c0931f..8eaa411411c1 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -889,8 +889,17 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		if (i2c->tx_msg && i2c->smbus_block_read) {
 			i2c->smbus_block_read = false;
-			/* Set requested message len=1 to indicate STATE_DONE */
-			i2c->tx_msg->len = 1;
+			/*
+			 * Defensive: reset the per-transfer trim state in case
+			 * the rx phase completed via an error path that
+			 * skipped the trim site in the RX_FULL branch above.
+			 */
+			i2c->smbus_actual_len = 0;
+			/*
+			 * Drive xiic_tx_space() to 0 to signal STATE_DONE
+			 * without truncating the rx_msg length.
+			 */
+			i2c->tx_pos = i2c->tx_msg->len;
 		}
 
 		if (!i2c->tx_msg)

-- 
2.54.0


