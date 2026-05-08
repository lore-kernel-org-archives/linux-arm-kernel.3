Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C3CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bDPLWhf2Swx5+TpPMoElnS74C6BcZSaXrBoYo8J5R/k=; b=T6rgFKM08T8XrqyFJL09zdRh21
	QnVkBZEiMVF6P5ipQJ9kb/dD8HRjdeLC9v6wTT++dIEivB78V5jad6VXWDrrT6hogRAjhhF834INu
	r8ONpokVkV2TLypKzYk6ib3o5Bnz+bbwNWmr9oQfSAxabRhD9IZ03bWMdp5KxjQBup/shy/CheGbG
	wurHmStwWQLgtOjgreTssg1srXhxlQaLS7pW/EqodZ+H4DpS09YdHMTdCb5/eBEh2mLmLSEu0bO7Y
	EpGYsDt2BsyU95ArqQAnM3huwrDdKepv8lC5/mjBeehqSNZ2tv2Hwdu+U7PkHPc2HyOhvWA7GcDPC
	D2ve40cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLORM-000000072c3-1lUR;
	Fri, 08 May 2026 16:52:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLORK-000000072bR-0s7F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:52:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso14019445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778259156; x=1778863956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDPLWhf2Swx5+TpPMoElnS74C6BcZSaXrBoYo8J5R/k=;
        b=KyE3hnMjIdcsM24TgRfbFdpgJottu1G9V+SJTDB+pm4GVOS6xEZeRdfcXg43iuEH+c
         oW4codgcf1NpCDHAPYfSClP2UkMGSEoZtjpf8gRnMoWtna+cBigVx8x3C7teDVgC4Nwf
         pXBj1Gtv9uMPwWFZXBZqZwNmmZGKiWZQzdANtGHg0ysoLCTa4nSMfN2VHXlbcLKpznoe
         eT11Ewo7eNP38q8ATTZg5rGPTQWrLzEm/eNYLPxyIgm7z7+oMWTnbKYUrcnOkPHl3MJu
         /ySCnGxLUSjKvCi+uEoQzkppftjqEx6xaZ6GC07mVN446mNSHrd82HHKshvR1yvABc5g
         hg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259156; x=1778863956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDPLWhf2Swx5+TpPMoElnS74C6BcZSaXrBoYo8J5R/k=;
        b=MMUj2Ng+t/y/VthRLNdDFSqLlmSLuCQRCc/9ySHv5Evh5gZPffHmED2dStGfuSJoJH
         Lfdob/23bD+6K6b0vWC4ym77F0oR6UzAPg5C02qR4E5NRIMMbuaMasHK1tC/MsCAUesc
         rIcJzGmBrhF5YufcIutUUa5Lj+aSoA8203u2KIE4mxaaX2DKuo/D8A+ObRDhVn3m0QLW
         0JrR6rEGZtpTYurlLnsUoPk7jvfuTTXaWEe+x5OS/IzKALMyKmSOYv1HSdafP57VfW9A
         vWODJOX+BhS8nRqVwsSY0wxuemHCRj+FQTQMcDDAcq0pvh6+TU3LY4HRRsELFKWmgvdo
         uFQA==
X-Forwarded-Encrypted: i=1; AFNElJ/DYLwgFMzsamvm24VKgjtVXuaFNDcPtnIjEMcjtGvO4Ehwnd61WNQpx3P/MGQGpsyBB1/BM+5tMMoxIwYWMmGr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx03DQF4kE3ghhS/tqTePZpSZlUwsDpTz3bF6t4/RipjSLSUAFQ
	AcjVylcFSnZ0Au99GryYwFmEdwkK4iZ4gQoERtdrFegPmVSdZjLPOM4T
X-Gm-Gg: AeBDievGsnoNYIkAe0jIXuhmROfOQVOMILRIQ8b+rj2brOuMib3hLYJtQmM/oHzz0PM
	oTj1S357xFHyTwFuM8g+i4km8Fnqp8XpWs9A8HSl5LO8o5vd87gBA2nArhx+ZgeUN/TspOsK6Yw
	o3QU6YZUXfrJD2y6W9tpUSN5p9os7tt/UKpIO5/uEbZ6c2W14eUb6JnqWoSn7C4+YVnY/7acBiU
	kwKPQD5jwLg/V4juVnmj4cfw7FhZ22eq5DN7FtX800BDcgfzhaGZRCJ1U1oraYGxu4X2sMEQuDd
	n7rjvjk6s/+9+hhdwKqTEb2dLSxYtahOj19ErFoOHY7YgduUX9nJS8t9sMxb0ttB2JfPDMP4W7k
	AsOMlaAQtL/lfOLW3q5DjnHl+Q38im9o5Bohlv8HrIgRR/3lwF7NnDyVstxiC9q3rVt4qU48w7d
	lR/xfrXc+sRPLS09R1rb2Nhg==
X-Received: by 2002:a05:600c:354b:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48e51e0c7c9mr202325015e9.6.1778259155336;
        Fri, 08 May 2026 09:52:35 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd35abcsm6637015e9.7.2026.05.08.09.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:52:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] firmware: imx: Fix spelling mistake "mismatced" -> "mismatched"
Date: Fri,  8 May 2026 17:51:09 +0100
Message-ID: <20260508165110.73435-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_095238_256247_941757EC 
X-CRM114-Status: GOOD (  10.80  )
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/firmware/imx/ele_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 78440f62bf92..e5117a1f1995 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -110,7 +110,7 @@ int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 	 */
 	if (header->size << 2 != tx_msg_sz) {
 		dev_err(dev_ctx->priv->dev,
-			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
 			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
-- 
2.53.0


