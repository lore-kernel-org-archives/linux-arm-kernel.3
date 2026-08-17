Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3154DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y756HdfLaSb69/zEjo9fJeL8LylUgwNNsMBSux8mExc=; b=2EHFQYqX0WxrDQG2UbcBw5QqvR
	PhGJKJUhxMffqMogduMK/9vt3WOwXD/SShJKr75gdKsA1ak5Nj5aA8IJz1tJd8TLWidrySYIAgbsn
	iSyz9M8amZ6694GUfYNXEEJmq2KeRCS51ww2IS/zEid+JXbqWzAD8y7Kr6xcGqeVn13WCc0yTiNGY
	9xKx9sh/xYB2iBqlMLiW/S0+fUGjh/DerG/SeAprhEmDj3ihiD9ALsqskMcxZF+m0CiAfDogG4qPM
	loOewOteB7gZ00cwxer1H3590dOq0SRCyWVWCTU2Z6n8i2NMN6GFPYe2KewbGN+fi2kLdkFWFAxD/
	lSfVTdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Ij-00000006sqB-0hGx;
	Mon, 17 Aug 2026 21:55:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Id-00000006spB-3qkK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:55:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49954b88fffso44553595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 14:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003718; x=1787608518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y756HdfLaSb69/zEjo9fJeL8LylUgwNNsMBSux8mExc=;
        b=Iej651tQC50/ncJsk433JVsSFg0SFiZ3PREzydDe05L6cQa8W010sxqXjzKlojINP8
         UmB+R1o27yf1dxq/q/Tg+O0yWPwtCOukmV/C9S+nNSl6bFB3+iRfoI70atyYT3pekGag
         R9xg8csaV9Nuq/G9MxvwPuzDAmv2Dlxjtqi/V6f0vKu2fJ/gfUYeStWm2+F7AgPXQg05
         5aUfeYxJuJfJp7stxHmwTzY5U3LrzaonOJVf0qHDzuKqqwwgSNldbbP+0nF/75GsIHA+
         C5NnGirbN/AxbcnIE7vRAy1XYibDZ0XmC3XA6CbrUygJkwEUu/t6vGhnEjhkvJq+wLa1
         A36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003718; x=1787608518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y756HdfLaSb69/zEjo9fJeL8LylUgwNNsMBSux8mExc=;
        b=FoEq6QoBpDAMzDZlfSitBuM5Qdc6ms3Q6x/EPflwTZKjjjgOiuVK9WcNbW/qKN3xbB
         AJ8HKuWW4Y5xYv/vLlLuNYLs9lodkqD86pMTm3kIZhzCH/cp0rDFYDEE1h84+GRXpoMi
         FwCkwZ8MvasJL1cj/dtwaTFhbCZUyDm6RiiQ3NGrh7s5f4jz/Pq/2z2SjyGx28LrytbF
         QyTA3GbAc52B21tRU0BM3WwVu1gGKiP6rKkMGSZVeuIKdMXZOKSvBAheEM5T/C5WRitN
         u/qmbm2JwmvwqfudLDOIVyqP7Vc5Yk2nSghvCcygajC/hRSQ8fMwjMLdzMw7a5AeEV4F
         /8WA==
X-Forwarded-Encrypted: i=1; AHgh+RpgSAn7FR9qlaCUTynvW2TNQ5VJMWZdiH2WL2Ii+6kVMmkzsLxFMyfuYK3MYCwAXvNv/MWgdNeyhIubJdWQ+75f@lists.infradead.org
X-Gm-Message-State: AOJu0YxF0uZ+vfT+ptzgjRkPZIDGWUYJ4LOwRrKsebYUVlwH9dhd3j5m
	IZ6CWQToNjbnkIEuBUccxksPJ8dkbvgqZ2BEpkj72FSPNSGtlNXQb/7d
X-Gm-Gg: AR+sD12Z97fy8iMX4XRhXlRaCSpyhVjOYg3gsyQq70aN7knP6xryXVv6NUn1oPDu2Yi
	o97tstSk9imJ9pCgidEs7GFn1Vq9PLFyafrM+3bUpwYB0ouhHcyxSMsBpR9hthFqCcNLcR+0GZ5
	6AfXu3TM9IHtLNT5b/c4jQ/4mcuYYKrtnRN7r+HjU9eJmq7yXh0mcfdDXCPYtHHB4T7riRK6nPX
	7wqvL2EZiX6Rc1U7bMXt2BgZIlUdElLI6snbkUpBfuWONKRklqOX3Xdg0N9iTlRG7TK2O71AUEN
	4jTVyapYAX4yX8KhGxVkkOeyYIGnmNgi6wfnVIsKyClkErDpVQUayLBR08QMFYY7JhWI/LV4kQv
	VVLf3UEncHQC2vQhlvuwe5J0ATaLDafOHcWrpb1SUwpVHgGdCLSFAFc0GQZz+vhsCotY8E6m7GF
	2s6Aegyp09q5fRiw7pM0ybsV5s1ekz4752V5FZs8PhCkX31SUGvJidGvPGg/i8ZJRNyMI1WKoJg
	05ZzzxYsNz6ElBJz3ZiYvccVXhwXghDJLcoTGKBCpflPsApqlEJnU7FwNzUcKIhZSm5WvwNzR7x
	6T4SOc7ntg==
X-Received: by 2002:a05:600c:3485:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49987938e19mr460386255e9.1.1787003718146;
        Mon, 17 Aug 2026 14:55:18 -0700 (PDT)
Received: from localhost.localdomain (85-118-76-205.mtel.net. [85.118.76.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309622525e9.4.2026.08.17.14.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:55:17 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
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
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v5 2/3] ARM: dts: armada: WRT3200ACM: add marvell,ignore-regulatory-hint
Date: Tue, 18 Aug 2026 00:54:27 +0300
Message-ID: <20260817215428.84740-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817215428.84740-1-gvalkov@gmail.com>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_145519_982062_46A08DA7 
X-CRM114-Status: GOOD (  13.52  )
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

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..b93c5c419962 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,15 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
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


