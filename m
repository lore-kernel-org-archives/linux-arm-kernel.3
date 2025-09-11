Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7949CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=; b=ORizEQNjZyLPOqv86Gn5/Dm9SG
	5G1473OJzBiEWtJ0hsBcoCUbtfDqxwub87uTWPtsmwmBbJqNzFcu0Mo8VhHS8Ad1VABQF9gMkzHOU
	fxzZU5vpK/NoI8AHLyhnxwrF/EsJOkO7TxaGZ/OuUjNIpS+dhNDGoHwo/8tQQJs1gSDhjF/jlAzA5
	Yz/kzaVLd5Fw3Zc6Wo9SIh2lCWtJihLfOMWH6KPT0oi2V+PGQnSWJzIhqy4c261y4MgiuS6Fovhgb
	Yy3z52PAS0u+5hIwMXJ8nClz6TuwpWSBo/vHBgqLQVpjYQAdGB7nl72hAV8p19ockncFMzPAnnHwt
	BhrGi7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhXd-00000003IJA-3H1x;
	Thu, 11 Sep 2025 13:40:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhXZ-00000003IBl-1CSZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:40:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45de6490e74so7344595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598043; x=1758202843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=LuzYoaeIwBP/661kiEex5XMCP1X+2Bogc0ZF8mEvAPSOjDLNgnOFQ21d3eqlge23Qp
         c9rJXePqnILKsmkh1zb0i843NKQzTj4szlTeM//DnFdu1SiUCqoN3uJsxdmg3Py5E0xc
         93Io+NosvgD3g/AR6siuNSCwzLm+PfS7qImaOzwccrVk9V3tkGBqzagoAtrhE+yau2Od
         AzaV3Y1STZ/xZHjNz6GlDIA74eiyc5AH5ffmdxNt9HnsEvHiZuUB+nAI4+2ABK/tDNME
         16mf2CcjZiJuoJvYRE00hNlqKIkZNT1tRTjsbMc5tTbYHeJ0knQE5t56+fV8KF2N03nd
         /YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598043; x=1758202843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=LGxOD2bDEbQN5ilcmzgLbcQHGIhIsiNbnyBm38vRFDpA5KiMOhD014jpIIlfarvrEV
         jiINbvAJSbuyBS716PkBeeWMQq7pEwFVi3NEGYfZ8h1pyr23jDYB8IvezduJCA7RuwLR
         NvQZvmBZXdO0X7VTt6Nqtw2gGhOkqX7RubMlKiBl8e29zf7IzG+RoTHx75IBM4M/fpCb
         mEMJGVA2K90MufzxSh28zDjoW3qKMi6qXxXZ1WuvjVLeLd8VXc3UUwlkBQ6wsbq2ME4N
         Z+QNLVmfgWMex68zduFJsrqRTszGfkMNXa5VgZtc2Za6ZdjK4v3Zk9Ja4tEUjhrjB6/R
         ntyg==
X-Forwarded-Encrypted: i=1; AJvYcCUllovOf23K2go6fHuSGZxIotuGsn5PA5DhAjj6iCKozX2dT64Bhon16DxhT2RPaImQlYdCWLrK24/y3VPu+5mC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1r8q/ARGLhm0fMLA05b0pHtWqOSueTMGGDmOD8gNSXNuLh2VF
	3WqKPMW5K1MAqsr54PI8d354YHr9WF8mycZ5OKIoNwzs1x00HcHV8h9f
X-Gm-Gg: ASbGncsSB/hbQNgzwHGN+9HnGORsuA7mgE4ai+ICNLam2MAm9kCjEctTUN3nDD1mfA2
	v+oi7Y+A6Oj89R7o5QnShmSfpY+99b8fXgq7WRHdTgrLOYDvlWV2jqwIX4X63WF9OKnk+xg7eG8
	AApTjCgkWLZBOvfIvPJgID3+BzwNxLncJqiKMZBGkGAYmZIzYMPMdKYMlW17noPd+Qckff5/V4L
	dCNs2QOW1ErSl8fgLnRi05I4951WvpJzzEHWWB3VYaLlgQ6n801YkDoZphrJisrNIPqUYDcDZSM
	kMrC4awG9hAI/Wm66/6J25v2rwr7Bd0e07ZWgs150LvBOn+W/sUwBORTcfZ954KWE2gBcCGbLXy
	HFfAgP/nRT1MyzSHqNL1KBkt+sZ2hXd4t3RbJ6RIX3GowgD3H7xJIfkUAzceTOI9cdsnyxRKdSp
	fVv1NfPg==
X-Google-Smtp-Source: AGHT+IG2KpWHVxRYHBojS5qhqOAZS3ZPHK9ADJy0kEMpbU3Dfi9X/AHkq0y0EQaVaEvtw7HYElj84g==
X-Received: by 2002:a05:600c:1d16:b0:45d:dd94:7c09 with SMTP id 5b1f17b1804b1-45ddde955c3mr180709415e9.1.1757598043155;
        Thu, 11 Sep 2025 06:40:43 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm23413475e9.23.2025.09.11.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:40:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v17 8/8] MAINTAINERS: add myself as maintainer for AN8855
Date: Thu, 11 Sep 2025 15:39:23 +0200
Message-ID: <20250911133929.30874-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911133929.30874-1-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064045_412329_9D7AAA17 
X-CRM114-Status: GOOD (  11.51  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b81595e9ea95..818fe884fb0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -740,6 +740,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.51.0


