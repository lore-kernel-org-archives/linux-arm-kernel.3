Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3B9C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWSrZ7MoIPETCcOnlwZzNW8Pica/y+0lnik37Sdi1T4=; b=2AhSeHSx77VTzJmwGXz8OWoo+H
	XxzRFtoNJ1/Pz0sWJnnNgG2UCzIp3PeaMx74GC80B6+ZcuPbY0k4FmziTZQfrwJTSlZtscWUGBFZV
	SG3MdNyVIs8CbWJqnXB8KF9hiNsMswXhxj4u+ule5rw7anwiAylKVzw710Knsb4dbYbuDGeQrNtQn
	VCHW6O+KN2fRxVSDdFpybaIPXhoyhv+0QwTIJuwcwi7nT5kfQ2H7gDvDpbX9Ju5sVMedqLNTHNKLS
	8IIYGIM6yC3eqFXEn2NGQCEAmKBANH7tAwyywUNq2lReeM/WQXc/YETVTgcJHD3wQwIT6Na2bT0zw
	iRgJLfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpku-00000007FTS-43hM;
	Wed, 02 Jul 2025 05:11:36 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpe1-00000007ERX-1pYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:04:30 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3121aed2435so5934994a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432669; x=1752037469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWSrZ7MoIPETCcOnlwZzNW8Pica/y+0lnik37Sdi1T4=;
        b=Mm00er6a7oL4MBbgui4fvZvzGaYIncx2BSwy0P60ct/NLzHdQyxCux1NCl1AGcBmdy
         hVaIVDniSTFncLkP/hqwy7iSUteaZFrlm/QXm9uFqA9v2e4IG8+LRebaxWxGBRyTT1Ws
         XPE6wGvn+Vd95O5SdOnl4OyzzPz5ABwIuFqq3Eso+Hsiq8KguG08Ruk+Lfn8cbBJfTb3
         8yDDwbtf2t07x94WbVshY8YzK6LuIkmfY2H5PH7FlfQ6wmaelU/fWA384acDLB11jJa8
         wUCDUCV/G4rf/GGBnT8jy7jmd8/3FszsgngoMl0Powo5eqlLjpe1r2lN4t2Q3QZykUrL
         175w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432669; x=1752037469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWSrZ7MoIPETCcOnlwZzNW8Pica/y+0lnik37Sdi1T4=;
        b=NkdcbIKL4d14rPIg1VI8L3IHlvpDwG1YDWB9CO45JWQ4wtbOuIyFfdP868Tpo5gA3F
         edbZxHH3Z8pHe2JLz7h21cU+N6u+QfcuAtRMpK1ysCOHn4o89lyuHFDuMWG1UgHx8+KQ
         GWZM4K1yK9mC2pTIzjCF3FelqOkVHP4VLvx5/7SDLBijQK+WOYXOq3apMF/s//1vs3O9
         NzyWK52/yAGFxJ/9jcbi6KNzmLUzNRfCGFFDRmjhFZuA8qoy01/sbt/SC3QWMeCMTY1Z
         ybB4i8V9jWT05jZmAon9G1i32R6nVRd2L99MBxhjf+K8BX1HKkALuYRRfQOa0NhfnqSu
         5J9w==
X-Forwarded-Encrypted: i=1; AJvYcCV5Xf3R38HeJ0ybZ6+oP5BOGggrweafyIX70iB/HgE2Q8ZJCiW/E8wRCbWhOIxgmOVuNIGLGgwbdsd/flmUs7rM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3SGSS5D/PbiCOcfKS0BkYMz/+5iafNIsDYjIARpZCGLwOmWtr
	Tx8gYeQB4lmClkdxKmF24mTUnjpTvSAZzLhAUJ0f0w1rEeFgfMI7UV00
X-Gm-Gg: ASbGncsJSKo5BKFu/TAmh6Lc9ePCYWp5XOjiUB+7blBMBwYQr7SB7qeDcJnvp28Ly0b
	AmfeZL+4JyqBmfp0HFfnhmCDUywaqeE68R9Dw5b4QrOhK8H9Q1yLAExoPp9NjC0Gp1G/G6RI2BS
	TKn7PS91Ks1PfGpCK59oxGnyNve4NKEBEH7QsLPc8oWYHwqKLy4hM5STDoM73YP6bcsEZPyBaxR
	jmySB9OyasAlDNpB++wX30oU0tYuScGIDtOQTmP8kJ9iSosCzkdn7/3i2La0JjW9YNexdfIjCwk
	YliESCipzU+skUdCmibjcAkDRK9fH24gqtDDfQVbGIzX2gsHtYA8NyO7ec24WsW9lA4N+JabNWh
	OZbSI9Z3X9iGFYl1tbYdSznXhBu97xP3+8HxxoqY=
X-Google-Smtp-Source: AGHT+IGuJYvsdkS94RVkJwX3+DQ9VYFkHN7fl6zwMk3S0tAKLSb9AffKnRoc93xoFKLH+aUzWSJPCA==
X-Received: by 2002:a17:90b:224d:b0:311:ad7f:329f with SMTP id 98e67ed59e1d1-31a90c08804mr2307161a91.31.1751432668615;
        Tue, 01 Jul 2025 22:04:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:28 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 2/5] ARM: dts: aspeed: Remove eMMC from ast2600-facebook-netbmc-common.dtsi
Date: Tue,  1 Jul 2025 22:04:13 -0700
Message-ID: <20250702050421.13729-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220429_474791_6BBE4210 
X-CRM114-Status: GOOD (  10.65  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Remove eMMC device entries from ast2600-facebook-netbmc-common.dtsi
because eMMC will be removed from future Meta/Facebook AST2600 network
OpenBMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi   | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 00e5887c926f..83c9789d45b1 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -152,18 +152,6 @@ &vhub {
 	status = "okay";
 };
 
-&emmc_controller {
-	status = "okay";
-};
-
-&emmc {
-	status = "okay";
-
-	non-removable;
-	max-frequency = <25000000>;
-	bus-width = <4>;
-};
-
 &rtc {
 	status = "okay";
 };
-- 
2.47.1


