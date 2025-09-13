Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D15CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL3C//pZp2AWlO03t2q6KgLvL06f+SJHlgWyKC0fL+c=; b=xw4/2TBw3xCr9xPbcRf8FwH7Hq
	sgOgLZem69YUM3KSdFY1tWFiB//CsJrpu59/yICc6DkFmIeQqGJg3pSHOpHie5/GG/TeOKJDNT63u
	axrffJy/RBBfY3pX8J7Y3Oj2Azme4++06+a99uoLgJH9ykid3ZlURC4Vtl4a08GBbVMDwUfm3TUhf
	Jc0B8LGXgCbceDQPMrDhDVCDYRi+fe52+S71A7yruf2oJA+R1aLcDrG6ADtefI2P6OLOWd3KjOyKo
	7NMyQ9EUBx0hj630sL36Q+CO7hTQYcBnO+Z+t9LbmsIJ/cVZEUPKw3DsXclQOddtX+pBAr+DAhhgV
	LqmHkdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgd-0000000GJRG-038C;
	Sat, 13 Sep 2025 21:21:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgX-0000000GJNP-47HU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so16539955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798488; x=1758403288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL3C//pZp2AWlO03t2q6KgLvL06f+SJHlgWyKC0fL+c=;
        b=i0zbnAaOyvR8mqDy91u5t8B8Dh7cBVMya1PGsw9YIrgtaZa2yzr425eJ2O5zWXEMXh
         AGbM5A0OfnfhqAeAYOwE4c5Dc4K1Is/HCcx9pc7BgqJ81Bg6+bBti2Xw7JlYMbCNDFv+
         HFOAb/J9GeDTPLjMA4Vy6tsreVRBtn/OOGUT/K16OfcKTgehJvArrbkLF9yvxBqd3tNb
         ic9u9xYMzSy44LainlrScrPG1JPMuMFDeP2kVJddg/25IgbpuUh0W/21BukuIMb/yhLe
         EL70c4Edy6YroRnDG8qknmqO3poKfZ9jwhfs7la9bxyesNF839oXJayPJzqcWFJoTQnb
         cyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798488; x=1758403288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL3C//pZp2AWlO03t2q6KgLvL06f+SJHlgWyKC0fL+c=;
        b=luGN85eUi6Ly+1lqVoSN+ZSMC8M50k/xCeWeDwMU5RNjhTaMridiqJ1grq9spHZ7ud
         b5E6c89C+81Cipk8vMVP0x2eiqKIesJFNk6VXErXZNKpJC2IrdyTMfr1NIcZ1fwPRIzl
         kLbh8imNbUNPQEJA+XiiCmdd6qeyvEsixIyu56OlTMEEwaoc7dxHRuVJd/pw2TB3LAfy
         oU3rPxQAJG9uqhVBA/ak+wupIJGV81+QJ5cI/3r8/RtC8M1mZfd9NPKx1ujP4+ih8Dvo
         UhJCEOyU705a/ZRCTDUofdXShsZxTBnQqb06WGinDJxtAwrtSgOUeBKkaU6aCZggYV+t
         ADGg==
X-Forwarded-Encrypted: i=1; AJvYcCVF8yBz4scjhWxb2Q7L/n/T85/1snwvQuluuQ67sHHgPyCNTvuS3URUCVFuP5mLVqaZVL8LpBr6xSEmvliDIUtx@lists.infradead.org
X-Gm-Message-State: AOJu0YzLvh2MeIXZljfu8DEKyb/aSazPLyHXy4o6wDXhS46ITkq0KI87
	xso1uj4+m3i0MuLgm2tYGWRODfzQMWH5zBVsS2U/ubriFH84HwMkArV5
X-Gm-Gg: ASbGncs9k9nDVVZEVxbXnniX1GxMFFjwX258+DI5V13UVhriIWOT7C9ulF+ui5tcv4S
	pxSmFwWWbKuEqnUiyTXP+l1YLWxMVQNWxDN7mfz8KhWsIRkR8CBgOV2+NVYaQHTL5nnthnXDvDj
	hPwV5OW/VlywEx1qPfHX+ujfTDMOO2QrjvuELNUnqkwcH2+mf/H1V42lQHiaEgowKeU3n8Qi6y2
	VcEnnpw2r+htZN6G/mpWRzdB8NMsaCTGlO6d2aM8ZDAWPhCLeNJcrumQkBdLP0avlg95nmCTD7v
	RYnxB15AM0VDRCbZegFPhflAz7aXB1OgkfzDN/PXaY+X39QFWvARGb5kh6mHKVEfF4JFL/5vwfU
	IOWTEirMX2ESZi9Zo2RU2G/9s8QFNB2LBxC0F6FeNzQ==
X-Google-Smtp-Source: AGHT+IFTCecBSyk7qSB9OZ+w6EvZXPsCkL9LEyhwk6+17yz+FRVjdFe1qhayQGm2rot65cvy44Mtdw==
X-Received: by 2002:a05:600c:1d2a:b0:45b:9c93:d21d with SMTP id 5b1f17b1804b1-45f24ef20d0mr59569695e9.8.1757798488110;
        Sat, 13 Sep 2025 14:21:28 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:27 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:04 +0200
Subject: [PATCH RESEND 2/9] arm64: dts: marvell: samsung,coreprimevelte:
 Correct CD GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-2-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=ifag7Tho57hQxJ2BLXtabDmC2XZUT9SI6SYVIH9Ngjw=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/if57uvdUP+coQwr8aSaQf3TW2t0pdcnz1Teg6f5
 U7RUJaCjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZgI50RGht1mTixiPcEtPdxz
 nKcv3TGJyXtx6Fap1KUqM3OnFtz7WsvIcFp6lf4K71kz8hsbHrHa6Ypksfppuq2YcNHL8vzLJf/
 MWAA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142130_037660_0E00C953 
X-CRM114-Status: GOOD (  10.10  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

Right now, the CD GPIO is defined as active high with a cd-inverted
property. Just define the GPIO as active low instead.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b9628b1f59f2f749804799e3d9faa48e3036e81a..aa161982ca43844287d212e8a24884d2b8440fed 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -330,8 +330,7 @@ &sdh2 {
 &sdh0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdh0_pins_0 &sdh0_pins_1 &sdh0_pins_2>;
-	cd-gpios = <&gpio 11 0>;
-	cd-inverted;
+	cd-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 	bus-width = <4>;
 	wp-inverted;
 };

-- 
2.51.0


