Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCCCCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=; b=IAtr9jOVxen+UQXOMPkLmX4ieV
	5N4vvmlqVJixLRnhyUrhR78e+58HHgb+LZ8GZ/ChsRnhE2Iq3gsuWegXcuN03djtR8QeKTSLLQMY9
	4aW4rnkRF6uRANc66wKE/apmTWBh3CJKXPaQl8ABJLkRjs51fHsGg8QE0u0RSzAO0Kygru/n6aFtL
	N+Gx56onEZkQd3igFQyH8Fp4GD2m3sIDpFVJCEJmTr0gs9b/1sp2Oh4myYZxNrDUkeadSfoa34qCc
	w/80aUs07vEHv/Az88LZSYM8nxsaoe7PhpaJ4LSJoK3PhFeXDluWGHZAl/hxRKTcdjICEmh5BQBT6
	9BdmHhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37pM-00000001Y8a-3e5f;
	Mon, 29 Sep 2025 06:57:40 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37pI-00000001Y65-32RB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:57:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7811a02316bso1995859b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 23:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759129056; x=1759733856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=;
        b=gANQJpkxWA85uJhFau8yDyOORKZkFpO60JWwd7tucdx2aCxlsJKkzLeAis7580N/Z4
         g5MU2TgXw1oK66qn7kWKW9Qz2owvp9nRkZS+/xJnXhE3rvOoSe+eM7tMv8g7lKRWpTTT
         8ljWLsDc5qs6n87F6T7lHExoQaK2Ee99CvV5fxFDVj7CsxkFSbDlCXfGiJkj9TL43IbR
         U5TLdZRw5/p7EAFvgMJ8NclY8LO6kzM5u+gO6rOG/qzgdM9RZKYtIfP95E3uOYevkW9b
         RV0Ag5OakuUlaZTTAdMH6Ax2Q5avwIagbUgxrsTvcncSpCtXUd6W55ugXc7Kce+5B6ZQ
         O5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759129056; x=1759733856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=;
        b=tJ+ET94cDJRUkSvqcyOVchUAEo3jZtkHW6XeOH492XPidJwTvkCwmFo7/erj4rgFzQ
         mCjtQmnlyU3oj5tmemR+kvwG70li0UQuzPFgAQTvxk/dPW5JZ624va7KuqmgCxayF6bA
         6FSxRYj+CpLpH4SoDcWUewdHRqG4Qk9TcCQ2Omev23tT1b/MjwAJeU15DnzXj5Su3Nwi
         Ji0gT9jTePDsauQYUscrDVfuxYfba9FdQfWbUVyLE1frvDz8Rk2CTT6BsFv+HQCdkcSh
         mbh4VYmPL6ZsKf46FLlTas3ThsQ+56kkdlaS7XZMT8wS+njm0B5c8SnSREZj8lN9Igpg
         9u7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4y8fwd6Bw9SsIUEB+QcxnAUqWMy1vhcaV1JSMWx983ee5XpRRraKY/O9sYJhjr51P2tsG04loM2LlKXUXY0j8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywal/S3c3HBLpna02ugKy9owqIPjKUE57ev+mzsl0Nh5ieaRHPK
	leTlLMyb7xSUsvc49wMlvL7Z+dvBAfUQ94P6ad6aNc7TV3wQfiDYrruV
X-Gm-Gg: ASbGncu2FTprvr836VbVeyM1qu++NED0jz22K5p8ZrjVTmhoKR3usmzB2sI0iGYoJUq
	Rr8DCE2mythv1R1LPyzyutW28k5sRT2mM5jvQex07uRiiLXSSgg0Zy4mHIQGKmj+oOUMKgwXAgn
	hV3ZzR0gQHShi1kRcECEwcVYka1Ow9MGBz1Th/F+cjAuHKhVcdeX+kjaHnYZiVCYRdoXPIyajLR
	FhZEcSJtKjBpJPMbVWTwOH5Q9Y/dUXhcZhTMPgV1x/YBg9wcWKLOB8GkfRtZxP10QOtBXBTqspD
	xibdT/3Vm70f2AAlTPjmB5qEloJbCeeBxzSaEX5RNdiO3cXaLLtx3Kxpnh6sTF6T+SPcuoXkFfV
	nafvWuHO9V8qLPIEvgZ3Fc20IP4aWFBP1q9UsFaZT1biwg9AzUZG04gm/WOQ/kD6x
X-Google-Smtp-Source: AGHT+IH4i8/G2t5oPtUqYoiiGGusyxmzE1tEeQmVVpR1IWJ1EkiDqJkPlsoVlGwgQEV5FUFAV7yu3Q==
X-Received: by 2002:a05:6a21:3397:b0:245:fb85:ef58 with SMTP id adf61e73a8af0-2e7d184ddcdmr19240666637.40.1759129055820;
        Sun, 28 Sep 2025 23:57:35 -0700 (PDT)
Received: from localhost.localdomain ([120.229.16.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53cac77sm10549595a12.17.2025.09.28.23.57.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 28 Sep 2025 23:57:35 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Date: Mon, 29 Sep 2025 14:57:12 +0800
Message-ID: <20250929065714.27741-2-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929065714.27741-1-jjm2473@gmail.com>
References: <20250929065714.27741-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_235736_772602_B699A42B 
X-CRM114-Status: GOOD (  10.33  )
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

LinkEase is a company focusing on the research and development of
network equipment and related software and hardware from Shenzhen.

Add vendor prefix for it.

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad..db496416b250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Lincoln Technology Solutions
   "^lineartechnology,.*":
     description: Linear Technology
+  "^linkease,.*":
+    description: Shenzhen LinkEase Network Technology Co., Ltd.
   "^linksprite,.*":
     description: LinkSprite Technologies, Inc.
   "^linksys,.*":
-- 
2.51.0


