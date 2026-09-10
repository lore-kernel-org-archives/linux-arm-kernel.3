Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E2C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVg0MO0Un+g3qkYJomirzbTYEjnQlfhIQ2YmOSwcrBo=; b=KE13DAIsjExINNll93Is8+pqzY
	C/lkaKAoM3kcCacHx6CQ4M3i9bMI8D/ykUawjwCCDPU7maA7hQ9ytSB61rsD1YMSWsQL2fKV9ZoUO
	TPdZTrO8Vsge/hpRsuTtNT8IHZBBqBwR78FhbJtQ865lGS6kA/tix8KSbGq8I6sP9G37EcL+1z5Ys
	10+g85D7koK1Q+/fPqUAikzt+BQGBAKrCynm6NBv5j2E4c4VEFnSRyfLQcltWX2xLJtyrRhZWQytO
	EUsF6+kkkaQnrFI5vet9rffHz+LV/ZWLSQgm6Rp5jG7BLHdp93CySKcFVWtBfxP3HsqQpnyBMWCZ0
	Q3kgyZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ve5-0000000DJba-1XnB;
	Thu, 10 Sep 2026 03:40:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdx-0000000DJXG-2L5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:40:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d6d28aa26cso43092715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789011608; x=1789616408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVg0MO0Un+g3qkYJomirzbTYEjnQlfhIQ2YmOSwcrBo=;
        b=HQJtYqzxso8VlNNh6mksT1ATLUcGc0eNv/b9Ad4Pbh7LJ8QNu7VUAD/AO6Yjvm/3he
         7jGOdym7/FW6R87BsGaPCZ4ERRXgZVz06nSau4mB8cv0IBaDRy907XH6cYN1JSiJ+sK4
         KuTCFTjnjzKCZJOZZ7SozuiilmG+TkFNDqYCvnXYvxxYCFoT0I2VJH8smNGTTCa4CIO7
         AZAL3/nMSJKXonSe88cqc295vFzevsZCX0A0mZfVztvSj6eUhvuVHIJlIJLPCSkfcPIL
         L6FqVD0R+jxBPTdB9CqtT82du+82l/QLc2VgdXwjSOujSrvVL9LhAEOz08laU/zlpv0L
         9qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011608; x=1789616408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVg0MO0Un+g3qkYJomirzbTYEjnQlfhIQ2YmOSwcrBo=;
        b=JR6NSwj0yUWgbu83GU8yYiTAH2DXTGc9sV7AwzR0WOxqYjGCQY0D68N5H+m9/Q7a3v
         YmDejjdJsnCYDCsIRhSJseP4xq9kn+jovFD1+GisMeNm8t6UCS3X3bkbYo2qUiE79HUA
         fpofajGRhztgg8tONGgqBpX9l3jpwwfunRdGle5tlTffnAmun5GUmHlphUA68hO7k6Kx
         Kj3OuLSGTkvDUMJ3anUtBtPIeejdGVhRSFyNUUbvHSlqNBLxBy4wCXt5yXJqYXq6dZIl
         oOODpeEWhH6nQnvNV2Ddv7LrxP21bWy1paPzOKJahxRqwQPY5vqutPGlnIhy4ZXiYEBT
         lK9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzr/XkbcsPVTgFwnPJyeEajIG67B4IhLBJWcaXaC1xacSK4WODTO1klYpeoIUJjVuCLgLdKUYtQnia0SfuYy0d@lists.infradead.org
X-Gm-Message-State: AFuF++kxu3kSRh+EJnIpIjOhIFxksUMwRYYSyFDtnYJ01Z6SXk8PbWp1
	0tM2g5jeqM16F0vpjPaDC0MV47fUWIbqJFIGJE0EE3dP9wWQ1f9hk9hJyww5I6+lgl8=
X-Gm-Gg: AYBFou3ofc1FcdtN70f0qj6lmLFqj9LKQzJAEP3/MTY7ZT6YkVc0Ve4t+5VdeimgOMc
	dywsYdKMIrD1HHT2jcdlayHw6iCw6qmRLZ+Vj+KDtpPMrihQF55NgmP6YKpGNYwyfJV+vrUSsSw
	XMjnZazI0ZMMBD3nr/ZEFADo9Y9tEAje5POpqWCdrpgdxCf+i5tVEIfqFzuZEYIERtYEdk9GEoA
	9BWGifE9kKLtIOoVNrCTsCQqn+Thx0wVjYIi0OldTPSR2f613k+gxm298QrXInYy9ecbzPQ8heA
	XIm7q9zIeSrryoFDwFoQRCPnc9fPuIEgLeoy2Z8Ayku9pu+ZW/cZFqtLvthkXDXeth7M7gAAmot
	95wOQI/ihnnEXzvVIcRhBeQI4rAl8VrTM3mY5jZLC+dzulmZQmR89I1/PASn1AS4mNAbWASV5dM
	e72Ab5YPOd+bedpM8z7t1oibAxy4bQUrqbJwl8DDKr1rxowJI0jNvJQ/051BKhP6PCYoQpR+Lkc
	lqqZS+zBUXI
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr55057766a91.10.1789011608488;
        Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58294850c88.5.2026.09.09.20.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 09 Sep 2026 20:40:04 -0700
Subject: [PATCH v4 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-i2c-xiic-v4-2-218df31e9d3b@nexthop.ai>
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
In-Reply-To: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789011605; l=2897;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=SsGwNknHPcqNGwID9hfwaD2LQw8udi9KP0/bQeGBXOI=;
 b=ZMLTkRrLjU98sWvAMF47TCUN5q7vrtRydDMdFxpssYyUyf7hFw4d45S2V7ONp1Y6h8Rk7n/Dw
 9HEXBghnij2Bl/oBaTi0jcbsqgCx3I2SF1av+5KkZAqsm18bfJGiqFS
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_204009_603171_C87C6DE9 
X-CRM114-Status: GOOD (  17.97  )
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

Acked-by: Michal Simek <michal.simek@amd.com>
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
2.54.0


