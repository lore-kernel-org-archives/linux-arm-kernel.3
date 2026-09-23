Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90EBC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=; b=RNKDd+BajLotBH1ObfbpJtbvEL
	nhN57m71WMfwyijfQO6bsL4TdVeuGB5Wbe7UcndvjoYn23GCd4AP6zAwP415VaWzyvu1RKeacxer2
	CWdzNgChXwPkqOB3Y4nrcflY/29M6hFYROwpnXJDkBd5S3MHUZtJAvGYA9CDOpeWxkL9itXL9iIJT
	8wK2IJyYiDKF9AtgZSv8DpMv4+b+VC8RR9ssTMdc+2jUBJVM4wxD/y9ZTEXuAY60o/DyRskTASLkg
	rsagzMWEl7bo0oIXwXGZ/ahr0Z5OilQzAbRg/5ko/hJ0+g+EcI5QlAVO5s8OMwmBR7BO8hpBFFIqX
	4R7kkSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TVI-00000009S5o-3afp;
	Wed, 23 Sep 2026 20:23:44 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUl-00000009RpB-2DrL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:23:12 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f8694aeso91985566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194990; x=1790799790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=apg0oxWUKrj+N9SBqUfPXDZUX4zWHcoaPS3DQX1MeBa71btQEHnzQ+7D1dhO/WECuX
         osM9heOCPFo5Nlc7h0MHB6OHxSWgkfeHUsnL/hfrmM3SF8/7gcIyGnwQhSXTM+YJaHXH
         fE2yGJ/GX9bhyeR2BhTeRGIPj5MQv5YYY8bYIG86uKB0OYA+wuJ0hoyB15jDNIYFhopa
         u1HD8nwv+oN/Y+y1dGX3j5UmFwKhXmUE1T8wCO0UHgyHyhnL6Re/7jIQt41Jt5i9Naln
         +6KxutQ0G4dr5HbYmVMLglfOpxfydCAeDVUxmSKG09+ZKAURzKKGP7hI65G0q8Qz64+G
         NVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194990; x=1790799790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=FejC96YeTRxlXIR9l+S2YiW8bcPWwTGgy+V1PA9ybp5veJ0aKEMPW+NFo0u6ePgBAt
         eRB8Je6DeGjVsvpWQtROyCE1aQbq8xjiJNSlQJpuS8hUHo3Pb4MFkRG+APkZX64+6TOA
         RYawyzM5QKXuZJSvlwIYQaP8eNCbns3Y8nsxaPqZtQfiTHGoE70SRcFA+XKh3xt+bxwy
         yx1uQktZzwK8euBJs3jmS5eEBICUvZM3jeGY/4jJNZFngzu3WHW68q8p77Xbh9bWPYSi
         gwKKrt8CkQQxqJvI/0X0aiuA5a6rablTHsKQY2McmQEdIUd5j/9z9z/FAY3KB3h6ysBz
         RhJg==
X-Forwarded-Encrypted: i=1; AKwUvBwyA9chBOakYTNMx+IZ0WOgbE3IksrBmj6areeVnpz2ibwJYx5NTnaFnQa4QtR7kEmxx2UJKJeKfvhwBK9I6WIh@lists.infradead.org
X-Gm-Message-State: AFuF++nBL5FyS/6jz5ZPRCwTLv8Y29tvs7Bt/Qe4Mi2b2L66db3vJihf
	W0TavnOqy1qXiKsd9ND42znu64Ce72DUp2R2CSXIVB9+oq6VMecDCvES
X-Gm-Gg: AYBFou15ZEEUHs69oGJX0DtpqdJGAt+bGZKSpEF+9NHDkBTjigWUaebGl+KFqvIwUHV
	0xe3cAFYeOQkpQ149yBriTTEoPxAZ2S5LAh7dnZzMSuS0gwkiK4z0+fMXsrK79JARHyOK87w5Fc
	ORUWp4AbHa6UNeOSz9zDLYeI4BnJpWqmpG8661LznFOF9PJNAGFRa70l85xbaDbDgcC8P5/owmW
	VMAnvpsRKIb2jV8jIAH1HYhgMdWZHLPy8jVWr7eGHxraXAmhlTND9AFL9NWEe49orJI+qxsueBp
	V0neFmCbNbb+x1XM6QtLAYK87MIAJKEuqYjWE2k31jd/jTkVgfG2AJmmGwDFf+R+4JXMjRbbD8s
	5e1XCEkkPkRsGb4JQbiNvSJZnjdGwII0bCQ0wUAmi1ljGzrH5JPfTsxzj4ligi82l7qzEjFUYJM
	Lytz6oIVBRBYBHVjgNNgAtoqfFaxbl26R/Wy82lY7YS5CjHqwqlJoVUPlPn3dTEuIQMFCfUIIMs
	kw4+QW2iJ22JfIPUUHeaMLhFdn3Z0V1
X-Received: by 2002:a17:907:6c17:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2ac21f98famr25358866b.5.1790194989894;
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:58 +0100
Message-ID: <20260923201701.43391-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132311_591246_F66DBB13 
X-CRM114-Status: GOOD (  10.12  )
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

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0


