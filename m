Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8CECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHgH8oy5n+l+ZwlFEabPRf0dx6W3J1c630BijBzFt9g=; b=qqf0/b/29EGGHzj64UxPFtP5Ri
	WenkfWniX2DZXAzSZHav0tW1Y0yZK1vkzO2kxUuOiJVAJ8nUKE2r9KmKqh7kLW+AuWgs+m0UG1HAz
	im7L1dQ4Rw046mDb/KCmSl04O7C+i5Fq0qDy+H6DcrGph96Umyu6RxgV44Y34if0PAXgwn9GU1//j
	MABU11YSdPwBnSn7YMgdZUfCTk6YwgxW54tI/DdrKNLNaQEs6toi+C9Vb6OhHilVEgwpNcxvwbjtV
	dGx+TVPwQokyMqzPye0BYLJRAFhd6mZi3wtuXQ1WQGRpB13ZZV4Kz6Vff3t1fy+TQO3zCCrWsXJ1Q
	RciRB8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRT8-00000008NKk-0dYQ;
	Sat, 30 Aug 2025 19:42:34 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRID-00000008MTc-23Kr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:31:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb78fb04cso527118666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756582276; x=1757187076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WHgH8oy5n+l+ZwlFEabPRf0dx6W3J1c630BijBzFt9g=;
        b=T8HJLW5SjRJHx8hYDDQB/jxwO+UqmjzPcR7nUtPM1SD+D03SUvjivJlxv7u3R20L9c
         tGaaUgp3noDQBAFoLqmF2GjIxV0Hxan1zqWjZKj5mBkQ4E4ImEziyPI87wAWMLfCU7B3
         OZiZxylE6oamJQjkUOc9uIiSQS8pMO1PknnkWv8/hBqQQ9ZMzWNjOnC+ksh1ayHTjg7S
         BEeNfwGd+aDX+QeTqJdtjZEIOAY3g8R5ZRH9ngRKMKZ4i5uuhkn4jG34HzD35vWMM++z
         0YYZB0eM6qf5kAZ139Hu3aQ+hAExDIVGY+h5Cu5gAxoMlf572Qs6K3JOohZgycuSAfGV
         /BzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582276; x=1757187076;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHgH8oy5n+l+ZwlFEabPRf0dx6W3J1c630BijBzFt9g=;
        b=txlb6+g63NnnGvrEBQ2WP4Xo4gth8t3wr4P0gWEU0Nn0nCgwRHiTsvMbAlvbhoOe99
         WisBdKP5bNO+1FIJuHLEtsdKcnPsf3LRgEiAeXMBjwk6dNexOmyYKCmgKYwT1hxyj5A1
         XrtXebTzFJuotizoMIQGx9w54ji9VqmSAgYktjEZLpJPcozDiXnn8ZFbf3qPZuYhwM0V
         MJRm5/7ueyk4PlrhP9HuBkbIs9pMlNXlT6WrMFH84RScH3ZO7By2DO0DMPpTKCJvg474
         TbXa2M2fbWEWN+MICjPHy3pcpC6Po2+rH+gqEU8XpfQM32WIfCu9iUXlewmJKZp8oUnL
         O9Eg==
X-Gm-Message-State: AOJu0YwsSu7obZRfDH/7hi+9iODJ8dxYH1pU60fxyRh/jVYGxZYVP0dW
	cpn6v+nWV1mcCSZVjWkN2SO3NgCoWkQzPB8fY09BJ70wzocnXJa9eJsX
X-Gm-Gg: ASbGnctnasqGy2YA6/S4GGPOUzis4z8oiv/5dJirs1WKfgqqzG+Z/U4nuyPcLe4Oj0i
	7wrkwWjSsHr6kk8stFYRtCWN8D9rivev9taA/J9IpXjQbRGg64lDLMaIebFBKgrCsK9YPlk3ElG
	QYUKJ4T6obGe5MHsdfwCK7qgRfFNyguzDcsLas8wqgoJ+42Z3C0OES58jPKcNFALRwyUog+2lIp
	EYUPgU41tKKhAg8hd9LKTld6xRdaLQI1sRQuaNIbhjc3DU2k8zfif30B/8rEhSqQEPbxbeLTfrm
	hw781ouLATU1gJcA/fH9bbBV4JtRezmKwtGR2OLpQTEEuhdFYTOC/Z/9ZY3qMvdm9c95W8iX5VC
	wsH4FfTdN08oTCBQ5rRPcFoRtkF1N141bb08NBPdy3J7yKFwnKrURAroHu0na0s8k4tW32omIcx
	qGrgo/lBGuMrVjcjDn0+zOcpVlYhoMmPTX6Sdl28yw9glE0QlmFBZRtCLi
X-Google-Smtp-Source: AGHT+IF4j9iCk4u5SP+oeXkkhHtMTGZdfBYtCfpqO9ohp/v2puGIBv4BvjT1ORfwCEJdUw53vlF8Nw==
X-Received: by 2002:a17:907:7ba0:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-b01d8a30045mr263387066b.5.1756582275714;
        Sat, 30 Aug 2025 12:31:15 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:d113:449:b8c4:341? (p200300ea8f2f9b00d1130449b8c40341.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:d113:449:b8c4:341])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afefcc66431sm465153766b.94.2025.08.30.12.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 12:31:15 -0700 (PDT)
Message-ID: <64284769-ed7f-473f-8e1c-30c217da5c87@gmail.com>
Date: Sat, 30 Aug 2025 21:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 3/5] ARM: dts: st: switch to new fixed-link
 binding
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_123117_528629_A7E0654F 
X-CRM114-Status: GOOD (  12.28  )
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

The old array-type fixed-link binding has been deprecated
for more than 10 yrs. Switch to the new binding.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/boot/dts/st/stih418-b2199.dts  | 5 ++++-
 arch/arm/boot/dts/st/stihxxx-b2120.dtsi | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih418-b2199.dts b/arch/arm/boot/dts/st/stih418-b2199.dts
index 53ac6c2b7..5231222b7 100644
--- a/arch/arm/boot/dts/st/stih418-b2199.dts
+++ b/arch/arm/boot/dts/st/stih418-b2199.dts
@@ -103,7 +103,10 @@ ethernet0: dwmac@9630000 {
 			st,tx-retime-src = "clkgen";
 			status = "okay";
 			phy-mode = "rgmii";
-			fixed-link = <0 1 1000 0 0>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/st/stihxxx-b2120.dtsi b/arch/arm/boot/dts/st/stihxxx-b2120.dtsi
index 8d9a2dfa7..f45c65544 100644
--- a/arch/arm/boot/dts/st/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/st/stihxxx-b2120.dtsi
@@ -147,7 +147,10 @@ ethernet0: dwmac@9630000 {
 			st,tx-retime-src = "clkgen";
 			status = "okay";
 			phy-mode = "rgmii";
-			fixed-link = <0 1 1000 0 0>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
 		};
 
 		demux@8a20000 {
-- 
2.51.0



