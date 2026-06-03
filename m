Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D280CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uN5cSlSsFmu1fB4MX4N7BjMN4TwFpgg10y85Ysy+5Xo=; b=L+TlzgFEYe9yxxN3vh/mFEDiS4
	7fTaTy2123BDlZ3WY1cTzXStWAjfSEy8G54MXyrGKJRmX0Lmbi2dvCWXP7kCfnW+zAnyr3PtqdY1M
	3djPqPO9xpU31NYLf5tUKhjwxLtScrNAd2+0L1Acfq6zhJlS/vAFVIWJWqwYUorP8Y+QVVDgjCzNH
	qJjmo/AkTlhExrmuI8QBs5F+9HFE6Y0F9pIo6quuWuylk62hhg0XiCmevW27gM9lfxzeK88uDcAkk
	OS6v24vadf8w2EosbpeyPQh1cc9JWiL0ex8l0q/2t95KfjoS70fDLaI4kyX2Eyq3tmVdz2m1bx+oX
	89s2AVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsVJ-0000000Fofv-1sIL;
	Wed, 03 Jun 2026 20:47:57 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsVH-0000000Fof8-08kL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 20:47:56 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-915336b83adso2975285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519674; x=1781124474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uN5cSlSsFmu1fB4MX4N7BjMN4TwFpgg10y85Ysy+5Xo=;
        b=JGdioQTgIJH+MGESGhNAYuF74sHVlDQLQJrK1YXv+yeoyShCwV7+Ip8ViuFxvyy+n6
         4NFrHEtFZcg5YYsQUxLSMYgmpdwXkCda7+9ZM5U2PWSDSfXGf5OnVZs2erJI1ZLr64a0
         rM3HdcmfZtCZuhOGgGoK7rJl23CQ6qhALtiQnwgo7Dh9ygYjjkVUibc/PHmldiGFS/gY
         DIaXBHnyDXO27djZ/RD7bZ6lAB5WSyC7zrL/f4pyiEplGen3zJXmnnzP3G392S9cyYn7
         XM/ebrUq5peqiKhYvqQOOfRQZ0IhBfN12m3oM+PR3TtmtfBZVw7WY5vdVMztRzZkHe8H
         8Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519674; x=1781124474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uN5cSlSsFmu1fB4MX4N7BjMN4TwFpgg10y85Ysy+5Xo=;
        b=F8h5wEoIunOSf9n0RYNDPPE/ioPonoTFdUVwSjY9QU+bPqH4pv5OIcwpLlAktBWHAR
         AFs6Ahv7P5Ta1xEvCZ9/cuQnDAath/dSajKO37M1pbHbxzWqG9J/Vs2W6KrKSogKbZeB
         Kt8Mg94poWX0nqc5gjTu+Ud8e3O5YOvA2wHZBi3y84XIAVkGjMIEVCEM1irXYFL6qHr+
         HnKJWkrJU+xIQMtSSz+oaNMgEH1pHavsdzKyRlpW8BBGNn3beSWWUyS/1/633Cmgm/8q
         mPZvES6d6R3MBkVf+QU6ST780Itl78O8rlQT6hQF+gfGb5s8jYtdcx9sYyWzWVgPd6o+
         CCBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gupLlg/4lbcoWt0YsZjmnsq23+ZbVnSYlX1dxQGhprro5Yl6v56yJlkiUwuElpXBieDPAKyo1ATTnyFYtT3kj@lists.infradead.org
X-Gm-Message-State: AOJu0YxuDWd2wyvBA7c6A6LNFFXj1HpCzNlbaAdWPsMu4htS9cK7LllW
	Mnoys1PuqIT19CMB3LvqrqzoA7wIvLcwKLpHmT5J9BltiJSGi4bFbXa/
X-Gm-Gg: Acq92OFbwohN0LiI2PWmxxTekfuJZVonDFWWdy6moLV9vkyOHSfcAW6EGJc7+HlL+hM
	zvbPd6Ioua/oFECA7VAFgJv8udvEHR0BuRJmvfUIyJ3GyImeiYedSWd98Ldx7dxeXzUDqWDC8Rr
	nypIXJ2zHtTR9O+d4b2i7GtbG7aukTpwHKc/EJdCrfu1ha2IXbV5BN7QFwKTqEyhUkbyBNhW+Xs
	ElyxjJ0KA9KsE3m0aK5euO1wOo5p1th3iEsZAuIuOE9eJAfoelQXGqFkYps1hsysUUjLxzFzLar
	kI+mGxYYei5vVGrZO0Hm8eKR/dciFI09S4m8C9jR5O0G6b4nSTsh3mVtEU9hyhtfgSLX3ZN47fl
	YN678dF/cl7o9dRV5IEBNIV9BHz3uNS8nNXGBtGsEIZOHoGNkAuqHkUknWf0WeCC+JCMBXqaBSo
	tp9wHXTJ/+nds8XrVmWbbaL0BxuASnjJ7VfoO3WCIToSCNALXrA6w=
X-Received: by 2002:a05:620a:2989:b0:915:7f42:d91 with SMTP id af79cd13be357-9158a642e0amr795141385a.8.1780519673783;
        Wed, 03 Jun 2026 13:47:53 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37bcd6sm359860185a.25.2026.06.03.13.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:47:53 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] EDAC/synopsys: Fix cleanup on injection sysfs failure
Date: Wed,  3 Jun 2026 16:47:21 -0400
Message-ID: <20260603204721.2200819-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_134755_083321_B3054C0D 
X-CRM114-Status: GOOD (  14.62  )
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

edac_create_sysfs_attributes() creates inject_data_error before
inject_data_poison. If the second file creation fails, the first file is
left behind.

The same failure path runs after edac_mc_add_mc() has registered the
memory controller with the EDAC core. Jumping directly to edac_mc_free()
skips edac_mc_del_mc() and leaves the registered controller state
unwound incorrectly.

Remove inject_data_error when inject_data_poison creation fails, and
route the probe failure through edac_mc_del_mc() before freeing mci.

Fixes: 1a81361f75d8 ("EDAC, synopsys: Add Error Injection support for ZynqMP DDR controller")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/edac/synopsys_edac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index 51143b3257de..c395a1e97a36 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -1120,8 +1120,10 @@ static int edac_create_sysfs_attributes(struct mem_ctl_info *mci)
 	if (rc < 0)
 		return rc;
 	rc = device_create_file(&mci->dev, &dev_attr_inject_data_poison);
-	if (rc < 0)
+	if (rc < 0) {
+		device_remove_file(&mci->dev, &dev_attr_inject_data_error);
 		return rc;
+	}
 	return 0;
 }
 
@@ -1431,7 +1433,7 @@ static int mc_probe(struct platform_device *pdev)
 		if (rc) {
 			edac_printk(KERN_ERR, EDAC_MC,
 					"Failed to create sysfs entries\n");
-			goto free_edac_mc;
+			goto del_mc;
 		}
 	}
 
@@ -1448,6 +1450,10 @@ static int mc_probe(struct platform_device *pdev)
 
 	return rc;
 
+#ifdef CONFIG_EDAC_DEBUG
+del_mc:
+	edac_mc_del_mc(&pdev->dev);
+#endif
 free_edac_mc:
 	edac_mc_free(mci);
 
-- 
2.43.0


