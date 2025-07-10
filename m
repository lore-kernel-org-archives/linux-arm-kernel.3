Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFFBC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3pKi7gmbdRxDMGvDHzDBTkqcBdnugIWLhOTnp7NzQQ=; b=djGRRccM/xN5J4roOxhDDAXyeh
	au9rYyLNe0RrzO+Zax7s1j+wQDQP1WKv/PWPuwfT7U3KIjjvZDJeqhLfOmciUZrKhueWXQtWwcqSh
	F6YKeX/OL69Bt5vznUYSDBl6/Jplan5QnmEltaCAVo7SF7CHulMeplL1EWTaaCKvVHi4TreGvSQbf
	37Vra7bHfR9wc8lMWH2SUkBbNyBVe+JiRiT1c5W2TmdIQbL9TxKwLVW9qpKbgJaxyErrUr58HlsBa
	53YkBCrjHk6/Omy91FX7hQCbuCm1vKAsFcG6rjd3Cm80M+Zfmz0M+BD2UMHUrmWlt3XrRr9wFdX1L
	dlnMqs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q4-0000000DPyK-1qnV;
	Fri, 11 Jul 2025 01:19:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYe-0000000D2Ns-3u34
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3pKi7gmbdRxDMGvDHzDBTkqcBdnugIWLhOTnp7NzQQ=;
	b=bfVIBah2aw+fU4RVMV8zf2Umgbj4kqhet6SnIyOiILBd2sizPawOAtHe679yROd1hkZqTq
	W0gQnwbCZlpmGOZm+Gl2rNVuOn217sZbmLx+kJEmUWhl8RoWHZV/rVWGuL/KnrDL37eHRf
	OOByjSaJmZerHWaooi5FBAMCKtKq3Ws=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-5yYTDS4VMJm9TvFAB4TK1w-1; Thu, 10 Jul 2025 17:11:54 -0400
X-MC-Unique: 5yYTDS4VMJm9TvFAB4TK1w-1
X-Mimecast-MFC-AGG-ID: 5yYTDS4VMJm9TvFAB4TK1w_1752181914
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2355651d204so13975335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181914; x=1752786714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3pKi7gmbdRxDMGvDHzDBTkqcBdnugIWLhOTnp7NzQQ=;
        b=V7r0x3re0JL+xYAv8/cDp6mevfl81bQacYGQaTIoktr2eeHQlltU2pbGl0I1dWTLGN
         1qO0jsktps85svBRH9lbItTPAPzNta+T/VM1knlOhTbI/FXCaVEKIdoUJZYWDmwSfsru
         jQJO8Q/EoUfiFwPwJijwTJ+yx5YNpfkgR32jQ3Rypxlr1d5IjYH+2uqo41sjJWQ0Irdg
         k0zqZdGCBZD1uZrDAgFruWQOIELlv0yaAY4uQ1+K8pcR+2VI3ZW2cXxSJHjW94qCFqEt
         DqQ/YXsWeawXfqlFxtdV58Vm5Hv29QJoNub9XZVLHKPey/qk1rL/O1fxo4O1SVA33plm
         b8Bw==
X-Forwarded-Encrypted: i=1; AJvYcCX9cs9DclDhal/u+zDoAVm19fqNGiCBozfUCwjkzepquWIXYD9m/57juPTJpQ9cv246jr0RjWUAv1CDiZI3RVjp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2HfNeTDCgNdJlN5DbjoE5ax/wDtV+JHFvHqFJvu+DdQeV5dgp
	9trytb8j95TSnhemFy/39zaGALkNDGn0xtKP5lLinU3eftw8WtB23z6UQG/JoF5SctdsmXOxGcV
	p/UehbZmDOGya9sE0BeH9zrakRkGdpgvRlfDMtAxFSaZAzBoDa6lLCECOAuE/5LkIJDxNBTYV+P
	20
X-Gm-Gg: ASbGncuM27Pe1Aw65qz+ZZvBPkWyKCAdGbb6cB90Is1/AxRzBrc2RDWD2v7FYPSRxBV
	teNnd/l+d5eIxt3KePompjd3fOsSGsXn02ERyWuy4QBY+uzJhSypV4MrIEMgID6Krve5uhjcInj
	AVL3GFI8mCukkvqxKa7k3oNtxHArWhlF5KjcfQfy6O1yENWOgMYglw3J+br6j2z1a2HZ2U0KTKg
	ahE415yaXYcIMNqMo2c1hR1tdz5mFyaU+AoKlnp18fmQ0VPD9eJY10857nlYpxbi5LB6HMKLZGK
	GEAywSCGIp4vwEZ4rOCLYmXVEdmXrd3xLcxZUsIfx4fH9g==
X-Received: by 2002:a17:902:d58c:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23dede2d32emr8791245ad.5.1752181913797;
        Thu, 10 Jul 2025 14:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAWwN/SjCjjk2C16hRtldR9Jrxr/5SqinWuYstCSC8yLg+VOTRMI3EYy8AERYnpIRY/BjZpw==
X-Received: by 2002:a17:902:d58c:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23dede2d32emr8790995ad.5.1752181913451;
        Thu, 10 Jul 2025 14:11:53 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:42 -0400
Subject: [PATCH 10/13] clk: imx: pllv2: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1831;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=iCQSW+rl8jgN4muSCz6LT4Tmu/x4mnNV6P0yGM90s2k=;
 b=M715uGlNOTk/hsTjTOR0aXywM6syQIVmVaWNxKJVhBAQ3BGt2e3g40om9S0M0IRyr3SGLc/QR
 4mUGYd01DGABxTTGx9atuBwfFNnSmN4pS6Y2gxrB90u0wvVApCNrTSZ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y-FPazfdbbOw6sT-d0EOZucG06fNG5mcE-oNqpQxrC0_1752181914
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141157_046653_295D33D9 
X-CRM114-Status: GOOD (  13.53  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pllv2.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv2.c b/drivers/clk/imx/clk-pllv2.c
index ff17f0664faad23d826d384fa8f972e21ebd7da7..bb497ad5e0ae3df923e8f01eb2b8af710f8f8f29 100644
--- a/drivers/clk/imx/clk-pllv2.c
+++ b/drivers/clk/imx/clk-pllv2.c
@@ -178,18 +178,25 @@ static int clk_pllv2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_pllv2_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+static int clk_pllv2_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	u32 dp_op, dp_mfd, dp_mfn;
 	int ret;
 
-	ret = __clk_pllv2_set_rate(rate, *prate, &dp_op, &dp_mfd, &dp_mfn);
-	if (ret)
-		return ret;
+	ret = __clk_pllv2_set_rate(req->rate, req->best_parent_rate, &dp_op,
+				   &dp_mfd, &dp_mfn);
+	if (ret) {
+		req->rate = ret;
 
-	return __clk_pllv2_recalc_rate(*prate, MXC_PLL_DP_CTL_DPDCK0_2_EN,
-			dp_op, dp_mfd, dp_mfn);
+		return 0;
+	}
+
+	req->rate = __clk_pllv2_recalc_rate(req->best_parent_rate,
+					    MXC_PLL_DP_CTL_DPDCK0_2_EN, dp_op,
+					    dp_mfd, dp_mfn);
+
+	return 0;
 }
 
 static int clk_pllv2_prepare(struct clk_hw *hw)
@@ -235,7 +242,7 @@ static const struct clk_ops clk_pllv2_ops = {
 	.prepare = clk_pllv2_prepare,
 	.unprepare = clk_pllv2_unprepare,
 	.recalc_rate = clk_pllv2_recalc_rate,
-	.round_rate = clk_pllv2_round_rate,
+	.determine_rate = clk_pllv2_determine_rate,
 	.set_rate = clk_pllv2_set_rate,
 };
 

-- 
2.50.0


