Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D249FCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 05:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=; b=DgPlVlweTPVPT2llqt5SUuzopA
	2bm1MeYO0FEhaig9sJArX3aZG2E/lwKbb55KLXUeZYCpJbvjSK2H5U8OUzv35YvwwRamUJaJ09AaV
	5Mslu6dAlECF53YdlVcbdoyn/+Y0Wdq5Q5Ygy9tP9PYmjecr3Jh4OyRg5/Zb7yE3jIbFbsxQucSLb
	NQ2Cf0SItgrxmffSIoP/JQ2fl9VV8onlLXCgmwt6/SSCTj8uDoMTMrl45rHv7avOUn/zNng0FrpSq
	Vi6yNP8iUAEaxrZttL2EfOQKZkTtFr31EA2T4l01mVvxJszUxUcakSU2r60rBxbtdjtizxNIGyQ8m
	acqNvHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1f0n-000000064ZK-21Yi;
	Thu, 25 Sep 2025 05:59:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1f0k-000000064Wa-3Rhv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 05:59:23 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so841522b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 22:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758779962; x=1759384762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=;
        b=S0nkrzOeGwkjXWLgm1HjIj/69SFLBVlUEmGFask5ung3EaZYjx+MHM3h8QfY/U2jRT
         k9Aj8WizjKCevkRHnftT3B5bPv4inpDTsGw0iYGeURrAfTqLtWDOuAQeKCdXVTpyOGhu
         l65dRjWM11G7Y7O6LLtvbd6hy3m+2SckM0ILbXUN9pl3zmkXayQfGVFMmPmLlM2mfcwg
         zkS9X95MFHJdPtsG+x00HfP8FL/kNfKtpNGAvcEL2Ol7Jv1A+wDSN+gYtRwqCi+R+TRf
         F1LV9kI9Ufk8x/9gL2di6rWAmQ0AJdJ9WNgd73RKeuHiU5avMNk/QZmH8AJb8Qrcl5f3
         g2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779962; x=1759384762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/i3lJ5UnNUwnZHcBsmIKwojuviTql3djQ9HFxU9mOWY=;
        b=mg7xS6ejIYxIJN5Y77nToztYH00ghef8tkDNbZgDoNHXNjCxW47l/Fa2I11jx34SAu
         tqlyrMKOY7ABYR11kyurlHVHZ34yhhLTJHv41t1FcfAgn7jCK66DlQrbX9pn4LSx5NkN
         7nQWuJboCL1kdydqoNHIwA90V37b28ZZpIpcAF+b1HMd50VciirCxsoVq6B9ZVz4nMpu
         3NMXnWjTcPgljm5CT06YBsiU3nSvvQCUm5MGc6sSgtuPSnpVTybCw/EkBPzGS/hx2oBq
         nPJoipgi7dXOlNC9idWrYAFQ/Fz6a3riwoBeRMuYOceNFltznLqwZ9UVRAqdFhzswaal
         tasg==
X-Forwarded-Encrypted: i=1; AJvYcCVsTPD0t0G/He4edIupoFnEncA/p71N0YOHgUinl+7IWfc7dUVqZ3hfMWpuB5o3eaFuZyve1Wwp6vi9LGt7mqUm@lists.infradead.org
X-Gm-Message-State: AOJu0YyOxXF4r+/DSIVSWdsrIElGD5VvluhjnDxaAslKZTDYLQnYkYyw
	YEku6hXiRP1j7TXNNFK5dcVIb8AtY2eCYtkUqtoeacSf4bq1bMPlsea6
X-Gm-Gg: ASbGnct19UaX9oD/gOwnQZq2/vhEUIvUIzOz9XhMS16IP7lNB2UGghEP+gk8H+0xLzG
	axyfaG6XC09svlyGTVhWUCqHuvjKMRAkLFTV4apcP7oSWEOxU7AxU5MXLfCn7V9YfYZ3cyOuNUK
	rHo6P9e+RmHN7CPg612Jp85JQ9b1bBZnjAesGpjs5CMaEk61h6W+FmxKCEEFCcx1/UtBf4vVu7N
	eM87t+zODHCoVY0aDghY67gWBSdEY/3ude+kpgq7rOwifHHPifFryUf+EpkbL25jA0g1t0HFziz
	69FwnGtckKOyDsW+8bRNgt/0qtEJdxbr0qLvrwVKoYon3uOXQz6rG5B0aO4UCmiMX2frGRlM1VX
	uCDzn7t7QHAdpud53lqy6
X-Google-Smtp-Source: AGHT+IHlvw/vIjDHerdRohHiGD9BIjPGY+j7pBYk4Xdz3WGpTzu3diB6e3NShLvW+IeqM97exMFnag==
X-Received: by 2002:a05:6a20:2448:b0:2db:f868:22a with SMTP id adf61e73a8af0-2e7d9da085dmr2751475637.52.1758779962022;
        Wed, 24 Sep 2025 22:59:22 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:3981:16dc::247:77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b231ebsm866478b3a.52.2025.09.24.22.59.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Sep 2025 22:59:21 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Date: Thu, 25 Sep 2025 13:59:05 +0800
Message-ID: <20250925055906.83375-2-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925055906.83375-1-jjm2473@gmail.com>
References: <20250925055906.83375-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_225922_874110_8B67B647 
X-CRM114-Status: UNSURE (   9.99  )
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

LinkEase EasePi R1 is a high-performance mini router based on RK3568.

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..ec2271cfb7e1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -726,6 +726,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LinkEase EasePi R1
+        items:
+          - const: linkease,easepi-r1
+          - const: rockchip,rk3568
+
       - description: Luckfox Core3576 Module based boards
         items:
           - enum:
-- 
2.51.0


