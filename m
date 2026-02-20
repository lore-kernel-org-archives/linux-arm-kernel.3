Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB05C531FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9vd4Ll8q93n00uLZsvJAbMT0LuAwyI9AhtM0S44NLQ=; b=RCnC1Al7GbHh13CgCCThY/Tn5L
	ZAP2T4zTn+UODsY/2TlieVn+USdQBYHD3m1I2pCiORWtV6f+LZF2wd1CmPtutyB/7kfu+wubiMqnU
	a+aY4IL1lCjNir60urPf/Kq7AbmspVwb9LaxaotqGFz3x4LH7O3HGDWoza2k0NwMuUkXigqegOaQI
	HI+8mxwYXzQIS+7/3VKOjQuyf/Pd82lnbQW7nhL+KxBiXpA7FokhOqyPtI3CedUJcQFuQydFFbrkY
	v+BmSkQ9PSGBC3warXa2c4XfqYNhSGnj4VplTvnA7pz/FR8HJ0d2aFElucuJTn3dK9xOeNi5iTqQ4
	+alp0Hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG2B-0000000D2h4-3czy;
	Fri, 20 Feb 2026 02:14:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG26-0000000D2e2-2Lvw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:14:19 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82311f4070cso1142510b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771553657; x=1772158457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9vd4Ll8q93n00uLZsvJAbMT0LuAwyI9AhtM0S44NLQ=;
        b=KGALA3rzyR4jio7sLBA+yCcx/B+Rp8TYxIS16crWMwWJALltc74z4KEBWE6YpAi+TU
         fp29PLfdd3IiTdB9dh7bWTLedvd4M8Qtp1KSQDTN95rFWRvsyXdM7FeP0XsWtObOMaVI
         0I888xC7CIH2sK8lNi4ubsqk8c80Kah2Cdc0FB4pzbgGU2CjtdAZBWSUoXZmsgLOTo3m
         WCk3iHqxuzXPq6SAZ8yr26bgheYqaeksycXAa1tVZ87eAYWSk+pm6Zkm5NmuVyh2QaOx
         j8hS+ReIS3if2WvpNArw24uSVfKcX7s98B1wGVObIw1+5SL6UFK+S4Ie7E/vEWg8A7I+
         GgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771553657; x=1772158457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9vd4Ll8q93n00uLZsvJAbMT0LuAwyI9AhtM0S44NLQ=;
        b=ZZzeQS3teDVobxmX9aN2qkdTuyrHFXnV8PGKTnDgVjd5ORZXGfa8pVt4f9R3hrHwKA
         tTTWniOBe8ZDUfJHxfIXLJri/Oy9c90W05veiSjyzSNlhuDJqirU0L/TFyWddoRVppGi
         VpbB1ExXxl+tP1fBHeI4sY7twYMl6KlICgdnPcdIHv4E0yZhPy9yrLeZzBEO9i0kHJ4d
         tENRc5mZ1WpL4qViE1OVKdGrm5Ol9W596AyG5GigIjWnVz5iuQlI2Wi3Ul5jwSdKWHvM
         fkvqoVbFTD4dbTnI4gCGXzOrombT67JCsyRCDuEGslHAhyL0j32LEq0XuDRarBtzH+nW
         /GJg==
X-Forwarded-Encrypted: i=1; AJvYcCVf6yCRR2titknl0C2njmBk9aB8ETLwwyYLKEYFoUlCMSPUE4U+LXDYkNmLWo+mUBZ6Iiqn8tzv63VrhhnW7NII@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ9buvID0nWWOa6aPXjcuI/o3wNGGFD8+lqfQ5RXgSD1mLT3zH
	Xu5+KwDpeDQ5Wh+F9HFgIVQT6BTtB2gpNrNSHTgacgw87/IgDUZMY3XA
X-Gm-Gg: AZuq6aKVkrTPE3tHN76Fl8Jpt7sby7oyoy8AAV2KOBXvTWhR+skrm5v8F4lmbzRykgA
	eggRoPVtxXOC4C+qV1kZhqvKzgq38hHyaT5/1iixXQU8tbgw8rZsjis92Acle7yHq/OVvfFOAdY
	gaq0boG7jNXUS0lEAUh/xThpXQcV3/d6gvTtzCK0NO21dNDYfnISdrB/ouNNK3h7L4+bZ4aT4gr
	W8EQfU3KYZd88A7xiRlKpOSS5r+zXlZkVwj9rlB1iiAwtK90UZw894edRA+JGo6QoaanoLq5sif
	Ig0h9sCYT1uSe6qHKA+O6QiccC8+mMP7j2kMxQVrS8a2pk0JG/igdMDSEouIUdlC06AwzBpPEZf
	RSvyNfO2E/XT2Z6OEIPBqvdIdPaxPL+B16LSpsKz4vIVCfUQnKYQhMWikHvjSfBhM393e
X-Received: by 2002:a05:6a00:cd5:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-826baddc719mr3288755b3a.25.1771553657550;
        Thu, 19 Feb 2026 18:14:17 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm19607225b3a.30.2026.02.19.18.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:14:17 -0800 (PST)
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
Subject: [PATCH 4/5] ARM: dts: bcm4708-linksys-ea6300-v1: specify switch
Date: Thu, 19 Feb 2026 18:13:52 -0800
Message-ID: <20260220021353.40554-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220021353.40554-1-rosenp@gmail.com>
References: <20260220021353.40554-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_181418_647590_ACB64C22 
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

bcm-ns.dtsi specifies a default layout that is not correct for the
EA6300. Also allows setting the WAN MAC address properly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 0ed25bf71f0d..44cf867b223d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -24,6 +24,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -46,3 +50,44 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.53.0


