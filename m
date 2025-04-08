Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64196C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8+Px3MNovGCNZt8UsunlJcPOCLx0kxZ54+UZR9AeRcs=; b=AX21QsjH8Qx9yjyNU5Njhno4ew
	9ixyLPT6QRphI+UijlOvKD8KIGTebAsoTLQ4TAGQK7xSJcRenKlcKkljDjeo/BusxtGrsHW9/k2cq
	5dcGuSuUWHqMppfaQwtq/qi3Z/HiuCfTaLFQEUxomYI6pGIxPXYpMA3DDuvAa44G9UA+GEQliaamN
	Rlm+rv9KDXUQbV2d1bLhRXNJawX94k+8AiT9Qzmq1VbUTfZ7dyGBXlYusbdD2matwBZm7DlZs3pUH
	2H9EaLW1mpnV8txR2l8TK9qhJT4cOXSyw/WfDQjIJh2a7w2OwYFRcA4Ue0fJyrSvgYrILfU5sklOO
	HN2g1dAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BNk-00000004jHR-0WSG;
	Tue, 08 Apr 2025 16:01:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BGw-00000004hju-1Nsn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:53:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3440962f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127637; x=1744732437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+Px3MNovGCNZt8UsunlJcPOCLx0kxZ54+UZR9AeRcs=;
        b=YeiNfhX28Gfz8KenzaCjNhRPXgm6p3vs80vc42txmVSPGMU6hrBdwTivxKl/Ts4Cal
         Ue791Sk6U1sQb8gBoJIX4PZn4qRmOPCFicgQe4pN+Akj0psV5scjgAmpNevf8Fmy4uEN
         Io0jw1K0jOdFGZyfGr0gyxtUqvxY3Tug67kjjbfAc2iHVQYlhvLiQaMecp0NOVLjce31
         O+4XfCk/DL8a6mMc2plVSt9l3OXMsZgmZkfnEkSbdoB6mw9KEqFMYdcCz9qyYsMzdA3W
         YJy1N3UDpIgVxiqS3lTDg8WVlZeWrqtfzTxWAe/Gd1wV++0pJjQg6sINOvt/WFJDUrEQ
         9EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127637; x=1744732437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+Px3MNovGCNZt8UsunlJcPOCLx0kxZ54+UZR9AeRcs=;
        b=Mg9OEabNfu1/wY7IUWmRO9St/FlTBevTqE3kW7Xzuv8yqmfGeGifNjQbXmqnFb78Oq
         KjPmzzhZ0Y7YzZCmBEVsRdmgLThFEXpupVOgL3Mh9znkmioIHroOkRG4onmQhVpLhBJB
         ywjRLdHqLjiWjNxCWXuKtcnYAi+wu3xfOYh5RtzeNWvVFxA8duLWQfjBBp7fcpx0Ov8o
         9plaTEZFEGSUQX2vk//iVqSLAyuwEMg+WX14l7AGDnJjSqA4qjKSEvNYSWZdCtImgPCI
         FG07CqQeMIugRW1Rk0rLpMDuRY7Opn1MjySifYiGDEi/tLYMQSjL1uSuIYjBCic8vcuP
         5WaA==
X-Forwarded-Encrypted: i=1; AJvYcCXOka7rXM7Xin6bryCeNE0BLYDcuiDhCRsRf5qXnGArUud6zrAyCEgAsdApvbUUvtbb5qZM3tbfQjVGqirof5ZW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7oQStoM580LYwaPRqulAwN2jBZ5Dc7aUTu94zkHbZV7MPag6j
	4iPgREvJZXKo7+jik4Zv4Bjzt8gKYBpwcRcigb9PIrbyrCZbi9cT
X-Gm-Gg: ASbGncuZEhAM8xR2zxbYexoURsc+xHhhcYHGfd3iXX8vGMi8bqEA0OSykn7kNY7BAL+
	v0UiCPyxw1NoE2OWNhIqLx/pmC+PK7wsav157pxcpuIn4TeAG5U1tQOGrb9QERX4h61xKQ00u+L
	sPgyGy6vi1K1ct5l5OeCqMBGuSJjnKjEpz0Z2xT0C9panJ7wIv53yW6H7AQTFWQ4ouu9BIq0SyB
	JZWqxyYUOsl/yblcsYlFqXKgFHBgjtld/6i3aJVl3jdspqsGkdK45Wj805+iXn5Z4OWnAXvVZ0C
	II8W7mj/+NjSwHVALnbCuNvcVMlD/J0fnm04qSkeBevvLHGwa5+TJOAIc79yAO0wOSHvljIkMts
	6SCm+GpPsoKn/4w==
X-Google-Smtp-Source: AGHT+IGKgT1wYnX4U27JAJ8wEuYOxEWRsG9K0AGJer0F6skTSfmVGfZxG8NgmVPLMd/il1PUjm2D+Q==
X-Received: by 2002:a5d:64ec:0:b0:39c:1efb:ec9a with SMTP id ffacd0b85a97d-39d07ad8ab2mr14241395f8f.6.1744127636536;
        Tue, 08 Apr 2025 08:53:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c30226ee4sm15716615f8f.93.2025.04.08.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:53:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.or
Subject: [net-next PATCH 1/2] net: phy: mediatek: permit to compile test GE SOC PHY driver
Date: Tue,  8 Apr 2025 17:53:13 +0200
Message-ID: <20250408155321.613868-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_085358_367897_6DB4E570 
X-CRM114-Status: GOOD (  15.43  )
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

When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
dependencies") fixed the dependency, it should have also introduced
an or on COMPILE_TEST to permit this driver to be compile-tested even if
NVMEM_MTK_EFUSE wasn't selected. The driver makes use of NVMEM API that
are always compiled (return error) so the driver can actually be
compiled even without that config.

Fixes: 462a3daad679 ("net: phy: mediatek: fix compile-test dependencies")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 2a8ac5aed0f8..c80b4c5b7b66 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -16,7 +16,7 @@ config MEDIATEK_GE_PHY
 config MEDIATEK_GE_SOC_PHY
 	tristate "MediaTek SoC Ethernet PHYs"
 	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
-	depends on NVMEM_MTK_EFUSE
+	depends on NVMEM_MTK_EFUSE || COMPILE_TEST
 	select MTK_NET_PHYLIB
 	help
 	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
-- 
2.48.1


