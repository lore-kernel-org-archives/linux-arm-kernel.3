Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2DDC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=; b=MJ86StK8SSXEIxxQwW90NhufQd
	EgAn6gIoV3n0TUaR0LzJUrw2avvERB9b/n/IBhlGvguCDTyULSiSzrGXUn0IZNUTpXK09FwLt94Ai
	XFMx0YBAfJ6VusPKWwoxQywhF2ZTgU29YfLK//ia4rtZjrdSUV6EzNoDUPviutgcf5pJKjc6S/5wv
	DkYDeJr6//B+YCvLW+U0A3nRyKNExuaE1vOatY7jMMeTHER9lFFO7DRPjE/tCzhjnZT40/kgOUpYg
	dLJjiE1xsuzeGhUsrH3s6UPbGyu+JDm/9r0DANPRGCPFY7di17WQpYl59z/gmgS6WUTw6R6Y26UW5
	oXVKNdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpwZ-00000000w98-3r7C;
	Fri, 17 Jan 2025 17:15:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpr5-00000000uWv-34NF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 17:10:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso406775066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 09:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133798; x=1737738598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=KSZ5M1+WzFkgxS+TY573iO50Pl06Q5uGctXewl9xFIF8bOJdnc5em5JWt1kHqWdcMz
         OBGg2Z9FXblU7nt13hc8jkhFYuaqwzzernEtt0WrZDb2zOMvweFOKoXeH21nkim/m4vW
         Di/IGKV+SrzazBryRQpl3RdFsM90N4Zr8fyM6vvF96cyd/DuAvFWA4QJ8SpBWW1/c7FK
         8D/Cl2ZHF3NXeM4RVpvu8UoCRtxAOOlnE8jgq6qmgf95OyHimwdpuOEmI+Vrs7rgLuUn
         bmQgh5od0lD4CNebdHGafPQmVpFyCCYa6wRxhSfDvjg4KjOFmArs+dI/wy9/L8YyX0/v
         q4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133798; x=1737738598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=NIQmkAUI58eydc0MDiDPpjuOAvDc2xPuwDL0wTGhwPKVFVZeNLJV1Lo4ji7HTabRKN
         f7dj3W4Wnmu3EDk0Wr2Tos0sO0EegM9pQs2XHg61FManUyyIpEIPH9WaJtJ3KBZEag4r
         SW+FWHZmp7Cv/LRno2Af1AYXK6ov4tNK7N8XSXWPgmaCKIn4mR8vKRh8/M6E5uc9ffAC
         M6qi5a6Ej0vwMrigzN/cT5oJSS2NxP1MzdTex7MecVD84ojqDJmy2FM/zRBK/vtJBos5
         EQm4O0Azm5aML9gvNFguOjIYbJFClFyNYjmD7p1w7SLKN+NNY2fLUgCWR8F3CDUvFsy8
         mDCg==
X-Forwarded-Encrypted: i=1; AJvYcCWCatfe/3ASVaVS7L/08K5K7rKNueuh76Q4o/0+CcaXO8dB8BeFoaNSatOceyph2nAV5KQx8J0v1TzE/djYUUKh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd4j/RiuA3/Bm+55cUWT8i78GHuSNmkipRSKooPJl9h4nALOIj
	ttbXysnGKRPxJe/IFZUnd9B3ByFQm2T7adyW0sp296As9atZmNpc/NRfZS8/PL8=
X-Gm-Gg: ASbGnct+WslXgcXi1YqJD2XvgKSyMzKhNCUfgiq+QcQsp/nZsY2we1mb2hqn27/KXmN
	MOGoJ8fvpv9Li2joP3Jw6OFbE+3H5ldsbYzysGj8rFXxY9lQ/aHAnhbjmN9mjlfdOWqwl6ev2tS
	BZTUBfgEWyfJipIWW30iXvaAhpo8XfkLieSY6EhvE988BIlsNd7pkIMWE3B5vpGzC+28WkXeB6K
	wBUY8Ksv1NMgdxrdfoUtivkPNK0NfmtfjBk6vF48iIvemWXrdgJxgKtihbkgfesYpE2V1c6Eb17
	QgBO3kBnOuykqGpUje3zoTRD27ft0GUE5pJQOHW2
X-Google-Smtp-Source: AGHT+IF0L7i4EpVSgd88RVC/tmSVBf4b8zhHMKBwJVkEIlZvmd5oRM2kNs+UPF0xzIQ5t2bc6BiNnw==
X-Received: by 2002:a17:906:c143:b0:aa6:8cbc:8d15 with SMTP id a640c23a62f3a-ab38b10bacemr299713366b.14.1737133797895;
        Fri, 17 Jan 2025 09:09:57 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 17 Jan 2025 17:09:54 +0000
Subject: [PATCH v4 1/4] dt-bindings: arm: google: add gs101-raven
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-gs101-simplefb-v4-1-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_090959_774058_7C33A6F7 
X-CRM114-Status: UNSURE (   9.81  )
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

Raven is Google's code name for Pixel 6 Pro. Since there are
differences compared to Pixel 6 (Oriole), we need to add a separate
compatible for it.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/arm/google.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index e20b5c9b16bc..99961e5282e5 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -34,10 +34,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: Google Pixel 6 / Oriole
+      - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
               - google,gs101-oriole
+              - google,gs101-raven
           - const: google,gs101
 
   # Bootloader requires empty ect node to be present

-- 
2.48.0.rc2.279.g1de40edade-goog


