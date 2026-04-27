Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7743CFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZ7wHKT/b/1jeOqUNO1Le/y2Yble71O6C83Q1O+ta3U=; b=xtENrrvBt1QndEMB5C+O1Xu1U/
	5pm1j1tgZ0ednryUQmhKY30wWJTWsnTgpB2DXoBZIAzIxLlpEMhgknwmTBlv8/ZXkKe4Gj/8cBQIX
	eGvJILdjA9TB4wa7LhpZn3sk7vmf9f49AFH+tlz3o3lhYfnSkX/L1OkybBzqL3dypIpOur3XZhpVo
	Phylyxl7bpNE7a+R1ikecZjQqjagbGpg/pUdcLJrp0KzOCy9W4y83f9OwPMzUyXvSHtZi8nWsPW3w
	2WQGqidvQ7Yb6hHGI/asUQr1uiYwPRNRUS8dKheDh61zSIFeFVMhS4Sy9vDOWQRCZGwJeqUpAFkoI
	51FWTVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVf-0000000H9Uo-2AVt;
	Mon, 27 Apr 2026 15:04:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVS-0000000H9PB-28SA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:04:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so136412625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302256; x=1777907056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZ7wHKT/b/1jeOqUNO1Le/y2Yble71O6C83Q1O+ta3U=;
        b=NzBeBnlP52Vujz81p4pCbQ53OccTl9q0JRa7Dv/B/nFdJrt4Brk4sJEXIRJqLtWD4b
         tNT6ZvF7eNWyCxg7fu+xsDeac6V+gdlJIX2ih6uRmUOlnBTklqn9xJCjHvfg9CDIP/32
         uKFeFCgMvbEMZoAXDJn/SLNdxKXLc4fvYhHguOLSl59s3wgqGJYELwZVOKN/qe63HZsN
         YcoyOePrIf+M4NiWGrZsMxGWX9gvkcX826iGlD++fGer4lao/kJbsfKOoEKOEpbA7lNE
         xr5bUSZ+3Jaso/HAaJIypZzrvs6Nr+PEB1pj4PAv6959pMHxVzb/L8P3vY3k3xYGtdRi
         e7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302256; x=1777907056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZ7wHKT/b/1jeOqUNO1Le/y2Yble71O6C83Q1O+ta3U=;
        b=Udg6FHwKEY6LdlQXGVCak2qWzp95HcWSTGEahxt2BfXGwlLC398vPOo0Ar2wT7Ifvg
         oEKfOViZstUoopkS7fWKCqZRqkdM4ip0Y8NAt13KY8JLRjWQhJyfKKBqFs6XGb0ayhnJ
         HmTbEKK8KvPGJF0iE1xV8gqDkb4L11Le0hyVIoaJSrhX/2InJA9NZuvkYISE49rTsoJp
         QfXu/s0xhvWu/BSixRW7WKzkZUaXlbtdd+1/ly5QUx8MLALzKEA/6ORI9TUXRzVR8iUg
         OqIFpctF/XEY4vH9lUP5VQTRiivLr5EPzmTdYzoXWHtcgDo+g4NwAMh0ltGKf40zj8vV
         mrfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wEbQ4K2GYD4gJ+EnJ9irib2fP5eVUWaHn0NObyg6udviHC6QkDIo5MGMk6v6AmdOp/5yG46sCgLtunNPljHrk@lists.infradead.org
X-Gm-Message-State: AOJu0YyFj+QISr/l0i1uqP8YGh/wtXx5mPMdasesZuWxPbiPPqxsaV6D
	/jmycBOgIBRjzHPL/RRvrRkm5jIsFXUO1etMU/7YEYy1C8KMdMt4VDN/5l2xHn9Br+Y=
X-Gm-Gg: AeBDieuLiwIRXqN+tvbkxC2gCwLRM6X3o1wp95PZWFmCBYPrPmL9CsgZtqPpXpjRx0E
	5OSAVe28GKDvZkfI6VwgU/DtahSNmw57pefbn5Kp/tbUTYECeQ2POG7iRWnhAN8MbsDuGzAnMI0
	X3GEfYawSV9MlrfsJ1Tik5Ai2b9zuq6EhglDUFV2tUOmNZ8CrRkSAoEYF3R/wEPHE5+mcNTbt/K
	mGU5z97wJNEA6PDfQ6m0AWn3TnmcH6qmyqcea3pM+FjZgUSe9tuRtxKLnO38kKV1WfBgByf0nUz
	kcM9BB3UK90jP+cXmWXsUAVcH9//kqFBQNmhwEcZ0z++xMWb+VN78xv87nrNbO9CvSf/wOPm7AW
	YEK5r7jacSzCvi701FksXldDLTNo0rBO2QWVY65XWGXXpLb7Eq8bSvV4a2E7c3UZLJ2ETex/NZR
	R6mUCeIw6xLXUNLkvLC/rAIdXU7e4auZL2o/3ndZLYrYjL8xlPAMpPZe7ScXMB+FXX6+K4NIYbt
	T3kVs+woOX9+zEzrQ==
X-Received: by 2002:a05:600c:6297:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-488fb77155dmr577914705e9.17.1777302256438;
        Mon, 27 Apr 2026 08:04:16 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:10 +0000
Subject: [PATCH v2 5/6] firmware: samsung: acpm: Fix out-of-bounds read and
 infinite loop in RX path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-5-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2000;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Ew+fLThVC+dSbzbNb1AU8XHhAhSM9m8r433IWvT/JQk=;
 b=bNdL0A0E7+FoNQEHWtJ8/0fKtqwb636UbTf2X5UWD2LrhRiobr/5jvf4G8NE0a+KNaWY4PLU+
 5i5T2klfbR9CpJBuSWbdOvWAIXalA2MXO7vpbdhquEJVWqHFNX7wee6
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080418_579906_89051F49 
X-CRM114-Status: GOOD (  11.72  )
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

Sashiko identified these bugs in [1].

The ACPM driver reads the rx_front and rx_rear pointers directly from
SRAM and uses them to calculate SRAM offsets and loop termination
conditions.

If a firmware bug writes a value greater than or equal to the queue
length (achan->qlen) at those addresses, two failures occur:

1. Out-of-bounds read: The rear pointer ('i') is used to calculate the
   MMIO address before the modulo operation is applied, leading to an
   immediate out-of-bounds memory access.
2. Infinite loop: The loop iterates using 'i = (i + 1) % achan->qlen'.
   Because 'i' is mathematically capped below qlen, if 'rx_front' is
   greater than or equal to qlen, 'i' will never equal 'rx_front'.
   The CPU will spin forever, holding the rx_lock and deadlocking the
   polling thread.

Protect the kernel by strictly validating the MMIO queue offsets
immediately after reading them.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index c9aa79c2faa4..43658cc1347a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -230,6 +230,13 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	rx_front = readl(achan->rx.front);
 	i = readl(achan->rx.rear);
 
+	if (rx_front >= achan->qlen || i >= achan->qlen) {
+		dev_err(achan->acpm->dev,
+			"Invalid RX queue pointers from firmware: front=%u rear=%u qlen=%u\n",
+			rx_front, i, achan->qlen);
+		return -EIO;
+	}
+
 	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
 	if (i == rx_front) {

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


