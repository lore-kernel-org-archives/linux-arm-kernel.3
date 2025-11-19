Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F143ECF3963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=; b=3OMxZn5Goo71XclRi2TJPhktfK
	voX+NYSLWA+p+l1Vwk+0gUTuBAl6mSFapfxN2Pu335/XvHL/bOaS8Mjip7JcIY/rPZKPO28N6cbCC
	W/gWgcwV2EB+QMzQAhAgcnOEa6R8xdj632uUrTY3MNE43l5xWlL8N9JayduJ8L/9+jt/Ww3dqFVse
	YXqLM363P6CpLJA4uuS0utcBLiZLt/8T1a6TSSBpq8JXWWJig5e252CE+MrCKTRbDWYJ8s42V5NM3
	Avuxm1c08aI68kv7+qmsCsB7ms+Ue0Zi6G9qmRY3awUizDw/BfD+rRsdEU/J2pOmEEz7Tr+EY4dFe
	dbbYGv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlRq-00000003mc7-3icd;
	Wed, 19 Nov 2025 16:54:26 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlRn-00000003mY2-2hT8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:54:25 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so6719951b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763571263; x=1764176063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=;
        b=OsCKOIeTpANwEyH8tWoC127OSIerHIvfAxhJcFyuK6rJ4IfS1iMAETLpcZyXE21P5R
         hJVhMvblwOxb/xsc3jAUrgr+w3A7n+5XV5zu/cViQsJypMydDRGIHRFozgVgrOCzKQ7+
         I9Byb9mZBVOG7pDsYj4Iyulm5pFYaZRiaLuyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571263; x=1764176063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=;
        b=olh5fbJ+8oP7G59IlypLOyN3p+j3/wsMPNaWPHk/ZfVgidwkg3YFRYAxbRDUu5Az2a
         hT6ipsm/K2OH/BZGfx5AR7QABovhQd33IJaUIIC2f1UNzZdYNlCz0UvlrmRyjXLUcu67
         58k4tEtNfD//GmMXaeio6IWrAMy8sWogpwpW6YxB8jFIyDyVIqTDlUsri+0aq8w7k1l8
         IOKhI5Tz07OwPblMiL5xzRVrnZrB7qhPa3JSIl2gf7PU3aWN7DY4LNHzjI47z/rP4Kh8
         MHGNIaXYp1aPhAZqnKZvviJj8pb8YSPzYFDJ4uzW51e2UG2duFE2uK7Omb8Wt9T+mFAy
         XWOw==
X-Forwarded-Encrypted: i=1; AJvYcCU9mdz8hXO2C+/BfhyjWAz2ooJOKY5+k4Qa5RK3LSc6LpEidHfOldw3qHbZXRDSW2jr76lt25OT4qAmISYHayf2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Hy/sIIiiE0zHiAzKWyFm7LEw49qU7nNMoDULkKT8Q2i1Wj2V
	DJEcPOzzFgLJpl146Uw2NDNSLimhCQOmR49eYNcVQxzgXAgkR4JxijCihaFAY/nTLg==
X-Gm-Gg: ASbGncsZuRVYY6uSCJMYKVWwLzp+PJg0g3MXAvHfIL3H2Py51wDh7o4P/Ok3uY/esnL
	yKejOvn6XJvNKLbBmpqX5ShB/dAG537g5ClOe6sm+V/mx5r/wAtmbfkND+1Se/4rky0YJ6h2Rnr
	DctUDwwmC3YHwvp1QJPusb2i51GZ5eqpqhFZ5ymiJCS86PjphWVxTywRqngYwju6Rq3LIQJrT40
	AjFHQfFZ3iiIDNDWP1qfx+VdponuleglKAYvtdCRXORakHCwRcdMX7SOQOgAdbihq8swzG8pdCP
	vufdz0ePDpNhlF2c8DYNxGSJ7uYjs7oO4O5eBKQggjyb1a1IErBnnq4xgSUejc5IQOwYQrktezr
	U7jjSW182KNnGfFjaW2Z0xmo5ROi5SsINs1p0o05rnzgYqx+LUbWVwgDTTdA2eIJrT3CXiIPfFC
	SSRo5XkfqHzI8r2CaHeSjv/Imjm3R0a59HOc9ifbfnehHLY2w3Y4ac2ASbtnKsHIcytKemsEDbc
	ozpy+EdJw==
X-Google-Smtp-Source: AGHT+IG6Mf8qsXvOK1ixMYCQNU/FYpCBumYnKBfjBKtdbVbifmpntuvtxBUSy93dyel1BQ7M/vgfNA==
X-Received: by 2002:a05:7022:eac7:b0:11a:a20a:4413 with SMTP id a92af1059eb24-11c93887b01mr7150c88.31.1763571262673;
        Wed, 19 Nov 2025 08:54:22 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cf0b:c8dd:8f4c:d649])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm61967659c88.5.2025.11.19.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:54:21 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	regressions@lists.linux.dev,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Wed, 19 Nov 2025 08:53:55 -0800
Message-ID: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_085423_709029_118002CB 
X-CRM114-Status: GOOD (  17.67  )
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no way to test this commit myself other than to compile it. It
looks fairly straightforward, though, so I'm hopeful it will fix the
problem.

 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a722446ec73d..1466e0f1865d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2714,6 +2714,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
 	int err;
 
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


