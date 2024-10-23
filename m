Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9B5CFA467
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=; b=TSEVire/kLbrtTDP7sarGrJmuc
	0Iz7xxOxsrgiIXhYZcAsXE26x75sieV+viTFAKrwZSsfRFwJr6jIOpEfEbde9U+tMsmvkbGos4FE6
	d1gxyIUob7vCO+7jm/wxnnabBRve/PLE93lbWmAFM/BRZ3O7H9nrPCRqWhGVWvYTkU6Mm8iXe2I5u
	z3W9lqD4VXJiKrJhx2Nk8L5L62imfWYTB/AlLIJvanUE4hvHng7RgwMqbdIgGIzwq1GT4NKmb0NP7
	ILsalsFRi6dPaSGdr1bUV8B9JXLYax/uOjNCSWDBtMBt6dZJD8n3Wbf4nUeSoeOu6i5i18lDsgKQq
	wIwdQPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hfp-0000000FlvK-3du5;
	Wed, 23 Oct 2024 20:09:41 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gni-0000000FcrM-0Zdl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:13:47 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so287862276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729710824; x=1730315624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=;
        b=tXz7G/1fXriAf+Sfci2FhYJnWMyiVrILtS4nN1vRS5J2Up8TiFemPhaVl98gaKYtfA
         xMIg02LZyVmysMOGJNNoZpZppfoXPVk192dzWKlQKTTDn6BOamHOeH0Om+0LR5wbSZDH
         cudugThcy+6A1mTwz6tdCmCIJekGbFbjJMkc16t01slOkb3x8kIyJfrI1s+j3Xq8ITBu
         qjZPtnTm4dIk5of3hSNdKUs50M8Yqske9AE/hwSyQ6NNdMTVP4D4yc2ECayQLYyfIZrk
         DMeJ10sylwDnSQHtvzc+d6+tJc8ozSGrilJozb4eO9cFhEDXODKLRkswSqCSgMz876y7
         9WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729710824; x=1730315624;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=;
        b=Hy/jliC9uK7E9BxJsIXnohDQcubhwn+LtsLtdYQjHMXkIW2KUuKnOhFA9VRik5E/uJ
         gH73DLPY5KoQ9kRKriDjOdHC85CEg9Fu6eyMJfUoYdYONNuSGR0OEefravs4DTxgorav
         o8fi1GtNuHSyzeVA7VFArNS4nQgvyrFJtrZZCTs+5JJWfUSyVYFZYN8xWjO/CXN3c/AI
         SnqKUa/VCjaGUvhk1yDqBCfyHj8PF7lh6dQ3io365MtmzPaP6B/Vkp/Kst3XmuQiSdJ9
         Jh6Vwn2E4OFpov6AdySeW+9DhTgz41cr4aY6CcMaIQcs5e/7PPcHv+FtRKF/Rjg8bLwD
         Nmvg==
X-Forwarded-Encrypted: i=1; AJvYcCU9aajz6HYX/8uv6oUNrhaOgKcUu1uSitPmM9ddEMf6HRGgD4rZptAWFGiDKtGcrZMJTqKJY/o8qQz2K3gdoxwP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe8Fp6vgDEl2U7M3opC3wh2SLJ17wDdC2l8Iie+5BfqFqbED03
	RLV+0YM8Rbdyd2t82iJ4bavcs3yGGXj9/fnYGdhXiAAnUi5X3Q67NST5EDkNkKmqZps2uFvw2IN
	xlkAZSMnTjlwAPA==
X-Google-Smtp-Source: AGHT+IGtw++CFsHM6UsXTaa07P8s7oTXdItvei/TRQB3GwOD9DmownHZlFBOwrDDCuKJGIw70cl6vC5daxpXLbk=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a5b:602:0:b0:e28:f2a5:f1d with SMTP id
 3f1490d57ef6-e2e3a632bffmr3981276.4.1729710824576; Wed, 23 Oct 2024 12:13:44
 -0700 (PDT)
Date: Wed, 23 Oct 2024 12:13:36 -0700
Message-Id: <20241023191339.1491282-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH] drm: display: Set fwnode for aux bus devices
From: Saravana Kannan <saravanak@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, Jon Hunter <jonathanh@nvidia.com>, kernel-team@android.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_121346_186783_955DE4EE 
X-CRM114-Status: GOOD (  12.57  )
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

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with =
backlight-lcd0
tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with=
 1-0008

Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
---

Don't pull this into stable branches unless its causing a regression in
older LTS branches. fw_devlink code is complicated and it might end up
with missing dependencies picking up changes piecemeal.

-Saravana


 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/dis=
play/drm_dp_aux_bus.c
index d810529ebfb6..ec7eac6b595f 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 	aux_ep->dev.parent =3D aux->dev;
 	aux_ep->dev.bus =3D &dp_aux_bus_type;
 	aux_ep->dev.type =3D &dp_aux_device_type_type;
-	aux_ep->dev.of_node =3D of_node_get(np);
+	device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
 	dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
=20
 	ret =3D device_register(&aux_ep->dev);
--=20
2.47.0.105.g07ac214952-goog


