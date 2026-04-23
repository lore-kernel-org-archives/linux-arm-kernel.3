Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F82F589DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tpkzzua20tAlQ0uvVtVJePBkUzc26KvQoLCnhghAYSc=; b=AIQgT7q5LWI0o8yt/I56E8Gck2
	BWwb0+SZHLRu52nELnoc87O8ykEiUiJYLU+bYbmMt7vZGD2L9hDTjE4BzkTmVo8bRXDyKCbhk+Oal
	hPQPbFKWkQHW2kIWXJLvKWF3bYZjeUSNhb1ipg5DE0KwcKfcHiQ+IHbzSripiMah82CH24mZ5oTCp
	GhqZ8CB6Y/GM4tagdfi29BCMVjcq/60bi7uEc/X7u//sV2CqpIheaCFEfSxGHwDv9KViNiabcvY+x
	vD4O3YaXShSkFvWJ5aAy3WGHRzGajprFAY0D6irrViHCedl2gmfZCpkBjWdJEnHAGnVVcGkulhobb
	WP/9ohaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFutj-0000000Bnga-05AQ;
	Thu, 23 Apr 2026 14:19:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFutb-0000000Bndj-1OfI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:19:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so5340184f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953949; x=1777558749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tpkzzua20tAlQ0uvVtVJePBkUzc26KvQoLCnhghAYSc=;
        b=Ro7AFDXcsgfKdEHsDEdfexOw6xtT6nKzktNmc2oOIRIfvsXwnh4EgabjqFQUWcedM9
         svYbezopEmL1HIZZ1KA/PHvx5ofbrplBn+9ajG4JtBLdt2aZcsFwn/jpTKiG8C9PWO4V
         mkh1jeY+esSZoJNLl/O8jyvkp9aq+yBhGkXract1EQJK/OMJMJgdXiOOVwtJoxHqwZk/
         xxs8iJUCLzHf4JPhDMdcDdLdb7++Y4EwHwqumHOLkxbf1+oyLV9khWpvxSk9E6fZ6EuV
         eUHneTUg9l4elQX9/n4oYmXbZj80ewhTyj/3L+/7D0fhQro20AAs7BfKOXy8dj4orqql
         t0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953949; x=1777558749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tpkzzua20tAlQ0uvVtVJePBkUzc26KvQoLCnhghAYSc=;
        b=B8lmyGJ71TJacpeu4rL+2yy7ePRzrYwlvjXj4PHUdj/tZtfmuMDh5wKJYKk72eQIuW
         CjU7k4/FqHx9NP0mTF1s6hQSLH7iUuGx6zi5509Lhk4sPzk9XTbYoKBgM1bkWuygZFuO
         YXBsmmQ34iTyboCHwY2EeGEM5CSj4fY3CZfwvY+ivKVlUutxCQRXeeyENivhqyiMkf5r
         7Kd2T176mLVVaQoQwHiy+hyqUKuPEyeGAifVAeH0mxAe/0VlEzBMmy9LYP5wk4MvfTwX
         SFBLOqHxhBLMVYixL1lHBQJ01Z+P1XCyMSBdsQs2zj9s+8NXzQKBnnDzGQtpwyKkY8sr
         qkag==
X-Forwarded-Encrypted: i=1; AFNElJ+0ULy6Y+PZGPVNFv5T+WjBtVfVb8r+vCkgI9UwoeGH3gcg1oAeS8inOaL6tAycAMMdrIyM8bTcLEy/fUaaRXGm@lists.infradead.org
X-Gm-Message-State: AOJu0YxysfC9UPNzjvIJt3aSMqxrr9qYjCOurhR2BkszZ6VVoKSz07SU
	JpfEgAQCm9ccAW2ovc7uHRnHa2FQ2lcjcfFPoifjvi8G7Gu+cZbdyQxA5U9rkGs5m7t6ZlgJSkS
	6FuLoW/I=
X-Gm-Gg: AeBDies3TfJWjnfY4J7JeHGrJGD8y2/t/Qo0T3Hu7uEehlwQV+bTeNGHOW+rQdEvBGo
	JdHr3u/gtNy87mq/ID6JHkXmsXDwKVt7HXsLe8ZotjtMdNEpVQcS5e8phieEl9QA1opzjCtoDUg
	X8jqjp/HM9VFeDpd3o7xtZKRlWR2c57ETLY64xVuYN4T7vatg0VYwTWPwrhJ5xA1cyEwALaDtNw
	xBqudsyu/JY2ot5Mia9967bXLN3WNdr9l75hLhOxp243e/yQclD4teCKiXyP1Mg2fL/0piBXbhP
	RQ0Ax0AS5XopbYwZ6BhW2qV5LDew1JsT2gZJcYai3xOhjXT6OKOhYP2pdvXwxM7ILFoFat9QtOo
	2+fFsui6VYbo+KBQ2aksJhZGEdaRi7WDFsDik/JVNGvBMlUtxoorz9qQ0iJuEegQyRUH0ylIjk3
	gjF3APNFIGVsAlgKHUavMvPjlmjVVsPyXvuvbPmPdKJey7Pk+h9tkvD6ppnk3DL5TUO2EL7JRHr
	1ACbj9PdZ82xodEIw==
X-Received: by 2002:a05:6000:2511:b0:43c:f3ef:ee36 with SMTP id ffacd0b85a97d-43fe3e0a460mr42116126f8f.33.1776953949040;
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:06 +0000
Subject: [PATCH 2/4] firmware: samsung: acpm: Fix sequence number leak and
 infinite loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-2-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=2635;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VTtVl0TWCNfgfLbp5ijesyzVwlK/9w/oJ2E+cqfjm08=;
 b=DYOtC6hQ0ucn9EaI7t93WN6xfszysLjwGSxnLnt8/zLOQRojSUpaUAulT4yyaGqqznnu6d/eb
 IAZVKMnj/bSAiKaA92rMrcQ3twPuFvC4hYcAzccEMqK1+YuZ1KzxgbP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_071911_394032_5CA54A1C 
X-CRM114-Status: GOOD (  15.23  )
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

Sashiko identified a sequence number leak and a possible infinite loop
[1].

ACPM IPC sequence numbers are tracked via a 64-bit bitmap
(`bitmap_seqnum`) to manage concurrent transactions. A bit is set when
a sequence number is allocated in `acpm_prepare_xfer()`.

Previously, if a transfer timed out during RX polling, or if the
underlying hardware mailbox failed to send the message via
`mbox_send_message()`, the allocated sequence number bit was never
cleared.

As these transient errors accumulate, all 63 available sequence numbers
could eventually be leaked. Once the bitmap is full, the next call to
`acpm_prepare_xfer()` would enter an infinite `while` loop attempting
to find a free sequence number, permanently deadlocking the CPU.

Fix this by ensuring the sequence number bit is explicitly cleared on
all error paths:
1. In `acpm_do_xfer()`, clear the bit if the mailbox transmission
   fails.
2. In `acpm_dequeue_by_polling()`, clear the bit if the queue read fails
   or if the response times out.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..a9baed5762d5 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -311,8 +311,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
 		ret = acpm_get_rx(achan, xfer);
-		if (ret)
+		if (ret) {
+			clear_bit(seqnum - 1, achan->bitmap_seqnum);
 			return ret;
+		}
 
 		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
 			return 0;
@@ -324,6 +326,8 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
 		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
+	clear_bit(seqnum - 1, achan->bitmap_seqnum);
+
 	return -ETIME;
 }
 
@@ -455,8 +459,10 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		writel(idx, achan->tx.front);
 
 		ret = mbox_send_message(achan->chan, (void *)&msg);
-		if (ret < 0)
+		if (ret < 0) {
+			clear_bit(achan->seqnum - 1, achan->bitmap_seqnum);
 			return ret;
+		}
 
 		mbox_client_txdone(achan->chan, 0);
 	}

-- 
2.54.0.545.g6539524ca2-goog


