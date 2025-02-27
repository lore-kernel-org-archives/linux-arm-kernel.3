Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BBAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=802LlVbArNu3UH/6HPG9wGpxIsHdhgKNSyCzYNg9lLs=; b=qZWRMkhvcMxpLtXWryfLgTWlXl
	9/vAkzL01RRE0vRhB2eGO98A0IofeXoCCIM69tqfOC46jD0eCK/NBfoBMIXqjX9sEIVuSrrqoMqGQ
	x8QHU8yNIuNu+efZrWRwIEaoGHkxlaNeA23WnOYHgIKZqixBijR9VOM7v3XiJ8qitN5msSyOh9RRO
	cKH+4PehqZfiKgTqg7hI9LvgSFlSYmGBQBsv2q40mxTlzuOjAPNpIo6fwxdYSAXoyQq24hd/TCpNn
	zaZ+Wnq5gLdYuWed8ayXjqkS+bDbEarw1eUwca0cuDXyGcCKOMWqcGe+WCFOyZPfDzZGIa8RTN5kK
	+6xYDZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnqg-00000009EHl-0vae;
	Fri, 28 Feb 2025 00:03:26 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnkW-00000009DZX-39yh;
	Thu, 27 Feb 2025 23:57:12 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5fcd686fe0fso800030eaf.3;
        Thu, 27 Feb 2025 15:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740700624; x=1741305424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=802LlVbArNu3UH/6HPG9wGpxIsHdhgKNSyCzYNg9lLs=;
        b=MO1nAH9z1rLylkA3Uy2WcIlTeSpT99Vm1SjGuRm/HEkmaYd0N5hCSNYzATKmkV4+9u
         OnTw4DXR2Q3pCuDAb0BsZd2+C+M7Knua5lsY+UJxRJHMkoFQNV4RtTCJplHDgUVpDpvl
         0BlRCrBX/fpkzDUrdVdWeDtzX/C8/b3wuescuAdzN0Gz8m0UELSwL7H/VmnYzguR+9CT
         RAzN9TtKbNDYlA7ua+W6kPJDw8tWOZVbxjyLPAYSHYDSXxw0uLfvYuvYTz5y5wMsI65d
         HJTkKabLZ3i/Zxdl5/hn33aPMnB4CAhDPQGQOZSvDIdQHoWqcoEElp54fXwp+8TbBgz4
         phFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740700624; x=1741305424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=802LlVbArNu3UH/6HPG9wGpxIsHdhgKNSyCzYNg9lLs=;
        b=muJ7gAgvdV/slcowfGuFzyz3clDkcQyJvEFEvX7/g6gy8CPJWu/IxgwxY4CIg8rXlL
         1k1JFXk0JmgN4bENS3/4z9AyoGeXKc3PjKejJADsDKSmbNVc9TieMgic9javVFKOF93N
         +Rq7Ar80vqccFDRFopBsjPuwJIAZFevo2RquHDojSvvKMM0cCWhAL2SCnHU8LPjDIaZl
         ku9Hp8uBzKsVKn5Wnn6+CadvKUq4oasQmrpZCrFIa69E0wvONLB52EFDyTv3XUNWFBJu
         srMbT33vtpOQO0uGquY0HzQ6uj9YY8V5bTbfIvLM3XsUtSdO8hjFUs5Qacrda6ygHCf5
         enZw==
X-Forwarded-Encrypted: i=1; AJvYcCUzPXshXjb05LIvOs4D2PUAlL8HCfbg86Gk8CfPocrxPXsNT8fmHXwOVjZ32MssUIgtn1TRxvjr7ZW6SZYGSfI=@lists.infradead.org, AJvYcCXEzbRpMdwWMCzlHKnf6tDnlFyZR9ohlzEpJMwh6Sn+FdUgjCOlI/M00DDNmerhQt+c2dayOnGqh5HqA91sM5Wu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7R+KOvU5xhVI97bVgzndM1hxTLQ1siT616u6wFJNeW+nvzNy+
	HE+4Rg9pL6h0MHKYBsir+R+NKbzf+tiCf9n4tyHajA+hOCv0qxbR
X-Gm-Gg: ASbGncuDPofVZTRRQlkRTg9K0DBcElhn5cOAJHay4BL0sM0JAmOkmKD80rLCjMj7B/O
	0tkNKwJa/QGuvdYbzsLPh/txY2txqQzQGGT1lq7cr/8nqcNWlMVKAj5tpeEW4dh+iL0PbUenGQN
	Zr5m055PLEM6qixdiyNXRWxZp7zReWuw1ahdfDyDrUCHbOgCgQeOij51mYM6+Dq9Mfe3BRBrrWu
	5drMVK2SErO2+lAbi/695Yc4ueHZHwM4m2JRTfCGpZxZ0kbF2BqsE1yYzt7GYupxBqgXCDzMdsc
	626u9kL6qg9LdocdE2bs6lFAqvjg7vGu6Jg=
X-Google-Smtp-Source: AGHT+IHfcXVGC5tQ5bFrNZCE4XgxxiA/w9DGYj3TpIHaFSoN22Ho5fH/P65GiVK/y7C5uAZNrPO7Gw==
X-Received: by 2002:a05:6870:e2ca:b0:2b8:84d7:ddd5 with SMTP id 586e51a60fabf-2c1788706eamr647963fac.39.1740700623830;
        Thu, 27 Feb 2025 15:57:03 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:87c8:8ae4:f338:6188])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afd7694fsm443893a34.50.2025.02.27.15.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:57:03 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Florian Klink <flokli@flokli.de>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Ondrej Jirman <megi@xff.cz>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH UNTESTED 3/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Plus
Date: Thu, 27 Feb 2025 17:56:22 -0600
Message-ID: <20250227235623.1624-4-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227235623.1624-1-honyuenkwun@gmail.com>
References: <20250227235623.1624-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_155704_788112_82485FE2 
X-CRM114-Status: UNSURE (   9.74  )
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

Enable the second HDMI output port on the Orange Pi 5 Plus

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 0f874b87b47e..53797f633d3a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -26,6 +26,17 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
@@ -125,10 +136,30 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi1 {
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 &hym8563 {
 	interrupt-parent = <&gpio0>;
 	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
@@ -342,3 +373,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.48.1


