Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933FAE77160
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 23:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pc5TgHTZwt6LxhA2uVCI7tpp7Tqag/4j85Yn1WwfR0E=; b=wijqsWsA8/8f3sU4DC9Ze64Bt9
	RGq7N/uMyGSvazLK9Ax4zu+OTqvDggYeaPpZyYTHOY/qhMyneolEd2ahilCO+xTg+CDwlUK1+MLE2
	BkQvAic8+aq+mN/Wab9J6u3rkQG5LSi6J4iXaVaN3WkwwNcAGXxTFO1b6gKDxX8vQx9Ny2/ANM71w
	Z0d17DwXSu99XB8elt2ElZsrUCrFqID5WGyAJtk5JDlqAI+k0D6xoYMUaNyic5lBefVcSQEVXkPuZ
	lWhdW7nF0hapjEy1mUrN2uJ1F+NBKZeJa6K7TIfo/g4DU54ccDK3XbLEvqxdsPob6gd3KE8Lw/B+u
	qovIrEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIcSY-0000000B35R-2LUl;
	Tue, 03 Dec 2024 23:37:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIcRX-0000000B2xe-42wV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 23:36:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2153e642114so46366575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 15:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733268994; x=1733873794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc5TgHTZwt6LxhA2uVCI7tpp7Tqag/4j85Yn1WwfR0E=;
        b=caqxCp3VMcJgX7Rvk65vphwB2ZSgoeUZGXwVy3ObN5O+j882aRvoIb0dCWX+ttDRE5
         EI98j+TYa6YrSULZeCfszYuDHqCaxsGpJREzF26FTGS/2/hRGj2ZFHb+nOUVrhMIxxc8
         IT5r/Bm1Tdy5Nj4b2EJvKMBNKR7M7qEFf3qh6SPZCDwJehjbcCZD8yDDOZl4SL6POnFU
         GsWrQjBXqWx3RHZaC7gLEKn7EtoQANZHCrOptMA5dbxiRUTIBOKk/KeTJnD2+I5nZ5Q2
         uEuYlYiHS0E25dgaYT9+1tFMWY2f3mZ8g9mpk8NBkPDHRDkT+GVYmYHnB9vpDSIom9GD
         UuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733268994; x=1733873794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pc5TgHTZwt6LxhA2uVCI7tpp7Tqag/4j85Yn1WwfR0E=;
        b=CBDCIa2TLKMAXr3cHTftDUMwPt1xXRpGjvytii45y9MUG3VNKzwefLPuECOvkTU1JV
         ciaOGILCdLEwq64CatW0d7ZvUagHe82uG8HQC5SSVRx1HxRx90hyGyVUh8Z5ZxTS8jj8
         fT6xIOuHmVHUK/TuKiv32gxJtnqBfIYPKoSJzu8VSwMQMop4iXQ2GBj7WyP8Veo/eo2l
         573qzeLUJrBKv79zMdyMMAk/SY3tcujgNBmzAFpycIxkpnJPw9dZlcElt/Cto+OOChTk
         Ban7UNDjG7e6QDfwFuXMN7OG0ZZUoWGt1dEv+D3BocCj1RP6D1LCmCs6d1h5mAdjS80y
         IbpA==
X-Gm-Message-State: AOJu0YwheGFpv5tuYBj5Mp4yb7lu+nddj+1tMsvH4UkkK7KGTtnPX1uM
	9qr3lk6gyztIYODUfoeTV7yaBuuPvcLOPKYgsSnyoQkS9uHeBkYrU4Rfx4SGaz4=
X-Gm-Gg: ASbGnctq9GWEqYAoQuJsGXpuZQfpHVnJheTlocGrmJBVoLqC5gGRTRf9sriqtiVXnbG
	MLTesbY9cR6A+wxJaYDNn56YrG+rNHb+oL1vuAkqChXqQ9KVP8m3/bK9HM+yIUwVAR5n3n99jCY
	wMnd4N4jRJe2D43cRSOvbo27QSwVJjFuQd4NuYcVlKyZ0eJFp7RZ70hMbPP3KJBmzSdfDG0bgqN
	j9sqxeJOCi/zo2yNFSJ3FEsug==
X-Google-Smtp-Source: AGHT+IHf1rNluLIVYS/a49eRccOObI5iM0YG6/dTrhTZp7oNxYqcMIrUbYetBc5idn9jC/IMI8gNOg==
X-Received: by 2002:a17:902:dac5:b0:215:772c:fa6b with SMTP id d9443c01a7336-215bd241a4amr48023815ad.40.1733268994177;
        Tue, 03 Dec 2024 15:36:34 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215964b6b76sm40401725ad.191.2024.12.03.15.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 15:36:33 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: bcm4908: nvmem-layout conversion
Date: Tue,  3 Dec 2024 15:36:32 -0800
Message-ID: <20241203233632.184861-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_153636_003159_642436CA 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
index 999d93730240..a5f9ec92bd5e 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
@@ -144,16 +144,20 @@ partitions {
 		#size-cells = <1>;
 
 		partition@0 {
-			compatible = "nvmem-cells";
 			label = "cferom";
 			reg = <0x0 0x100000>;
-
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0x100000>;
 
-			base_mac_addr: mac@106a0 {
-				reg = <0x106a0 0x6>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				base_mac_addr: mac@106a0 {
+					reg = <0x106a0 0x6>;
+				};
 			};
 		};
 
-- 
2.47.0


