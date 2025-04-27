Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC83C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehkKd/S9OU9qUgpjp1lZbmN7V0G9VzQJCuY2t4gA7ss=; b=O1leKDjZ9JZM9W55PTdDQgF/bh
	U8lHPzwJu9oiwsOSsQ44c22QDo5DfdZo/aQdCKcJ4hWdF3hQ2AG4VqPGTwGXcpKpJ5agN56bHbs2G
	YZsz7MHZA/QycwpD1+Vuled+/+uE/qSL0kdEonCUyj/tm3yB1OBpw3MkbOTqNhvFeAlnLlTFzQvBi
	BshFfUileix2YK7l3iZY4z/45hwp3cT1fKh39mqEFzObFBq1yuFrxTPNHEkX7q/pcZyN06gJN7Y2l
	NstTvElG5A44rq0Z5ex6kcgWw98FGNijgXd7dM7anFRoIx/OmnI5R3pYnqhrxp7+JF/x7Bvwupami
	OcUyBuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u934D-00000003fhZ-0Ei3;
	Sun, 27 Apr 2025 14:33:13 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92wo-00000003emK-0VXi;
	Sun, 27 Apr 2025 14:25:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30beedb99c9so36094641fa.3;
        Sun, 27 Apr 2025 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763932; x=1746368732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehkKd/S9OU9qUgpjp1lZbmN7V0G9VzQJCuY2t4gA7ss=;
        b=XH7/nsHnhDO2TedbqysgBWj8FUPLC/d0qOBDI50uRbWYx85uiSRMCZm8vdvbAnoh9W
         WiIdswlcLpnGPQ/s2OY3RRiZJUaI6n4S/t8IbNJp8fB6ATV+t6h67Zv0emgQTKbMJOqL
         7uMcdAlhK3pkcfNwVqD38ykK+NUyr/0CxT4QLSt+wJNxs7D3Ub00HPZwvmBIyVHJ3Rub
         iFgQ/jBZRAfiVGnA2ltf7/HxxnP6wXYZRMZm5pncfTTTvm3ur1MqvQouIHMapPl4p7Zj
         ad/89NKgPo+4ifed9wAhl3/DPh5xwdgZx9kszX3GzyNj2Udk7TA53j6H5cRJfHwmrYZu
         KmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763932; x=1746368732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehkKd/S9OU9qUgpjp1lZbmN7V0G9VzQJCuY2t4gA7ss=;
        b=oA9xXYMeuLuMpqhHVbrJJj6761zcsNPVulM0rv2aHQYlZmCJkIIPvvd46xEGg+SaOK
         pIMQORgUhC7bTi1IRhNdYXIGXm/+Alh/eDg8vh287qQ5ugSM+MqnBCH6rF7FyPNd0agj
         S5V2qNj3fZVShEB3CLmo17ZgnsXxZWP3vLEr1A4qjpkdlkjAet9nlHIFLEB8c/2m6fWf
         WHEIj6a+Kp81tbp7GiJ4ypAhSaSso2obPg+QHRSoJWgDmIYpvpZh4/9P0NRicl83C9/C
         NV9AmeLY24UYWfnLojbg/p2NuvkZW/GWzfWthr9Q9wGHU2EAACyaYfz9x+LH6EsNfNFc
         SC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3dabI991BTja/j+KVcWk3a86ItCweXi0k1l9nJsQbqsL8ksucCEZ91lMTIyYYjMYS58Jm/3aJCC7vbYhNCW5u@lists.infradead.org, AJvYcCWFUguMNLWyXW4PyuMTvdNMGvKREk2U2uiFF+0/f9xz3UoDJ1wBSIMnh2ktzvVYnOOGZQ4mY30Bz+dit8I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjmkxc847cegW4nBlX/IPbO+neAugRRWid3kI+gnlUaCLxbXB1
	OhiyUKkqulHi9z3jgOOPIWn7H/ObwXqFaAl7uZyYWbnsexeNs37dwTDGl758GAH3
X-Gm-Gg: ASbGncsDE09N+iSJmCd2F1jhjrleEgU42Nb8Jmh2DJzR4Vkt64rBmw/2QX7L0sDRaSf
	P4PswJddvonj3RNiFyMG292CG7jqk2Dntf8qDMFOV00raR///CP2jkMfpa1J6UmSK+LLI99tF9a
	eOPL2kQqXmYJT64YGpDOgqMBTsAxTlHOLzu53tBYMuQ3bYQMFYnJ3J8sp64QEjb3hklJjHpXyQb
	IkiCcPGSFj1SG8zqVHsRexnCHMUf5u16LQD3/RRNt5aCAyfA9kNz2FlM9HbXT/kxFPBQjTbcXTx
	JJ2mJ01S1oM1YQzJipsnMGsRMLQRy0BmYCfzk2R2IEUOYfk8E5EarEKS
X-Google-Smtp-Source: AGHT+IGLFpAqg2RLvOpyGg3GqdGLS7yvAzNGtXYHl5esGTKNk58qPrWitKbJKkJMbZDpUAYewQ6wGA==
X-Received: by 2002:a05:651c:12c9:b0:30b:e983:9ba0 with SMTP id 38308e7fff4ca-31907022667mr27391711fa.23.1745763932152;
        Sun, 27 Apr 2025 07:25:32 -0700 (PDT)
Received: from localhost.localdomain ([178.176.177.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb482b1sm17659191fa.29.2025.04.27.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:25:31 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sun, 27 Apr 2025 17:24:55 +0300
Message-Id: <20250427142500.151925-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427142500.151925-1-privatesub2@gmail.com>
References: <20250427142500.151925-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_072534_158571_5BA7922D 
X-CRM114-Status: GOOD (  10.52  )
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

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028d..2c26cb8b2b07 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


