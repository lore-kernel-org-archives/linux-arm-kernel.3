Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5361C79FB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=; b=Gl54ppvKSbBUQwXErnx81wLY/4
	meKypxj/HhwFU1n1lxrz1S/HrrEnlV+sCKoaa/vf4d2k9c3miceOjtD2xm2BHtAS8tW52wUisIkvj
	HwFhzkHDI0tdeLnNIuQnUSziICVtxh+NDCPRYv0e4lFCepuOLjPoxmeKmsEwksNUXXf6Qb0wg/2dn
	d02vcsLu5ruBTnS0x+JPtIiof+Sq0Rx6nupiP+B44NLOvNlacOGR4udO9G8OO5eVl7JLEXvm1xBNI
	UXqyDo2+3WNUVCy19y86NH5kinLcapWSdaDCS75X6DS1s0OeL8hjQIYaz+CtNbGyuROzCrImh8z2C
	WyPiFP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cck-0000000AxyF-3RWj;
	Wed, 09 Sep 2026 07:21:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cch-0000000Axwm-3Ikv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:21:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso80222945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788938494; x=1789543294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=d0K6YDsWwEd5CeS1V9sfzwjtxULtOq7OckN1BLFdpUmsdzJtqTPRfiFx3D/ZSrHbFe
         0GE+h0NNaLfq68eE0Qk9XdlDgPJstqO/3FDS/qX+nFwHnQX5QUGrUgGHUH/Oi5zjoDBV
         hXjL49U3apw6lsYkPg4aUQaFffPb9d6urFxCOJyzWbR0njdwAh/sYRPWAN5wDffEn8d5
         bIaWL/xlWV6PWSjLYsJ2klQWuyBv53ooarKE1nHucCqQsOINLYxD4t+Lq6dG7jHRXClK
         fkt8umACyu37eJA3wT5SC7NqqVKM67vbUC37EfKsf12Lc8g59jzGtDKcCkPJbwyneTzc
         4D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938494; x=1789543294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=gZY3SP84hWBFBcxAglN7JuATXf4YNjvBXNPTk/nKaLiVfWmoC+pdCQeJBXCcvhFwaN
         U74fKRZXmliTbEbValUZ1ps7le6ZibdDO2bBvF/ISXTuLo2eFoElJILbcK0cS7+/LCtQ
         7Teg00g6PUir4q35SjRIWxH4tkmwpYTZBQN+JaahSf7XmAphh/1BpGyJREzszgHrxCRE
         VqjXw0JJpJj29B/i5P9nKpspg+Q+crJ3LOvy7Jwi/UJWOofPRUASkia6Ue2fA9Nqlj9Y
         y2Pc0IMXe5h+JKR4uVIP2EvRnv5qc4pqnT0LrK+xXsRYoCP7rss409fuHxO4rSWaUEEg
         7DVw==
X-Forwarded-Encrypted: i=1; AKwUvBzpy2IvWeyt2sjRXIbr5IhjNoSz7cMrF/itJHcmOX4P1R/s1rK7VVJb1XN6x79Ep12Xn+cc4C+N6j12NrhwedR1@lists.infradead.org
X-Gm-Message-State: AFuF++kBoUcGaV6l5lwBkY4lEOzLd3e5aYbEbREd3tT5i6b6Hx4NXi7u
	guh0bPOxFq12kDIwSaUvodSB1eXBf7w9PuXBpdIBFtOqmqu0mGEsUVxyI+whjgVl
X-Gm-Gg: AYBFou3/hddstP1IDaTWL4kxsACdHnMJYg+0mUmzxZga9mP6R//5gek+leYYx/PdEHd
	mACXiUPI/l4kUHjbytdT5Beuk4peZRno0zAlNelR9bhUyojbHr1PnzhSkOwcacTUXlYP6i8Nsh8
	GuYE8/1dBD9RMb6A4FHMJ56pE/l/IEnrhvQYG35qXfboUnqrqNII5slBHUFugU3LENxoyaoBwvi
	CG73OGb3lgknjXZ7tUVOhQv3RODbgXzuEWJSYBoI1JkIqmPm9LivX9oSzfKof/IwRi3M6HapNVg
	5ywHspDQlmnf5xr4Y/1LUa7sRCES6ZtpsHbFLtR+mbhBeQGxBdqM42EeCL9SQnNdwhMPO9FAyVp
	9CxIN8knkDPuBIT/092VhixtdAeP1f/HPR0DbKqBLbA+WXqrlBhcpeVMf/jQ6igwaUE11YaiCPY
	Q1eKzM++4Vr4+0ZDcfwXSvJK346ocX0Qu3LWKlMGZeOXP1r57mZgVccti7laWPp5oAkPw=
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr325233275e9.27.1788938493693;
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm46703902f8f.25.2026.09.09.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Wed,  9 Sep 2026 09:20:14 +0200
Message-ID: <20260909072051.4627-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_002135_853394_9ABF14FD 
X-CRM114-Status: GOOD (  13.28  )
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

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..596f673a0d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -95,7 +95,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-- 
2.43.0


