Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D610CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4Mp9ub8voKbHs9L0zRZ9WclG4wR0S5cTRrb6q1ZcxQ=; b=DbKd4kk9sfW3LqrLVaHIIA15lz
	8AcJ6vUxrgL8vwGdwoVFAfjfDvHWIir3vOSZDBl1n4NG1Rk/W26CBYCS1typHkJaASI5afo4GQAuq
	1WniG+paO6s9OE8k1pkf1QlPUU11xbTolQ9UoZlrg/YrWP1gsfoeStlf85vty5fRrKkQd4idHtutK
	QFakeSad0NEkTy6frW27AtFBMJRRaweJsy5ayAPRAjXcu5QnUpzkBUkdgecnL8svWASyjSxpg+9WK
	GMP4D6W9iEVq9IVqXTf5ly7SNTa7D5exx/ANO/3M7HesX4oWZfsiyvGhwHsSNvXCuZbwX79yF/oOQ
	GZVkoXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXYT-00000000iCM-1c4S;
	Thu, 28 Aug 2025 08:00:21 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXOW-00000000fw3-2GLr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 07:50:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so707106b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 00:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756367404; x=1756972204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4Mp9ub8voKbHs9L0zRZ9WclG4wR0S5cTRrb6q1ZcxQ=;
        b=NA8KVX8+8sDMKvXJ3Qt1yAzmf5VGZ0yQMMEGsJhUCGInMMC+EdbHziHs9dcuvkQiQY
         dUdBYf6swNTEVL2ByIxXZkk5Cj8hTwmLrVpK4Tpz0zXe+3W8a/TfAF66UruCoQLug7Jn
         XoUH9z2xv9Kz8V+oh73Ubq0O9jqIcWcj1Xo8uWSMleTsOFgUNB1R9c3ws9WFXEB/JRg8
         jEkdIyk3pK4kIChKDYQ/zeyBloKAdf4Chbuin+a4fOVAbf5JqL1BSi/qQSYmoOgnptIg
         7zcW3ZwX0T/y0jEFwyUPguhhj05i7GZKfDl3eDr7CANXDjXUa7QMUswxNGU7QCcWRao3
         vS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756367404; x=1756972204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4Mp9ub8voKbHs9L0zRZ9WclG4wR0S5cTRrb6q1ZcxQ=;
        b=baZ1VitX3jWQSUKW2qQeFYVGbp/lHIQUqrLw0FjthHDUiLKZfwimba9JFpytZcknIE
         +k2smA4NAyXy4NhnRX4u1salZrFtfGgq3ZHNCoVmTEl4SaVuAJ2dbTCugNI5nnnoXj2O
         Cbkh8MyCm9ejeYFBDYU2pIBEtQsS8LuU/AH1Zow99gE4UpRUJKdKiWMQsfs3S6Ujx6e2
         w2iWdp6rrQQSWuLGto+0607QR1gsVyijw7WCz8bhsqMQd2LCLznRQA9rZAacid5AL0NZ
         hjuLLJ+fiTS3t2rgoWrzdw2ET5+Rie7euvoggX4Uf23UDYqJ120p3lJgMN9Vf9/+fx4U
         ldew==
X-Forwarded-Encrypted: i=1; AJvYcCXs40MMmBuJiVw4v8j/YBoOR9Mw+Kz79YWMVjfkGxlktFyaszYl7cNHoQ80YEWCyU/lxNASO+8XtKVThcQNIxf4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb9n+/DAOMha9+tJH+DI8e0yw88eAAb20+DBj8/vEjbWHEaLKo
	803xBB41LNk2ciMouEAhtgt1BPiTdu4G3BgSV4iFGkZSG1wVVuecypmh
X-Gm-Gg: ASbGncs/EYQBtUr7MESsod0io1BFDGGRs5Ra+oJcYID+k9zuQSbuP2unIOeHuADCMOT
	vBWKQkQ/4D0Aap21ZYwLcl++e8ScvkHeGKpDpdixdLhE6TlCCUMB5Iq8D3RnZIauVZBOdJttUo2
	8pZ0sPlJ/5hcQ+MiZVtj499BKlF4GPI0ISuSlKbWq7kzazb19iWFXFozMOlz85ShBD+zciKbXY+
	9y5XttQHmQUmrBGRPEoCC10eGEBg4KMFgSTt83rqPRK+oKyrirKBbMW+D3c7zzz5YYSyv+nZXBN
	JZlaFk4153j8c3abgpcuFhty1pJh+DM0SRC0v4w8lMaQ+k4YRtDjtvRH+BUHITpJTwOyejYTBeW
	SSij5Bg01IoHv25yXTzvdScjLf5zEJTs2aWZH2xkAnodx1lmPWV1L2945DWpP6La41H32T0gm5y
	8j1SWUEb4ekigJ5NWwe/xTwzyl7iGx
X-Google-Smtp-Source: AGHT+IF9eB9YxPbxJeLTBkKeRv/n32ThRlEoj2lAY3V0vAzctsoiWpW47rObnmzff3aGP01kwQzURQ==
X-Received: by 2002:a05:6a20:6a26:b0:243:78a:8296 with SMTP id adf61e73a8af0-24340e06888mr31347144637.47.1756367403511;
        Thu, 28 Aug 2025 00:50:03 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e35e-4238-7ad6-5c9d-99c8-92d0.emome-ip6.hinet.net. [2001:b400:e35e:4238:7ad6:5c9d:99c8:92d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb9d226sm13272038a12.41.2025.08.28.00.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 00:50:03 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] ARM: dts: aspeed: harma: add power monitor support
Date: Thu, 28 Aug 2025 15:49:51 +0800
Message-ID: <20250828074955.542711-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
References: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_005004_577903_1E911B61 
X-CRM114-Status: GOOD (  10.87  )
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

Add INA238 device on I2C bus 4 for the PDB board power monitoring.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index b9a93f23bd0a..741d2d9b6d03 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -373,6 +373,12 @@ power-monitor@40 {
 		compatible = "infineon,xdp710";
 		reg = <0x40>;
 	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <500>;
+	};
 };
 
 &i2c5 {
-- 
2.43.0


