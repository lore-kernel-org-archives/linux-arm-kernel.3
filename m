Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB5AC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=; b=g8l+ZOsYrdF6GmWBc93tZm7Nbo
	enVRFIffYsj4TjlzDzQAT7yF2lby781yo/yUatiuekt81dpvSVcIO6QpVd8x4s36CfAff10eFTZ/i
	1Iy6J0Q/IMANtxIvTNfj2hDhS3Ic5DyYEIx81TGq2O6IJ3Xdh2jtTvy3wbblTMuwALz0PbXJIaU+H
	PULC4n0wG4tJYmfDO9ngeDd1VsKJnr9SQ+QXtYgESFEWdG1izlJuC4qn0HU4qD7pXhWTV/1++iWKr
	eWvPZ4/J8d01HaIZiSxDiePfrevNryAPe7U4moBzEThblL4CrQotsi6UV6XQpDIZIdRIyRPrbOEmT
	RUNs1RGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQSA-00000007T2F-3EOL;
	Mon, 11 Aug 2025 11:12:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQCq-00000007Qh1-2xCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
	b=M50D6U3VZliH6yNLTkh1JDR2fkGhSYetpLpYy1CHXkf5Symtj/vS+cdrJISrVHalx+KkQi
	z8Xvk5hlxdUtjvmGQmt2LdEJ5n5Q5Cm9MYRF3DYRl5Z2/hA35LLQsRk32O40IPgy/DMpvK
	BQTq3aKKn1mEHqismY7BiNkexV4gMiY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-qJN8I836McClWpsXzFlqCw-1; Mon, 11 Aug 2025 06:56:42 -0400
X-MC-Unique: qJN8I836McClWpsXzFlqCw-1
X-Mimecast-MFC-AGG-ID: qJN8I836McClWpsXzFlqCw_1754909802
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e8106a41e7so1030845185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909802; x=1755514602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
        b=ljb2XrLGqBMBxR1bsgZ6Wv/K2xQSzOMnbOmpvkKby1IHi1HibaxxaAYoyH/srlM248
         jvNTN+ABo0+t1rSpNBIjq9DxR5IsXWS2vxY5mvhQImp+X2uygUPK2wm7ydFqlFohr8Is
         DjV2P4+Z9+HP8ad/gyN3irRpCwa/lTI+ldf6+yGzOkx1lM8+qlt/ivbeyCajd+bjlUvD
         ni4CnwuBlP+2Y10pgZvNcfWQzNA3YwO48wI2UQBN9xp4bAKhnP47PEmPFj00bjTCPAug
         v52yTrhBrq8QyEfnQXynoQNRDErNVNo+rB5Q1Wr7YJzTI+e5vYLnIaVr1UT36AluyHWR
         4tKw==
X-Forwarded-Encrypted: i=1; AJvYcCVVb7dp8Nki3kd0GKI0LdxDpSheLSrbcLqchmprQ5NkSCQy74ojGx2jBba/ADI9EotO5+Gcldc+LGu4zhJpHM5N@lists.infradead.org
X-Gm-Message-State: AOJu0YzxVwQK4E7u17+Dn6Zxucwyoti/gxA9pUJx8/0lZ3OvnXuSelpR
	jSLnqDPWn3NJdMLajbVquKsadNXBHaZeUNEIemjtSIvorpl2pCFLRedw4U8mUTluNNCogmzG924
	gfpousDE61BgdD6WmW/l/wJHQhG3w/I3zrWEixfv4h3+2xwJ6UKDHP8eJKE54ASfL/N4wlJ5OFp
	Hk
X-Gm-Gg: ASbGncuY8xeS4JJ970Mljlu2vVf3+/8FfnMwNsn2XXyY+T4lRLY8bMuliKSH6JBg09Q
	v2sL5hHwTnn7PH9HVUpuT/XStNxy6CoYncqS/rnuyEFvBYvwD8leV+7Ft1Yg0gbDdwuhHAjRZfX
	lagbnlJlZT+1aQJNNcW/0cqTDCWup6u945dTcPsZxJEf7HgOYvIpSyw7GyWU0XwvXMI/js4gYQJ
	SSPlO8W4uTibMOSMhFmMRLBs3lMTVGVyKkKHwU2bJO44GaaZu/9/muXP2ChP9OvxP9W9qBR5Kc4
	hUP8HNXegBue/WkVQdNiNLaXe9DL3o1Yf0vPXA7JkRGX4tFrhYUP8GkoRbS7bC/1ZtHOb9hnRVJ
	UZ9E=
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id af79cd13be357-7e82c6834edmr1680335985a.25.1754909802027;
        Mon, 11 Aug 2025 03:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4J1YPALYk3sfXKt4CIgszP9xA12/nZjPecmiJUzpdOL3Mq3At3CKB2rvFttPLfHNTO7lJg==
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id af79cd13be357-7e82c6834edmr1680329285a.25.1754909801517;
        Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:09 -0400
Subject: [PATCH v2 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-5-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1718;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zjPZ3dnO6gZ6FQi2ZfbbqSAvbJwyf4CBg6JGhX8DcxM=;
 b=NJqHQ2ssaD4y0rqVbCbujpIrqzdN3VuMWj9ghDV3lWlNDbiI/oggFqGjuVCZHps19PnD896Q0
 9FdZ8qhj9mUBZ/GerZTn1O4AjtYG03lLvn79VW/TKhLY3AumrqAiB+P
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: azWAUQBvUAU2pNSuBgMukDexQUZmRfPgU5GyMK_lOhw_1754909802
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_035644_826995_03131349 
X-CRM114-Status: GOOD (  14.96  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.1


