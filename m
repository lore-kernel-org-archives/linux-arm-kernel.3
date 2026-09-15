Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8734C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=; b=nw0TxGvHaig+2+X8wBqaxN4syW
	P0NAF1x6b0QmsMm8c+VCvwC1+aq87TZrfJAYvf7g5HOCWECOoQ83d2eY5pdUcuv5ef8H5O04AxluJ
	bu4swRjd+dlyqCZHzXRJwabyJvAOwiuPM1m578Ydk0gaS63cLDyONXaEnyEtJlbf6isCPg77ZRYa5
	F/6NiStF8l2Ksh8j7bYWQbjlMBoNuD9O5xrNWHLwDQYJewFgVDrFQFBJU7pRQ4jWN1mPZIPnG5OiG
	ACucR6DTJpUAGhJusmFvS6ZtXZlFWekTmsce74y4Pzw/yKkLM7dWJgdtdqQ1UDG28odni5X5G0gp0
	jOb7MDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RgJ-00000006IvU-2oVH;
	Tue, 15 Sep 2026 11:50:35 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rg4-00000006IoU-15xd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:50:28 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ee1f9bso32925235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473019; x=1790077819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=;
        b=NwUJGS4S7zZYpZbAmTdWZaCf8sZBZRU1Ag90AVQ8odOauGdKUri12wKwCEXHjacufQ
         eP3zXIvhRY73aS0cqwiC2DmKRptTBtRfzn8U1wREMIRDDEmrt9rcU5AS75HoDqTRjyg/
         deF8/cnLP0cV3rF/+5Xhuw7oVYbdWigSorWXRJ28O1VCj+fbAQkUP3hfP+m8cJ3x7UbF
         tHEXK+He36SJe0rjbaLAI/amPkheanUn6EWl5boZR2xHdAvPXMdh4OAc8+ugg1UbJA67
         mIBWGPCFrNwjbAUyp5QkgV0QjrFOWVCWLgwR9moaQ52exIsGBi9j1uF7oYLiQSpUGEG0
         RB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473019; x=1790077819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=;
        b=0/W05ZSF3cTuWXVC8+mM26WhAq3QqQ20xnBhOrg3++Xuhws99FLICysaLoNexvz6Wj
         1xPw7egmx/omn0dp2EVOxY0r2aiXjt/QFgpwpH+KQVeR8xTBYAxyIOXLPpCSsXK+1JCW
         Fo+OVhgIl3iTlUFY8oPh+DcLXv65ynf/0W0TKxmo46flcUdHKCy0C6WPCLs2wu9JtByZ
         7yyVTrY0/bfKCEayYSMQLC7QYrdcBuad9NQL+ut4jCX9zx3t+v0VzI33FsOAleKHx8wM
         igG+dTmlm7dVlOhS74XqFOZy6/Xp7LGzQojqb8WkVCxe65zsH2t0QsXDbzpru9OZ/H7I
         92yA==
X-Forwarded-Encrypted: i=1; AKwUvBx/o3J3tr9mQ8k7h73w97zFa9S759tQaqkLO4uqazYgFvljnStJQlayK2lxq5nyN30LQB/44slHP/vAdrqV+/iL@lists.infradead.org
X-Gm-Message-State: AFuF++lslCi3myPz9vizhpChaazJpnz0qsiLvTe8Fc3Gk8u8O/xFwvBK
	MJQiYaOHLZs9u4qegsK4QmFeBnyxGby/QeKMGlgexfdyCCzIQGBDQf0m
X-Gm-Gg: AYBFou0wn7LNEj5XOsK+vNPhga9pM4fmJyvvrFdgqo/hUSd3F0f8qDjuD1qjEaWh+PG
	9rZdgfG9M9r3s0Hw2+mkrV7pnR5zz+LFMAxLaq4x9iBPvOPgQk0+hHYTO16cALbCH4pTRL4bMiq
	J0QFvWArRP6nTZGKxSMH1L21XO/TAD0z72eeh55O4ssd0Ai5ejzlR+s4/aybd4cAMboe1R3ldnA
	1sOc/F1cG+SUGlcXeVEcl5Ga6fU6dVxOWDlhNSe9MQmymfSNLmOYwoGuT/84lygVCgmi7gGfvcs
	JC/RiuSUX0WQKxVcAqLUlftY166+59SbsZltALh/3WL2g7GR5yX5pxr1mCyZOao641hAiJkATYL
	/UpriFyzd40L5ji6EsyyqNW1YyT+X6xWohyZz5n8FvqbZhUvq0UwQPA6Y1X8fhO3hAsMC/7qSSf
	Mk+lcyTYg89/mN3e1XrEvxF7+dq8v3hPgNaNHPwKF5ctz4rHpRlTHAXA==
X-Received: by 2002:a17:90b:1642:b0:39e:b7:cbef with SMTP id 98e67ed59e1d1-39e00b7d25bmr6619070a91.25.1789473019195;
        Tue, 15 Sep 2026 04:50:19 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9baad9sm4943498a91.4.2026.09.15.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:50:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: platform: mtk-mdp3: fix resource cleanup on remove
Date: Tue, 15 Sep 2026 19:50:06 +0800
Message-ID: <20260915115006.2409591-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045027_613870_650A5FB0 
X-CRM114-Status: GOOD (  14.37  )
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

mdp_probe() has two successful initialization paths, but mdp_remove()
does not correctly tear down either of them.

For the main MDP instance, mdp_m2m_device_register() registers an M2M
video device whose release callback performs the final resource
cleanup. The remove path only unregisters the V4L2 device and leaves
the M2M video device registered, preventing the normal video device
teardown path from releasing the resources associated with the MDP
device.

For secondary MDP instances, probe returns successfully after allocating
an mdp_dev and storing it as driver data without registering an M2M
video device. The remove path does not free this allocation, leaking it
on driver unbind.

If an M2M video device was registered, unregister the V4L2 device first
and then unregister the M2M device so that its release callback can
perform the final cleanup. Otherwise, free the mdp_dev directly.

This issue was found by manual code inspection.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Fixes: 4294b9d6c8c4 ("media: platform: mtk-mdp3: avoid multiple driver registrations")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f412aadb5996..bf5cc20af715 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -374,7 +374,12 @@ static void mdp_remove(struct platform_device *pdev)
 {
 	struct mdp_dev *mdp = platform_get_drvdata(pdev);
 
-	v4l2_device_unregister(&mdp->v4l2_dev);
+	if (mdp->m2m_vdev) {
+		v4l2_device_unregister(&mdp->v4l2_dev);
+		mdp_m2m_device_unregister(mdp);
+	} else {
+		kfree(mdp);
+	}
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 }
-- 
2.43.0


