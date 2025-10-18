Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AE9CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 04:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FwE+FlafPdFDMuivWnU+BJHVFOy/nLZHlq4G67TTc0k=; b=kU0i2jg6i06pcqDD0v0C4ot8QC
	or1+cKk1msEK7Ssw3AWnFOubk7bZV/7zgcGL6cTcA1HdGmIc7Nn7AyJx2Acump/Yoclg496aNcRgf
	feENR0f0mIl8dOcCFNQ+nHneKQjqn7qYQ7yfbjbIQ1ucIX9CroRy/VMmCC1SBJ9PT3bBj1YI2fpyp
	9hFuINlF6Ot/ZlJsOcnG2+Wvi7YTkn5OUFOyF8kNtPgqYfXTN1gJkhsf8jJSntFXFYdnZebH05BCR
	UI2wzmmPzW51e14tEgmJVEHkoEbY2RxJUmZ04cBs1Hnh9VpyzNiSuG6sKewnywsakiwBJaZc2Zli1
	Efos1q4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yf5-00000009V5i-3tOP;
	Sat, 18 Oct 2025 04:35:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yf3-00000009V5L-3Npb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 04:35:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27ee41e074dso31109325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 21:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760762121; x=1761366921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwE+FlafPdFDMuivWnU+BJHVFOy/nLZHlq4G67TTc0k=;
        b=SSczfY4DvwkIMC754oSbGj4mVx7Qvm0Rdpb2yR0p+s4ohz4y1eelXWsaQRUV3L1d42
         F/FYHI66cXf1aHuITqFs/aaOLbFPAF55YTxoFtL5QuUjfO9mkG1C/MCYaJQJaD65g4vW
         fteUwS1ulfR/sAVwek60pX7BF1N60YKkMoZA8aR0ad/bn0a7Y/Zcy++QwpGEGFIe4MLK
         hxTAALRMvx1cFIL6aWMsIiqd1ubnQP3gvRbiVv3w05YI0YF9709Rh5syEE5JnP4pYbQo
         SE2wqZ97pEMCFXFc29uyWL70KagDPWatTKs7lFLXk1sgDRi6v1gmZTWcMFxTV9ybYX8d
         w1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760762121; x=1761366921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwE+FlafPdFDMuivWnU+BJHVFOy/nLZHlq4G67TTc0k=;
        b=Yg4XQ6h3T2GNHfVUm2Mjh0lFDI9C81ln3CJJfJhXnn/fa4SrAIAI8Wm2rx6D/sfku5
         mKzbg2wrhawVReySlEQ20cgfhE13yTtlO49KvyUqp7sXHbyy/rxH7mpdpZDucNJHXb2y
         hPbH0apEKuvbR/Da5/yxgTVBv4m3N/toF7Pi9J64K7V90SQUYAzu0TjUyvbebB2+rJ4k
         S4Po8RtXR3ghrC0nAmcWi5nlJDzbR1RZaw7jgIqG12uGtMYGl4ZX3ExVnU7GQMZMCMoh
         dS5ch9sq4DqzS9nb5/YXaVG4/SZVpciBtZk/f1zkZVybvNmyxVx1Q6TG5M2SgAk8olUo
         P0zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmI4vD0s2ldZkkVLMMaorcyY6afUYz95tfIFonjSGgAd6zDEewT/1/D/XT4SMjiild32Pa0bOrVOMHMVCSXLRp@lists.infradead.org
X-Gm-Message-State: AOJu0YwKBqwbGkUQ9Z7Lg4dPdYRfEROFc5zkR1sTGYBcUqKz8Z6zRa0c
	KUYLk/lVua7bWIWsUx9g56ccZZj1amaJ7sUeLuFVPCjkailQaKePKC18rXXJ0w==
X-Gm-Gg: ASbGncvWDZgc0guJM8uCYZ7fH5fuTNfYDRAI+sHZQoontqFO7V33e5VwT3q+2y5fgYi
	0kHzW4uqKGd0lbgVu+W+dW2Sqyk10qla+kHqHhjXJXUrtkO+5J2rSAVrw57u04xGiofA0zS3tBM
	Nyb9YYgzYbMK6XlbslNRGn0HSn6OxwpPcsYPZziPNIbHVq6ThfIO4cgDhkVzOh9zzi3xJ4yRZI9
	rqa+uj10sVkQMHkZXpNniazr38dmCmNutxnFLlPCf9uhdvLdhcVAS8krj7i347hYQLvona6HTT8
	niNV1rc5pMKqE2lz5lS7vA+tfDz3QV8Vn3Qj4X+JxUIC9+0S3WvfGssePTbO6tPekVmo/hwpwHx
	5iHcXhBhjGNSC6BJ3o15h9zN2/enby9L/TckyBwMtTLSa6ZjkOvwWDj2u9XsFPmv7zQb4D537JC
	88ltdcwOVolhkjRanoeQYn1+e/YdjGi+qeeI8AcscevvwzGMjjASttn0aM1hW2XszsFO9SCZRR7
	peg
X-Google-Smtp-Source: AGHT+IFjj+JR7R/Q2O8WxGOAy+zB1ukpFPQ6elAKB9VmH+ImOjLf6iOrU+WTRyaZ3nV4hWJdz9cmxA==
X-Received: by 2002:a17:903:3bc4:b0:290:b131:31dd with SMTP id d9443c01a7336-290c99aa9a0mr69186125ad.0.1760762120750;
        Fri, 17 Oct 2025 21:35:20 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29247218eafsm12167715ad.101.2025.10.17.21.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:35:20 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2] ARM: dts: aspeed: bletchley: remove WDTRST1 assertion from wdt1
Date: Sat, 18 Oct 2025 12:33:09 +0800
Message-ID: <20251018043310.1056032-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_213521_886072_2A323B67 
X-CRM114-Status: GOOD (  10.98  )
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

Remove the external signal configuration from wdt1 to prevent the
WDTRST1 pin from being asserted during watchdog resets.

The WDTRST1 pin was originally configured to reset the TPM during
watchdog events. However, the pin is incorrectly routed to SRST#
on the hardware, causing unintended system resets. Since the TPM
is not currently utilized on this platform, remove the external
signal configuration to avoid the incorrect reset behavior.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 24969c82d05e..abdb1562115a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1080,11 +1080,5 @@ pinctrl_gpiov2_unbiased_default: gpiov2 {
 
 &wdt1 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdtrst1_default>;
 	aspeed,reset-type = "soc";
-	aspeed,external-signal;
-	aspeed,ext-push-pull;
-	aspeed,ext-active-high;
-	aspeed,ext-pulse-duration = <256>;
 };
-- 
2.43.0


