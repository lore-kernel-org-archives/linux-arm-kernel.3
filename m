Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93817CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uno9AFMoEyhj2DAPDWvWv4t+hFccS8StsfhUFSrHj9I=; b=4N6QwlXVnYU89/JJuvcXT1A45N
	qv6fEBpmd/tYU68sjHG7lbMHlLzaKHZAY9Umee7MHEP0TEIkUfR3X/oHaWiqitfP5pnL5z9WyN0yR
	G9oBj8/GX8s9Wc30C/VGgHg+a97Rg6MfKhaYrUZZWldvSVfnlImaXYJtE6ybxkntEsyi/vSRZ7lLV
	tvGrV/wNiDOtx9ILqZ+iVGfICoJ9YsMAnMzGpDMSUuEyO6qzApU1t/CyZdb40h2TbYMpnvKzvHq69
	IhaCLDHWEDG2JsZQzx6nN9xhc8V6YnPoETql9/7HHsFqb5nHAKk5Hsawsg7bZ30AyU0Gbrqk+RhsW
	nxTU3Idg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEvJ-000000068pg-0UUO;
	Sun, 10 Aug 2025 22:53:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEnt-0000000682X-1mOP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uno9AFMoEyhj2DAPDWvWv4t+hFccS8StsfhUFSrHj9I=;
	b=XNykATZWeVveCbDk4A9BSm+fddp/WGTlveiyEDOSKRIF0Sww9WBERNKRBV10+Se5wvCI+E
	ikbAqcgo+G7Xtk5x1Q+9yP0sl+YXwqAwwZbWvQMkTmWpB7ED3ll2deCyL1vIfvGokXLvQP
	n+D/YfgoL8edMpkjFVMwrKWyFsLEOVQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-3ZZEQ90vMXSf_ZPeufwjLQ-1; Sun, 10 Aug 2025 18:46:11 -0400
X-MC-Unique: 3ZZEQ90vMXSf_ZPeufwjLQ-1
X-Mimecast-MFC-AGG-ID: 3ZZEQ90vMXSf_ZPeufwjLQ_1754865970
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b08a2b3e83so117390411cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865970; x=1755470770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uno9AFMoEyhj2DAPDWvWv4t+hFccS8StsfhUFSrHj9I=;
        b=WAjQ0Z+hQtNQICFY59DpsomoDJzHruupfKKUPLvm398d7MT1V4QGFjOT91BfUPj8W/
         cRggaxsFhwavIzVeAfnoaLFZbsPJEklNx/c3pQmMzfJQ2jxjwK1u2kaTpeMqJMQqA6zc
         Ik7gRax8oCdHuK6fnsVY0kTR1AwiErSnEjrojLUJ51+q5Xa3vGmW0MOZfp2nnrVbHbLZ
         //ApJ3rp8UiXr+FEe5i5WG0ozymD9Gbbsts15THao1xna64oUiv//YodbwMDKeF7izAL
         uwQNCH6kWh4GHket9cbioHbYPWJHtW71nI2aBa3C/JnluBO4jb0uqHNf8c8C/iybVpkp
         k57Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCXZbVCtzBU9M/o7Ui38bv+dTpKnPxGpnpcivqwFbs3C7xSaJCtQ+TI+EIYKCW7WeX2wuyB+6rYL/QrDCUpZpB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5dPqf8d+WxiV38Pzwe4FppZ1VkRhCUMi3V49PwHC4vxlExkmf
	wPfFLzKJu9AhPV8Y4dFO2NfOhevup/OAHuoTIxmz921mG7nEMFxoHyncJZ3jzYhTnIz+Hn0Oy2Y
	rL2QWsA9wX9SFBhaFgsjEudHp0GjCq/NazUkCvU8h0Qffnaxz/ygMliumjniF8QsWIHa+84skJ/
	NU
X-Gm-Gg: ASbGncu5fAToYQENpAgY8yisdOoXJfFveq43SIvjzllyypz5pS32MsXnp5AhrA2dY1z
	r5bFwHmySDVe/Ya8z/hKCUwTY6MRUVOIjdsOKg9DH5IpbMSqRS5jsgFumm58uUYK+ZWlGu+g74k
	rsZQWbuN7YwAVSXBfSeuNBsxH1u2yidwRTseIofNoWBsWOjCGcEzefQHK2MWi8t/gcvyhUYLtdM
	xLAmFHrRz032p72J0iaiuFJdu9SbshJc6dzZbe/QUoTWKUyF671g6+oCEoyL0wvIANIoMWuM6X7
	iRdEBLX4fVcTC+Gm6a5y1yOf8TDS5EYHveXKf1h/mGlWrCoacV7rptccVH+fUf9iDWmbXtJmeT2
	u7Sygdg==
X-Received: by 2002:a05:622a:1304:b0:4b0:dedc:1176 with SMTP id d75a77b69052e-4b0dedc131cmr16273791cf.49.1754865970544;
        Sun, 10 Aug 2025 15:46:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjMTodXpCZJI+V6X66BJdKc/nrAgZZBHfrq0FWIY+BTXEFv3Zqfof1whkxmm2vRWEJM7gJDQ==
X-Received: by 2002:a05:622a:1304:b0:4b0:dedc:1176 with SMTP id d75a77b69052e-4b0dedc131cmr16273521cf.49.1754865970110;
        Sun, 10 Aug 2025 15:46:10 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:08 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:30 -0400
Subject: [PATCH v2 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1429;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=K/vzlwQbHrPXAsE0zMa+ZWELLEN88HFuPFzZqi1CGSY=;
 b=qwO8ilR67ycB5abLTz8lkcaaMraMyT4Kb+y602Glvxo2Z7+fRcKOb5tXSI4yVR6HcJvX+lHrH
 QHpiy2uGNJpBVV9WhaW5knt2IT2dHcrLcTidOIeNTq7nKUw5m+AZu3i
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4_BfXrqYAQiSr1vnhM9RFZg5UwyF5jhmorlIWXW6vYI_1754865970
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154613_539532_16C8DB53 
X-CRM114-Status: GOOD (  13.22  )
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.1


