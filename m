Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDF9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=; b=Jzkd7BS14rITWN1HyezqJ3PHbx
	adMr1NIOdsqK+FPZEA8hoNhZhGgCwpjEAIf5xzZ4hvy+JRdvjqIBQfksZOfef7RBhC3GrgwC6Ok9R
	dRe/Lg2QbNdDMmJUdh9lObwoEK0KNMqUOsVg8jT+ilnvwjOfAOC2+Wa5JrWmpCTbZQ9NJMxO7Ofz9
	8PzD7Nr4gG8bAyOnPTKPVZ1s35j5I3AQpTeTbYoYo7yIbLdp0Jr+8ZOZA7/Um77mad839kuO4vLFY
	AO1S+h0XUBBHFnkF7huQX/BBLr2o2Ya1Woug+R8XMPxFMPgnW4Cpilrcc4LNGsGQfgCTqGiIwqEVa
	XhSjFkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdHe-0000000H703-33kE;
	Thu, 12 Dec 2024 07:06:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFb-0000000H6SB-3Yps
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:04:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-724d23df764so218672b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987083; x=1734591883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=W/pP2YpcBF1ItwIPcBjZlV2xl2L6XkAL1xusIrDSNR3aNR683QowbFBodaRQb/R7xb
         cnZIrN3P8qyeGKT6pVFv7wq29WjWxrvdVEpAus3pd9AnBGQ1oCtihH5VjoFhogz2Norz
         DbJ1/umPjbIQ59B+qiKR5ypIsTE6kq/sVixn/bSZwC/9WFKA5k3Ir3xea5KSMpvQVOha
         6RzZ9uMIb+BaCTV1ZGgWOIxbMypI5d4j1O8ip0iUm6tBF9NpQMLLBVL3/Q/zraJoVloC
         LaZg7btk94g8+OjBtw24ndWmpgZjtQP/vxFfCK9Iwntt1U/12FXvKYqBoD6MnvA3udtI
         ku3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987083; x=1734591883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUHH+eJbCiMl2j2oN03m6Q26pa8Tho3uZPMyt8IDCBg=;
        b=TJJ9uAyl938EJIQ3msqhnGVSHQcgvnWCZE040cZfl+H3xBPIe83i2SAoCb+F98LAEV
         LZrbAyxb5oVCtXcxajnYuZCNcPbjHEa1crVxJ7otVKgJ8Oyebzs65PDDtE2AXiqa3yB9
         CyQMfnOVJhqgcjGXf+H7CGupLAMyZla/mJkxh+bLvCYkfi14Dtv/eNrLcHmo22pRpJTm
         cePw806K3+abFditYbSzqnYLxOjLKEtnkXPMwLGVEnt2ezBKbCQji6Dz041Op9Yslr80
         ZAlChVCapcweIyLsEW5cURrXgC/rTulbFKtNuT2glz1CMt2vk7r7xU4pdiurxxog/SKZ
         41ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWanbuuakv1O3g6c5hGjmwbr8QzgfVoHFcniaoHgNzrTvtKclb/ZqP7SX3YC4uzRgYRW1eJVlRVX/6765i2raMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxHw1IGE0KA4dpzJ5u4uAD59/POnK4eBmBRabolrvdbeQ7wYhrf
	SfD9RA8lSOmoDWZmlHw3rzieZybHdqVPYz3rMusakYBaBlM+rM3XxojmWe9N
X-Gm-Gg: ASbGncu1ULkhMMYCcOTuTbdOuT7p2iadCqVgv4fsoKp7AMzxPCWT691zhACB8KCW1EG
	/FHfaccY46OaGfSjHYVqB7r3bMrq7yOemi75ZcMz1qt1qpowsXPJ14zzdmdHphIiGAsAF/AMh+w
	s5AA7Z5f7Z70YRM71kM1zJndN5xtrYebiUlWpYIyDMCdE3WCQGq+L7N0UVilLktdDQCZflRAonJ
	OyPDsALFPDDWp3w33rNob7Yc65kxSu7W8Ut2GOcd5lzwCvmYiT2IsRrlTuphijmbvZh8F8c
X-Google-Smtp-Source: AGHT+IGtN/4wOi7l9DheFzbvnmhfw8j2aOU+HkhGN2Yp/3Yo0IKmhXbzVUwwdn6N9+FFWNTL8LZBlw==
X-Received: by 2002:a05:6a00:464f:b0:728:e196:b5b5 with SMTP id d2e1a72fcca58-728faad31f3mr3605642b3a.20.1733987082812;
        Wed, 11 Dec 2024 23:04:42 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2 compatibles
Date: Thu, 12 Dec 2024 15:03:00 +0800
Message-ID: <20241212070344.3858-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230443_879494_28499D12 
X-CRM114-Status: GOOD (  10.69  )
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

Add compatibles for Apple A7-A11, T2 SoCs.

Apple A7, A8, A8X gets the per-SoC compatible and the A7
"apple,s5l8960x-cluster-cpufreq" compatible.

Apple A9, A9X, A10, A10X, T2, A11 gets the per-SoC compatible, M1
"apple,t8103-cluster-cpufreq" compatible, then the
"apple,cluster-cpufreq" fallback compatible.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/cpufreq/apple,cluster-cpufreq.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 76cb9726660e..896276b8c6bb 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -24,9 +24,17 @@ properties:
               - apple,t8112-cluster-cpufreq
           - const: apple,cluster-cpufreq
       - items:
-          - const: apple,t6000-cluster-cpufreq
+          - enum:
+              - apple,s8000-cluster-cpufreq
+              - apple,t8010-cluster-cpufreq
+              - apple,t8015-cluster-cpufreq
+              - apple,t6000-cluster-cpufreq
           - const: apple,t8103-cluster-cpufreq
           - const: apple,cluster-cpufreq
+      - items:
+          - const: apple,t7000-cluster-cpufreq
+          - const: apple,s5l8960x-cluster-cpufreq
+      - const: apple,s5l8960x-cluster-cpufreq
 
   reg:
     maxItems: 1
-- 
2.47.1


