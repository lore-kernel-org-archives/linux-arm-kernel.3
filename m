Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84B6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kl0vq5f5Bgwa1+0jsPX3lqnJG3p+rwJSH8N6lbEnisE=; b=bkr8c/Q3aWUcEgenMswRtlEkr1
	dmOu1IX6qnmsgMMOEU8isCKhlJAT/Iy3gKWqCj+32u9+S8xGD20LLA/qHf74TBda8SLSp769lGbg8
	wuZD4L4sM6SJgq0/SJcQ4YDjwVUl79PMgmkxwtm4+hcJ2Ntc+lrVlZohXDaWlRnfbkoOZQh/ElcGT
	OeSFnO47TVM4EOGOkTGyyKx0QwM3PV4fpvJ5yxd7x02sh2sAiZwNeMfnGqUngCDCZNNM6wrMSG4od
	QugEH96qVvxvQ9UAe4JpAZhcsiED8wtXDyodWnatftoR3aN3NDQdhAWrY3fhLNuGf6F5TXjtedV3u
	UVBHTd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twh3i-000000034Sz-0Ffu;
	Mon, 24 Mar 2025 12:37:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twh20-000000034Lm-1Ekr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:35:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0782d787so30757525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742819750; x=1743424550; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl0vq5f5Bgwa1+0jsPX3lqnJG3p+rwJSH8N6lbEnisE=;
        b=ZEPslpKahkONGboL2d9YQl26Nq3cvrBO8DHPvAhohmMufaz447i4IhIXmKRYmbL1tP
         s2u24UcDTltNqzFS8YuSRNLeV7fL2EsFs0qigd2fOZ00ixJeFwmoQwjKBQTk7Lqy87Q0
         K3r8J2aXCh38nyZY1YfWb0z2ylQGw2iHLzKwqwD+AX1hr6g/1JAy6Avzc3HHNTiK1ga0
         q0sPA/lCKK7aa7oE2R8IdnPfHwQz6j7WtPVLgTOxp7kTJv0Kx7CiBXAja5evMQrn0g6h
         UIs5BZaPosCU4DI0bhcVSclh6GpUr1k/QF6b0QORwQGvsx4WYEoRD6CDaadpFbmDTElD
         Pdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742819750; x=1743424550;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kl0vq5f5Bgwa1+0jsPX3lqnJG3p+rwJSH8N6lbEnisE=;
        b=bFCIqEjiYjlU/Nd3ExFJm3kcJSQqEE5uaM2LTJh4SwGCl25cIths+Nqa6bZ882lqbH
         QzQt6k7oxhxsR5PqmRTG972IOUH1O6Pa//4t2Fp0SjOUwY4MynNmbhJCgmZS3rdUZZ7y
         XCdpq3ymdY8+07chnczK1gAqtPKq3s5yG3kr2jm+12W9pEFjM1fe8u/BCCK7jrUuznNN
         9WcCy84/My15XwsAKw54W5JUVZfE+0MoOW6fThNDx5GoPgCA4zI357Covxf8ue9qf0Uk
         3PDygeKm4F5CEczB6MzKCUZQwyrKSxa7rp36GEo8XAfYzou6F+ONo6oB8fhS7ENm4kp4
         e3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXVjgRVzbqgA6Opk0ZuiGTI1TO89SLV0I8bm+BKhpYO8AVyN0wpMAlE4ix1IUGqmyAYE5BsV+gj+oUwavBZWhg@lists.infradead.org
X-Gm-Message-State: AOJu0YwdkYYWclI96rPA+hZS0daXBf6tqEt28uUkqVWHG/3Do+VMfntK
	LTlVDIK4ZKuyzEltT9W04VK1+NP0aRKY87ltKucIH4a0s35W5pL/O74n9NrQAAs=
X-Gm-Gg: ASbGncuve8Oa2TYMxGQ0K1GfnaaeBxuxA0B56aifT2IT9UGEPb5f1MjoWWqP+Ggn+3L
	u/Tqw1aZ2uvyijSNejQF1fC0XQ1xSvWJLqM60TrQlA0lMksvJLUKr6WYiMsHO4mrTSEnAxB6ndk
	CKaA453TK90VPrhGu9PygNPto+fB0zFxpQ0XEy+kJImVQQ/rBd9wVVcUsIeHbKUlGoDnjPON9p6
	m/PgXk+V74DeuvlqnLqlepI6pQMx+a3hNF5L2Sj8nmc9IlwyCbEUbO9YVlZHnC4oO83LmYETr4z
	7mI2uszBX4+8QvN5DXrmqi1FggJDqQlWaD5NgEC1PSDK+MbF4SRXCD8aOZAtInCrsIS3O69mG49
	Q7JznEC8cA8Vqo5sp2sLZ1dVr
X-Google-Smtp-Source: AGHT+IG32wDy5/n84lFCxKwj9TquwTcP2buF+V75/lhHb+aISrySpFsEMSBsH5is09m5p/OOqaNbPw==
X-Received: by 2002:a05:600c:3c82:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43d50a1d1ebmr97951375e9.22.1742819749950;
        Mon, 24 Mar 2025 05:35:49 -0700 (PDT)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3adc4488sm129419705e9.0.2025.03.24.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:35:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 24 Mar 2025 12:35:41 +0000
Subject: [PATCH] firmware: exynos-acpm: check saved RX before bailing out
 on empty RX queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJ1R4WcC/x3MOw6DQAxF0a0g17EEw6fIVqIUE/sBLpgQj0BIi
 L1nRHmKe0/KcEOmZ3WSY7ds31TQPCqSOaYJbFpMoQ593YaOo6wLq0dLUPaDfxs2MKRtBu3kIzp
 SaVfHaMf9fb2v6w8bGW4YZwAAAA==
X-Change-ID: 20250324-acpm-drained-rx-queue-ec316d4cbcdf
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742819749; l=3482;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=X6emEjjOC84f7qnPUA7wy2KchrGlNUKQIwcPa5RYZG4=;
 b=kmHuU8CHmjzA1eAgD8L77QQize35cLsSbdu7YXj0dYope2hTdkDdMQ/9byA+NXJFlyS62axcW
 MhXJ6fcZRj9A4EMb1rYbJ2soVBDODa7JBDCt69HAZc5vAxVsfXcFwF/
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_053552_356249_326F11B9 
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

When we're polling for responses and get a response that corresponds to
another request, we save the RX data in order to drain the RX queue.

If the response for the current request is not found in the request's
iteration of the queue, or if the queue is empty, we must check whether
the RX data was saved by a previous request when it drained the RX queue.

We failed to check for already saved responses when the queue was empty,
and requests could time out. Check saved RX before bailing out on empty
RX queue.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Reported-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
on top of krzk/for-next
---
 drivers/firmware/samsung/exynos-acpm.c | 44 +++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..15e991b99f5a384a299c1baf6b279fc93244bcf2 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -184,6 +184,29 @@ struct acpm_match_data {
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
 #define handle_to_acpm_info(h) container_of(h, struct acpm_info, handle)
 
+/**
+ * acpm_get_saved_rx() - get the response if it was already saved.
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer to get response for.
+ * @tx_seqnum:	xfer TX sequence number.
+ */
+static void acpm_get_saved_rx(struct acpm_chan *achan,
+			      const struct acpm_xfer *xfer, u32 tx_seqnum)
+{
+	const struct acpm_rx_data *rx_data = &achan->rx_data[tx_seqnum - 1];
+	u32 rx_seqnum;
+
+	if (!rx_data->response)
+		return;
+
+	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
+
+	if (rx_seqnum == tx_seqnum) {
+		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
+		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+	}
+}
+
 /**
  * acpm_get_rx() - get response from RX queue.
  * @achan:	ACPM channel info.
@@ -204,15 +227,16 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	rx_front = readl(achan->rx.front);
 	i = readl(achan->rx.rear);
 
-	/* Bail out if RX is empty. */
-	if (i == rx_front)
+	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
+
+	if (i == rx_front) {
+		acpm_get_saved_rx(achan, xfer, tx_seqnum);
 		return 0;
+	}
 
 	base = achan->rx.base;
 	mlen = achan->mlen;
 
-	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
-
 	/* Drain RX queue. */
 	do {
 		/* Read RX seqnum. */
@@ -259,16 +283,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	 * If the response was not in this iteration of the queue, check if the
 	 * RX data was previously saved.
 	 */
-	rx_data = &achan->rx_data[tx_seqnum - 1];
-	if (!rx_set && rx_data->response) {
-		rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM,
-				      rx_data->cmd[0]);
-
-		if (rx_seqnum == tx_seqnum) {
-			memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
-			clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
-		}
-	}
+	if (!rx_set)
+		acpm_get_saved_rx(achan, xfer, tx_seqnum);
 
 	return 0;
 }

---
base-commit: f0dbe0d40d08199109cb689849877694a8b91033
change-id: 20250324-acpm-drained-rx-queue-ec316d4cbcdf

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


