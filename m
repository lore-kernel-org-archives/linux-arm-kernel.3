Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CB0C44524
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=; b=G854usfbYP3wqqk+O0h6Za0j+8
	lK4qv1Q3ZsJIZgoUVizAOJt7/o38C48rYBRTJ7OJvv2OuNWQR1rDMSd5M8GpnbnfstG9imythua71
	G7B1EWpWWyUQXcm8s3sBPy1ft4To5iXOmWjW9ZVyiRtE7ihf8RvhPUqvIg1ZG12Hry38zARYgHAJ5
	Jy06aYKKKmZVqe02uBVQrggmPGNKonNpy9VeArAc0NXdIVMCS/6AisA93QhARAQInpKqy5cgxKGko
	1ZBom9Bf/Jf43p9wUOy9lhbUKurMLxcsz8eHpOtFtAu1MnBGCecF9zOl8nDVYr9z7jXBZa4uhRxfx
	ngCt6lJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz14-00000003nY9-1Vlk;
	Sat, 18 Jul 2026 06:59:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz0z-00000003nVQ-0ZW0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 06:59:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so96587535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784357952; x=1784962752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=SFBjBTnQtJV6HNWWoDarFyIxwcvDSRQAIKWfj/2kbTFCaBkv7fVzsT3cAjNletxw2c
         uXN+Cj0U+pkyCbp3ntk7Ai7ZwX5TUWu1EGoiQ1Jm8FRFDNCRa/tiUWh5c4ClUX6p7MOl
         ZnPB74WReF8FaDGFIhi+fuQi7F60sb1ajDuOrq5janD0qt5c1fs04Xy1XsLr++ZHpRjG
         nn7uAvs/7qXUJ2HdO7XshtwwEAKgyojc0Cjfaiq+Ki3xAAEci7arDU6zZRd7MvNN+Nai
         CkSzisAwWqlAycqmab7BTdFILr8DUlwEnAEtJG56C5X6jxDQc6XdZV3J2pUjoAvdVVoa
         JZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784357952; x=1784962752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=k+sa0STcpPJhmQ6dZwQtu099pDCnLcQur71lkWjD5eiBXM1mJI/oSIrr8Juc8ek8sv
         ngukXNHb6RA4hCXQtr1pq3uH1qf/LEsiL4304tTLzIvvM6n9ciYqFGcTQdFRcCMKZvDy
         AJdoEzJhD6UwulQmJwAMayj8XdsYUICkKUZL4p1fGibl1in69W+XBZHDnXlvAv47kuZ1
         bbiH/B5ze/ctAsigyjduRgV4Jy8AY7LmUgGYc0gXU+E9PlEQDsgBI1+i03BPkjAGgEqC
         eLrDMauE1d9HLWUzvJoRFPet97+eXcyyo0zU/F9+aJdSQonChKP4S7ARvYjOa7n0C8qo
         U0tg==
X-Forwarded-Encrypted: i=1; AHgh+Rptw3X+hgUIS7hcO5ZXTiAzaO0axasD8emvz0Q2mJJWnonXISf07GeuF6Wj9RKdAbaf03pPNfW6207S1Sl+3V1Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yza317gW3SrklfUSnwpNWuWtP4/rsjn7zjcchspSlxuRUCanI2Y
	s2Q5R20fdIkEqPGS5pP8x3iKYHc8kCDczR0LE8uVzEej2FK4sBl9sktv
X-Gm-Gg: AfdE7ck9u4bdIp+m6e6gtyjWF8HFkriFOFXAnvFZF6hSjOpa4e9AD66GDaUSbN7dpTo
	F8By2vdPbEyW4PdIPoh+KacUyslzCR7FCVyJRxVRMrRaPgBpLuCs9wOpVz9wu8yUsXBrmFwJDwp
	JL2ttJ0R3xZpiIRVqfZ/ltL6EMlBqxLI0ZvB4oP4BKFFHfqodt4x8s+XLfcEDNmH1Bsi/DKDFdj
	P9pvyIrvdkD73/nLtG/cCX6iVM8yxbN78TpXYQ/pThbhKDSUXJRD/9jGv9QNEU4jvBm7tVP3Sp8
	Ok1Ut4+ag8pGgfhR0Vz9jO1LFZ9rsUSe7+V+bDcftlcATrLEthRAdXTj8CV9LkHX9T/WAwSYhWo
	4r7ZDqkvbdgUhsyyzjSjR65dUrRFZA6nKzkOpt+8SVJ5SBbZM+a0MvmBSN6mhKIsqXkvPxarEH4
	QHpe6K/TjOyw==
X-Received: by 2002:a05:6a20:9183:b0:3c0:9c19:65c0 with SMTP id adf61e73a8af0-3c3adaf501cmr6434455637.72.1784357952083;
        Fri, 17 Jul 2026 23:59:12 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm13426133eec.2.2026.07.17.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 23:59:11 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Date: Sat, 18 Jul 2026 12:28:59 +0530
Message-ID: <20260718065900.755631-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718065900.755631-1-hrushirajg23@gmail.com>
References: <20260718065900.755631-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_235913_180279_564882A2 
X-CRM114-Status: UNSURE (   8.87  )
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

Document the compatible string for the Vicharak Vaaman, an RK3399-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..7cfd3687768c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman
+        items:
+          - const: vicharak,vaaman
+          - const: rockchip,rk3399
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


