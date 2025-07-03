Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BE7C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=; b=JUzm8xLU7HzGUkOCKR9k0LNTZY
	rte2fy9jkg/zeGhN+NbYh0zFm/CIG1IGtUQnd8IIvgGh9tD47fwqf6rzFNMQ8I68A28uNT2b+HwKH
	Y4pLRIfpsuEBSQLelDNeR7bhpcjq9DZ0t+jUL+5BXhx3jMWykUazVZQ/rw7c5ns10wSkb9G8ZF1AL
	wnaNqRM1zZ62gA9jjuGpbLIUL6z264WsOwloeDgA3oW4tRN6Nj1+7UpTBDtk0jEoZlq2i+/pDjeIa
	sBm+vE5khQxcO95ZdoRLWB+8OlkjYwaRVT8ZbQmvksL+DMo30N3HCCnfVpqs5Xz3cRQyfvn6SjTZX
	J4rfoO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTaq-0000000CsGK-2IQa;
	Thu, 03 Jul 2025 23:43:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIG-0000000Coxk-2eJF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
	b=HPhAfDT4yIl0jHt7iW2VYPzYDHxlAFGlFIvZVM6mBDheLU6zh4J27FMlkADxb92q7R8fIl
	nMWnxEn39L7nM9qSiDKE464I/Mlerm+eurvP/egktN9+mVTMjYiIB5gs55uLjVmZJ3oS35
	2dc/JIE8QdP6pBG1RPZS5lGONw/K5GA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-cr7xAWd5NLOleX-_1Xx4KQ-1; Thu, 03 Jul 2025 19:23:14 -0400
X-MC-Unique: cr7xAWd5NLOleX-_1Xx4KQ-1
X-Mimecast-MFC-AGG-ID: cr7xAWd5NLOleX-_1Xx4KQ_1751584994
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabd295d12so6052426d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584993; x=1752189793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
        b=ha0GSH7W4JbEK8pGWM1ZsWwE6vkoiOTkLtLjDXKD98AMkVaEHXvdAruzyjuKeCl83x
         BW0L6+6Y88O2if9hDqpfUh+ogrH2i+UbsAhDhPnIC3BGLSfctoycgvp9kmT3bFY3khye
         45Qu/O5aEPYYPfTae23vMaljTR1fUnqeSNi86HvbecbFuxkzrftDilUWNIuwAROV0BYJ
         RKotzIDDnMMlQvqd+M43JqWLaz+De1G0Qp+/tvo9UtDkCi1Y6e4xWrWmm4kqUNeN83ws
         MYVEL2J9amHbUiCyan/wd5BnxoaFC4rHre9xLzYEna/ltcI1YX45x8t5kHG79XUgOuQA
         sSWw==
X-Forwarded-Encrypted: i=1; AJvYcCWpT+B99lIw4adfVTXYFiPgzqNxoEWoI/RHZMa2VDsLhSPGMklZ5oHGht3oPEgjCaxkPXZqjnGHURsAxaU4zcE1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh7aN745u4MzlWi3D/c4hCFnBQg9ujnn2oNH5S1EnVtgNTWESs
	36hXEH1pQrMBCmZRSfv3fIyJe7x65u/wpGYfBpMubOtH5IQd2gxwIF20SZ17wzkkEEYoJ0AS81q
	tmKqwxpv3bbYfkz6DKexy3zG5MynKMA6pp4KkeSpoJLzXT4JDQz8O/QM5aSuXcyQbC7PHqSpTkF
	o66fNgSbuMrLtOoFS0DwNIrdDLp4q6nqlEL16Udnm2HJ4UQ+Tbr20x4jTifdw=
X-Gm-Gg: ASbGnctyDVHIHpKYi1BgGGM8U2P5cUam4+nwLmhFbP9eJLh66+wtwVROyvMIAkjWjxZ
	1yuAMz3zPpzFXOKsk+eQjAXMsSias0jr/pBWQQkopNzBzvbI6rdI0Jj8ZK2L/Aeg5zoQp6yWdm+
	z9akJjhQnAAWd+zrPkid2hsm6c0df1Vls8XBqdk0CaDkD00dEIDyFlvRxcsFbrQZIWZAwMW+ac1
	vFEzYxlNpqtO/CZ4F7pr8p1HCojCR1ZrQdYX5FvQyPUCjnRR4RxLD+2Dl6STlsnamTKuurRDbJb
	ZfLDprNbzabkldyhhtOBcFXTymDm/5wQjToyZVORvnzBIRS/et6gVBtNsHFnYw==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496546d6.44.1751584992940;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI3ipPg2Jg+5GD7hTnCiXfrGoYgoIQ3H/qFVOQMX3H3uHxeS2iTGlz+BWau3PM9f3haP1PQA==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496116d6.44.1751584992485;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:28 -0400
Subject: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1326;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
 b=zf4/vhBsMxt+TAFqD7aUPTk19Bt+lcfBLX/WML5Wb9wvluceirqF+3xXA/SRJdeeVovfmzXVw
 wjKAv88CuWoAzAa7aZ5FVjlB+6EYYOYea3w9xYISlQIYpuJFVJ7J6Lu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ksi6X3yTQY5J_TOT84twoKQP_m5RGFz1vHgWBbP7cK4_1751584994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162440_734766_2EC0AED5 
X-CRM114-Status: GOOD (  13.81  )
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
 drivers/clk/qcom/clk-rpmh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..74b052ac1ee10bdeeb59880019fb06ad58db3f74 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -321,10 +321,10 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_rpmh_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_rpmh_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
@@ -339,7 +339,7 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.round_rate	= clk_rpmh_round_rate,
+	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.50.0


