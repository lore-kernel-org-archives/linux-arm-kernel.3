Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E89CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8bx5Txy8og/O6i1T8MIDUUZY/+F2oP8HDFFEoUUoKHk=; b=4qyTzpqhhXEvlJMraG7auIf8LE
	5botahvLgORzsCnXLWsqA6RmB68dt0tR+rIPbdMf8JmvacfAuTzIS7rnuL70IpqmzUEN7O3eMBMTi
	Mg5D1AT3qqLpUPDCm0liXNnKNxWLfaO7HahwTyMqutOM1t5DHBxnEhFN99Qw6hww257iZk+KtLxP9
	QlfQXkaODmniUnPNOeLJVA10I+ygT8VUX0XBG7oi9l+jebKtyb36qQGXq/d5eY7L8ddFjKmc54fe/
	fFrdSbQ7bbEKfKO/TX3QjWcTuT5bxlvPjQViKV9J0nSbyYGoIw8URemuOExHCr81MYhcy3BXPD+U9
	BWHu3PAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9f4c-00000006zEy-3gjq;
	Fri, 17 Oct 2025 07:40:26 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9f4a-00000006zD5-0rzw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:40:25 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33bbeec2ed7so1162878a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760686822; x=1761291622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bx5Txy8og/O6i1T8MIDUUZY/+F2oP8HDFFEoUUoKHk=;
        b=jD/hXOpSgCdLe8WCopexclzaDiLWgTHHGQYWR/pn5a3k8e/09Fu2ngNpx3e2/Zf/JE
         b/o/+W4oRK8XD+RIIz9i2VEd0zhf/Gy0T+HpNpy5In5BbD/eIUD9yvxl4LDjvDerCPIN
         cW59+rNQt0vuGr0d7+H0b0yMDvuZm9BhqK8+ZN2vEALVTcov7aCK0kZ7998NxyuDe6OD
         xF9CF4mMOecZ9INAL2Qqc+Qmdvm1TBa/Az6poLPdX50Y8WSUyUKmW/QiLJcHgkVo6iMW
         PwNdqWOK/XtuOKdTdCBVcoycrSXTDrc3Etcqj5zWBSPEmCnY/TRXjUSfHF9Um4Ou0gWc
         kmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760686822; x=1761291622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bx5Txy8og/O6i1T8MIDUUZY/+F2oP8HDFFEoUUoKHk=;
        b=hDWJDojuZ1Azjvl6s+5CyhAfa1U/qp8MEvuwqUAUpc74ue+auYYlWnnidNLuPNbUzL
         NZXXTzvw7AMa+fgkf4JQi7p9+62P+vqJ3BAFuttfDTJV8rzU3I2YUZYMAovaA8hTIFsh
         4Bv+smt0iqOly3l7/jkYiY2H3pAebMGlvw0EZ5Ob10hT8NdFvbn8bsmXTGvL6aNZMKTd
         7VFnK67orw90KqA/S9ahwmjd9C40Dg8sv9n0ic004P3Ys3Co/xkqEAZ1tM2zzIhKmtI3
         LYT+BFPuqIq+w/Rwv5Rl+DoZTmqrG+5iRhFKTfZYYsq4jFnjKR24gv11869dU5OY7RqS
         sX9g==
X-Forwarded-Encrypted: i=1; AJvYcCU6GigvfCZjfh2nAK6m0IX7hjB5M+PG+jZ8mh8I0YSy6BLaK/iitTzK35CMtRduqmVbKNdbxNg5Tl9Z0dJCyI7J@lists.infradead.org
X-Gm-Message-State: AOJu0YzYDv07gfNBnBBxPWxUIXQQ2WEW1iRgqEQKDki5VjPu2dFJoqdk
	jKiLc496A4MdF7nqGauSCLYvfnr2xgsl95Zt387HTW2HYmJSjuJTw4rg
X-Gm-Gg: ASbGncsbIrdpCouW8AMuUAaViGEXGThP+UhM/qFJ+SU0psNmDELVmZYXSMYfSeKOlhI
	sZAjDNw1GGDJUV9I+J1HisMkzUm9M9R3hW875oKtHeOGAbxlbnqfnTA1zO0ylK/94p+qYfYk9YU
	9l3oOQOVu71XNi1fSney9Gg/MzLiQNeuWlVMJDAAhJxz27NHQDhxwim/wrl6Mk4YSEx+gupTGYc
	kYRHAB0POAhzWaCSFGesDq3oV9ySZ7t1+NjlTzSDIaN40y0NFsixF6/dSOkiARWfvuKVBPhCUmn
	yNsCrcvES/rLVjVxgZc4iq4C3hLB9R7pXG8kNMiIzb7UPCWgb+9D0ia+cCW1YfF8ZiIiROhHa0F
	eN9iLSJUuMpt6LFA8eu1XMNLJJ4itluP/rC33CHPUWrxz+czAL1l99dPMLnWwPLk=
X-Google-Smtp-Source: AGHT+IE5Wq2LSw/8u7zxDPAEAndLC3TWgGO8LMJfU4cDrcRHWlGtfWo/mBTgBjACKeby5RgogHrlvg==
X-Received: by 2002:a17:90b:38c7:b0:339:d1f0:c735 with SMTP id 98e67ed59e1d1-33bcf91e032mr3105311a91.28.1760686821347;
        Fri, 17 Oct 2025 00:40:21 -0700 (PDT)
Received: from CNSZTL-DEB.lan ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b3173asm1879479a91.12.2025.10.17.00.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 00:40:20 -0700 (PDT)
From: Tianling Shen <cnsztl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Grzegorz Sterniczuk <grzegorz@sternicz.uk>,
	Tianling Shen <cnsztl@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6 with A3A444 chips
Date: Fri, 17 Oct 2025 15:39:54 +0800
Message-ID: <20251017073954.130710-1-cnsztl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_004024_259435_795A0B2A 
X-CRM114-Status: GOOD (  10.66  )
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

From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>

Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
corruption when using HS400 mode. Downgrade to HS200 mode to ensure
stable operation.

Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
Signed-off-by: Tianling Shen <cnsztl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index fafeabe9adf9..5f63f38f7326 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -717,8 +717,7 @@ &sdhci {
 	no-sd;
 	non-removable;
 	max-frequency = <200000000>;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
+	mmc-hs200-1_8v;
 	status = "okay";
 };
 
-- 
2.51.0


