Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00EDCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fFCdIMIJ8Uo09Pxm7hTDDj9X6OUIsKRKshcXYCzYPI=; b=LEfdV+GxZfNN0i5EYQ1OJL76iA
	l3Q0Jsq9wB//NwvDZ0qlmknFDfHlx7x9U0xbqw6R3ayOKUEVxtPZ0up7RpPfypfwn1CjN+xYmolG+
	Eg0WrG253JeDDPuJCUPHdNFF1l/WpbDuHocux3hgphJQJVOlaJVul22mNEpBE6RFtw21peA3VlnLN
	xKeX8isB7l1TGC+CaytstwhjUs84r8uVn13hId3OX4xNvttW3+b0MT9xluoqRL0r1Lh7W6cIHgpOC
	2mp1dCvLNoQxwNsUTZiPmawVJd79uEXV6FsOe3CxhKAwEDjp1fHiZ3q5jWXArurMVYQqBIU2gqdZA
	lMyZ70lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttX-00000009qYF-2UCu;
	Mon, 03 Nov 2025 12:42:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttU-00000009qVd-3eRj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:42:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so2258115a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173763; x=1762778563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fFCdIMIJ8Uo09Pxm7hTDDj9X6OUIsKRKshcXYCzYPI=;
        b=P9t7WBSj7I1v2FXljNuF5UjYmVjR2OUaoRX3ksvD6hfcthuIf80fN1ixHyKx/yFY3s
         /Ai89ZxfMF6U21sXbhTCkcePCqvM/ALalMVjKBF9uyvvieojVePoCGWE3yaclnwyhL4v
         hUltWBr68l9CR+KakwlJmaWKnfPITl4FSUsyuSUudwc2qokdWaC0sybfi6cb5cV1cBVK
         l5cpyrc0UyalHYzBAp//dKrlWln4p0DBrFBTBxc9r/InHRe/PPVksWAOGa41odZh1MCP
         x2ZuGRpQ2cOlBjPxknEkVhDScXvOKgAuFH9IVHXgs20jx1ZPlzvNpfJNWU5F39q5naI0
         Blng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173763; x=1762778563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fFCdIMIJ8Uo09Pxm7hTDDj9X6OUIsKRKshcXYCzYPI=;
        b=l3zhvuZvfQQphEb+AUCqgm1lXYDyijDlZdDF3HKhgvNkSzlAVomlc04HQDmzOgZrA/
         LyS0AmX/FwI+Ay2Jl23ElNM6BKhYLc5yQRvedUYFhq2P4eEZVLVc2icCupy3rzQ9uxTp
         dpDfL4CqEs3ZNL+CvOIAy/CYDKUNUhueLuD+rz1L/8DEXGPghOy0eQ7+5eV6N5g0IdUz
         YugrOnt7wxL8ufcJ4fIGYMHcrST6EmhLwpmruOGDwM1BEQP0csB9acxu3j5QRkfexFfH
         fgxrca4EVuq0R4eXPV79XR+K58UB9qc3zLDAWGe3XiI41ldfqdYqMA1zoRl2VwFKG/uQ
         tffw==
X-Forwarded-Encrypted: i=1; AJvYcCXxtO99jn31Kdv8PytalHnZMv23Q7wlXImMKRUYkytjVGS2lLpBguWUPqkV4Qff/KOAHWTmHdBUZ76J5Byv9spw@lists.infradead.org
X-Gm-Message-State: AOJu0YyYAtRkmB+kbR5BpyZVeZxhvnAPvmyjfxLKBu2GqRdws7FsE2j6
	xMDVPm1pgyOr1ZyjkxYFnF8Q5vVIaTnqs1mBQpazyEYpd1cjo1R0HFkXfrAvc8SetFA=
X-Gm-Gg: ASbGncuKgoDTYV7EAMWAtr1Uhimlsm9/h/5Pw9Hl5mDSWWBB9Ho/TgDYHlGNvNBBNux
	AJf2Q86kmmI+kRcx5NP2VjyhnyK537QhQ+ElTlZVqtzT4Ckgl0cpGK5tb+QtUzpEDPThaZ0qT+r
	OcwMm1fVuHJGxK9wxSCKfa7VWQqoPEW+YroHMRywlWvDGMmvN6Gvh1JBR4KVNl7K7AxbpUr5+SH
	OS9Yv0ycvGVlmQA43w6XyRdQdIcXgO3gJoeFxLPmhJrdY5wev10gK0CSGWE8SzegmDIVzblxoTk
	LO3FJSq5TdDUOrJ6LEaYToF7ORclM6LORi0abUWzqxfpbrfFtdxdKO2q+y592xFKtw+ZYLg3iId
	uQRyFnLYMiyC0FX6oh8B0ELEPMJ0bzem2u6iUtHI2X/OSd0qh8/vTLJlqr5uM0bECzpivHmY7Do
	Gt3NURQw==
X-Google-Smtp-Source: AGHT+IGLOlATomjwi7fjoVoQAOmBe8LfZrNU0JTjWyfW5nhEuGL7RfvkIMlNkbvH5sxfdhy0mbYqtw==
X-Received: by 2002:a05:6402:440d:b0:640:6512:b9f with SMTP id 4fb4d7f45d1cf-640770209afmr12414380a12.28.1762173763080;
        Mon, 03 Nov 2025 04:42:43 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-640aa4067f6sm5556380a12.34.2025.11.03.04.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:42:42 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:42:19 +0100
Subject: [PATCH v10 1/3] firmware: ti_sci: Support transfers without
 response
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-partialio-v6-12-b4-v10-1-0557e858d747@baylibre.com>
References: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
In-Reply-To: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=msp@baylibre.com;
 h=from:subject:message-id; bh=05bvAMFQtigRL9AkIb9HLNaYbuwhPBcTJBkQFv446gU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyOxYYuAaVLVRiPt3JoMtrKTTqVPGHBt8C59bPfH/Pm0
 eFI17vQUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPp2sfwP1Io8u3ah0+7Qsy1
 7vg8+H6J6QTbOom63ra1x1YGSx/NYmX4p9tmlb56XfzltTOZRAuFHj1WW1h5dnNb5KXdUtU/Y7r
 fsgEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044244_929642_0AB4743E 
X-CRM114-Status: GOOD (  14.99  )
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

Check the header flags if an response is expected or not. If it is not
expected skip the receive part of ti_sci_do_xfer(). This prepares the
driver for one-way messages as prepare_sleep for Partial-IO.

Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 49fd2ae01055d0f425062147422471f0fd49e4bd..2585cb82d1ad8e3d79bca458a2b86cc81a3e627b 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -398,6 +398,9 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
 {
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
+	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
@@ -409,12 +412,12 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = 0;
 
-	if (system_state <= SYSTEM_RUNNING) {
+	if (response_expected && system_state <= SYSTEM_RUNNING) {
 		/* And we wait for the response. */
 		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
 		if (!wait_for_completion_timeout(&xfer->done, timeout))
 			ret = -ETIMEDOUT;
-	} else {
+	} else if (response_expected) {
 		/*
 		 * If we are !running, we cannot use wait_for_completion_timeout
 		 * during noirq phase, so we must manually poll the completion.

-- 
2.51.0


