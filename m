Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75711C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQ6Ge5N/x+UWP4V38Q6zLxAFPEUt65Fhe18GDR23LPg=; b=uFL+RWlrLHCCKY0vBWllhEOS0Z
	y2Cr90rHSCy3kYgx/fCvh2F1fqznlTnZO0i+vzkCCsVNRAcSFdTLtfNEICgjS89fJFDuyouOVmGJ0
	oru96MsnnQ3nopKzQ20xFHxXAUkfd4Q9NP3n/4J3l3kX+oEpi5hpcP0IPEQGmlLA/9AjMEktNVAm8
	+GDdkle4lK5NHYjR5K2QvFuSB6GFtWtvk2HeiZevkIk9B29Zj8hJkI+hx/tEEpuabNgTLbgcltkW+
	G2xbDAc02wunMs5hS8XHgDB9AuV0B4WN/jJB/Fpr3u+NIFHRlBU0VE/ON2H/8/GQMHTit9T1lKS4f
	jDprTBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u264d-00000003dHq-2qiP;
	Tue, 08 Apr 2025 10:20:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25dE-00000003WDx-1Beb;
	Tue, 08 Apr 2025 09:52:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3959439f8f.2;
        Tue, 08 Apr 2025 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105955; x=1744710755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ6Ge5N/x+UWP4V38Q6zLxAFPEUt65Fhe18GDR23LPg=;
        b=jVfCmAMxZixdjY7FvMCUs+GHJ7bRHFZ4jJmSZRMihaRSQTl0BWeninrd/sJO4BWajz
         HrKs+d5FZsCqMdj1E7jfDHaMwZc7vIuPFbmx6x4IC+OkEaKWM3uwmMT/REv1E3XVrI5b
         IIJSFVy7hoSjRfPga4oMy6PWk3eDcG9o6nLHLudkpS/FbTs6XS2OUT6F7XHyzl8MOASq
         xz+piSRfeO5YkfzNBPgk+xJ1hMGYf7YsnnIQ9wlIrmUPoRWz0VyxKVc+2yErkCfRcJ/2
         PGfYOpEeXENMJ8gD7p+q2aVQzP1PahYmuchV091ibjk+cBzH8GHsQUL4VMDAL5ue3WP6
         aipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105955; x=1744710755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQ6Ge5N/x+UWP4V38Q6zLxAFPEUt65Fhe18GDR23LPg=;
        b=qHns8dcbPKaswAyDb1ixj2lvBVLDKaGZ/yk19wvUaecTj8h+Nz4H6+u3gxL/gKSE6k
         EpV9ZWxMKmfvMgHehSCfWep5QC77Au7SVuXaMd5GsqZ6rDeTiJVZ42kV1sd+qmJJ2hQE
         IBq2cw3PchKy7P5M5v411afIIvnKUvKJ9OVuKy2IJKFxmByRhryxOYTmjfRG1nxxr5E6
         rOLw1vgLxH7g3wh+OM+Wvki+15EYCJd1yzEn2kJp6PWddRTNJqTvAd4jM8W4hHA5iA9r
         NIuuMEYKyizqIBQqs1Y/A4c4Bh5JKKwPMyqLJhAAXhYX9i5lTCZTG5ckZ7XU/BrAjU2X
         Ntxg==
X-Forwarded-Encrypted: i=1; AJvYcCUPquETNFSnWzENwU5+UAAOIUgwZoFcSLMRPeg3cYhbu+wgNytiVbzq3oDsk93fj+uhEvDSPrFsUjogXad6z2t8@lists.infradead.org, AJvYcCW2uH8JFmiyQrQtjWl9plXkkBTh6EZnNqWl1XED6Nh5I0436mCFB1iqJ/00jiRwXHxsgi6sWxDjy0lYjsPb6Rs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9/cvwrjSDbn4TaeaBfxuq4pStwMCJHy4/MpZT9EosHUR0tvI8
	B3TlApVic7l8mPUhqXY1dKq+kss2Hb5MsE2QTwlx4547tY6wmkD6
X-Gm-Gg: ASbGncu3IcWk6CDYG9lTCJhIjyDrCS+JCwyKe7z2KFeexKXX9Ki+njpn3Wry7EF7Zji
	T4t+tZaWU3bL3+UlTKqQfM5ZXMlNKI1IxoVliNDCpgec0Pywmrhh0WqqleCaFHc9boqpVha34N5
	QApYO9slrZds+5PTf17JyGkczyGsSIVqTjvouc0NFPTAkQejZe6uBkD+jNVnilf08MTKzWggNeR
	dmNgIcpsntl3MlNzHS1oaSk84YzGgPu/TDWjIGUo+oXga4RaFKowcR47ks2I8abpwmVxkbkoffA
	VUcVdu8GDFbrieewzY801C8LFdEdR8dwE7v4AvipFefpbJAjaAYS6pW1QG2AahI+jjkluMNNqIy
	hLr8L+k3DW5GgsA==
X-Google-Smtp-Source: AGHT+IHpMGk4Yds8HZnyNiJDTf38Jb7LdTvCKQAIkk5y2ICjoSbvIt78dAK6v2Z6pag114kDRk80RQ==
X-Received: by 2002:a05:6000:2403:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39d6fc293edmr7839272f8f.23.1744105954688;
        Tue, 08 Apr 2025 02:52:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:34 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 15/16] MAINTAINERS: add myself as maintainer for AN8855
Date: Tue,  8 Apr 2025 11:51:22 +0200
Message-ID: <20250408095139.51659-16-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025236_324117_11620F7B 
X-CRM114-Status: GOOD (  11.01  )
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
 MAINTAINERS | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c5c2e2c1278..74f99bea4875 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -729,6 +729,24 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/mdio/mdio-an8855.c
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.48.1


