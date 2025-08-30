Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B4CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CondtgD1DjFQjVasjxVpy8iDXhUbFuUoV39CG55v1Bs=; b=bi7SknS5+LiPejuAPkpqGEzM2X
	xTI6B6hMIBKQHQwPN71gxbQANKv9sJKLSXko/v/c+EQbpaD0fqkg3NA4UwzxXLXcwvmvobO84O07s
	wCq8vmLvx9dnvDWR/2EDNXwLSW6BHdfKdM60/UhxRrzMDJ5apos/YVKs9vMfbSYQkKSlFjGzw+VP7
	YZJiZgnyE3oo2gSjniwwhdqNgKxL7dyAM0SQqK22J4KDGDdI0aB0Yr6y7/hXLq1sq29y16Qyl9So8
	yHnfG7zfLhpFFEsWOHTrgEvsSH14QGD4ncXhy7CPFqs8fBYoqANiJJ7LsJ8kcEjf86Mp5UYPKM4hN
	dRsaAvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRQP-00000008N71-1CWy;
	Sat, 30 Aug 2025 19:39:45 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRHP-00000008MQS-2xWf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:30:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afeee20b7c0so413131866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 12:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756582226; x=1757187026; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CondtgD1DjFQjVasjxVpy8iDXhUbFuUoV39CG55v1Bs=;
        b=UvAbgshMUHnYu0zAY40LeEt2z4FFrK+Fdl8Fj2CnbJQmbjh9Ys/SGFo7C07R8ws7vM
         RDRLCPCqUNLx2Q2uMTfns0sv6SGfysSiPiKlOvANKXiU55nIY3OC24Dv2pi8PtN+B9gp
         VXrdjf2FmGHjUQdX6krYns5WToUbykAdP77AgwqNuSnI3p8j8R39Qn3gryrZiuibsPTc
         wUvKOK0mQkiRpdXCPWiHOhimh9D7cOVZC9P71u1TrBDI/J99wpEvcVuCeQR4w7zSt0/B
         kdvgT9oe867zSXhe1DzMo3SlA/I08fWavrhB4u5swkJWnYvfKGtYlk4QkypEoUZI0Enb
         CGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582226; x=1757187026;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CondtgD1DjFQjVasjxVpy8iDXhUbFuUoV39CG55v1Bs=;
        b=e4XbCSoG4mdHiAG83D+ZkNPwXI2ozePLD9eSi9Wg3y/hMWRPnXA1LuGWU5VzqKrGl2
         UO7ppXdAywakNnPSte4cDm1wWV3RherEkH64MYGRhpK8pwy+fJ951h4Fy3ZedoG0WTXu
         FQknsHvseyVtfC896aoB74PTH68YAGNQ0S1iEEg33rGSODQPiCaS9Pgkdri8DFAR4gSz
         npepRulhb592K7OpydXl1CD9YN1BmG2v9NEdhdfYhfRGrJ/mz453U0F7DPMdh7sxqQVB
         XMk48eG7aDBNldIQggVRZqOzFwImsYeP/Vg7LIPKPYuMYW3nJrsRSimBFDpkZDhd5pZr
         rbxw==
X-Gm-Message-State: AOJu0YwmcphXUhk2OaF0guqtHk7Zd/I6L4cku91X9HyPjqbQU6aX0maI
	wzAdKSbw3xgrkLwvrfS4854ecbMm9wNEWfplFGwuA89UX+sCBKlssuugtgDS3A==
X-Gm-Gg: ASbGncsXf9C5ha48c2NHYriYmICuzpbtp5lnYrIEsS1Uhlib/mhbEKsZsw7uNNOdhGK
	SGpk8Sk6B8U/BdAjj6Was5GIG79usqhBlNA9zdziWjAwKhvM7RsvXqqyPvoJGa9Hx7Khi/1+oUw
	Gdo8rSpW7px4DZnXeQhtSEIQtuCoMBzGE7NgoALyJSO+nD48xl7Z7Cep86CjO9CM+NgjzKAWk7g
	aDCc0UUkoY8AHirZO4mCSqoTJhmfsFZfpmATcsW98+/e1PPlMsjoC7Ttt95l2ukT5ASvADRF5Dd
	J9iorzhPPhH/taJEilEqDvX4dyJqs0mKA/KT6KHZ603L7fFFVuolYgANRb38lG72kr5h72UmIY6
	LSoh2xv1lDcF3QpeT+vLQKaDK2fqamXPxqU7OURj6D2SdIFieHTRZ3xB43UaDxGRAu3OPm77UWI
	RcGkXo39dcBXcu42hJybPkAyMeut82rMJRvUJmtip0DkAF/YyO1eBDkdnbAxPl37tqKHwzqwZZu
	6Y/8w==
X-Google-Smtp-Source: AGHT+IG+Fy509ibl4vMoyjdRQJ/11pyC2NLwaDbsUnATnB3iiEGhuvxQY8W9gdPCcapJQHM1ZUamwA==
X-Received: by 2002:a17:907:1c0f:b0:afe:9880:8a9b with SMTP id a640c23a62f3a-b01d8a30e2bmr261607766b.2.1756582226030;
        Sat, 30 Aug 2025 12:30:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:d113:449:b8c4:341? (p200300ea8f2f9b00d1130449b8c40341.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:d113:449:b8c4:341])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b00bab3ef2esm238563566b.11.2025.08.30.12.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 12:30:25 -0700 (PDT)
Message-ID: <758786b4-5e0e-470e-a078-1a730ffba9a7@gmail.com>
Date: Sat, 30 Aug 2025 21:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 2/5] ARM: dts: ls1021a: switch to new fixed-link
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
X-CRM114-CacheID: sfid-20250830_123027_751030_B8283F64 
X-CRM114-Status: GOOD (  12.80  )
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
v2:
- fix "Properties must precede subnodes" error
---
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts
index e13ccae62..6722c54f5 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts
@@ -120,9 +120,12 @@ &enet1 {
 };
 
 &enet2 {
-	fixed-link = <0 1 1000 0 0>;
 	phy-connection-type = "rgmii-id";
 	status = "okay";
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
 };
 
 &esdhc {
-- 
2.51.0



