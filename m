Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12A8C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69scRkVxEedfu2A05mr2qUJ6E6ZjjFxsp+26832+0SY=; b=O1tNlDLbNhKR9RiYj3P3CRarNn
	MJakI8OuVNrw348e2rw19oQzrgbQu/tTsdzgL1Ho/ciVC/3tQGl7bZr5QsiUe5To8VmpnB+w9GFLr
	/PqNtlhbYmVSWnAdLzfopJkfGIUsvkbGPvKw9RK7Iyxr+vpkC8/osbmpap5OoBMN3XmQQwbRXY6KW
	HGvNK/ZoR9ujn6eaoOz3G0Qf3gAOvdWHffOPsxziNwGyu07+pDCT1Uwe375bqLLOQ/WMHFdz572qj
	JH9OZTiNWv8gkDNRNBaKfJ15K5iAdqjtBzMgSoZGe7s92j/ouvJ2sApRtB0TcrJx8rBacpC2sP0jP
	5onRbpmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCiF-0000000FvVD-3Gsk;
	Thu, 05 Jun 2025 15:41:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCg2-0000000Fv0o-0Nua
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 15:38:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451e24dfe1aso9641215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749137924; x=1749742724; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69scRkVxEedfu2A05mr2qUJ6E6ZjjFxsp+26832+0SY=;
        b=FxvMoi4MH2voyMY4nz7ds67++n2jZxFImlZOS7kbHMaOuM2ANEp9/JXXVKp/WR90lS
         qVmHsUOCy17V6oFgy5Wmhp/p4UyVRx1FaIxWTkiEUxmGgoNbXwcJejJObb1yUl37Ntpu
         x3cdwxLho2Z4SPy8ORgYELxads7rlmFf+0S5eZNvRuMGVH9XaLEmaY+GwZE2Eh52Y3Fj
         +7kal2JSj+kFLDFX5ZAFpXx3+0x9qSVQ3VjMyKPkjubdbPFySZTbGg1sKW6NoaGIg71Q
         8YAk4lKLvvT2YaOlczE+//A7tbjwzeVkMYTDZZB+xXK0LmD5xq5OPpNwLcO/Z2gHG2mf
         F2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137924; x=1749742724;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69scRkVxEedfu2A05mr2qUJ6E6ZjjFxsp+26832+0SY=;
        b=bwumCwsWW7zDKgnOV4riRjHZskgFEcVrqhxIfUo8tUlpu6XlLq39zP5S/WohmNn1jc
         mIIlU8CLmSOosd6oPLmCpTVSol0dHQfy7l2tu2L0CVCM5LyoO5Fb5kwvb1TdD0IinfKp
         S+e5HF/Ty8siXk2jUihz1+vAFIcACylubbDvZQyaYuJNdjnpyqs4uy4Vg0t/XQbu1NDr
         CS3oeIz2UX5g5y7dyFEIDEPUEJwsigi0M+STdAdotnP3SalCkmoi4Dx1WLcB0fqca7Lk
         JkRzdVKXwGuKOPo1KPCgxtuDmPbPMzbZoUR8vFvZF7qpnZgkN+5gGGllMq0dUk8DIUn3
         TGVw==
X-Forwarded-Encrypted: i=1; AJvYcCX8TyfHcM6T24EfwTmDlrhnmfjph+SOuaFQHTWO2FNSao04FBArBTDEX9i40qV1cWKoAPc+SUd+kUxT677k2VME@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ZjAjeHWirNAP13yG+XEzJJYlwulCXbRo3Hy2N06VSTLqSmvU
	wQQe1Nem4K77DvrcibzlbJgeqoYMxMt7eGOcCXAWBdyD5jY26grD8bDEEEjhj7jH5q4=
X-Gm-Gg: ASbGncvYudJ1N3gU9kTNfj6hVc2Uw0ACwPYy/hGIDYmUAv5hMA3LORTggZirg11MnUT
	7i52x3AIucH3AJRSY5ZobHDoxA+1/UFhJdRYZq+/z5R3P7OIBtHJo8y1Az+v2uCd/tcAQNC+W/U
	5AdZlQEeKC0w+IO1K5KEGfPyddi/VBaFLRZ7Vw0s7+oMyj9cSG8xIi7f/pTupGFVDPFnieAQwbQ
	3jP9jSJD4RYXzSAv0aePVZ46doLVylKoMkv8rt3C0fe44pT54kq1LefV93VZVf8IU+MFV10oOxV
	URE8HpPDBZX52E2nFzofudMcNHH/1/ZA8AT6gctw30DsASKIzEw3PqmfjNERcPeBletqC92NzrB
	KHMaLMIziSpYteVT+RGck3CCzWffTuDI5ASKgYxefYw==
X-Google-Smtp-Source: AGHT+IEasUAnsCjjEU7kkZN4XsU9GWJ8G3GIagukhq7hmK1v/JFF3UnIXc8rWmqtDB232dzP+SQlog==
X-Received: by 2002:a05:600c:8b03:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-451f0fade9fmr66739725e9.32.1749137923998;
        Thu, 05 Jun 2025 08:38:43 -0700 (PDT)
Received: from ta2.c.googlers.com (213.20.187.35.bc.googleusercontent.com. [35.187.20.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb2088a5sm22158835e9.21.2025.06.05.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:38:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 05 Jun 2025 15:38:26 +0000
Subject: [PATCH] firmware: exynos-acpm: fix timeouts on xfers handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250605-acpm-timeout-v1-1-1dbfdbee30da@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPG5QWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNT3cTkglzdkszc1PzSEl0TYxNTcwtTA4NEYxMloJaCotS0zAqwcdG
 xtbUAor0BA14AAAA=
X-Change-ID: 20250605-acpm-timeout-434578500a34
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749137922; l=4289;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qNAmmRKC2jTglldpcDlO2KCXuzEUgGG1x8yJRBImMT8=;
 b=1Z/GFCXW1+ZqzSheOjbJBBWUWhL1BfaxkJJGRkPiPuLM//cM8JZvKHw0CmMrB7Drg80EUon9w
 qW0ghk9KheqD1dG72mvPSAGxwmTt5zE9tTIXcHWMMHWa49n73BUgWqT
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_083846_143400_466C6E3C 
X-CRM114-Status: GOOD (  21.72  )
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
      | 25ms: Message #0 is completed, txdone is called and message #1 is sent
      | 31ms: Message #1 times out since the count started at 1ms. Even though
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
 drivers/firmware/samsung/exynos-acpm.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e02f14f4bd7c96de6ebb50473005de520aba1c4f..56b5cfdc63036b6214e5e8a5d30faabdd63b2dc3 100644
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
+		mbox_client_txdone(achan->chan, ret);
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


