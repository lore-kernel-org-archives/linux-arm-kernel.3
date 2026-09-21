Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D888C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9cuLvycUbpxuZeCkGbkO7ppnyiQyHbP7lOQEyxsj8o4=; b=aYLRM+TuC39BDxPDd4k8GpNzwf
	JWuIlb4BU5nR9VxVOR2dX629JZutt3VQwwWjxrnSaG7N1m13I7mg/DYe026wtTpAo4CPpznZYI7hu
	25Zm2bdpH6qlXNMe8BwlenJ21rSXA01zZISGNBbH+PfbKHW0Mvlj/Ue87oI/PiSBOjpkbB+prOkem
	yd13jDK3nlWnclSX0OkL4Ypmp7J4Yam6HH52Hzsj5FlPWVSy/sotUetmfOeyC4Oi83brBRWuOoSSc
	A5oX+QVXTU2gfnpqGphjCJQEI2UpM2VZ6JEdsaYHzH64jT3kdqp2SuHX/ThgEVukcAh4HBPh0yzYy
	woif4CPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bzf-00000001qpD-1pGH;
	Mon, 21 Sep 2026 11:15:31 +0000
Received: from mail-pj2-f12.google.com ([74.125.227.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bzc-00000001qmj-3d5u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:15:29 +0000
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d9004a1ac0so17885435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989328; x=1790594128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cuLvycUbpxuZeCkGbkO7ppnyiQyHbP7lOQEyxsj8o4=;
        b=Bx5Xznn5YP1fyU1/RC/X06DrMpNc1i6nSbUkvXApRBODQBa7I0Uth74NEZcCZBIdF1
         6kpjrO6scZKhSWr12+0s6ivEgRgnrpUDD1w8pc5vSpSrY6Jxtgai/Cchaf04ZhbaYtQD
         a/R1+V+qJ0rMlFEJuyZfQOLaBdFNXTkwkH2mc+ypDw4nggdIDdrilWturyrEb1M5+cBh
         eihZB907TBFe4PgjKFKnm8AAHt4hl+0vbLlfB8DwgmXuR5gdwVfyLAL5sTh4a+xBnaFZ
         VXhE41ESYswEdmXiRccLducOp1YF+aR7LL+y5DEmi0IQ8tkl6thYxZbtKO60voVhmfmT
         fD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989328; x=1790594128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cuLvycUbpxuZeCkGbkO7ppnyiQyHbP7lOQEyxsj8o4=;
        b=tRO1lYifz7qSpF/+3CwNFBaV2z1REGCj0SugNYZbtV3+tJRtkn41sjvHWTka9AkoPs
         5QNrtTIYuUxYQrNgK54WBoTQgXrpOTIF5yi42GVsuTY5XpXD3K57zpxXI/jNssXrSxqK
         cI4MldcxAziJlHh9W8u46hpIr3hP4M7KVrZX4ARZea44ucrrf9bBtSzOyu4qvAhcdZjW
         Purqj1FoywTtYZ6S/nJ41wHgF1j3YEccsDkQTpJ165uvdHuRUGVgAx5XGEDJ7n58T+XF
         45v/LNe9hfoRnHBb0ofTSMJR2sTOYDIErQxlWz7xNWXBtBVho50tVBlWUwmdoM5NctLY
         OH9A==
X-Forwarded-Encrypted: i=1; AKwUvBxzFgCtRu+EfdT7CZyaWRIoimMN+2Pf22+Q61ofuToZjB43dTSanAp3EbjL8TgGozhzUluolIpu70u0QK58uSel@lists.infradead.org
X-Gm-Message-State: AFuF++k2HfSrZkdfxGPodCoWS28JvvDOQPItdl8ZMYugU6f63AeEJS2d
	hrdAyh3ZBzG0VCIyY17ns7x/xDKfoK+35VQc/Ga9AAiLRHy4ovXQUrP0
X-Gm-Gg: AYBFou0u3h/laruNObEleYtLzbuIeVW7TpqSrsbsIlh6SKK/XoLXChVGYBiuRARpFKI
	dAKu9908GXXACulfeB6LCCY81BxJpHBSPdpJmmC5r8C055ODoL6gz4vR50/Nqr3E7OKqWwkK93K
	ENRLTmaBeHtVLX3nYiWqwkoXo9aVS8Zwn7eaX/t8x/Z5bnMLbo79Wzz1uDkVYx0rKoOGdRt+evg
	8IzGovP7s/e3Ru+g/iASEIiWNpEpHnrvkPB78eYxn9rnZiMAzqbFsQq9ixMS8A1W1splGKiTrtP
	JNfISornGKyLhiE4b78AqQjgTWBxfk4hM8rY2OyMFTkC3lTfsOicTwRl7snXefmJM8vx5NSpeW/
	9/1FBAA2uXRz5+HUSlblS/pDGEOGN+uc6PrLFkXytd+GTRMjC3rsgBm/Kqfg0kmf8eff0UjoGaY
	ftwMJ7KfurzR7QG1/D1A42f9ThgTkUYWHRImFn9fxvIxMMXmUCF+QIF+3d3uRKF0IQqlqAPUu8o
	gfPquM=
X-Received: by 2002:a17:903:2c47:b0:2dd:c168:c4e0 with SMTP id d9443c01a7336-2ddc168c512mr84966165ad.0.1789989327719;
        Mon, 21 Sep 2026 04:15:27 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df378440f4sm26419465ad.59.2026.09.21.04.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:15:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Ludovic Barre <ludovic.barre@stericsson.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Julien Delacou <julien.delacou@stericsson.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: ab8500: fix child device leaks on probe failure
Date: Mon, 21 Sep 2026 19:09:09 +0800
Message-ID: <20260921110909.370945-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_041528_918620_4DB669DD 
X-CRM114-Status: GOOD (  14.35  )
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

ab8500_probe() registers MFD child devices before completing the
remaining device initialization.

On AB8540, the main MFD device batch may be registered successfully
before registration of the cut-specific batch fails. In that case,
the probe returns without removing the child devices registered by
the earlier mfd_add_devices() call.

The same issue occurs when sysfs group creation fails after the MFD
children have been registered. Since the probe returns an error, there
is no later teardown path to unregister those devices.

Call mfd_remove_devices() on these error paths so that MFD child
devices successfully registered earlier in the probe are properly
unregistered and released.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..e675223b6023 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
 		ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
 				ARRAY_SIZE(ab8500_devs), NULL,
 				0, ab8500->domain);
-	if (ret)
+	if (ret) {
+		mfd_remove_devices(ab8500->dev);
 		return ret;
+	}
 
 	/* Add battery management devices */
 	ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
@@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
 		ret = sysfs_create_group(&ab8500->dev->kobj,
 					 &ab8505_attr_group);
 
-	if (ret)
+	if (ret) {
 		dev_err(ab8500->dev, "error creating sysfs entries\n");
+		mfd_remove_devices(ab8500->dev);
+	}
 
 	return ret;
 }
-- 
2.43.0


