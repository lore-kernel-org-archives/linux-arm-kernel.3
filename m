Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655E4E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 03:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+SqWvKMXn53ySqihikLvjixvoulHaOpfvaW+kjjCzk=; b=1yd0zjXpfEbngTQPUwe28a55nT
	S7APsMg3Hrogh4MzTFDur3bAmmUKL1azkTkVT1v6e2zCvo4kMgB4hIIl/AYLinroAzAFbWr/i/dQc
	GiDufxeTdImjKjtkkeWFnshgeXLmkmLpSrwVRO7rQBgy9hC7VhzNc6/oqmM/Mc6BYDlMRDgDGIrUl
	fv6xJWHlLRYWRx0d9x4N+AwtJW1630mYUOEtZYhY4vL88m6qCkHegr4XRlRcqBoMCys9JaGnfo8hw
	RuG/4c3GiBr46SiC2XCoD5j7guSDzvlynBwj11sMp9xZNTXHWrDP4VY0md1QChRaqfZs61rY/5u8/
	9eBJcyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDUz-0000000DewK-27gG;
	Wed, 11 Dec 2024 03:34:53 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDQk-0000000DeIf-31hz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 03:30:32 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-71e0351311eso491449a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 19:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733887829; x=1734492629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+SqWvKMXn53ySqihikLvjixvoulHaOpfvaW+kjjCzk=;
        b=baH4xirCnn6arO1bDk9n5BpnDnrlWsXtdJwcgi8xCSQYwsm5P/93V2wPzrqgmQgmjr
         kH60+PVkXpAkKepnILyhbBc++XOF/u08omicWOGK5oVAr/RcM3sXYABADUq+6x/BMxNo
         WWInk6nbeeTrYlRVPLvy2rq+q5bkkZSMi9nMD880e8zq16aYflaATYnRQ2SKvWr5dxYR
         /Zd73aTRcbQF7J+R5Fna7N4AD+W3eaHUUqH1Jn4EsmyTdss96DqDTAusOX8qxIVG45Ny
         /L0gBpoLosEmETLU4rCDSoVOKihaQjBUROvTAQrWD3/fBsb7cHglL0XqO5MlAYoZGD3k
         K7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733887829; x=1734492629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+SqWvKMXn53ySqihikLvjixvoulHaOpfvaW+kjjCzk=;
        b=BftLWNsMZQhljRiJd363PUgxnx2pmVIvjTpNCUSLZUdEyz7ERR9rXxc/ce8R5GJbla
         uCGOOAAFKZijaHkN8h89KFA75I02vWVMdvj92XPRcds4hoP5pT52avo1VHZOrlgRh4SN
         Jj8avgRdPVsHBDtFvh8a+/RuYwRoJMu5Ch8XxR6OQuv/7FBa/sJpVtPtmgq0LzbtJSWn
         sQiYBH4YV7hr4UMTAK9r8Sqy9DaSuJUbK+WbImGrgpQAtveSN+QjU3Ef+8XKXl/tcu4d
         tyMRsMIgPlvfgAuPHe+LYlDu8sZ+/9saHSccFOeU/51ZHTROh7Dvpp9vUvTE3X2ykc5d
         NPHg==
X-Forwarded-Encrypted: i=1; AJvYcCVmFZBCu/f9ejqs1ktqbncPA9eNjSbl/NYmQYlClYr/ktiS210OOxbHllsHeJt9klvkNB6knjJLgYZet+sWFBoH@lists.infradead.org
X-Gm-Message-State: AOJu0YxcAssdSoNA9L/tvWQlAGRB1dZNur/XYPQp9XfkwMEmZK3yCHzP
	Drr4V096MV2uYjzXv1ZpG8DYrRc0VOQoVG64Pd4edpzw/G+sH4Oiw3c/NkjcmGQ=
X-Gm-Gg: ASbGncsSpTMWsuGBIrZg2orGGbgjPYWWQPWSOvB6f5XQTUCEXtJyNis7NCP0bY1lCKn
	LJEs5MQ2DrwuVrrWlBHpsHugb7wnZ1NwRxZokfv7sFob10dNre960fQFbHSpkcj0E1Uem6Abuao
	tEvxp4siroIyPqhNi0hVDKlpk+UlMq5kfb1zinRLfVuviPngGmiFPmC6ogbYE4GuO0ENqvNyeqS
	l3VqUTti2OSMKuu2XBN95fejPID3BWpKAnMoc6XKx31uUI2I0jwTqq2xPM=
X-Google-Smtp-Source: AGHT+IFxuwtOuX7RSi7QuMnWBVAHW2v93lQ0WBBx/aGpBUEB+zUeX9kV14JIgbiv2kahMG99yLppvg==
X-Received: by 2002:a05:6830:25d4:b0:717:f701:4842 with SMTP id 46e09a7af769-71e19b5ac55mr619830a34.28.1733887829115;
        Tue, 10 Dec 2024 19:30:29 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f2c472a028sm996004eaf.33.2024.12.10.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 19:30:28 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Specify reserved secure memory explicitly
Date: Tue, 10 Dec 2024 21:30:27 -0600
Message-Id: <20241211033027.12985-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_193030_925888_43910B2A 
X-CRM114-Status: GOOD (  12.22  )
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

Instead of carving out the secure area in 'memory' node, let's describe
it in 'reserved-memory'. That makes it easier to understand both RAM
regions and particular secure world memory region. Originally the device
tree was created in a way to make sure it was well aligned with the way
LittleKernel bootloader modified it. But later it was found the
LittleKernel works fine with properly described reserved regions, so
it's possible now to define those in a cleaner way.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index f074df8982b3..7d70a32e75b2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -45,17 +45,9 @@ usb_dr_connector: endpoint {
 		};
 	};
 
-	/*
-	 * RAM: 4 GiB (eMCP):
-	 *   - 2 GiB at 0x80000000
-	 *   - 2 GiB at 0x880000000
-	 *
-	 * 0xbab00000..0xbfffffff: secure memory (85 MiB).
-	 */
 	memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x3ab00000>,
-		      <0x0 0xc0000000 0x40000000>,
+		reg = <0x0 0x80000000 0x80000000>,
 		      <0x8 0x80000000 0x80000000>;
 	};
 
@@ -146,6 +138,11 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
+		secure_mem: memory@bab00000 {
+			reg = <0x0 0xbab00000 0x5500000>;
+			no-map;
+		};
+
 		ramoops@f0000000 {
 			compatible = "ramoops";
 			reg = <0x0 0xf0000000 0x200000>;
-- 
2.39.5


