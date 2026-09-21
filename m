Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6C7C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI4n9nsSaz78+BIYtu5OrBqpRPgWw2YHv3oM1NI7hyQ=; b=cknRdidXas+fwS6nPVfvKLG/9P
	NadlPj98LpDso/98QW7SfNRF7bb3rwzuDy6uhmKFUzFmgNs84xW2nAccc7wUV8Mkt25fjAzMzY9/5
	oaPYRH5ATtlSpv7nQTeKgWpIAfqz8OEtgD9X29nYJAGtCuJNt3Q8C6B5psy/evukPDYr4CBuVGGZQ
	5FpIm1mt3AsfsvjRtPCrBTn3kLPAv/kdCLcIEG+WL/seDL1BdNlzOOaEHNv+5Gan9DebXIH7AkjoF
	2DO3vBGfn499zTLloLGRGmvWflLbRODrRRLhfqeqmn49hjtk3tCuUw6xp+5CcoM3OvPVzhD8a3TnN
	ovaOFvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iiC-000000036le-4Ate;
	Mon, 21 Sep 2026 18:25:57 +0000
Received: from mail-pz2-f42.google.com ([74.125.228.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ihz-000000036i4-3WXD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:25:45 +0000
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c3304784so2882522a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790015143; x=1790619943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI4n9nsSaz78+BIYtu5OrBqpRPgWw2YHv3oM1NI7hyQ=;
        b=bc5N4Spi1brGvtKj3y8XvF1caOT8PPge7nY6fDTeOCW5xCrHZrGIkho6CfMX7ZL6fz
         ADer+mDzpnZfVs9b21WPBoA/mEJHkCaRZQQpHD/58oVUldhuo0nF4KVnwDsuqqBQOL8o
         /qCK+JsQ3b9VU2tfuUWsydqsy1lLQy5WG2VKcbCLRDzaLNKJuQXkYAk6NYjjnppKaVuH
         3s79mC/oGN75lTUz+oe/g7RnX+FU2oUnZ3UnPSZvPciN7v2eCS76HhbdErhtZvgK4m+h
         3vHzUe4RlHP92/iTwVADU2GcxW/rFK1ApvpGXXVD06CHPGy1bPMJkyqqBbCR1QwORkqP
         RO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015143; x=1790619943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI4n9nsSaz78+BIYtu5OrBqpRPgWw2YHv3oM1NI7hyQ=;
        b=GRR53i+INu6O/yGQFv/nVTdKzDgg5X/KqnyxYAuOtus9uAUF1ts5SC+BsMdS3QD7av
         BthnpOJlkpKLPvPz1m2MNFzXUxH4tS3eRn1dt/x1Z/gmGzWUICBbSjMiVHlVeX21y3BQ
         RG5HQ+vxoqAaaswjTVx2kA6NjhR06CEQNe19aZ5IAtFinp//QhOBDlc5UPZzT/Mi2IDz
         xyFnaMG7XN/4d8YYKaksw9Z37G/zdWfDT9iX+HDarr2Hr2ClEJplJCe9eB2YUj+PDZik
         R0XNirSC0311owCQ8FfUvFCgXpuzoPaVIgK8khjpB5WTwMYNRtHhRFekm56zhzy7gC2N
         vQng==
X-Forwarded-Encrypted: i=1; AKwUvBw5c6CTCWH1HzuwEari6UQvG0inkc1RmV7I17cFf+qa3fFsTvMUh4NhyW0MGEbSA0nHx3YAMBaHozm3LQHH+cEu@lists.infradead.org
X-Gm-Message-State: AFuF++k1qCpGShonwzc1N2z6x+hjSdH9gFsbELmKRaMwnYOJ0tnnQFK4
	1y5It7Vr0O3QPctHvADTClY5YZ7INk8BVuL8+ZNLRYRuMWURFOfX4LJGYJNbVW6XlEQ=
X-Gm-Gg: AYBFou01kI1xVf6ip4XCoYtXzsP3qyMIk1Kg32WVuAr9rerlzcHJY1Xe+UfcPHBctx1
	/OPgEtau/CW0OfuPorW6CinYYWgtxHP+6sEG73GyQitGWg3dHpHV6h5OdHze8XaYZa1TVPijHLo
	/u9VCRPkTg3R5xS8Tgu7Mh6Tk0UuiC8CFBItFdaFZsVxow5xVWApyweFLVQogieTz1gyXmul8ro
	GjFx68wV/JZukd5ifnvYonzcNd+Tc0tyrUoAiL+awEL2TQmDJH3Mo7Tgl8eGUT5r5kLwsZNT4ao
	3jFKo2GiTRtOXBpRzk48nUssMKFe5PbOKszabRhtI6I64QlMS4CUeFzwicwk+vWfLQcM2d/ALuy
	suTr/dv0Y5PulbIg25J7pNYPsIYdfK1rLZUYtbRTWtyIIOB/+zxFfyt0qTmk73pXxvVdMsY0y4A
	24A0n521bCXYcarWbsvVBugw87JYq44V+c9zqTr+Rpq52TFk2OBgw1demrtYWN4zVeri/G2J8St
	F1Moq8TKWFK
X-Received: by 2002:a05:6300:48:b0:3dd:a197:cf1e with SMTP id adf61e73a8af0-3dda197d894mr11470586637.66.1790015143079;
        Mon, 21 Sep 2026 11:25:43 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144df9ad683sm12408974c88.6.2026.09.21.11.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:25:42 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 21 Sep 2026 11:25:38 -0700
Subject: [PATCH v5 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-i2c-xiic-v5-3-2fca81e810ea@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790015138; l=2009;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=3PrQCnt7nbZH4iGz2QKgl18h5LexXtxJs2Js8bqLN/I=;
 b=QpYMk3wrZCPsBPJzi7e5IC/yKs9xc3WDRsvHMvbgmZ/JbIufqHEZJ+oMndO7RLskhkFHF8Dfm
 W10xBDmcpW3AiecVrKdpTJV3FKT6eEkSAmnb6uidqNVds4cIB9Kssiz
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112543_903036_A0F169B6 
X-CRM114-Status: GOOD (  16.42  )
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
index 15fd17b703bc..d5e7b089a2b8 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -879,8 +879,11 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
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


