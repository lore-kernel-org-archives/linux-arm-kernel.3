Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3BBC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tk6I9EzaZ+W1EwXyeTL06fJaBXc6NaRZh1+FWMs/B84=; b=DM/WR+REWgwmnr4bk0oqcFNlp3
	MQnsJ1XQlpPHFStPgwEqQNuHPl1h0g3oxoWndgvOxG3N+KLyNOc6qWDCqL4glUFma186J+9hvaXtD
	I9GGGlSOWRlOkOxJ0Dv6q8+S8A0Pe5npkKQlDQP/3rJA5I4Xbc7om6ArvSntSoaOuXJACASSRHWHk
	LjBlTedrdHSsPK9Lw06mXUAl4oaJlb9vn3zuTYZJ6CB75elBCP7HdeU3IfYyhzGyO/dSc7e25o0m3
	Q9uXK39Ll2OjGXTer4NDXPQe6mVR7uXwIdI082nFUA88XBharTKY9A6kwjXlHuBfAhVdLaeKN0nJd
	c/dVMdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXlH-00000007f0T-1PJq;
	Tue, 17 Jun 2025 14:58:07 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWwG-00000007Tgo-3oyZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:05:26 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b2fd091f826so4203400a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750169123; x=1750773923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tk6I9EzaZ+W1EwXyeTL06fJaBXc6NaRZh1+FWMs/B84=;
        b=ByAB9kLdNJSkAAA2iqdEu4v/MKQGxGmcqjQ3NRQQ6sKf++9+coaza394jPifYdDYEs
         g9wCAvWvR5Lo7p6uew03XidZGpDZ0ycv1PE0KJrzz8hZfemtysDYdpIuJ1WpsJQ4cQqK
         aWjuGRoF8g/QfBbjbmzheD5UpbG5okK8CbxgszBLXfLNr9VJxBnLkTkhbspOpWtt9W7g
         qepgx9swYNiY4mxOk3H5/4qKMb2s8LMy46DhodyuVlJfNkR6ogzvf9eWd99xgI1qceIh
         tTa3Sh3hRBQVp/lLwjPkvgUZnS9IvZ6QLIu+X9Jdb8M0biNExFWLBF4Nne003DGj+qOy
         w0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169123; x=1750773923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tk6I9EzaZ+W1EwXyeTL06fJaBXc6NaRZh1+FWMs/B84=;
        b=lj56rNC4zRblleTq96DfCfSvptalUdrJOwlW34TktrvFYxf5olrACHckaGTXk+3mD8
         Y5TZHSLcGRG8Q/KBkKK4B/AeUoeNr8f3esUAw+1qzHPUnyN7lmO1evvwJ8uTeZej9GHn
         60voCXbweUzmockzxOMCu+3g1x4k4kVVH7fBS1LdTOBtgTfsV2fzPvEKOurhf44KS6z/
         dkY9V0L0vUmsqwU2JrSDOuS/0ESpeDykx2Yyf6SRoluQ57YAdLYSQr6L0xGgEwKeSy3w
         r7+M7KH1qyyGLwhUUPduWFXhRYVoA5naX8whxjIWcpt75hzoEqlcd8yNq8KSMP4Ze7tG
         tY7w==
X-Gm-Message-State: AOJu0YwGB3Jqn6UloyzvhQfy5GxrXRHYjT0ohC7zuHGaNwUFGxXihJ2L
	0/JUYoYHb0DXi+jHHRuvPOj6o+azUdV0o4cex17qXr2pqA5PiYHAOYqylJRcBg==
X-Gm-Gg: ASbGncu1zuqfXxshe7ixNvYmd2nz/LT4SzMWzdjO34G77C0W4BTd03FxxwKjjzTStQW
	Y/iqpbo1WVOXd5jj1xdiJcd/CHRVvOSbByDIUZs3PixTWS8GBhcsyza6Aq+Gig261W4B+ggWVGu
	fna3Ui2+yaGJYYAixInoHNEasgksbjwaJEGvqhUt6949w9VjeNPNZqNx1F5NREWNiDV+Jh26O2m
	1pwhumkDxFEztX4CbZFAK6sUXc0B0Tw7Qkc/k+PXvb59UYyco1EWXmKsY1Ca6bv/8eabo8SoEL8
	aiqjqEdQtLD0vtkc9cJUkZIahPkEy4uS3AZapeKv8HHeX9Kl44BiW2xcwg==
X-Google-Smtp-Source: AGHT+IHbKZPSqfh1gqigaZX04x3z6UHxXKBdLiZMKpd9JFG5J7rZIOuFOAUM8RsuNLpgmb1IEIuIWw==
X-Received: by 2002:a05:6a21:4006:b0:21d:98c:12c9 with SMTP id adf61e73a8af0-21fbc7fb787mr20507624637.21.1750169123256;
        Tue, 17 Jun 2025 07:05:23 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1000])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a0e7sm8906127a12.16.2025.06.17.07.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:05:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: claudiu.beznea@tuxon.dev
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/2] ARM: dts: at91-sama5d27_wlsom1: Improve the Wifi compatible
Date: Tue, 17 Jun 2025 11:05:01 -0300
Message-Id: <20250617140502.1042812-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_070524_958202_0A5FC090 
X-CRM114-Status: GOOD (  11.11  )
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

From: Fabio Estevam <festevam@denx.de>

The at91-sama5d27_wlsom1 SoM has a WIL3000 Wifi SDIO device populated.

Improve the description of the Wifi compatible string by passing the
more specific "microchip,wilc3000" string. 

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes since v1:
- Collected Reviewed-by tag.

 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b3..e35dd79beb16 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -385,7 +385,7 @@ &sdmmc1 {
 
 	wilc: wifi@0 {
 		reg = <0>;
-		compatible = "microchip,wilc1000";
+		compatible = "microchip,wilc3000", "microchip,wilc1000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_wilc_default>;
 		clocks = <&pmc PMC_TYPE_SYSTEM 9>;
-- 
2.34.1


