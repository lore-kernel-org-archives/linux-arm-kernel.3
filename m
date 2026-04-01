Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F1F10FCAC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=; b=qDYnGyqDyq3nH+Ob7e2jeZ80dG
	ja+RA4d0HsNpvjq4PjxI4YhDuU+Vim6Fmr38eRG5asSrb3NacA5AmTUUXSu2ToadxvEi4+24VYrVA
	MdrdvE1mkPb4L59DN07ER/lCbSAI7IxcS6SoNUV5eG3IYkG3+Tmue4S8AeDYTvwe/HpjknM8G2oAe
	9tt/QuRg/m4x5rgbiI1tCTwuJ0HSx3xsUjb4TK56zUf9bbsXGpAPRYAzVnksiO0b5OBB4rdv2ovme
	IrM56P8N3EQ3MRgJlB4nuWZcn9ZJt1TaEKaHmQ9Ktug6oGaVtpCvWEAvlXfiD8ei0GUgxTUosvI33
	k2/Y6a8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8125-0000000G0XA-04v4;
	Wed, 01 Apr 2026 19:15:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8122-0000000G0WZ-2AeQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 19:15:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so183506e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 12:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070912; x=1775675712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=pKMa34sKYUs0xp1DRHbzKUsYscLikQAx8YNkaX0EwEUuKazzkRZNleCiHwq6BcfRjf
         zhs1azC1aj6BxOZrd67xts+8hRnFUxdhdM1j2nHdGHfP3KkrpD4LlRdrJkvk1DQ/SYen
         QmLO+2PeOS9tJ1aJBIG7Pluv6e5tsSdb7FEjkBTvtj1imtT/AjghLK558Me+Ip9OB4vj
         j5AVLrGs2OMMnIdUrPn8Mij6S1cdTvwfqRUyZ7e0IprUbFau0G9dm1qQ9+g+hr5hpaCY
         xxt3HzqIcYjIXpfCQ7KJRK0t2/2XfKIkwDoH9XcHZrmZCT7Thn+YD/zjZYve0S+wHVM2
         Wsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070912; x=1775675712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=CGLB3MAVV4uyFncNvh/Yi9qXsQt85shN1PEeh6Y0d7UCzx+iiva6+PwFQDB3fr0Bmq
         y3cqq1jgo9oDKW3cYWvoHtURe8PtFW6EBEyqeTMtrrryWwrwkfCmCpRpMoOZ3ImhZH6d
         8y0Es+gekaw/mcLbD+nBJB6Ekk+XsFcFIJn5i41j/OW3S6U2VLS/yoEeeCUjj3FTChGK
         RItpL7lbOKgi9Jj+wTGmUaO6wm/pHrDxNGJuWIE14a6Z+0DvI5Fpchq/JPwPtQVvstAa
         KZumALNQ2e6QUKyFO+v4jgaoo+TkMA13JrvNLcJCZI6iI1xnQUFPgrONZAPZzq4UHCyx
         UFAg==
X-Forwarded-Encrypted: i=1; AJvYcCVisJji1jm1OKWewgGrtaYRYN03GbqpjHcFSbp7LqkMXP6t19KSZ4tkRf9quJpRO8kGxo/OzEWJQ6S7ZtZAvmqr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6yYBibbisCJy58ae/Tavdx+63z1e3mEq+TpAdg/ruQtNdzkXW
	EXqb7ikHI4anUigsvwrl59iGzvOX5umJAShd+ZQDPbf5HtE3HGUdGA0g
X-Gm-Gg: ATEYQzyuOivzJRNdD8OEq7WOeUKb7iVZ5cL+/JdtoE6U2Xm8RZhlAA5V4eB7nmQc9vt
	dPFgFvRlaB5GAsSqsLmhOTdhKer0CNtjl6mdJiWfah4ezb9C6S8A4+ro/pUfUjbCMVvixd0q2Sy
	ZB0mEhEuH8eaoCtau5Qj5RePht10COWs9AayZjpeb//r/0J38KC4jnfKYTTQugQ79HXQ1mNqdoN
	262L5CjYE4jYr+cTVFCm+I0NfqFiUPvnJ0lK/cYplHNAYlY9LNZ0RxUv0pfEtiWrgcYQjW1E6o4
	lNOQlBIaxG6R5ehMDl/K4RGRyPKWzk1/zlkZs4sAkWEKxAth71ROBqzAEvLNeoX01JOk8XLJZIK
	4A0+mKyAr2N4tqQ4aOn6h3uBHECo5pYDNMd4XaVAJtK6GNlmYwQy68ohpWWfZzsZ+Ar+8DsWQOD
	/w67g03nNImOQU/JmC8/KzYhf+jecn8RthBaG1
X-Received: by 2002:a05:6512:318e:b0:5a2:961a:f7c7 with SMTP id 2adb3069b0e04-5a2c7676402mr92043e87.21.1775070912245;
        Wed, 01 Apr 2026 12:15:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:15:11 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
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
Subject: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Wed,  1 Apr 2026 22:14:41 +0300
Message-ID: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_121514_595720_4D2213B8 
X-CRM114-Status: GOOD (  13.72  )
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

From: Samuel Holland <samuel@sholland.org>

cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
like disabling runtime power management, releasing claimed sram.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
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


