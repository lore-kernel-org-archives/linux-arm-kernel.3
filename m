Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068D0C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 00:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=; b=zFQnc27ma5eUKzKEWCHMI5JY8u
	02EkoGY1qLHAFr5OqABsh7L6uzNtOeSG7rSGE1ftNcbBqguu+jhDG6/+4zp2kzTAoR7jf/AwuM2yr
	pu7exIJwUnOdKWQX5JMmxbY/+coPv42/RDzIw3kwSGBbpsTXufoNqw5U8J63NDhFYFcNTFfJfrpnJ
	fKKgWulHDhUc1f1nEImjIUBJ+jitibsuG4frJ7fABuuL+VnCq+GFIri9lbb+esXXIfzmXSEm9y8bZ
	P0aq5xPKpsfu36TwpYbPI6FPLY6+KMJwJd0Yg7yNM69lHEl6sGnOxQGAbU5YX22oPwJn2lXu8M2Ht
	7QyoF8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTyC-0000000CuMA-19lq;
	Fri, 04 Jul 2025 00:08:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIE-0000000Covf-2t1v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
	b=XTAJ3T5xfDYm6oJHTRY3ejnbhWDly9r5fb2RFtKBkjGg5OpWihmBQUlcYgUfQvHk70nKmJ
	oPr3H/3D2EkjhIzIHIvntbljYbYCVGZgSGDZ07KnU3y+/rCIjuowvIeoNXkiWp4q0h224w
	dHBXrO4H1yNOoJeEagdqoyz1jxnu6MQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-qLoMMlpJPJaBYL020MgVsQ-1; Thu, 03 Jul 2025 19:23:07 -0400
X-MC-Unique: qLoMMlpJPJaBYL020MgVsQ-1
X-Mimecast-MFC-AGG-ID: qLoMMlpJPJaBYL020MgVsQ_1751584987
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ff810877aaso9770836d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584986; x=1752189786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
        b=rAwVNKv4OYnDnStBIDHmfFr6rVP53PiE07lKmRh2CTq78KzggVpz51Z/H0XN9HmrJ4
         nWbI2rFk1bMIzl3oHO8fslxY3VQipO0DABX8R0w+8TjIueK+0TqF37MZh7rZYb6BTyJV
         Yjw00+D8h3goWRn909tqPBGRa5nXuPGPDANxuEEr4VSfM4/ChT5elOLYqotVFNalLnbh
         OJQAtmQtH7SptyX/SedSEgaQ14tDbk1QGTFfjlXFqeIH5te7k2UGEXddv6T+j71KK97q
         EIbCumOFIWDyYYX2YAQYtAmS2m7OW0LR9vJYb4vrBb1c+XmmzTCYkcZL6qivlHQJjB2q
         TZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLoVOk3ELZ3HVwfo+j9AooigrI/hI81vpx/ptQSrt/bQpT4Oko7sNP/BQnUS2AR4T8fhNu/wcsNNaRuRK933r8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7d2xSJb/Gxtf1l22r7WtlbsySlUd76afyxqsfnbIHTts/c8au
	EZ8tIy7pUe8QaL3+0NDHYUNzGW0PGKOJnh1T89Wbjve1GxE6MulPE/bB8k9IttvSDEYxpezOegR
	GWyK3PnJ7IEyxa/HAMV+JBpQP5m/MBFDDPeO5SWEaEcI++hvVO101CF6Oa/lzj3azpCcZMO2i3f
	OoqQwM11hrDEt5IOZ9kQ91quXVaDW9zDFW2NcGPQAdw7JgCZRItXZfIB1PK0M=
X-Gm-Gg: ASbGncsCi37nkEjeibPYMvY3+YaGBHQc9ivjANspcl+ICqX/zvCO2IhuvK4Da9waCwF
	2gPFLFdEVtzbnV8PbvDbs0xYccs+hch6xKsqEJHK1fd1ImujPDEm4luOkdIUC5qJdCPbtH1luUu
	Oq2ZFivp/p4ijhlyHbvqbcI0hYq7HENpZrKVGW5HRX/Bu+CxlG8t/POOUvx8vQ6DKNjyIs6Z/4N
	j/ranGOJCewCs/HY/6Mc92W/wtAXkmYzn5oaJOKoz8ZhNCCPprMm/WZh64Loy+Kdgf2NIZ2c6UP
	rN0ofD55Ar8ztUGpsmtKuY5NV3xBuZHcdT6rw4yZqNvdKYoDl6QDWYNxL5w2jg==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4001516d6.11.1751584986413;
        Thu, 03 Jul 2025 16:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXulxd6EhHQEWqdLCkq6bowgpk9H5xc/2E0qAWrXV2cw9IMvYCQaGyeK1vlKk4+HCoD7JcAA==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4000676d6.11.1751584985738;
        Thu, 03 Jul 2025 16:23:05 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:26 -0400
Subject: [PATCH 02/10] clk: qcom: gcc-ipq4019: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1744;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1SBXkivgAIQT/xpKmW16GCKl6DQTPvDdkzKcxCMxAeE=;
 b=F0GhFYifg67W61nanNKHwHfKd+yXvRKHNLyjxttEwNvS+4WIggMD8oWPnfPgFZE6hEmZ1fiIO
 n/Dix9ZjUe/BuSWXFyFuVK1zEaIQUGKOyn0QrOGVaTFUnEWIHOKyt1n
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SEqHZreJgtuxKra7BzxKP0cRFhG9Oasz8lB2Vyj2vTI_1751584987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162438_795089_F5D392C4 
X-CRM114-Status: GOOD (  14.57  )
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
 drivers/clk/qcom/gcc-ipq4019.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index d38628b5226898b6a556a1fe16806cb79c4735da..5ac44cfb53ce023c0668afdcb67de636f3319197 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -125,21 +125,23 @@ static const struct clk_fepll_vco gcc_fepll_vco = {
  * It looks up the frequency table and returns the next higher frequency
  * supported in hardware.
  */
-static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *p_rate)
+static int clk_cpu_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	struct clk_hw *p_hw;
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq(pll->freq_tbl, req->rate);
 	if (!f)
 		return -EINVAL;
 
 	p_hw = clk_hw_get_parent_by_index(hw, f->src);
-	*p_rate = clk_hw_get_rate(p_hw);
+	req->best_parent_rate = clk_hw_get_rate(p_hw);
+
+	req->rate = f->freq;
 
-	return f->freq;
+	return 0;
 };
 
 /*
@@ -205,7 +207,7 @@ clk_cpu_div_recalc_rate(struct clk_hw *hw,
 };
 
 static const struct clk_ops clk_regmap_cpu_div_ops = {
-	.round_rate = clk_cpu_div_round_rate,
+	.determine_rate = clk_cpu_div_determine_rate,
 	.set_rate = clk_cpu_div_set_rate,
 	.recalc_rate = clk_cpu_div_recalc_rate,
 };

-- 
2.50.0


