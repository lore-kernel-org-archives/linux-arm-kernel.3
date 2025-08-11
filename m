Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CA8C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=; b=c4hefU+0VqJdmAoeqhHvx2/xwU
	W0wIpX+lkQRxY5VEm1H0jLZmhCVHr0h1NvtzmzbPdo10vEdXzgvV6O88NzxEyZ+Zl4XNoyC61R2/2
	ir54Qcj6Xc6mLMzZ8P0imjbDLhsO52hYsxowkzYKq5slO0dHADwoWn6q3N2blq+KkPuQPfGnMeHLT
	R2wC+2E0NXEFZls5YmRPjTV6XEcztlGv7M87KLP5bGoTVwPLIIuehg1KIb3Kfa7WvxskK9xGehHaN
	xmMem+ntJI9UPzHS9XbociU90CCmNw/BYShJlSBFr9MuyudHU4RbxKIk5IdAaEpgzLW1AWB1hJaf4
	hZjdURdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQZw-00000007Udf-0yTt;
	Mon, 11 Aug 2025 11:20:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQD2-00000007Qkv-0Ku1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
	b=ZmKz3ngKEg085dC3N9H8JghM1nP36OE5KfMbtmfqSgrdaaB5LpYJk5odYroEKPl3tQoNWc
	M9PeWGFglU7zJE6QqV/8rRo2jpsOHWxBPSLEIpStNCLAb6tu5U+b8Uja+ls4hzYjgDLHm6
	4H6nFHaVG0mJKNCaUFW6Z8niikKdrAw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-g3fzQoqQM1SZUsXl2vnmAg-1; Mon, 11 Aug 2025 06:56:52 -0400
X-MC-Unique: g3fzQoqQM1SZUsXl2vnmAg-1
X-Mimecast-MFC-AGG-ID: g3fzQoqQM1SZUsXl2vnmAg_1754909812
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e7ffe84278so885972785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909812; x=1755514612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
        b=FM/dK9SrHoAvwO+89LqF3XFu6ddA/vPxJ6of5C1pDLwrWLzg1anjpY7InprdXwcmTk
         wkubiqHmPG/HCJktg7mT5GO927RFi3y+PKTNbKjLy2bsaExxqsn2ivXSAgnXJMcU6O7X
         nrDao/PTXSU4ao6+4Exd5egSwYlUhnEkgGVl2Z1skuJkYZ4Cz99jLaGWmdjzODsLQQhz
         mjBI61dkaz8Qe2PjBR/Q28NQ+OjOz9yYUyP0W48vCW4rxQbemQBzdd4x1BpikZChRZv6
         lhpjSaZUJl/tKsh9yI2PYFHOVfqKbrNm1Ui0G8nLYdAHhN3HckA0P8ojGpnsKmeYkDPB
         ZpQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTUAsHdT+wwN5RbxU7CFyFVLHZ7CIQO76NcI/4aBtnHJLB7bJzIM3MQZVe5B0rtEJNDFl0/qD4bt/6FaAJtLz1@lists.infradead.org
X-Gm-Message-State: AOJu0YzlGd3wcklv8bgmfWiVitmKJK0VaASwSz/FNJphqry3YEJjuYuB
	L3DG95LZsGklUF7nidASGS3P43/24tZvZxRc/9ZI0SA/egAvQPSv+k8+RXJKIyA1LBT2X1LvbgM
	Hy79WO4JTKy4AMM6/R9+w0dqEi6aK88o6TkILJW5lLsMJFFFQKvveSUdV52RNG3lF04LAWR83+o
	2N
X-Gm-Gg: ASbGncsz2dK4msCSb/ZpBoNvilhkcpgt1YJSveHWmcdirLaKod+59s2QcKxFpCGWUCd
	2H82H9Yh8W6uoDylZptkk8Ot1tJweGvpS1JbWmO4UTFdvbRFB4/ZU51lCU2QsRarCA1abF/dnuC
	Pj13TsisrAqCwJ/ZditEEFhlUc/aFJ9meUJSeHSlX3pqiMOYuiOam575d/SGYuGQ12bH5CEuAjF
	kxd6jj5BTL4I04EbL0ZIp4yNkq8Ah9Oa1nEttVbMzpVTMP8Xqbv61BmkdTyhB/UcpXENQQngaEv
	8fRftGOKXa4sTC9Y9gsJF/37qZPU/JJ+qSDO/g/p5JnokhXn4zFUHdtjUo4d3juI6mpRuv7tPhQ
	mvfU=
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792739585a.33.1754909811725;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2Etk94d7jqWBuBTsPUBpC0ORVIn7oE21Xh8O9EOQgSk7vq5RIMLYWuxIl1Nwz+nt1Y38MA==
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792735585a.33.1754909811152;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:12 -0400
Subject: [PATCH v2 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-8-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1693;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
 b=D6lQv4uU9BbCtmlsDXvXPLa8dR0h0DlOWWckbVaEkFndxlEt+IyMNkfDuSVR8NgDYOThGx2MA
 72BwKh/6cLNDsrNiAlNie395a35C4+/kjwVpt/wftlDiaqzAFDkxkOV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lt9GhXnGik_kf5zUT2WiHRNVbLOaHAru6bzyJwWMWVc_1754909812
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_035656_194872_8DA59956 
X-CRM114-Status: GOOD (  14.21  )
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.1


