Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34843C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=; b=z3lQDIDx3QpGjLG8YBCD9UieCJ
	tyrxZkLcAtoRviiEYp8ocVgz5eKikMCSZhLYPO8eTGD+A9FqPwCVSGSz214XEfU+oaO+g44dg3oZi
	NxiD5HubpbeuyOHHY0MTMha6P23Pp8vgsC7DDp22n4HZBHlo2+ImqoxljrdiW1Z8QVMye+tLxN7Ne
	7W4TOrxOXpcp0PtcsTUVtvLSX0tZYfQls5i7fB+Up+OvzM4NTPVQHKDZRC5hKLwu0BMkIsiWeQ8Z/
	nGdCMx5btYjDCC2c9q9sqnqLK75usnQk4e+KPJrGC94q4I4Xiw+A9oTSFAFihOokua028oTD1HgF6
	islNV5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQymG-0000000352U-0gew;
	Mon, 16 Jun 2025 01:36:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyhu-000000034Bi-0GB3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so3314103a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037537; x=1750642337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=gLz98SFIRq1NqxOeso/LHhKsq/lWz/zzKpFm/8spnHbX/WgFz8O/VPOMIDK0rjmFl8
         xM8ynBSpyyzlOxchJLyb2tOA4SvW7W6A0zhPYrB4R7ZnIik19bvIAruo1HSCxMKTFCAd
         2E5OXUdIFTgUOo4c9dZcAwh5HhDRYY/QI1lliOeXlbyGlcn7tE2s3PgGQG+hsLKV7fkt
         EAb1l01jdFit0UtyWFJhjwEQxZypaeexjTMneD5ot+2dU2KaZyeKnqbSPzN6gyQPIIu/
         b8ikj577BYQlOl3q3nrduKgvhYQrdh795ssNFI5cWQjREsGXbw7r9FcjBsFAOF2FTyuf
         TO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037537; x=1750642337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=eNP6adTQ03nLjPd2WzIAFRW49sbP0Qlok5D2L+LP5WGHlYheyOz4WiGpzwH5umFZ0K
         v/qxJoeHRMb6BQLkvtYbOuxaLdvm/AxKX8CeqEc6AGK3/7yjc129ONp8urq/hj2Um41r
         Cz0DE4AO/GnxXU4Yhi88/bDFrs5Flr9S0szxNVtAFHdBLOqgVAal1QL1koSD5GEPeeGT
         6nZhmt8bT2fJ1yOhKmytoilZQd1urNpOfbGUpGXHdWJlK/Xgzy1WksJVK1F82x3u3iqU
         Iv5a0DQ0CwjubxLp0B6RuodIJCQ/qnkyh3k71y8k1fEtJPVehHDrOWp4xW2FQx4Qk6Hc
         RxyA==
X-Forwarded-Encrypted: i=1; AJvYcCV9umAL9M8zn7yJHKD1J15iUnFE6q54gM6vqoaSl4bfaNQXaz+cAbcgbGScwt7d9MOIOakWjGZA+Ft0DXjvtmdO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7sgA4PxuypcKAahf9O+EabnPYi+dGbUtoVmU4HqH3b67FUoY6
	me1UqvrTcZMDYIs7pMv14OW/l+ddNmjMYPb8/NceYSEwCugIkqhupEej
X-Gm-Gg: ASbGnctJDKagKhg3Wm8gsA4yzwEbksWIRYus8fkDx1uUXeLQJ4nfSXQrgB1sfdgEJ1+
	ovg7mz6qVqF8SpyFtIQrWXa7Ojs3lo4xwpUue9UdthjqDzdA5/eTkUPXmAplSceZWWTxlhdw0el
	yMQZoZwf2AOHNmMEyG+jcDZrBOAn0XH3wo8Kvq0BNFpQhEB74mJb/r99uB27yZP6fvZiq1oqh+8
	C13wM4/+a/C7bQUmDlcyMtQlIsErVudue5IIHDlKbfEV89OLb9PbyaSDZlvKEyHuIVGnhVCJTbx
	hi5Uo5ChTNDmjmHkc7taHMF2NoMesq9DSE6/OgaDbTvGfPirvkYWwYSAArkZz0GTXBlFZMJ8fOH
	uQq8=
X-Google-Smtp-Source: AGHT+IHnMNfnqXTp6Aj/xELzIdpeSj8LKeXBoMYdtG8441pLPUzGR7YY1kIXXs+VLtmWy5GJJl3aUw==
X-Received: by 2002:a17:90b:4cc3:b0:310:8d4a:a246 with SMTP id 98e67ed59e1d1-313f1be1b4emr10012442a91.1.1750037537105;
        Sun, 15 Jun 2025 18:32:17 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:16 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:50 +0800
Subject: [PATCH RESEND v7 01/21] dt-bindings: arm: pmu: Add Apple A7-A11
 SoC CPU PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-1-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QWWYtTwzjULiP8DN/cykkj8vIJnCQuzptdA
 wB0U7qCg2eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FgAKCRABygi3psUI
 JKGMD/wNuXF+G2au4+kmN+zz5CA9eusCR5mJrXaUgqBwXLIAhdK1VbIPFbzNq8aIhWZNaIR2LJ1
 Cs7ZBp621+xZcQR28XuzEaKw7Ox0dGiPCJXzly8Wf2MJa8HJ3jqM6Ire1VHY9t2OZy9ABQm+v7Q
 4k7lFtb08JD0zVxirPai4hCRMGNYw/xwqLaT8TOJGHty1h8Ey8pilXqZC4A4ZXT2MFSNZYETAqS
 8y78dzOqZft8374UVUNYIo1goOda1I5qhMzQREEeAb1C3IcQTGc8qJ+ZL8VJZQ4L/rGXp0Y3Q0a
 v75LTeZwMSLRfQk+vQUZ22ZTGzplind+KoZPBLKx2G4qen8Sh0uOa5hz92Lie7jGxWMROhS5IpS
 kCiHsWa+OT76WPKMPNxau0di3gCWcASaLC7fp8V6m6kM+9nP3ijUs3CoKLELyWtiXMDZZR9VmpZ
 NNOY86Rg71RRzf6xAVzRoz1iPNu8zckEUitVsqcn1OemQrqV8NSXWtSj+h79agd4VEcBWUS5wpc
 m5hfFlJX08GpGy+06Gg6xiPFWEb0VRakWOfOKI+Oh6B1SfjKLxUCisRT5RwLuHbflcW6j6deRoz
 QguGWcRE0QqHpMhNsHo8wBbibJ/bWe+HT3vxq6nrl3LTIjeTc9d5PZmHNzV4bxy7YLuVMGGjV1w
 s2EAD/cmCvA5xeA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183218_115871_22E27B4A 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.49.0


