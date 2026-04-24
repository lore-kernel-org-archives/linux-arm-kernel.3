Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A3EFE51F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WRwTAJEdshpMeygRgfdm3dyxt0e0Cc0hy7FOZ+1cEoo=; b=Lv9O6cmktuxC9V
	+3HAdOMOWWptUMG9zngPfVwa6IVCP6wEzYGJ8Wi+PKZZNKLeYKdtIYM2AqdhlnDrgBu6lE+heUIBf
	J72tYqLoD6Cf7zrHSFo91F43rxr2uSI8ahrpvnF+A73XASwymYlTw3ZtSP5mWmk7oTOFNI0l3UhZD
	vqj/gta8mpXKm9gRJukFkeFr8rVpIO1huNU2a36DskQAlYBernRaJwBJMCJ5aAzHhY5uYyXURw2gt
	zZv7qHyxW5jhHoh9t9rvcuNrimBL+VNmu5R4oWFcrPIYreI3rCtWM/9kRhhgo7B/NWGREX+z0KM+d
	oibDbOzHh7UrBr2Tp/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCrk-0000000CvyH-1nhx;
	Fri, 24 Apr 2026 09:30:28 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCre-0000000Cvxe-3wj6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:30:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c70f91776fcso3017372a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777023022; x=1777627822; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRwTAJEdshpMeygRgfdm3dyxt0e0Cc0hy7FOZ+1cEoo=;
        b=VGapEIw/EeahdTLaY8xSaOPYHqPrP/FJQiXrEnv4824QfJitPsCkMntzgGkK5fmiRE
         9pWQ3+suQ4gipFxKQS7+VWohmgjRWC+24tBX8htdwmKADjeqC4RwB/yHFR1kkWdXVY3u
         nNP2XTmS0Nz5uVI10WPjoc68O43bbsKE8d6cVMtSB7p7ZtIyBwfMZLOVxJ29B30gN2iU
         03us9R/Yd/bVVzr8CrYsSEYiJrLw/wuFGt0No9zOqnAFf6lfT0ZOtcF1AwdpP3lVrvux
         fdkbRtj0Zm1G92C/PZw0DwsEMZUdv5dfrJe04ipX/3trUQ5LZfd27OIC5oBWw6a6uBR3
         DyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023022; x=1777627822;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRwTAJEdshpMeygRgfdm3dyxt0e0Cc0hy7FOZ+1cEoo=;
        b=Tm+vKP2e29Wv/broAZEYDpHm3TLc1/Zodjpsz3QW30uwKS7Q+OonzGMjdwIgXg+vTz
         RsgPe3lS4YwEeK9uzW1vP5VIFrQmyQFi94Z/MDANbDwQBM9A3YDkFxxNqBoP45UNDUSS
         aH5UJAtgFd/e/eddVgrut6QLruJmwSLVkkoYnTYvaUi8CP2xsjWtrGPIudWcX0+ptE9z
         PA1xa1G4y6bk/lVYaxQpc6+5XE4D7EfG2KydeQE5qgjsm9DVnzD8OzgeG4Ly9n/fawPj
         ZJH3D4S5Ag33KhBN+YmC3igfn1pJkzx/z8lEjLecf1JV9J5uMuYxVISgBJFzvsZixEn/
         +NFw==
X-Forwarded-Encrypted: i=1; AFNElJ9OW+KVy7CBm+SiMsuRqeZ/8GX8LXbz4euf/khdXGUZY+5Io8FWjOvFM3UuZGrSiJO+fg2Gy1UYH7FHRNNhZ9m6@lists.infradead.org
X-Gm-Message-State: AOJu0YyleloWdLKESHJ2NNeBUxGgw1AhRGDfgvJqQ/0xdq1SP5zo9Aat
	qQU5zI4sYwDQNTP32kACZzoZIesqR+70gyflnOaWcDM4WU8M5vgsQODD
X-Gm-Gg: AeBDies4ZhvTfbON7N/WN64nmfEQpaSO+EEOwfEyEa3hkf/BE6zi6S3N1gc6W/tBNTS
	AccC8GIWDOAmP+Wl5uivyb4GbLbpMMnzGlUl0NYYLWJZmhVxIR/qgkQRK/wqKQ+j8YafI5f3ZF1
	lVhput7ceGUcsrJoBp4FG78IPad0UpWmRZX2QZMmc4O7kMGNOL1eZhSuBKsjvux80T+0bPPbq3V
	7SP3ghtD/MczzotDBK02VZydYZO0lU+rMfk+5yTK5k3o3p5bCXj4r2BRk3+Me1Ni884xUv9/XYq
	8xEIoAjmW0dA/oja4KyKsLIoZ+bYFKaMB2HSEG5VV94uPsYa4XYIIqheVpeM6DlpuUYV65frQ3u
	RacBk61hv8ACPUobAwYvmG2ATeCOELQEYUDONGMYy+MxTjz2Yw38QgOnCjXefAVHuqdwAsZsBsR
	S1myNpS7E1oXL3crQFfmNqiPyczgr8YsKFw+VKRlQY3NjQETPoCXFkqIgAVQqoN95d8Me9mlyvv
	w==
X-Received: by 2002:a05:6a20:3d85:b0:398:a659:eb0 with SMTP id adf61e73a8af0-3a08d8a6695mr36356423637.34.1777023021700;
        Fri, 24 Apr 2026 02:30:21 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm22658143b3a.44.2026.04.24.02.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:30:21 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v4 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Fri, 24 Apr 2026 17:30:48 +0800
Message-Id: <20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEg462kC/4XN3wqCMBTH8VeJXbfYznTLrnqPCJlu6gH/xGajE
 N+9KQRCSJffH5zPmYi3Dq0nl8NEnA3ocehjJMcDKRvd15aiiU2AQcoBgAbbj0+nIcceR9RtbkZ
 PM5YVApQyUqYknj6crfC1srd77Ab9OLj3+iXwZf0DBk4Z5RWTXMpSnbW41p3G9lQOHVnAAFsk2
 UEgIhXPRKFTkzD1g4gvIhnnYgcREQFTVEZLnRaJ2iLzPH8AXyb320IBAAA=
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=OsNPHX4jeofbnoke8t+ygRvQX/qpdNEBz1MsGO83J8c=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBp6zhMtNInLf1W8Lk5DvyqGuC2M/I8frqBBvEe/
 b8/gD36idKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaes4TAAKCRClg0K3CVbE
 gdc3CACqDuZpjAuJQGDt4CwXYmls3MIocoPuyLH5gxIO7xr5zKFYT36q71wL9C2iVRF0xs2xiFM
 RQFU3Z2bvxNhZ/7Scm17U5hEvK6cl4+xSUil/dTnX1YToXrvhuXKkUgFB/KShUr0sxqJM1goh96
 vxqLOder7vKskzFo4axbeEpgLShGAgtU2SDkSJh7WUJzsaJ+alUK49AGFqLL6TAFTV/l3rgj1K3
 cu29OVgwMmtsuC1Df74d6ZQtzsAi9FU8Ltqg6mUVLNLdc/0UC0TbZ0JJa8Bmx20bS7JKnUhNbYr
 xrI0bWR7U29BXya2NaNhE4fimtycS1nGWEeObDa9gOo4Umzw
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_023022_993571_8D999FBB 
X-CRM114-Status: GOOD (  10.00  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2925 ++++++++++++++++++++
 3 files changed, 2927 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


