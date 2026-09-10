Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC72C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 00:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pU/m9vvbGa2axfz6RcaE2ZySRx/aotu9RVJ6XHh13XQ=; b=xVcXGSWG+4YvuYomnVSUnNDNLv
	F90F1FMrtR6UmxhiwPuOuIxzu42W8+HQofQeoU9DkNfvZ0X5UirFzxAD06OnrFgkNOWe5jcOwxnnb
	c2DhmaUz4zaLKLaQFmv3IU6P9zb/nfrnX5XdgYrYfUHnZa6te4C8AJdJVa0J5msbIgLIw9zXE/DGe
	9P7cdB5mdcRR5zF0paBUhUVM4o/xC83ivdIUVhx4zIjy0DkmjWdRZRo+Gllp+tvk55wO0eBo8njKx
	rbSjMQMnG2gt7ekSQ1UFh9CQnk4FPDmDa2ZVppnvyhy7UGegAkKWLoyehwdNmcerlBi05IlSc61Ij
	WaHnM4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4SPM-0000000D7iw-2h2G;
	Thu, 10 Sep 2026 00:12:52 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4SPK-0000000D7iQ-1HOV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 00:12:51 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-398a5aad413so5441769a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999169; x=1789603969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pU/m9vvbGa2axfz6RcaE2ZySRx/aotu9RVJ6XHh13XQ=;
        b=UNwdRZqrFylhWrV0I1RrCu/+pl0Z93Bk8w5MROIrX0p5zq0VZ+dzRb14EkduyJA8xx
         RjT1AvjjXk+d7Cw3Icm1L/oieFX87a0Z9eEJJ4r/9thrJuN37QFZ1XMIGpXFmw+Zznu4
         fDceGvLaWEpVbd3MnUk48o6P3oAwYSE0/xXuZkxRuD5ytBooNbnWp2HTEDjPzXLOEjS5
         npQIz8au5VtwkVfJ6dMQNtwTLRtdq1sHjW5pT63fqmqNOn+egCD29GXaTZekkhifpuJB
         +gNRutHWqDJJQl0j15abVxD877XPSOBuIkyWdu3hs32H3RqXxNS6ck/yrDQd7sLAgv+U
         mdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999169; x=1789603969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pU/m9vvbGa2axfz6RcaE2ZySRx/aotu9RVJ6XHh13XQ=;
        b=doHwdMvb1OihC4kfyIjJ9tlZiKwr6U3dPAzxw3mjiu5kGlhSmItkSX2tr8VSwAr9wx
         agelTkw+bWlJtf/t19gAi4qjdKWDRbtJRlC8Ih0mC2/mLTiZZw0SdHGWxysBMC4K32UQ
         5oyVXhxphRwTV19sqktmsg53YAiCziW469GnqB2ZTgV36Q7qahXSkDgKM7n3qdH07zuJ
         +mi+y+XMu/cewQYVw3XI7xglwLsSlYvezD33FoqncnGemHxk43I+FtlZT5o7hellkr1I
         pgLMSUIEnT/fxDLeYXPteZCOqlkE1aQ3ofWUEoLnc3lvpjXqaY5vbX3wtEFaWUDyqg+K
         UXqw==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0iqZgMXPufnNsFdHjbZXV5DITatSFDFODfgr7M68W0CALnwy/7ODF2DFUrfbDa4kN3viUxph1xvMN8hQk4xj@lists.infradead.org
X-Gm-Message-State: AFuF++l0eIRaO7IMcg8cNS5vsmmO3aVghCIforKc2GrMzW13tgGDV4+1
	mxGwPTwzl80vJA48Q2qued4IiFTKr8bv/BAvPUvZ8CxFm27CEFBsuxfi
X-Gm-Gg: AYBFou2yuHTgZ7HwImpK0nrDtwm4ALufHggbasKkYp93deJYczvgj2roQlEUUJtcYFn
	Uc2mhpqV/+QXZYtbO/yJjBgTUXdjAcZvL8+lnC1ofdx2PM55ToljHpCNMApvIXH1+Nfnz2FUnYY
	xG+npZYeA+RJUxIBeRJwofWhYAR7Q9AQLqTb18FcbVAGpBiq+H47ZnzRcNfxglNpea5nUi5G5op
	hSfEf2BqMer217Jdi4HCbSmELajJPJsJ1lTnsZQQrGDeuk/WdTZ5PjCDAwlu1w2ZtaPq+pOQVrW
	+/JNgyjyPnIvZbmePl0ix9kTUK+UFf2S4fwjALJ52FfIiGi8TfC3Oq9rjHExHoC/HR4Eibgjrh+
	nMC172XANE8deXptcr9HiI2PaSQFM0dLDZfj41d6yg6IPCbNL+goV/WMr61fklLcoQ2XGul/Vk7
	DeTw2zoIHZvfZ/odJqYaYZyx4ow0SyJWnXtzpZvb3vC/HBPpw59SDMf2841o6tcDyZDinqQvDq6
	g1RS6yOtvC77PMZ1ljFWl5anCEH3TS50ACtCyYlnYQMXdCGIiHJfVAtPc4uAJ/MR//4WdEssL8B
	19mEKyWLVKfIFmZkamYlqtXy26JrgBFH72yo7haqcXSjkVlq
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr54698067a91.18.1788999169434;
        Wed, 09 Sep 2026 17:12:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d76aba5d6sm2104566a91.0.2026.09.09.17.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:12:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
Date: Wed,  9 Sep 2026 17:12:47 -0700
Message-ID: <20260910001247.116893-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_171250_352710_26787029 
X-CRM114-Status: GOOD (  10.88  )
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

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47081-asus-rt-n18u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..82f9fb431a92 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -77,3 +86,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


