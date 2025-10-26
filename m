Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCE2CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 06:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRxFuvKApk33BC3d8xXXeSMvlG/sWU//suNyfzB/QNw=; b=uMmwO1r2GZLDF1xBQnWGyDGz6c
	EtIyLcgf5ycZfsJdaEd29XSvrQi42Ryj9mH6gQF4w9s6zml9bGIa7fCvO+yzQVCdpZHiWrK7SWlUk
	APGYTy6jv4igJ7ksP6wPsLZgS62sLl/9yV07YJXw5jywSL5Ydk2RZVbn3bd1yT0wwBByI+p6vkdbN
	Qzsgh3UFz92Y7GsadlegMeCqJwApfJpn992FUV+KoZhx1G7CB49PTuq/EuipCxuLV4bBt4VChJ5Mn
	G/bB4NxxpLAVTgsxmyHj8cK3+wCCb4TbFju7WacUsTRpUk6hb58I6GVj3qKV4Bggd5Psmw4SdXbZE
	PEVegNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCuGg-0000000C5GU-0KSt;
	Sun, 26 Oct 2025 06:30:18 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCuGd-0000000C5Fp-3cuQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 06:30:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-290b48e09a7so43653505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 23:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761460215; x=1762065015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRxFuvKApk33BC3d8xXXeSMvlG/sWU//suNyfzB/QNw=;
        b=Jb9vQbFl9LsFThcZMdruK9Q4cLR8aWX4QxICRW3P78Ipa4YrDb9LwkB3miC/ZD0HG9
         n/o2+MJAJvtGNBXBd035YkMKMezgVuY6OfkYCQZHwxRPXkh5v7WwmdG4dB0h7SnKjx2E
         +T+XeB65m9JsOuHVvTDihXE1MWFaS+eBximmY5lg5aEXJL9yV//l3gWnE87yfS66+97F
         HltHjD49HjYUFdjQZeGfWXfTY/vlps/m8jUfc/eJjmlUQaQp5Qyzhv8+YoLoKkUtDbu5
         royqXpQf2UQwFN0a4TtM36FBwpItZxe0JALK0sT9XNFTsq01jAHsrd1EFkDn2P3fiKJA
         pQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761460215; x=1762065015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRxFuvKApk33BC3d8xXXeSMvlG/sWU//suNyfzB/QNw=;
        b=IYaTWsnCkak8GaG6+O1V8Gznw9XpQQlAfyd/suklUe1yZJsH+mpcg7VYEAkjpVFpGr
         +Btd9MdiHUjCkZhi1sDELpaQO6K5ryN+vcqAsXmGzHs+91St3OoLLUaqt3flzpSegBFv
         1T6ds7kSUpDNI/cTFQAuRbXJuuYe6wrlKJ2EZh8R5QcHZ4wOizjawckhvHekouYKed6Z
         ArEEV6SqYG1MHEk4pY0A+oklflvzdVa1JaiG2uMVwiiKPigQqzdMZJ80McuBINqg/J4a
         23lKQZXHtKcwCxL8IMSHBDFZoW1+H/c4sAaQuqGPmHYXPWsghwBzTLixkQI0r8aYMLh3
         9tRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuKJZmrtkAZ2Y8/hXUlt0OIWckKKV4tVMIOb5vvUflBTt2wdVo+tjR9utDMi9V6z/e0YSW8aXgyENxB3gb8/1J@lists.infradead.org
X-Gm-Message-State: AOJu0YyuU1pRq1btmdGoKGu/ARM+dTYpxaWs2A8dHNg37xruLHL2FW76
	lyorNwq3Jte9SbfYq0PlmQDhs4PagUBQjltJHujZN5qpF7oYZp4YRrNa
X-Gm-Gg: ASbGncvSA5J8azSWKhk9iPRJqewf7m3KxdCPOaRtWGwBiEr8ENiC3ohMLYkN9JCpXm4
	o2/JT7oh41kpd9wCdaK1w05Qz9Y++wNGgAPEPGx7gozqSGSOfdHLQzcOqG9JYPlreXUSe8nSxrL
	a4xmaVcL6AhBBHzguMxXN2dF1YoUsLQ+cdAHThOz0yqsl7tFFMUxr0c7VpRTA7efZlnq4Zg3RgN
	qLjZAuw2xtebGeHpkcwUCa8PZV/lXjUWGTEDbHQ0dUdKGBsrlSzurC4MujakO8xR5ddlAR0Spo7
	42wsHjQNx1guoQaI+WzxNTOAoPGobWqvZOipvENxV2xUm2AM9IXi54T7bVD1C31a5XN3m6wa3cc
	kGGatgJpr3xs7AakR01o/JNtX1DlY6TLOSoQQcO4mzIo8xS36tWGcsERCb+WKXqjYLgH1V/Gnyg
	k=
X-Google-Smtp-Source: AGHT+IH7PDnopz1QlhAta2BSK/2CCRB91dAXRXofbVcqthVpmjY2bJvJp6m9EQhBul9G/8U3I0lZNQ==
X-Received: by 2002:a17:902:cecb:b0:290:c94b:8381 with SMTP id d9443c01a7336-290c9c89dbbmr456083105ad.7.1761460214815;
        Sat, 25 Oct 2025 23:30:14 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a60fsm41583865ad.39.2025.10.25.23.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 23:30:14 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add NineTripod
Date: Sun, 26 Oct 2025 14:28:31 +0800
Message-ID: <20251026062831.4045083-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_233015_936197_B4D70109 
X-CRM114-Status: UNSURE (   8.63  )
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

Add NineTripod to the vendor prefixes.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Cc: stable@vger.kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d188200..37687737e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1124,6 +1124,8 @@ patternProperties:
     description: National Instruments
   "^nicera,.*":
     description: Nippon Ceramic Co., Ltd.
+  "^ninetripod,.*":
+    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
   "^nintendo,.*":
     description: Nintendo
   "^nlt,.*":
-- 
2.47.3


