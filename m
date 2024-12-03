Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E4E64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=; b=a3JFYB815QaHHujpOMfMKCs4ki
	Skk1z770SRzoTxr9gOTI2da175FVoZCJlYSHWxtHF8/diJm3WI8WLclFqMJExiPKdOIQQJymnSmjY
	nht0C0chsAn5pmG+wKTBisv5v+mKu88blQc/ohJnAQUc74DWwyrLdIVUDRJ5zc67Tl5mvP30F9zQI
	Tbibzh1RSQv4nM+tyByiBwROzVru/oKAbi4Q8SJ15Fp8b6LYVhayBZbiPQXWIx4Mbg1IpA8aUiV9w
	3hgwdDL63S0OHUyNcQFHa1m76mGzSjhr3+ry7MYISTgDUlBcVOW39HlsWDSOb9E35PWahfi6UsT+P
	BZnB7++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFW-00000009SvG-1lpN;
	Tue, 03 Dec 2024 12:43:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISCa-00000009SIb-0Aqb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:40:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d0b922a637so5287104a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229626; x=1733834426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=koMOw0aZSqY8Jh+tybFRUOV3cpD1fRqQ94vlNSirKqpkQCLpve3w7f4DmFVPnVKtPP
         rfxq7pytvYT0EkUODG8l7HYZPMIlqgViONehisWa5gk24yDcOT/0i2UIxMOaJm2ap5/1
         9d8ypR5lPgMMQvKqccsQgv5v8YARxPCFtttt0hTbQygESJ03pbt52UR7FZJV8c+JyJRy
         qZIcWLVxQgsEKm/V/5W01EH8BGGeYCUuEVleV1iAIWK2KJfiJ5NM6pY/+WXHDJReH9Zi
         6SyN+v6iRpeyKDsgsxAvwJBdGdRSImmHbE5lajMmFqo1tu35BI4PcEuLnv4pGOTstd7v
         S+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229626; x=1733834426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=jq9s90zPjzLOJ34qi3eA22yOPQXpuPVoZHVAJkJHnDs6LlDhQ02BeCzKWZYuMs5zj9
         lTD2TSKt1xov58LxoczdXbm6uLuzp6ilnCQuzwEm/Q9mGpUiw5xLtq/6YEixjIKhcb7u
         hufYWbM/DvyCyga9iphFjZY6Ge9aBWQnC5NGUJJ+dHvtxS3X+cP17juhsEGEnNdJYPYR
         JNQFgvTZXv35bj2wB5+iyOw192WuNmevR4u+kqIcTF5au/BggRgJ8jqzJPOqNQN/2Hne
         ZuEOOIJjFPR/tpC1F8GDHrXq5G84bL9VfZE2wEqpDV36RdLDQd82bvojA66TkRl+ItIt
         eh1A==
X-Forwarded-Encrypted: i=1; AJvYcCUWMIQ4DM1w3OY9cuD2Wsx3Yh+kgnch6reLt8zaakSG4VdHtkVPEqnxmebWqMKMJ1YZZt+zy1rcnfV4DB0iJOEq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8OuFKfTz6nUi7RpcayE8eruQNHqGg2Pragst5jYLpcXZ3V7Xm
	q3Y6aYA6vYJqkWo+T6Mz+B5rrc6MxqR2CTcKVBb5lKCIFndBun1RgGgq/UAuP2Q=
X-Gm-Gg: ASbGnctSGQGZ2M1CmefMn11mY/0xuWl8M/AQy6fN6FL0tBtMuubo5TgSB02MP3UziE9
	9Be5Srvdpl3zDSyw682sl1FOOCStKSqmOyDgQzLVBx7Mnfvbl9KxpPtNar6+IbRSIrEqKMfWx3Q
	qc+tgMJVB/ij6tnJaE1TkStoITNvSxs/6q9XKMiG9RuJ4B1ytkbmeyy/dr2QtuLfJvOzo2kFzxN
	e3Kkv4oDtNCGDgIMAyGOTj7cH55LsGi6B47hIEMQRf43Oej3R157DVMCahlSZMyrvLYLPX/BDVa
	KbBqTLPu8xbdlgRkOprsdVE/HXisVsIOqA==
X-Google-Smtp-Source: AGHT+IHeM2tS5DyKwmkwrU7i8UC/H8zcEneFmZTgM0O6tCH1VZOWSZmfl7YcO9+J0m0pG/15uh5zHQ==
X-Received: by 2002:a17:906:2932:b0:aa5:1ef5:261e with SMTP id a640c23a62f3a-aa5f7d4ed45mr162940566b.17.1733229626589;
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:25 +0000
Subject: [PATCH v2 2/5] arm64: dts: exynos: gs101: phy region for
 exynos5-usbdrd is larger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-2-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044028_074844_34B5F205 
X-CRM114-Status: GOOD (  11.58  )
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

Turns out there are some additional registers in the phy region, update
the DT accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..18d4e7852a1a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1267,7 +1267,7 @@ cmu_hsi0: clock-controller@11000000 {
 
 		usbdrd31_phy: phy@11100000 {
 			compatible = "google,gs101-usb31drd-phy";
-			reg = <0x11100000 0x0100>,
+			reg = <0x11100000 0x0200>,
 			      <0x110f0000 0x0800>,
 			      <0x110e0000 0x2800>;
 			reg-names = "phy", "pcs", "pma";

-- 
2.47.0.338.g60cca15819-goog


