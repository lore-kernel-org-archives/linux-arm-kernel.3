Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A097DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=; b=UvUcSHzBee5LE7evCjmmbQX6Tw
	/Puir96ByG+mtabFB8c+deYJ3LUUWc4jnOLvmHKMfCHud+S4qg4JSj73z50UK0jyZiu04ewJcySpc
	i5VOlWuq23F1RDaCI3WpCKJPJIKapCbwV4JgF8rLX+ZLNf5Xmg3/+eduLmK2/HpYrF/XTKS82j9zO
	uqYeoxPzlYaK/oybemrXMqO675QKgTGmwvsyuxdE10XywIaZTa6c/PVF1tArNtmA3pzRvkwYvz45C
	vCaBsnvhKdcoWmJEHGPO1kC4Ukga5cefHJ1fUmKKwc6AYpB0LkN7RRxvFkjsS6tDHxm5ZP+kePMTV
	WpHKFXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXThr-0000000Ct0s-09YR;
	Thu, 03 Jul 2025 23:51:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTIV-0000000Cp2S-3JIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
	b=VUPcQOokLljttZmha0kcWaZVwE02ceCCF559LTIu/AugB6r4Io7sYVS/zKFIlTfjU0N9YX
	Mzcz/9W50oh5TPQIZ9Rrng3os6LOu6oj2L2eoSsEBcxWN6hVWqW83c1BLtkylpg9SwORtb
	A2ytfi+uDgBm6e0EEFnxR5pO+Nd/+7w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-EmclgJd5Nwm1Jhef0WNV7g-1; Thu, 03 Jul 2025 19:23:26 -0400
X-MC-Unique: EmclgJd5Nwm1Jhef0WNV7g-1
X-Mimecast-MFC-AGG-ID: EmclgJd5Nwm1Jhef0WNV7g_1751585006
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fd3aeb2825so11882106d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585005; x=1752189805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
        b=i167NbvW4zRG8qlAdvlG8FyOUYujx/kNhxkjtLI2QdegiPpKqGqyqyLhlT+xYxkDbt
         4vIcDBw50jYkSF6CSVHkTqbas2kZnzN6VRPnwVEA9TSbhIwQI4HG98sBOe1Et89CWvP5
         kZ9QZKFzgmCBK4DQ/RGnrFu1Ozqx0NfAGbamx62aYw9pp0xFXQYHC6GKTSr9Ug/jbjOn
         aDGB1s7Kc7ekqfqea0g5p5P3giB9ROyxTAhjb9VFd1JzrrmB+zEizMI0A98dW8nYB6Iv
         fIcRcdbnLcQkudMiMyRRPZoJccssUUl2KlmqI3yFI5ZrVq0T0w0Cs/bwFYe5xfBMBCnf
         kBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmRmC8vzyQ/HQyrK///htA4HE41jGlFwfLkX+2VNGXBH6LXOcNeiECDKCeBCl9pHpCp8Sr/PHbr8dsNXKuGvyq@lists.infradead.org
X-Gm-Message-State: AOJu0YyBzSQvI1lAdbmUksdMYjBAdc0+LLjnLW0+i7xHckHsLPUar8PY
	U10NTTp+r70SNtuVB+J8F1M6Kxywie9m377+v4Q6BhiArjMhhVeIJG4p4rQKOyOCQX2L70TGIqH
	GwAfBEpx+0jcVhJoOCTjva4EfpHXbnI6XS3KiTPn3c4Nn3wf/CknLEd6O0h33iEPRGgAvqomd5j
	zmcFZBeHWb4PNnA9CYZPSYeXiefORGYkz124cPMbnYzGo+XlqKmyDNbTkC6GI=
X-Gm-Gg: ASbGncvJAHW+zQtzKTZBqyr7w7lybckZnU62hWi5kUwA+yeNTeYljxWKtPgYrgRS+b3
	nyEnXE4tLkh3n6uIoCDbEmCaq391KN0wfQiZQvsIbFNAB5X8Hkyt8+nBUwMOQooCOK2pXKYWq/d
	ikpf6uOSLo8pvbhx/v72mlPmidqbHoxYcTJRkfC+VS/FwcbCGYlFkGdzGERimJlgfv+ef0YO4N6
	Q6UwABrwOXQEBt+RBfY3Kj3pabUidVpVDU1uubBTX+Lovl+EMuc19maZ7OHGhr2tL35q/OcCHGV
	R+VIU5baBtiIiJUS6pZhM3hGQV4ZLG7q1O0yrZCacga+S7ZRrs0RWKckLdDV4g==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312886d6.30.1751585004861;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZUTcv/RXxDRv5oOXWGYLGuMzoJgJUUqtfCFBZdCd61PSDSlgd+Ecfdnm9HkmgohROAdoaIQ==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312506d6.30.1751585004446;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:32 -0400
Subject: [PATCH 08/10] clk: sunxi-ng: ccu_nk: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1938;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=btToz2S3ADP3ZxZpciNSy/MUe5vuMQa0nAdFifjfxYg=;
 b=d2ZMlN6C58BBAH6QeN6ACobOCoE2MjYgmAG9txbKa5xDhf1dkWNsPCaDoFCNoKlsbitIMf4tY
 rlssfLZk/Y8AJ4/97xBA/IKkdc92QGnzsPYwRqblNmN4ZVeb/pGltBT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N8m5SOVDbMscBWPGRGSLUft0wyPhi6WLN7xrC8xJwF4_1751585006
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162455_890727_6C310C60 
X-CRM114-Status: GOOD (  12.97  )
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
 drivers/clk/sunxi-ng/ccu_nk.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index 555e99de2cc6ee0c84ccaaac9ee83be2d88741a0..5db748fbb5bd9399a2d551c8821a4bb17ded005a 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -92,26 +92,26 @@ static unsigned long ccu_nk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nk_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nk_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct ccu_nk *nk = hw_to_ccu_nk(hw);
 	struct _ccu_nk _nk;
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nk->fixed_post_div;
+		req->rate *= nk->fixed_post_div;
 
 	_nk.min_n = nk->n.min ?: 1;
 	_nk.max_n = nk->n.max ?: 1 << nk->n.width;
 	_nk.min_k = nk->k.min ?: 1;
 	_nk.max_k = nk->k.max ?: 1 << nk->k.width;
 
-	rate = ccu_nk_find_best(*parent_rate, rate, &_nk);
+	req->rate = ccu_nk_find_best(req->best_parent_rate, req->rate, &_nk);
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate = rate / nk->fixed_post_div;
+		req->rate = req->rate / nk->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +155,7 @@ const struct clk_ops ccu_nk_ops = {
 	.is_enabled	= ccu_nk_is_enabled,
 
 	.recalc_rate	= ccu_nk_recalc_rate,
-	.round_rate	= ccu_nk_round_rate,
+	.determine_rate = ccu_nk_determine_rate,
 	.set_rate	= ccu_nk_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nk_ops, "SUNXI_CCU");

-- 
2.50.0


