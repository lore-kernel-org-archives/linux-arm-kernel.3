Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86E1CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=; b=YEGVKQAze8ip5oro5WJedeEA9/
	kR6K3F2ihyK65WRiy/7aTI/32HfDXkkAv7avsp8sVueGAIJhuyxXPFgbRTJeNmx77J4xC7MsFMhIa
	CfwAyF5bmbg9a/wPvde7H5S1j+QNCVQNtzSrKN0XjbmO1QlZgd70Wu5RPmD1+HAT4raKSX13fzCEM
	D5uA3O2EFP9XlD1Z1RjtktCKwQQ9wn4Z+EnD4A0zHuQk9xotg0kbaJaMqwtakGEuF+O4iPXtWxg9W
	l5rolsZ5P5iUtcw1fcX4tRcGFvniSpgG+j6WeT3JjN3rVL5DG18FJzr8SBPHfNrgUwc1rT0r3xhdg
	PHU4lm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUF8-000000064DE-3FRo;
	Sun, 18 Oct 2026 17:00:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUF6-000000064Cr-268a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 17:00:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48b001cd92bso692830f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342814; x=1792947614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=Jb9p3k+iE7wg1RifJGCgvqyWeO+1X08VxKcFn0CVREUjeDS2uWBR2eDjwDszW/PJUA
         Ql7MCZJPcef8AMR4+Xec6wGQcnzHOV/B+MO9C7/tU8eoqiOXClMXmy28YTqe+5/mWH5h
         hQj/jtUDqtvwxh8IvVO4wCVCETowht7wkacrNAHBpHzxZTKpi+7bUwZWoANXjj7C8zyP
         xP76/Tsd+P+23teHWthq9CKhpVK+4pE8tahcMFrmncf643sxjs9M/nlUvgKMbfacc5TM
         4scKPF0KD6GOVuDxTpWDr1CFbomVdwecNKRWsWIGq8idE7tIb2NJ0Kby9yRgLsfEfAbU
         XW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342814; x=1792947614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=h7BGneP9YVrQprQ9piU4onJTIBBG4SHJr1E69MAVvcQeZ7esGERr1XJVGLYR8I6P5X
         IEW/+43QDJi4lxJf0k88xbCSEBp0RZCtwgDxQKVPvPapcqPK2NgCc5G+ruYKoZD90HNF
         TY17I4uNTEr09rSxUToWlYOZceunbza3Wn6OhScpdFn/asH+rVdNAMFjXd5wBrAdVIFe
         KqIw0/a/mCwvgUxfPm+i4YO6eXVwITW3kvltoTyAwGcrDfbWZ5pB9w2hKM/WEsu8R5q+
         cs12OsGwZKYT900UnnDy9UKc7SlNH8frxpWnfFi4ZlTZkrWkde8iCjXR06Tl2fhu+sMP
         Uk+w==
X-Forwarded-Encrypted: i=1; AKwUvBxC3DXh0SloxwKXY3e7TeqTiITzmcEu5T222KLWn3c+/3VlxxEGIWbJ00QCiSXZnfuzlAn288ZImrX0SRgH2wYF@lists.infradead.org
X-Gm-Message-State: AFq9FYLluyt8aU6PIZJXiB5AkTQSUVCvGze8XIwSeQdKVpvhLWbUqht7
	waqknsSspLLeEPhXDTxdgfcW3Fa+Qs9Da4+cudc+ON9LkazivMqKu1E7
X-Gm-Gg: AYBFou3PlYoX7BhCMewJHrTTbTwsq3LcFtlWBgbPPx9SrgpvCinuWDVcI7wDBAmrCT2
	2pBHgJDGS2W3PJ95PXcFg2LgkJF9uf6ONvzdzOrHiFvmsMGbqSXhZglEkWk6btss8B/n6o00EeU
	e993x61vx1USXel1NZ4q/tiOl9yyNGGxo6xiID3/EUMbGXCWVCkI3m2BjdG4yY3NI7dvy1kwDCv
	dnC9hHB9xGDmOf6pF2Dnkn8/0Lb6Txqn6fLLq801dIqw3FzBotxX6Vxjh9n0E0aYZ6Q9fRpa1qw
	SnGN+6wLaaa19VT9QIMwDZ2rypWWGNqu6kYgqD00YDQ5cv0dJzzFpBR3JADBwujIAkgzarb5Gbq
	caPwIkbhkyAqIanax4ZR/c+5UjBkgdU+6LRYvHCFutYqACI7ItTjHrv0ri0m+xrm/FGt95RuP0L
	+8To7yvyo5kg6muLJbcM0fE9jrLiEeuI+fAofkUWdi8rnno+v4pZ+sspGGUdOEEwUNtUXszDMlx
	/h3/LLPO11pFNkEMm/r8YFtWgxuwotUgdON3LmRrmTyhgCC9W7br2U6okjhzNfw41MEayDuCt6j
	HWEh5VGbxaDOHFgKhlzxIfo=
X-Received: by 2002:a5d:4390:0:b0:48d:f025:110d with SMTP id ffacd0b85a97d-48e07fa9d49mr7744225f8f.43.1792342813663;
        Sun, 18 Oct 2026 10:00:13 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm19744454f8f.27.2026.10.18.10.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:00:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: fix touchscreen IRQ trigger
Date: Sun, 18 Oct 2026 19:00:07 +0200
Message-ID: <20261018170007.38381-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_100016_616637_37EA61C5 
X-CRM114-Status: GOOD (  11.84  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The touchscreen interrupt is configured as level-high, causing a
pending wakeup that prevents Symphony from entering suspend.

Change the interrupt to falling-edge so the board can suspend
with touchscreen wakeup enabled.

Fixes: 5f67317bd967 ("arm64: dts: imx8mm: correct interrupt flags")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fd0a1862ce90..5a60430eb96a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -192,7 +192,7 @@ ft5x06_ts: touchscreen@38 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_captouch>;
 		interrupt-parent = <&gpio5>;
-		interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
-- 
2.47.3


