Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A079AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46goNwVrX8FmvxLuzJxblWu//jJa0Films7JPsZ0ZeY=; b=4laiZqGiQi4t5UnFZp4exQ7WmE
	nM+hQVFjxB73lYv8VU9tpMgx+rsh32mIeQm1dxwexeQSnhr+6Q7u8k3Tqo9jvcI1dHaMnFMiVr4Bs
	p2wlL/K7LSpkQd/BwmcAABUdL5mTh2/CNUqTZ6ZovrQ9YgOBPwY2boyB4l07YqhWQkAI8TZN422hx
	YsJ9yGNMWR1prSx3st6m/WvipapGb/1kSpiGzt+DnQiviB7MOiiikG4tquwkAhJBla8AEnSjY0fcF
	+8ECzza2KRXeCkxUbfMIAIzG6IE0JcjmMtNwfdwYH6ay3Ve77M9r9JnnhiOZp1KAzXlyYJwy+syBh
	xtGSTACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLqF-0000000Coco-0Y8l;
	Tue, 06 May 2025 17:12:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOX-0000000C8B2-39lc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so25051015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538296; x=1747143096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46goNwVrX8FmvxLuzJxblWu//jJa0Films7JPsZ0ZeY=;
        b=B7PlDcvJiivc3l/LwiQHhPlCQa1VgdmNEYCSJ/mtTDWJQFPhBXK3iZggCScp8JbsD+
         EQ+pPpCX7+5/HTat62yAGHVJxh6RK3merRqDazBBfF73FFqY/KxJ1xwcxnKj0IxEjTzv
         c5AMIBe41xkLUBvS6CVa2nh/TLPQCdLgardP849mIOn/DTBufMrf7PMvccH88FXzKTgJ
         v7i0i8Owcs1Tr72jaoAd1kWxlsD32cMv1cNjcfjd7uwpgJOMIWop9kHqryzB86BvA5nX
         sb7xRSBLReYKU1hfxb88s6DOAYsLynCDmHyA5TjtsNv+t4fwt61pbb7+YRlGU1y68pZI
         mURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538296; x=1747143096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46goNwVrX8FmvxLuzJxblWu//jJa0Films7JPsZ0ZeY=;
        b=qjU6S3xXJ5LSA8OuCJgn6YUVFPYo7UVhiBa2Hhf6iDC/bEHaSJ6gmrCapvl+uAx3DG
         O9D0djufITRFlGi42lCD/QsAYg9zpu0OJfRahnLYkLaq2tmb1Zjby7aIFoaqFUypDS1w
         0o0v1G1ENmQT2+uXU6kr9XF+7hIsIfZ48zRrAlboUOdnsE5lqA3HUaGDFOUkwgz87Hsm
         vFBR0gSz11qlLzDZF/IDZm2y/G23jBFGHMTJFTf9ahV5yGoktUeeAVbu/b7uWSOnqHGB
         eVapCXI3m/i9g080+x+pzWEDM+wt2PpQWGBr7PR/AkkabRIqjP7tQCGXNegdS5zJc+kY
         PUNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZIvPlKEkAe2XDfHdoUxdF/1Cb6LzEuNtViZtY6ks6F8aGwiCCMsrKNr1A38S4V5KxdCtuOTDoj+L0vIlyqCIG@lists.infradead.org
X-Gm-Message-State: AOJu0YyA2dqPoW+S4ZsEuYRm8DDANNcM7O/IhRCiQpmC9JOXJrYH8U7+
	o82XuTWnLmtzjfKC3nxPZK7vgnlyjv1uWcvIfnai9QtWRty566cH
X-Gm-Gg: ASbGncv0BtfDSvvWih0BttBXMqpjbxDjQRoVihT6mw73nXfbRPUoptx5ZV+2UA2PzGq
	FVsbVwuDOH9wO7V5WQd73OA4saypLAj+nDG5jPbGWuMCl1pTqpH+w3R69Y5tOJ4/xoTMv3/bQJa
	IGpmruN2CQ0cy3te7r5cFK8of9BL46bGaau3uzE2UsrIgWjgQ2m7SP/BLCmk4Dp001sU9SlWScQ
	9QEKH1bPRPmOlpW8/4jBmu5NuEnZS66kyH3psBvYiv2pRzw4htATjfmg976aWUR656ZY9S458Sw
	bzNsKW2jTz8T+GpArLzzvO8d4grl3TNKokaHhwJ7YvaeQ4I2oxUbIU7c/YTjm6EWzZWqL64+Z14
	AxFpl+oZ9kLDJbbsDK8tHspBepx+KWri0
X-Google-Smtp-Source: AGHT+IGYRu33z/WiPgEFpmCJzulddOzp6iFBhMhv77ohFSKf/h+meHXuCMidf38XNU7QsUhp0EFjVA==
X-Received: by 2002:a05:600c:83ca:b0:43c:eea9:f438 with SMTP id 5b1f17b1804b1-441d0fd1f83mr33173775e9.15.1746538295990;
        Tue, 06 May 2025 06:31:35 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b28dadsm220944695e9.40.2025.05.06.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/11] dt-bindings: misc: Document Tegra264 APBMISC compatible
Date: Tue,  6 May 2025 15:31:12 +0200
Message-ID: <20250506133118.1011777-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063137_787558_8F41FB98 
X-CRM114-Status: UNSURE (   9.25  )
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
index cacb845868f4..87fcce7cbb40 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
@@ -20,6 +20,7 @@ properties:
       - nvidia,tegra186-misc
       - nvidia,tegra194-misc
       - nvidia,tegra234-misc
+      - nvidia,tegra264-misc
 
   reg:
     items:
-- 
2.49.0


