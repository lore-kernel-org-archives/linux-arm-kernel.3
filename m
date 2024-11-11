Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E422CD3ABEA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIW7DyS2WH6Cyrvm/ebpRPiFw91e/Lrg2SI8ILkhrNY=; b=iOfVKgb8/UdBSAtjl1aGl5D0IW
	Wh3CMowtVdDW7yzpVCNyYQs7ON1+GLiVNI7Vlv5qckKd7c1V+g950hA1px/4fvcXbbYJTw0/MpauR
	x7scUIYeogKDn5tO3WPeYKvrLTw1Ky3IyNkVdxpL492M62a2tJ+uLjYZKxjDS+LOypHZ3Xj5q5RiK
	9BcQ+wrqXwQJlXI7oD8WPKaXTbAmAZXLDMosns9Cnc+Bpd0MuDKFTZ+yy64QOmD6wdYbi5lnA94kr
	hgY1ILSdRz5GDgLyuD4luGmcpzY0DHAn4QMyQt9vxijGf0J5Oh9vw01gaLrlq5uai6Den6ffkYLqM
	7t0F3neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ6y-00000000u8E-2kON;
	Mon, 11 Nov 2024 18:26:04 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYzP-00000000sqG-3Ho9;
	Mon, 11 Nov 2024 18:18:17 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9ec86a67feso837620066b.1;
        Mon, 11 Nov 2024 10:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349094; x=1731953894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIW7DyS2WH6Cyrvm/ebpRPiFw91e/Lrg2SI8ILkhrNY=;
        b=Eoh8qcRb7flhFpK2ZZESNnib9MWsaboP3iMv2eys3E9pYh+D4H84ShXThLkhp19XaR
         tE6SY8Zz2cM1vdG1HZymWGtuAD9HTKt8vydbbf1V87IQT11pqYGkjholDaIxvElRRa27
         ihTD+Nlx7zzCixDH9qoFo9eT9C6NUExbw/bRVG4qD7YiX5ClVIqBYiNpkxjbrcHsbh0y
         X0TxEEVShl3F40UExnhNbnmEQqQ9hh0rghkA1gB/yfA5YT0Pt3cEl+LY0gWPR0JxpkjF
         s+UcUxP8AK/rqB4fY0+Mqhve0xOMqNdm/VUPS7IzZnZ7c5/5Y/iAgrkHzoeqa+ER9T49
         1tOg==
X-Forwarded-Encrypted: i=1; AJvYcCUacUo8C1IanJ2iukV4suT+JfSqqM+nak/g1CaRmUL62XS1JGxmlVKbjvdJB2EWLCTFdY8dHF2PqBvbhT8OsuI4@lists.infradead.org, AJvYcCXO9ZAd7SGR0b348UmcNKkj8HM3JHkoArrK02oHWvQSwlDVaIzRbH3sF1ZC+wEf2peLWDm4EFWMhN0Psa45NV0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5fEqLgrn1WbKefEYZU7VJs63dy/uWPydhHm2FwXDDjPmOrNoK
	IerAvnjGLmruKeVVuiLrvPfPPCNyJjv3fxavk9WsOxbJihgdlG+P
X-Google-Smtp-Source: AGHT+IErIzWT0CMgys4ztmmaJblBGh0zeoh24ympSdB4fT+d0iex40LKQpmMSIi+f5EOJn7E8Pss8w==
X-Received: by 2002:a17:907:a4b:b0:a99:fc3d:7c76 with SMTP id a640c23a62f3a-a9ef001915amr1385377366b.37.1731349093673;
        Mon, 11 Nov 2024 10:18:13 -0800 (PST)
Received: from localhost.localdomain ([193.142.191.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17b64sm617868466b.39.2024.11.11.10.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 10:18:13 -0800 (PST)
From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
Date: Mon, 11 Nov 2024 19:17:27 +0100
Message-ID: <20241111181807.13211-4-tszucs@linux.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111181807.13211-1-tszucs@linux.com>
References: <20241111181807.13211-1-tszucs@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_101815_916509_CB6D71CB 
X-CRM114-Status: GOOD (  12.34  )
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

Enable UART lines on Radxa ROCK 3 Model B M.2 Key E.

Signed-off-by: Tamás Szűcs <tszucs@linux.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index b7527ba418f7..61d4ba2d312a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -732,7 +732,7 @@ &uart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart8m0_xfer &uart8m0_ctsn &uart8m0_rtsn>;
 	uart-has-rtscts;
-	status = "disabled";
+	status = "okay";
 };
 
 &usb_host0_ehci {
-- 
2.45.2


