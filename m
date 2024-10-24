Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79C2D0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=; b=z6wo+OJpr4pRwmMe/HsBgC5tc9
	sQXdQzB962mGxeZGieoO2Qaila5vkYVQyvnBoniSE+CaHa6QD1X6k+mxz4uygOoGX1oUyf9N/Rr9h
	F4dTE5dQzmrXcKO5X3IcTQcbxJ8FGonraEzKiEQoziRk/zIceyhfZwyAwGaPhDyHpi73RX8yeh/IT
	D1euKbGptiJNY2BYEVxTgxIrfIPbngzsaHF5gd+KwGpZGffxRVDCBapXYJQmjLVxjfbReFZHuQVef
	DXyHjJOgPlV2/YGq9gcG7Zz0dZF9T5rJfx2wKm7EeAjAiB56VXdvm5UhsEr+tXLxxmGkC1/BrPNgx
	+dkCx8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rBB-0000000GtSB-1s7f;
	Thu, 24 Oct 2024 06:18:41 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r6g-0000000GsUF-3CTm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:14:05 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3497c8eb0so7635837b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 23:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750441; x=1730355241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
        b=IXgfvbYsY1d1Uw/bAd3dB6/xLCclHbu32zXuO3GvjhL7npcJRsFYVrb+fGvlKoBRN0
         FfDjNvnVGTCvrlf7gAWFUQGCSA3HMLGBI4+JoNBSWE2RSeWsBr8eIpg3OYpWH6xUjR19
         qvBX8h9RuXV04oBKHr4cpzp/5f0ycG20QYlgBmZEUlgDw1P2Q/K1uDKQZ6iwHJ0AzGxP
         KFGnto3GNLU0Lb642lPh/S9Mgf0mNrjQNwphZWJdD/OsA/C7WSuKPD51+W9GlViGwvps
         W/Jvo9ZlyG8EdIHYjrRJ8rYQyolFK2MZ2wSKCsV2KAG0GMcKwu8prR31KPEKJyqTrH4v
         Vk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750441; x=1730355241;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
        b=CQlf2M0vwBsZqjEKU+Y99k6768NbkYZ8Dox9lY9KPFlLa1/2KaUHXE78G/SlMkr7at
         PwyWaR3apRzHdxesLPc6WT14Yf8vXGYf4BzfUI3r31EZE9S0HgUxAyJFjBNiprl69+Gs
         tjZcTyZXCY499zkQIfE7Q2GInphdk5FaU9nJ0Dhfeloset+EcuIm+1+L9EVUKZIaf/DM
         MEvc5zdBePgEM3Tv9fWgdOlCeBmH1dPHeeM0FIDa/tmWKtPt3jMGqAhSRzgEx+Oyhabt
         BGdraCGvRlWSAP5uigHj/GDkvobvq/eGkI7/53Um8GVJ1QJv8P5rK7tadCl6x2rtvcyA
         XHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTtZChYpvniqyWe11JedYTsaAAGRWcFF2Glv1YW/S8MDOKiEOWhTBWsI2/d+yosiJ5RvLIwh8e29aVil70O2R7@lists.infradead.org
X-Gm-Message-State: AOJu0YxdnAtBn1K179oM1QJou0/9gcKZKGGJRO6THBz7zPlFdX/VVTkQ
	To+M5MyVnHUdrAXFtH6MSqw7hpt27PbUowD+NgmafLTFdYZ0USVjhvFhGogygfUvbp4Q1lS9P0f
	+O0VFvhbK/0EEoA==
X-Google-Smtp-Source: AGHT+IEvWKI797qzaVIyJQytUKUTuDrxqDTilc69F1bH77+J3k5wYMBvLRY6cYuzVgsPwwCo2eftygSjpmQuXoI=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:9c06:b0:6e3:c4cb:689b with SMTP
 id 00721157ae682-6e866350bbfmr483267b3.4.1729750440665; Wed, 23 Oct 2024
 23:14:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:43 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-3-saravanak@google.com>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231402_814434_C99ECFE9 
X-CRM114-Status: GOOD (  13.26  )
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

tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with=
 1-0008

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Suggested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cfdb54b6070a..0a2096085971 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port =
*port,
=20
 	device_initialize(&port->dev);
 	port->dev.type =3D &tegra_xusb_port_type;
-	port->dev.of_node =3D of_node_get(np);
+	device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
 	port->dev.parent =3D padctl->dev;
=20
 	err =3D dev_set_name(&port->dev, "%s-%u", name, index);
--=20
2.47.0.105.g07ac214952-goog


