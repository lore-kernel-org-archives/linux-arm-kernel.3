Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E16CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icODYKZ/3Y13ZM7Cds9bqBGuxOVMpNeuL9sEGrF2bZE=; b=eU7NmUm1eC2Hds6eRgDLSLUO6v
	2Wun/7kOk+R0Eqy/68Np1HNQY7JFpEXc65rn6sK3oMqzYzIXMxUtXbi1SNEcxLG4fR3qE9+ZtUXYU
	czWEkelU4ASOydzFU7tnLqSFviIxvtXVABXhawCCqWDfLyRI/V5sgwCwsGW3gQFtO3J93ASQas1+Y
	Yai5Ws1wELbEmS/OV4OLs1aq07tMPMKML0JoP+hV0RqVg2gKbAksdQ/eDXCzT/ZpOkXVmqraTF8qV
	KX5bYA6ZJXHGbctR3sPhEqUK69ti96RdNbMNfr5H5wLzZV0ahkd+ovwUupFrmrA2LviKO11bpNS3T
	q1yXaIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouP-00000007tsx-1wFD;
	Fri, 15 May 2026 09:32:41 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouH-00000007tmn-1XEI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:32:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a858881ad2so10517553e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837551; x=1779442351; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icODYKZ/3Y13ZM7Cds9bqBGuxOVMpNeuL9sEGrF2bZE=;
        b=OqpfPt5OBeCwlqwEnrVgF0iYa45QfA6cL6YQzvI/g0QhdO1KJA6cHaRHbLrzx+dx9j
         tHJ5MgX2zac4crSpz5+56O168XPUusUVXQD3VVyTdCBDqMA/lTGQIUnaqhyBXZ9ZVvL9
         YSdXC++BI1AmIcF8lweuBWzabdstqNEK3ElvrP2qBAKWZzAKfh0cKuqMitjCS+FyXvaj
         Awu66GTVlCaIMEG8mZ21erKNUlK/IizY6MIIOxdMFXuLlApid6vlb5sJ5VFJa8NUwC3m
         rXyy39ODLEpd8Ce3RzqYV2pP6dGRr9KrXEuP0RcT4KcVGDYI5p4DwT1kPO/A8Feekf+m
         d1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837551; x=1779442351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=icODYKZ/3Y13ZM7Cds9bqBGuxOVMpNeuL9sEGrF2bZE=;
        b=XYcfawQxEOFQYbof4BtQRM7dB/4xfQNyyzTYO8+3/MBPiNDPD1SBFHDNVynLakfizw
         LLVYZIR5M+5sQ9L6fN4gSnVHzQijCvPblxixn5HT6j5NCsKkDTAI+L2fe1GlVETCst9s
         cKo36+dGejmnGsVPeK21d6/KUccJDRx1k3fJOwdNfzR9BE9jj8XSUQW2rDQygryp4CIJ
         +NLuEg91nUQdydHKdBxOMtqRA0xJow4HPeSJzA8rm12sGvOD+wx74lzl3S4Lb/gh935T
         rA+7BYBNLbEYhew2BA5YKMxBc9Wq0jvkJN4J0Zn5U5v9hgpbNmJ3RR4vvg5Op04Nmy5H
         No0g==
X-Forwarded-Encrypted: i=1; AFNElJ9u+aEd/iiVrkwEHx2VLSAdI5THgRVSIXKhodNh1ieRW09lYBj5PjkXIj1Vxia5OjLs3qSgGZx3qpPobd4h/xUe@lists.infradead.org
X-Gm-Message-State: AOJu0YwjRScm7yO3yvezqSHIVJ2rTOLR5rUQ31s7icrMPNwZ6qMOxVZ1
	iCWPRwl11hP44S/b/LPfHw1q0Hpn7IlIO8p+6F0BpaRBOir3/PkE31r54u17pIiCN6Q+yScDuhZ
	0iv+i+h0=
X-Gm-Gg: Acq92OG5gOF5lfeFskJV/xMytXTadmTAsrHeCq78sIQPetkBV1B22MnB+dqZgFc7eTv
	yXTHseWUDDFR0HN9J1pxa2Kr/aauSJ0vEcbUTD3twzZp8ZL0Rcc0q3tBgwZP+pEtIk0Pq96prEQ
	gjagT1J76lYaErQiOPVI0o+ne2+hl8SRIajyoq1RJFh0TUrowfWg0BzhUQLezxUmlA78VfAtcr6
	ZBa91gc4RadKH5iScq8fbETj4A9OH4cZy5qy16/tpk8nXZ7YjqCZVqhJNDOWqxe5nbUIt0NWgPp
	7PN+MklRHtfiCMQUDBAsIEE33Ul1b9RYd/IR0iLMDwJ5/RUDgtNXvEj0qtg62hjT2Yew9ZHQQY8
	efzxKGpXO5DLT1qGPzOok57sET84Yyj0ZEwTiMesLtX++BZ22FrdIEH6eZcs890zuZ10xdMQlzG
	2YynL3orF2dMnCzuxOZ+vOkvi3VGT2pe+R0FOwTHI8P7AHxx0qeQFCqHsc47Ykf2kToiz54501c
	idGKIeWteYAO0EFYQk=
X-Received: by 2002:a05:6512:3b9b:b0:5a8:950f:e92e with SMTP id 2adb3069b0e04-5aa0e73059dmr1300539e87.23.1778837551168;
        Fri, 15 May 2026 02:32:31 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:26 +0000
Subject: [PATCH v2 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with
 __counted_by_ptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-2-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=2534;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6PSsCPf8MT5m6CKTyNMHZfTI8nn23Liu9P17dyBV634=;
 b=iCYwdVYT6ikyAuAHFKMY96Zb8VzivsZ/FGir1N0D+I9Bvv3JY2d7O/aVAlgEV3biuCuMwQejE
 Qa50TNwhtNPAFrevpDUGgvg10E2bG3cpWCB7l19gLo9OjBj9FgBlE9r
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023233_431766_51BECBCB 
X-CRM114-Status: GOOD (  16.51  )
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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
2.54.0.563.g4f69b47b94-goog


