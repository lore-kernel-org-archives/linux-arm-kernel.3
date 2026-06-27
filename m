Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73DBC43638
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=; b=D9jwe4gwZLUHDj+OG3WoxezP5I
	xRWLPeqlU2/4O0S07bnqHGvwSua9m5waXDofCuvKssqU7F0wnslZxwLqwUkbi5BtE+0NH3ZncOxxi
	zeSw9aBcvyx1YhZy9vZoVQD9k9M9i9pMQtU59S7zpsofGBtw0qEqtTKvCP97K0DDgOWoGibN9DUzU
	uFkq18JiuJJ2HFeHHf7xppxUm7PnH5oUuksN1v9MsU3JF4ZoPpOwZSbqtR289jKmZs9ZebnWMspRM
	KxwoPlUzwiIW2k36VShzypHlZLgdzEt/IhPTtVw0XK/7vj5WuWJrVN/60zCLREIcf0L21GdKsEL99
	J48VwmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPUv-0000000CKoo-3Dm0;
	Sat, 27 Jun 2026 09:38:49 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPUt-0000000CKni-1fIM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 09:38:48 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-30c965eab27so2000262eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553126; x=1783157926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=pEP7eoNmkoM0jkCDLqH4PedmmrrlbxeWWCNUvagmvyEdNlYuG0WFH7oRjJTE+GYRIL
         XiIK1cejQIIq7qwldQZ6HOy+0P71SUijMfDsMdkSEGIIY659sAZ5Yi9paOrt0TgJ88Uj
         lnIkVCIuYljEQsYDiIlH+Gw5lueLuxZyNTWsVr7S3Xm3PQf4k1fQ8sTyJXJveUfSSYpY
         QjGwmjnZgitx7w9J6SOs3iLzjD5UwFiCWqJugvrTFUSKoy8chYqU2F3HGRlLPE7s0/pu
         4gqiYyanG6i0qkb/k6HtYc8/WQmvEpR2f7YB3wZsNdR6QF13iinZrUBUVg39kHoPWjEc
         1XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553126; x=1783157926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=dfXeeykxS0fuPTAdQ0BDVFOnsKDP+8D+501B9Wf5jV2FUDp2cjGNyD3jNTz2lFVj8L
         HlXoMLOmcrNVhV30YQXCa6YWKPlPXRYPU7h20z0qUSIEGqmZol7lAH3PhRyMsNbfvYjH
         EYYnPhQHfRdEVu/3GAArQhDMBm2FS147a50oGS7ItLBv6b5vNXCx0GNPfqCioxpbg/BV
         DL+KvJg/9gUZ0+mMvmtmmwIP7Clo5e5Bea79jdkt6PDz3eDV2zu8nDPrrPMxMJZkQ4L+
         olw3o317/9xqz/8d9NSGb9a/3WvfZrDiI7wX0PoQd27TfgKEYXxK5Beph0rEhp9PZwyT
         mfXg==
X-Forwarded-Encrypted: i=1; AHgh+Roo5GHMv0HzN35j7EeL9cBZlEnwmiouEUNpbkBAs7KxQA6ffji0JVRLUA9O/kQtACndwDwQeiPdxIzSMnNlRfst@lists.infradead.org
X-Gm-Message-State: AOJu0Yx83tHrorEuRSudXALnUTLA7qZmyjZP/gx4Aa6rcBkMekYGmUVw
	Ped/jMYAmCqpOG4/sn0Z5jGpijLXrbnHfRejYhr43qJ0NIUdWeUyc8/T
X-Gm-Gg: AfdE7ckcymNel+OnUskLUiLSIyu8aRWNwQMrnr3NYXtdxF75N1R7JtSlEAqP+hw4hAE
	BYEKzcHBWVzGr5a6vx0gvIiz6UBxY2+0XwmvJ8M6AOzO9R0qOvO9HJBPMZGQdTmT/ov0hMn1pTo
	WlLqX7T6FH5SMUH1P+3EAiaRCQLTlH07JYh2FU7RSdVucJxpnLQ8spY2HS8RNEH9olJX0fmH6La
	4MKB+G9//rwgHFeU52oCp6OWRRezG+bKrm6KsmkMVtlb4vxKu59lp4XULNory4rWAeZIHQp952/
	PkcmfdnTeRQx9KXl+RGFLfCUUv04+yctuYL1StivZuiJf2IZyUPpNi5/WTgWxILfq9gdR/FQegM
	uS7KSRwffSxvU+hOVzlP1G4npXREYAWKCg6z+Ev6u07p3wlwJQJ184sL3rptobClpSCNKm4ub4F
	vgOnbwIrzQwXQx7MnPrSo=
X-Received: by 2002:a05:7300:748d:b0:30c:ab4f:46c4 with SMTP id 5a478bee46e88-30cab4f495cmr3536469eec.42.1782553125976;
        Sat, 27 Jun 2026 02:38:45 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30cf86deed5sm4902948eec.1.2026.06.27.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:38:45 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: heiko@sntech.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 15:08:28 +0530
Message-ID: <20260627093831.80495-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_023847_439911_3B79B318 
X-CRM114-Status: GOOD (  11.53  )
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

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
- RK3588 SoC
- eMMC storage and microSD support
- RK806 PMIC and multiple RK8602/RK8603 regulators
- Real-time clock and status LED
- UART serial console and SARADC

Note: This series was generated on top of the pending Vicharak Axon
board support patches (v7) and includes the Axon entry in the context
of the YAML binding patch.

Patch 1 adds the binding documentation for the Vaaman2 board.
Patch 2 adds the actual device tree file and Makefile entry.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3


