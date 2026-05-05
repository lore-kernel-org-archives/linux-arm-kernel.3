Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A8CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHmLifVz2AA9OJl2Yh6Eb2RS6GSmns6VuIWZDbFoB8c=; b=Gc9LLXbn7nOtMrSW5Z6gpU/czS
	vZXnEfzR7/h9ip4kQmsvYiHzCnCZ/oqv1WwTiNzF2+YP00wmoVDbx5zNkso0bxAcqnPTFClBhs/ta
	XX/ZAp9nu9hN77OynDlWKnFSdmHild9kYCCYCINK9XpxbcOggTGg3N807zcRT8bYwjfFsZZSo+FDu
	rYEpKqGAF+KXjleFJxi7xG2DaKYN8ehDlTABygkhjtM18S8hHQDopBmoX8kiXkn3ISBkTv3CE17HW
	BFj0+8xlkyOLsrpWsqCawqnVxt2VgJXQKni/HmhBKnk4+ZVlVtOvLfodsLR5vUtmpo889JnZpbMq3
	jHjDS5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb3-0000000GIE4-0y18;
	Tue, 05 May 2026 13:13:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFaz-0000000GIBY-3gag
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:13:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488d2079582so55959495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986832; x=1778591632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHmLifVz2AA9OJl2Yh6Eb2RS6GSmns6VuIWZDbFoB8c=;
        b=Oxlsl/395GvMv7JI/Ji5njkMcK/cL9fNF0jyo5lGE//Fnl45H/S2uG50fOYmJrMH71
         qJbob4gT+7mrj8tan99mXyYG/qKnCPThaqfy+5LVYzM7lOoOzwIvCeLWRcqBtXywPQXR
         pgBz1gmZTX5YH8Q9/jEps7t3Uubw/HFeDTF9QYe1/O029h/41VmU3bjQBr10YWlIT9Xg
         YJtciri2QBYEVKiluWjp1t8dhGLVmZBt0UiCUxdXRNlZ+XGLhYsv0Ibpy1gDYRd5fio5
         iM+ZL/bH3xTIux3A4ImB7gIKgaBMsUwB7i7W1Y/DiVUXDnp4MnsCeY6kyBt3NC6G7T0j
         fk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986832; x=1778591632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHmLifVz2AA9OJl2Yh6Eb2RS6GSmns6VuIWZDbFoB8c=;
        b=RRO5g0cwUuJ0wwmamjihKb4QWiR4UtrAn29Y0CcdoWPr6eSuViN3yGXrZN8l3J3kF0
         I25HCVjQ4Gr7sM++hzYVy5nONArYkBdSO3M7z+LJMvxSS5BNVA1DuWdN3xuaLv03756/
         5nZQFbIvsohwMrIdb3BYxcmNlK0zEwqEcxgXMQhBPTJksFEFExaStFt6b/iieZkNFrbA
         mCwa2Ha6hhWDTUnOt9WOG4cWDHZSd/JQq1FREyxAgATuD8B2HUxhOPzfokpgjgk7ZNR1
         3rcsefIAwt/UHXZyEAVVjOO3PHB48w8rvUc26iKSJw6j/2in53ex/S78Pt/Mr0phRQtK
         GJXw==
X-Forwarded-Encrypted: i=1; AFNElJ/2OJplolCAx89UgiEkM4NgjjCrS7P+lK3mNQPbiNz9QVdv5+qvWm4uE1w0f7fIN2ELH7NvQ2DXClYcg4IQUEO8@lists.infradead.org
X-Gm-Message-State: AOJu0YzRCB4gLW736zQ4ZmeRrbpKduK0AGLV4lkHWMNvFmQnzIbFXkpO
	zaD62Cfn23FOqFYSsAl2dNIrm/MvR6BI3JfeUBuQpUiYuvTYJL9+VLmpNwhdCD1yj+8=
X-Gm-Gg: AeBDietvyY/OWB0pvWTjfNlFRasxCHjxoZ2n7SgxZsQiZcRW9seeUZy+qCsdHZppdrN
	xTO6gvesyqHWsAqVYsk7EIgJH0RJUsiINNhRyQsgCuIJASuDBUzOTlFJrIsDhk8p6qCAq9yMkHc
	HjH+Gyzs378RQ09CWMAyi35VFhPRW+rftvwjjczFpHA5GPH6lztnk4ykRnGbnwGhR+6LIoXAAKw
	FCi3KM8SHDFKw6S2bkLJhwKmG0dYnZDc3cvMJ1E/6XXrjtLhu+ib6C+hHThe4pHllw71ylUzqf6
	j/1Pmoff8JsWPDm51Q1t+RcGr4Etkgvze316Z5gVMiDsqvO6hC9nPvoEXoJOyKbS+l5HQXxi+cU
	hM4ptAzIELjLYU30UBTKNR6voW8Rk+06W1EReDR7pC1xu/tRaKzis/8fvdUu93LD5gGBySnzQue
	lxmfvhpbaN8579FZmA+tNJb33uslJvFhgGQiRvwp/mwp3lOOQT5OSK7v3Vd72mKlpPlvcNj1V0/
	1l1tGOI6EISGANisw==
X-Received: by 2002:a05:600c:4450:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48a98639086mr210514245e9.9.1777986831930;
        Tue, 05 May 2026 06:13:51 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:51 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:12:58 +0000
Subject: [PATCH v5 1/7] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-1-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org, 
 Titouan Ameline <titouan.ameline@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=4462;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qp5oWm/4Ss+UIi29K/90SMb4FE1TJkPmkKkrbZErN7s=;
 b=M+zBRspfuC3hFP0WDaqmOFPc0NnPrbZ2+1IaK4wuqxMQOcglC63RdXe0nS80HpV3ih/G2NfvM
 MBqt0hibBmPBT47Q2PG68Gb21e5PHlh/x567ppjMiJkpeNfby4EGFdk
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061353_958773_5A737E9B 
X-CRM114-Status: GOOD (  18.96  )
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

Sashiko identified a cross-thread RX length corruption bug when
reviewing the thermal addition to ACPM [1].

When multiple threads concurrently send IPC requests, the ACPM polling
mechanism can encounter responses belonging to other threads. To drain
the queue, the driver saves these concurrent responses into an internal
cache (`rx_data->cmd`) to be retrieved later by the owning thread.

Previously, the driver incorrectly used `xfer->rxcnt` (the expected
receive length of the *current* polling thread) when copying data for
*other* threads into this cache. If the threads expected responses of
different lengths, this resulted in buffer underflows (leading to reads
of uninitialized memory) or potential buffer overflows.

Fix this by replacing the boolean `response` flag in
`struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
length for each specific transaction during transfer preparation. Use
this cached length when saving concurrent responses.

Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
prevent uninitialized stack garbage from being interpreted as a massive
expected receive length.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Reported-by: Titouan Ameline <titouan.ameline@gmail.com>
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Closes: https://lore.kernel.org/r/20260426210255.73674-1-titouan.ameline@gmail.com/
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  3 +++
 drivers/firmware/samsung/exynos-acpm.c      | 15 ++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 06bdf62dea1f..fdea7aa24ca0 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -31,6 +31,9 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 	if (response) {
 		xfer->rxcnt = cmdlen;
 		xfer->rxd = cmd;
+	} else {
+		xfer->rxcnt = 0;
+		xfer->rxd = NULL;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..e95edc350efa 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -104,12 +104,12 @@ struct acpm_queue {
  *
  * @cmd:	pointer to where the data shall be saved.
  * @n_cmd:	number of 32-bit commands.
- * @response:	true if the client expects the RX data.
+ * @rxcnt:	expected length of the response in 32-bit words.
  */
 struct acpm_rx_data {
 	u32 *cmd;
 	size_t n_cmd;
-	bool response;
+	size_t rxcnt;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -199,7 +199,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 	const struct acpm_rx_data *rx_data = &achan->rx_data[tx_seqnum - 1];
 	u32 rx_seqnum;
 
-	if (!rx_data->response)
+	if (!rx_data->rxcnt)
 		return;
 
 	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
@@ -256,7 +256,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		seqnum = rx_seqnum - 1;
 		rx_data = &achan->rx_data[seqnum];
 
-		if (rx_data->response) {
+		if (rx_data->rxcnt) {
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
@@ -268,7 +268,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * clear yet the bitmap. It will be cleared
 				 * after the response is copied to the request.
 				 */
-				__ioread32_copy(rx_data->cmd, addr, xfer->rxcnt);
+				__ioread32_copy(rx_data->cmd, addr,
+						rx_data->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -380,8 +381,8 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
-	if (xfer->rxd)
-		rx_data->response = true;
+	/* zero means no response expected */
+	rx_data->rxcnt = xfer->rxcnt;
 
 	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
 	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);

-- 
2.54.0.545.g6539524ca2-goog


