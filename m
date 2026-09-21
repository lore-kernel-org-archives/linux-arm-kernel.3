Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B10FC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3NigTRFcQ6QJySBv0y+v19B6xVRqekP4D+8Fd4im1Q=; b=Dv75AIuTXJrOygSy4TllHcuH9o
	3ode/xEdTLnU114rUdsxiOulswspS0v0Qb3fj1o7EmNht1i4IZEOls6YytlYRp7dj1LsERwiWiKt3
	8C9+1y7Xz09g/EevYuRRYCQc5CZK0mignlcxrElqWlhojy3m+NYV0CNrGA9R6mr46cxKoI5oyJbia
	J1FOqZcjY7mc9GBhwMb0en2TptM4vopJGOQej83gxV0bXtoKBCtbfqGpvLJtOSc2FcBLMBT0bFerC
	9nXyCBtFIaegsO0ebj9c4bVT27ilUhv5EprF0PLsEn0DyXDpWWzsDUyCwYHJx55AvCr7A6SS23Fhh
	kVm+b6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xc1-000000011sc-3UYC;
	Mon, 21 Sep 2026 06:34:49 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xbw-000000011o7-03SN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:34:45 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2db1ca06a25so17133285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789972483; x=1790577283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3NigTRFcQ6QJySBv0y+v19B6xVRqekP4D+8Fd4im1Q=;
        b=NWE1ZGMRXKdK2tBGHx0j8LfQg8tsi5oO5Fxalp5eu8+M3XYayb+PbIyWbzcdMZqWNb
         OSFg4mYNKG0G7n8GzgtWGkccJEqNKfCcB036WsLAL4IifpcCDv/dPxtJpHuLmpYPdHwz
         DPuXgDXymp0tpdxXnTTEKz1tXaZMNEXvsmN+mGse6hkWxISgayOtufKQWgj1AVmYK7CF
         J90f47W2211MtyVEewEI+4zCOpP7ZaFfLDgIsEw+yxOOtoG7z5co+Mde1Lo1FmgEW8WS
         MzsCiZ/nolt4ZiGFDmityt2C0iA7yNS24RWhifM8nBT36Iipk8wxNH717vpLvJsmkdhh
         6XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972483; x=1790577283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3NigTRFcQ6QJySBv0y+v19B6xVRqekP4D+8Fd4im1Q=;
        b=ec1554yWWp+161nqTvOE+EptS1bAXfE87VAkH3vb5MiFuB8KVjl5q5r9Z0gIA124fk
         lRghINlv/J3V2jW6uda5z8Pg8y96gTqG4aYaOFmYH4HO2h/nmfgUbBPY1x1RK580v1xv
         WdT+hqNCGZujhty1SZkhc8pNU0z1/w6/lkvKU0sHkEQHgqjd4JF8uAygNGzK8i7bA/rf
         jwWkJ/H5GiGslWFJU2kcJ3C+bAn5h0BwVC5c4lwxc29a6qDzfYQex/PuyDKamQJRtsYc
         NOfjva/PQjJKFbArMyPNaDNO3zfqodwK/GtBeMask042q0JV/MbqsbCf2hTeFROjFyTw
         epKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2G+PwPrJ06fFiQlcvPeMpzpP60BJtpMcZbmtNXrJAripp2ZFbZGOvRQ6Z0s+c529s169xFZKfk/KJgtPQsKig@lists.infradead.org
X-Gm-Message-State: AFuF++ku95Mx/KDrsHMkgE/IKyYVf6ChxqqLrZGgaOI9h1J9lOon6uuM
	P2ee4jvXkTLhIGauoKcFy2BrmgBMmXu7sWR4CMFl6LnLvDAa7Do1EoKq
X-Gm-Gg: AYBFou1OGrMLjQbUJ5az+C953E/vmY2bghNviHWmzXKmBbC5ZXJIUEU6HqTQRPjSA+2
	wwgRny+aSm88SbISq4BtEMX0DwGDT/IHjuQImk8KOHuAYpnQOmxPuiUYAdZ6nik6pWSX8fkl7bH
	b1IAlyAX9IgivYGL41DjrWuPGeajy0GQ6o7z9onSb7sivTFE9bCG2ajs/0kOzjQ2Tnpo22KL+WR
	yT3GkVyD3mLtS7vwj6YzgfoOZx4FJ6HKMBNrd+DcAuKygN2ENMovfZ2weUMWWFcFggLpaZo8czW
	1obnbD/7T5JM82X9pzYL3Mx9CE1zxJ6SOt+c6gP1qkDXLir27vKGj4RYNo2HAgKPK3O/tvpQDO0
	weTP0t7v1QsX61UDH1Ca1K5sa4lUSpx+dF4jSthwGirGVPOy6k0/484slG+aT+uAhh67Cs5F2dF
	aHatxaTcbh5/6ZRt82VIwflNB2lM3gG0sKssTZLFGO/lSoVSmKF4CXvJXtMcnZE98SPXufHVKqI
	G4ow2EX2Kw=
X-Received: by 2002:a17:903:13d0:b0:2dd:c100:80bd with SMTP id d9443c01a7336-2ddc10081cdmr97269725ad.56.1789972483238;
        Sun, 20 Sep 2026 23:34:43 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dbd5sm28173565ad.39.2026.09.20.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:34:42 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: dts: rockchip: enable HDMI audio on rk3399-firefly
Date: Mon, 21 Sep 2026 14:34:30 +0800
Message-ID: <20260921063431.103-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260921063431.103-1-yaozhonguwl@gmail.com>
References: <20260921063431.103-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233444_054107_C825C5BB 
X-CRM114-Status: GOOD (  12.67  )
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

The Firefly-RK3399 carries audio over its HDMI connector, but
hdmi_sound is left disabled, so the only outputs are the analog RT5640
jacks and S/PDIF.

Enable it. This needs the previous patch: with i2s0 still holding two
pl330 channels there is none left for i2s2 and the card fails to probe.

Tested on a Firefly-RK3399 with a 1920x1080 display attached. All three
cards register and the hdmi-sound card plays at both 44.1 and 48 kHz:

   0 [hdmisound      ]: simple-card - hdmi-sound
   1 [rockchiprt5640c]: simple-card - rockchip,rt5640-codec
   2 [SPDIF          ]: SPDIF - SPDIF

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index dbc38dd..0469807 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -323,6 +323,10 @@ &hdmi {
 	status = "okay";
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-rising-time-ns = <168>;
-- 
2.55.0.windows.3


