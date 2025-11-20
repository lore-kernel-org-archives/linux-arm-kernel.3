Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D1CF887B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=; b=tXefUI6qLia1MsEOdd6PftEznt
	9g4lmc7J9YFfFJQnlvPW8rEiFk+LhWjwfFWSJmmKfx8YJlJRQ9Z77nskcbcVuuCLa3Uyo+XPJwhBr
	XW710Kl37lQPK5shkfxuQmBOm38FRUSs/BwA+5OnwZCEkGPozNol8mHtnEBxWwCnxkE9YAAeyMC9a
	w/uDQQdoUsZpZYlGmVWKYi02p3huvw2+kQ/j+R1RdGyVKaf4W0MIcg7UyRvGghGDZRw/b8p+DzPng
	MZm/3kpZGNW/4qZuRpFuW9xh21n4rNupE7kqX9FEVWVfTKAv8lRmkdjM4vcv3ww1t/5Qm8XE4UedV
	NUzKH1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7IC-00000006z6z-0D6z;
	Thu, 20 Nov 2025 16:13:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7I8-00000006z5w-40wc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:13:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29555415c5fso11884005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763655232; x=1764260032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=;
        b=mR7y2E7z62G4i5qwUP5Noomt2yRTdE7MKpIgx6nyjhcdl2n/PCfJHGdhwYx2pmPLBT
         KnFn2mbYZg+9NR/p9zO3l1ow2Ula4CNmGf9XICmOO8TzUbySnpNbsJeJtdjCzAvF7KCB
         jx2QMAUYqmmki5bV106SgiAhO/hdXnovyD1K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655232; x=1764260032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=;
        b=WhvgthORdN3xaiMVpthvph0GrAEOo7bJf8LU/CKi7x/pzfOVvBUi4CKKFjfdw/d/0H
         5nw1VcvOCelgzjC5/rd6FnnitZLH1Qd5D48JGWF37sz7EaHkx4NYzzk5WdVhvuOCFnZB
         DElKGf5j84ab5F4wFzInedqYxS7WP0cKWIRUyVFySjd6Q4Z4Pagk70HnmqfDFxVlMuWf
         K0vmIF5CCihfqdmmvpuapUkUW9oZIWKPWYhO5F9ZgsJNkTuPcBqHqB0evibeOmI6QGar
         hq4nepgqyAf+lnUtAvCpcoEZcN8wGnO2Jn/3HkV9EJw944lb+XVkGoZwz2Do0P1K+Zma
         OcNw==
X-Forwarded-Encrypted: i=1; AJvYcCV4BIG98QlFy3X4a/5T9xdIQAq7L0VIfcdsNMVFXyjQIxLCy8CZJJYGZ+jF4ShaTaMHDt+0iOX+6zzel+DiyYVF@lists.infradead.org
X-Gm-Message-State: AOJu0YyP0WS8KCB1cmjZHuVKepgFh7vixuRbhj6DoSOGi5eF2f/K94Az
	rk3k4612WPzu9of78pRulv2Q0pKt8T1FVw/omcox11Ex4D5bIjnvDriJpzWsbIbEjw==
X-Gm-Gg: ASbGncvIhaTv73eyt3ZxVCUK6mkFfsE9m3Xn9aWqM3GLCf4wkm6Tm05W8mB+/8JwS0m
	yliQ1VN0kNXAc7yH1GMEyBscR5jtFz5DvyA3EHZmUyC3dvn0DO4B9x2xqpDCfpT9SgZfFbQXO2k
	wubkhWjOOzLTJ7qPArXy6a00f0szTJacGhKl93iUbQJDfBgt2JJPsXZRfYuUTABFFwwboj+1Q2c
	3+s9y0DHVXXvlvmk1S7T/dVHYyrUCwBDaiYnKJs/kJquOaujc9tgROBSKJXnP00Nq1V0WFqDa5b
	5/MEtdCMYt9heixeRCxMwgWd0IMrohH8qv972JFUjEypwn+ZzgN6PJysrV2m1Sc52xj10T1iT4j
	aqiMX9NO1gAXuPYwexCLM4CRLjK7FZEPO+dUaeLwxw38d9lfW31jdHgLEM1n54Qg7ZGzSUBT8kr
	eU91kLFHmsGaskQhMRiHC/rgOOaYf+rItD/R/VhHYe/ddf2rYtSKipNuNhZzykjYH68cnPPKE=
X-Google-Smtp-Source: AGHT+IHXE1Lf/Npuwj0zFjBOEWKicuzA3UumJeheDegj7w9jH2aGLxpoO1AX2E47uPWOL3GSil4eRA==
X-Received: by 2002:a05:7022:b88:b0:11b:9386:826b with SMTP id a92af1059eb24-11c938a5da8mr1482106c88.48.1763655232027;
        Thu, 20 Nov 2025 08:13:52 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:b075:e64a:7168:da0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm14316777eec.2.2025.11.20.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:13:51 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Thu, 20 Nov 2025 08:12:28 -0800
Message-ID: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_081353_044226_107BEEE6 
X-CRM114-Status: GOOD (  15.98  )
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

In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
  usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)

That function can return NULL in some cases. Even when it returns
NULL, though, we still go on to call btusb_mtk_claim_iso_intf().

As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
when `btmtk_data->isopkt_intf` is NULL will cause a crash because
we'll end up passing a bad pointer to device_lock(). Prior to that
commit we'd pass the NULL pointer directly to
usb_driver_claim_interface() which would detect it and return an
error, which was handled.

Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
at the start of the function. This makes the code handle a NULL
`btmtk_data->isopkt_intf` the same way it did before the problematic
commit (just with a slight change to the error message printed).

Reported-by: IncogCyberpunk <incogcyberpunk@proton.me>
Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info
Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()")
Cc: stable@vger.kernel.org
Tested-by: IncogCyberpunk <incogcyberpunk@proton.me>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Added Cc to stable.
- Added IncogCyberpunk Tested-by tag.
- v2: https://patch.msgid.link/20251119092641.v2.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid

Changes in v2:
- Rebase atop commit 529ac8e706c3 ("Bluetooth: ... mtk iso interface")
- v1: https://patch.msgid.link/20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid

 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcc62e2fb641..683ac02e964b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2751,6 +2751,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	if (!btmtk_data)
 		return;
 
+	if (!btmtk_data->isopkt_intf) {
+		bt_dev_err(data->hdev, "Can't claim NULL iso interface");
+		return;
+	}
+
 	/*
 	 * The function usb_driver_claim_interface() is documented to need
 	 * locks held if it's not called from a probe routine. The code here
-- 
2.52.0.rc1.455.g30608eb744-goog


