Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F516C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wR8+vVM1L2fpbFVOZYNJRkYYqPhCGHqA1jwt2SE8NKQ=; b=jrLVFfqfetscKkJSI5XMm3zkfB
	zp1OSHABGI3zog39/MUJWq84jSp8dl5JrbvvIoLEHqb/BLVWVuOixdFykHP7EYO+PbWPjqcjk62Ip
	YtmCnAuCPJQvbtgXlJHKtCP1tsV1HoAQxjiVVwGi7oZZQn2W7oLz1qjF4PfWBa6hhvHj/AF9s8+lk
	b4OCw67Sr8PHMzaQum7oVYhXojoHln4O6MBx2zMA5N5ivS4/n6bzLgGVMGwHLGYG3+x31GniXNAo5
	b7/6vIM1X75PQtTzO/FHIdMhwrywyjn9wdrYMI5pZQDQd8vaL3F2NvWgWEyLgc31Ig6/WSpLiH0EG
	OSIWKwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BXx-0000000AfgW-281r;
	Mon, 31 Aug 2026 23:36:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BXu-0000000Affm-2Z9s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:36:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so3191519a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219370; x=1788824170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wR8+vVM1L2fpbFVOZYNJRkYYqPhCGHqA1jwt2SE8NKQ=;
        b=JFMfH95MOfZJ/poJq8+Ghlx8VTDI9UNTFMuZF+b9jVyHzq9vIEWkLdG5y3FAErP1w/
         AS4Ee9cGP+yzUcHw2cIF+0aDR5xbzAaDT3WqWFtsbb5OgCy0UftBsFqNHqdIJquv0SLZ
         OW82fsy7TZNPHSv4ilGhOklYLka8iM4276qOazWjmo1eWUssQgnbcbfp5LsZ8MeAulTX
         yvTBM0NaNJgr+3HndVHiFRWZ6TC9Xkfo0ZCgFESiSWO/qfAYz9XQViEsYYOaNPmMQr1L
         flpZjDsyP5NhjNDTb3ikoD3gSZK6gk/uHtR7LoxDPSxpHjthAw6sENHCrwdV8eh598BF
         HHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219370; x=1788824170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR8+vVM1L2fpbFVOZYNJRkYYqPhCGHqA1jwt2SE8NKQ=;
        b=g+s+3OdOOrbhlD3xoQ9XALMh1cLANMbto2FW5jYkD9m0v7eR0UPkBzMq3J8jK2dNah
         DDclrMJZcNUwQ3ewPnnJuw3+3YrO8Y8R8vZcMwcqVzOML3+zTbKiSYIDgAZ7OwclTaJC
         +WkfeedWAkwdYZu24L4WTbTyMyqIdczsMFf5LyoA7G60io921YAu6D91+TXOI+IB8IaZ
         Td1JMmaJ4Saw3HudpkgDgjs+U5m6OoA5oKSbqJ5rqP6rnW8csuCSI4WdmcuIJQpSaXFj
         uLp7K/SouQ77OQN1kNKKuUDK4YYUkJxFhoVPaKb3/h+mHbANXjFKYtr/D3VR8WeK8SN7
         cFGw==
X-Forwarded-Encrypted: i=1; AKwUvBxiBRtl8guVs9U9IkE21EZUvl+xMnKjkVCbyIsspziO5eTaEmu1ExEy2p0vX2xLLO70fM46NmPD8fVz1Mz3n1Js@lists.infradead.org
X-Gm-Message-State: AFuF++mfh8aUkvOOO9dz8zGatBzWw+Z3Y7FNCST1cficquCZJje1wJ+R
	n+Wh4yobQVBYhPrTNp9tioPGWLSBX3IDSoGiD3X30FsVotBoMFi25Z9G
X-Gm-Gg: AYBFou1BNKamgzeIc8e6E+B3LhwxRWLBnga1GLWqNDONLEeC99vqtTJAyFHgmHhBRfS
	WaidHN4g4U8LVJ7mEttDexB+iakfVeP2FglRW6QExz8xAQqrkbV/6GPaMIZNkS3k14PyqXamJ80
	t1+30NisIZwT24P1DvmnpSwCVL7AAYnyM7hBJeAddLPyyUZfpyDIsZeOM9qODP1WGM9jIFpykrg
	sbseXZvbWAcVdOmI8rNjE7NYWeboE576/4i/wib4oqldZx/Ao3Vh9EnL0HnG23YGm1bUKSZMyIS
	/nWba0aAmh9uQo12emTALP57AfQEUhgMfKEH+c6t6NFZWThiNfscwNpyL+6Gp8bgOagGqpWjfoH
	8Zo+kUgnRpdrVm+3pc0cVY/sG+ObrUKdtO+I2cmGO2DeNLIUXZegjRmQx+1toW4ArWT3C7ApSBl
	1P/UJ+5hrB/ZyRHGwvl2HE2oN1b9r3cnGWUkrn0ysmNBuPXsEa7jAUO7xIvAAZ/Gy+wNWXv1CYh
	eT3iKkpFIkFaBhtE4YOCNAem6fYsOMWwVDawjkMgVCDW70optRMW0zcZ1wW7peTf9IVXvI19XnJ
	o4aY1D9ffET3TR89KKjRbdSUBkZBPK0O37GiaplkjSELq+eB
X-Received: by 2002:a17:90b:54c5:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-396d0e5ccc7mr47398358a91.3.1788219369668;
        Mon, 31 Aug 2026 16:36:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4a1732sm1992599a91.7.2026.08.31.16.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: use national,lm75 compatible
Date: Mon, 31 Aug 2026 16:36:07 -0700
Message-ID: <20260831233607.13729-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163610_656006_E633DFE5 
X-CRM114-Status: GOOD (  12.96  )
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

The temp@4c node uses "ti,lm75", which no binding covers and which
dtbs_check rejects:

  temp@4c: failed to match any schema with compatible: ['ti,lm75']

The LM75 was originally a National Semiconductor part (now owned by
TI) and the lm75 driver binds it via the matching "national,lm75"
entry. Use the documented compatible; no functional change. The i2c name
fallback ends up binding it.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 548fb92ca811..39b2d4fa742c 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -200,7 +200,7 @@ usb3-ilimit-hog {
 				};
 
 				temp_sensor: temp@4c {
-					compatible = "ti,lm75";
+					compatible = "national,lm75";
 					reg = <0x4c>;
 					vs-supply = <&reg_3p3v>;
 				};
-- 
2.55.0


