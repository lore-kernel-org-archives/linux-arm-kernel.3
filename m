Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A868AF589DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=; b=OhQMV/pzadULyrnrbqKuGv5NAx
	Ez5hBsEfJVgWabADWz8vlj+0stzYx1/RN3//h3aHmj/2ZSlRZTt4uv/ECKdKnWsVCymr9bbSRWGwN
	yKeFjMNN1i+Q3b0B77AVGYJCx36EyLeirX4Xk9TtlcMml06sVGYklMsM0iLUsqquZLK8tOxDO/HMJ
	yIAfzVpPpC0MSMS+wg1UilTwmYOlJ9XjAd7ZDfPBCCBHwmUq2/ky5QTMA2iQQ816GHmeVoA/RYtop
	SZszIJcuuJh5+e3besqJiAIDdA1rzK3dLGrRlEEM5Q/r9ennq6A7JPgadn0MMlm8Tc2aV88yPOFo5
	6Thiq2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFutf-0000000BnfL-1VqM;
	Thu, 23 Apr 2026 14:19:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuta-0000000Bndi-33xH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:19:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43cf7683a28so4588970f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953948; x=1777558748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=aPMJVrjpg/GayLKrksFw2J5VrsApBr2P9aGkFUUtPAxyL/jrgzBDfxt5Dwwiq8PSt3
         OTpuywOtBU9WUVWNLu8zYC9qqTvKAbe66GSKbK41fYFT2Bv6pfba6uXZ+WhsnZCfgDwp
         vvw+eMT4e30WtpTRb/u1LAdN4ET3Y/O+IwllOqK3vTC2MhdugS4BE9n9Sh1sIqq6RHjH
         R4Rixbb/xkDYnQunS0fBNB6f4ZZjsBrQhkVJVKDcUp4ywx/ga6TQwQyfyO01szcG5d4H
         64nMjiBjNqQk200sd2nV9vzZBmJhsgUT78h8y5yb8nRugIa53GC9HcVIHh5kDZobQHci
         ERDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953948; x=1777558748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=jtsf6yc47P1EqlILqs+dV9RL8TNYzHBqVka3pFMOReN16ZxCLkP9JztTCwarIHz40S
         O2Lc3dAjFOStGtlxB2L4r+v4ZxhCyl3SYhJN0Q45AgFMqtvvDCgq9IfWgkCxyUTSgd3s
         mRXtAgpRVhdudhGLr1em6zrCOxz46Dm+wci71NHm1MOo7X2h/dWbsZxeHs3rpyUrO1pn
         1oRCyWi0kq3/Y7OrJ+5l05iQhD92hcg7UA3aMb4Vu42GxxFXjsKkon0CLdaNuCu3Ozj3
         Th3kiEAFk/9a1HMd8RFlpL7c6NfW4KSnMLsJwi1egYuCaPeXinZejTj8GjXEDmkaaq3I
         Ws+w==
X-Forwarded-Encrypted: i=1; AFNElJ+58x+JMh7yQpw7ifdj2r0FUYjKDnpoS7AiTtUi5YdBm83WXoOuYLks7ZuP9PfTER3ZOwoARofX9bO26U2zJqEv@lists.infradead.org
X-Gm-Message-State: AOJu0YyEJTdeG0SD/7jHEdt923VNrdmDHoFvbkzQ7Nm6GuXX9FORIA4b
	ShRIW9UK1L6GKk5SU/aUovzSGRNAl2i38KFt++YfbCMMoc0Zw740qggc0lErezByl4q3afTNwki
	Rc2BpLjk=
X-Gm-Gg: AeBDievX+jbUllqDDSSOEecrQJKogGwqvs2IGDRbZ4WLnCwMvGdiC/zwB1O9qdcARFl
	/m+LB5dbW7TnQjdOo5GnZ7t5RvvfeDHkD5uSZbSep2tObMq+cb2oWzQNlqkX9l3ZC2PZcBtOoXu
	Tug8oMID/4sVrxw6XAv0hY2m3Q4b8y1wAV7VHd2fOJ7ZgLwdolXE34mv+vMYbWdeoDStfL1z6yN
	/DcvVPt+3VUVVsAE2LTNhIGrvVSUX2V5SUtTgJFbTj7bOHH7t6AekQsZ+paZTc7M8usEzKAl4iF
	3lNibV/N4np1Ry4z+SOvo8pkjthT3b4FoKnWUgUT8M+9LV+/JiBiYnvvPcdRvhpOWH/pHef+ztt
	L25AHlADIYPLj+EFzqLyMrV2EfYLMnu+F5Ts8vquluJEerOWbRfcwLzSlqJEQcGXUmU8ee8nw+W
	wM5A/oE4fNjmsIOHRJablTfbzr5jGvOzCNa/xCwU9S4an0IRpY7dE9S+BQ3CZ9pfP5nj2iazwo2
	eYgmExCWV0nxXdVGg==
X-Received: by 2002:a05:6000:184d:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-43fe3dd958amr43167628f8f.21.1776953948240;
        Thu, 23 Apr 2026 07:19:08 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:05 +0000
Subject: [PATCH 1/4] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-1-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=4319;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QTePW60Bb9iT8APl2jkQnh+1qmdtoSopKY5nHEff6yQ=;
 b=BkMC2rW8uMPkEzO9Se35YVwqJqHQ3jFFR6ZEBBGYlKTgiIxInLGocoIewycok7IS5US62pYih
 YYunIANvn+aDy7rZ3h/vhoZOl0Kgpa1G/oS+3eA4F8tRxk2AnBpX2IW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_071910_797841_823D8AF6 
X-CRM114-Status: GOOD (  18.05  )
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
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
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


