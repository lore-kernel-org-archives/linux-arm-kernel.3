Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C12C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjFwt71XLbSFir8nIV6cLqcB1nciUy6zuBB6Ol7LIHg=; b=uI14aYTj5YO7p1VE1+lBubAInl
	SHGvxHKDlw9mLyfs3rplOtqx5NU0GfMkE6PfKrK0f0wyAg8bf3Z9fjtPn6jBRW2pTdt8keVJxaoHu
	FSCYs/i7DuCITLl8PYOmJH3IXFPjPlDxtJx+ESYMxnrzIyBY8SFh2c5HFuc7XLGNGJeHI/FaFQaZj
	SmwXxOxl34yqijayi1G2bmr8o/Bpcr4rPjfCrkJZlRr1KrlB6PM0fq4tEBQBYoA2240S4mJjiuZYf
	23BnYl0+msPll2rWcUhNv5mhGWeXCJslacOX63IP2kuSu2vDQ070qsfcSTBNkS17VmtBG9SA+TEs1
	PzZ+h6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgMS-0000000FtlT-05he;
	Wed, 07 May 2025 15:07:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfuS-0000000FogY-1WY2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso33186915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628687; x=1747233487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjFwt71XLbSFir8nIV6cLqcB1nciUy6zuBB6Ol7LIHg=;
        b=Z1TQyohQ4dM/eGd3Tu/Igz8HLv5BQu84DFcpA6T+xMP1wb0dVAmzieRITQxmSkrPJb
         3pK+NDSjPTpxQyC226n2urV0+U27fuCt6JKddbq9bmBSajrArMDS6NaATx2NypnUrUju
         D4V6cIf4MattgN61e6MYIHPgulV5yDCxoMg382alsD+g7PFW1eNslIxFZWY6Gk5PAguP
         1Ekf34+K9CkcqMKU5nO7pSSsg6vW3P6+LK9ndOECRHUYhdOT5POR4Yf1E0zxKeVbUtFx
         fmxXPPKohTfwxZzl9gZvc/9CmqpgT4rCYoGJ7W9LCcvFpFAJTB6S/dggeNqVwyX+4Nbq
         UeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628687; x=1747233487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjFwt71XLbSFir8nIV6cLqcB1nciUy6zuBB6Ol7LIHg=;
        b=O64CJEkZg5DrmeYEdf0txD3M2Mdseg+q/Y27la5Dhw4WPCN0L1F/L8Tsm4dLgcpHN2
         utTrlXjVcLoGNeVzi/uZfCpFllJCmoOofPq73N2v71y00SsDfgfDUYZEsjWnVkA8hTfw
         8EhO9NuCCIFS0iJHne5lqQPjM1CJCsBpny8wVjBjSk+gxrEHWn2P4nuoXZLzeH/OxeRg
         KxjeGUvVfBMzbMsrHXNtfhRnFoJh5yVeFAPemrZy9MGlk0J+rrE98firGWCn3Me+2y8b
         GBH61ELiov4WKP9rKIMkm6H4aquxgYj5Wj1o4BjPPrDdZjNnPYibuc8hzQ7SH4bsJk5L
         4sCA==
X-Forwarded-Encrypted: i=1; AJvYcCUCS6ps8O1HT9CHV3YGK6K5/Ea77gCzDnaDNNixAFNUsCjr4eLFFJaCjHptvFtX6zQrj8Yd5yhK2u1O9TSBqV6o@lists.infradead.org
X-Gm-Message-State: AOJu0YzmKtNk/T/fkNypzcxhSAhD8fbhw+OnKOsXA4eeKjrgzsqXq6Fa
	J67tXtq6KprHR9LQMn4NthCCx/pj6m1wksk0qql32gRQpG4AfUbJ
X-Gm-Gg: ASbGncv/YFfNfhGFTo4NcSrRY1Q5Jqf6iPVXoJST5NwPzI2tV/eOI4DkTo0Agbu7kBd
	CFFs0goeaBUSgLYigjSwYg0R24SUddq2QxQ7dfx0Dwe5NwkV+tQ7ubajtsLPKM5p+TYPotMzh4I
	eIutJAvEHXx9vNkgYmplDadxiuwf30riD2LmU0msBgRUgWd3KjKp47XbANZ4xfrKrR9mMrWiPxQ
	7J/K3dtCTBE2VpOXWe4SIh+nQkNEDNBnBP7qPAblU5lrk2Ti8081xvG6VrGweI5HX7yvurPKWRe
	lFc1ozbwy2Hs1ZxDpHFzJtThKIqn6/G48hxO45RgCDNMWocHAMkxA3JhFL7uissNgU5iOY1e7vo
	EdRK3SxmjiOz4L0gwDq9MRr9J3Yw5YqLx
X-Google-Smtp-Source: AGHT+IFSNMzG9TQOyYx7zHevoRWOErXed6Aebl+K/3wan41dPjMy8p8lGW1mWA10mofq2/gvKTe7qA==
X-Received: by 2002:a05:600c:83c6:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-441d44c806bmr30189935e9.19.1746628686430;
        Wed, 07 May 2025 07:38:06 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd3285f9sm3215215e9.8.2025.05.07.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/8] dt-bindings: dma: Add Tegra264 compatible string
Date: Wed,  7 May 2025 16:37:55 +0200
Message-ID: <20250507143802.1230919-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073808_403589_F3210151 
X-CRM114-Status: UNSURE (   9.96  )
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

From: Thierry Reding <treding@nvidia.com>

Document the compatible string used for the GPCDMA controller on
Tegra264.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
index a790e5687844..0dabe9bbb219 100644
--- a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml
@@ -24,6 +24,7 @@ properties:
       - const: nvidia,tegra186-gpcdma
       - items:
           - enum:
+              - nvidia,tegra264-gpcdma
               - nvidia,tegra234-gpcdma
               - nvidia,tegra194-gpcdma
           - const: nvidia,tegra186-gpcdma
-- 
2.49.0


