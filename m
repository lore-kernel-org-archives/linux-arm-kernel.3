Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C9CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvGC3o+HXUBsO1osZIafgMiKf+lkJO3vUojNNgCQ4PQ=; b=ZZGyz2gKpz8lCm6YLEVlYbunf6
	BHIgKwilCzoTjeB6LtRaGFZEkXpnxpZD/whbGusL8gPBZLa0IhsigzDuVjq56hYUSs2cwgFKNMfA9
	vrXK9GLq+jWluPXVUHxXLmnrzqXWVnjvkeD3yZ7NR7HkrKqI2eDjnVprs9cf9gfC4mxN1oTUI1eLO
	qKdZHx+Vl9mX/ykvchcAJ9czCbkxDc10mdWSqSrM+yJdXwqgV6KajG5zH1XqWSViowENdT3dKMstP
	nBiymS5IzbB8d7G5GW1J/SeB8sQyekto1Ou1L6yejajxOdFih2oU+Sl2AQpJSwxI2L8+PXJpR/qjt
	Az/QB41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKabA-00000000eQB-4C4j;
	Wed, 06 May 2026 11:39:29 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKab7-00000000eND-0vfn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:39:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44a74032ff8so3547867f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067563; x=1778672363; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvGC3o+HXUBsO1osZIafgMiKf+lkJO3vUojNNgCQ4PQ=;
        b=ZMqFuuxqFYl8CE/qUHRmujqLOcrNOWWZ+4IXyVF0QNuZDHC8LxLSRzXDUJhYzAkei5
         6M66Kci2DudIBHEdo+DHUF0zLnlyYXVLYRPj3yH+cIuO18LLNfs04oHAqKiGUMu1hDi4
         lxJSaiwicXNoQJTHzJPCkUCKgw1H6MDLVdOvXAHIlMDsngtU5lg80L4umi5o3EMAcchW
         pgAIvnwiT0OsNcQNDtUqkMDLqFELPzcANyEo2gPlFgNinaQDb7s/a+9aXz/SaaWuHple
         tRfatrzHy1jiFpuni/G+urCWMOu/eSWXel+Pn0Gp7mOd4q3mTisGZ+V0yzf3Hp0z+y2A
         ENcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067563; x=1778672363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvGC3o+HXUBsO1osZIafgMiKf+lkJO3vUojNNgCQ4PQ=;
        b=ZB3UJaZ2mdF5U0qimf1t68C1FFVkqRspGFcXbkApVR3klCsV9Xs/dvh0+TlwTGCLDN
         JkEyXAIPj1V3w+SpM0pUmEF159g+eNxDinBN2jERnc1gAhWquYsqRoapasT/PO2OFBZF
         Xzfvdym8DiLIX2puJ/g5KGnzexNNz3ZJDiUrGWujQ/A1B8ReAahhzFOQL6zm9PkiKz5o
         KNc6ba3ZVy5pnYdDzrfX4lJE7C25sOpzV1UU0aGkIZ7NX6EIpfJrXPUwQheB5dbOdz/d
         ScIuJvqqVlmpiE7CCj1NpSl24z05IbsA5yAgukku+9LugXhyFGfEarCQ/rQtBxUhC8j8
         Qtfw==
X-Forwarded-Encrypted: i=1; AFNElJ/x0mscHyZkh+/iNdSz2ZHztT5STCbOTA0SnpeMeCvVZGgNTKmQOgZGb9bpzw9ENfQPTJzC7TPIh7FfiELtdfEu@lists.infradead.org
X-Gm-Message-State: AOJu0YyPj8AlGUKZma9AQj45yL0PramMP4UaoY0UAkYsbQYTPvHTnnCq
	1hk7+4i0O4/ei65VtawPJ5O1wvkj1DHz5moHHySmW61Ngd+tZLiU1YOLVfOp4IER06w=
X-Gm-Gg: AeBDievPQNkIfzkYSPvcfatFeLS5NI/euU0zIQyymSlgbPOnWScQWJPLNHb8Daz7MRB
	0XgEfv0DQd1BspYsYKihBgiXB1BkXJ1E1PyKAno7Hiuvnty+XpgvPw29KLxlH1gva/662EPV4l9
	3NLxHmVhE/GvVge5taiQqxf5m+bYjKYLY4aMMDSxWolm3KPpqRwYizCkm+nmqqLZOTThI7J2G2J
	ZdO1hfF0TGMlsaMEA2uid1iJOocQpj5MTWRfPd3sJxzWnmr84lS7tw74XH3o+zAF+15NGOXRHKK
	k1tvgLBaghCcWDX+kKu7vhSQXD+LRO6c6xIo9RpUR0MBkFW3+0ZyPV9qNxAM6tFYyvqXXigPFyS
	csojdHV9qukMpECIf0tLCHLR2Mq77d8FRT+lzWlDyj8FzoVfpIrYcnquR5+2fWybGvivCGzNiTo
	XEdRSWK/PrdLmNkmatFXrdMyFFDbwwjDxo2lfYwTIDzOMEj2yzmTw+DKeGqH5gKstOl+KXXA9nx
	qshPjkpIbJrkalR0w==
X-Received: by 2002:a5d:5d87:0:b0:43d:762e:76ba with SMTP id ffacd0b85a97d-4515b525abemr5169570f8f.17.1778067563093;
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:04 +0000
Subject: [PATCH 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with
 __counted_by_ptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=2479;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=InPW5aIoFLfi7L5QYj+FWyGxWg+TtOroOI35/SgGMrQ=;
 b=pubO52w85UBt/AD2Icw0FjZhzPE1/uxNCqZC7wE3gbz3G3T+DYAk/KG32A46kRsJt6nvTwNLa
 uopL717hhx2AY4JcFM/7kgruUPkFO+YPujpA0lG1qTAm3QoXYbGW4Zg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_043925_285557_07619B3A 
X-CRM114-Status: GOOD (  16.55  )
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

Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
maintain consistent nomenclature across the driver (aligning with
`txcnt`, `rxcnt`, and transfer helpers).

With the member renamed, annotate the dynamically allocated `cmd`
pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
bounds checking.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 88a06842753d..fac88c427d2a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -105,14 +105,14 @@ struct acpm_queue {
  * struct acpm_rx_data - RX queue data.
  *
  * @cmd:	pointer to where the data shall be saved.
- * @n_cmd:	number of 32-bit commands.
+ * @cmdcnt:	allocated capacity of the @cmd buffer in 32-bit words.
  * @rxcnt:	expected length of the response in 32-bit words.
  * @completed:	flag indicating if the firmware response has been fully
  *		processed.
  */
 struct acpm_rx_data {
-	u32 *cmd;
-	size_t n_cmd;
+	u32 *cmd __counted_by_ptr(cmdcnt);
+	size_t cmdcnt;
 	size_t rxcnt;
 	bool completed;
 };
@@ -432,7 +432,7 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[bit];
 	rx_data->completed = false;
-	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
+	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
 
@@ -584,19 +584,19 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
 {
 	struct device *dev = achan->acpm->dev;
 	struct acpm_rx_data *rx_data;
-	size_t cmd_size, n_cmd;
+	size_t cmd_size, cmdcnt;
 	int i;
 
 	if (achan->mlen == 0)
 		return 0;
 
 	cmd_size = sizeof(*(achan->rx_data[0].cmd));
-	n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
+	cmdcnt = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
 
 	for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
 		rx_data = &achan->rx_data[i];
-		rx_data->n_cmd = n_cmd;
-		rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
+		rx_data->cmdcnt = cmdcnt;
+		rx_data->cmd = devm_kcalloc(dev, cmdcnt, cmd_size, GFP_KERNEL);
 		if (!rx_data->cmd)
 			return -ENOMEM;
 	}

-- 
2.54.0.545.g6539524ca2-goog


