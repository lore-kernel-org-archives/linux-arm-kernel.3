Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18711C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9g6VFlFUjDGAvPM/73WOyE05ALtKuShtgVCvymsHIc=; b=Kf3sKr5oCrsbSNr4+LzsE3sHfc
	kpRgw1LtU04/rwjtU8iOOIWUsqqlFhKG6K5Qc9Lc+t0OhZB9aDb3SwhgsTv5ivB2qSvobV1MYH1/G
	vFFjWfEhzoKaHfuATRcrI0D5LZ4gZ5JMMxprzSSpIKRtXkdLT8FsNu20zMUm+KuyMkpgRanoZLclq
	UESTiBXX+UoQ0Fb06MmGuoJTmeEroANm23bj1/nlvkqYQvOe7FSUevVn+ZGjCuH9NbNbwtpkPuhQd
	s1DDi7RhtNsDmpj3WHiyMkHINJ60YQ9WEJaW2wQFtyAD4mMEu2QgcPPK82ePN+6KByq5dWzuLkvDn
	tXhTG/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6AgQ-00000001VSk-2GG1;
	Sat, 19 Apr 2025 16:04:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Acl-00000001V8z-0ycj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 16:01:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so27731565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078457; x=1745683257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9g6VFlFUjDGAvPM/73WOyE05ALtKuShtgVCvymsHIc=;
        b=RkopdGVqi1rIJ2/UOMlriswyRnj2X3y0N+v33CjAvR0TtFYcxrQs0TFOuYlw9+wcNP
         rpUYBC6MdyGEyjdX2ctEZyJvykZBhrK8eUZ6/NDS3CgC/Kl9S+S1U4oopb8EgX3QWP1b
         dntBE5BDXng2iCreyZrSLP894cUSCSnceq8ySVSX5YgkVIaKZ3a5c1Rv9aYcScUbtHW4
         ApUevQd9oGwUzobryqyNAEK5FsOrXZhuGzqg1lqH31WPOammmsYsXK3O07PI4+2cE/ub
         WT+gHWsS6647foQH9Ukkq3IEOIl9WyaOHrOyUbHbmRDwYVx9DpLILdRPLtk9GriLATx1
         Z+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078457; x=1745683257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9g6VFlFUjDGAvPM/73WOyE05ALtKuShtgVCvymsHIc=;
        b=ZtPnzZgs3+t6hpu6DnXCpmHTSvg0KaGlfAq7yoAz27LfVWhiQDPLgnHgpCWzAfXCub
         QDvwexAb4YqgHjoJ/SCrdX9dXur9o5/a6soaMvb0VJvPtpgE9tiCAyoZzSALhk0hU86x
         p2v96p5yobFRpdr44P07FOyywqq3hx6LMzyQ4I3pBGv5JAEWs53KkTJx5T/QWwrYdFbh
         Gg301IZV02Hl26OdwZOXo7fNSXv/EZ1deONK6tjTZd6vREQhHFA/8XxC7Ux7DVYRqz+T
         sId0ztJTGjnoC4WD1kGbGj+FqBYhwybu4suM6DCUDQXX6azy1wkABrTdUaw9xZauknGo
         zGNw==
X-Forwarded-Encrypted: i=1; AJvYcCVHpBGC2ZAx68o7Vhn6vGn6x8qwmUT6jGgi/XZ5W1ZaJ+4MtIsefzBL75pkARmea1jQZoXnwdtgFiy8VylNDjXx@lists.infradead.org
X-Gm-Message-State: AOJu0YwvIGRlBsyejg64lsUwjE2lPGFFpkel74ElcXMYojDVQ8JzM0j6
	Jy5jE99PeBZ6rTDsG/YxMgWie8uzt9tSwxgF1Gic0tX12Pgx7BFn
X-Gm-Gg: ASbGncvnYoD6/hFPUHXQ4zxPUrpFJVNxBEwk50mhixQD5J9Bmo2H3YWQEjjrI7BQuWA
	K6Hp+d+kFwXiXnbksgY91VBdV669vTrhpcboSu96LKQwymwnhrHzMW5x0BtTyo5L3PEIJXRd3Aq
	hqIgABY01ng97jn/gg+P+oqFkaz0sybDQo1w1Ez0k6RTQz0aHpp7VInc/rgW1rtGz/7KY559wFv
	P9vSgcEDdwhEkgzMYQzjA8v99gqyKDIr8Av//HXg7H/NNKrbyVyqojVb2PfjjsFYDXbDifgeZv7
	B1HxvFOkrJucI75rj277xxL8WXJZK/Nm4TuAclgOr/ltoQSdidrondVn9NtwyWZ9NYQetyyHd7s
	34YyAyd4vy/eRp+Cmjvo1XkYVAMSwiVYEIPldxKqQ79u4803XD8q7ObJYZEBKAqCFh+Andm+L12
	jTb6JShYybFQ==
X-Google-Smtp-Source: AGHT+IEFux77sQ4LMwqgP+aTNt02+1lfYyRsU4Xbnatq+EY991mQXeDP75cSTOaBlkG7ePdt7v3xNg==
X-Received: by 2002:a05:600c:4450:b0:43d:94:cff0 with SMTP id 5b1f17b1804b1-4406abb198amr42996095e9.19.1745078456892;
        Sat, 19 Apr 2025 09:00:56 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm65136215e9.14.2025.04.19.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:00:56 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v3 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
Date: Sat, 19 Apr 2025 17:00:46 +0100
Message-ID: <20250419160051.677485-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419160051.677485-1-pbrobinson@gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_090059_269048_0141551C 
X-CRM114-Status: GOOD (  12.17  )
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

This adds all the pin mappings on the WiFi/BT header on
the original Pine64. They're disabled by default as the
modules don't ship by default. This includes, where they
haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../boot/dts/allwinner/sun50i-a64-pine64.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 09e71fd60785..764fb191107a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
 			};
 		};
 	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
+	};
 };
 
 &codec {
@@ -124,6 +129,18 @@ &mmc0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "disabled";
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -286,6 +303,7 @@ &uart0 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
-- 
2.49.0


