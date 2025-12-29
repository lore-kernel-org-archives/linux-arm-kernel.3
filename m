Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B5D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KQX1N4PTxY+t5EzWtf5I/WpJGig+aqgTok3R5+tPF0=; b=VurWGfkUIbnoZ/7TV3UuWyyCN/
	f5BrbX2Dn17a7lXqy5cjmHequxqM7dh3Z7oeOa69D7ZZ4y/iM1P5kSiljuCJ/lRoULYGSKCsba7Lq
	i7Y/3Th0ARqXaJ38zz8XW877zAyQ3TaQPJc0DVgljTzA6ZD/b7njzoLxsrJbEJa0qchNrB8cOX2+r
	ank+b4Wv/aCRbaYzwik2pr2GSEcXTsw2xdcU/IFtFfkN8rFN7gY4wFgsslpqbzcRIZcE85IHOwnh9
	/3NTfHS18aaxqKbbH7cloVFeghkUkBqPPxvrjwpTRX1YksoK+CbhwWkl7HfQWZjROVzZn6iApke9h
	RgobOm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEw-00000003XyR-25PQ;
	Mon, 29 Dec 2025 10:12:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEn-00000003XqV-46hj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso81347705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003148; x=1767607948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KQX1N4PTxY+t5EzWtf5I/WpJGig+aqgTok3R5+tPF0=;
        b=O0MvLk3B6Ud6M9+poc6ExecJZDZdEIOA1Gexy/xEztWTHLwwa/klig3AEHX3dEFUVW
         9eUOe2fBIunTlPBTV/oePU8MFL2uuvu8SEPzrBl+1PIt4K+rTyqVgaMAS1YA0XstAwJ7
         Q8phFQnUlUM3o9vY/mVst4VtLd4iWBmoto9thoqqqlXiPBW4987yq6Xz7lZd7rL51I8M
         wAoCoWy98gu/RMFh3D1MbBQSE0/meVPRJIpfhSdpgjeiaOHF/8eJPTFUuq4yw1ZFBeHs
         Og+XmpDlYESdpAwIhv1kxdPKsNIJbN9A6bQYYByqWf1m6LZfAsasd/UrkmnspA8Wh3YR
         EFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003148; x=1767607948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0KQX1N4PTxY+t5EzWtf5I/WpJGig+aqgTok3R5+tPF0=;
        b=ppZC6MWOVJV3bdXGbQg07DPpRVq9HuWFFkw8gLVN/K/VukymxLEExEm26SBmbcm4Xw
         AfjYCYttezRiVSmVnsutSiYJc/iilraWwEpkA6645WulxV/VTCQ4ReEV0CyiY2+Azm6Z
         kLWC1z2hlcwC1HFdNDEM0zjBNaDTCxYzHxXmh6rU26iAujF1F6eTjELAJhrOfA48Ilwh
         FVljdqLsZX4jrH4zY01jfkZtkWUbn33hGd3peGPtBlgnzwz0j3qzBGnMW8U9rzQPNrGI
         pTjktAmO8kI4J5TB98PDgmIqBX8k3QkbD2HEXUe9YEOyhbyF5gPwZOjbknQIKOPYnNbT
         5BFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsA6MicYJaVTp6PkbLNFtj1txYud3UPbmz+LEhFNt8AOOk2awVsTGzhsyF2z6zXzDQfK8tRxJW0iCMRpCc/77Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyXcfNxUiJXKfffzlcFO9F1kEdU7l77df9tcUZBj8UXjKiNM5xA
	nXyQybCIfwXKYe7VD3aYwwTQnQz2T3IXx3/aZlK2MCCpoGOgjExsvrsF
X-Gm-Gg: AY/fxX7vRb6awYtQDJF4olkm2ZAFMs4SpnqzIA8qcox+t1SbBUW5G+ADI9D0tloK4iG
	n/DcmTXJK2fy9rSRoZXX7GysAf1LkXiq9XS1hwTLhG4oIzJd62Q4dn1MBPa+kmqLl9ptBrY/ZAo
	4ZoVdzzbaJ4OmfOT9VzaiylB9ASj78O+h1S9Mr14n+NMt0fabVaXBXs0ifMGgUzmhY5olaOtjZJ
	NtS4UN+Fe6TDvkWVP0OJE8uCcFHJEn5m3HzqFfMh+Fu4jWphWary+28HVzrnoKcdKqd6Uz8/0nA
	cFqCbwqnHeLEj88lfKuNjKFdc0UEw8xPVUuvM/Qn+Xrz897Z9aA/jENOusy8wdF6cAa7j0OXtqc
	Z6FzmOXcM6wZ0+QbIDM/esPlewG8wyPnySvtn1XA7dBwDZebneXp2xnk+FO/vpF8wh6i+t6Oc6K
	ST4Jf0h080MoTiNfxjye6h3lhO8wnksvWbZEDD7FUSQZ9fklBdnedbbRibGlCE
X-Google-Smtp-Source: AGHT+IFzPWEKjCgn1cex4DN3YQtL3UA4lmL5/FyneCn+bTC8varFe+BsYL95fgaGZl5mVOxg+IkOsw==
X-Received: by 2002:a05:600c:608d:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-47d195667d6mr331876045e9.10.1767003147844;
        Mon, 29 Dec 2025 02:12:27 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:27 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 29 Dec 2025 14:12:00 +0400
Subject: [PATCH 3/7] arm64: dts: rockchip: Use a readable audio card name
 on NanoPi M5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rk3576-sound-v1-3-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=alchark@gmail.com;
 h=from:subject:message-id; bh=IZ3AVgWYvTdySO+Vv8LVtcMCFTcRCnO6smmAHUEAJNI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTBOd/ecL5Df+txkt2mA1YTHSZn9V8zbj/zKKjyiU
 KjyuulYx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFMdcJvhf43v4T3t7U/FFt/dyhKcbKEddMKhw8vnN4eTyat/FbcSexgZzmpMyNf
 Vs/q+YafsOsc4xdSbG4+d9e1PL512dq7V9WhfDgA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021230_053037_C39B5B2C 
X-CRM114-Status: GOOD (  12.04  )
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

'simple-audio-card,name' ends up in user visible places such as ALSA mixer
names, so use a more human-readable name instead of realtek,rt5616-codec

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index bb2cc2814b83..f350e96de1f0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -205,7 +205,7 @@ sound {
 		simple-audio-card,format = "i2s";
 		simple-audio-card,hp-det-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "realtek,rt5616-codec";
+		simple-audio-card,name = "Onboard Analog RT5616";
 
 		simple-audio-card,routing =
 			"Headphones", "HPOL",

-- 
2.51.2


