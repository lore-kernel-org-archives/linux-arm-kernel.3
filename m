Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C28C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=; b=N3Te3R+petLVx+M9TWMigYN6cL
	7EWrbz56lNdd3gYxZIfXu5T0bcQM5z7IgekaT78jrQxRfxtYsKZ5lKXM1645mcR/KkD8+8pvuhP42
	a+3UqndMokOlfFdnBBgfYQCru6vKXHUzIq7FEkcuvXyNCFpxl7DBPlNvJpDRcBBVwvGmou0oOm1mT
	crOWWC+vDhCpdDrXmqMwQsBgygZkyyWSHsJ+Wz1m7q78T3Q0Z4XVj+YoberhYGxQHjqnzfOgmzbXR
	6w54OiPjcrgBSM00xH8HD+mS3ZJr3B4HHWzPOpOyYnyHkglM9uXz3s/LUbfM8qEAlXFLc9Y0DReBx
	VejY+1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOJ9-00000005TFK-2JvX;
	Thu, 02 Jul 2026 20:46:51 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOJ6-00000005TD7-1rwl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:46:50 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2c9e8da469fso8606585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025207; x=1783630007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=PJoeu6iCS5fH2v5loEYbOsPEQpRRZkBX0CsZESHLa4qr53L+3u4TotGvtSr+W1KqpU
         fNto2CzS6G1i0CPIdIoxyX36fomFY3E1xRJ87qEsbHwE89i7kl2UWRwhd6Z9PLr8/A60
         PooQPyS3B7965v8yz3bMzbnmgsDFxpiOOIJBpEo5W5j97jJi1GUQ2ZNfmSLvHIRebuGo
         e76HwcEKNV3JIVJSWpUWQnRy5plI89hDguJAUQrweAwNzrRQ+TQuFRIMCQu0x/K2qAGv
         rVnRhMaVxE5IdxxknZBP7dhiDSxY9LeJwr1bsH1qAEiCAHmOsEEsbgHp/XS+qqd17qEl
         ahwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025207; x=1783630007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=F6lGKK4rlI7oK3nmp+kp37Eh2QzwPCPNeybcb/l6lX13cC4cB92bah1SOhT64+oe9T
         n8v7HSMNqF6OcFX13LpjeDGhtSYR3gJHpfH+qA9RgBrVK/QwKtxmkUT0XOeaT3BhfBGH
         mLI94aGF6y8aSFG+LZ+gF4MagH2h21k83HEHdQHFd+tG2qGAV2gV25B91V2UJcR/fPqV
         YqBIT0yC+SKP33aThYAcugWQjV6JzHwCdzsFgiupG+RAkQkm6oCvG0MawLYIPebOM+rZ
         vaC5ecdsrPejNA6xU8o58pHGFpKEAo4NQFgIDS/sZ0dsQw8/KiPB0vD/mtxJ1UjyfA4f
         HIaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpen67FTXTp6RRq33NM18wILfL/U/OC3S3onjTE+7CfcVC8ID00EiI6zUn+tWtd9YBOOmj+q5N/SBiGKBqqK0nY@lists.infradead.org
X-Gm-Message-State: AOJu0YzwszluiKwQ7EoKSmXukdWIisoRaFkepYt8p9lLa9xphMkcTRio
	6ZzOOFg2rHdRsBR3J8Cr03l5U7rUmv+0SEudou4YwcjN3Li6KV6l+LAP
X-Gm-Gg: AfdE7clEJQYVLUmAJrt5WamaKhYWsX2vp9OCnIjLbWjmHYvCa91eugPYXNoqYtgpzIS
	BS7bThXPukt0mZ+ezLmOysE02t/qSh9TvPSXASJfhwWKU0JrwrXXRgzz6lktYUhS96zJgenh67a
	jtFY/+Bb3o4idYqHy149aTLBHZzdr9Uh0twFHVYBe1F8puYiev4+cVVoOciiNHMB8oDCMBvtOH8
	LNcpBi5Y8qzJV+oD4vVnWH5+/ZglaJ9nas8loLQcBNjCCfgXeUZ/ekGZ6avo6apwubJ35AXQKKK
	nsEVFnLGKdt5MimYHpEygyZ3zHBCgg1ADrvCtZLUMd8jri8b56jVnl2AY3hIBAaaoQ2NK5pcc0Q
	ZkSm0CWx1IPY/ei7t8rQ6cESo7njSApb6B8qnNql2zGRLbnzYscnFwHdBXx9J1C+FdwzoqIef8j
	WAUKvEjAsjG5ItR3VtUNOHfA==
X-Received: by 2002:a17:903:1245:b0:2ca:281:27f9 with SMTP id d9443c01a7336-2ca911d8c3fmr66893435ad.27.1783025207272;
        Thu, 02 Jul 2026 13:46:47 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9004c1sm18654065ad.21.2026.07.02.13.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:46:46 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Fri,  3 Jul 2026 04:46:27 +0800
Message-ID: <20260702204628.2407308-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702204628.2407308-2-coiaprant@gmail.com>
References: <20260702204628.2407308-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_134648_530276_D8EBD02D 
X-CRM114-Status: UNSURE (   9.13  )
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

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3


