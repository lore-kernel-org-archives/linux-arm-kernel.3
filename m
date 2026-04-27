Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EDEFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=; b=IG0z/7pwwcLBurqDLnjPIkPLjS
	snlOXxXXu1X4QCIb4vNosbnQxDerEZ4u9YH/x0HECDmz+ylfvbG4veohNOYkg0bvehvNeywWSe4uC
	2fU/jSJITaaSDJJXsYn+twRLFZ4hTi4fUuoRoaqI39ca2oCdKx9l9nO0lVeb2x4oXx3x4uEd/cFge
	Y5eAtaOF2j0rKjtYpLNzhhVpqf+o9D7WeHfehzf5lEGqVUuxwqiW1745MiQf7UyyDfz1Lvt6BP87j
	8WGJR5g5AQkKBmRFNQUmF21vtg8tkMUgCkKvSRJ6FZ0gL19yVN+WKkn/ByKHtp9xWpf1FWAkci2j/
	h9ivhHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIly-0000000GeIN-20JT;
	Mon, 27 Apr 2026 10:01:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIlu-0000000GeHV-0mID
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:01:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b23fcf90b2so95104935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284057; x=1777888857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=jAmSXV5eO0xeXtoo5oVpd0r8wvvtKSToDfSE8O9cxoYDZoOdQ8nOl9pEF8qyikkwPy
         IsZP4NDFgFymMiknoY5XAJ8pzob/g1UwZriMQntz56AXkRYePuMmCUh5GWAqBhOxBwbV
         G2CRUGK8GBi7VEOsMvk9IbTGTNg7ks9b+Yac5aOVykhMd0IhncQZ7qroXCAljf7qH7GP
         BbuOuyAsWaPMKeKbFOKO0NM2crHeYINETksuYRqC4PPAZ45JdmEtX78k7YudoSsYAb0v
         Ixi37fL9wNJ/PRj6fB9iCBNjC7MSCcf/QtNZmsX4ryZnNybvaHQcl81kDglyvwQ8KCBv
         Q5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284057; x=1777888857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=skzjHppbEzkW3OaWp/lQf8KIUZeMaoTAwIheQQur9n4d4vxSksaYDsJDzHclDpyFDA
         //eKzYxiJLIVq9TZG/JXwPjvLC6tJlpk2ySzuvjWFUMlMuMbP9Q+glU31ToOe/RZqYLT
         BxOZ3MF3OCATp/LyjudAViLLzS+Vk4xHwvdvIRPgzFFnVx7QH3+v96FVlGqBfkhJAA+i
         CEk8eeesDmhk2KLXTRL3nZKlvqv8XzNSvMnQYD6oDd1/gz2VcEjVUaNLLeDoRz0xL/LE
         zDked3vUHJBLyTPZJP9flecRiF7Duzb8pcj/fPpjPqlHSg8F9n6DW8BOb4Vk4CpYNic1
         Ai7A==
X-Forwarded-Encrypted: i=1; AFNElJ+ggcTSZCCaI5qedey/be3MfU1LU8x7gAsjLnESq988ga6pvXyk3tVgcSWHc4B+o+qwQ+DJLK27LTNwNlTy7KuC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx11vYH7eLJfPyP7Vjrcw92DENOyxmu7wkkwGRT0chXCSYh12Ae
	H3JusDhM7esMd5fwr35rkCb3/8YrnYGGJ59gZ0qXUWRFQLd9HPABP5c=
X-Gm-Gg: AeBDievyFwO9VepJFdsR4o2Ae3V0TsHI7QJR9SfO8axncXHxFvB4GCIt4nJ+cK2kcwU
	knKxdOJWoTqEFVS7YJ/m/vIG6h6ZnBMC8Pu2Wcv1Vb6Qm7e5m3qwnz/ZavnbEjf8K+b0U32amOL
	AZ77NWx8CM06JF8andmVJIR2i9xkJl6q0e2T5JTyd8vfKRU+1iUwhmKuaJtZqQvUc3E0C0JLk31
	wHC/wG9oJxfHBv3IXrdq4xaYyI6BRslPv5iiJj5bBNlhI35o7tWvvYaHimPjaGblG2wKR3KZqxF
	RJtcwNRUPPJgBoa3YFXP+xbqDOo8c/96V540E/Krjv8zTWiHXQJu23anlJBx61YQCAL1jPZeGz6
	v06NZum/GR+yNY2Hg2Y5fr2/iJ42xo9GePfzR9UbWq9qXSr+PvTCrA4Alv64K7TL57VORb0jAjv
	gwkTmDQM1tSfpaZY4NIywVZxWv2vQHKNP8FJbhF+53dMVrDgJZy77IDyyqLopUn6wVliD13X++U
	UigfG2FPbU+2pQ3Gi3RgzQD96yQT/GDxIzxFVNxBGIYxQ4=
X-Received: by 2002:a17:902:e54e:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b5f9e64c77mr424633395ad.5.1777284057141;
        Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff713sm304240245ad.5.2026.04.27.03.00.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 03:00:56 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: cedrus: clean up media device on probe failure
Date: Mon, 27 Apr 2026 19:00:10 +0900
Message-ID: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_030058_227998_23C3D13D 
X-CRM114-Status: GOOD (  13.34  )
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

From: Myeonghun Pak <mhun512@gmail.com>

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..2c25654640 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media_cleanup;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,6 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
+err_media_cleanup:
+	media_device_cleanup(&dev->mdev);
 err_m2m:
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
-- 
2.50.1

