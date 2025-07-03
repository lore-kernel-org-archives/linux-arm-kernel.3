Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC70C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhDtC2utRaPlDpGhYs17r5vvsrnmu45x3ymT5BDVHJI=; b=u+rFMHAwkRo4634QncNwuEINoD
	aosK0MdyRMBrkv7vnpmH7pIxcna+AmsF+FMVYa43dDa8QZnxT9y6kiijWTG1CvagdORUkjxKehIvD
	MwwNJT1KByfH/RnujxxSxF5N0Ybta1BTnkL0cl6McxujpY8dZ3BEee83poMHvowTowAiYfGVAFTw1
	DRQEAZmCWsAt/anuHUdfJv9v2bBzgQSiHAIn6CNklW23e/W8iza/RNHPyPVDsNXLdJvei06XDkWVO
	mF2sUwtret5tQ0FSE+gVI5HR65WAtNelx++XX7tNNdlWJLZTXM+7mZ5R3pPyzwmgb2kgqoWvZjxm6
	CmWyE44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTfW-0000000CslH-3cZ4;
	Thu, 03 Jul 2025 23:48:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIS-0000000Cp1J-2Zk3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhDtC2utRaPlDpGhYs17r5vvsrnmu45x3ymT5BDVHJI=;
	b=bwrsESZNsqabMKTnj/3QEXWuXwuoHZZRl0kaAYvt89YrpKBYePk/on2X3/zAZRFg2mtzBj
	zlLYQnCA/G/aiSJK+N0l7vWaR49mYsG5a/fR1bmgcdP2Xy0U0b5xxs3NgE122w0nM+BNKu
	Y2ISqCwnbIhD/sXtu9LD8pq0umFSjfg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-9ikgPi2mN3eOtDqRLiNRQw-1; Thu, 03 Jul 2025 19:23:23 -0400
X-MC-Unique: 9ikgPi2mN3eOtDqRLiNRQw-1
X-Mimecast-MFC-AGG-ID: 9ikgPi2mN3eOtDqRLiNRQw_1751585003
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facf4cf5e1so4274426d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585002; x=1752189802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhDtC2utRaPlDpGhYs17r5vvsrnmu45x3ymT5BDVHJI=;
        b=oTI3Nd36Jv99B6bMIwqKQojGH+3rahAxLrzq5l8b++ralw2HIMnan0ZOUJpZhMk9iY
         uaIH++djQhBWUlVIj/6rPETmJSd0QPajJ7TeyRuQg2FjMR4EbgkRUp7L7MAPe4p3fBqY
         rGIx9SUNhI5VHlatucDTrlKkeKZ8bz/1KHxSZ6eWl2vRueV/ocmdVRAaFfNUh00Xs68e
         /yhtRu+7WqB6JKegnaWAVfuNrP8a65AYWznv7fhRL4nO8NO/Dj/TbqPGMK2ApwJ9rFXo
         kIBZu7CcV3baeiK91F6O+DTG3CoeOfQuNEonRZiuSGjUOIwIjH5JiRV/dMlVB6RSnSny
         KEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+5Z3clZOwtftOwCg1nQnG2h5TcA5YdEjsDnc5Xgel8MiP+70A0TLuv7TXQ58ZAsElSJVdAGTRVfljNoeuXyPy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdbajio8Km74PeQNsk68pwJZbJfiF/eYAc9zrzN2/4deqKfAOY
	evWDeyod86e9lEb5m8J0wKBg/rbtVMdsiLYgNvCbCOdCCom0/BkPTFy1w3Prz+fmo/Lk55ZU362
	7yEYr/PbWAmePBqhHWlzKp9cHNsUdkRnRcpCSZ+/i908EaqvThSBSE0i4dpxxo9t49sC1Z299Ns
	+qITm6WWm3LXh/A0OpCUebDbPEriJG+1Io5mM2lZYNHTeTPrTjRGx1P8r8xao=
X-Gm-Gg: ASbGncsaXYWdYK6XnJWNO6fpoBhRPw/Xyn36jHoceQUFwEL0lkTGl1R0/H8b51q7MvE
	54/J0Bk8Jp6gtnPxBUZ/u3/+Exn8yGxAcAG7mV4iyAi+7vv9djkinVwlBS5Ybmo/UXRLrHBYkXL
	YDhPN2fTsd35XnbYhfIYv/u3O52ZgGHUAZXXcXQXgAWXfQWP6ZhPuuM2fu4L9Doozytst4xyZ1m
	hSo5jkjxsVP6lqiATIHSu1VKB2mFfq7Ydp6c71sEg0cuAb3nlAJiFDl4g1ay5JLnquGsN641iyl
	qbD/ps0zyI92r99eOqNK3ROtxcqKG9bVSe+mchc3tpapyFNwDh/K1l9BxTudRQ==
X-Received: by 2002:a05:6214:5191:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c6d46e71mr3912856d6.10.1751585002204;
        Thu, 03 Jul 2025 16:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz3rcs3pEbfi+i10yC2fv924P24DnAprgiwcA1Xos8lcGEnsQWq4OIG7/Hd2meAunlCE03sA==
X-Received: by 2002:a05:6214:5191:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c6d46e71mr3912326d6.10.1751585001708;
        Thu, 03 Jul 2025 16:23:21 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:31 -0400
Subject: [PATCH 07/10] clk: sunxi-ng: ccu_gate: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-7-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1958;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=yI2SIQSpfv11yROCqsNTigI0LZL/+DeyReURO7gHFTk=;
 b=FBh/28zlwskIaAbPO2b+tu7E0IGz0egaTdlYzpasdj3/eWmqI5c+jiwwjhb0UWS08yNR6Uiei
 jR4ac0pocwYBwf2SDC9OhHItWpS1RcSUFKjbL5CgqDeWzQZ8d1jP7ws
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xo5fuBEeQ6vw9d_Bg1YpHW8tVFyajvAoVrjVnT-JGmQ_1751585003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162452_734070_E7AF686A 
X-CRM114-Status: GOOD (  14.19  )
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
 drivers/clk/sunxi-ng/ccu_gate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index 474a9e8831f87ffcec7712c14ecb55b8523f05a6..30673fe4e3c2cd2c86f94a21929b144ba4cf01fe 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -91,8 +91,8 @@ static unsigned long ccu_gate_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_gate_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int ccu_gate_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct ccu_gate *cg = hw_to_ccu_gate(hw);
 	int div = 1;
@@ -101,14 +101,16 @@ static long ccu_gate_round_rate(struct clk_hw *hw, unsigned long rate,
 		div = cg->common.prediv;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		unsigned long best_parent = rate;
+		unsigned long best_parent = req->rate;
 
 		if (cg->common.features & CCU_FEATURE_ALL_PREDIV)
 			best_parent *= div;
-		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+		req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int ccu_gate_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -127,7 +129,7 @@ const struct clk_ops ccu_gate_ops = {
 	.disable	= ccu_gate_disable,
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
-	.round_rate	= ccu_gate_round_rate,
+	.determine_rate = ccu_gate_determine_rate,
 	.set_rate	= ccu_gate_set_rate,
 	.recalc_rate	= ccu_gate_recalc_rate,
 };

-- 
2.50.0


