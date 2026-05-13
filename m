Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEC6CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8Lg0hsn02D6K83qdccj9lMg9u6Gq5mDY/7w097Ma/I=; b=5DW/ycIEY2aXwDsx99Dq9hHeV7
	t4aBwWW0ETplGomU4jleirBIK6HBujVEkOBL60wYy9O9FFxj+P/8P1O3U469EOLQzHiWU5LZnca0g
	OsgJn7/XdlbllPYoEPACGCfumF//ztvn1w9UDEfSAMO7/JQasbRYVXsxAzWDdAb4WaMYgScrIWYyl
	KoovUDqqMZpBFZK1x84qiFw1kmF7IxR6ujAHD1WNLZTjVnl0l5RXgYFhKWAlOt+Ntg7M/A7CpyYWD
	eRi9B8qivGeXZCxCc6YQBH9mzPjV0ahc8i86AP9hKtuH3AsHdNAi2DUh5AZjMkKBI//qegYAI+0Ac
	YKOGL5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6X3-0000000279K-28Ym;
	Wed, 13 May 2026 10:09:37 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Wu-0000000274S-2IA3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:09:30 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b4520f6b32so11181908eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778666968; x=1779271768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8Lg0hsn02D6K83qdccj9lMg9u6Gq5mDY/7w097Ma/I=;
        b=i9enjb8PKawq+tJqCBuamM7gZp38SvNBA0UuSGNKj5QX8QaEDLwKUS0kPu4Lhoytm4
         s9igbm8lSg0WNLm7HSVk8QkQBFFLT3HBC6xSnXk6+V8OJY2YPqm0MRwki5OtPhaTeFF4
         jMwFq6La7aJOmqM/HhMmnwk9bbltwEpvAUcKtk7Y8gKpZUyY4tMboEPiCBZ/Y0MO++Bc
         da0oHC99pr7X1T6YSoY8XjqOq7CsXq8rDCy5OZv/DieKRblO+FELShAZDXA+2Y/atOER
         D2J9YJjS2w51FjsC193X8637wRe4ABEezVhXLsWYNNUN/SVpr7BLEW47n9HD9X2QBTty
         LVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666968; x=1779271768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w8Lg0hsn02D6K83qdccj9lMg9u6Gq5mDY/7w097Ma/I=;
        b=UDlXy9lGDaWl822xrhOEBU3+1PMMsHR8i2HcpJ45HZfsIrV+fXCMd5tiojuW9txv1a
         JAfp6M+vwcAkW4cEZV9u7zn7PEaHS6XI1ag3sEieNDHukEHrCC1gvJM/Cs3HnNuLmAmy
         qvb76V33Z/cUUDautVbA7mtKuLuueWFlBTbglI3suO4EDFMxzrIre5kmdA0jvmxUosM3
         znVjV3XzSaRn/4qq28MhOkyrOeoZRcSJNmyQM4Ei7fl5FmouElaC9jNDCYDUJnRbtna6
         KFwa0DaSacN5q/P/DvsBDogPoVXIy8SOI8Os5IminBXCa1N7bN+P+26dFI7dIUM8OLK0
         y1+w==
X-Gm-Message-State: AOJu0YwL1/mD+chSgotHAZ/kCs4ZYY8LIaCTmluGTrhksCjI2OK9g87D
	bbe/uAwKt8T1pOPQZRvYiSnBI5dsV72EgFgL7b4htz/N/5C5xlZ/TEFor7Px7sf+YSxBpY1zgh+
	bgbBF7eo=
X-Gm-Gg: Acq92OFwPnznrrmZaXfLRxobeAH9kJW5NLTxkA4d559HQ3tLRpHhnN+1kmlxP97v9YG
	cTzP8MNd7ZbJdlZq3C4UYk1rQu7pQYnuorYTG48y2v5g5D7ZFB3VXX3eb4QZ1w+68muyDodn9hX
	/nqk62Qt6cH5hu/HgJcmPBBBkk8hMir3fikCwXDQOY+Jb1sV2KSyOvcGb/b8sy3HyVNjJXTcAyu
	Zg/Ze0OcGwG0SeDbMA+v19gesgDslwcwCHxD7NPLA7FAyxsyJJOK6UrRCtKi1B1F7cSnyFDxQl1
	wLIkJOsfL5Ck7s/psJY81BMYqvW4NxJnqUw5ywBsl30lmYteLs+yukC1eiTEnQxnNXoQ4zsTBpx
	nJ3GV2V9cMfXqHqC6SfFru9gYtijq4CyjRIeiMyH4ijIYsq4kP9X0blF3so8O23ChajWOv2zknK
	90EAIVCD1llHbfiId1J4hTozSTsA==
X-Received: by 2002:a05:7022:6708:b0:12a:6c4b:9cf0 with SMTP id a92af1059eb24-1349a703b16mr1350615c88.3.1778666967710;
        Wed, 13 May 2026 03:09:27 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm29430265c88.15.2026.05.13.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:09:27 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 13 May 2026 03:09:24 -0700
Subject: [PATCH v3 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-i2c-xiic-v3-3-ccb3cf70ba03@nexthop.ai>
References: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
In-Reply-To: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778666964; l=2230;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=WXSe6TYxSA7cz0PPKHt43EUa98Bkkw8i7qMhYy8i0xs=;
 b=WGfE3HlylYu1y1xmIHtQZzvpw9th09pMwA0Y4vyVl8BGkwjAtyUp96PqN67x0uuiupEKbK6oz
 R0jz1Y0juSGBFyB35Ui/ugENU02Y5ivWGOV0+/Ggo071jjetC7yVmGJ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_030929_392421_D450563D 
X-CRM114-Status: GOOD (  19.13  )
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
2.53.0


