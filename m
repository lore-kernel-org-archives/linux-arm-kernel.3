Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E89BC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bcoCt3NplqcRzScaFBaJvGWmYj7kzQK/tDyE+wQSVG8=; b=SD/Eazp6Wd7k2lo411d6LtBNBN
	7KSHMR/hFAufbnE3q5HTMkKqNmTNfhVfqUkDZzxTsqvm2HhjmyKsAGyN6LqSfo4xAYBBeUbp0nb6p
	JteHZzdYYw3S6YevMqzwfam8vLbxRRX2MfCnAEHF1zQhj/TfIXcJr3KU8ipyCSosvY4V3rMaZuhF5
	T5LYDq2iKuTbrBfSKTGmne7YIIYB24ibP41LuOIC7KmOmAoLlCPU79y3advb4IqOvTvHmhKzghEou
	yN9+L2wVfU/IyC1jCOTEw18x53Q8druq89p+iRhH++GmcC5RCwAu1fUD92JulkzQCJVtLZnr8FhCP
	LJWMrOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57w9-000000006SY-2rFA;
	Fri, 11 Sep 2026 20:33:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57w7-000000006SD-2sVo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 20:33:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2dd05e8b98cso13488845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158807; x=1789763607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcoCt3NplqcRzScaFBaJvGWmYj7kzQK/tDyE+wQSVG8=;
        b=XfhSTtmRLu27/iOixfseJmiN75XMcTHnbnr+rfkV/JcbdpH8Y4/37o+GwZ9lKEDzi2
         UXWWGAxkqdTnaZ4VMF/mwBRSNd1Q/4ux92NMV/VlQVjgDvIibzVVIkZfZqyrzw6x1bGU
         xmR1f4dPG9J5KLo+BYvC6+yRbZeHkx/SpHPRJ6Bzu6OjeM6NNXtOfYqA8WlnQQp018Yl
         jPWjQZbbTF31KIilNGgp+yGeILQuO3j09Buce511EKBGgwE9BtrKORCb1BpfOTMkEcrc
         Zi2UPJz+u/BXOoCAjmdc29NpRrOnzxm+aAlcgNHJqQzzv8L7CWI7KjuDxCWUm+9hBnWp
         c8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158807; x=1789763607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcoCt3NplqcRzScaFBaJvGWmYj7kzQK/tDyE+wQSVG8=;
        b=gNyKC8uHIAhWNJyXrU5Et0G+4nefhRz3fygPzxn0HyL8Q4ja6k+rgydJCzQN46P6Lc
         G7fCXc8an2AH5ck9KbmzICFKtnkgDx3qcNSOZzHMZ1YAOPHk28QAxJloiOlVKlrTreAv
         vgcEvgp4n+qRqzezaAXQjtv9fo7x64/BYdyRO+YY/RUg1lHx5f+uXFFIv+FLhtslFe5K
         sDCms8kp3daWSLnpUW/tb/wPEG0ykikC+LuT4Tz/TG0fMX0sPpnOSoOlt/nMmQzhBUAA
         dkHRpbR6ZtDCfZNMtYYU3o1hhgdOLEDzBdKvhtM0cWERCQBCV0jcdVd1NbA8fdo97KTa
         MY0g==
X-Forwarded-Encrypted: i=1; AKwUvBz+eQ0I8k/vfpkAHtzpYg334Wta0GMrHh/bkQuToD+4wE8Rt0KZTCDRH7SjaLGnm+DR45HbVYkNJyMTPGWWc6hm@lists.infradead.org
X-Gm-Message-State: AFuF++nmr8FjgpTvsl/+3C3cudEnn1thrayJn4czl4jNKuR/NHrVT56n
	aBV6X0KtPBVo1yq/zNp3I+1kxWUNRAr1gshrZfxOIelD+qSgH6ddEG5X
X-Gm-Gg: AYBFou1zNCPWnqRRTvPbUo2ZH84lmvrcjRdqPoY1L6RMC0wQbdnL0UtZhYJsFuu5gD/
	GroGds+Rw6puyV+OznmRCq//GrFiOmlmQ8suwhuFksSEDxfIJEOIBX4ZAjW6yHqaMBxttcs+lmH
	hFLopZoiBSaTiegpNmJWHuzRIHOjHkLSZXBs/BwkY4ZHMycW8FsqQC3jBgvZLNuTcb4Pu0tm7Pc
	BPa/Hbqfh7IWwtN55qeGFZfcqLBKWa//vNaRUuTrB6cFX6c6XUAhh4eaeuY+KUmfqZLekPNVajr
	1UIbFZAZ2aKfldhA1kYu0aTn7rUWaW+rHWzwjAP8wmGQrB3/HW/drgf45WceZj4oew1LQKz2XIP
	7XwD9LWdmDgk1dEfj/0H/rDZiAbAfRBxDxnmMNTKCajRlu1YLxsia0TJ7Pekk7P8+7gJ7BjJEvs
	BY/8t1qYRmQUaCximgmCAatzZ9CVP4fmrBth2rExYJeQkBYhjHtpZICOYAeLryQC7HKwEJmNpjY
	8p1aXN9qWRAumYoCLvC4EmBoCfZt9LJJ54WvtTnaoc5CKfgYSNlnqGU5EtirlBQXGMAgbEYwyPg
	Ju0+bbXVoaIbZooxAz550gAecd1qGH4tuFzW/7KeBiij2dKh
X-Received: by 2002:a17:90b:3c8d:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39d9bbdbac7mr10334495a91.5.1789158806647;
        Fri, 11 Sep 2026 13:33:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1879699a91.1.2026.09.11.13.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:33:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
Date: Fri, 11 Sep 2026 13:33:24 -0700
Message-ID: <20260911203324.104422-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_133327_727926_712232C2 
X-CRM114-Status: GOOD (  10.25  )
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

Add it and set MAC for gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 instead.
 .../boot/dts/broadcom/bcm47081-asus-rt-n18u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..5874e6b606de 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -77,3 +86,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


