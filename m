Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99917C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BRFHALx1m3zetPOEUD4i+1o0+6rIFbdrwCz54veiK6s=; b=Wii2CjDBhBN99GCggjs1UhrD2m
	apcy9bd8Z62X+HA/0S3bTuAgYDm1Lly4k0+vAIRMxcotUsoy0zPBcWMh9lcrJpvu5ZDg/BJSrebH5
	mgecHMrYsXEzSaKimI5kOvIByDt10qRqTTykJ1kJM5RzTmLxaGWfjW6pgNwbha+K7mX1mvEMPKU2D
	MW8edQefpOvuPpLg5z0PCo1j6ChSE1QXnt1NJirWrEuLbMxnvcFUQgOwMk8Q4zTx3Ze26Of0o9QHB
	y4InHBSWS8M/ioP1XHWg7lfxvAKZxWAbY78bbm9fhWiZ65Q9GKybGiQeyf5UNPKE0Ixppj1WSuxD1
	a9+jMTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUg6-000000005ah-2Her;
	Fri, 06 Jun 2025 10:52:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUa0-000000004fX-2sZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:45:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1555216f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 03:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749206743; x=1749811543; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRFHALx1m3zetPOEUD4i+1o0+6rIFbdrwCz54veiK6s=;
        b=ItCHg1Obdsgvyosn+7uR1KJRweo/QbbKpL70jxWf0Vj9hgHzTI6EeMszOjO4Uai/f/
         VPyRLdP39kiBQFwBbz+556HYcMYywazZaQb0eZpYMddWWLXyeLP3vMYXFa9/P/hqVGkO
         G+GG9pTBRqFvXmuNGxXO5zk/l9cpXK6GuYnd6Kn1OUulTJfNaVva8mNheIGfgz6LsTwz
         X7k0AJZHzGEoZHZIBGQ/8by8sdkHK+Ed01xu9yPQIQjURoDJbliHP9pKhsE5DGqunfd7
         Nb7zbUtwK0opvkDt1Hk4fdspCOOqnyJ4tyYvnY+qjTiY5ZEoMTcN3DJvwrLXCXPDM6qY
         HesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749206743; x=1749811543;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRFHALx1m3zetPOEUD4i+1o0+6rIFbdrwCz54veiK6s=;
        b=V3RK4Gq8iFEcJZE0jhRlQs+nki/ftn92GD81/csMHmAK7sp9omL+ocWsT23dZO4ozH
         RL+//1aiqoZNGsH2fAUO+8AM/aMQet0Dvwyzyf6KdL2Apo0jxHYQahfpvryPCZojkJvr
         o94Im5mSVIb8ehk5IqOx8SDy+TPBe3xyQhaWmUFcygZ4rDPbmay0UBwFIWQ06EDSsIvE
         FSLdptCUYda8v6ppq71SQNUAYewaHr7BpriS6DCu4bbs7YbsQye+grhFoKnClgVFb5MV
         jTGbnT6uwpQZ8zGZISjXLKtk851+t8VSe0cvOt+Xi0KhXAW5OuAKwcTzQpQpY6/fPeqX
         8TkA==
X-Forwarded-Encrypted: i=1; AJvYcCWdC46s6MlQ7FqS7TPkhLoRaLw/72tdB/PvZL3qcAjoudiJN2kzZJr/a5MXvdb96U5/XkaqcbnumddfkN7gSkJD@lists.infradead.org
X-Gm-Message-State: AOJu0YzRmYPx53ozvbbwQ5/vU1lWzdqw7R/GaQkpCupIMyeMvHew04UK
	mogp6oNETqhF64ghG1Fe8pNwIa7Xq1WJ+9rOORHx28sbtbUDEvauJpIyag/wqi4qCu4=
X-Gm-Gg: ASbGncvzNmDk3e33CL63KqMqw9YIXe6xxANwU6Ev8vg9PBGJ6kGHSfbumOD1TZxCPf0
	/UIEpSgvVIlFD3Y9JLYnM/9/eKRNtuhzcRRxEIPdwEV45hxhdUvaeSy65uy/awNOx7W+Y0+61RY
	8aTBZNCSnEuzGop0UdwdXmVuSi5UWaQh3aFYnsLBXEGnAa/ItCnbneYxSdu8vlURej4eHSlqoMG
	5yrU409fllYRGQxDwFvXnN60sSMKwHmebN4AjMyfWRmqqnbML75tQEWQ+jdlGAynaHWfNCKbo5F
	n1tNw9mq+e8mswMoZPlQSXt7hl8N3SWJlg2iFowVDIdaGYBuukB7PTLT2hf9bRPimPLDk/5awDk
	PnNa0Qat1AoMb62vnB7vrS9nTGYomOlKNJ84NZ0PevA==
X-Google-Smtp-Source: AGHT+IG81ROpSS11hYFgizfgeqwfBE+434gV6QInGeIi/uhBiwAIOcylPzJAGiQB9jMO1IoJY5jW7A==
X-Received: by 2002:a5d:64c7:0:b0:3a4:d0dc:184f with SMTP id ffacd0b85a97d-3a531cdcfa0mr2411229f8f.39.1749206743044;
        Fri, 06 Jun 2025 03:45:43 -0700 (PDT)
Received: from ta2.c.googlers.com (213.20.187.35.bc.googleusercontent.com. [35.187.20.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm1468810f8f.43.2025.06.06.03.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:45:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 06 Jun 2025 10:45:37 +0000
Subject: [PATCH v2] firmware: exynos-acpm: fix timeouts on xfers handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
X-B4-Tracking: v=1; b=H4sIANDGQmgC/3WMyw6CMBBFf4XM2prShxpX/IdhUegAk0hL2tpoS
 P/dyt7c1bnJOTtEDIQR7s0OATNF8q6CODUwLsbNyMhWBsGF5heumRm3lSVa0b8SU1Lp601zbqS
 CqmwBJ3ofuUdfeaGYfPgc9dz+3j+h3LI6O0x2QJTcmu5JzgR/9mGGvpTyBXlSLqOpAAAA
X-Change-ID: 20250605-acpm-timeout-434578500a34
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749206742; l=5028;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YkGEBOcrE27T8r3ixhzP0IJ28+ma+k+fBnXwC3McJO4=;
 b=/ygRXRUpI7htlMsGDL1WdAqzFsl3yUxqAWzsl8X50cOc+eJBsU4cW6YrAzSyW/kOU4+5Rcj1m
 7EAslsdO6LiCG5U41ftFPI1qbJm37L6utdNYTfU8JCZQs6jnxC05Vta
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_034544_732903_4E8E3E86 
X-CRM114-Status: GOOD (  25.50  )
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

The mailbox framework has a single inflight request at a time. If
a request is sent while another is still active, it will be queued
to the mailbox core ring buffer.

ACPM protocol did not serialize the calls to the mailbox subsystem so we
could start the timeout ticks in parallel for multiple requests, while
just one was being inflight.

Consider a hypothetical case where the xfer timeout is 100ms and an ACPM
transaction takes 90ms:
      | 0ms: Message #0 is queued in mailbox layer and sent out, then sits
      |      at acpm_dequeue_by_polling() with a timeout of 100ms
      | 1ms: Message #1 is queued in mailbox layer but not sent out yet.
      |      Since send_message() doesn't block, it also sits at
      |      acpm_dequeue_by_polling() with a timeout of 100ms
      |  ...
      | 90ms: Message #0 is completed, txdone is called and message #1 is sent
      | 101ms: Message #1 times out since the count started at 1ms. Even though
      |       it has only been inflight for 11ms.

Fix the problem by moving mbox_send_message() and mbox_client_txdone()
immediately after the message has been written to the TX queue and while
still keeping the ACPM TX queue lock. We thus tie together the TX write
with the doorbell ring and mark the TX as done after the doorbell has
been rung. This guarantees that the doorbell has been rang before
starting the timeout ticks. We should also see some performance
improvement as we no longer wait to receive a response before ringing
the doorbell for the next request, so the ACPM firmware shall be able to
drain faster the TX queue. Another benefit is that requests are no
longer able to ring the doorbell one for the other, so it eases
debugging. Finally, the mailbox software queue will always contain a
single doorbell request due to the serialization done at the ACPM TX
queue level. Protocols like ACPM, that handle their own hardware queues
need a passthrough mailbox API, where they are able to just ring the
doorbell or flip a bit directly into the mailbox controller. The mailbox
software queue mechanism, the locking done into the mailbox core is not
really needed, so hopefully this lays the foundation for a passthrough
mailbox API.

Reported-by: André Draszik <andre.draszik@linaro.org>
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- update commit message and fix the time shown in the example.
- pass zero for the second argument of mbox_client_txdone().
  mbox_send_message() returns a non negative token on success, and
  mbox_client_txdone() expects the status of last transmission. Doesn't
  change behavior for ACPM, but fix it for correctness.
- add to Cc the arm_scmi list, they had a similar fix at:
  Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da1642bc97c4e
- chckpatch complains that Reported-by: shall be followed by Closes:,
  but the problem was reported offline, so I don't have a Closes: tag.
- Link to v1: https://lore.kernel.org/r/20250605-acpm-timeout-v1-1-1dbfdbee30da@linaro.org
---
 drivers/firmware/samsung/exynos-acpm.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e02f14f4bd7c96de6ebb50473005de520aba1c4f..3a69fe3234c75e0b5a93cbea6bb210dc6f69d2a6 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -430,6 +430,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		return -EOPNOTSUPP;
 	}
 
+	msg.chan_id = xfer->acpm_chan_id;
+	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
+
 	scoped_guard(mutex, &achan->tx_lock) {
 		tx_front = readl(achan->tx.front);
 		idx = (tx_front + 1) % achan->qlen;
@@ -446,25 +449,15 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 		/* Advance TX front. */
 		writel(idx, achan->tx.front);
-	}
 
-	msg.chan_id = xfer->acpm_chan_id;
-	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
-	ret = mbox_send_message(achan->chan, (void *)&msg);
-	if (ret < 0)
-		return ret;
-
-	ret = acpm_wait_for_message_response(achan, xfer);
+		ret = mbox_send_message(achan->chan, (void *)&msg);
+		if (ret < 0)
+			return ret;
 
-	/*
-	 * NOTE: we might prefer not to need the mailbox ticker to manage the
-	 * transfer queueing since the protocol layer queues things by itself.
-	 * Unfortunately, we have to kick the mailbox framework after we have
-	 * received our message.
-	 */
-	mbox_client_txdone(achan->chan, ret);
+		mbox_client_txdone(achan->chan, 0);
+	}
 
-	return ret;
+	return acpm_wait_for_message_response(achan, xfer);
 }
 
 /**

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250605-acpm-timeout-434578500a34

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


