Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD77DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=; b=spohSUVGrlsFqfUwkxRYOdbzqa
	UiEiQU/6c+/d9Y4vLKs8+e6+bceatJ5Eb5JaHC0HLett55+PCuouFWtzfaPwfUmcy+qZhkbZgOsZZ
	/6U8m9/xAhV7JW/7BDP6JiFuRuZHmHNlOREYK7PS+mXG0IVmHypyHVDeBkwlh8edmZxr3VwCOQWaU
	1smpqx9x8VY74WY0bmzCr3+s9QspAvzrmJ63DfNmkTeyzqn4oUPPDdZ42KNA9RP36ZCrwTjD1x/O+
	y7S/dmy2e/22YfKhtWGGsFjON7iChNnIU/b72o+gQGwedlIXcc/oAecMc2E4tYyVN80INPNFSmSLG
	HXy6sW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnm-0000000FrH3-3zOP;
	Tue, 05 May 2026 10:14:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnm-0000000FrFa-0UlV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=; b=ZYoBbzFIUF0KjwxreHXRSyIeiT
	5Af9/BqrTEqtA5cTCf9UjYpOveA1jtGqg2rQuUqYE4tie0Xoxd+UqZR331kXiHrIh7SLmAtLAJGwl
	GsMzgFNT5lPGoTU3wFMQKD+gYfA/OnY0bJDUK9ZQBRZ2x8XsDryS1S8PAiaNMoB0SAlQ5nOzUhvFI
	Z4Kuet7PqO+Pd0iWFnROLEBhPLBp5sNzhAy3PrpZT2xmclnOutwvsWoXHPm30iZIUQhLYmdj8MHtL
	J8ioYSk7YMfZApijNvFXGvxo2XSurHPT6/iNc7EJq2CxVDLksgF+9yU/XMRCv7nNM5xjUWMRhNTkO
	w7E+Yl3w==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCng-0000000D9aB-3ayq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-83975e992e1so208155b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976085; x=1778580885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=;
        b=F8UGN0DAwZnUHS+czCFBQR9YUbSIvWuU2eb7AaJm49eqnKks/sriol41rw74ZXx235
         5CSgUGV1lK8WxRQ9/mFknLFmEZpFo8NFi+hQW/QnscKMDZ/b0FVnPrLxedWC8gSEZslU
         /bxxByTwSsp0tOgfsVPOSpwhjalFGLsJZ6Vuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976085; x=1778580885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KiZn9yahVCKfivdy6D+vGj6i1ru0Ro/xrrS9779vU3o=;
        b=ST+e6A9a/nSNKQOr+caNtkqx9GHLG2SGNd5wwhyx8STGPwTn98dXtj5kahKzHQjg++
         397PBGwFqrMy5i9evqmqHxz92XFCokkuj5/Z5idbhdjVV2W1/Fmq4XBxOz3REUVBiyUL
         nc3kyzUqs8wa523EKckbF7GEuHa5Fkn3WU8Sy3Fuw5XwT2Wil2zw3xL1tLyCDBFhhYEP
         rhtvg/jHaREDCJDtNvobK2+2tNzf2plRxc11Z9BiqFn10yB4FOgzYAP2pa1INRxWwzj9
         pnwQoXJBnkFgIlt8MIQPMqfrmaavz9JW8li4axEXQ08f1WFBJ2TGryBVx4FMh4Rq+3Ta
         SDZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0XeqgZ2NiXmRG28r+QXl+K8log7GfJwgcNhKmOGZJwpdKP53WCn0JXyE2Z46TL/62dsuQR3WqLWkmDAs4c6tN@lists.infradead.org
X-Gm-Message-State: AOJu0YyScNZym/hqJIoEB2yGe5YOM2jIG+J4GVsWj6d6x8I1g+se6/EI
	KGYOr+2CDvy08Iao4RtfpDB1UxARgfcQ8Pk3OnmCPWoH0JSwiTtcNSFQqClH4X4DSg==
X-Gm-Gg: AeBDiev5K3BYDMDduu3nCZs+J0sXPxavvYfJhdVoCb7WQ5JtT8e5OgAaR8vN1IzMUMD
	7Kw3qCymrQWpalPzWKJ44RaqnPoKLiKdoPP6cBGMcSmnbKHxhrHtZ/u2T3UATGdYD1QBdvdNDRW
	Usww4JjAbeTqag+4z9QQB4WuaxUR/Zblzpl/bEgiq+LkPtWE+R/wt05G4HZ14a3xOCtZCRKHdBn
	GnL66wK0WkUdHuRt5qOGQAUxnIplsBedgntEgWWt2DzSNip7ga1QY5KiI8SzoBDVaFclsitRgp6
	6t5n4+dQP5B9NkApm5HPoPpJqJO0maPCJENaYj9pAWXIdDK1Ng4dKSfSQUZhSalPhHFgYbVMaTR
	kzfNvs29DTmFPo6s+UurK41mlTaxyUye0W1R2tS/FJg0yjsWLhBhjI49lNMdUaB1mRdZ89eWWY6
	4oPPp/phRvHjccXjM8IzcsddsH42hf3CwElo579B0DKcPHFBF3rdJZgKc26+fiWe9eJ5Af5133Y
	gP8ROyAnYkiFhslg2u+dUKs/F3aBw==
X-Received: by 2002:a05:6a00:391a:b0:838:a46:ce96 with SMTP id d2e1a72fcca58-83923d96a0emr2448390b3a.27.1777976085583;
        Tue, 05 May 2026 03:14:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/16] arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:13:59 +0800
Message-ID: <20260505101408.1796563-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111449_740616_975325A0 
X-CRM114-Status: GOOD (  11.08  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f1ff64a84267..0b9fedac842c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1312,6 +1312,23 @@ pins-report-sw {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_z2>;
+	vsys-vcore-supply = <&pp4200_z2>;
+	vsys-vgpu11-supply = <&pp4200_z2>;
+	vsys-vgpu12-supply = <&pp4200_z2>;
+	vsys-vpa-supply = <&pp4200_z2>;
+	vsys-vproc1-supply = <&pp4200_z2>;
+	vsys-vproc2-supply = <&pp4200_z2>;
+	vsys-vpu-supply = <&pp4200_z2>;
+	vsys-vs1-supply = <&pp4200_z2>;
+	vsys-vs2-supply = <&pp4200_z2>;
+	vsys-vmodem-supply = <&pp4200_z2>;
+	vsys-ldo1-supply = <&pp4200_z2>;
+	vsys-ldo2-supply = <&pp4200_z2>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &scp {
-- 
2.54.0.545.g6539524ca2-goog


