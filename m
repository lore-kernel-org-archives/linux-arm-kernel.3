Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E43C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cquRnCIn6mlXF5rqmfxuhHyvgmYvV6WRP7O37Nb5MQ=; b=qbvKZqi9+FKXs2IjLlGort06mH
	rYxjHmTTgghalDB2VkByS2TX0RZkacZ9QNWtuwm4Jufkb8nnUNQHsp8HktuXD9R9u9UWs3J92exC1
	qFIzbuvoalVQm/tUY6YN3kalhN1N8HPp/zDfISRimPWMq/Lh82yNjqfCB9MGHvOLI5D7N6JlQElR8
	F45L4gEiJzQcFQEbN+8FHvbUlxSaSYuBMXn4ASwlbl4QsAGi35koe8RRIRx+7IZBM1Ez7jkqqTOJe
	gfMmVoEGLTUgWRhHMvp8fRjrFo5st7Au3gLLEWcA/9BgvihsXB/GmEeIFBz32hcwEExSBd/1R2Cxt
	1YSMI9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iiD-000000036lx-0X9R;
	Mon, 21 Sep 2026 18:25:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ii4-000000036jB-1oHY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 18:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0cquRnCIn6mlXF5rqmfxuhHyvgmYvV6WRP7O37Nb5MQ=; b=AxXKELYtvGWdUQqImm9MXLy4Sy
	wydvfXD5FW96acCnbi6zPxkiS9Fi3qo2SDbRHFudUmt0uoLPHC+qd5Qnu1hNxcFV7V1ArP87dML2V
	SkO9iPQ06SRRuSmGigKtNCwduDXgMprM1WFRdOPePjT0bIbs3RM8bGmds5a9ftQ4Qbsf8VQRyVh+5
	pIAdFc2qzyTiBaw5ercOei1Q9ZmBc/asa78I7+Qowm7pzPLPpO/qlqEtX77kvL67UipkotoPgdNrM
	fTKfuxf2FpI6gFfFpPx0mbmf5a8pf1sbJ9czfXsoYNpLvA21ZDktZTEYYFblq6dp84ZZMtuJu30O+
	QTFxKzjA==;
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ii1-0000000CgHv-1SFi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:25:47 +0000
Received: by mail-pz2-x0f.google.com with SMTP id 41be03b00d2f7-cc4c3304833so2326813a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790015142; x=1790619942; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cquRnCIn6mlXF5rqmfxuhHyvgmYvV6WRP7O37Nb5MQ=;
        b=Mq84NAZqAUPHgdDk/GgAO5Dm1ndKW73uxUMVsRTWWvmbm4pkEsJv7vJFmcVsKqu4Fw
         hR3xdqBxOQnWsI8KV9BfI0AQjbDEwV9TH0neXzM9qZtYZcEXUyCXDY20ASHmeDuFdDuI
         r1FOg7WMIBI3M14gvlII70JCHWNfdsqbOkdNWX8WgDj3B2hY2VUecAV2E8p2FftlLcme
         +WSFeyP0jWhKFCx1A739+r10eQUCR5KTDR8NBukafnRwookZ0OHN/Mz5A6NjmLF5uqKQ
         tSeCk7v/HY2v0Jh8GrH573K2yOa0rpEsu91DWyWR1J1qJX0WKkbDuo82CMC4S6D6l5nC
         oC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015142; x=1790619942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cquRnCIn6mlXF5rqmfxuhHyvgmYvV6WRP7O37Nb5MQ=;
        b=t5fbEYSNBzpXodDZqBj3vuKF+CBssXgJuzq+cLfuT3TdOOkbybOp6oBOb4MkOaaWCZ
         /ny0okAJugwa3+hnF7mvU5Chvij0Z/sys02DkRT8bOzzxXSZHhehyARuYUiZCmr3LvBZ
         Bkj+yNqp11PXeWgSxj8GCc+HrixAm4goVRSqtu9efoLCxK3Vi373H2rm/3hVOYVxXF2U
         tMykFZETuMsH8C1RoHuwiaYI2vasF2Jn6ODettFXJForfFcpNkd/LrrhCx2rJa7fJ7Am
         sRZxLKM/allcb+kp6HVnVNmn875AQUZQbPtaj76kfuI5e8rGbRx+QvzPzfsnmuIbUkPi
         8Urg==
X-Forwarded-Encrypted: i=1; AKwUvBwV4iXbXKq/jZwEcLDcm1n9iwVUcWVs7XBo7wZ4G4zzsLatk1iw5jIKeiwCBF+JM4g82PmvLdp6+YnkGotiqTGn@lists.infradead.org
X-Gm-Message-State: AFuF++ksIb/Bxw7AFy94ZdFIDlZQoIyaCIAOurkILcbDgLdt3P6MJw1s
	V+3OqR1uehC27xaT6Euc1o6oOBXA/OZ2AWvr2m1aM/p/nFOVh+cxIlV5tLDhUd97Wy8=
X-Gm-Gg: AYBFou3pspWPjWBd7c+W5sTBthUfOyFCLDgzOoCa0FY6d1pv8sufDFKZmoSD3DnbWHI
	bab0qH+FmWOOTP0ugHREknHykeaYnyvF2XN8k0Rymmx9Rl1TTrm6SblhKWVTUuvqoNiHl+zjZss
	4n/AQvV8MK1N6kqjz6yC7qDg4ijqp9uc+XoP2b6BX7Sv1AoEkKXtEHpluEFWR1SZ/WsM4VOHmxa
	Uwoav7BVJt5QP0Cbi+W3de0hRi/g3oo5b5cJ5pZCYoAXJy5kab6pWAep39Xs/3z3m4N6TqK7HQh
	ibQQwspztKqsAr88UCl0QPUprdwYHUCv5wYYVoBO5dDozCQEPfrSZK+5H0ypVSD9vVze/j/hzbk
	nmG1XAI1pSISjcdQ7Qdr7oA9Q0Jx5DrVSIduwgoGLO7XOoIXCRTgIfKI0weF+OL4mQFC3cxV9Gp
	nCg32YWDU5S04Z7DPARGLBnWKfEQ6r0ha3OBKFWDHITEQiBEcCC14Wb9vVuT1F+B3qpWTFBX0uU
	g==
X-Received: by 2002:a05:6a21:78b:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3dda006ee59mr12176552637.38.1790015141934;
        Mon, 21 Sep 2026 11:25:41 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144df9ad683sm12408974c88.6.2026.09.21.11.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:25:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 21 Sep 2026 11:25:37 -0700
Subject: [PATCH v5 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-i2c-xiic-v5-2-2fca81e810ea@nexthop.ai>
References: <20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai>
In-Reply-To: <20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790015138; l=2996;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=/8Wrq+rYYeuzHylPud9tnFtGR3R2iGFzmcbe02TkznE=;
 b=ubMp+70iyM/WFu2SL6u7ETfFM1C/uksEYesAWisxSq70C57ilk420Kkkx3zFsOacHFpd326ZC
 M+PBTrV7qDXBMzYY1xS+Z5RGXOLlN/FxyN7fsWzYAs0IouoYUBerFqo
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_192545_575892_2381BCF5 
X-CRM114-Status: GOOD (  17.67  )
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

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 22367a069ded..15fd17b703bc 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -546,10 +546,11 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
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
@@ -566,11 +567,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
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
2.54.0


