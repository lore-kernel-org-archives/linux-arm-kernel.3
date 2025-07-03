Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4EDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=; b=YEFBFNjcI2DMylxkoa5WCqzIuc
	UiGH/At2rcdPOfWKSNSLMj4ydka8TX0UN1IL1pg23uHr7qvKwW9f5X2wVwGzrFiH1XuDN8HCQFqmg
	m75FWfJMNFMpwjLFHtUMQfWH92vSfCjutpZA5anF7dvIbhDdMAbIyrDAbnHU9KrH0pyJbLaAIGbly
	T6n5dv/Rgk4L+7+TabcNTeqdvNVmydLmigeQHh6X0DLUwCrK2OHkP/hjQ5m5oN9aZQ7XHGTpegkmC
	9I/A8TupTLO35fRxrq4QMB0XwiA7a6qLSKEmJFE7GcGYoX9B1c1+Z6EdhK/xz5HlwHEtdGGX0pswL
	sW4j0W9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTop-0000000CtmQ-1o3z;
	Thu, 03 Jul 2025 23:58:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTMG-0000000CpVz-0QpP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
	b=ZvDEgH1AJXNB0RjcOPIzRPliz23RtfrO82QnAmpO9Blggrd8vDiuz9rSN4tauukeyoy86N
	6+SGVI/Jz72O297XbFdN9/QBnR4eZWWLPCUl48aQ0ID5gFTaGUIYO5vDxajJko8R4CGrPm
	ZKrIYJdl8L4t7QrMTz1VjKRVR6yiaas=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-ICT80IfVPnOPYJP2WiU7JA-1; Thu, 03 Jul 2025 19:23:17 -0400
X-MC-Unique: ICT80IfVPnOPYJP2WiU7JA-1
X-Mimecast-MFC-AGG-ID: ICT80IfVPnOPYJP2WiU7JA_1751584996
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabb9286f9so6594866d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584996; x=1752189796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
        b=f41ppvzhsvI2Q+Iquj3wVHcCkvA86xBCXJu01Gnc+mqznbfaiqylTEY+kL1mBvdJrL
         +n7m09VNqWeaNmUfFAk24Icnmn9QQdw4e2Wf4pG6gLpl/H6BrZNlBYqPbUOhPS7F//Y7
         fiVzopDqfReTxllQIVTsL94rYA2B6IHF6wT6H2foVG7sy/APq3viHvYC0uzCJZmAijW1
         fcUBDSM+r3hkqN1YjT7x0l+2OhSvukyMtFRbhwp27mxVsgkfWvXDHXAXZHEDJwJ2Sxsy
         UyReDH0y5D35X4pwXWxcqBDR4O6zkxBj8ffP+VpgoHNngFsKLRzAPMhhYJlO15M7dzrs
         z/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7a4+oTX1BLhRXL3ssK+bhDoA4DhD2oztaIZ+ZDNVwU7eM+7ML+cS9I7mbJJ7deOS34RYJAWZlP+bnSCeN9gXi@lists.infradead.org
X-Gm-Message-State: AOJu0YzFLG4KzYl7wB0G3tJb6Y8UzhEhxFhb8hqvhC+PLFUvULsc5+gG
	7e0aP/vhQl5RtGhHjZIRLPXZCfYAqLnr0nj5Yrr7wruIg5t5zcfDo0kdCSH8CFK5I8TtAVN6Pc7
	0X0Ls2okP13b4f0FcGu7X5lQCRrImaPzZCDEK0rzLR/t5loQkKrZXFUIZGv1a2WwbkiJDfbOgJD
	SLxJrNYnctH9ndV+xNpILCZGeLI8cMD1G3/mUGUuDebjE+kNSoaCKvCUjGtyE=
X-Gm-Gg: ASbGncvR0O3HriNe3WZrv3RAYvLQ1tm7cqJK5Vh/TSFwnjJ71yYCQGNBARJsVGZyQ73
	9xKSfxmJCy8Ad8SFgwrE6pIWD0Bsi3K00gQEbOFbTqZCp5drg4NqK8AWaM81P829wNqhPHiMdte
	VnZX572H8SByrZ9af0mtok30rAIfFrzPb6r7GJaATAatAcH4Cu31Vyn335Kexiw6hHC6QboQFti
	yD1eKwT9zDkSz5pSE3BOAzAPTGUIlrHaByEU15jbNZc53MRITH/MEP3j/dyxJa9pgnzwIBGLp2Y
	zSj2iHLUbnX5EkyR4VEQBlrTWTtlkTBHKU4m/3EVOrsYn4nMCrDf4vr5cFYQtA==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3133356d6.18.1751584995776;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYU49F29nXLLJhUF6aQEdxZXPH42Yhu1DTnmyZaul5HXNd1rIQI+KPYemKNRW8NflwAqOr4g==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3132936d6.18.1751584995402;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:29 -0400
Subject: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jJkTWWJF3/5RXKxSt11n2asRYUE42Jhyt7x72H7Kcqg=;
 b=WVf99xpXURqHDMOlRG1isIsZmcxQ2hVzruPLXEZLBIO4b3rIoDFPUB+65Us88g7XSb6xd555r
 vRtnzyNPfgpB/pkwsRXhEbFCMwp6sgfC61aI01PDavIaz23Jb23DZ8c
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O6g92FDeSVR6P8wN_1M7yfarugGOraIJdORZUv1NQi8_1751584996
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162848_209420_8922D0D9 
X-CRM114-Status: GOOD (  14.66  )
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
 drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3fbaa646286f284da12b902873b079863a2c0d77..3bf6df3884a542e7be572f2319990c2bfa7bc642 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -370,15 +370,15 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
@@ -427,7 +427,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.round_rate	= clk_smd_rpm_round_rate,
+	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.50.0


