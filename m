Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD9C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=; b=PaYzLjrdrIJQXobgwkMuIUUuYr
	dg5syBbOxphydR9U/8oC9u/yJrVq7E0V0jfhLdyvsGO+x5JWbCGl77rjc8aG3bzR6BftMx7bJIII4
	ZBp35CiIL0a7zp8mrdO1PLlctf4SooXwQKxTl1nWxWFZgbmi3d+R/ZxzHpaTZ8pDy2zivu3o5qA3L
	kQ546jmVugjC5aVZQxkjq340sVcD7lxCoqwP/9VYx6FKFO0O30RGp0pVfQpGNV1s5l5WPlH+cWEnS
	whe9BI+OKbAcAk+c+h0tkw6Ia6bYxRbFeMaingX1fJ6CcJcieGcPNySxbBfXwobCix2ZeadvqmhWU
	XkmZ4YCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZN1-00000006vnJ-3fbY;
	Mon, 07 Sep 2026 13:26:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMx-00000006vjO-2ZcK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 13:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=; b=ZUmmnEDCUTaH5zfC7p5bP+R873
	q8nQcKBWqAcclO3PMbM03uhnlAUp+fyD61WJhpTO+oxDV569HNtwPo0IS8YXa6l4mY24x+seuRovQ
	TjV6XDcRd7v5ZNE9loUO+a2wenoi7hMD6gBpqMblt9u7HZ0U7UREdpxaG+8HS6dIXHYEiWmEYoFRT
	omVEh5z6URXHSS/ZLbt1ZgmCzic9MD10zs10dWaPOHaExGC5slJavTFzoI/9rpdcW9NAmerJBnHYn
	hYP6gTIe8IgvD3eWnnXBZ0sKvnCoT//qhGSem/uNvYvY/v/LTb6yy+OFhOOMgDwyJUaDTrVjGgcTs
	9ELxRomQ==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ZMu-0000000GHC3-0RZ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:26:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c2533d83e3bso593486066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787599; x=1789392399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=;
        b=kMxw1kSunu4KeVgZ1O1prIEmL+Aj5WFAqWXOzM3VECvKPbMFCn2qnqqXQl6hoBW53o
         8QwTt40JLgcZyEwJU+IcXYNbs1V9r+guLPt2NpeBUKnCNnREZbhdaaFo3tRSMeH1hHWF
         fYyImKB+uk3FCsHbQ726JddBiEyh6mHrzMTrn8i3aDfmw3vNh7BkgZD5jkBBn/RcHplN
         jQrHRbVwhhW5KrTJKxhvopaTSr8Zan896JcWvTcJ55l3oKh/vkSSeHQCNqRM8KEmTrrW
         jkg6T/8pZHwkxpqxslHJjIgJZItqFavAkYyQZVGcBeLRv2JJCq0dBKepAd3Hmanepi1W
         MgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787599; x=1789392399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=;
        b=GIOrSw1iLAW1MM+7GveBzZpHsUXAGOS4E/A01leuJo7uPjK0I9a7ODZthw5lPMjXC0
         hXyk1ALvqT6PuA7SiQRWcHtPUQTRsaHW7PPGKhQxYscz1I1x1cOpU1w600d3459aOOmO
         ndMKG/32Y2qtXtXxb4u+MmODrXuMkQ5RN/MIdSwdFGYlYH12NE1Egx861xdaNnxunPMl
         kmBMwLS1hRMJ7T64ZyGGyqoVHLrlcxw4d1uMDzqsh9j8QkFmHchaUFtrfmnoFam7vtE6
         Y3Zbn9uGwiMNc9DvrULoMHZkgaX53aVFwsEl6/jhtAZCVig6BrlBuhi5cnvv4av4Cq2H
         qf+g==
X-Forwarded-Encrypted: i=1; AKwUvBz7HHxZo6hWZ+icloBQ+CUqWDfTYpUqJeAFv2E3VcbWcBZbIq7S6JsWAynA56Vk+Tpmo2avEQ5gPSyYH7j8G+36@lists.infradead.org
X-Gm-Message-State: AFuF++npIZQEcrzJjsb6Evn7jXzv08ocARIft4tRg5t3ulgVVHHLCl6s
	C6Qb8Lz/kXy4e+Ap/85EdDSKGozWn95dX0vO495oQCpbM1YcGzQWnCjjnVq8kNh/6mA=
X-Gm-Gg: AYBFou1OACa7RZ9U1s9AgJj1NguCROa8CE9TKpZM2cF4Vosv/4zMMBFvqydpvQ6fkuJ
	7gF6LHdfTDyvplHM3N6I5vfVIk8QJuuRTCQSzCD18UFyH4grlWjNHen+eG0qhMKz/COY7rxcjCv
	k4eUJ5wuyCPLItYTLCdMf/AOtY3K6tGDDB921J4h2lHg7Pq4aC3rwKk8L9GiBRmVPWNPXhyKwZG
	NY81AB7kAshTy7+6ORUUqusY+jrnBPQMMLJd0HMOXCbRZhRKsk6e6uA8AgCNxSoKHqlk8zRHAch
	UunBz6RxXsuVmtjrG1OJG/hIB4gO1RnnfduF9SQqK2hHqFvZerFlJPvy2AEGhHI67bBwa2iYAF9
	LSNmTHyOgs1sSGCSGKk8c43FKodSbr/u2DJ/r7wEO3Dc/h1Y66/MwShQr3tXHAcw9bN20tdsAMm
	dM2yjvP6r2NAo59VS8xpACQg6WRPRBlPz0BqkrnkhJ7nYbBxtcNqO4E1G/CIk73zFTjZD42h/xg
	Xzzt6arcXyiEyNPDW62JtiJoPmWfI7Vtj7mFfEzQrgRWNsnIXyPQQWtcvpUf1J79Nv6J93xmcx3
	q8nu7kId04FL5BM/3FXP2sWEyfG73hGhFvllyQ==
X-Received: by 2002:a17:907:3f24:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c260c9f0348mr1521074566b.10.1788787598895;
        Mon, 07 Sep 2026 06:26:38 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:38 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 6/6] arm64: dts: microchip: ev23x71a: enable eMMC
Date: Mon,  7 Sep 2026 15:25:34 +0200
Message-ID: <20260907132617.1198548-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_142640_349811_E8161030 
X-CRM114-Status: GOOD (  10.15  )
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

Enable the non-removable eMMC connected to SDMMC0. Configure its 8-bit bus
for 1.8 V DDR operation.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Remove the unnecessary maximum-frequency property.
* Expand the commit description.

 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 985ca31e74e7..89a161b87d6f 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -478,6 +478,16 @@ flash@0 {
 	};
 };
 
+&sdmmc0 {
+	pinctrl-0 = <&emmc_sd_pins>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	non-removable;
+	disable-wp;
+	status = "okay";
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0

