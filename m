Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6ECCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpQFNfP1MuP2zGJDIekphY6+xfLWcndjUj7V6Qo/mqs=; b=qUnB0U7XJw6S9f+t7/B1eIFDhL
	9sR+3MbvU+ajbjEFrqLhrfkN8+fFmxOG/Y8RJzmCHL5tAlVPTOKUmVcjqto5RJSWbGcT2Fydru0xG
	3IEtcAJCmte/QWRha2FpuBuqfZDxP21wV+Y6dxwXcLnQK2wDdhwCbf2vI2jFVX2JIZmAfBspt63fo
	uyNSd+Gz1IIhaIEePX64O8wEtu/YVxFDmv5m0p8WV0AiAWpJxDc67f8CqGF3MvG2jGN3yVRvFJ7nZ
	K6a2YXNbaWVaspIwLw5CujnBxdv2v8Z56oFsPvUaWYWGBWWrk2/wYYbH/auO2zeALEIyBQujJ+zzk
	IiySm1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphkE-00000003wZC-1NE3;
	Sat, 23 Aug 2025 06:28:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQfD-00000002Rpr-3DOR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:14:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7a01426so27301666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 05:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864874; x=1756469674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpQFNfP1MuP2zGJDIekphY6+xfLWcndjUj7V6Qo/mqs=;
        b=pVwHRKvialA47x8B4eUG5PlooqzqXXE7rA7j/aEj4N5HnBnIc+jhK8l/OqzsKNfR4V
         QLU/TZC67eS4IYzJfg79YhVPfl/6u84+WALifZPdQ46rQT9c/8aUiNipiXRonkfe8Yvi
         RmphunaCZ3W5AtkYXj7b9OI7Gw+GLHkAADMVfxKuijw6Z6HLwmDBlMLgu9UjsAnwvuHl
         yYHv8gAje0g6GGhiYaTIeHPObV3K7tdDKxI8Q/mCYT8Jrx3CVzoBmnvV8k8XS059bHfm
         /VstYYK2elAM1870iebyIz4qG+yEyh6NiZw/wHUTxm7PwRt4mq05Jacw7J7Z5RhXLrse
         Vi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864874; x=1756469674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpQFNfP1MuP2zGJDIekphY6+xfLWcndjUj7V6Qo/mqs=;
        b=gggvqqiPgadONoAcfVqjGaYFAcbaf+Dvkg1eg2QZztxkP69zV04uC4srevLvzsZTqi
         oU3LOncd+4ry+np0o467RRv9hQQKCTUGaHKCyvkXii9xNaO3Zz28OOlo32o7QjY8A+3F
         mPeon+27PlwfOqSSXM3l9Dffob5+/VRDlfS3kjcqw7mi4WApKt3brs5sEUHIyN/Yt79r
         DdlbFc7vAxkmNgRHh8DNUB/B5MKpDEyeVW4oBzCsI8fmjvhjNDkQnz3NKjXpQyvIUdJF
         Y9Wrv0XAyQzD+hvN1IMWfpUkJCxb4rIstKRYfsrYnghcBAb2XJv3/A47evv82bHmsnlI
         zo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqIzR7xFwqOkSjkOJVS+/hIX4uAQYIvMr/RgnP2IYyQMmnbZvxt0Fq9Da+YPddN6NOEwKX6H8v7Xb/GpY/YVqk@lists.infradead.org
X-Gm-Message-State: AOJu0YzkDfVYrWUjBtKfHWRw96BlvwLEZDoajiDIBqCn2njSommDEUxx
	8oMNY7rMHzuiPiQYH++j1kAE0h8y87JK6+xY/PooS6awfIcIYUgijrCBT2G9VciJTgQ=
X-Gm-Gg: ASbGncuPbhvMadO4b9cWAXsgzJynIkNwEkYOVbDurr/q51Wo+xi5uf26dz4TzpCXiKd
	33TuR2l5DtIQwoAPsoUja4M/taFUmTPgSnCbLqsFlC1sMAxy172GvRLNGOgB9SUDRAtC6KQqOdD
	lFoT6PLbHafYM+96L85DGx2ae8XB+Zj3zPTk1kQChtlax8+DQ7Hq/+n/d3gm2lEQUXPeDNbCMzN
	51wfSivcmhiec32ywIpYxupsNesgrwycqJXKctskq86GawL10fPCCP++szOv3GGGU71BlRB2IcM
	uTu3sfsTzwGPeTCZmqzGOXTYiMDWfgx1igRBWj6c5PK3W9XeiyYrNKkSCVJeYeP1g/MtFIiZqf3
	iG59GZQc0ryMN+KYNOwyYiD71XlxK3qnwZAw9SkedmVd/
X-Google-Smtp-Source: AGHT+IFvZy/hVC+pkJt13msp2gYUwDT8avyVy0YPiKQmu27rm2o1448VI3vZXw0It6rSB4Aa5n3zgA==
X-Received: by 2002:a17:907:94c9:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-afe28f08b6cmr124114866b.3.1755864874131;
        Fri, 22 Aug 2025 05:14:34 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] arm64: dts: fsd: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:26 +0200
Message-ID: <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=u4Q49fzz16cztRN4bhMz4zWhFIJDuK0fi+nL3nK66Ik=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8hYv6B+iYK7dUhyfFddjuhtdNLQmUTGiyKM
 PUtycqDXfiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfIQAKCRDBN2bmhouD
 1xdjEACKbhNaHa/2goI1CLeFIEuXCJeefaB9pYRprjRWzmncfcymr67jhqPtF5Sr6L2FhZxr86P
 zpPOaAVvF9wd0O2Z7Jjn0I9DUcv2+YQghQyyO6RitaMZQdJaRRcyRDEOhOT7gHcvxhEAR8lludm
 H4pZ8B1BA9VJCUH2Prh9rjCHI0TzaSIgPX2q9bXH8vnMNoC3MmaWRhBD7ANy9/Sf7Wi3wUMULdt
 O5I7auGPCSmnJEv2b6bWeuu36vMv7mH58aLOvUqMNtNnNJKOlRxXoQKcuVTATreoNDNe4BDEz9X
 XVsimYLxCTqdcD1+G+tX1f1fbY/fWWzhGDmKmjFqrWFCGPyUk9UvNJKwVOTJiDqZelt7YjBvJY0
 Ck4Gm2931W75VpSR0MrUjpTWGgJo/BQLnlU3Dj9vR/FilsmKfCiHup/Uz4s4jJRr5nQYpslNvHz
 NTZYXFILqvvwvBx+n8P/7oVlfzLA4SFF1OC0rlc9K9uHqgECCU33jO+G8lWJ4tI48yjA/x3dmsZ
 gLfiT44win6D5tvDyoGompMy/Iix0Ug5YbAsbM/2QOH2g7zQBbDWRQ5wm7CUCcBVxSw8jVGUuSZ
 Ey36mb/ppTOJ71RoKC7o2icrUIYH4qSEhJaczgLn0de/ncDXJhLUfjmupYuEXkNN2aleq8Sbq50 OPSDtptU+XCRleA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_051435_803787_C45ECC78 
X-CRM114-Status: GOOD (  10.33  )
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

Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
because GIC interrupt controller does not have children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index a5ebb3f9b18f..5b06e2667b89 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -363,6 +363,7 @@ soc: soc@0 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
-- 
2.48.1


