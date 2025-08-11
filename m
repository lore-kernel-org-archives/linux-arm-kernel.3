Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA834C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2v4P79PdNIaS18Wb0ZUemgbjQrcADYOCCdsS00/Mio0=; b=AJa4ccLjBxZL+Gxcu7fNIjeR8D
	dlMFfoMMo44sAvdTuQuOkWHPLYxrD1DOHYhN2+rySZ6e94x7s/snkODK553kXknZthcigR+fpQYHO
	yHOkr0BQGedFEhyISt140162AiCRHVBCnQIqis+ozXscOp9vSxe2qxPnHoMXkusZy2+FRUGrPuY0W
	nURZymB581vU3pqSQ6NSwGFCWLYIYSCoXZBHYtXY9+e1KxElsb511YK1mJWglpXwhIAC4Q3UyFBHI
	4bfFHmC10SAIFf2JUxz4VvvLgX05hueYS/l8kZ2Ydx2rVZ22hYb9TuZYBddmnJlVWil2j4ZJynRyL
	NJmC/10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQPa-00000007SqM-47Gl;
	Mon, 11 Aug 2025 11:09:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQCn-00000007QeY-1TIA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v4P79PdNIaS18Wb0ZUemgbjQrcADYOCCdsS00/Mio0=;
	b=RE9dbemVTecLIMxvYbG/9k6zYHAa5I3iPvs36YZpyr4pppl8fBfgX5GV1yJ2JDka9GBPS2
	kGWXnxvSuVLyYCySsoGCP0OHz6EfafRiyuOxsRpyRpi42/23DjElav6djwyeleVzxD7zq8
	5vnHFi8OV4AEBbwmt5Q7i44gPE2md8M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462--BAbOFMvPHCevZgQA2W86A-1; Mon, 11 Aug 2025 06:56:39 -0400
X-MC-Unique: -BAbOFMvPHCevZgQA2W86A-1
X-Mimecast-MFC-AGG-ID: -BAbOFMvPHCevZgQA2W86A_1754909799
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b068c25f04so102892631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909799; x=1755514599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v4P79PdNIaS18Wb0ZUemgbjQrcADYOCCdsS00/Mio0=;
        b=K3U2mGK5YJpRMJcGYN7fTDZHTR00McJ6jGl5tIhtDMj/svekMrsfQhTJuzXGsRROwt
         i2paQUfpqTCNk5PmS3jV8Qn7ZuUDC5TEqXI7EhBQYz0k8X7/oiXoFHBMlMbxeR1ybeHN
         Yhcgj5Y3x/4TlRtGwySRgxQCWxJ7Pl/YHDfs26lk3EUI/a5optEovw0mdw6yrYj/wdPl
         dhBLCfJ3WyM71NoV2/GAKQcZUbwb/5CG/2prVnF9rC1HoZwPaMtOi7uJ4wQDOHdh49mI
         Ahlv/4AS15PWCooMVWgq8LHdynDGXZb95OIbQRMyppCl1eMTHPAAVf3VZk+BqOvPXOv/
         aZIg==
X-Forwarded-Encrypted: i=1; AJvYcCWq8tSYxg/268Rf75cTrUtqyalL6xz3G61tGWN9sSEXqgcftZUkJmYI6/iaUvgyk+vjVIfddJ1krVRTJ0LoJcNE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1CyD/XrPm5WojLpixHnMT/BA8bdNFIl03XNYxCwZpLmAk52Of
	4u/2Hd/9YW+DtfpIh24KF3p8uoCn2ZGSLDZvLY7Y9euyoiRSwEx57uoqEto4vvSb2gPWzngdjTz
	3v/7F+o/bmh8C2a0oRXtNgY0SzK+RhCt2ErSm+el4Jxv3NAQt82j9J/zozRLkFxdSGk21sJT92c
	tc
X-Gm-Gg: ASbGncs/+xkWp+vMqJtOXP8nYLrWbH+06nSJKiiEbkDvE9UPv21/3S71OrpV9D6x/5q
	mYvJpsZ0Fu36Ti10MXkj1LY++x4s8nyIsVDYDB4rARccynAW38CpECAXMegoRvlYwfTf1czxt82
	QZ14QuxjLlmXqLEyKVSVctwqOBKc7ZOWjmDm8358MR1Nrcqa4Zd+mpyo8J3NBNQLXZ+9I6DpZyn
	RdhUYO1wkC9xU+TAUsL8cQyz3qPoGOOxpMNzgSosqHVUxtcEQko+dihZ9VPazE5s1d1M3e0oupN
	dusINTh50w0angj9NFXBPrVPeF3jvZ2MEp298tKu+GoB9v9Ex/DONsCoV5smpzgair0iG0ltV65
	WsJk=
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr247966681cf.3.1754909798783;
        Mon, 11 Aug 2025 03:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETXQEWlFC7Wcyu/io2faEikISODgBHD0p2mDq0e7vALuwZuamzM4hp/NBzXMpTjJQ+LZFp/g==
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr247966191cf.3.1754909798373;
        Mon, 11 Aug 2025 03:56:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:08 -0400
Subject: [PATCH v2 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-4-4a91ccf239cf@redhat.com>
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
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1657;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=W4oHtDUPRGuCLmVSKKz7teYp4yrHno03QAMcLtqmgJ4=;
 b=zHi78rLvdAYaZdTIMhwgqH/js0hiXWDnYr4X0BvUbuN6hprJjEDc2ZwgX+szZViPz4W8X1kk2
 ngDBdMEkWVsAVo6sQ7hWvsQkjGQtaqeiQEeV2wywPAakq8QLF6bboSJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4gr7gYtRKw30pwTqkXv-Z6Q2vfb6ZkU8cscSc4wkdHI_1754909799
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_035641_465799_38AE8642 
X-CRM114-Status: GOOD (  14.35  )
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..6ba6bbdb7e05304f0a4be269384b7b9a5d6c668a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -373,12 +373,14 @@ static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
 	return pll->pixclk;
 }
 
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int hdmi_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
 
-	return pll_rate->rate;
+	return 0;
 }
 
 static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -402,7 +404,7 @@ static const struct clk_ops hdmi_pll_ops = {
 	.enable = hdmi_pll_enable,
 	.disable = hdmi_pll_disable,
 	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
+	.determine_rate = hdmi_pll_determine_rate,
 	.set_rate = hdmi_pll_set_rate,
 };
 

-- 
2.50.1


