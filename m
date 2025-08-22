Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28F9CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD5Eh+dR5v4rP4n4DXAHiXUxjMC8uNOZhNFPBWdO2ZY=; b=DaLVKgQm8JbR5KkKv2jHF4aIRU
	ZBlXupPivHlG1ijfq0eGmu3aS7db4+l0mol7oXyQQyqq4ixMS7fiHDH/CGtEUXpQk4vwR7cKSxYZr
	c+yhQTGLxW/x131eFsWWA3WLi/6uWb90Y6pTMs5xJpj0I5MfvhxeB71sCiA4QgTx3zHGClbRbXhXN
	LXmeiNrOgN9WH04W4d9U5BLmhze10Pc+kwr3qydH+4YGSvR5quoJ7HOrVe5ItMDuNyQO0lgL2WZpU
	/C5edUAofe3m94vCtPH9ciNVd1FF/7SAJUc71LOJtnd6MX8lMIuImsAkuzxIk1nOxhPsYswK6msJR
	cwe1AYrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwq-00000004Dtn-0VF3;
	Sat, 23 Aug 2025 06:41:56 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVzv-00000003H1k-0AIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:56:20 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-33652937874so7983621fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755885377; x=1756490177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zD5Eh+dR5v4rP4n4DXAHiXUxjMC8uNOZhNFPBWdO2ZY=;
        b=PP6j8FNmyUF3vSDJaPQX9YT2QeofDnD1m3RfMiDOWg6uTZksTd4Oc2k3po4SJa4ACo
         bftFycYQWJJnMwDa0xevTjazmbdGOgNPup9aMUYhghTYB9HuYPz3006D8WuNE8lgF6nL
         KS0Ra/FdxLdLTUh+AhuJGaOPBUoQPuM3xjpBTopsNQTcTSENWqkKkYtbsjxz77Afx4sN
         +jpP3akpIYVKaEmnO61aEsW+UY7woDbJORLiX1DdSV2LijOwG72yk1kcb7A0S5lf8Fy7
         6aUMq0M3lQ5eAxCdMbszat4OmuB5Ww0GkdlvYdeNbG/r+ihwJMtJ6ZkqSE7HalYz8a2D
         3VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755885377; x=1756490177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zD5Eh+dR5v4rP4n4DXAHiXUxjMC8uNOZhNFPBWdO2ZY=;
        b=qNwNcqTqQKF6+6GGF2spZ8qgbilIcv0QQonKY5G7VX3igUgA7HbH1kGRA90HhCN7ev
         LzzRdn4tl3fsmK340Q0tz8nHY88dR01sqQQkVeUpaXllPDM/vAbNvjqRTKEcIXta9gHP
         6pdaOGepB7QjGNtpRZ3GWZAYApvNDeB7skUMmNZVQY2nR1rNzBuZjeDSQIUMEOJp9OQk
         KPem03nqmAkWkxeHKOtiatVXleiUe2tRBi6lvaHBpEvAxxI5K+mSIrf06+6qJB0ooCSw
         rkhopMDE1BvAK9wAI0I3NwiIbCANaqcydiR3jWAqHVsFR99q8mqcsmMrVx/yuaN4KoY3
         sRuA==
X-Forwarded-Encrypted: i=1; AJvYcCUmvTtUs89Ks+LJQ7pWSBYiCUMbf/pY6NA6FsvicEbOdvUsc9KB/lc6tLIqfnAJ+hATB8uPDS/JUtrwGnZVlk4j@lists.infradead.org
X-Gm-Message-State: AOJu0YzVEXF87AXvo1eFdMrmPHaOcboKXoJgw4L4NPf6/s6HPj46ymcm
	RkdCZJa5Zc3E5karkZlq9Q/ovLNU6Jvf8/VvEea2IoaPhLlmUWUiYAi3IMx1eY9uAJU=
X-Gm-Gg: ASbGncshAJ0K5xf6hvdUsJKCTjI5EaCeg3627EkOzcX7EgEshNBkO4X+vPyd2/jEkfe
	xN74ZIqJg44Q2q8AglBBXCamf06odCbNOHYmxPsFf5WSKNigoNSffQeUMl0e9VJVbqjgjUkwYK5
	1mg2iC+rfs2h1nHU8cSWnQIo01QxteAZ0vnsAHLBZISuHhDVyAkakz6cl4860vzbY0gg4lLZj5m
	uv8MgSlF1Ou0ADUCm2kHquSYWjir1x+WaaLHXp6WinwPBO4B1Pllto1RFOMrROP3IaDOOV4rtlm
	pCn/+cNgQZk5mF8sfhrlnLi7eHhiX+SIVHprXebPQ89rUmrHUGM6MT+k4xNkIZ18fnWMenjXm1I
	DYRD9HK8zcjcT0Hf+9EVUlc4Mv/Ibky6B
X-Google-Smtp-Source: AGHT+IHkd4rp9o65KEVeGQOptgz31Pcme+kqRRdbSJ8EODw27p9FhUTdRXSHoHuCwjuHXwm48Z3nDw==
X-Received: by 2002:a05:651c:b25:b0:336:5d33:c394 with SMTP id 38308e7fff4ca-3365d33ea6bmr2641501fa.33.1755885377298;
        Fri, 22 Aug 2025 10:56:17 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20d2e1sm605121fa.1.2025.08.22.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:56:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 19:56:14 +0200
Subject: [PATCH v2 1/3] dt-bindings: Add Actiontec vendor prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ixp4xx-mi424wr-dts-v2-1-cc804884474d@linaro.org>
References: <20250822-ixp4xx-mi424wr-dts-v2-0-cc804884474d@linaro.org>
In-Reply-To: <20250822-ixp4xx-mi424wr-dts-v2-0-cc804884474d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_105619_093212_BB5668EB 
X-CRM114-Status: UNSURE (   9.73  )
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

Actiontec is a US manufacturer of telecom equipment.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54079a39f35b570d69f7c4c2274724..a0abe9e39291eb687793d1b4b4187524a004a413 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -48,6 +48,8 @@ patternProperties:
     description: Acme Systems srl
   "^actions,.*":
     description: Actions Semiconductor Co., Ltd.
+  "^actiontec,.*":
+    description: Actiontec Electronics, Inc
   "^active-semi,.*":
     description: Active-Semi International Inc
   "^ad,.*":

-- 
2.50.1


