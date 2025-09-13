Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F25CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGIDvsaWCo8xv8p7HWlgtVj86XAI/5q9CVA6cYOpa5o=; b=ElnG5/7Q6eInRmRMEwVabildS+
	P/6+Lyf66ilUjkxxogtraNUwfqL7bG5i2McTiTdp7a6KewudhC8z7ta0X9GccMfRzHnZZDxaKsxE6
	ps6uv4//BGzlKxGKjZB5Zc3IIBgUbmHWJfSgw1xE9+JsMZiEo+V8QDnx291p6M43U2nn96yUdmEo9
	aXbQ0lm+ox3jF6PUV8uKOT+j2lKqz8t73PaEgKpvDQKtFsnhN8oKSUsHJD1P0KWpy79KWqbfmelpC
	wBFBckxaKosGKl1b7pef9bsBlRJXVV7xfeZfLajeJvbbKo7Cwt7yF0J7a3myzR/WKNVLtXubPfhpN
	8rxazLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgu-0000000GJjf-09JK;
	Sat, 13 Sep 2025 21:21:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgm-0000000GJYa-0Ffo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e957ca53d1so281071f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798502; x=1758403302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGIDvsaWCo8xv8p7HWlgtVj86XAI/5q9CVA6cYOpa5o=;
        b=FyyDAuKg6bQjaUiy493me9wmAyO8KYqjo6ZJJN+nU8Y0YAt14S2ym68v3w0OhPaMzd
         hE3UZUMOjH+U5YwB4E3kcU4kKNLFqNndUo+gCCLLBLyjOv8CDVDMpKSUe9FoE06kaCqp
         13UrzidXV9PLeRqt1rW3g1FGKEzyckId0ARPISSQMolYpRB4g4FdDEpa2VurK5YJxCNi
         kCJkYyceMHxp7REckXQVLEFOQ12GleNwvE1LC/bPqDXduVUkTk5DXK3hh8rjU6YiO5My
         9uCDbVqrgcuYWdbzIhuf47ut7dwADVnjH3Cb4Tnke2lCyRW09hx0EisEVi/+5bwTTzWA
         AHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798502; x=1758403302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGIDvsaWCo8xv8p7HWlgtVj86XAI/5q9CVA6cYOpa5o=;
        b=tDFBmm/P5EjuN7dBGi3r14NLCf0k0XAkJDhph7rEBieKvXobw/UscPYCAcUaw0P2Bs
         zhJtTsoLgtMO9CpJsb/Xmc3DgDKTad3LVyggp8llM7dcSmasZHvLz/Nq5tTWm7e+1YcA
         tZAGSGMeMQGXL5ea64bMYGnFni0rKoYt74t+aTpjj633w6qW/rcOBEGZd8Uzk4Rhhq1X
         xxQ8EGq1AYTTPOwMzlbIbr55MUdrkK6zIo78PRlQ4qa/AKSdhkL6mVd7XFQl8GalKME9
         OGhYr7Yr5OM+spFiI2P8Wxmiowf8R175JH1Ogbmi2z/wKyvxpNxuA7Qk4RL5xdFHwJ4A
         Fu5w==
X-Forwarded-Encrypted: i=1; AJvYcCVKMa/aJLgn+Vfa8+wG7LZpimK1RpEWIPTHIPfFn7Y7MZTgozrw8F42EhMiGawC541HJGr7GrgJDPerTIQsfoRl@lists.infradead.org
X-Gm-Message-State: AOJu0YwtOD5yNp9NdRPK7khg/cUSfj7+9FQ5irB7Xvl42oO9tCeu/VzR
	AgJHZpFIqB5fFHXTPr1UWcJs03XNlEUJqI2yzjlv3xo5I/VOCkhIdw3q
X-Gm-Gg: ASbGncsDNvHU+OfKueh/SidNE5wZsDS8wB8GrQIjbagWa5tQm9tE0ZtcJImmbHu2j/B
	iP3lETreRmvDPAKrMs+0wUVLuUF/9RaenUBtgc7bsg4H6ajZKmh+ElsCOJZetct31uiidwXMdbT
	XGnF5s/A6E9PM+xPKzfLh9Jy9u6CPm+1RSWhl3/5RXU0FPP7OvLS6t3ewTcOirqdGrTl/el21sn
	LrTaFFfAfib9OCmDThZCAoPCTEia2hUhJAvvWKj9HvqiJkJgyby7Hju38IVBlfdWKsZZ5WHlwIL
	Y+bsHi52Mllj/W7IN+gpd2X/X664sdBlUuKWNeeDYTCmQpxVxmYu47exrCkC8fM/TFzWGMHLPoY
	dbOhdRekUboM7GVk+tHHDPXzH8zPSlzyWTfw/L6FmGQ==
X-Google-Smtp-Source: AGHT+IFmY5THLm9dS6Ltyl84/gJeP6O7MDMN8wq3OBTV4vsimxgGIeh5PeYusAs8d7qMKStK/tRNLg==
X-Received: by 2002:a05:6000:616:b0:3e7:41ac:45f8 with SMTP id ffacd0b85a97d-3e765a227fdmr6279358f8f.55.1757798502238;
        Sat, 13 Sep 2025 14:21:42 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:41 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:10 +0200
Subject: [PATCH RESEND 8/9] arm64: dts: marvell: samsung,coreprimevelte:
 Fill in memory node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-8-8120cdc969b8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=nM2aOAL4Rd5X1oThp5ECWAxcNFIMgGN60dxwZOl4zsk=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/jHnzbvid+8/4WqqeD2tsaqOVVzrW4dMC58tePCo
 R7OvtSNHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjARFgZGhusB+x2XswWu8b3z
 53X0TMVnDvZdygG+SlOKT/IdFw/uiGBkmLWy9mLEXqMDpzo+7rnl8nit1aT0YN05gZ/uzJ9mF2/
 LwgwA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142144_116140_7CF3F973 
X-CRM114-Status: GOOD (  12.56  )
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

The board is known to have 1 GiB of DRAM with the first 16 MiB unusable.
Instead of relying on the bootloader to fill in the memory node, do it
ourselves.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 13a726d86e65ad836166325e0958a6ec3e6d022e..b3741389e2ae056714ff4235b972bc72b5560455 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -30,13 +30,22 @@ fb0: framebuffer@17177000 {
 		};
 	};
 
-	/* Bootloader fills this in */
 	memory@0 {
 		device_type = "memory";
-		reg = <0 0 0 0>;
+		reg = <0 0 0 0x40000000>;
 	};
 
 	reserved-memory {
+		/*
+		 * Reserved by the vendor bootloader as a "secure region".
+		 *
+		 * TODO: See if the responsible stage of the bootloader can be
+		 * replaced
+		 */
+		secure-region@0 {
+			reg = <0 0 0 0x1000000>;
+		};
+
 		framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;

-- 
2.51.0


