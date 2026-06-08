Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2824CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ/hiBGZLbicC+lTnolGRAFjLFtYyNtLXUJyZrvzxug=; b=Mr5UDlcDlVKPHivJNnXKFCIWNh
	YbSvSqX30WTcPfvIkRzPv+c5VMnpfk+weazkLx0DQW34HoT0w4nfLQR99sx5Fww9iS9bLZTg6zv94
	7bUjYmqPiKoU1xf9FGMItzMHGZsq5mB384ixt64XjGsR6mWrB4hhT94kK0dssvu0wxhhM5/Nvlnsw
	z5uoW33UrPN9UJ0ESkeLpnP3vllQyr80iI3maEDRIsT3ZWhX9if31xIo3Sro+tnKXrRE1ocDQq5JC
	G0vVMrseh+n/GrjEk8ebOz50lji7Y3bTY4LrJYBDy0GU9zAsRclT78v3a8jcxpevDzVM1bIkHf7sB
	p8TuakPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAW-00000003oDV-0do7;
	Mon, 08 Jun 2026 14:41:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAP-00000003o60-2jOR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490afc47455so22207245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929688; x=1781534488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ/hiBGZLbicC+lTnolGRAFjLFtYyNtLXUJyZrvzxug=;
        b=blpZCD2nAJv5VxiPm1nXdJbEjaRev1NdlCDKoEGCQXn4oRvzPG5wcDyxnihASd82FE
         YDKACCL/Ep99r/47R93BrIuJbPOH8eC6Jzx771wpCQ2u81zSkZNLeXNEyXXt8tC1mPl4
         g0tFkFqYlOvRiMzNoBf3u1qPX5pOObLzUv53UNjfJ64byb/p0HzEJnZvZBWFePq7JcwD
         XMwjEMyVzCbH4HFjP00+e36g8cfzNlnERU9bh8GiOHYt3/1Vn864S3kDEHF5UMMXhBJ4
         zmhkg8N2oRWMSIclMn4CPCriv9vlteNa9jWu5xcu3h1cAQ151m0S44flt9JVq0jYjd13
         tPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929688; x=1781534488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQ/hiBGZLbicC+lTnolGRAFjLFtYyNtLXUJyZrvzxug=;
        b=mC9BFhYUna4+02bY2W58upPjSzKEyro87ZiQeqlfgcmd7Fr5KIZUcqgANmxc/joH1T
         ef3KGIWwLDQS5L68ENg4eNsc9qyh7+znzJJiHoLRZunv+xh7pOO0o7QVxJ1hwttvkRDp
         OOabDdKjYdMcKL5jtA7ZB05gdWQl8EAL6iHEE8WGQTF69ypJVfZ2COVrKAhzQfakDXXr
         kNN4hMX3x/6suVW/V0k5tfvONjig6qzs2sYzLN9gbyt5ZIc4kt5zqlpgQRuD1IDOd4PF
         V0zgan0NZcoOFOGNYLtmtMGDsKtHvSf9BtwFvdAV9iQy0oToTjlXXWyWFoHlSordWR9M
         kHGw==
X-Forwarded-Encrypted: i=1; AFNElJ+91pqT2LOk0+qMMebDkfMqucPr5PUFKjFH39ibz2m/igGc4tdRyiNoUr5Iqpr/dUfwO/wJLolnyHx2acKcioE7@lists.infradead.org
X-Gm-Message-State: AOJu0YxvA7fsNRIHfjV7CqM63AYrhw2+RK3qZj7OFPKLpPLn/pztfSyy
	ODqjk9F/sj6e7fgj2huszTzDZzeuFtQgnyy5XT0udXWRreJUNRYjepUZ
X-Gm-Gg: Acq92OHV8yMBYZswc1JpOc7tgkG4BIhwBAwcfAdv5b46FIKckWA+cMbKDNfp/ALwqBa
	BGcu6ArKHlfVZclgN5tuQLkxiesuuDnjnpBxQmlRD/LYoKmiac+Z1zlRaL0xN3R7x8vnRvSFGe1
	Hs0xJ9D4ejfgJZdyJSnULzzijTfg1Re1UKtOBawgnNod0a7kot7XNQSGlUoQPWSAq0Yeo+FpbgP
	V74Y4SirEXNzApDKV6ypAHN7tpvREceH5MZA+DUX2h8Va8CiNP7epIlLI8ZC8hrl5JcjP9MPIrf
	u2bCL9L3P/FNiaWT5ctaUk8qi3XzBHWcrOaAuA0+A8/4dm927oBN4Yj6zTyp8SpHptpzrM/6cZh
	6XNCYscbnH+Eh03RncbxaSPWpxWPPHrz1Kae7CunpNgpxydfRdNrnjdyG8TovUJTaM4yqNSjBhG
	Xn2fvFawAtCidMSB6gUGtTAAghNXBGxPk2+ZUvTRETXpQd1SUDICuAHk/HNyEjf2KJ+sD79jb9z
	+jsc1a/tsf2huuIZqTPTWk8LVz5qCITel2H4mKzNV3CMRBWswy9FcLtPUw=
X-Received: by 2002:a05:600c:3b09:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-490c25c66d2mr274749095e9.11.1780929687763;
        Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Mon,  8 Jun 2026 16:41:05 +0200
Message-ID: <a02c86adc97618fe950c8f2544eb7d981b2cc984.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074129_709713_5D9C6A02 
X-CRM114-Status: GOOD (  10.56  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7cf58198ef14..cb3348aafa07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


