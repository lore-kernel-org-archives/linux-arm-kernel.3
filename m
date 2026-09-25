Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E262C98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlaWOdm+KrKq03MPPT9DB6CjgbrirrQUyiKzlIWUgEo=; b=u6I2U/0t/atFbz5IOPzl0irNgj
	EfoZFnlqJzzY62kzNBK8j6GOieD49APGMMWNAJUI5OmF5RGCBgSCS8G92hO9sJjxHmeJgPe3ZrHgs
	7dJyfM1cqPvC0sdD69MlKJxnOAeuB5Pw1ouoFWsJsQ/uhAFBdEMzqQlM3mBlJKiDAMmSEnHWJLW3S
	ZAelohtGPP3QfbwG+W2R2SnVZfRz49GnttQEhFJjspJDB2zQckGxoP4uwkvn5QwAo8RwPCERMV5Sj
	lHf3lwjW1AdwVt6O85DdwNfsOLI3/lCvOfVQuEc4cGe6rAma1G7qKvvjoVbwsjnMyPlRNXfOARRc0
	plaL8t0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tWc-0000000CRLY-1gmP;
	Fri, 25 Sep 2026 00:10:50 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tWU-0000000CRIm-1xQR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:10:44 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-341027843a5so171859eec.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790295041; x=1790899841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlaWOdm+KrKq03MPPT9DB6CjgbrirrQUyiKzlIWUgEo=;
        b=MJx4qAPKWzHLOQan/Md/ALDKpS8rTygYWf9BG8OC+PAR9HbsioPcH8+T/i8BMgjKmZ
         WlbWwlW59EytFC2OpOKeMV2qjLhYCWIpkVW3+8cGAwNtgzD8F46ECR4yP5gbNVq5sM8d
         gBP3fYh0eSMNjCoUXJ5mcjFrERwYanEw+MJZEJeBBRi4uOVaGY7PFk3vTVItUlsuY3kY
         No998toxqXeDgOl8xNJbiOz5p43Vf32DDu74QlQsNQRIvVYhChgGz9lSR0gl0rbFsUIm
         6ADD/aOhEEnVw+8o7qTEh7BMcBEuMY6PJ+66e7+GOaTmI+5luFww2OC1YY77npi2VW21
         65ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295041; x=1790899841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlaWOdm+KrKq03MPPT9DB6CjgbrirrQUyiKzlIWUgEo=;
        b=ilrEL5HpS8yWC1vB9wDuJunYxULWsWHjQNiz2NYkuRqM45b2xVNvprsLd7vdjsy8R6
         fs7Lt9+RmIzYIdcmuT22co46ferctcZWkJYt6rH9T547AX2yIa7ATnM30Il9yJYSxYTk
         QxnP0Iuwm9SvgA1UkGTyYLlmWjMtm2kKIyBM/HVUviLz74ZuTtrA3JZ5ECgriHdMVYYY
         wMGcB3Zk31K/bng3PFKkdmi1hyNEtNYR6A1vS0AP8Rq5ncp6HAcD6HyZmmRmNh8RPNkz
         AgJy8wdNUTPt7JijpkaV1TUiZFJk06u6Q50OZfyxeXPn8S/DG7bP4mEuTT7XFFzcwv47
         Mfag==
X-Forwarded-Encrypted: i=1; AKwUvBxNS/rEpjtPyb709ZI0viAE9PiMCvGlbGYoqp//VTp7n+TfVsRdt91PK15Q6G11ZrGhAvieOBV/0I85nNmuXFE1@lists.infradead.org
X-Gm-Message-State: AFuF++kRDdUqjy1wsmAnzkbDLdRHbEa47Ve5hCohh1kH0ZcZ6YazrtKe
	8iMuBNjatxq8NfUMWq4WDAJNc03M65qmXb8l/+pfYRFPV0Sazug0w568LWhdAjysFiU=
X-Gm-Gg: AYBFou1SNenquDyub3s/FHzQpsQRo/aG2j4T9OZ/ibXYFn8c4R6lpe3fnpT/Quj9d6B
	B4sSi3BlhjwEye8IVuhkMeYrTbzJ/qqg4C7RLXrsL0cBhzuQ/WDRC885C0jzW6jzhNhcJBU77ll
	MdxJGZ0GWMoCvuW2oNBE5nonhGmnIDxZabmz5rIg8bckE8Gu3ELlx4gSFUWT5Dztv3QSuQf842m
	USd/w2ocIBaGSmHDzXeDANhDBhNMGjBe5/4ENeNgA+fafUDdx6LAfrFOFTIlUUY1KI9WSjmewna
	Xb6H5tCR1g1QjJg5H6lAd/FnX/4DFJbONYj2bVG2tb5emnJmF7Ev2HoUCG+8poOw31ysI86jMAm
	tBy3FJwV4CSwz24bOAINnYNuvZenzS2yrtjI6h7bR2YpPEjslse7fWiagGSo2BBVzA4Es1mWNvd
	7DPpu7zBOZEe62fQW/Lg20wwd8LK5oN8XNhRv/ZxuuLMgzR0lBnJFOKOiNP8VuQE9n8vJKOsSzD
	A==
X-Received: by 2002:a05:693c:87c3:10b0:33b:c478:a545 with SMTP id 5a478bee46e88-34002be4604mr2878731eec.8.1790295041240;
        Thu, 24 Sep 2026 17:10:41 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145632298sm1787647eec.22.2026.09.24.17.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:10:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 24 Sep 2026 17:10:36 -0700
Subject: [PATCH v7 2/3] i2c: xiic: defer RX_FULL until all trailing bytes
 are in FIFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-i2c-xiic-v7-2-df7e752332ef@nexthop.ai>
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
In-Reply-To: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790295038; l=2278;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=/cxIRdqKu8S8t3VbgiqidVXFl1GWt0Sm4m+5jxGzei8=;
 b=a+pbWTcLJPiSEUJjIdHnPTS8tKRM1v4Eldm+PcCmLAtpHVPSWyDvgonMUJh9zoSaSWFyjR0YG
 CO5ORipMLjTAYdDSZY8+8zBXwdw4DNgwyluzbLCy8U3+O7iIeZNMm8L
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_171043_319973_702D3C7C 
X-CRM114-Status: GOOD (  15.80  )
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

For the normal path of xiic_smbus_block_read_setup() -- the trailing
bytes all fit in one Rx FIFO fill -- RFD was programmed two below the
byte count, which fires the RX_FULL interrupt while the last byte is
still in flight. xiic_read_rx() then lands in its bytes_rem == 1 branch
and sets NACK on a byte still on the wire, truncating the read.

Without PEC this is harmless: the truncated byte is the dummy one the
caller never looks at. With PEC enabled it is the PEC byte itself, and
i2c_smbus_check_pec() fails the transfer with -EBADMSG.

Raise the threshold by one so RX_FULL fires only once every remaining
byte is already buffered. That routes the drain through
xiic_read_rx()'s bytes_rem == 0 path, which reads everything out and
emits the stop cleanly. The only change for the non-PEC case is that
the controller waits one extra byte-time before servicing the
interrupt.

rfd_set stays inside the 4 bits of XIIC_RFD_REG_OFFSET: this branch is
only reached when rxmsg_len + pec_len <= IIC_RX_FIFO_DEPTH, so the
value is at most IIC_RX_FIFO_DEPTH - 1.

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 0777de45bdf4..5cd737c7608f 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -569,11 +569,11 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
 			/*
-			 * All trailing bytes fit in the Rx FIFO. The widened
-			 * condition above guarantees rxmsg_len + pec_len >= 2,
-			 * so this cannot underflow.
+			 * All trailing bytes fit in the Rx FIFO. Defer RX_FULL
+			 * until every one of them is buffered, so the drain
+			 * takes xiic_read_rx()'s bytes_rem == 0 path.
 			 */
-			rfd_set = rxmsg_len + pec_len - 2;
+			rfd_set = rxmsg_len + pec_len - 1;
 			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);

-- 
2.54.0


