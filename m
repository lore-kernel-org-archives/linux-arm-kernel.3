Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C09BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2mWiXoQDcNyCG/Y7xyEyX/kKrmiQYrpx8gb/fQ9TCTQ=; b=QVbaNS/lUNS/gc8DmkmMFacfeO
	bSRivrBknAyX+fVUxBagP6IJarKfpKijYX6+LqVONJyiKzNYNjdEjnnkX7q4//FelaTFYmL4m2OIy
	pV6nflRjX7Sz07QmTr4mmGmTIgn2RSJRABfu5GomII8VnA59bTA982S0sZGinsg109LABd2lZUnyH
	lekPvALHU2fsuT9nx6pAg9J0RurZutSDQZ1B97qibAW3IBVSy3UMODFdhJAN6zNBigO87WUncglZY
	zrhDY481FTaeyUoHvcV3FR9mg/E2P8bHCwxBDZZ8hFF5m7TU0W8dSahnfv+HuG0BmjUoiMoUV2w4V
	ergBMj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7sR1-0000000BDYN-3w5N;
	Sun, 12 Oct 2025 09:32:11 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7sQz-0000000BDXg-0mv5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 09:32:10 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so5882636a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760261527; x=1760866327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2mWiXoQDcNyCG/Y7xyEyX/kKrmiQYrpx8gb/fQ9TCTQ=;
        b=lezAkIR3gnMr4e+tf44kp/e2txAtRhrNq//N0lDolfEc+bXWuH6mUaoY9+2EVrcg45
         wBGCsY7EyEt4qowTUZ0jhhTDR7uZEwuArOEI6wwZnVOhllG2f97TDUilSJGH6IjAcpFD
         WHpy8IpVBRKWCz231Rm6T5DkYwLVh/yz6NV+63FHNI6CjjuoOjA43pkbfeqkrQKJDQS5
         NHinVrOoXdQ06rv7tFkeAUczXZLeahaGBw1KJBbgM0VNbW06MOOQFh08xOSyd9PE11Z1
         aLaqBqQPmlPcTNzHYVT8VG7ImL4TrrhZ2FyxLCPul/eSPH6uawGWdyyahJXIHxT2ZoA5
         H9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760261527; x=1760866327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mWiXoQDcNyCG/Y7xyEyX/kKrmiQYrpx8gb/fQ9TCTQ=;
        b=vUYkgfFzQuRfvZ4awqlu7idOkXiqB7jLKLHp326DIDfh00jCEZEKx+Jvpw0JN7oPqy
         mrlENZCN3/DP00IC7rdNCLHMj0cNO1z7PmmUM0kKHEHtvbOfzutxr3IREEH1qv0+dHCX
         xWa4qUo0puEQTYCw+wRMwL2mleVQD/1d4Wx8VduY62tUtMVPWbDrPoV5mg4aLCu62TEr
         ciJkGhGHf0HnR2nngt7UrEHL6OdZrQzLr7HYrB3R4YLpr9XZcnhE3c3X/xUOiHwzRuFC
         pgoiCr8NqUGnxgxloM+rUoBO4/NA4mV020iJA0AoQf0qjeZUF77n7iIeGBZRHsecA8J+
         Fvww==
X-Forwarded-Encrypted: i=1; AJvYcCWutdZtelPY/7ILf2TGgt4Z3wZsM/6aEnsXSeRgPw2ZClnGE5IBiPeSaa1o6m/PCyWcFOMKnb4cCmnU5opJaYW/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs+F82v5WU85kiwUZNCFX44JEK4Yb93rhcH3tI5fPfz6UlHLws
	3u5yQm60pBX98MwZZPXe3/G/qpY4G4HVGJcI4DD4VSLXHwlrx4ZfeOvC
X-Gm-Gg: ASbGncu95pje4hkiQ3nMd0si4p0vaK/u+PJHI1Kqi5tylOfXWWqukakCBmcaDFIuAjx
	1G0zHaA2YKY97+cQVQnDTK601tSVPnuwb6rJrfjrAey7OObCSzgodHzYqwSqr7zZyF/d6tC55xx
	ueo7L8El4vfwY2Oqnt0hBmqqu0GBgdO7i10x9vZrOXy0lNMGT5zbtxum1afK5MgbL3bSIvCHJaJ
	RsaTyFma9A7QaFNDDne6xJQmIHu34yvbATvm+kLanmjzR66gxnsyegreNQPpGDZgMuHuyV8vFcW
	JNnNC+d6jwynkEEF8uJideLfGI6wAh0aIcpIeuvrqrqlDPuxV/P/gINrNSkYIbIk6xcV1YqJs3R
	CufIJ/TfBIIwOXlRpqPk5ou9Y7bLTPqoFEhwVYOWcZvbww1ZuaEgChgcAtcYizoaBuerandLddk
	aD
X-Google-Smtp-Source: AGHT+IHAMPc4GhHxYPiu7DN/dGgE3XL8AkmpYnNc4zzqqyTd0Vqq0XFfmmQ8/O+jhhO8SpuritDGUg==
X-Received: by 2002:a05:6402:27cd:b0:63a:35c:6ec4 with SMTP id 4fb4d7f45d1cf-63a035c73cemr10344738a12.21.1760261526877;
        Sun, 12 Oct 2025 02:32:06 -0700 (PDT)
Received: from HomePC (89-67-214-154.dynamic.play.pl. [89.67.214.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c323423sm6331597a12.42.2025.10.12.02.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 02:32:06 -0700 (PDT)
From: Andrey Leonchikov <andreil499@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Andrey Leonchikov <andreil499@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Subject: [PATCH] dt-bindings: arm: rockchip: Fix PCIe power enable pin for BTT CB2 and Pi2
Date: Sun, 12 Oct 2025 11:31:26 +0200
Message-ID: <20251012093135.80395-1-andreil499@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_023209_236300_EEB62AC2 
X-CRM114-Status: GOOD (  10.22  )
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

Fix typo into regulator GPIO definition. With current
definition - PCIe don't up. Valid definition have on
"pinctrl" section, "pcie_drv" (gpio4, RK_PB1).

Signed-off-by: Andrey Leonchikov <andreil499@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index 7f578c50b4ad..f74590af7e33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -120,7 +120,7 @@ vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_pcie";
 		enable-active-high;
-		gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_drv>;
 		regulator-always-on;
-- 
2.51.0


