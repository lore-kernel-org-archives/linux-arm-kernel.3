Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57E6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p6bubJ2d+BmHRmgs70y+zlLbzWUmkntEheMY266sG6w=; b=nWsH8i7S+39pluRbmvYBIsvrOt
	nIDlpHiFhFbPzVoyqvkP4W3kM2uivnimKcgSUypD9lNlqRn8vZLLLzRD+vtShp8fd5aCFhuUU7rAR
	tYPUOnfVXk6QpIt+sMAW8/Z1+r/TyadumHgVZIc9fNgPMqnB8ojhhJBB9yZnul3ddQxRg57NRTcr3
	iWZEskduwmXZmQEbkfpyKFlmh4yV28srI1JmYgYBSbU0MNzc+GYuZrnY5WHCpGKVv7TL4teKp1Vfz
	/kKq82wKXBmeWhWbDgnc+e6kgxAKSL4I1+uu813sEYkOzskfVWf6icDcWvkOB8CPeQmHL+2Up9gVY
	dHoSshdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ky3-000000004sE-0o3K;
	Mon, 07 Apr 2025 11:48:43 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kqx-0000000035d-1j5d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:41:24 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e6e50418da6so481649276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1744026082; x=1744630882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6bubJ2d+BmHRmgs70y+zlLbzWUmkntEheMY266sG6w=;
        b=M6KpbQHXZt7aRVCrhyT/yIhvGrNV9pQYPtpM+lSyrDgiv6gc5e6Vnh0+XuUoT2Wh6n
         feSYsm52V6guWFU8s+f7ofL2v//h7N3NG9mwxoVBA9ttHoIMIk4jZ5iDUfv0VxFbPwsi
         W1TpxyOwQobom9f6iqopt/YQxq8Jbnek5DfzqNrnQ97o7yp+FXpnJRM8EC6nG/zv3+K8
         e7vaOnUQy0/PlDtm6LGY96b1nWD32kkoNf71ZMjytVCSLBS70YfOBCcvTHv9Nbi9oCgC
         f9eEmr7toKAvXkrS0NJ3MkVIBEyQHnfCnmyUOrQZ8bdi9GuY88uD7h8ThwnlAF0UPwFl
         Begg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026082; x=1744630882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6bubJ2d+BmHRmgs70y+zlLbzWUmkntEheMY266sG6w=;
        b=lUfe73ZLgyKCBwcxENVK3VEtIcAnrrsPHIx5mBesqS87w5DYGBOI1h6AE/FCHn3fM5
         Ob1C+Jtuj2X0lx3atQ4BQqCaNaGkJGbDJ8jnN3K3vqAIhBD3ZcAn0/hLBUfCqyJP1in+
         evNhZhxhSugfCAgHkX3a3JlJqY3lVZuP3FfqXG/OHrW1bi+L5RPrGsj1tjIhVQm+TPEq
         G6LRqyc2EIwbMDOsrJ0mr9sxiXYYvyqiWD7rpUvx3z94C7bIuaD14OMntMRtPejZSo0h
         rqf7sRiv5KL3seufuEnoyDfwrfSLs3rUr0SJQkokMZVlE4H3oY469CDSZmt77iQxTeD5
         RUbw==
X-Forwarded-Encrypted: i=1; AJvYcCW3+IC+0AleNN7ZwAbxu36X93ulUQ3+ZJzxjSeUREPOfuRFALK+9RTZj5gMT1uk1bBX05VU7lA/yyzcOI0QYBUU@lists.infradead.org
X-Gm-Message-State: AOJu0YxzfMc0gbmrd/dkA0Jg2fbQ23MGWmHF6Ej+oJ2De+u3fbZkkRzb
	tRY+5ykObit5e7xPtZlMMIE+ot3GWdSYcp7q40ulCvekmzIw1l2CJoiv3nJnLRo=
X-Gm-Gg: ASbGncskezjIigp5yywabSECZPWVt2D14WI7/lXWXrCMpwqlXo5h3m1fUaZ7Dujk0EO
	+Cg2DgohOtnZsw5/CW0ZdkMQq/3993mdoGlJHBSFNhSHj3xyAIyorRv4vNSfketVOkk0Tiog4xx
	6jQr8BLcLBJWju3od4zZNGsRO8OnY3k1AD0om7Lz5a0stiHyM7e5HxYiHORhtPQiIJGCTzckFvR
	ujVBEBHzhMSMkByW7jTMQFQ4FTTmhXPt/c6XGLP15NLROUO+KKynxiY9bjeOHrlhvrgf3fF+53W
	ZAyomVaiLRt7qVnJ4kMsWzhEwPhoRmdDsU6HdzSYmt9zq/LBnUhJiT1O+4JqXPWEIkn/fBLYtM0
	mkkdZwmycLlPrvnOQRA==
X-Google-Smtp-Source: AGHT+IEH2+urCNhcYCnjnsCmCmufxjCnfY74JrlqFCW51UfpadBY73PwrLHZ9pw8pkedOhJGBs1p1w==
X-Received: by 2002:a05:690c:3345:b0:6ff:1fac:c4fc with SMTP id 00721157ae682-703e3358b44mr203631067b3.37.1744026081737;
        Mon, 07 Apr 2025 04:41:21 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-221.zg3.cable.xnet.hr. [109.60.82.221])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-703d1e2fe51sm24841567b3.9.2025.04.07.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:41:21 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	soc@lists.linux.dev
Cc: Robert Marko <robert.marko@sartura.hr>,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH v6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Mon,  7 Apr 2025 13:40:28 +0200
Message-ID: <20250407114116.3211383-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_044123_454064_42BB81F4 
X-CRM114-Status: UNSURE (   8.71  )
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v6:
* Rebase on top of next-20250407

Changes in v5:
* Rebase on top of next-20250131

Changes in v4:
* Rebase on top of next-20250115
* Pickup Acked-by from Daniel

Changes in v3:
* Rebase on top of next-20250107

Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..77f2b481238a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.49.0


