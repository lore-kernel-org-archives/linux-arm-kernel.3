Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93284C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vvGJD9G3Em4wuv3pnLTAT55HTjU2fJsMmfkdhBzv54o=; b=GL9ssUNyTvB0sVCzjFIbrnV88l
	IZQ9OJkawvAvb2drV5EyanSFrMh9u63mU3Avc03y8LxCCZOuXEKLaquY0QYgNxcJSqWnYGYdF6Ifx
	/K9vuBDqLiNKeujhMVNodAAfKHLlDwvp099+j/qJxOQUUxjbcpvWtv2whMMkarwFvIibPRVUad+fO
	6O3rVJv9BXPLSrIKKrnqLW6Si2OalAW3Y0mWUZi5QeQTRRqV9fmTzmxQlMuxPTs27PMdc7bInZXVL
	eguc4YIw585mZIAO0EzIN7aBcj6PmxqNdwwM08eObLdZ+3MwVv4s2SKy/N8ryuwqRyNzhzOsJQl5x
	krFQ2+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUDj-0000000431v-06gR;
	Mon, 27 Jul 2026 22:54:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUDh-0000000431Z-0xrn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:54:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2caea3f742bso39268305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785192888; x=1785797688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvGJD9G3Em4wuv3pnLTAT55HTjU2fJsMmfkdhBzv54o=;
        b=X4Bi8Jg9qFGgaI7ljS1ukRGMIC/gFvzYLNbZs2rK2v2RO0aIl1gz5Xocmq4vvT8EPQ
         ynKbrCI7yZwRgSuDe4MHHI/poLabgM7E3TY4fIgtD9zzZAzGoH5Qogi9ZubM7539GeLu
         Duzhm8sI+A9dF48xw3TUX0wfSUui6Qt8lFvjMyFAPSPpgWDoRXMxagURhtKbD+7z7VkN
         tgp+mBt5+46yMmhad6m8jseEEJF7Ym+c91LQz+OEkCcVgW7vFJkMEKWbRNgURjk15e1A
         uzdfb8XX1JWNGJ/0jggWhz5uiNA+3eAOQsxMzoXnryXaCfw21LjdWPqYYs0EJLoCZ2Bh
         2GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192888; x=1785797688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvGJD9G3Em4wuv3pnLTAT55HTjU2fJsMmfkdhBzv54o=;
        b=bnrhZvLBkyelU7QOFcg5fgOMIhZmRSBnLapkbHiXQLiRP50KrRpx5+JHdKdA8IQAJT
         45zWwyxb0wABVejLOCazm/mb9D9ZMWc6xCEhxDeGKfF9MU9YuTZ2iDc1nWxMN93TThOk
         M3b58+WC/u0YX2kUpcNlO8aYoWTHCCkxICNFlyy1gYYL9gwzh+nuuVQIVvPf5mdGxnSV
         aICo+yQZdGkR3sjIsImRxs6K0lTfhF3UhThbic3PshwjxQye8PlO6KD68+4eJ2QiKS2Q
         9m/fBWKISsiYnAO5jAot2VG5m3pC1rqUmWq6Jh7z3N8036sTbmKqZ9Y9pRYnABmyKGnf
         g1+w==
X-Forwarded-Encrypted: i=1; AHgh+Rr03GONUGvzighl1JRRgZl4N/Xa4hKDG2zeP//OP4HSgPxUbcJcv0L93Z/Ssoj8ToUlzpuvAiOSDHvDg31rj28t@lists.infradead.org
X-Gm-Message-State: AOJu0YxvJVv3n+Q//1czffMYlg2VuzNMSHcVLGSb0v0t73JBQw7t2mDq
	Df250lfYvMcKITiDWz1Pf0pMYPzJ2yC1LyrBPTXQeFODyqyLL3QC/ci9l5x+t1RI
X-Gm-Gg: AR+sD10Z2ZALEvzjNZMKzaegCbWFMgtSqQveiJb9NWGyfYVAxOrqrT7vn9q6iAxSKz0
	FQ70ig4xwOlr4PSPRu+wPHzLKRCHE9Cmf4A0vUwIhbkp1AahpFppLjmfyDMemt+P29G8ArCh1DH
	V7CiRAy0D4CevJfUuHTzOFONVZGKAu9BagQIu0Njbb/BwxYeXKUNfEN9NyW9um3uuS/0lJoc1me
	w9KvjAPfJe9+xVCecQV+DBfzIkQmdjGycqrhjZb9V9zeyb0RaE+4VvoKr7dzRVWI9XAcvx6Plc2
	M7RNP0xo2yCcoi9Sq0dyMb/NNPuakhnWpcpxoMJKbOfPW2PAEQKyV8Dkmzi+QbLLqk2JO8HJHwf
	fCeBlVaQ+uboYA/53ya4BjRPLz/cGqr0Uu9tQknnC3qavgSbJ30G6dJgY77UIikxdS8AZ835RMj
	9wkGr6Upx1onHYYvXG27hv3njRV7rVoF3HwpsZW/shutd8txt+n7Zr3GbHfzg4JHx6Rb5SOqZUx
	edO+oqkqMgqS4Qy/lQLh89qK1sm1AMjw8xvUIsmhPv5y20/rs4OwXA=
X-Received: by 2002:a17:902:d4cc:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2d00f433620mr11477055ad.42.1785192888141;
        Mon, 27 Jul 2026 15:54:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2881sm41442215ad.25.2026.07.27.15.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:54:47 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: EA9200: add wifi definitions
Date: Mon, 27 Jul 2026 15:54:46 -0700
Message-ID: <20260727225446.267097-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_155449_301210_CE965D16 
X-CRM114-Status: GOOD (  10.55  )
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

brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
some of them for proper operation.

Also add an nvmem definition for the MAC addresses.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 87569408bb69..9041dc6bfa8d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -93,6 +93,63 @@ led-3 {
 	};
 };
 
+&pcie_bridge0 {
+	pcie@0,0 {
+		device_type = "pci";
+		reg = <0x0000 0 0 0 0>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		pcie@1,0 {
+			device_type = "pci";
+			reg = <0x800 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				ieee80211-freq-limit = <5170000 5250000>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+				nvmem-cells = <&et2macaddr 2>;
+				nvmem-cell-names = "mac-address";
+			};
+		};
+
+		pcie@2,0 {
+			device_type = "pci";
+			reg = <0x1000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+				nvmem-cells = <&et2macaddr 3>;
+				nvmem-cell-names = "mac-address";
+			};
+		};
+	};
+};
+
+&pcie_bridge1 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+		reg = <0x0000 0 0 0 0>;
+		ieee80211-freq-limit = <5735000 5835000>;
+		brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+		nvmem-cells = <&et2macaddr 4>;
+		nvmem-cell-names = "mac-address";
+	};
+};
+
 &usb3_phy {
 	status = "okay";
 };
-- 
2.55.0


