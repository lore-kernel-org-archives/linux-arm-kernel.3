Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE033CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc4VvtndTdQUwu9NAMxU40diYp84hx+fKTxM5CnEC0U=; b=I9jeI5nOuYNo16CDBI9it+/3xP
	fU4deCkY2CxA8oUiiZdwWxRck8E83pAi0yxcEsou30nmeMrTh0mqz1ipgG4Z00PrUQlvtI8CRhOKJ
	IlEkGINXvOe63ZF5LXpPDE+dPjzE2Ua8VXSxTCy7XW7hdKdFFjyH6MC6miuiuVd4MrEDGdXFL7buW
	X3Hw0LZnMTAg/IEE/aTE+/m5FPs8U2wHq6sBOPEgKYvHAYK7qWulF2bxrW7sDpCr0aebL+bRiVTUq
	XVRFpTXwRnbqeiULsMtS6MdpDUG5pdc0CgL6dXb4g06FcrfenWw+2fHDQ+Cdcko4oN1Zit8dqHoDT
	mX7OiCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIlJ-00000007jil-2ZzO;
	Sat, 30 Aug 2025 10:24:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIfs-00000007jHS-1F4p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:19:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ce208c7505so414615f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549147; x=1757153947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lc4VvtndTdQUwu9NAMxU40diYp84hx+fKTxM5CnEC0U=;
        b=V0qyZ+fYoNqclikdwFKv6RWJvvsyemOvy5Wp8f+L9ro0cvy41/pYKvQxYT8mi8OCPK
         kfLRUMtVR6KXen1AN1scEeYjI5Og841VtJUaeir8r3llWOQdpVwvKVfFsFFHk3ZfR9oH
         X/2t2JF7SPUldEY6T1HWsRBzR1sgbPX2oiyLs1D8aowbycJ9WIlw7p9UgqHY8xDk57ch
         7tvx0S5cOAin13Xy2SXjGMjkIX1PXY+06rb20ZxCwKI6xuPdLOSRzY9NJr1IFbnP6IFR
         02HtwAG7NE5DB5bPFmcauoPmbWePQTIeGxA0e4k2E9Xg1C2QvSqnwoRnAODGfo9m9Hke
         f1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549147; x=1757153947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc4VvtndTdQUwu9NAMxU40diYp84hx+fKTxM5CnEC0U=;
        b=IgKsyvQl0bCVEzv8OQE+VRkPctjYIqpRwWRv2OkESEtb9EVUYLnBI/+PBBM5VX6b/a
         m2tzYrrpwMbogLvCUEPWF2Aqp7z4F0Q61/FcB/DAP8LTn8ZOCj1/EjJ2mF6Kn2GPE/0I
         EET2GAVBeHSpG7yiGVtpBXwzxS8KNwbePm7ki8tSS/Qdxi4w377CNWa1vouJWMqoaZcK
         c6CGIvXLROICrbqk9wGNkVeQvxDEBCz/PFPAed+Nqnap4cu4rDogGFNKrJr+a+gOw4/8
         6ONnxJGlumXiHozcLYXq2rMoM1PWyWpdrGVMc/withNTORAVENgzNKkulI7BNQCC0wrt
         rLxw==
X-Forwarded-Encrypted: i=1; AJvYcCXuianXv2X+evEDBJ8RSfZ+MqKUtmqUkwX33xmqs4pWdr05OeNuv3UV6xpYf7yARLCqVJ/M8M+KnGGmIypxx83G@lists.infradead.org
X-Gm-Message-State: AOJu0YyGF8KLI3MlpRzXrx5i5PPkLhkhfV/bUH2cxp/wBak6/GTa9LIe
	9LfWK8HRv6cajBNxGOFxln1kzxG1f+mWAmswiJW4t4+Esw3xKa1mhW4hATs3soX0opg=
X-Gm-Gg: ASbGnct2/Av9D3oIfCDW4txdIeHkkGX7zjy3ZtbHp19FdlDbCx7CKGKAmnJx+tIqFAT
	cFBsM9qLTLzZ+ryYl7Adh76XiyEOvGdBHfIlu96g2dWcZk37hwgCSKVBF4KRq88i4F7wBg2jivt
	2/BJd72gOGDUXZc87NPUCYCW8ewuSyWyIkgED2P7NQ6cKdfpz+DgQAdmUGZH1TSa4QiJ04ETUbS
	gYJUKcf20ewOyIM4q6JOqdtjboXCar+UA21/4Q5sUxvjrsf7c6sCvzNq05s7DpYXE7a4PnVl2k/
	i74loAXtecmIA0027fXtv1ToymblEE0EW0F2gpD8rCVc/JC9aB61C+9RjkqwE4JYEmqwXzcDW3n
	tufZNrvP56dQKzPyARu1HFvfbGEbVsPfY9JlAnkM=
X-Google-Smtp-Source: AGHT+IElyjWIDdnRLs09FR+6PzPMYJ0mBBOSNWeVs5b3fm069jnqc4HgASV/Qa+IsKi3cpsKc2Birw==
X-Received: by 2002:a5d:5d0d:0:b0:3c9:1b91:71e5 with SMTP id ffacd0b85a97d-3d06606301emr1956916f8f.7.1756549146595;
        Sat, 30 Aug 2025 03:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:18:57 +0200
Subject: [PATCH 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=phCIU7qXQwzL9ywXevhpCuLOX4bC84K3Yg163SS2Jhc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostATWdrpdUjx7iDa4Cq4mMsNQm8U0vKHMo27y
 uln7YNtvyaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQEwAKCRDBN2bmhouD
 1/u9D/91m8aRXiwMrNQqYcDCDbp+fzpNTIX1p0ufDEiWmRJdp4r9vOLcLqClJ0ZrIN0QPFKfV8A
 ZwN7RWtY9x658v8E8l1eosqy3gwhoba2WgKC0cZpVltv8wEqCPATPk6Z4wNAl5ALIIXDSM3blgW
 FFoLip9pEF7F94wca7cKsdIdLKtkOiklZ3c7c8EmI11uiGgV/rm3JtbTaUdtZubMCcNoj7/KF3c
 R9fP6FnjwFbXwUC+DmDegoOBKKmdMvioZVjsFX1RDGhVwULF5J0A+XtzqYVFJFv5LsQPrUTNyqK
 5eIyaXy20Qmm50YIauobjAYV4JSwL+4BMyQt2L/TIx8D7cy8ZtFybxjbJ8/vp+pbhU4vbWG99K0
 xmn6JzcqHSt9uAeL+majTJPB7v94/DLdXRpbzFMQ6TPvTHHJRrjB2A8jmiqNXGvstRiYPNIBSP2
 DqXlm2K7X8uaZ/Xr7F6cWeCRy3nypZ4G/xZFD8klLD36PDbJJJkhoksqaAPcV1OfZJIhrkrj5QW
 omWsoukJVFDZw1nBJeZOnIb1o+fxpzHsyk58xPOTQBxNRKl1XhioEzQLW6m6BAdrTVkxNvVOpfV
 lRXtKh/Mlqcm0Hes1AsZ92NTSStjpD/H6651y+S7P0oyqZgrrAqfobIQXEidlDzAqsYhK996DtQ
 /ylTuDAV9xIAy5g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_031908_339945_04A39E93 
X-CRM114-Status: GOOD (  10.59  )
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

Properties should be always constrained in top-level part of the
bindings, so move the samsung,cluster-index constrain from if: block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 53fc64f5b56d33f910395d32b35e0905b8b9aa53..445c5271879f002f2b05645a0e748dd9be5aaf72 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -49,6 +49,7 @@ properties:
 
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
     description:
       Index of CPU cluster on which watchdog is running (in case of Exynos850,
       Exynos990 or Google gs101).
@@ -104,8 +105,6 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
-        samsung,cluster-index:
-          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.48.1


