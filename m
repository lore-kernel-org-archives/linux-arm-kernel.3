Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C3BCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FzMRiTqQMPpBl/3jG9WvKbH8IHjf8CjWW0SBtbvgT8=; b=qLxKmvIL3p2OcAa/uBH2qFhYVu
	4BUTuPvjHMUIp5hkS1I8OYHduqHFy9Anh21aAAqfSa64dkQO/McxSKkChApwpkUUE/2NTnbeTZxdb
	XrvnFHGa4rSlHewNBX7wgU0hhOnHa0so2+aWw5792SkOP2M/LWTWso5uowp3ku8WK0rNXAGxmQf8w
	HeGqhi1f94F6/AYPa5wILQx/TYrsopaO9bQj7qP00HhZVMAHOKiOGbEnHSeBASR9xoqyebqwavVbz
	A6+QURyba0rjGWEWl7S0txCSaJZN3XXx07hv40semOKJ1CPiBoqqOjg8zi4WWjdqvHde3bTiSlb0p
	kZCx5wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJ4I-00000007l7n-37hQ;
	Sat, 30 Aug 2025 10:44:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usInk-00000007jsv-0zoF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:27:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b86157e18so1523305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756549634; x=1757154434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/FzMRiTqQMPpBl/3jG9WvKbH8IHjf8CjWW0SBtbvgT8=;
        b=aRy5uBmZwTwHQtTyWmmkyAWW2u1I+XGa8uYeWrun2t6IlKFwFVa7CAZiHfTLfApJQu
         41D6hhi/Uvp5klzAWXw9oFKSIbVSrsKVZZnip7RpPHsAGRYiAY9+F2b4g8K+6x/hcoer
         36ZQyEtZjGF69g6l5mOn4TA5o4oia0YheXv40QwikVFkESql1NlIjwLM4QY/J+VO0851
         5e2Vm95N+M+5DVIKEJtOaE8CbFKSs1CBB24t0G8ElC0UKBfwRDzvCw276OJIcECzD8nC
         JbSO4/IWtYG5MP/u/4oH2zPRIFI/VK0eNUmcJS7QqNhc7wLGjyjHCuP4c/BOoZP3CyYP
         mY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549634; x=1757154434;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FzMRiTqQMPpBl/3jG9WvKbH8IHjf8CjWW0SBtbvgT8=;
        b=E64ESyS48Pw8j01suwMaJ0oQloUbCrEOuI/aGR3ZQ3Kl9M0GpyXIz1+YOl5TFWM2su
         EHHn7t/wmtUfkMIODq50et/2k2WvdTaUenrHd6eL2ZO6kdSouDLJkqF3922clKqAti/M
         ns9fueGnJOB9ZLZjCsTk+aAsRNzbdjneVXKefwQ7UCtRAysyyuYwS27KHtIeDJcWjA1g
         WNk8eoC9J4gwWdO6XmDmyQkf//Rh2mVjlltzQycaE0M03qqFkxynRU4qayUW2j3i3goo
         0UgXSaSTB4uL4rVi2QoVDJTbKycNM3U78xWaySEycj8AxzkLzX3AlUjJCdr3EKUAm70t
         RCrg==
X-Gm-Message-State: AOJu0YxUWgDBbwzHjdNtqOQW/hBh1A21YcTp4vpUJP/9ioxr9zCMYrER
	z9Vap9PP8qLjr/cZxZknP58VJo3sVIoaAGZgMOkcRmKELmgg1r8tWaHM
X-Gm-Gg: ASbGncs0TmCMjK0JVamFiLJyFRSN7goYF2AvC/T7QVj7uPmAZkErs4N0+KAsi+d9Z91
	ypEgNWZUjoYbGhpjZ9XKFwnBDWGujnyadga6iy9UvpLB2p8qooGuvPjumFJiNxYP/SE4xpEYEk+
	9OBgZt/oz0JZPzae9hbOVmCde7ABInqKgUVgNzoxLV0lJBwsKF83aAsAMuO/GtrCXguzFLed0k4
	d4vcMoBcAzdRp7N66pgvF8fjuhpdenQKoHYsyiaySx2UPKfUUrUo6yDCMug45E8WAnJJnfU561Q
	Z02KK3+HdtESBh/WtyaUCYzJbm0Od111AFFeO5OrYhm3946ef6iOAAPz8rUnhyJbz97IbUeOIPY
	8Jtm29rcEVvCwNhuAN9k6/wFHwOu+81CZKYILkqlrrariPaKiDzJuSUu8Idu864sbFDSHGD1rw4
	X6HWcm29RP9uQjdZv70571tvFj/rDaoq36zTmNd5NE/f7HctpGkBJRaict9RY1zKXRzEbfuebAQ
	YA+KQ==
X-Google-Smtp-Source: AGHT+IFs0nILNL+C5UOYPA/wPpQfRmPGcuIsRdL1qmH96i+O8bfEcxlhl8DfdOzeOm5L6hAc+bYnVg==
X-Received: by 2002:a05:600c:3b1f:b0:458:b7d1:99f9 with SMTP id 5b1f17b1804b1-45b87bf22ecmr4199455e9.11.1756549634403;
        Sat, 30 Aug 2025 03:27:14 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2? (p200300ea8f2f9b00080ca2fc7bcf03a2.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm94179935e9.5.2025.08.30.03.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 03:27:14 -0700 (PDT)
Message-ID: <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
Date: Sat, 30 Aug 2025 12:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new
 fixed-link binding
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
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_032716_306299_FF460908 
X-CRM114-Status: GOOD (  13.19  )
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
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index e850551b1..2e6fd153f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -205,7 +205,10 @@ ethernet@ea000 {
 	};
 
 	ethernet@f0000 { /* DTSEC9/10GEC1 */
-		fixed-link = <1 1 10000 0 0>;
+		fixed-link {
+			speed = <10000>;
+			full-duplex;
+		};
 		phy-connection-type = "xgmii";
 	};
 };
-- 
2.51.0



