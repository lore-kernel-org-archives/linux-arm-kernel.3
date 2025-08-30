Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2ADCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rLLJhgYHhQvYp9/eSoMbwWQ9QTJU3+YaixBARoYFc4=; b=0w7Aa9hd0zQMbK+xmBCfaRJx7/
	owPLki9O4kifk62mYz5e02ZnvQoAOgmBjzLyp8gD7kY+cS6EDt1GeGyd+Y4pdg0vOFgstvBxrW5oD
	Kzo4DAY4ubFjm8aYi6vHFHaF5BmvsOUPvPT3tu4YgaUkRgSmMR+3+SB/79oT9MzMVu//CC8AZhiLI
	F9V9Goue8EHZU5W0hWY2nvV7No22RavlaAYaAbaHCMmslZG3hcBUqt6P4qRaiOncUwJFFVKdPvJjA
	iT/3bsP7SihEw1a4QfztBm4ceeIoStYCrsTfDBZpF7k4FmCuo8y7ZNHuFUZo1YFGRp3dTTjdgV1J0
	h+HSrbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRNh-00000008MvC-21Ow;
	Sat, 30 Aug 2025 19:36:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRGg-00000008MNC-04qy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:29:43 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61cd3748c6dso6425957a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756582180; x=1757186980; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3rLLJhgYHhQvYp9/eSoMbwWQ9QTJU3+YaixBARoYFc4=;
        b=AK0ObBJhhoYLDcPBEVqsdx87RRX3+lHwQeqISc8mBLl6XYp4Eeib9r79UvK7ikeedd
         8u/cl3CDzbiDUSGICATUmDtGjeZFQ6ZTAKlVg3Fd0TIEqJcS0hk7a1uRN05Ak4UfiqWw
         5u+2uDO8xLdYfQgQZ3XjKLldsWnytJ1FSqmrFdxwKMHtziH2tfzbpy5ZLQyGUmv/C+2Q
         9tfb5WcQDCQyFEwgVbTwAQUpV3QCHvqxKpZWc3+2lcWjMB8ikIpxXgI8yeKFfaIJYMlg
         i1rpFIL11vfuuIPE1kYzMOxHdUJEG2mX6h6zovS16fAl6xD+NRvRUZLQX6VUUGrVD4Rr
         CpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582180; x=1757186980;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rLLJhgYHhQvYp9/eSoMbwWQ9QTJU3+YaixBARoYFc4=;
        b=DXNzbPapjW3da0f47VtbmYTAMwtP7C0DL1qV/1uIvFqTP1n+rbZ1wZfQcP4Ld7c5Hf
         exOwaEG7GySxUgM9MNshbCtq+4hXGG1deedqy/aJw8NSXXQS47GOU4P/8qTj57E6bxq6
         2d0uFFZeRCkwKkJnYpejH43IPjFUdomgQKE/PX1OfxbnsXIiZUQmMt8ONlPEXs0cmL1H
         t4nwCj2MWUyOJiKQugNfum4aSCau6fgqYc8BA8O0tTm9v0C3L6+9EQbLJQGKUvqsrHrt
         PZB2mHS+jXvLHwO6kQMwrkm+DWkiyf552uc8bbYpvKtyIj4sGC3c9YpGhSH8dHZvYWOE
         twog==
X-Gm-Message-State: AOJu0Yy+dR5BnW7bmfPzvv69mOpG5o8UeELNyd1Onjv6dgajh1aoyIfk
	0P+uT8Y7pWEv+Eo/hK1XcfV+gZj6ZTS2fEmN0plu7vOcpu2IpaHsjW4wrqHFiw==
X-Gm-Gg: ASbGncuz3d2a7CJY3hLLFHSZ3bS+u4FHIsrhp86ABsD6f2LA7tNbppbjr3J4ENsMQ2T
	cMvYyPCMFrEl0obfJFYh53g5MlKpApIs1DwaG7Kkdq1RYEInGPOHxay2OXqAhTYESs58qDRE3x7
	4Y2W7tqdkTMsLMwfSQIefisPekLeL+prgtJkpd9kn2ZZllYt1EWBE0/byLvkiPBFzbF5tHLulkB
	xiImMFVbP4tXBiAnAmZeNLoibuXiWohoYZUO/5qmPqqcJvgoxC2guJ25DvFuaW8j9mkajPHbwGM
	Uon4neBh05QXclxvKVXkwrEbL6uICtfs1JwKt8GkfQDnIoTQPrIwpkLQlPVZ4P1dRH/fUj1WWRa
	P6EKJJBFFa0/2XulEt0//fYukPwRD7RKN0ImcnZOiGIRg8wXrnmZ4PeDiFocmm69CwaGCdKrpDB
	EvaGDoB81FJYXkj5oqSONnvNPsjxQlVNRgk9zG6KA1zsmr5qzv8idELn2i31u0YhP2HyA=
X-Google-Smtp-Source: AGHT+IHgTaCK0S/XYssZtoOOtOK1Z6TGrDrOyTFbgg7Y/LQnnD+HImLfy3f8OoJe0VxTa+zTeAf8jA==
X-Received: by 2002:a05:6402:84e:b0:61a:9385:c78b with SMTP id 4fb4d7f45d1cf-61d26ecf561mr2268262a12.38.1756582180303;
        Sat, 30 Aug 2025 12:29:40 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:d113:449:b8c4:341? (p200300ea8f2f9b00d1130449b8c40341.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:d113:449:b8c4:341])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbca5sm3994735a12.31.2025.08.30.12.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 12:29:39 -0700 (PDT)
Message-ID: <2211c0aa-c343-4930-9f7d-5d8058017d7c@gmail.com>
Date: Sat, 30 Aug 2025 21:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 1/5] arm64: dts: ls1043a-qds: switch to new
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
References: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_122942_066649_5AA26857 
X-CRM114-Status: GOOD (  13.08  )
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
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index e850551b1..645588911 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -205,8 +205,11 @@ ethernet@ea000 {
 	};
 
 	ethernet@f0000 { /* DTSEC9/10GEC1 */
-		fixed-link = <1 1 10000 0 0>;
 		phy-connection-type = "xgmii";
+		fixed-link {
+			speed = <10000>;
+			full-duplex;
+		};
 	};
 };
 
-- 
2.51.0



