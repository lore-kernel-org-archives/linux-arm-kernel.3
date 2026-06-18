Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE227CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 04:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mf3jJNGCHMNwyX+15Gf3qCeUSoD/AqOS50pGRceH38o=; b=FGR0Ds3GFUR2sydB/92IifSr/E
	udbZIxZ1CEBxR0eqE+Hy//HwI3hkdA9C4zjS2badkNsVVNmt9kUtjhG8G316nLCEGCjdORusV2jGd
	g8949aXFx2Nnp+7phQ1exEUrlANcyG1mj/3h2GGky8TK/kCxzRLvkizC9vZnYyKOgkzBGzxmkrqKK
	uj6zCyxtyWob7xcQJKsKwZY0B6ABNKRaqoMc8RsSs+mP0ao1y1DKFNN/6i6vsuXJXcnRQEfsH4UR6
	m0BIpa57VWYqs8lTP/QBtMhp/yTARPxzTZAI3tf5U/juj77pHYzf587/nORs9cXBtleWFG8NjJnUY
	Fjmgcd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa43w-00000000bDK-2uET;
	Thu, 18 Jun 2026 04:09:08 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa43u-00000000bCa-1Dee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 04:09:07 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8422871b42dso269282b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 21:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781755745; x=1782360545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mf3jJNGCHMNwyX+15Gf3qCeUSoD/AqOS50pGRceH38o=;
        b=mz420ZTSMzMcSYAhtEmiD4sEAEgXnUp8WDJLC+5SmUmZ+p1ayPCx8KXcBWztnqwyWQ
         jUVizBMJtlFCDTi3G0rg0pKd4pVSoRTGVCpJpM81+SRkAeIELEDhjidh11zyhn9l4DBY
         2FRvazgSolnEcWy5eHBNoxhlYD1IOder+7lX07CJx0+AFdRHnZcTzpj8ONy3ozHB/Z+Z
         9xzQTkKz9M2RpiKbadMNWcaBTqzqKXbww9siIHkMOk6FrtMgXnVg/+aPvCrD4Bshj83l
         28jYdg3sOBYPLcD+3QVr095q7H7L8OM5oHdM7WD9uSxZCB0QbMo7SoZzbN8WA5yaYFD+
         Ovrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781755745; x=1782360545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf3jJNGCHMNwyX+15Gf3qCeUSoD/AqOS50pGRceH38o=;
        b=rZcOqPL6F1BDuz7G8xIj3zTpiguCvE5Fil6cSV7ve2tfZH2R08RU7BuEwTZ+6ZDXvr
         oY+59CmWspg1sKWFFdXuvA3jC79t5SqVLZcnlkabFTOV8aUroE4v93y2WUhUXa/cgIkH
         tOBiZf0Y7A5AIPD5K4ORrHaNW7Gsw3mM+li47vPLgLBP76Lsj79HetnU2spPtFu0qd7X
         QTCCEALpHpB8SZ6m1in8yRzrzTgY8BxV8fZXCU253jKgXHA+iM/ZgXc9+85Qcv0YrDp9
         fKLK7B9jhqom2c+e2IgDE+dPUIa3S7KnYtx1Sg5ExmcJ2oEF3v3bXj/yHNGgiRzclHu1
         MMvA==
X-Forwarded-Encrypted: i=1; AFNElJ89NR9PgZN+ND315tgBCsVhHG7XD+7u64UM4j/1pSfGZCoT3J2VO7rwS8/BctIFzagw9qrYAEof9mAEfJhKHACO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq0Bq4TeaOFTOBm0Y4P9rEgEPvIAJ53006X+W0WaUppa/xXkYm
	FL2A633wRbUbGzKU9PIR6PVgIYnifrqvHb3kpqd2vSsFjCKjWamlRtPzhjVyLt6Xyeo=
X-Gm-Gg: Acq92OF5G190bNADyEhkRZyrfilKy2CF2XwJoMa7fGcIdf6GYQXUAH4oQyRmGEyo1vc
	eBWiKzQWbVz6Ory3z2wJfIuec5yFZNGWEFy4BcKuhALvMvUSaXHefbcQHOV78FOnDkTdVaQZXYX
	2Q4ZQY4wWnIZo9Q37ofHaMFFHNPC8Lk+1AM4aUSUogdFcC9vNaj8bxkv7IbONOcCDWeqyLdH0h0
	D9doNRa6kB1+ZcX1O4oa1eKC4p/MSJjqMRNYdT609XGxmTm30dQf/Q18022maWwXzt/RRNrPjCr
	tE3ByMEtT2MmYM/fMtLiRjD1548hN8YNRMx6KHtNmUPhLn5dMONpjtwQVSxa4o/EGK+qn6eP8jR
	SWsnaXsBH3kyfC+TV3eq2h58PsD6h3JXId8zF/JH7Kvn+2xdHmVSikucPTqVsFTJhCv3rEdHaJg
	9C/EgSR1piC2mkgVNRr9jRZr3RCXTALWrR
X-Received: by 2002:a05:6a00:228f:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-8452446d90amr7256898b3a.14.1781755745338;
        Wed, 17 Jun 2026 21:09:05 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:c19d:3f9a:e9ce:93d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc9fa8sm18077491b3a.32.2026.06.17.21.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:09:05 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] nvmem: rockchip-otp: skip zero-byte reads
Date: Thu, 18 Jun 2026 12:08:59 +0800
Message-ID: <20260618040859.407326-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_210906_330067_967A9D9D 
X-CRM114-Status: GOOD (  11.54  )
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

nvmem_device_read() does not reject a zero-byte read before calling the
provider reg_read callback. rockchip_otp_read() then enables clocks and
dispatches to the SoC-specific callback.

Return 0 from rockchip_otp_read() before enabling clocks when bytes is
zero. This avoids hardware access for empty reads and prevents zero
counts from reaching the internal reg_read callbacks.

Fixes: 8ab099fafbbc ("nvmem: rockchip-otp: Add support for RK3588")
Suggested-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
v2:
- Handle empty reads in rockchip_otp_read() instead of initializing ret in
  rk3588_otp_read().

 drivers/nvmem/rockchip-otp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 0ec78b5e19e7d..95685a9fcc77b 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -272,6 +272,9 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	if (!otp->data || !otp->data->reg_read)
 		return -EINVAL;
 
+	if (!bytes)
+		return 0;
+
 	ret = clk_bulk_prepare_enable(otp->data->num_clks, otp->clks);
 	if (ret < 0) {
 		dev_err(otp->dev, "failed to prepare/enable clks\n");
-- 
2.51.0

