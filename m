Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B77FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JCJJgoNCZ5gGQkcl+YQnJFPiiEiR515Ip28lGR0OcA=; b=KnEXETHjoCthGAIMh6CiU6jWU/
	LxpSDT7/H+NYoOHMnalHVr61z5KYFngmzIcxBkR6yAiVgUtQwlamFC2Tdy5pO3ojEhn3XENkWs3Ki
	0TkDPLkseoCz/IXD9iJZBjoZ0nQKwUt1oUFHbqmEX+pmsrNB/iLqc7PQ9j9sjxaEj2eegpgBduac6
	NH7tUWNS74NvQoqb9w/635qTnGZBAH3UwfVF1JeTfkVrsdn+5waxcZDaYF7H7BWmvjSNbg4p+uv1s
	Wl/guvRkZgPdLfcKihyFlrjXjvSDVDkZp4IPjFAAzyBKUNSx2oZiVdcR0vbOSHrFN0WBqU5OUo586
	9qHb94yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hy-00000003dXu-1hVT;
	Wed, 29 Apr 2026 13:12:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hr-00000003dVT-1Wh9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7JCJJgoNCZ5gGQkcl+YQnJFPiiEiR515Ip28lGR0OcA=; b=WRpL20URj0NMKYsMQpe+X2C7Hj
	Rknh1V3NPJ3ra/FsHYRpmqpdLw7BOzZbepQwlLiYhj4OWp3zXCwpyiatwrpmg6L+HNQUyNhhDVE0m
	eiq5OpFnJJni5C+pJtROeHWDuKeYEUMkrxoyLOgA+BX+NlwMG3700iodTsHp3cPI/dDs07wViEher
	bInE1FpH/Pp2y1Vt3/1UMftq3NxjXc3aQtM8nkAykRO81CExAqIKBqI8QTnZ+2dq8qge1oqKh8XLc
	xxCCzyhtgggSxdCgaZMBSDKtxIwVtsVuUv3LQZgTwpg4lIU7UYXsQF1ypePaC5fnN/c7kACz8aiva
	HHMGO3iQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4ho-00000005Md6-1QhL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:11:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43fe608cb92so8458071f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468315; x=1778073115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JCJJgoNCZ5gGQkcl+YQnJFPiiEiR515Ip28lGR0OcA=;
        b=niW28apxRr1LrW5R6JSS810H5bpyREl/F1ynSVqjpKhn2Vu7s0VKRifUReFML1iCFp
         gL+uL+b/y1wuAzaqQ3IoSHNuMgvvv/SJRjEjSzEVjPwwG+5psKkWVTM/ChKLj93OIpGs
         hUO0dXxvsByI1Mx8Gz80I8fFs+fCFtd3DdhGk0Ehn0Ap3lILCn/bG6By8xQVLzcNhImT
         jaoEvQGKpesxwgwMJgagqQJbmTUDQvy0gLGf/E3XFf1a2vuypEPQhdM/OJhwgSRJmbwM
         s3ccYnOlmZ4b+Fdr2VPxO5jaQG8a+xsUNBmlGdukRbgpuTTylb5vqmeNq4K5L+HpB+PM
         lY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468315; x=1778073115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7JCJJgoNCZ5gGQkcl+YQnJFPiiEiR515Ip28lGR0OcA=;
        b=CCCzzQmCjvT++KU8gwrsQ5IeRF2dax0kGuKlUnvjb2O8I5s0BGY7TJ1QGBgiXINxQ9
         CazNhkZg6+T7kZw7iMMqMiRo39ApNgnxkZtRuVqBrD0+T2SP22I45qTFjbO69gmrHNwq
         CUuxq2CDhKeEdkuDGkx+eNf3b5vcrpZvvB+PxLAnaGx3RPLbkbugJldcL7L4remfnprt
         i8LjgMdT5OMyQ+1VnxAKwKdvBcr2NO4+Q93DZq0RTlNNZLmfGQWUCrRKCx0LhZSQSPw0
         Lxa9sx0YEt54d/HoUDRRkFbEH3toHey+JmDK3+Me3MS/tn9i8YHAEacUw5ukc2BmTtAH
         dJxw==
X-Forwarded-Encrypted: i=1; AFNElJ/xzLs0xOJM3SpojQrwQ9ka+CeCTpM3kmlY2WO6tmPST5U+8REbcYvuqTiy/tW+W0PGs+iONX1DbkXucgdhaVef@lists.infradead.org
X-Gm-Message-State: AOJu0YxW/p75oLQ26BmyJevAbRLDnmFRaIpjjSbt9R40xq4xOxj/Gvv4
	aNX0gHuoEPjY88j29nMfH2I5U4d7gvs1WwYGSkiN+gIqrFnTE7B8BGgYqr2sMtS55EA=
X-Gm-Gg: AeBDieuqTbXtiEAJV8zNsARtmZhgWw+VMYc/Do40+RVtz1tRNMaQdnxCsk89EQwtCBW
	uxtPbTmR4ZWUouQLQVdjYTED1tiUbx5VS4NdiNTDSlSUxxnUD7IJrgfXPj1ooJAPsL6ekajJbSj
	y8en0LzOO3R7XjA9Z6lINNviRwLElbnJ8KJmmVE0x+f5g+vEmcPi91udnZKwLlZGlKY6ew+txp1
	Cvbg78yX4uhEnHAVS8ZjYlOrv97FrFhl703oAg68LVurOskZZ8qV78S25mjSQsNC4HWT37+UzO1
	tVUPgaZfRJtOver1UXMAwyd86NRKTGY41mHT3cBPeUOTxCR1DoPL/UNmRF40W2vf5waqPvp2RXg
	F54M5ZAcGmQCz6f9JSAf1/aHEY1goX59NRj87KzIbftR5PipJL3nf6fGHSXZY8YgVK/lrROPPzX
	X3+QeLjeosKIVbb4llYOILUgLYeEmdnJgkX7QT8wVDbpSRI90hxURvwtij7ztjpHk5ogSFRZmBy
	V+bnRibsaQNEhLqUA==
X-Received: by 2002:a5d:5f83:0:b0:43c:fdd:ea96 with SMTP id ffacd0b85a97d-446496d7958mr13247989f8f.26.1777468314477;
        Wed, 29 Apr 2026 06:11:54 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:53 +0000
Subject: [PATCH v3 4/6] firmware: samsung: acpm: Validate SRAM shared
 memory and queue pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-4-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=3318;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=q1S+03aGlcH6n28TvbZ1L4it7+K5AeVq24YPPGzZ2I0=;
 b=Vg9Aq4hjk+3SdpYiyCFYei12SF/+xSvtM3lyisaToANK/5u1mqS2/n17ihJi1MyptTCu7yyiN
 oSXoNoWnjfQBZOF7NiENy941dWjDk3deXwUbalPXuFT9pK5A5euN62h
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_141156_477471_EF5CB52F 
X-CRM114-Status: GOOD (  13.99  )
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

Sashiko identified multiple missing validation checks [1].

The ACPM driver reads queue pointers (rx_front, rx_rear, tx_front) and
configuration parameters (qlen) directly from shared SRAM without
verifying their validity. Relying blindly on firmware-provided values
leaves the kernel vulnerable to crashes or infinite loops if the
firmware misbehaves.

This patch fixes three specific vulnerabilities:

1. RX path infinite loop and OOB read: The rear pointer ('i') is used
   to calculate the MMIO address before the modulo operation is applied.
   If 'rx_front' or 'i' are >= achan->qlen, the driver performs an
   out-of-bounds read. Furthermore, because 'i' is mathematically capped
   by the modulo operator, if 'rx_front' is >= qlen, 'i' will never
   equal 'rx_front', causing the CPU to spin forever and deadlock the
   polling thread.
2. TX path out-of-bounds: 'tx_front' is used to calculate queue indices.
   If it exceeds the queue length, it causes invalid state tracking and
   out-of-bounds memory accesses during __iowrite32_copy().
3. Divide-by-zero panics: 'qlen' is read from SRAM during channel
   initialization. If 'qlen' is 0, any subsequent modulo operations
   (% achan->qlen) will trigger a divide-by-zero kernel panic.

Protect the kernel by strictly validating the initialization parameters
and MMIO queue offsets immediately after reading them.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index bd0d48e9d157..e4d8d1120192 100644
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
@@ -439,6 +446,14 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 	scoped_guard(mutex, &achan->tx_lock) {
 		tx_front = readl(achan->tx.front);
+
+		if (tx_front >= achan->qlen) {
+			dev_err(achan->acpm->dev,
+				"Invalid TX front pointer from firmware: %u (qlen: %u)\n",
+				tx_front, achan->qlen);
+			return -EIO;
+		}
+
 		idx = (tx_front + 1) % achan->qlen;
 
 		ret = acpm_wait_for_queue_slots(achan, idx);
@@ -574,6 +589,12 @@ static int acpm_channels_init(struct acpm_info *acpm)
 
 		acpm_chan_shmem_get_params(achan, chan_shmem);
 
+		if (!achan->qlen) {
+			dev_err(dev, "Invalid shared memory parameters for channel %d: qlen=%u\n",
+				i, achan->qlen);
+			return -EIO;
+		}
+
 		ret = acpm_achan_alloc_cmds(achan);
 		if (ret)
 			return ret;

-- 
2.54.0.545.g6539524ca2-goog


