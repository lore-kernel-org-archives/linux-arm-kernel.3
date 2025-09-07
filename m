Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D3CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=; b=NViVXoAnUXGzpVrG+plq01Hf0q
	r8l2aQalXbCyqcCixSIQ/2wupg42VbZm3uD5fXfAvd2KYWWjz3IqYpj1YsSBv8HtyxKJQwrbHscCl
	OgIEPfN/RG39U+AWjEMUa9e4voviIq+3bju3AItlT5Cw+qUQ5cx65XTxt3R5JuyxTWJ461VZld55X
	l3BbVC2ojkBMyU3UwfGZarblBhSP+Byb9LFDsKNCiVi9GZutyuU8XQpARUjg4Nne6iTsik3v655gU
	CFRLhV5uK4Fl9rSbBPzpLU4RBf7h4kf300O9/EOgBxeG/UZUwP+HfNe29QrlY1iauxb6oS5vw0aDz
	OWqbSOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNjF-0000000D74s-17KJ;
	Sun, 07 Sep 2025 22:19:21 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdf-0000000D5eS-2zeH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:36 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-80e3612e1a7so480461485a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283215; x=1757888015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=PDzraqZDUnJrD5trEV5/2DPAHdUmUGPAL9LejZi+7fFgnaHWkMj6nBLz7cZsY64MjW
         /N1m3I1TTEBUNTxjYeovRExSY+VbD6Tertzi5cVK/GtvYFdG80K5AXwjwAdXhA7kWlsR
         D1z6zylW648vvY4B5LBqq/gUx/939cjWBem6Nm1P42urCaLW6+dwltrdWrJmwBB/ybsX
         kBUGw0ASHi9BqEGppUjGY0LRPQGc8J1StBWDo/H7IC+KQaNDRzdU3tXz+QOCLhcAjaND
         mjCMwsYysMXtCPyDuY/3jS7bbVgKk2AHN3LNIX0l769pRYBZOLUUMHA8X9HbqQFcPZlS
         6Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283215; x=1757888015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=czulsv5Tq8wnBrNSl9UNaQoKarB9D69T9MmQMuPfzHxsgVGnghHymTknGjU04X9UN1
         OiIOXIA35AF9wNQhG1RcsuLMRELk4KwfImZ1c0IpFIZaM9wyZDgYEhUdwpcwkIrpOrE+
         +CyEfVbG42KJ9OyX/tI8LflxnrOajXRBQbjkUaXESGZKdGxZg2PtamKot8NrPu3kb8Cp
         IMfSs0L/ScmuFwLn0aBOvEUyqcdexRMrv8mRKvqyw668ud+enZBSU5DYjGpi6HBgq+cY
         8GTyWw36dMm/4OmXUeucspAS/K5QBY+GTgogewnge5Godzv5u+lf3dn1upIcTHfkGXGq
         R8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVLR5C3XG3pN9KWNq1TIywdoWQFaz2xdT/w+I9QSMsk50AneXS1nNTvBVbND7rkK3WnEx06RTetO1vIY942shY0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7u91wbjX9rB6j23ORptlY1N443AUm6BH7SCehL26eZpwfCsgc
	0f8/Q0dTnyWWBttMS6VAvSe8IKNwopi7aOPOqtnz/CEoxg5+zMSmlKz6
X-Gm-Gg: ASbGncurW72LrDhY5ztCH1I93SnH9p2vQuXj8y+0zTJmVrpHqNr7zKYHptq6pBMDgqC
	r6tnIlCR3Dd0VBT+vKlSrVs9brqa+nkglttypWgmIpUAu7AidDPowDZqP0M33QMqMPrrhuDblF+
	QvV16R/XWSJgv9UpxQsxB1n9YxrDxj8klBza3fycIy7Nqf0xdpKyIsqXJT+1FcdirC5SwkAEddk
	FiomevOutohIbLM3AinuO0NJb8K99Hh3GZCppiINc5JAob88r/lcHx9LbqO00At6RTjURJ6DKJA
	qCbi9JWp1klk2AxLM6JqlR5mmoU2oBDXZcY3MF7BvIeNMBFWpl9OV415HuRzVV3MW68o76xdsau
	XU6MRByYWPtX2aof4aEfLl87DgaZi1bSLC3DxU1D5UA==
X-Google-Smtp-Source: AGHT+IH7c6KdzZ5dtp38wk1JNatpj6P1Vqovsbf4zct9ARqWKDfPpIhrIZt3XljGdPAodN4JBPViXw==
X-Received: by 2002:a05:620a:44d5:b0:7e8:5bb:b398 with SMTP id af79cd13be357-813be15334cmr606600885a.9.1757283214643;
        Sun, 07 Sep 2025 15:13:34 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:34 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:32 +0000
Subject: [PATCH v2 1/8] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-1-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1475;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
 b=JPKGRnL7yc+uW9TkM1DVLoDpkKLOSjZU2eITTHyO467B96zV+RY7eeKI+Bz8k9a1LiWgSIfQx
 8KjxaYd+YuFAQfTx3a2NC+r4fQDH9nYhae//6afgs9BlpPTNYp2bdF7
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151335_745040_8491205F 
X-CRM114-Status: UNSURE (   9.61  )
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

Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..173c51b17d9684113bb8254ee0c83e8e74de2fca 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
@@ -93,6 +95,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks

-- 
2.50.1


