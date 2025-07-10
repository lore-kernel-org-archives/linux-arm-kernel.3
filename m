Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28426C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+c4BMiRqhsfmVjVjooOln1HDcuyuqfAoeFZzGp3Oyg=; b=WBnZCa3Rq0jnP6vKRkWkfavlg3
	KbhuoRFRulsTwdGVSm7/IMRwVSdEa8Iwho67qsV7eIMUqtxibTFjDPfwjt3FWR1aCHz4voZ0l3+tO
	DvJkTrT3PpASi9YUKVADV0GQdQurT06BIYyJE2HkmwyPlwHc94UMr/FOhciwhzIQIg+mY4G6sXC3o
	B6/6rSTsK33F0fEJdoDCKsLifrP3gdjFTkVFmJ/T775VbkGga4CNg9z980M/BzXmtaccXW5WBWm0V
	hGmvPXR4Rro9rZDAiOKoWUeav1CiGKpxeWfWvTo3NgMfZmRFv73ClLQLRbIfW2v8ptp9sCbIcl2TY
	RavzU/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q2-0000000DPwk-0RYY;
	Fri, 11 Jul 2025 01:19:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYP-0000000D2Ix-2wIe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+c4BMiRqhsfmVjVjooOln1HDcuyuqfAoeFZzGp3Oyg=;
	b=jGCLv0bYG7CuTLDSJ1ge/3jADFeBWBJJDZ5lqZhWqeehepahY9sSVBE3l0qeNYjATUZZdW
	t96uO6QQEYq0OdpNodAbg8q/1Ia3C1FeUSinJc6uJ5tYdhM2M02RhQQ1NQ8EG33x766LUt
	bsGZrJQjzDDin5aZ7aLVythuYYWMdf8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-ER6rcNVnPYSX1RRxV1f1vA-1; Thu, 10 Jul 2025 17:11:38 -0400
X-MC-Unique: ER6rcNVnPYSX1RRxV1f1vA-1
X-Mimecast-MFC-AGG-ID: ER6rcNVnPYSX1RRxV1f1vA_1752181897
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-236725af87fso22666675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181897; x=1752786697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+c4BMiRqhsfmVjVjooOln1HDcuyuqfAoeFZzGp3Oyg=;
        b=DBC1SwoHMvQdIM/ici0398qn9KxC+iwn21H5gBPlhLNUqwdL38kngBff0J0vKfBOxF
         axypMQN+IRmyozTRiTxI12F9N+TAe2+oIBZJbklJeNo01UYKJ/hXpZJlmJ4ndfpx7/I2
         yAgV8sHKw3d0RPEjpjeyXHnBKLSl/0D7lNe30xP2dNcdDWqtEcT4/jySkSjGAomH+A8M
         a/WgrtuToiEC8alpt63sozUDfbiQYGY523mLhdcs55u/xEZ73GDGmCtWmdh2ruMl2FdV
         4gnLFGveF3r74wLzSb34b2aqxeEyYSTPsgVcbWTK6poYjtkGG0CTahFaKHw4+VYtgbsf
         EIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnrVXJZBFj88PdtBLsj4T0p4v+NB1svdAaDBAAB1Y3tSCzqErS7imLnPSowrNzZlESSFMsgcRG9xLBWqdr2ZJn@lists.infradead.org
X-Gm-Message-State: AOJu0YzmGAyLRoGKy4C8JheT9eG8VDoY7ynGzuKloALitownhqMR32rf
	UAp0LPijayeqcwkwHugv3luCcyUjsnrb6pnULMPI9TRcNvM71UjMkS4lKr0y6mQsUMVlO05BrZr
	zttel6n1WHGiHEfy9QHj6E0qe0OnekINULuxLeV3NxftAN17gRc7zkzt7rdGcogtjFu/hBKHr1m
	kzhvtUVLosgdE=
X-Gm-Gg: ASbGncvhZswlT/1OV1tXk4jaffDgA30XxIAL4bo1s9hcAI1zqmFdOBp6bYA8GtBQOX7
	LwEgNuey5rCYP4ax8sItoDW6Yqt3XnczH9iwROEA9WtoV4l+t6cKagmmFtcomlCwq+XY7DfeNHh
	Sek7hgfttFXlaQCrFqeYCR1jDFWgfvFU/BpsyUZvp4HIMGrsVkvb0/OUsapfPcILKXmVPTBzvCj
	EPul2j2KrUlxxbROk/rs6TQGAGgl0vcjRbtPc++lsDfm5nIEKW9guD7IRKCKXlLlAJhYRgjGLff
	loOPOwRgJSBxBJ3UJrjTfUuTXc5+qAfRLlL8FiOGN+MmgA==
X-Received: by 2002:a17:902:d4c2:b0:235:f77b:4b0e with SMTP id d9443c01a7336-23dede8f48amr9643565ad.41.1752181896819;
        Thu, 10 Jul 2025 14:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPRMNzco5hMf5jOp7523hX2VWgJWkY++oDzSNhjm8eOYKWsovv/oV4s5Gbjr4r11917Kcp/w==
X-Received: by 2002:a17:902:d4c2:b0:235:f77b:4b0e with SMTP id d9443c01a7336-23dede8f48amr9643185ad.41.1752181896451;
        Thu, 10 Jul 2025 14:11:36 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:38 -0400
Subject: [PATCH 06/13] clk: imx: fracn-gppll: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-6-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=2079;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=VD/h4deqJxDRtMemjjzR/QMh0EFhcWSP+gpO2FdBBQk=;
 b=5Ui19/xk/tp/Ugea3+/nwqiHWYk2PsB/qQtwW1y5YoHaF9vuntCaSoAbXSlcQ1cptzIm0HmNV
 83NR/q7STAWB/g/gDErKl6FKo4XjXkfr7vonqPw2ysDmESMhgT4SSiT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EQ3Ot0g6wbH8PaO5RcSg24YNkFWH-OXKnjrfQSfOJw0_1752181897
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141141_812663_ABC76A9E 
X-CRM114-Status: GOOD (  15.77  )
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
 drivers/clk/imx/clk-fracn-gppll.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 85771afd4698ae6a0d8a7e82193301e187049255..090d608672508a8819dc68eedec5b8d4a2c140c8 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -134,8 +134,8 @@ imx_get_pll_settings(struct clk_fracn_gppll *pll, unsigned long rate)
 	return NULL;
 }
 
-static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int clk_fracn_gppll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
 	const struct imx_fracn_gppll_rate_table *rate_table = pll->rate_table;
@@ -143,11 +143,16 @@ static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++)
-		if (rate >= rate_table[i].rate)
-			return rate_table[i].rate;
+		if (req->rate >= rate_table[i].rate) {
+			req->rate = rate_table[i].rate;
+
+			return 0;
+		}
 
 	/* return minimum supported value */
-	return rate_table[pll->rate_count - 1].rate;
+	req->rate = rate_table[pll->rate_count - 1].rate;
+
+	return 0;
 }
 
 static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
@@ -345,7 +350,7 @@ static const struct clk_ops clk_fracn_gppll_ops = {
 	.unprepare	= clk_fracn_gppll_unprepare,
 	.is_prepared	= clk_fracn_gppll_is_prepared,
 	.recalc_rate	= clk_fracn_gppll_recalc_rate,
-	.round_rate	= clk_fracn_gppll_round_rate,
+	.determine_rate = clk_fracn_gppll_determine_rate,
 	.set_rate	= clk_fracn_gppll_set_rate,
 };
 

-- 
2.50.0


