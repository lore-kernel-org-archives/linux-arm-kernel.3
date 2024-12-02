Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E097D49798
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JKkTbQH3r8XT3o9ORFi7gb1jWbj8ogQLTpCR2fybI4=; b=UxZYoRmxZlJQrVY3Y1laG/Rtj4
	qPFpmfQG9MTJpNYtHjqvQTN7Rb5MaAaRYbXI+yPZgPcMo/lOweswSIvjzihSc0F0Vu1LvuB6TKAyO
	/YtWUJtuaKUf4YZ0F+WhVzov3EJCFTgR4fQAWAGqr8nPHjCZalSV697sY32VL9kvN6XkopWL6zYRA
	0US0LkFO4xP4PpPrgiTW/zR/2YuwqzfA8MuhMXGQizVSAD6SawX7P7p9uNOr7Sahe+z36e/5VPMw5
	2tUWRTza3fx3awB/PPAuSdSrGXJGTG71EeFYFG3AKfWlYpsOrD0yhAPcYxasFHlhNp3wzE5BakIDY
	a2uRkYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx8o-00000004x7k-2MKW;
	Mon, 02 Dec 2024 03:30:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx05-00000004vC9-2z1P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 03:21:30 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21594d9f540so126915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 19:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733109689; x=1733714489; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4JKkTbQH3r8XT3o9ORFi7gb1jWbj8ogQLTpCR2fybI4=;
        b=oE+xsZSivW2S1KIg49m57Rs84MOYB3r9rwedw1IuaNQGiCZiedguvcaXsx6hBK1xpk
         EOwK6cfRMCcZE3sNbqczk6Ny891oCZVI0Jb/BvItH4ZdKTYPIu8mjvE3F+O7cfuV83Q1
         lcasmhOOXG9J3LB/IAk29nVJDI1I9PqlNDI/uAe9x2XrkbIEyvRZOs+YH9NnzTW0jAp0
         aDR/jfUmplWBE+k7Ufp8Q38KUOkOQxWSSm8xLFhbrrclsXTgSd3dCQpaXAez3qHy8+P3
         HePy9zChk2ft8ITo+yqk83xfUvPU/zw9kefnP89NxKHL25dRcRBamKJgqYsUKOoypPfk
         iI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109689; x=1733714489;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JKkTbQH3r8XT3o9ORFi7gb1jWbj8ogQLTpCR2fybI4=;
        b=vDjx0DdXD40Hkm9bVcrCtxOgEBIz3FHhW88sO1UsCwj+BhSNnL8HiVyGvXVsdGa+1N
         MUj9GW/7Ag44/ucWXJ/RC4lBFHPxl+LHKXtNQOwgw+hg3Nf/b1mnfw2cK0hdjucAOxTQ
         nGDr6yvjVYkEct3UF6xPl6DgN78TzTVn+yC0N4YRs8p8SP+hfp0sThyR3KqS9xvA4p6W
         z52tqfMrby/oMms6B8hYIoheFMH55ZXu3pFQZSyhiqCJrcz/2PPFkxtUmqUMdWNBZDlq
         GnkdVI12X/+lxHrELaIrLJhqi4eGgCeo3P/cLP5bm+Y227f1oyHyRybwcWzZ0/5xziSG
         cZjg==
X-Forwarded-Encrypted: i=1; AJvYcCUOViuC5taUjCFqi7HsunNOZbTRj8r5YBjwOhpm8ABZGTZbXm9JLCMPDvmshhgiBSdVZaZMYsf14vyrIVxq5loj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0hFu3KSClxLEVEPAvG4pjHixy/Jj6UrDQgCw9BeCtp1pHv2Zq
	IQEB6UcutlnHpMqrTmIymbDnhqloU8kWoWRTOhbP6YeoUyWyIubHkQsjHutdhpc=
X-Gm-Gg: ASbGncs1DRVR2Akrv7q4C6//r8YLIVW1sUchePB81zKVOG8i2sEsVYPWmCWJvEioI7C
	RPX8/YpJqCEn1QUlvF6ww7lRw6dW0eZk88LlLGYoWNjZx7Kg8KoJfnh0R0e6Lk3x0+ibWhNlfP3
	fFFuVAKyWqUYTb+sJdZy6bRrjBrycdf2oU2/+f9NDg6w3V3ASskZM0sV5sLo9ObR8OnL8JaPlyN
	if36afygqfd3jgty9gJkefNQ6uhXXZdDF1K+3HvCyxO/FgtfORhw0iS6oy0cOn1QfYJO5ze2SVN
	UHXYfupsIBISNw==
X-Google-Smtp-Source: AGHT+IGl4AZx7btGELbwfsvBPjCZ+LL3bFrNerOHcMEQPSapSZDS2D9CkO8xmV/VxpGUqxWhl5v/xg==
X-Received: by 2002:a17:903:491:b0:215:2bfb:3cd7 with SMTP id d9443c01a7336-2152bfb42d7mr78626995ad.10.1733109689222;
        Sun, 01 Dec 2024 19:21:29 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521986004sm66305725ad.184.2024.12.01.19.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:21:28 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v4 3/4] arm64: dts: mediatek: Add exton node for DP bridge
Date: Mon,  2 Dec 2024 11:20:34 +0800
Message-Id: <20241202032035.29045-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192129_757309_754B9E6D 
X-CRM114-Status: UNSURE (   9.92  )
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

Add exton node for DP bridge to make the display work properly.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cfcc7909dfe6..e324e3fd347e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -424,6 +424,7 @@
 		ovdd-supply = <&mt6366_vsim2_reg>;
 		pwr18-supply = <&pp1800_dpbrdg_dx>;
 		reset-gpios = <&pio 177 GPIO_ACTIVE_LOW>;
+		extcon = <&usbc_extcon>;
 
 		ports {
 			#address-cells = <1>;
@@ -1656,6 +1657,11 @@
 				try-power-role = "source";
 			};
 		};
+
+		usbc_extcon: extcon0 {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <0>;
+		};
 	};
 };
 
-- 
2.17.1


