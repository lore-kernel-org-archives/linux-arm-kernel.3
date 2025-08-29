Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907A5CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3Np6RSUufpFZ+G05WkQGnHAm+bGRWCensQMqZVsmAo=; b=ovaHF3aihHaaRpitIkqnBqO/K5
	wxtSHCkRkbKMxhOmZcKp9osaostM8mDyjMapXbUHZgABXIBERMPg5s5pGeQ9fouvsOcZc5hAt31Y8
	pqFkUaSHJOiwpqHf4+JGTZCGq6mNZ2KGwAp3wlzMk2OiqtQzy66RIxlDv8q4VHjKv+sQLoXytI8Ge
	csTtE10TknboB0nLRg9wMt2PWIrAdE44NTtvopqLUIr8g1WfBqYOXAwHZcD8PWys1ZHIj5gGdbyV7
	D1iJ3oaByCLLG8idkviA1XlznYCDgJltACfoIrCpP2y2X8tbTc8CqLQd9Z1AOdP2+q6Tkajdzx94F
	yhXB5Hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvwo-00000005Euf-1r9K;
	Fri, 29 Aug 2025 10:03:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urumc-000000051YF-02zu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:48:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-24457f581aeso15798155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457309; x=1757062109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3Np6RSUufpFZ+G05WkQGnHAm+bGRWCensQMqZVsmAo=;
        b=c3JYWOXtEPEaReztsGKy1sVwB85xnareJfnj9Ffw3pRk1yfK6ehH6ef4FnyV7fRJJz
         tkkXGnpTUu4YMvz6gunli0SbJ86iOGvwkNbPn70V/D+AgDt9Hes1Z+kjkfSfHAWBY3E1
         iq8vs46pdogF74wC4QWmvqoicKyPRRK6J0jzmruEuLF4x7MscK6JZxKnViuV4DVQcLj1
         HiRH2jS+qhtit1rMPUxiNa61HKQpLzv6bC5jmdNjSj0I3H42HOznzSCPYHgVJNuaoig7
         qZ/svUxdk0trTMUxv6ADqHRSvv62eosmoiCGszeOu9D1Tfnru5a3Wm8j3jusODm51r50
         ppHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457309; x=1757062109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3Np6RSUufpFZ+G05WkQGnHAm+bGRWCensQMqZVsmAo=;
        b=gQkehzS2D+L0NUpZsu4O+WsXaKfSIXSXrr+ZntqoaPkluv691+I4KrziLF2i0w3vTE
         qNkF29EEjopgaJoS0EvcUt6YIJUzo7GmWv21g91/4waVF3/57ncjJAUURg3qyKotw5+O
         i+3iH17okjeMdTmyxrGMiWeBfLKIzu6bt+PbFI4XoI/54CC9s4ODic0lscWaF4LKh5CF
         mR2i1QoQ9fAvsz3iz9jMn6YT206QeP30pEV1IpWOgR8ggLEZjDlf3ErPqneJSUJRxA3t
         ZcdljBcqy3dTWqhGCh+5dtHD6jnJw5QcrXKKKqKrdYXG0YW6shyI23+cNFlz3NLGRSv5
         yr7A==
X-Forwarded-Encrypted: i=1; AJvYcCWgw20sraqawrsC+wgMVdfxs7WGwfEJV/ygfDdLBnEaH4dJCnXzhELxGIUPa2RwYUQ4V4IKrk9hgUNXQtxauJYN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9WAA8AZlUA4/XgGgiULVGy9cOcG/V1TiTkpy50c00Fm/KAGhr
	I96OZi6vphO1UBit5K6Y2PeMX+a40BMYSvM9VUkKdUPhqV48KkgjvHh9
X-Gm-Gg: ASbGncuMosH2s0LTHgaIwrsZ/q8sCS/ZxLYdE4EV3oVxPTwCF1p/pQLESgIp/rFMpRH
	xlhDtLz+xeg7cj/iVKJb+NJK+Jp8ylVuvMWDhIrJcTpcFcxxHBSDAx+g6WkGbTkQ2dxnXxRO2Kh
	mOtQQSOuJShpcVB10B0jMlxSJPvMPYuyRtqDI4Qc+/HQkHreFajAHSijZZjUOlhewtfgCWcVObL
	AlXb/p3emw2lyCDoYHCCUc0UW+cVgsn+AZ0qsV0fQjtS2nrmE/nxe6ZRX29RFNypW+Ze+/wuHSe
	Ay1xUYoNpmNbQreMsxk11BXpj1CbHnxAkdbDCyG83nt3R/1HCUFiW+s7O9NQuaA8o2iS4rhWjGx
	4/BITmeeC/mCpg2fAdYuFcXC07a8z4tRkvYVHteKuYebXo/tQ
X-Google-Smtp-Source: AGHT+IGr6dfrRRQuVok1ow5zCKd2/gxu4vBTmvpxzkkEulS7SF4Yl3RRi4c9dTaQzlJzsA5mQVlzxQ==
X-Received: by 2002:a17:903:1207:b0:240:5549:708e with SMTP id d9443c01a7336-2462ef942bdmr327011365ad.46.1756457309160;
        Fri, 29 Aug 2025 01:48:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 29 Aug 2025 16:47:00 +0800
Subject: [PATCH v3 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-t8015-spmi-v3-1-58b15ee2c825@gmail.com>
References: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
In-Reply-To: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=WTcRU3ek4vi18/6+bn2AZBisc3HsqCJ8Oa5khMxDoNs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlU+ZIQ+k3EFIaELJ3w1MmrvGHBvq3g2+23D
 s6WkgTaLJeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpVAAKCRABygi3psUI
 JDEDD/4xS06N6hYF6BFqyUS932VY299g48zcagOnmAqRFAmzva9MtJ5fPzMXgIPXeGGDOV9GYWC
 vkXl3U2H+2crxZanliHx+XuTGcYuDU8Rocz9wwIByWWEQym+PiiZk9umQyzjwfs77oM/5xkqARC
 RTMxzhcB7m9xyRxXhGIgavgPVdBsX2lkL8uJwk1smD494nva3kpNj73zoirxlmAc/0qIS+KDhmn
 z11D2eokz1GHghS5I3o0x2nC4PrTEWsH92uFlWYLC6Dk4RHENjA1f0b1W37Qt4S9x6c/UYv5hCH
 GZRLSpaHsUzdy588M3wDxqIIP3fHqPiAsbtH+UfxGez9tc00zDpKB4EBZspKdPmYTunH8D2RKIm
 poBnhwm7OV0zI8HIMe0+u8MH4RsUUp5j20qG0X4lFnsda9Y4gRNtO2DrYjtZjW1+SaMGpp4BFfZ
 6ZbqPhKzPaAxk0BBNpECAuJglxSJRcEV9Ryv684at4ES0ZDxuRCa182UIknUXoRnYF68AslwSKT
 JnALU17lOi94vDHewcKwOgTd0LNw4dNE2biEZVbopcUrvh2v9mmRXkCd7De1tlE0IHmacgUDTux
 ARQtdTq8bS89FK/MkUsuH4dvt5tLS3DvYqJIQT2l9tEDu70wZUFZSMwdz//TTbI8XHq7Vs0/zID
 a0eTKWm/hVZsgYw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014830_053873_2223ADFB 
X-CRM114-Status: GOOD (  11.31  )
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

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver for t8103's spmi so add their compatibles.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index dbf09ad0ecdecab82074344aa6a840a820bc448a..ba0ec92a55d4fe14671ea71b5c6d530d1ac0b11a 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,7 +18,10 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-spmi
+          - enum:
+              - apple,t6020-spmi
+              - apple,t8012-spmi
+              - apple,t8015-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -27,7 +30,6 @@ properties:
               - apple,t6000-spmi
               - apple,t8112-spmi
           - const: apple,spmi
-
   reg:
     maxItems: 1
 

-- 
2.51.0


