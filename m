Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86623C98304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 01:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieebBEdwgRwM6KekZkohbUAIizHwSaKZe32zZn7go7M=; b=QK5kQgFsMoJT+vNOX+cwM4Eosb
	LVrX4hIhMr3p5cUKsdDVQrIKctiBoR63BQFNa/nFrQ22vYXWFZlCFqde7NV3PtHAqPJIEkf8nH65S
	GCv7VdkX6scoFbpJtmCCdf6RTRWYxeSTyEAa81lMZUM1a6YzPm9NyQKvOfXzWVlcKEmUBcoN+opmC
	9C+ajLqzgNnfdLUiP/+93wco6vGW2L5IUeoV3ieu250H0uGAEOymaeYuWE3aivsecyWDg5HAnnqJD
	fgnwQMrYtQYVYSyK+j91Zj3Tiztaau58DWLnxcS3vKWEKFS0F5XAaR5GUsF8GennupdzdjT9ErElU
	n3Q41lSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YXA-00000009ozv-0F1A;
	Thu, 24 Sep 2026 01:46:00 +0000
Received: from mail-dl2-x25.google.com ([2607:f8b0:4864:38::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YWv-00000009ovK-3LVi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 01:45:46 +0000
Received: by mail-dl2-x25.google.com with SMTP id a92af1059eb24-1438e88300cso1085087c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 18:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790214345; x=1790819145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieebBEdwgRwM6KekZkohbUAIizHwSaKZe32zZn7go7M=;
        b=Dutda6EaZJMryzjN+vRaFDZHSEAAwZnCTRueWN9d0kM2ARJrx9rVVeJUxQa8maIe2n
         /zd1AJJR0I3OySW23hviprvAsQoVQSt28f6UrNPFiGlybYdR3Pv+BPWPyr+9JHmGXOTv
         uw6j7wiSlcs+NT6EByYcKithEB1wkKM2DjGeXRc+u3TxgAGIx3eTlG1dEkBHM5i3QYMP
         c7Bb/0u6ryZkxZPSNScinSjidI2fi/oTqQSvDxZCpheLDajmZN9wOTdk91bhqdM3Bs2m
         WeRxntr190eLpelHgMc5VguaxArN2bEBuysDm73tGCuIdTEeW+/j0PTNp1NiRY78ItIr
         E5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214345; x=1790819145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieebBEdwgRwM6KekZkohbUAIizHwSaKZe32zZn7go7M=;
        b=kD/fDGGwD+duZBjVBe7Sbveezyke746VEP54cdAuwdflbhdQr4+aolF9FnHTOI0ERK
         kQlFP1BynzwDUUy3YtxgJkZVmBAzFNdChCZNLsvZyK36NumY+KoAve5xBnqoT9dsclCl
         J2e8W7Ov9qf9wxIFrJqVlA5POAj0VKJDJSb7oVj5j4SAEmDZDyobDTIcv6cawHZ0XMMX
         bMHhJ/CHdTvkdqIgiq13kDFaHCOHVai5pvC/hqL/tPdjU6PoQsCDEIivd3q/p6DvgTPs
         bqkR8n1NO6nYfw6yW3GYeuji9+/uKN3XWoPxTcBXhzT+00yz3iGAneSZj0RGI6lmLef2
         aElg==
X-Forwarded-Encrypted: i=1; AKwUvBwzy9pKuDUYXJZf1z6hnfRzxPCitCfLrivSMKdvvXFJkBVolYxWzJMIgJoZxN20n9JMRMgkUKBnyBqAV3yeKAk3@lists.infradead.org
X-Gm-Message-State: AFuF++l1Nahd2IbZwtVkNSMf1oP00cYCX/yN69TizNPafYRAF1AgjS0R
	Ehu6RY+7XALldukEzj2HVPUULX03EqqlKdfDCtMPADeYjXoke4NE/IDohXPpLCdKNnM=
X-Gm-Gg: AYBFou0AddNn0aeA707YjGWiG4uNfGrI//ZzI0ZVwm/3u0CAdr0fK5DPa8Zh3D6UOv6
	DjNJrekel+ICb1vA7RXfnwS/atUjzGVHpW0JRFQdru0gX0HNE9Qxngl/JJ2zdB4GZZU5EXsX53R
	BTKA6SF4mKNGMjf0nXDbjP6+Ktw+oU3T27UtUsC7+KDcd5RzkhjRy2cbuwrYoNM2FkWDOqgrESI
	/6FJkPot2vEZRHq09SPR6I39ZOsqoXslbUgMFA7If7M1+ABb0Ruv3r6YbBeq6HljggrUhiOF+qA
	eFDRYRVRD+DKm/v98wuDkrkoH5XhqEMiujz//aBaDzQCRWNftXQElbYLdapnTc7/9T15pmF88rX
	bdhdY260qtnYZZwwyOaV+JDXf/8TEX4rVFMGYleHdsslKsRbTFgYJBmkDKj2Yh39L/QdX2QhumD
	lrt8Nc3t3Y7u3OOd2oHFSWjPK/6FDHY1kjQyQUqAtVaSEKtLar0Jpa6CF/KcWpX9CKtUGw+MOkY
	0g2Q9DJvKQ+
X-Received: by 2002:a05:701b:464d:b0:13b:975d:74e0 with SMTP id a92af1059eb24-14503f2ecb5mr605349c88.8.1790214344742;
        Wed, 23 Sep 2026 18:45:44 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14501794269sm2927598c88.8.2026.09.23.18.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:45:44 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 23 Sep 2026 18:45:38 -0700
Subject: [PATCH v6 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-i2c-xiic-v6-3-3a15b6397f5a@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790214340; l=2009;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Bg5NkWAAvHyt3A3yj80XS79ACYShmuxSKGVO43oYPz4=;
 b=qFUA265qvuxhLpUmsONKjmI+890eW6TegPL4ejNVHCxg7BhwfRvUx5J2mId0Q73bl+JzaU3da
 kKnVPT0LVT0DtRfa/MazyqQI6uHZayGN/ngRyqxPV6aCXGvGTo4zlf3
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_184545_857260_E7C57060 
X-CRM114-Status: GOOD (  16.59  )
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

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b4177d655cce..5d8492ed25f1 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -884,8 +884,11 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
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
2.54.0


