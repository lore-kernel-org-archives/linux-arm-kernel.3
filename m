Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A27EC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=; b=UvZTedxbDyjJIOx0VduUlJRTon
	KU3d9z9tBg0BUKGaqV35pzbJLVjwIcWDwvfrEy5EAEGz1PAdLGApvv/hOZuORdq4NF00ezYppZjSw
	/2WMK5CFzahl3LCTSC3UD36yYAjriZJfeukRgqYhnxhTJjJCaHGkaKvg2AuO+/BfQ21BrzqeQLyKY
	PY6jEeMnPbI5gsVYzuIZzMor1QgYVZdtY0pyiqNPBypGzE3ZpOEA8HDWlFgguh4g6mRX62pFZInXF
	QHLYzWALdiqsYwrmwvCVBKKJ/SJAotLufMMvR5hA5DIkwJFX/VNrgBHXfOWX/AqUONH4scdBLBJFD
	+MxLHJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRm-0000000EuiX-0J0G;
	Thu, 23 Jul 2026 18:47:06 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRg-0000000Eufp-3rtf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:47:02 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso968321a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 11:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832420; x=1785437220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=;
        b=FeFwSTDN91Eb9hcU7ZFGxv9xGxf+1EGeMJ3QQwdQ4pHTXkOn4TacMS3+FHUI3nys7e
         wcF5wgXhGyIDbdfPCXGiir6fNVmuA2gUdrzCfYwVNUtzQqR/+cv149YxncuIJ1tEAmwl
         3aV95EjDGakdde5mB3BSxg/64P5h0jTjc442SJhHrKpm/oG0SYUWyf5VpTCI99UdeEOH
         682ZyNCggC4UJdhRhsX9on/Sny4NWwZjGBzTCDy0HMEiaDcZ4F+DPPM12w0aOtJ9hK0k
         sQAMHl0VyIWZmZNWz2x/yS+9+IeAsUB0rNiw21TprbuhqUSBXFHwOGOYJ6zl6VHeU5Rw
         vUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832420; x=1785437220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNEry2bLNg81OguQ9I1ru3wEUBWoj/YG1funVUmQkdk=;
        b=dSkZhz25SyyghbbeSqgd+RXf5XeA2blIvSm/QDT2ELs0F/i/KRfh7ixd02mLEe+b9C
         e2oZ9fK7b7PRivjZT4iIPbrXrNguVbDxzKdcbPIhtv5WUYJuUPkZyh9VtSdfMvbHJ7Es
         CiSGmkJ7eGVd0t9jMAKm5Wj6agokesyOBFxOvRhzpAaDTayf8m67ZGtsSckvZcx7tH4G
         LYayJlRzk7xgK3EOJsuV/mmUBsOYO+uRyTPc8PtVTyNvdrThlwhNbUi5V/h6FH9c94UZ
         OK6rrn38Fos7o1fAV5atEip97vtVdGpTkE4Y88oYN4H2tASMscdtwigjNZNzUn9IVR7Q
         1rFA==
X-Forwarded-Encrypted: i=1; AHgh+Rqjyj6eTbUJ7d7/pQNkfBwgrfwPpGgKdj64nRrKsNCeSt3dE688MseZAq1Ad8dn/k0UqpQmSkR7aCEP4cSAT9TV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28X9HSTmekDd46iKYnDpCdHFCB0WafWhpPyI6ivGx5VAE8fHg
	7EUUpgsJ6bYjQkEdg5KC278YKHjIJhJs9QYfQCmwdCaiGefQTJgfd96s
X-Gm-Gg: AR+sD12WIZgPneelEnbgfZMphsFNNBMBEcXAVyd2ih0nYu17ffvtdFhLsI+1caVRmEy
	AmUDziEU1NrL2h8rjQhfqSdkKaoDBM07jylgcXK0ImRpwU0661WzhHLV2FwfwwO1Q3QIMuOtLnp
	zjhQdRZkiBvlZ6w6tM0NLZKTFb8hXfrX9O/SmHnhiVa9+sJHInrhtt8O88oC97Udnp1XzhATUHC
	G7yvDTWTrwJ8+fnLdyo41O0vhIZ6TR+MbVWB3ZQbsiQ8GaWYrGMWY8irZqL2xboHzrlVIuYiRPH
	iZy6gObDwKqxbBx/wZBZvO3hKn1Z46XC4ad+W/HPPU6eaNQpzNfxKq2VH2nJTvnFYqANGyQzju7
	aLy+NoGbSkj8yldLwfqmHBoseBuObVqqDmeNBy6RHPReJRinmrobBsVL3J3bgLy5rK4k8ekQG
X-Received: by 2002:a17:90b:53c4:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38ec657558amr4646237a91.10.1784832420077;
        Thu, 23 Jul 2026 11:47:00 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:59 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: cocci@inria.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 24/36] pinctrl: mediatek: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:26 +0900
Message-ID: <20260723184538.3888637-25-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_114700_963732_FBAB6C38 
X-CRM114-Status: GOOD (  12.04  )
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

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..a8ab982d8f21 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1242,11 +1242,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 	if (err)
 		return err;
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_E1, e1);
-	if (err)
-		return err;
-
-	return err;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_E1, e1);
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
 
-- 
2.43.0


