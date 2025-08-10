Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48881CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 23:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LIwrTzSIdW4XyPecxETwMmYAEX2pSsme7PIKfMfdJI=; b=AQ/Em3jPSdSYuTIM79KgyACyCe
	MtJpix6wXoZsmU5Yxh9wHWVQhKJW40vGto81onGMMW3V1qo0HCuFrQLLVKtywjm6uH93CwjDQGLdL
	FttgUEK+RnV649smYsd7V4vmB1Av/3tfenyGceT7du0oexQ871kqc9YXlGv/hIlvHhDblYYg9QPAb
	tDU28/JSXzsyvgdfkl4ixrOLY2ADoR62pwwSd/u/KK+WmOR0/2CK22zC6Bre3VPZzTX2SK6xVinVy
	JuBzepSHeti03obKD2WkOrCR042DCc1wftqqUv4rCdB0ZmiSU2rKIWPKDw1cu6t12eF9t2hQIER1f
	eO4DOa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulFDF-00000006Ajl-3Fak;
	Sun, 10 Aug 2025 23:12:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEow-000000068KJ-1L5i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9LIwrTzSIdW4XyPecxETwMmYAEX2pSsme7PIKfMfdJI=;
	b=H8XaObNzLP9X5K4QD06GcVuh+F7hbSYj8iJ4aqbA+cL32M7W0p3AxajbgFEkbQL8LAma/Y
	xkbGPBzMlvj5JmL9mXJ1Nx+D2mehSEvfxeT7GbM4Xc4ty+LfStkZhZFd4XIcP72+Az9BeE
	ZZlPSKbZbcgHjzVSc4dzNP8Rwil2ygo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-z3Ve51qTOJ6Jfsf_rQXrCw-1; Sun, 10 Aug 2025 18:47:16 -0400
X-MC-Unique: z3Ve51qTOJ6Jfsf_rQXrCw-1
X-Mimecast-MFC-AGG-ID: z3Ve51qTOJ6Jfsf_rQXrCw_1754866036
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af14c04e5fso149118781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866035; x=1755470835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LIwrTzSIdW4XyPecxETwMmYAEX2pSsme7PIKfMfdJI=;
        b=hhREBUnGJdsEVPnZCRzZIajKn/fBfkwEOTdokz37HU1GM4k7uIPz0euDyo62/pJSF2
         wptu8NVEnfxscGiE+Y43cIcMBaRtG54UuO/h5Z8WvLkzEdZdw0IOM5wGUcHZeSscxsbn
         xqUMeeGAiqNDk27LcgbEOAC50jzhRjTmmwHSRdaBA8bGCU20o73MAIggxN796lLORwBM
         0Az/4ngaJ2U7hpuoKbCQ1Qb2MnDvg1zolbIyX1tQ7i0V+DTsDhX4jGeFSivWl37v5y8x
         3+Gq+nRdP0QaZXdhLJ6vPN1iSeM9tiLsj+yueoNaFU/GdH8r+wPAwUt8w2LCV53LCOD0
         /5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm16Hnw5bH+ev3rP/PSXGPvaz86Hns+OinZddRxvZ1dDbhBtXMuDneDHG1L/RDWxDR9iPWyTirE6MlcEUwidqP@lists.infradead.org
X-Gm-Message-State: AOJu0YwBlcmJJRx+mimizqsW8c8yof1aH8UyvEALshc1EG6SPR9NdfVO
	ZHJltofCimJ8DaWYniY40jAYEWoEV8J6mZA5MseRid7gkMhZuO5hq3SeiXLLhZcUkyMTjxqeXSC
	0TOw1PDnUQ1Bn+yWweBugFI1J6KBGO8fX+WU+l98v2UHSN5tcnqsh32qKWcaBFPp5/vUhb/KDLv
	jFp3t/C+/l
X-Gm-Gg: ASbGnctMLwO09XXez3BhargWNVZGihMnKzpZD1ImVOkuOhhwlpCr+/0/Ph3Y61DcTYt
	sDkaqPGjPSFPSbPVEPJSoQjf7cj2VklgdTKye9MLt1pGSOodCiV9iU1yn0FW0u24aEOfzEuCCtm
	kzPwFUln94IELlU6wJNCMSER3Kyz7RyEm+CxknQITyWwmiCoetAWnBgxZtxmnbdTa9UvVLpTUVB
	U4qA25z1bmkOHZdT2Z0NOUzn8whFa3trVxGOvfzeo8VqxmnsrUaTEe0ao8WfKxtpN2a/P6jG7Kf
	/7eqZpyJdgfkuSV0h1UaU783YfPQJEpw7eQhxiJ9mrZ1ye6mZAdb8OlBVFZ3hq2jOJs5A7Ug3JK
	J+z5/cQ==
X-Received: by 2002:a05:622a:400c:b0:4ae:cc29:829e with SMTP id d75a77b69052e-4b0aed983f4mr137421421cf.59.1754866035173;
        Sun, 10 Aug 2025 15:47:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI4R4FgcBh6uwgYNS05a9B+ckO+bJARHrSqSCTHnGOa6vmcxR/BVXe8/wOen8M9+MhpG9xPw==
X-Received: by 2002:a05:622a:400c:b0:4ae:cc29:829e with SMTP id d75a77b69052e-4b0aed983f4mr137421231cf.59.1754866034829;
        Sun, 10 Aug 2025 15:47:14 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:47:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:37 -0400
Subject: [PATCH v2 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-9-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865941; l=1629;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=PfVBnMEhY+1VXjQch+u5PcV+HyG2IR2115kG2w+VUSA=;
 b=sL0ngpJvf7ih79HfcU+J6TF8fc534hLr/WKGFEbE4MP2Jf9cX1ovwrN2LEAg3nNaEFb5Q2o2o
 4np7Je1hPi0C73RtTCBtGYON4LSvFYcTDMVZedGa2hpQZpsBbEsg5Fg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IqCUi0FAcwUmWpYSAoLNxJnGEY4B6uEUYLW0JXTe8U4_1754866036
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154718_424130_CF2BC59B 
X-CRM114-Status: GOOD (  12.63  )
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
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index ab2a4f2c0a5bf3aa4b77045f4da8b0ddcc079f7a..12dafb2bd49bc33c13dd49246bc26df082e3dd40 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.50.1


