Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C11CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdNxsDJ9m7UGbRcYc8TABHid3VHQHv2h0LQ2tYeasVo=; b=cn7M24miaKMkaeNzCVkU6ARLp8
	3a2y7SPxlIkbJKH+Kh44dJ46DSWlD4zDHIClnuh/rB/6uv/NpR9TOTesUrUgtkd/9iM1iecRjPTRZ
	omXFTfBjkZnSF9H26XFQF3yxFrY5lung8Dj/KmQaUstKQjUAtfPFdhNu/nxM+/ujO+dqjsi1PjKdt
	2bnFipP3TKUckCuWtfiMtpZvfHNpmN1db1kLO98qKlF4nzOZIsKFbPEYiokAkbsYb7/mZpcahM546
	tokyrQd8wlDqk4CX6jYdKSAJmag7fhteO54UQLOtLnN5mqkciVEmxZ7TozIeihpXT8DFFK4lIcCpS
	5ESTRT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu0x-00000007gSZ-41aT;
	Tue, 11 Nov 2025 19:26:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu0p-00000007gPw-2Jqx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:26:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2957850c63bso17385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 11:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889203; x=1763494003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdNxsDJ9m7UGbRcYc8TABHid3VHQHv2h0LQ2tYeasVo=;
        b=a6Ax8pF6BXbU6SE95xM3nlhvP0a4fYnQjA2Wx5m0wIZblKOA9FegwNiSstr5zGKbFu
         Lbrm2M/j/amqr2ZWcoKAfqsWVqERzgvFwCF+ua9bgbDf4FXHxPgJG+Fpoz1pey/DoF3x
         wBX+4muOL5AY3I1Q5iorRVlQ0wKRcqBsPTysI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889203; x=1763494003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdNxsDJ9m7UGbRcYc8TABHid3VHQHv2h0LQ2tYeasVo=;
        b=Ep38PrnzctzQN8pbKYWY7RgPGTvchfAKrr+so1h/Nbh6jSEeCorHi8YpnJbNAcHPkt
         0PWJsVxIVt83sVukMH/UwUQlfEmrudRYwBvBfARqW52PavXix3sPkSlw7IinStcna0ZP
         WZc99eNctF5buBIw6IE0M6qNkQAvHOLXjVONxmxuHcQCkMhnF+XE0u4S6inaqwDH+gkx
         kBmADhBc9yt8tLefbFMSspmTzuaimj6ZZMSEI4nkwJzEayAC9IOoaiXOWAK5EYCtcgOl
         PedsyDaYJoN3robafbVqi/z8jJfhSqAadlZnSqAktULLF7f7Wdz/VKZSqq45fwD2xNZj
         OL1g==
X-Forwarded-Encrypted: i=1; AJvYcCVLM/m2uTm1xbKrxCPMQw2kX7tole0Q+0QFuGAul0jlJk6vpbHnHK8e1qJyBuhuPt5LiNSzX3CBmS3+K+nIFoct@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm0CPBsHV4oGKSWaTHie8MuB9stS5xdZ8N/dFRMpq3gICYV1yz
	2W5oNGZT7UWYv5qtQPLMleyzS+mPfNBKiOS9dqRHC9KHBALsVBuBHsg3lR8hmSw44Q==
X-Gm-Gg: ASbGncuApiN2r5K2iNJsyje8GBl/J5PfKzugnHRBl7gGXQjLGC+3uyP2GV3n0cIecqC
	TmVvkf5XtNx8/eEL0w9TgcuWTVOBRvvTilT7xJAxamsdhOjwKUoPeezLyqbFBRLDHH8E0hWgWCd
	CpgnsVs+UD37dLKQP4ciHoQ9eGCx/4Cn9k6cz50xl2HjCgyVabj8lHIvR3PN48EAvY22I3+EJDr
	I+9tN3w24YITvIDxdUVcQW91sMPyIy79zbiPxQGzBzfByYQ9UJ8PPldnQADnCebZ7DkQyxXTpdK
	43VVpWY+NIlXg6URhZxXHcrP8R4uZbDN+8oCYP54iihJW+8I0tGbuFCjE4R2nfxXswP56MDaxCL
	sYhRH5Fju/XGaVkfr9ZAL2D50f3XsDouIbo3Y831LombIw+JscYTOdmIArYPaOT3eqZY/sDJi5e
	KC4+rFBjufnXdWTsUJCFmlhLgkfQ0qrrBuhMEU1EPlS3D7qv4JKPIZfacPb4lXsJ3WUwpKkQ==
X-Google-Smtp-Source: AGHT+IFUhgG9WpQVUBXncCvJtpv/AdoMd+/rut91fwnGCd4l3imDRqM9pTW1tm/5jIJ9RftY3SLcaw==
X-Received: by 2002:a17:903:944:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-2984ec88253mr6581805ad.0.1762889202759;
        Tue, 11 Nov 2025 11:26:42 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:41 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: serial: snps-dw-apb-uart: Add "google,lga-uart"
Date: Tue, 11 Nov 2025 11:22:05 -0800
Message-ID: <20251111112158.2.I040412d80bc262f213444aa6f6ec4f0334315a67@changeid>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_112643_590037_62E672CC 
X-CRM114-Status: GOOD (  10.88  )
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

The Google Tensor G5 SoC (known as "laguna" and canonically written in
code as "lga") has a UART based on Designware IP. The UART appears to
work reasonably well, at least for serial console, with the existing
driver in Linux. Add a compatible for this UART based on the canonical
"lga" name for this SoC with a fallback to the existing
"snps,dw-apb-uart".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index cb9da6c97afc..df6a7558a9f2 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -53,6 +53,7 @@ properties:
           - enum:
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
+              - google,lga-uart
               - rockchip,px30-uart
               - rockchip,rk1808-uart
               - rockchip,rk3036-uart
-- 
2.51.2.1041.gc1ab5b90ca-goog


