Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV1KL0B4Ol1zLYcOywJS50VMsEVaOjK36lDCk5xYJ8U=; b=rpO5pZYb8dlbxqEaFtuffgVI4U
	7x/DQnwRIO6WR0/gq8XzpJKeTsuIhAGAjk41Gp4ATi/z9FEQhAgT+hbjazRLMDM2NrF/44kk2Yn0c
	fbnG4Uu7cq3hz637Vabth9793ukomeNZnVrPahxReM1xY/3MOlxUcS3uuiDhzqe1z5dgH2m0XsH7+
	DH/rAVrkNdoLn/PmE38hK6pTy2w4evWgPtAxzsM8rlOg6cNJCz3o1Hd/zYK34Bumi3WD9P9W9onLV
	J4Mpu+fHMaEDQ66g8zk3qkLIe+f6OdktQKLf7vpe3v1CTnPtWk5T8ZqZBWwIrdM9p9B8vzaX0Yv8S
	WhKT9GSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6RNZ-00000002Q9n-1fg7;
	Sun, 20 Apr 2025 09:54:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6RHs-00000002Psc-0xnD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 09:48:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf257158fso21051305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745142510; x=1745747310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV1KL0B4Ol1zLYcOywJS50VMsEVaOjK36lDCk5xYJ8U=;
        b=ZSOKizD8ukxiBbwY+5I3AaX5TgXa5ie34KMXjZfvRlmiDXBLTL4Ml7DG8bB1K+Kpir
         EfGeW5rcOvHiFf/54xGK2zfygyL2nBCRHfSBttnOpGKlPP/b0iAnzH/oCwyDYhrPh18v
         KPVCS0JndaUEc4cNUh3wpjGzuohnkQskke+SbhjLuWP3OfLedBChForex0Tz9YqTUIwS
         RVt9HC92w22z2AlhbYV5h1m1Fshusoi0KPwJOEchTtFVWleB+wxcKE/K9sXp1d8ZPK22
         zo4FCOkWaZ82V+MSjuaV6vA+PeGjh6kLRKp5eo5ndGjoqiCISl+yLZ7Z98Q7rrjrcFD1
         PFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745142510; x=1745747310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV1KL0B4Ol1zLYcOywJS50VMsEVaOjK36lDCk5xYJ8U=;
        b=KXiI714cV0XXWm/N9lrhY86uW8FLbf9gsZjy2y0hAU39ivRcSx/JdfHCNBpfun6Erk
         RJBUB6lonX7GxIUE4/ku3XFSQJumsoACyNOgn1t/ERD7CysH6xmHcoqV+iEi4ZUSACAO
         SXKKzS2Ypu9SotQHw/lcyGNzKzblFWRZ/F7O8ElmIFI5hied37wWqu30FMR6eHrOkS4h
         cebIXeUuJ/c/1n1JByA/X+8VG+tE7WOUfNyqZyVvTTgL5j9ju9O8vyAcZDX9wC95Wb01
         lbF2c604UxNvW7jQIDmesl5Tb92mxOGpmOV7UiY77smxH5gEfKbgRgjMCPnmfQeaH69F
         tecw==
X-Forwarded-Encrypted: i=1; AJvYcCVWSJNbrDpkEppwp7oQ2qXuR7K7gG2H63ZwTV8NlFlr/w63p1xEJ9EjtAjMbvCbk0ih4WCniOVMxKvcyaDktgKY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2fVXKwJWsBQpCtE71Lahntk6WeRVPUwncuLjy6tYmDaZj/CaB
	WzNW89oVqW+zXnWqEJHvQPnHHtNCbCsB5SnewygupCw0UW3Ffx6e
X-Gm-Gg: ASbGncsd+yHfux639Y29kpjs0ELHcD1IdkzS0p1z1vCsNNgqNOChrMerA3YaOLTE0Tj
	ATiVwv+567OTwL/y0cYolsDhThctApczjoZywZ0WzsC6XZ8D1BtyU757ex2G1XWGGXOZPc4y6jj
	kacznVMXtDnn6SfaxcORYE5YGpc0WIX0uJMDmTymugLeT+KElL85j674LZ1Zxb6ICpGl6HY84U5
	KYDsm/PBtW4VJpqqymT+S2EZrO2G86ivpdHzZBpPE4d9mGJUyhMxz/6IVw09HeEl6FZtCSZnJuX
	IMZN7MgfRmRC890ITP6yKZLDE+0iv1fi6P70ADLJRYe3cNreOgHKC5yTqszG2TOvVgdeq5P42Y5
	eIAurcgn77E76IAQPpUHS14R6ohEsIm0iHjAgvuv87WWi5H1nxKAXO5aofvz3ep4x7fR2fIr8WY
	A=
X-Google-Smtp-Source: AGHT+IGLhlzrje0W/99vHutqnqraxOZnv9q3niHg6lZbOoS4HG8LPSq62S6s1AF4Tg3e6WlI1VcYEA==
X-Received: by 2002:a05:600c:c0db:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-44072c7f6fbmr44810305e9.16.1745142510468;
        Sun, 20 Apr 2025 02:48:30 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm8273712f8f.49.2025.04.20.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 02:48:30 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard
Date: Sun, 20 Apr 2025 10:48:05 +0100
Message-ID: <20250420094823.954073-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420094823.954073-1-pbrobinson@gmail.com>
References: <20250420094823.954073-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_024832_269748_B322EED7 
X-CRM114-Status: GOOD (  11.04  )
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
the SOPINE Baseboard/A64-LTS. They're disabled by default
as the modules don't ship by default. This includes, where
they haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index be2347c8f267..231e652cab67 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -103,6 +103,17 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	bus-width = <4>;
+	non-removable;
+	status = "disabled";
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins>;
@@ -175,6 +186,14 @@ &uart0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector, with RTS/CTS */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
 /* On Pi-2 connector */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.49.0


