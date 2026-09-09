Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D722AC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C7UZ+CZSXqHjsWNSA8dThjGs+0DrX3xzvJgXi6EfD+U=; b=X7H7kmhczZAClFgMOsSuT6tPcH
	XdcPTwwFbksUfx4La3BYaqdRZYp4TWffd2dFqTT7I7LgaLJ2peYTXog0Z36p4gePVCM5cfv5j81ML
	bl/fx67FisDIHrGDkCT3iJRutWIder7dO5UJvuAbS/sB+7SCpJvyynlKBucoJWcDe6F9Lv3IyOynf
	rzoGna2YxUvAyf5TgdbzHc8RU9qE7yXrstXup8RAMVpMncll1rQyNzd2JLX9ex8mcI5BmYq67rpG+
	7Vned/YwDireufBmwRzKC/m5SaUQQV88F2gl8xL08LEhcv8uu4f4/2xOx7keHuxLgc7HTaZF0Z0dS
	0NSHrurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QSo-0000000CzEt-3FEm;
	Wed, 09 Sep 2026 22:08:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QSm-0000000CzDw-2E0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:08:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cc891373e0so67730755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788991695; x=1789596495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7UZ+CZSXqHjsWNSA8dThjGs+0DrX3xzvJgXi6EfD+U=;
        b=JMgDsMQ1IDLQ8WcHph95rgheorHsJo2K7m55z1mHQW13vRJzQNlnmS0spkdMACG+v9
         JTSXbxUQHTSu31LRN+i96WGtF8Qy66i8Xb7aaLaOOX2hEk6Dg9acpDJd2F2xC9cnxkZH
         +OUesZSXyiJFwpx3eTEC9uHKt4BBd2rPQHSeF9G4JhpWjhipUCHeav3IjpHTUMccUTnJ
         Cpr7g9tK2f6VNgOT3luF4HbQC3mUIGkXW4JE1srbZasPOC1RPdOvUkFgfNMB7KbhuIDg
         HTCF3aIPiLsqhRSVhkPdE636kaKWCYp3piac/BLazAAA9JW+OZxrFGJaqMWqQDVLevay
         hkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991695; x=1789596495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7UZ+CZSXqHjsWNSA8dThjGs+0DrX3xzvJgXi6EfD+U=;
        b=O2EQYMWbsXYOf+uPlL5mPK26AZ0AEJ07D49Yqztm4E2OKPKPU2D3YJOp+YeCub69m6
         VNW4xklmzSfxC+7C5pGzAFzDJONUV/0ynybDo7L3i2e3K9oj+Lmi8V+eDgTTcwthtEXo
         y3/J7UA13nLPIDS7l/d31upnEnndStEtdQlbJEZYlI6peqeC9/VeJEl5DeSeX4kYtOh0
         Le3uj/PjJrOoEF32nmiMX3vilazv9rrgBnoorQiTFOhxUvsdA4ZlVOJxz3l6AARyEcjy
         /vOfkNUBWm7ONzw9AZ4fyY/izpm34+B6Bm8FZCqrwIQCxk9v0yLRTtcJaZo+rBZaZwjz
         zT+w==
X-Forwarded-Encrypted: i=1; AKwUvBwjJonbkZE/rkz8zmMfMYFGUe18120z+JDuy8zoeVKnHwRy4L+jiGIl0b237f135vb9D8OCLujDSAWPImnuF8BW@lists.infradead.org
X-Gm-Message-State: AFuF++mg5MyxPoZWa6v0fS0O51AXnwA8HInt9yYHR/WhqPx1IeGFnQ8z
	cioVTVII/I0L9DboLY+3rdeIR4qximM7iOoo1hU7PgI+ke19ncLOYnBM
X-Gm-Gg: AYBFou0T1wpdVmq4fjXZwYfz03Db3dmRkvUpRDwLkM3BVbA9Pz7VKxKNu3JioIDaizY
	DJs9K3rWpnRcY4noAUQxHP/dmG7v3j15iyNGqw+FfIrgjB6Azw+v/j3y7UKrjfbYyVRiXgZmIXG
	AMoByXgsdTOJl38x3V+ye0QL5MpYgWAgvpI/WlUilTyhaKHT3TXWygucLTB8nJCx4bUEDSmtfvS
	hZ0pGCofUZeoeI+SmIeAwTdHWOv0SJbpf2fgDAsTOBx6P+HL8KiEmB3e4p47Kmks7Ipsu2qtrpY
	w4PnfhYTvw+Dyy1kROd2opoqhZfZn4jksAxUxQmtggefpDlNOI779rXRPl2lYx86FmMvELBKh1r
	ALsRhmtoSk3xz9zfCQAdYi2sm1yUc6iVPc6ZkCGyFCCfvkoNQWTiHTfVoezcqpHuPd14wgrTP7Y
	8ZSrfX3/01lK8OVBXz1ZujlGLV5NzQeVOG4tDhDcY2EOtNYKLLhpbzpa6MRvK8Yzk7x6yuA37TJ
	jAco1U7D+dChF+VrRzjT+SSHnrFrFTYpYHheWh+cSxFarThD9bDdDL7jgJ24w2nmKh8o11i12pb
	2UNpo5juNX5z7LmPpsloD45QXwLvuQmCjTVjJbE3wvMtNAfg
X-Received: by 2002:a17:902:da8d:b0:2d5:3f5f:e645 with SMTP id d9443c01a7336-2db125ca419mr522760655ad.12.1788991694359;
        Wed, 09 Sep 2026 15:08:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2c60f687sm65423565ad.58.2026.09.09.15.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:08:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	asahi@lists.linux.dev (open list:ARM/APPLE MACHINE SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/APPLE MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] phy: apple: atc: remove stale kernel-doc for removed struct members
Date: Wed,  9 Sep 2026 15:08:10 -0700
Message-ID: <20260909220810.52310-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150816_591960_34F15757 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

The @sw and @mux members were never present in struct apple_atcphy,
causing kernel-doc warnings.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 v2: remove removed in description
 drivers/phy/apple/atc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 4156fabad742..f09305dd76d1 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -585,8 +585,6 @@ struct atcphy_mode_configuration {
  * @phys.dp: DisplayPort PHY instance
  * @phy_provider: PHY provider instance
  * @rcdev: Reset controller device
- * @sw: Type-C switch instance
- * @mux: Type-C mux instance
  * @lock: Mutex for synchronizing register access across PHY, Type-C switch/mux and reset controller
  */
 struct apple_atcphy {
-- 
2.55.0


