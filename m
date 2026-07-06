Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02326C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqBkhvyelySc3loJx/J76CZgVdNYoTTPG8StLA3hSFU=; b=AlUs0gUc5sY8JUzlGV/7PgToAE
	LRXer/itNeiTuoI1GyA42wjzJMUBHAx301irJt4HlTJEOxr5xcqpAj67Yng/cks98JLx/albuTcT+
	JlqvPRi46XzkZ4hYQs+cebYS9bMmUeCJrsegyrwzZ4bkWuN0i6akWO6BdT7ZDCqNkzVgzsxE2sSMK
	ezHfew7F0QjJS0EsvlTpkx53jn3gmFFk8fdcrM0UCYrl2h6C/CsAiu2F/R8nPZGUNKcN9wqgnsGzG
	Qb7bMRRNJCxT7C9Y9CkkoWG3u6MFBa+kCTSzn0/7zWxS9XJJshXKOXyJb3yq8GC6iqWSzfAWGiSt4
	fhgIq32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrvh-0000000Dj9d-2OB9;
	Mon, 06 Jul 2026 22:36:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrvc-0000000Dj2f-1qFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:36:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-472326ca506so2344464f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377398; x=1783982198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqBkhvyelySc3loJx/J76CZgVdNYoTTPG8StLA3hSFU=;
        b=g6N1aKTlEbTeV2cihkx40ECxnyZP/crLC3Pw5LEd1ucw2VjkMe+GboqQLjvfSGpZjt
         93dPVfo/3ROOetbKthwvl2C4+tIUJjHU1YzsYwK4rTHzkjrMmOiInG6cMqGunncSShKv
         wTbfFWKFXD0mcXU4e5q7TyWcMAFBV9opu96gGh9TWy9lZIh0qiC6Iomjb0rkfRm9ZVu3
         IW4xjq38hFJVfnPivM2WbdiuDR7b9322VBJMat0+e6fp66NaYS6VqHtaUWfLzEh/f3gG
         7U+oY1BNYg9dz3AhmtqT+k5xH4OPcDBn89/dEB2rZpy0+c+fpcoTUhu3WJVMtJs+s3U9
         pj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377398; x=1783982198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqBkhvyelySc3loJx/J76CZgVdNYoTTPG8StLA3hSFU=;
        b=Gx3MjewnDy+ivcZ0s8R73kBDB1Lv0d5baSYQHP5w3eox/0ev5iwVAWANc+AmeiBXkA
         A+re/qdKTj1p1XSCvsWA96PDb/xR+IsHR4VibmwyocZCjR6Q2ASMFnMzUcgnjzrCewSQ
         GnP6G/QpDemgpGcqkphQE6TfVVa41yZf69YgEYwMsNlzlVB5uE9TXK6yZFc6k9CoS6rb
         eqDgo+nEMjlJ1xam30iGxb1wxM48K0ol5ZgCo+3lUg/fYlObyzix+zhOSHoyRWzly+Ys
         G8FrIRHmiop/6E+zzI1D1B2x4l8JdnBz//91kdMuhbm68cH/XzpH4gh4JL7WxGtuVCLr
         7mIg==
X-Forwarded-Encrypted: i=1; AHgh+RqIfBzUNass4Z2aPABLsA/dHinhMKloxC344TSUV9gn4arvTdhh0pjqJJBr9MVkTsJxL715t2j4LsEebz2uN9vA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8KvgyibEAS2t9buiL/bOpe+hINKtKDERQbHmAR2EPrexm+pac
	12DI/itlFg6AINzkUPWykfPHGW9gKhWmLD5FH4usTnKxPn5LJfb7BqyZ
X-Gm-Gg: AfdE7clbU00VFXiIENuJdJ9ffgM6vuXn2Hv0B1S/DpVQi4E9LrHLBv3zN+ZSzpdeHB+
	4F2iGCDff5qS9EiyRZRSGPRK9acczZ3NDsEY7Qs/AMpvG/yrRp9PhOi3Adym9rnvl68DUv+mkjd
	F7kRFAY3pPXT1468uAn44EN9XHQP9QJKO6RRKnbJqJQiHxyC3NvLubVrZTXf9IebyH32tfOHYci
	JQJfxH0vkyPa7NznFWzabUV9iZcSBn8nRq41bO8wSS5zz9C8M7VFsNt3s7rNHz9C+hYNbSs+3rU
	Kw+9qd7jDr2WpGE8TuD8JNG6f8WpIs5drIzx5WVJkw2p+ko2eLEdyV5l+Md28ivRaBihKLrV1wp
	F+nuQtBiL12s1LjQGtVvjR0+zK6Vb5kcPLikwd8RyzoE1zx9H+nfJGmkaRw0meMkufB4SRZJgHk
	8piCCepoQ5Ce6ePojbPJERJlNmehWKKwsUuGh/8cubulT11RNa5xAS1XdgPL3Yow==
X-Received: by 2002:a5d:6382:0:b0:462:fdf2:3a50 with SMTP id ffacd0b85a97d-47de66a309emr1878338f8f.32.1783377398441;
        Mon, 06 Jul 2026 15:36:38 -0700 (PDT)
Received: from turbine.fritz.box (p5785b224.dip0.t-ipconnect.de. [87.133.178.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm27491387f8f.12.2026.07.06.15.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:36:37 -0700 (PDT)
From: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Frank Wang <frank.wang@rock-chips.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Subject: [RFC PATCH v1 2/2] arm64: dts: rockchip: fix gadget hot-plug on ODROID-M1S micro-USB
Date: Tue,  7 Jul 2026 00:36:27 +0200
Message-ID: <20260706223627.113814-3-andreas.zdziarstek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
References: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_153640_646744_4A541DC5 
X-CRM114-Status: GOOD (  14.74  )
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

Referencing the vcc5v0_usb2_otg switch as phy-supply of the OTG port
makes the phy core enable it as soon as the USB controller powers the
PHY, so the board permanently drives its own 5 V onto the micro-USB
connector's VBUS pin. That blinds the PHY's session detection: VBUSDET
(fed from connector VBUS through the on-board 10k/15k divider) is
always high, no bvalid edge can ever occur on plug or unplug, and the
OTG state machine never wakes from its initial state. A USB gadget
only enumerates if the cable is already attached at power-on. It also
back-drives 5 V against the host port.

The inno-usb2 driver has no role-managed VBUS supply support, and the
practical use of this port is as the board's USB device/download port.
Separate Type-A ports are available for host functions.

Drop the phy-supply so the port never sources VBUS and pin the
controller to dr_mode="peripheral" to match that.

Fixes: 10dc64fe0f98 ("arm64: dts: rockchip: Add Hardkernel ODROID-M1S")
Signed-off-by: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts b/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
index 33bc5249d729..d9d4a31373a0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
@@ -602,6 +602,7 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
+	dr_mode = "peripheral";
 	status = "okay";
 };
 
@@ -627,7 +628,6 @@ &usb2phy0_host {
 };
 
 &usb2phy0_otg {
-	phy-supply = <&vcc5v0_usb2_otg>;
 	status = "okay";
 };
 
-- 
2.53.0


