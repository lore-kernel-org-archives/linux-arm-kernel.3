Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D691C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMHMdgb5Ozof1oVF3d9/wmVqM+1K8QcysVII+1gO/dg=; b=xl3C5Pg8wxM8kmLRv5pj97T8X0
	qBc3eaOmk4TwUKvPU2a3NERmVjNr5LF3haZ2djiIuirVvIqi895uehGEh/HiP8lnErVN0S455fOmZ
	WXEaQ25ELlZXl/Jt6zaCZlfwo6C79NXSQZF+qtu9WdH6i5iWdDOjBRwQPO840G4frBBcYJBPHWhnU
	AuY9lX2xW3Lbv4yBG3IHk1ohTquffjzulDK47gaaCpFUMixOQ9WBYvl7Zs1M7+uNFyAOwfxzOBORs
	/FrA6AOuhJzSw6y/YkEoamCNQLXz72Kp8qCJpoZxZn/8hF0+YazXoJkBLUaDe1l+8OhzgabtHVyX/
	AmcBmmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Pz-0000000DPum-3hK4;
	Fri, 11 Jul 2025 01:19:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyY6-0000000D2EE-3ybf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMHMdgb5Ozof1oVF3d9/wmVqM+1K8QcysVII+1gO/dg=;
	b=MrkyeE1mK5l3arpR/iuDYR2KHMZa2lonV2q9/dsSP5XGq2wrjVAkJAzq6svazQLS02pFLE
	33mYQajQOg+6ABKVjv8/FP8jCNdcQVsgS+ktN14rXh7aFazI3r7Tdm7i8G+a3SA0cJ95BJ
	VumRkbWp/UczRhCtMruBq/DgcRZAjaY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-YszlxdF2PWmem-XC72jeFw-1; Thu, 10 Jul 2025 17:11:20 -0400
X-MC-Unique: YszlxdF2PWmem-XC72jeFw-1
X-Mimecast-MFC-AGG-ID: YszlxdF2PWmem-XC72jeFw_1752181880
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2382607509fso8087945ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181880; x=1752786680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMHMdgb5Ozof1oVF3d9/wmVqM+1K8QcysVII+1gO/dg=;
        b=qfNsDzFSPWiSr/KQc+02vw6ckG6pR4T14kf4KVQa6AQURdhXvMqaExwkVhKLuDeV4L
         +H8BvVyWk7xlYlEsUDQRSU3zVDvASFj8u1Ae6C5Swym5lA+R/Bkc1s0rF5aS4KF3Bs2q
         fqCZmHWKFYNFCi08Yqh8mXMcNiM0NwV6baWtemci4t9h2HufNJUDfKFUo0chSbV1lIm3
         JYLp16QgF6CBP0f8m+nwaUBcasRGf8xbcPSyUc7ZghSYxiz7zP+EhnVVolFfaSvwAh+i
         70/5jBBLIfz6vLT5SW7mHfGSkIBvQ5pRiN2yOh/KX0E1UgUPuyasrjALADbqmfxVDSu8
         UTZw==
X-Forwarded-Encrypted: i=1; AJvYcCXur20f09p/TuQB6eJUiY/1kaLNhwZ9liBv8+AbIPA0KBo6/8DTRkpeklnSQeoywqLTBCfrII7rmqtYzxlgrpmQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxtSKJzLaV+f80Z8WTeN2I76RFDd6tgHc4lIZJH6dgmiefbcQF/
	Wc7XmcAYdl7eN3Bf6UCWG5zWKRytGrDdMeFkB2lfrANHhzVcag6beaXpRVBG24+cIrX91q8mssJ
	MgASYdu4PmYjYvQKVj7dbDttCO8rxPfrjaHyK7Ll/Ssy2IvNj9rgTJeG0adeeJ008Y8TXK/pbYf
	tY
X-Gm-Gg: ASbGncu4HY0l7bpL9x+KJx0twbDOKDwDsdZt8TZcqDAvs7Pu7pC6csv25yP0PvUArN6
	f2FBiuidncFBVGXWKNMU8FRI0k1ay5BxRd0VWP7KjXGzjivcQ/5NY48/T4taw6B2gBvskz+Qrji
	SxaLOxEFTdFeunjFcxTRPbIj71i+m6NN7D/h3HabX3PwXwyJW2tqixrb5D0l6jpU4+GWD/gsyS9
	O/DkLyO9lHugMMopyX/YJ2fzyh45wkLIIoavl6nPv5pPFDAuOaJACmPc+ITVnYRQUzPNxLGeOrG
	OrqR4pJhV0CQFBuCMNpowOiyVEb1sZqtX5icRYFzwZFIhA==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr7262185ad.15.1752181879787;
        Thu, 10 Jul 2025 14:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHNiFYs8CFWRvSPbrkmIE4I8ntC8YkoPHeEDzjwj0c3EHunXltU+7bpHWVRTS4Tk67n9W2tA==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr7261905ad.15.1752181879329;
        Thu, 10 Jul 2025 14:11:19 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:34 -0400
Subject: [PATCH 02/13] clk: imx: composite-93: remove round_rate() in favor
 of determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-2-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1593;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=W9rMxhG+HCQaTapcDP0EemGdUyiHL/4QZlLhjcozpqg=;
 b=p2JvBhXGzB9Q3sTJCTzm0qM4XowHtLIbgUuGE85J8qpMRH1G/aHuClA7A/B83bKS/w2DVERZJ
 SrV4qAgn3aMDET2A7EtLIFuerX32CaXdZX7mJGyO9y00Vbcn4xmkqzv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tOB8B7j6tiwYhFbhxWnJOC531VsZs93GXoTMkJTplYA_1752181880
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141123_058918_D1FDDE93 
X-CRM114-Status: GOOD (  10.90  )
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

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-composite-93.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index 6c6c5a30f3282d4d128751147714bf24b64c52f3..513d74a39d3bd391c61db2e9a5b7752af611d3b0 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -98,12 +98,6 @@ imx93_clk_composite_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long
-imx93_clk_composite_divider_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
-{
-	return clk_divider_ops.round_rate(hw, rate, prate);
-}
-
 static int
 imx93_clk_composite_divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
@@ -141,7 +135,6 @@ static int imx93_clk_composite_divider_set_rate(struct clk_hw *hw, unsigned long
 
 static const struct clk_ops imx93_clk_composite_divider_ops = {
 	.recalc_rate = imx93_clk_composite_divider_recalc_rate,
-	.round_rate = imx93_clk_composite_divider_round_rate,
 	.determine_rate = imx93_clk_composite_divider_determine_rate,
 	.set_rate = imx93_clk_composite_divider_set_rate,
 };

-- 
2.50.0


