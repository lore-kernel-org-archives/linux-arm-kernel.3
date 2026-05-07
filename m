Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7852DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 05:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VCzQfTRK49IWaZiPW/ydQ0Qt+IWS1LBpwzZsb8SJN0A=; b=Iy3ENdXkw3HAxoadmgJCt5rcTt
	Ju5h13HOA/OCKKq6qaYHHq/WdI1pAie/NNY4fSbJrUeHgbaxwMDQ8tyTvRBEdatjgLKU/wR6ta9cs
	cFLlKQOMOqqVDhrSq5gPo1F1VS/KiUQd+JTpDXoP6SbeqAe3X5a/OYUIwo88Icber/CUfLa+85V6o
	hSz3LgFuengH5OINMp8UuTUpzMW4TyrVg9uPwHc8IvrPt/LEGX0X7iTq8eHLACX82BGXG/WiLep1m
	LIJrujFPk5oP1bAxdvVtDq9g74DbNX4j5tdTpeB4rGg5HJofLbQkYOWhoqXwePIcRseqMP+aZUBQv
	ks9QnQJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKrJ4-00000002oBh-2ODP;
	Thu, 07 May 2026 05:29:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKrJ3-00000002oB8-1ws3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 05:29:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2adff872068so2296615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 22:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778131792; x=1778736592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCzQfTRK49IWaZiPW/ydQ0Qt+IWS1LBpwzZsb8SJN0A=;
        b=Q5GPwry65sgwlG666K2LkL+Eh3i50i6/hoQzlf1XzAkiH9fY06h8XRnU9nieusMkr7
         tL5UNKtIdAozL+uaSQAmjrWuiowmwgAUossS+GzlHHDCz+LDuUKCrBEJJtwxI2Zrv+Ug
         ernZp4eEwMhY9babNP6WetMQps1hpjc+p+khE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778131792; x=1778736592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCzQfTRK49IWaZiPW/ydQ0Qt+IWS1LBpwzZsb8SJN0A=;
        b=LVJXx5fTkWGhFuK9U8u7eqrErBNuDz6vQ3EC79z3SDCCWsgMiz1+BO1YqExMponhh2
         uYztOQCIgMhE8PTVm8/eBhlQNJ0XquerZ87fsjiqhvjHFlgkEb3fjIyPiAs790jptTOK
         y2u6umdDF1KVP5CAGQ9p8EDTEbGFLyudumpwM06LmCVFyruTcmDWPNpOEKX1G7FEtiGQ
         cTYs0FsRRfqXBUFbPQdVlmQg/hUeGPx8Z97sJMkl25dknOP7y3Vl6mGjzsX21v0Ht73F
         k/ZyqzQ42S+dIZwGNuX+vzvOT8v/14SX2D6lPOUA94wrVgR3zLfREyyQYKQ7r2s+B1Si
         Mraw==
X-Forwarded-Encrypted: i=1; AFNElJ9r3227m06vwlvIHFf5IKab2XGqCKzL2s67JATzCOvzX+62cN4nLfLJMIYRxO+Id/yqKqkBZgmCTCnsysSuS9Iq@lists.infradead.org
X-Gm-Message-State: AOJu0YwiDMB4jpY6r478DlHLah7Tim1UjdvJo9ZaXhzjYxaBLDnpdS9I
	s2oX08uUs3v5R71mgopc0xWiIOEz5yWPI3Vc9HKVzKDarG0ze2QbKn3O6cDaU0mlxw==
X-Gm-Gg: AeBDietb48uSK1MsZHXP3LkOkdeQT5ZygLEpdw8rWEOKFAlL5SrbFJWhZOUgiq3Z0eA
	RGwzXwfnqMG/aNiW20awYMYgu9fTAMyAPCNwdDCWKxujIvJKGWa2SkxuUBrZH4cT503pIwsvxgA
	QEJtJOIfX5tooQHVmmeQ3IQL+gnANsgzR8qld5jCspaZZwfz7g87DvIBAvc+hsj7XF+tmRwOtqA
	i/5K+f+uOAcP2F/yUdfbezMrvr6So/xyWOA/k5YGlyBUi6BHLyWUoluigV+zi/sXZuIP6Lc4eEx
	G3qdtxQhBBv780ztzHp+baNy9C2hqKQZjgibkP9ACOZ5evqvflhmMl4ZJYA+FPCOvWx8FZpI33P
	/NZOLHZow/8TbXckpFoff5Sb49J2H577sGHiAfzDvNzwyRaXuGmRgeBDwpAYFiKOxF99MTQOzL1
	ur6vgCjIpB7Tdfle3x+Ug1sgFtJ8mRfc2PLUvbvNu5inUramvOmcKKterAgLskFvM3ZDVM4B/0E
	SLAyE/Ue1FIBlOFuQ8=
X-Received: by 2002:a17:903:390f:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2ba79285966mr62622245ad.5.1778131791791;
        Wed, 06 May 2026 22:29:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3117:fcaa:4a23:3480])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaac34dbsm11126885ad.10.2026.05.06.22.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:29:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] power: sequencing: print power sequencing device parent in debugfs
Date: Thu,  7 May 2026 13:29:41 +0800
Message-ID: <20260507052943.3133349-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_222953_646523_2A98A130 
X-CRM114-Status: GOOD (  13.69  )
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

The debugfs summary currently shows the power sequencing device's name.
This is not really helpful since the device name is always "pwrseq.N".

Also print the parent device's name. This would likely be the device
node name from the device tree, something like "nvme-connector". This
would make it much easier for the developer to associate the summary
with a certain device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 4dff71be11b6..14335c4f813e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -1043,7 +1043,7 @@ static int pwrseq_debugfs_seq_show(struct seq_file *seq, void *data)
 	struct pwrseq_target *target;
 	struct pwrseq_unit *unit;
 
-	seq_printf(seq, "%s:\n", dev_name(dev));
+	seq_printf(seq, "%s (%s):\n", dev_name(dev), dev_name(dev->parent));
 
 	seq_puts(seq, "  targets:\n");
 	list_for_each_entry(target, &pwrseq->targets, list)
-- 
2.54.0.545.g6539524ca2-goog


