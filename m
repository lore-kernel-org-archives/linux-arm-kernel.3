Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B451CFB5171
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 22:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=; b=fqmiYD7XWbnqDh/jqShV5nF4Y4
	+DcBrwLkw7g39SYYUvA3Oq7GpZU6PirTlhzMxD6XVGAst5kd8DNlkNzAHRabiawh3jrKHGdWNmOsj
	+fO8vk3b+J3zu869/NW148QuNLh7fmRonTzNUEkY9Mp77G44/0Y47B2R2oGDrb13cWA9Qpgn4qEJA
	803nILM7wsyxA7kbt+D9kF1Pyt/HdwuXXE94UllGEE/9ZCSr67R7rCN6W4vixOeBYpVLJaHOCHUXY
	+tImPagpphryRa/73DnJykY/47exT3BqlaAIVIhrHi2Rn/xyMy4P5IVauZead1BjrFxgquPcbp4oO
	UBzwBW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sDc-00000005YqK-1Soz;
	Mon, 06 Apr 2026 22:14:52 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sDa-00000005Yn3-2eio
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 22:14:51 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-38def541b0bso19388991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 15:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513688; x=1776118488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=sVIWWwCOutSx65NIz9jz7p1Eqxtj7l+Hd6zn++jqYBJzVtFZqyCxFG11nNRlW+ZqZ9
         cyydKu8cSGpgnWy2jwIV4/dCTJCWeRRbom0f/Ucpmh6L6uFfTOc32DZApYvjGMvYdrQB
         APUVJfe4DugSOZ+MM0XxVXkSf1vJYF94wFrukIADhfNjLaFKHLi+Og29Q6Hm2TLZW69+
         hE5Ly8sR0U773n+qYnTgRX7hvImf1PzuAJdE5gqn3MilVubR6Ca8vwzyxwOzfuPis6Ra
         mPjqeA3Eth+XZn11FGk3Vz9xKPcVcwMs55RToXkiHD8qOsUOhnnX3cQrK+gRwxmfigg6
         XgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513688; x=1776118488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=iO5nVYMeZI1oSbGvoPDLXzJoQLMMxmOSN6n3rEkzMiwWEFPJEyvTSr/Jo/HOvlUpDd
         RS7PD3+j0NrZW0fw+BREUZX8HwrzgyEkaDkCBLIJpmQZ4hbxAJ442ApwbJizb1uun7Nl
         fJVdTjUAD8jKZ+6ZmlatggbkvDscRWyGskHaiTU2lStogXZ28gn/rPLVyYI8kr0z395s
         W3QpdKJWKJwMqkOxbIKlwjjMtpwz5QVyw8KX5ydedXsIkhFx4/5WesPznSbo9E+3GRf7
         HoVbnmpbPW+Fz0L54ZgD7VYBKdXBofMwrnerkOtD5WSIDahuAHg/fayicutp++6qUhA1
         YDaw==
X-Forwarded-Encrypted: i=1; AJvYcCUenFYmVm0n8AlxIJNyd8Zj+goJuhPL32izA8BS6MmGuCrEWf64IKLa+r5SqRfQC/n8hvkJEJ/rIvFKIreKZPYB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn7UDsdkZlxZx1sa3JAHfXgknJojhNC98itFvjXrfYVDjxuknD
	w4nuNnqswByR7jBh01rbAE98JeLlavCyC3heU4o2iWrnqUSDqMPA7kQD
X-Gm-Gg: AeBDiethJmHF6wuwkMBKge+0H1oq02P5SIw7pxddMP5QYPGX1N2JgUmPWa4Gan+atf4
	8Us3ZniChsJbW8HwD62dRkFT9kMSnEFLb4HjWb6LHJstqgZUnf8SLhwt3g8EYdWAqIMgDYWsfTJ
	H4Qs7FRXR5ihgJivg9VaLfvALr04s32oQRQ8wTTmMUisdZVN1+fDrCmUM8E6mKJlLFRDWviEDZt
	TRbkEZht4hNpiVCu3afb93Bd3blefE6BmhylLsry6Bld111AJiEtZ4pNXewaD0/sSvOPd9JGqJv
	k0fI0O/ifUoM1HkkgHLQplCkZCuo5gxZ9nsRFGsV6Y6Uq3izvXRycLUqhzzbLD3AUK5hrfXOHiM
	pKHoz15lOpOffFC/k/3Qmfs7lOCbjOfgNn3FEX0UOr6jZiFPdyjjpc/DRzHrXF3ZV6yiYUHrCEK
	gUjohj0Jfwgi0JFJhJDnyEkt7CCA==
X-Received: by 2002:a05:651c:1b13:b0:38b:f0f0:e38f with SMTP id 38308e7fff4ca-38d91d78c88mr39211001fa.2.1775513688308;
        Mon, 06 Apr 2026 15:14:48 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108c9dsm31924801fa.21.2026.04.06.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:47 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Tue,  7 Apr 2026 01:14:40 +0300
Message-ID: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_151450_691604_EDF9454B 
X-CRM114-Status: GOOD (  13.86  )
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

From: Samuel Holland <samuel@sholland.org>

If V4L2 device fails to register, then SRAM still be claimed and as a
result driver will not be able to probe again.

 cedrus 1c0e000.video-codec: Failed to claim SRAM
 cedrus 1c0e000.video-codec: Failed to probe hardware
 cedrus 1c0e000.video-codec: probe with driver cedrus failed with error -16

cedrus_hw_remove undoes everything that was previously done by
cedrus_hw_probe, such as disabling runtime power management and
releasing the claimed SRAM and reserved memory region.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add more technical details to commit message

 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 1d2130f35fffc..ee0e286add67d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
-		return ret;
+		goto err_hw;
 	}
 
 	vfd = &dev->vfd;
@@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_hw:
+	cedrus_hw_remove(dev);
 
 	return ret;
 }
-- 
2.51.0


