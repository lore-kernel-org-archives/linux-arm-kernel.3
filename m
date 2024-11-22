Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17234E65D3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=; b=TplFfFHk2K1Xsd0Lt/BD1mOJDm
	yFn88DRZ8Lyw79ugYQjQn9vW6xCYFR4scdGf54La20luK3lI7oQUflR2Cha/vwPCgKnjPF+g6B3G4
	xr/h+L/FofosbW2X6NqsFdtVjUpgur5OCPAM196kDVCKsPh/OHbw/psDCoWL2tEcoJHIDdbmNrXKl
	JRRdIrq1VN1r1ihJtIsOSC1mRaSTDmIQI4HM5bcn6OS1Rdyg4F45hBYO6L32K+9ljyUEYjzOr2oDR
	Aa3zp6Ne2vKqvAfGZse6pRqyHa+/OI/3hwSjWDtXlkL2Ow0iV1WtQ1DFhahs5QKYyLazDgxdRfWM5
	hITknNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQPq-00000002AMI-1oaz;
	Fri, 22 Nov 2024 09:57:30 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQN9-000000029gv-0kBG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:54:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-720aa3dbda5so1395080b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269282; x=1732874082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=E9zGs8oTFsUMTzI2KV8M2oeo0vKe3ZXFbS09vWzflUMYUbkTP4gDKk1EJV2WZLr2XR
         85f/UQhRAoXqHrZ7xTdC1pjGHPG89ZMFhk6WxfR5LPEz5Ge4TyCRV3V9gdbc5Eusn5kb
         jK0+4KLgc/PG5HNyoFgbHuqAJhfe+fmx85zraNBC0z3R/lp+uPfG3n0UGSTrPS3tv2F6
         y5zCnjQReon7kaGdQpUNwxPK2w1RkM/E8ZxTq1Ddmm03wKRFH0zjpG6E8AZ2YEl5Hiqg
         lT3vHdtZtFHU/0KU3pYjF5LobKVqtJZD2fJxi/M4EzkxAt7s8g1umgWcSguaErmUAOwW
         fQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269282; x=1732874082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=UcFOWe54pqswwDfBVSR6IiTFwAa9iaGqQ2aC8CR+yn/tA2K262zdmTB6W+UuZ0H8l9
         GujLxUGmHR7Orot0+4CrWeFySxp4ncZ/OorhIohGtkzB+9ZGOESJkzSRaUlerOhVtaKA
         JwVyAgw0iqD2v/6oxmdzI9JASj1gS8V8vd01b+gHEWGaO72dmH9QUdQW5dOzuvOOZFzB
         ntc533OkBcSkAeHXiez+RSXFjo2X70BryfGZVuYnXUbXNDRBjfA+0LZSo7//cHfCRS4U
         UoO7bJV7me0d3yNh3Rkr5CCHNFkwc267d9HawEh5chBsxYt9HfKKWmAdQEc+M1nS022G
         3/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVEQiS9kEdrTbEA3ztWr8orTNx+F5Sq8GLs0yRuB4Nwc0+Ah4eN7KFAjtJMpvOswKXvoI/9GeRxfQ4OZdP9vWNH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn6klonQBWeHjpysgcIlJw2dX1XHjMB1A7Saj7ADrlwbDeEa2d
	T6gCurDt2t1n/klKMn/wQsaRNvx5B0r3dSLN6yty0D7rZByZIy6G
X-Gm-Gg: ASbGnctYJtJOLaJsSZ3pvIzTLesq3wzAe0GA86SMteae230oFiHLnwACv1Ax67jn+d0
	izHhgmX7WUENK97nGv/HxOM9zLoay4pfbVQ30eAu4OZ375IEh8RWYlOQ47OrDuTPoXJ9AiPrLx7
	xKhdzE758JyzqIQZbml5sPt38V7f4mfw92gmVEuF0ENQxvV8gLireWnESpdjNlw+m3Kdoa5u+R+
	NMmnPCuPWKThBoHN+HOCS+Unf/wVyxdhcCTn/ggKAFq55BUQWAOWpI1q2knXanJLf0=
X-Google-Smtp-Source: AGHT+IG1mSXwA3TMBrA9RT10+LRaQrL46redGKLRvMQJTuaiKJytNKP6/Q6IsAaMKo5OeafMhXXAtg==
X-Received: by 2002:a05:6a00:98d:b0:721:19bc:4bf4 with SMTP id d2e1a72fcca58-724df696daemr2863138b3a.23.1732269282031;
        Fri, 22 Nov 2024 01:54:42 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:41 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 RESEND 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Fri, 22 Nov 2024 17:50:31 +0800
Message-ID: <20241122095136.35046-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122095136.35046-1-towinchenmi@gmail.com>
References: <20241122095136.35046-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_015443_212739_F9E098BE 
X-CRM114-Status: UNSURE (   9.78  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.0


