Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA17105F7A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eS5sv0UBOGHpIO5uY3YOxKqzDuk8BU/Ch3wu8qyg9oY=; b=zlZM/aUjSI1FBOr1NKTt+mC7RS
	s+OfWsdJXS7G6Q3/zzsPElHDOMlAyKhQ3xTBZ1wLu4Yjdd7NczorFxPXjuCP6YUxJYrPR+Oirz6jV
	aDN4cTmPE17Evc3MrBL0xDKs6U8AhRxfXejCzOWn9khwK1VbMo/Qy08DkqLILeOxpV56en9p3jTAL
	DNfOXZWcDrQl7bzFlHrEGEMDp8xKSq/AdSPnS2Ohi18cILvCJmqdeMiNyncFaH1tp5PNO7obU3jBV
	4r4H3HS8OvTYFd73/WrRW8CJCp6IuLw18O9CpCDqknm7wm/PotXjFxysRVjGCcalbMeKymB03zEEv
	V0n2HRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12IT-00000000BML-1neC;
	Fri, 13 Mar 2026 13:11:21 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12IO-00000000BLG-2qOc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:11:20 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3274079eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773407476; x=1774012276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eS5sv0UBOGHpIO5uY3YOxKqzDuk8BU/Ch3wu8qyg9oY=;
        b=N/oU1hnDY5f53dyCmvWdHsIyWSAtwABui09Auk69mRRbXzusK7Pifp2Pd1meNBX6EV
         Cr1sJSCKx4nlpq2x1rMGVczNYYc84jB1sHC9UvlcOFBeYzfu5CCRVEJsp+WgXvH4LSMZ
         /ZvrC8e5YeStmc3mzXn2GgsbqPK3ZLypvgrfKaRCVHFSYeoEXV9gajEsSLI2szH9x2F5
         eb1V2RJ/Wjrs/44LQ/LfqDFCvvjJvbQVU9YDfxhEa9TifvAdjKsaKRDODiu4pLCY4fma
         MRoT93zsqxKV8xQV62yHtPPveZsJhyQQ7eBjz3fBwLjQkKJFA43pVWZ9DTjZJ3grgMFx
         eOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407476; x=1774012276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS5sv0UBOGHpIO5uY3YOxKqzDuk8BU/Ch3wu8qyg9oY=;
        b=KJO64kGB2W+KZ8enaxor+Fr44KcewToD+tFSWNBF6FQK8MP52zeEECcbUh2egmsq0g
         38T/BElBTiKJAAYrHa8VHsBSW7jsQI9ku5aSiIpjH8xopgPIrMDziGNYk4ipcbpRF6hN
         G51C4AwFcMSRG5w+SQBIourREBMqu8m1BdOKTk6EsFOA5gc/Itt2zaewJrk9odqHurds
         4vFoJxtvugn4xYHX4myTqgvkbi2Wc1vM1EI/l6K/NmKTVyw5CoOb5qSpy1KcD6yQ1/Cu
         5iL7O/uJiy8nRl34sisiT1HqZQhwARJa4do5ddCZa8GkS09EyOTTu1gvd2nFvYM2TCOy
         z3+w==
X-Forwarded-Encrypted: i=1; AJvYcCWjf6et9GZ7stXODM1LKyNLTGcStjOR6PeAqNof5iwd0Pj0re8IJlTOnEObitlOWoirr6WbFo+tNTGcLPQwY8CS@lists.infradead.org
X-Gm-Message-State: AOJu0YyaAG8v9fmrTprGlcgg4upxmPBAiA85VPCDRmKpzNfMf6bjepgg
	xmCM/IM8cc13h7elWYFWBoJ5tW5BSi6w01/V06TmJQbV9w2V3ksxItTs
X-Gm-Gg: ATEYQzz05ARATSrYozJtLfH6KIXne/5VUvTJoyneVUY7uzDjfhSZ8gLBBYNlgVpZT87
	QdzM5X+3zr+JhMOqmezz5ZbLOMSi4+8qJxZRmCImMFd2aEz/dwFmoSmlDhA32t2nARu04S9uf7s
	OFAJ5O/FconVwjL8II/5ce9DOsRIfLTF5cruQrX2vxYmiH7Xemo4SHMvBa+F9nU3IF0bAR5s6sL
	G1t5UEuZ4serfhcCtojZbF50FFagGlmSV/KAcPyg7JlJ6fk7R8RwQIGeam30mruQX4onbuvVBKx
	h7q5KYaZxDILVcvGdjEhXTPIfxiRuqLGWeW1T4mrwHFQUMnn7A/j2Bs26WVlqqUp0LIwc3UgPVM
	LbqV1vQhdfJISAx/Q7XDCqIzbG0bLNzY3/Y36NRqyywzPypliB35DLrMXKHjyQTcHQuuueRCOHe
	POxVwKTGWz7u62DhPfuR+PgK3+fl8Uq+Ly+vnDay+3Y62tsPGowG0oRZvZxVaxFULyY7Lx6+JTg
	qf0
X-Received: by 2002:a05:693c:6286:b0:2be:b2cf:cd34 with SMTP id 5a478bee46e88-2beb2cfda25mr328638eec.18.1773407475406;
        Fri, 13 Mar 2026 06:11:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:148f:b6b5:4:db6e:9a2c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab5702e5sm2602315eec.29.2026.03.13.06.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:11:13 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Fri, 13 Mar 2026 10:10:55 -0300
Message-ID: <20260313131058.708361-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_061118_355002_EA610932 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Fabio Estevam <festevam@nabladev.com>

Add the PMU GRF and IOC compatible strings for the RV1103B SoC.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v6:
- None.

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 0b8e3294c83e..2cc43742b8e3 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -63,6 +63,7 @@ properties:
               - rockchip,rk3588-vo0-grf
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
+              - rockchip,rv1103b-ioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -98,6 +99,7 @@ properties:
               - rockchip,rk3576-pmu0-grf
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
+              - rockchip,rv1103b-pmu-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
@@ -231,6 +233,7 @@ allOf:
               - rockchip,rk3036-grf
               - rockchip,rk3308-grf
               - rockchip,rk3368-pmugrf
+              - rockchip,rv1103b-pmu-grf
 
     then:
       properties:
-- 
2.43.0


