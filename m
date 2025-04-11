Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B21C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkLjkAkBybKViu/IzAoHDfQk1VY1JyR4qcLvgOYgY4E=; b=dXfvBiPxS25KyAHBcBQCQWPeJd
	FJguwhlkkv1ArWkFYfJxTvqEJpN3A/2i2adGfOUXpOINT9f9WJwWiyl6MhCs1G+oR5niDKwNKGZcL
	m6/8tkGiyNdFFYdIZcr6uQ5Xsl6klEKwKL7XCiXpOBYll8Wu73STo+sZ1bqKLZgfx/Bf096GghnY+
	kQ8yrIDUKtIgv4QOTa+pjbQAA6YDuCQS8SF8UNpsp9GZ6rqxr7zvj1frLczAif/jO+okCWxOuuc28
	XpALhGXs5pIt8K05cnajnnRQ2kLV+zP6VsT5tMh3CVxoDJ8gFTgR8CFChHnHplHsOw/+PSsFV/kNE
	O3SwagLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32ar-0000000CANu-0awB;
	Fri, 11 Apr 2025 00:50:05 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32RU-0000000C9Ma-3Ern
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:40:25 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso13654871fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332023; x=1744936823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkLjkAkBybKViu/IzAoHDfQk1VY1JyR4qcLvgOYgY4E=;
        b=fXqbMcjiFroglF9bCFBAIUwieAgwl5l0L1FwPEfKYW7B6icVJ6pg9EnGasktvwl77v
         BvgLosyt1mtQJwmGUf08d4s9gzN9LXZwhEHJX4RcnvSn+qDabcWOQSVk3z3kyS14Wf5X
         CAaWHNaqNZ8HY+LqjVNJ9BxapnT/8nE70lsE75mQ1NlEqaZ7qDl0F7QaGBtUfCqdLdAq
         c1rFc3fFF7n4n/3U4tzL2fCtxLkAvqVCUCr69Mi/IWc09f3pOHdKHW6rRTRdpogBXhep
         t0ZV9b1YpoXk8+f/zkWcfKP8di4RJTNhGPEEDcbZx+5h+6JWBDmmJQ3txrwBFshiFkDJ
         4bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332023; x=1744936823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkLjkAkBybKViu/IzAoHDfQk1VY1JyR4qcLvgOYgY4E=;
        b=nT4w6RAAWZesoFpPqyYZZcQ94atwIB5Sxy8p19zODKnyIlOnEf9foirwTf3xEwM0Kz
         Z2k0u8jtgxTW8Sneb+nJ8PQESvb+Fv9U16V4b10iqYEf6MlItiOFWk12P2PHNVkidTZx
         1J382xjq154DUXsJW87+bAtHESrUp54ytAfLgdfb+HvNeVeZZGhrVl5rX9xOyNqvDEgM
         eX/56JgrhlYhM1ym7Stllwl+dCQtfAmy9b9shcoEzChlDm0VNVAvJsF1FPh4taJB2cx5
         G/k7x1m+DddYolM9WSbJ2h51pCQtgblIt7ksrcumU69yOOmlJFOccr1l8jH0f7xTQKoY
         bqQw==
X-Forwarded-Encrypted: i=1; AJvYcCXhrihK9eI0ScbBnW9AoyrdCaX0tKlks+3cGIrm7xfbaD4M8cDnOIPO/MmMp4pTWttbAfWQNdoiMQa229BB161d@lists.infradead.org
X-Gm-Message-State: AOJu0YzAzpNPP+OMkagqh1Jrh1AyQVeD+UG4wVo6AvfWf3Z9nehGqVbn
	KFuMkTwRARSsoh97k72qkQxoTwHFaMSF/sZ04ehA3MDWx4zuL879
X-Gm-Gg: ASbGncud4UrE34tXgM/gUeJzrmlCvLtydrREbcaWjrZypg7FQVJI2JcUrYBsRIgVsio
	FYWvbmVJ4Nhq6FZGVBAdD8OqMLeffF8XWIrJxwTdv3jy+EdsMjLwydrWksQ0L0EdxIzSPQ66i7C
	HIOcCwBHopFdocTc8P+1LZVysfRCzGDyMUR6OdFNGK6Go2cVCaxFlILYDjM2atrkJfMI8rCXwKc
	G49NaCdVst8F+hxSSHiq9H//GXctoRnR6Z7wzSrdiivI/LqB3xpVJQw21WJfKn8fpOmst3DjQ3n
	cZPc9ZN3XMf+ZRKIQDJGu3J1Jz3gv4k3LY5knkVW51L8uh3+LA==
X-Google-Smtp-Source: AGHT+IH0C04pdT7V39Cl5bBkK9z9UT0OrMbiEPLzhJb+HovoC/tpoPabyXxob1snSgH5ltQh5BDI9Q==
X-Received: by 2002:a05:651c:2203:b0:30c:3f82:6844 with SMTP id 38308e7fff4ca-31049aadec7mr1968671fa.34.1744332023158;
        Thu, 10 Apr 2025 17:40:23 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:40:22 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 4/6] arm64: dts: allwinner: A523: Add SID controller node
Date: Fri, 11 Apr 2025 08:38:24 +0800
Message-ID: <20250411003827.782544-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_174024_811590_242FB120 
X-CRM114-Status: GOOD (  10.24  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The SID controller should be compatible with A64 and others SoC with 0x200
offset.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ee485899b..d626612bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -171,6 +171,13 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		sid: efuse@3006000 {
+			compatible = "allwinner,sun50i-a523-sid", "allwinner,sun50i-a64-sid";
+			reg = <0x03006000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		mmc0: mmc@4020000 {
 			compatible = "allwinner,sun55i-a523-mmc",
 				     "allwinner,sun20i-d1-mmc";
-- 
2.49.0


