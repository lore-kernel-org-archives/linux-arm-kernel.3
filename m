Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FBBC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 04:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc9s60m7yHOEPhLyVsTag4aDgZkdRpuEF7l6r52HQ0g=; b=AIk8x7i02vMQOlHIFYLFIo5fJc
	kJNbXNoKPmzRX19+HWKmsxr8z8aF3+FZIXJREqlmftR3t/X1fxV7zDqFRJR5EC0bcvkIvSxGcIzce
	J8qwE5mzHOoajcovwF9KK7Vp/Dpy0aQOiroR01MTgzegg7qC/NVtBAtB8yEDHcRHZyOcgmJ1gNG2N
	PDiKN0zkF+8WWAfbzjffporprMZr+mTXwC7K2PiFW4nFD1bPB+b+7pVKmEPKc/wjwyap/ZIcIgvWU
	eMJpJfy4YtJGov1rqmB6wNZ0qz9mQgDEOa992kPj1DAuOZiwZWyoCm/ygD/EozH6XIZtLqQedvn4e
	aSj8eNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tky17-0000000GgqR-3nO0;
	Thu, 20 Feb 2025 04:18:29 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxu0-0000000Gfwm-281O;
	Thu, 20 Feb 2025 04:11:09 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-724d1724657so844641a34.0;
        Wed, 19 Feb 2025 20:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024667; x=1740629467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc9s60m7yHOEPhLyVsTag4aDgZkdRpuEF7l6r52HQ0g=;
        b=QFpmdltFesx9OTgloL0SSiEQrUnjgFewohLlZPKBtcBe+swPsheTNpFSFGsLwMnAUv
         PaL+HDnn/8ydKnoDl7O8Sjvr7no5G9fUpD4HY6AgSxS1BUIZ2rtuxHzFGK+/4o+OiI3D
         U0k6aq6zpBJ0tv0Qd2tsDrYB31/54jh1Bzy0NrUC0n5PE0Tu/lP+aH5nMEln1jSR3y75
         3r6RdW9wL0Ut5u1Sx/r22vDhqHZbgmmyB80zHjhgqxjvCSEbnSqIcUPq3BZEAySbR38S
         olcNeslMY18kPgzDj41J6gBWzcxcyQN6m7Svae1m5E116cxJidZGGCDLKZLx7Iz0UnAT
         WrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024667; x=1740629467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wc9s60m7yHOEPhLyVsTag4aDgZkdRpuEF7l6r52HQ0g=;
        b=bOfGgPr+ZFcomfX4kdcMSlFKtcZcso1+XERVMq5ZLPx+1GTPAU2ao//uoqgfl2a5/2
         3Dgw7R17WqewDbVrllCvhPyUr7nPLzV63OvcQu36YHXztIXKVT59T4c376M5sOahZ/Qi
         LR/hjzHCwq9izJHKLcbet+lYqGoZt8HkVCxjTcsOzuyxBgTlMYh0Z00RxGgP9Ks0ZJDh
         uKUkU234Pcio3kYoLreULNMuyCQDhJdzF62n2ZQtgHHeLR8zL060vfPoqvXQYy3UU2kC
         7A21b3lfxaM3/BaoamA5i7nPE0YWQJlKJ5Jy6BXCbNVOzGvTnehZ6BKBMBE9seQleM95
         7Jbg==
X-Forwarded-Encrypted: i=1; AJvYcCVQpsUqhQhZzP4onHmRgh6KGIAaSfmGHqg9TdqMfr/Ov6/WZL4IzD2P6liFXJkWiXyF8TJg7o5/bczRMVlRWxfZ@lists.infradead.org, AJvYcCWy70qNfkR3DMNu7MADcAnt7Ar/IR2OTDaeQbd0HmOetlpMaLhPBWLWZeCDdoP9/CdyWfh4Op26eAy4VPsZAfU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9HiUTd1eq5DPBg0P0ETE/t/p+ZwSD17Ws033VwxYZilnwW+IJ
	+PcgOTDerLJIhrRaiuqSVBZ/qYvZwEGf+Z45vlU1WlsKgObOuGMN
X-Gm-Gg: ASbGncvzYNqpVodnDQxpIYHIkNFyEQGYXeAxJIMqolnmbDOzP3LvDO0q5n5bXUZ2AEH
	o1T76UXMibvU7J89U8O7Yw4366SMVOX2dKt2Zu5Nbl8w4VNL5OnWJOGJlVjkHjLTrjtbtLc+y7c
	6qlgTbdIvBi+MSoMeR5hh0s0d1FbPX5L9mINGK57ABf61KmlSNIa+eoxRbMU4Ze0Xsei2hFWGyg
	OrGTvYVb8lWCGJldVczBcwhUv5AUBPmQ8/rRtfoXenqPVHHfprbrl96xfebninuIzMmwbX2i1Zd
	MWN1JYpX0YNAraKKImHdYwtV
X-Google-Smtp-Source: AGHT+IFcFoaXxN2Jl+KgxcP9lwJBvJn/RwJMifaJCCznxCysMElgGMzyJJcWoDpzucTdc6pY6ySn1g==
X-Received: by 2002:a05:6830:7305:b0:71d:fc70:d69f with SMTP id 46e09a7af769-727419e59d8mr1833552a34.8.1740024667519;
        Wed, 19 Feb 2025 20:11:07 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:20f3:777f:5ae9:b018])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm1025875a34.47.2025.02.19.20.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:11:06 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH UNTESTED v5 4/4] arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ultra
Date: Wed, 19 Feb 2025 22:10:10 -0600
Message-ID: <20250220041010.3801-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220041010.3801-1-honyuenkwun@gmail.com>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_201108_563464_CDAF3E96 
X-CRM114-Status: UNSURE (   9.20  )
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

HDMI audio is available on the Orange Pi 5 Ultra HDMI1 TX port.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index 5f673ad51686..5c560a14719b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -42,10 +42,18 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };
 
+&i2s6_8ch {
+	status = "okay";
+};
+
 &pinctrl {
 
 	usb {
-- 
2.48.1


