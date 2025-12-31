Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438CEEE49BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 03:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ml+CWfuCyt8xPYOA/5JpaBit+P1+CQ1YTe7Xd3yRLk=; b=4aSGMPawIBkFJBJtnq4EQmU44l
	1GB0K9NfYZwJqRyhOK4dlApRcxxKORm01cfMsg9D7ngEETs1o66drLW5kE3JQQo+yFMlJ2kiyj0Fd
	RJHFVuARoQfEd+CIY89hOM9Xg5Y2nHZEykcAgeEHEcNn6EwMDIUNiTqKORlUjoorJ1QqGZIJEAvM+
	JsCTvhIvelX+BYGK5qBIkmM0nG0EWMvKU+uRHEhLwh54XsGCHm0fAiMgzsfstRw65Zh1+fGKlX7SS
	Rz5cPcd37gAj5xpLbdHGridniYPQ3L+Tf0rkJ2n3l+Vb9Z0lcFl9A6CIceXphxIhRZjBrypdihEq3
	tCIP09rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanKN-00000005f55-1JzL;
	Wed, 31 Dec 2025 03:56:51 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vanKL-00000005f4P-0voB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 03:56:50 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7c750b10e14so4273681a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 19:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767153408; x=1767758208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ml+CWfuCyt8xPYOA/5JpaBit+P1+CQ1YTe7Xd3yRLk=;
        b=EcfaVPK6QqhnlXrCNbMO2HGEw5sGVNe3G4q78leQ1XYiZhfPPS5wpY1WbqcPbL9fl7
         BXbpM+68zJZ7UeVIxKDooSj4/BDsn7JOxqWw3MpGDIuN2X6kgy5p0YEHGqX+lQOOpQ4k
         HrKgA7bTKHQOXFdDl5vOS71A9SsWZUY4zVvRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767153408; x=1767758208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ml+CWfuCyt8xPYOA/5JpaBit+P1+CQ1YTe7Xd3yRLk=;
        b=ZGCZC+EVnyn0nMP//Yd0ZUximMbNisJ//HsjVlIfPu/doORaA+UMmMIYK/5Pwe45Ti
         NkHO8WfNzEUXTo3LnCTCyPODwYruJyOGBC2EFc6NrMffIYT1hCNtXeYR20Fz7+vs1/1q
         480F25iQQQGXlamPemVP7hCDl2KXSMMIGitCrNDkGT1lwFUpUZCrLsSj33mepdkJnMGx
         g+H1JBnrBggMLOuDZgOE2f2R/3TGedOG9Mp6cmjlt+VCiR1iOTQ9yG+eQvYRSrWMFFsi
         QqmGw9PSGN4T+B52/9P6d6j73OtCqUfdsf/pO4OjUpw2xIGZDqdxwWBMzheUGnBhsOXJ
         oSWA==
X-Forwarded-Encrypted: i=1; AJvYcCUF/M3ERLkl3u+kyMWOl6R2LOeNkOIx4Wg/8Xp4b/GGIQVBdjpZOUlp9UenQjNqK7zTYt9g648+3VUS/CjrjoxQ@lists.infradead.org
X-Gm-Message-State: AOJu0YztY36E4jBRDvdWLv+H0zTECXI58CH1sOqmT/48X2WMhPZiLML8
	K19Fqj/rk/D3CuaEKkHHkgPezBiQIzOKfCSqVo7eiJHqzri4brf6tuyohhqav1wYJmc=
X-Gm-Gg: AY/fxX4pUjBnQ7LGBbozYI66eeVDxeRCb+r82g/zukUp3Kp4C4KWkl3GBH0FoHG4r0R
	mvVaXA4omnDuzRiNw0qhvJizeW+tpwnQNHDquXjDJcslqG/gkqd5f4kW2LAEBBC30eY7zrWiX91
	DhP/Xqpp7LfB2RCs0feYYz1imHnRj84fGcK1Jw02iaV3i5xKF9rxyMBaChjNAWmL4ng7sgo8nC0
	EXbwkJfvQPEjF+JNhktzzhMQHneTOxWGnHfjS1da1tPifg0AjszfAYVO7hOdHcnLuKfpLkY8IpL
	STQJVgKXxfcamzbfUcNWAefe0PlY9bMtlI7R8AlLapG9RbbEP33oBe09QcGxfSzwoMN9CII0Y/+
	zWBcVd49lXOR1FHrpZ42RZPl8uhOHRKU4PZft77abbczc0Qn8/kHINmjvAYglBl8qh7YzaCrpNy
	iqpaaAL1A3SgiGBpNOlV8l9bMANcb5b6pOIPKs
X-Google-Smtp-Source: AGHT+IERNvC/8Px0V8IUK3zXSD3cLtvI8CWOvblwcgNUVpnq5u8i6LLyM/rg8Ub+tY/WiPli4ic1Sg==
X-Received: by 2002:a05:6830:8385:b0:7c6:d0b4:c973 with SMTP id 46e09a7af769-7cc66a843c9mr16033899a34.28.1767153407908;
        Tue, 30 Dec 2025 19:56:47 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d7f1dsm23582518a34.15.2025.12.30.19.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 19:56:47 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	torvalds@linux-foundation.org,
	ebiggers@kernel.org,
	johannes@sipsolutions.net
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Revert "wifi: mt76: Strip whitespace from build ddate"
Date: Tue, 30 Dec 2025 20:56:42 -0700
Message-ID: <20251231035645.5545-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_195649_281919_69C6816C 
X-CRM114-Status: GOOD (  11.69  )
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

This reverts commit f804a5895ebad2b2d4fb8a3688d2115926e993d5.

This change introduced the following panic, and mt792x_load_firmware()
fails. wifi is dead on systems with mt792x wireless.

kern  :crit  : kernel BUG at lib/string_helpers.c:1043!
kern  :warn  : Oops: invalid opcode: 0000 [#1] SMP NOPTI
kern  :warn  : CPU: 14 UID: 0 PID: 61 Comm: kworker/14:0 Tainted: G        W
        6.19.0-rc1 #1 PREEMPT(voluntary)
kern  :warn  : Tainted: [W]=WARN
kern  :warn  : Hardware name: Framework Laptop 13 (AMD Ryzen 7040Series)/FRANMDCP07, BIOS 03.16 07/25/2025
kern  :warn  : Workqueue: events mt7921_init_work [mt7921_common]
kern  :warn  : RIP: 0010:__fortify_panic+0xd/0xf
kern  :warn  : Code: 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 40 0f b6 ff e8 c3 55 71 00 <0f> 0b 48 8b 54 24 10 48 8b 74 24 08 4c 89 e9 48 c7 c7 00 a2 d5 a0
kern  :warn  : RSP: 0018:ffffa7a5c03a3d10 EFLAGS: 00010246
kern  :warn  : RAX: ffffffffa0d7aaf2 RBX: 0000000000000000 RCX: ffffffffa0d7aaf2
kern  :warn  : RDX: 0000000000000011 RSI: ffffffffa0d5a170 RDI: ffffffffa128db10
kern  :warn  : RBP: ffff91650ae52060 R08: 0000000000000010 R09: ffffa7a5c31b2000
kern  :warn  : R10: ffffa7a5c03a3bf0 R11: 00000000ffffffff R12: 0000000000000000
kern  :warn  : R13: ffffa7a5c31b2000 R14: 0000000000001000 R15: 0000000000000000
kern  :warn  : FS:  0000000000000000(0000) GS:ffff91743e664000(0000) knlGS:0000000000000000
kern  :warn  : CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : CR2: 00007f10786c241c CR3: 00000003eca24000 CR4: 0000000000f50ef0
kern  :warn  : PKRU: 55555554
kern  :warn  : Call Trace:
kern  :warn  :  <TASK>
kern  :warn  :  mt76_connac2_load_patch.cold+0x2b/0xa41 [mt76_connac_lib]
kern  :warn  :  ? srso_alias_return_thunk+0x5/0xfbef5
kern  :warn  :  mt792x_load_firmware+0x36/0x150 [mt792x_lib]
kern  :warn  :  mt7921_run_firmware+0x2c/0x4a0 [mt7921_common]
kern  :warn  :  ? srso_alias_return_thunk+0x5/0xfbef5
kern  :warn  :  ? mt7921_rr+0x12/0x30 [mt7921e]
kern  :warn  :  ? srso_alias_return_thunk+0x5/0xfbef5
kern  :warn  :  ? ____mt76_poll_msec+0x75/0xb0 [mt76]
kern  :warn  :  mt7921e_mcu_init+0x4c/0x7a [mt7921e]
kern  :warn  :  mt7921_init_work+0x51/0x190 [mt7921_common]
kern  :warn  :  process_one_work+0x18b/0x340
kern  :warn  :  worker_thread+0x256/0x3a0
kern  :warn  :  ? __pfx_worker_thread+0x10/0x10
kern  :warn  :  kthread+0xfc/0x240
kern  :warn  :  ? __pfx_kthread+0x10/0x10
kern  :warn  :  ? __pfx_kthread+0x10/0x10
kern  :warn  :  ret_from_fork+0x254/0x290
kern  :warn  :  ? __pfx_kthread+0x10/0x10
kern  :warn  :  ret_from_fork_asm+0x1a/0x30
kern  :warn  :  </TASK>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ea99167765b0..fba7025ffd3f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3101,7 +3101,6 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	int i, ret, sem, max_len = mt76_is_sdio(dev) ? 2048 : 4096;
 	const struct mt76_connac2_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
-	char build_date[17];
 
 	sem = mt76_connac_mcu_patch_sem_ctrl(dev, true);
 	switch (sem) {
@@ -3125,11 +3124,8 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	}
 
 	hdr = (const void *)fw->data;
-	strscpy(build_date, hdr->build_date, sizeof(build_date));
-	build_date[16] = '\0';
-	strim(build_date);
 	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
-		 be32_to_cpu(hdr->hw_sw_ver), build_date);
+		 be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
 
 	for (i = 0; i < be32_to_cpu(hdr->desc.n_region); i++) {
 		struct mt76_connac2_patch_sec *sec;
-- 
2.51.0


