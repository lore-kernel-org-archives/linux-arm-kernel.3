Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E6ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SDIgvocR7eSGyBef7vxMCGlKJolA7WVr3JO0DUc8Zu4=; b=bAl1L2DHUFs8vSDk2JpgrwxSAC
	TBYQzIx5NEuJ2EZ/bVSD6+RqZKw8sSdLgqKQFb6VMHNPQjUZAQWjLGBntlkWyeEBcs+JdK6QzvPEL
	O4XPF5Khq8qHWx4zyeyonDUebhKGhbwCa9PUiUXbECY1n/5EDx3cD2PVT8ffx+CMA5VZaIBPO+23d
	vi8nLjn1M5QHVy0TZ7Yv5OQQb+59bEkiOnRFvW7ZyOlnl/IZ760wsB1ncQAbZdfwjkOWn3ZGYC+mC
	cDcwd0Qe/jY8Q02/DkRTqNzCA3HQnX5vFj93DQ34s2nkOWyaSEXx+M88HKBsUQu5V1FymQkICdfR5
	l/YfT4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UNT-00000009nOa-3U7H;
	Sat, 27 Sep 2025 12:50:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UNR-00000009nLa-1ike
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 12:50:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso2188787f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758977411; x=1759582211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDIgvocR7eSGyBef7vxMCGlKJolA7WVr3JO0DUc8Zu4=;
        b=cOpra0qOvmkLwgsFs/sEpalecygSBEOMNuVPDSdkl9w4caAyw5rm3YSaUL2jCqAPax
         4ErUsgVKiV8Ch7BMMvqOCKO0fNgT1OdWutDJKVgyyroQQwPyTwQ7j67Nx/Jt4aQ7uk2u
         jRLjfrC1BoZqFvvT7iNR9o6a3OdHYxsJUpZZezkl2TmviTTNCyK0yxyYy6D4KwsKbVt8
         heATUQFHddYU+zRsIsWpQpT1kHoTNZWXBn7P91M4+kbpWm0mOGLbzsgnVFIQBeU4Y8Yo
         z57a80uWrrTroh7wkf4jkHay8Yb7IlzDIuqJyAzwjHJXW3vs/H2uOQxmcgX/d+ubbvW+
         Yrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758977411; x=1759582211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDIgvocR7eSGyBef7vxMCGlKJolA7WVr3JO0DUc8Zu4=;
        b=qzcVtKVBKrKO5WG682WVkuFgYgzpzDL/pglZ/rwQpISXXqBje05AAJ0CSxxaWHZFbv
         wz4L/jMYH8ba96uPPRtaQqT9xx/XWtEBpGbrVRWLmNr0oJyXEjZ0Khi1J8SYXZHeXjwV
         n2mbVBRGxqyX2mz2NIhwFbVZ0tW3aKAzWp9NcRBYgL7i/M0fm8UCMLYCtlMatNNlAO+y
         sifgbCfhvF6NCba7NbffxP01z5eHP3ls9P/BFjNKRrlGjKJWmCZ1+KdAwJ1sdlJm655L
         gVNUN+fcyQETfLq/ApJOpeBHBNOm+vT7gTnRfMpg0jkiC7uQzFg7Ah6C3t0hga1nraqk
         eGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo1d8tczOhTR+CNNvncSmNdKOtWL5IlQqNUpyfxB873FNlDsQokaU39FM7kfX0WeAEIq8M7WwOkBQTrGUM8bCc@lists.infradead.org
X-Gm-Message-State: AOJu0YwlL46ntnGDAc4wF3baYdD3y5SgK685Bp4QqP/jH06oJwWn/Wm/
	b7YT8+GzfLtmHBAfHdCMtsYWwre2zPF3vBEoFlFfWpMwy3tSgqUMClHF7fTgB+pKFAU=
X-Gm-Gg: ASbGnctFQRFNQgA+BEWy2BSb5/WRXgr7U8LDTsP1jDE5N6NdzOSdz1bv6SbO2DdzrI8
	N0ynkhdT1f/Mk0b5L+Yv5OWWgn/uMdz9nQFOoFSrPoF6RBtal21qVhIuDQ4LoBV71ypZpRrUV6/
	uLqdhboDes2f5oHVLyxzWZeXnQHG/XRVKVx2+TJTp+Ygobu8YJr1duC+rpV/JtulZj53Xfb8kle
	n+JrH45ajXIkys7VkluUkbOo/GFDuco2qx5Uta5xW3M4ydqZKzLcltbZkmP+juTa0fSqs1ifRmH
	Cm2s/TzH6sJFnglTHI4JLSoZyfyc5zyPswcmrja8NugNnKxLLjaBRb8YRvM/gtsv0UOpSn7jQMq
	pwmYvhk+TDTJXrklCrybcX2rOylANHzsARZ/tzg==
X-Google-Smtp-Source: AGHT+IGHl/MrvnBmwYJlng90W0ae6rxBIE9Nf84TxnL8stOE8Xyl9IXCEHjFwJhjKBi77KUw7CW0SQ==
X-Received: by 2002:a05:6000:1ac7:b0:404:2fe4:3a80 with SMTP id ffacd0b85a97d-418069559cbmr2197982f8f.25.1758977410844;
        Sat, 27 Sep 2025 05:50:10 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bede39sm115338255e9.18.2025.09.27.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:50:10 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
Date: Sat, 27 Sep 2025 12:50:05 +0000
Message-Id: <20250927125006.824293-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_055013_460765_AEDC4951 
X-CRM114-Status: UNSURE (   9.42  )
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

The Oranth Tanix TX9 Pro is an Android STB using the Amlogic S912 chip

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 2a096e060ed3..08d9963fe925 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -134,6 +134,7 @@ properties:
               - libretech,aml-s912-pc
               - minix,neo-u9h
               - nexbox,a1
+              - oranth,tx9-pro
               - tronsmart,vega-s96
               - ugoos,am3
               - videostrong,gxm-kiii-pro
-- 
2.34.1


