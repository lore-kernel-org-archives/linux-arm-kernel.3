Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6989C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 01:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFtQiwO6/6BJ7wa+vqmBzThl4fhyokGeBbXcNwOcE/A=; b=4k4JJ8/KgZlGwv3US9kb8+cFC4
	YEJhNNz9WxrTP0vR7bXX5UjzyAZBOuyR5ozD8RUxx6Yp9WC9+204xY+SEafbkzl5GyJf9Jh8y4NOR
	FIX2Y0OypaeH/YraIy8NSQGWJme5YK9kXQUrgoGUWevxQmksTM0o1Dh8nK0JmFTNzxwJIJ8D43s/g
	OZa+5pYRAc4Tg22xFjoL9NEKjBNVV0xEYhduDLwsRReWd8i1uoKgTM8MbaqiJKMpGbBWc6PHDLZAi
	DOAFwsT5gwhflxSkanwR2MC1hqZ4XPC3qOHwJcdN5QSxV7KC6/JVtFe+V9SjKBLlkmuVZKQBqkdaY
	tCryCP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YXA-00000009p0D-0iUJ;
	Thu, 24 Sep 2026 01:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YX1-00000009oxX-0fNS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 01:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rFtQiwO6/6BJ7wa+vqmBzThl4fhyokGeBbXcNwOcE/A=; b=i0YPAjGirUjJcZROMjEJX6ddr6
	V7Rb5bjfRfgDh9+f0jvh3zeKFNPvDbAPdhM3lIU/fgUtf+6CmMx3lA2UVikDtw24DMPRqs9kfr2Cn
	+NjTbFaoNRn7O1PFpO/8NesxjhZuHOwYngDLDST96eERzRCAHxrlDYPXY2ioq48bNbgl1K3clhToY
	xBdeax6w+94j8A/YM1CeFbRhCqxDXuAb+HjMMSaVXe+eIixyhyz+ryt9YCBqO3joIwZcM16VxPMcB
	odIoyKNm4E2772JzN26xR4NngbjQeR3C9zRb7QyQGT6/qlPJT8fzmNzRO90+RUhySfK51Pdwgo0Hs
	Zd4unZZw==;
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9YWx-0000000FRUo-3eqB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 01:45:49 +0000
Received: by mail-dl2-x0f.google.com with SMTP id a92af1059eb24-142dd05d97dso1163288c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 18:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790214345; x=1790819145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFtQiwO6/6BJ7wa+vqmBzThl4fhyokGeBbXcNwOcE/A=;
        b=JtSeiNVFr9A0r9T8AvEsejsmAFSs+QQ48H+P2VVRO28RY1ClzGwU+sx9gwGQHN6Dp8
         t2ZfNBDRSdlMZ6lJSs8iF+Y2r89yui8Og/JNiamCYbA8W8Q1c3WgiJtAAzJfRw8Wyuh/
         6rGldU9ojqXD+BqdrtobgrlY/Fidph/NVg/PutVImKtrXYPPwXsOqmFgi3fT3WZ7AW6w
         RQ9sJ1Q2p5qiJ8MHxenyjamOqTZ2gi6rLck8JBZlNeknhvxonvU1PCxHqXchx456s5Tq
         aa3vYdo+b3WTjb6mAaH3XHtTdI+Y+4G77nUGQzkAQq8Xepk2HXN6aQOY5qaTmDaV/9OM
         jPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214345; x=1790819145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFtQiwO6/6BJ7wa+vqmBzThl4fhyokGeBbXcNwOcE/A=;
        b=H9Nn7YL0a15jA62cTt4OO4U82H1eT7/w7xKyVd/rwYXq+cuOPAp1D53Fic4BJiTB+K
         RqfH+OYsSBLa2oMJVF5VqcMGrNWo83p1HdaeDQOVdNU9c88VGRRxMrfU5qe6SD+a/Orw
         fljTa2mQ+6u0F3zVjoHgOYk2XPH1PX280qnnCOPZCd2Wub0ANmGfZY8M/EwDekkcpfG2
         PP7XKy7NyL3Hms/dLn5dVcf7Z/qdgcSOMtiOt0HsVECZr0x8pOZl95vsQNLIZXeEi3Fu
         cRAoCPO3rAyjnPo3Koy9aMAv56KNWqAr/7NMIdLMlt4qfeYbNbdFGsm3Hp7ZQPMVM1Qh
         njRw==
X-Forwarded-Encrypted: i=1; AKwUvByfU4cY+B6oGET8Gee5Jm8r3MN5zIrOZl/V2GaQTX/cdsuK4pYcpSR1Vgx17Z8U5DATYBcIDu29oxxuN7Z0dh7l@lists.infradead.org
X-Gm-Message-State: AFuF++kauA6x4MhlgAE6Bho6ixPmkQp+xJXRbCmOTWwPXan3iqfKor9A
	oXPTcWfc0Oxt3vLl2ko6BNViXZnG1smUoYKkIHmM+s6IK4xxtfc7ufeG2af2jqhMW0M=
X-Gm-Gg: AYBFou1oju+ng27sxkIwaq+/xThxCgZgAfIF760lPYY3cKOcRaRu3t6FmTp8XU/vKjT
	fV5DtFkGk9hN8NngDK7CvvNpPszIHAap/zua6x6bwGKO+6UEn9Wimkim0NmyNWl28f6nMazlY4i
	KH8O/OaDsjgf4QvSxcOG0UDTihz8Rp5momg3BLaiu+GpbaDsLYRF+8YFL3q5Mwi2Pf833w0tqV3
	wToJNoBgSfUjY/zB3HmVDBLOtqgkdHgH7VgbkVSScgSxuIP5JBKKefIBuoJGYP47D3StCKmYQHX
	WK5Vym38h/6aXjzPTCZFMGJb56EDN4U8DL5wZCNdFfYfkr5DfnLBqsCsFmaQsB45LPItxELzTBd
	//8QuTGxvEEr27ylriAnbW1FYegKswpDj6Ek1NAU/RkZM0EJZx0jjxFRgj9HNmeaTHEC/cNaRva
	fqWjs06lXbGikLm+FDtyOfVxGnIspv82bmFt4vBpOAowKWgIY4m0DT7orsUJRr42DS9CIcMd4EM
	Q==
X-Received: by 2002:a05:701b:4292:20b0:143:89a6:9ea9 with SMTP id a92af1059eb24-14503f9735emr748692c88.19.1790214343219;
        Wed, 23 Sep 2026 18:45:43 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14501794269sm2927598c88.8.2026.09.23.18.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:45:42 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 23 Sep 2026 18:45:37 -0700
Subject: [PATCH v6 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-i2c-xiic-v6-2-3a15b6397f5a@nexthop.ai>
References: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
In-Reply-To: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790214340; l=2996;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=hjh/huwNpHT4R0O30TFZo10JCsexhfogEIYuCqGs5hs=;
 b=ESsvAdfXRm0tlYcUbq3pUgtyTWOnDdmGWS56m6a/HeF5Da0WAGiwNahnaVp2p7ITa0+jdFYf/
 c8mhvMhlJF/Dy6plYKFa+nUrdBkJh84xQiUAqmZ5J7Qt0jGOh/jwkQx
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_024548_263930_6EBC33C6 
X-CRM114-Status: GOOD (  17.90  )
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
index 6cb264cbc366..b4177d655cce 100644
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


