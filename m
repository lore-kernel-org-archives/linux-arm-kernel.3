Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A46CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmA+fxDwXNd4r2km4orWOLxYXAzQdDkMb/ExdCUz6S4=; b=yn92MFXYySV1uTbuxDKa2Zzh6B
	l64mwCNaNPaAAn//75aE9C9iTbA4rYOwNUYUIjxvfNLGzGvxJi8tmOl8/w9smFvlnWigBLmDbFRZJ
	n7MkjRm1hX4lttspvi3e7B7H63vEtUIDNUjkuXhxz7CVBBnB6l5QOvndLjTxWNWyxyu1E8t79CyBp
	wZ9HlUK31h8s9XRBgZoDXVx7hcR3NZlSta1ws9FBHVqBePGRzY7vgB1FV1OX56vh95o7gpJ9F7wz/
	pkpFmr93LKC7ycYBTfWO0aLxswQ9zxsNWTZpiD/G3X+pnW9lcFdkU+jFJkgq5wUiLetH48TWH9G+0
	vPg5p5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOw7-00000003rQK-1VKE;
	Thu, 30 Oct 2025 09:27:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOvw-00000003rMb-40qK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:27:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so526680f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761816423; x=1762421223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmA+fxDwXNd4r2km4orWOLxYXAzQdDkMb/ExdCUz6S4=;
        b=rGngZT6hJmvJDgeR3w6oGlm+47+RnpPNNVFhNX4qGKWtwjPVylhcSlnJkpzY7IkSq+
         uIUhd8I3Y6qOOKPTkI3AKKg2BonA5+n8wMpw1O06Gj8dhnvWWXybf2Jjix91PN7fJsUy
         666/jxSq0WpJOfCy54ZFT7iiL8/GFSHwcws7dBzKaBWwOzaxP5h4DttBsNS9Fu3xRp/x
         Fh6x0MMmwdonenbK9SuYO8/w09hdVIJ3STQhL9jA18dL31BySfegvWzyvBEu3Z7elPqE
         H5nyfM7biMm2zBzh+Z8FxSlJx1DtdipAJuOzkUc6qMpnjbfH18dxFxoKPrkQKQY9QhKS
         WqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816423; x=1762421223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmA+fxDwXNd4r2km4orWOLxYXAzQdDkMb/ExdCUz6S4=;
        b=iNxOfDijiYyQe0lf4nXZbXhHcK7S6+8VZ2NoJsH4+LF6LDdA/9X+KOQrQ3OEJmqM7L
         FZM0lIoTGfC5vktEqsr2vn9hZ5x6x+k8+v4hmnFLmgtIdRYbge/y0wCumn7n/BACDrNZ
         KlE8WRRdWnZUn0zm+rpIdwYuRCMAUNMHCgDD7APxmXk4zLN+ULvVmJEA6HRMWvhSdcHm
         qnT4DQuuZr4+luP6zZLFx7YZjMuzWkmTKa/0KkmcqS7KeaFN2n9SVvc5660Tk/dYIx8e
         scJCnt3fqcFK7vdi7gAQcuIvVjDVIvTr7xmsiiPwumP+xauuSUEecvBtR8KOjEer1OMP
         872Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx1JyC5xxTul6LX65o7kQHWrOAI/HX6SQx0nZEAZLngri0IMfUhltPHLZYOoXq1uq4oHkSU0jTKnxjHzy21Jr/@lists.infradead.org
X-Gm-Message-State: AOJu0YwLk29FOK1fBGxA2xF9bQrsC1iQWkwEt8ulEYokS3NGawA+vYYd
	yvLTf4l5dAy9+kLDXqpUeT/RPc6Mlx3ZrtZS0DfKOSreqaHFr78uufyvV7kz/0n5IwI=
X-Gm-Gg: ASbGnct88e5IuugvvkMPTAaiaBe5vE7WJXjtopHpE7W/OUAHpTPBGv86hZ6DK9+1T6w
	Y2nY7FM1y758JYjiu6/hQbNfH7eczSRNPvkmQOzvf0Q0VmVkXWOnGcGxIIZaSKuyfmfBRRuyqtC
	PE6LOxIbIO55wN0wjXdwYfjnOPOO8/TxwxpT+M/KGwQQB1bCYZ7nbKDYGgA12R3qI9v3MQwMnWD
	gObJC6WKcuvi1RcvuPgyr6xqWGzUneqMn+krtnBlrNAZYPABTRTj/uRoMjfxLv2AbbBFpZqsWSd
	B07iaqH0tOpj9qdNCj+4Qrfx4P3wOdiEX0do5QRufifOuUYM2evzEEd/GV9T8Rg1Y6AXMydbIz5
	bB7mpd2EnBQokx6DIjQAUGY8lLHjuICZtHnLqtDIY1jidalkOhUVW7qlkooQP6HsEr2NkpsFBrQ
	==
X-Google-Smtp-Source: AGHT+IHQFpBNqStZU2m7ArSoDKfBgtc5gawxk4l8iU8TmUA/zx/GzBMN7nc7bDYsG15F0FLbqaObcg==
X-Received: by 2002:a05:6000:430d:b0:3ec:d7c4:25b6 with SMTP id ffacd0b85a97d-429b4c8c17dmr2230439f8f.27.1761816423068;
        Thu, 30 Oct 2025 02:27:03 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477289e7fd2sm32748615e9.16.2025.10.30.02.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:27:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:26:09 +0100
Subject: [PATCH v9 2/3] firmware: ti_sci: Support transfers without
 response
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-partialio-v6-12-b4-v9-2-074f55d9c16b@baylibre.com>
References: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com>
In-Reply-To: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=msp@baylibre.com;
 h=from:subject:message-id; bh=PFszx48unL3OZdOKxZC+O4/dOvgkdgU64h4yg5QoZts=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxmfZdLa79JSd9ZK1y3jeXLxcQcdrbfDgFdDhUfDJ/5f
 T4Qq3Cio5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYSeofhf4go144rH8qdN4dw
 878ReTKj2XCrZ+RBhtCinS3zZ7V8es/w392+60AHs1z9zTQPRef+sNqMzdvlp7UUOp9tL5eILH7
 CDAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022705_014929_25FC332A 
X-CRM114-Status: GOOD (  14.85  )
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

Check the header flags if an response is expected or not. If it is not
expected skip the receive part of ti_sci_do_xfer(). This prepares the
driver for one-way messages as prepare_sleep for Partial-IO.

Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 24ab392b4a5d0460153de76fe382371e319d8f2e..4db84a92a517b0aa7bb8d47e809d9848a16e2cc4 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -398,6 +398,9 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
 {
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
+	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
@@ -409,12 +412,12 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = 0;
 
-	if (system_state <= SYSTEM_RUNNING) {
+	if (response_expected && system_state <= SYSTEM_RUNNING) {
 		/* And we wait for the response. */
 		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
 		if (!wait_for_completion_timeout(&xfer->done, timeout))
 			ret = -ETIMEDOUT;
-	} else {
+	} else if (response_expected) {
 		/*
 		 * If we are !running, we cannot use wait_for_completion_timeout
 		 * during noirq phase, so we must manually poll the completion.

-- 
2.51.0


