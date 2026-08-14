Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADF1C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb0qDDFJvzSa8yRML0htKvOY5KPeiSCo7J7EimJJcYU=; b=4u7rakco6hwQ34/FySeP0j7r1P
	Hz8YaUZH31ITtjb8Hn16NpRIBRbUvG5phR0DKH80RKgn2yrr7wWnhqUnSbiHphojm7iLcN9nvAV8Q
	JG4dAj4YvhIIx7K3p0P5e7dWdC73RJzUioPQGPlutBN/MNBXQn8VbVnGBWdBN2vEoJlaMYrvgi2bj
	KlwfHsR911jHM78hh6e3uYG36px/zjJjS2fx3/pwhDecZq64u2BAm06DYIVxvKp0AI+G0eBfihhRn
	RWwVdWmL0ZNnPZ5IkRBpEM+szsMrLS18fBpS6qIcm4vy9C9ew+Zl7kig2XxuvjSXvtfv39tTD0Cyv
	KxU+D0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurNk-00000002fxM-0I5I;
	Fri, 14 Aug 2026 12:51:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurNh-00000002fwE-0mZF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 12:51:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso4709145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711887; x=1787316687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zb0qDDFJvzSa8yRML0htKvOY5KPeiSCo7J7EimJJcYU=;
        b=I5GwpCGuzqC3l6MIsDQXXss7nHHKP4fCp+GlojxayBgp2sIE3dDLEzyH4/JSI5McEE
         xX/nPZUjPoK4Ojy2yC9/J2YDCm5Se0MWxMphTSUlZ+I456f4Zw02l6/+1wo0maYhMqNV
         402+lDdGtg2xycmqcsAJ4Xs6TvXH1Iv85fat9iTVcb8Omqi0R3ZkLmrgmYs6eu944O5s
         SXlYUtnkbdOljghqRcQumpuCXG98r2g2tCa9S1Xt9Bh5/pPngbGbmTV+d04xBuBnmkT6
         o4EXDWtZmvISK8wMDN0Cy3BWEXC8iIKZ9GTOArPf61yu7Swf9yWyfd0aIM4UKDg8nSMn
         8Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711887; x=1787316687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zb0qDDFJvzSa8yRML0htKvOY5KPeiSCo7J7EimJJcYU=;
        b=UxVcwnRNkvjUpARxA8XbZTBYkNLXjYWz0RzrDv1UWXX7Zy7I/2PIYmwb1EAq0qkCwO
         4SprgLdo2fSUuoPJYTEFA2OdaF+yI3SyTB5KB9oQjjtAj+uG1KuzQrdCzbenrDlr8cn7
         PmYxDLTyCkd6CufcvBb9b6sEEWL6cakZLL+JUMjN19y/W+lb70b/BotVspBpm4E4jKGa
         5G8H6qhXhIkwZkQa9a3vpbIaNaLO1CrDvnRkMY9meY6IT0A0AKaodUX65BtnXGvMe2BH
         hfJoXxVnsDG3M7upAEStAZca+BiyCTvoYrEOm1N98L2L1qu9XJLeWqQVtwmTQvQdnJuk
         apdw==
X-Forwarded-Encrypted: i=1; AHgh+RrGntEatPinXrbkyYhI2LQe/7WhGJCS35j6FG1+qv0Gbr0EEpdKktwLh5YRcl0xH76bBYNSIcD056pVvkpG645F@lists.infradead.org
X-Gm-Message-State: AOJu0YweTP/V70M1oyExJzBIRbsi12iNSPCp4EL8jcoCBCLB63EaM1sg
	ybMPKnzJGdmzl9Pj22/jlW2cS99oBbafyYQO59jONza3erZx7tYUR2GA
X-Gm-Gg: AR+sD11fJQqtI4Re28P6Lvwd79vnMecAKzqlpJ/YAyANEfaGtTSsGwsXeVu8XOMV483
	W1XAPufklWcS3hivzZ1+VyvA2qFjwwxEK3Ag6OZX4tXNBZBxY4etP3MHk9PZzU/XKm5mo0CW6lC
	DjY3R2SfF7VZktr9wq57ipSN/Sql1VYpsqd9Zm5op5UpkhxMINEQsz34xJ/dKC/hEfd9CBu2M9Y
	WjV6lndfb/p2EHltHmE0wux7VO7JW6BtRC5XHB1lZs7EZa4ZnJf1G3GuBItRCgRl21SL4M8HLzX
	NP1ohLmUKrWhHBhIFSmPP/lUIgYJT5uUGGYKmd4V8vnCAQhiOzI4hASDYlrZxqgJ+TTXic8+xU6
	GRG9YFkPKqBIZ+V5+kKoEt4hOgEY2fltojEj8fNvhJ2fPU+wIdKfC8hMrnxrByitVb0yl9nESh2
	Z00zZc2XHWAnv7WhCVrMSi1kk3qU8fxIuC/e2FcX0Xw/766VnYi2Xke+Ugdqruwtw15eqjY6bpt
	EsSj2U2v/sty5bE4FU5s30kmV9MvL0b8WM01oOChD2TocTHZIqzpIc09uALALUcFw==
X-Received: by 2002:a7b:cb1a:0:b0:498:519:e660 with SMTP id 5b1f17b1804b1-49987935847mr52299035e9.4.1786711887107;
        Fri, 14 Aug 2026 05:51:27 -0700 (PDT)
Received: from localhost.localdomain ([151.251.241.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988ae8b62sm49727315e9.5.2026.08.14.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:51:26 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH 2/3] ARM: dts: armada: WRT3200ACM: add marvell,ignore-regulatory-hint
Date: Fri, 14 Aug 2026 15:50:24 +0300
Message-ID: <20260814125025.90522-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814125025.90522-1-gvalkov@gmail.com>
References: <anoYr9H4KojJv-aZ@google.com>
 <20260814125025.90522-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_055129_241923_54F44A5C 
X-CRM114-Status: GOOD (  14.21  )
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

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing use of 5 GHz and DFS channels. This also affects phy0.

Add a flag marvell,ignore-regulatory-hint to the WRT3200ACM device-tree,
which signals mwifiex to ignore an incorrect regulatory hint from ROM,
so userspace can set the correct platform regulatory domain. The radios
in WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
they are certified, so the only impact is that the region conflict is
avoided and the 5 GHz radios can be used.

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt, make dt_binding_check: pass
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..c5f94463ef71 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,12 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		marvell,ignore-regulatory-hint;
+	};
 };
 
 &usb3_1_vbus {
-- 
2.55.0


