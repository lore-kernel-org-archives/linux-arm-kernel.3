Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9215BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 01:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+jMtOYXd86aOtbSew6YfEy4o+UUtHTJcq8MN5yVYKM=; b=li2hA11HHYsH5lxf5lEQem/GSS
	vYo0yWqCjVGGaBzxyl96+yPD5ZR2N8dEWKyZeumr1XGQiukmpultXV7BSHIxJm70Q2KPCwv0hOyEk
	gDRZQoNzqdbdcXyd9fHpWvDrzSyhkiiLxGH2qCqzQV8MM1kGUBiTH/+5r1B2yrGIMH2va6gCApDJk
	glry5zay3KxjmF92JOHutVVY3S62Tpz3j3REgmyiDlq453JDn1zVLH8vDr6JCmY2VnAgGpwhllSZc
	IRMdGIQ+H8x9BkNQZkm7EEe7qNtoG9YM5/i30HJ61CpJv537udJDrhggoqYd3PKfpLaQKKTAznbj8
	XuMHx4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkX3N-00000000sLb-39zk;
	Fri, 17 Jul 2026 01:07:49 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkX3K-00000000sKo-40bV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 01:07:48 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-80cebd41372so69678777b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 18:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784250465; x=1784855265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+jMtOYXd86aOtbSew6YfEy4o+UUtHTJcq8MN5yVYKM=;
        b=rTX1ikPWME3qnijojiZfIcRJ1etjf997gu+4TZGQ+HWitReqHJ49fW9JsS5LXLXRoT
         RisTFWvJu8T/fACKho0XyyOA4sCGoSevV44Kowg3tmD9Hr7vA7fSxYAronQGs9vKjUWz
         IlkQgCx6nwyxlHupeJ+qUIkxwqPK2ItsGaz7Z+t3IUpYXT+iN0jiW+ksJX05O+A4edwh
         c1kdRfTsQe8klYMJAO3g62iOgnULOabTFvgoF/YdySKtxpfn4rh1aQg8vNJ6u3q++s9o
         m4nixgsTcHHSn7nPVdJFteI5uCp9tFbNiV2BYpPbV21QP62rTKiZNjJR52pw0zndqjUL
         lMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784250465; x=1784855265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+jMtOYXd86aOtbSew6YfEy4o+UUtHTJcq8MN5yVYKM=;
        b=oEj3IYOX0GTSR8WYpvtF/9JaO0vAz2vr2wr2c658LLeOh3l/FtTikmHK4Z3RLizypH
         LhdmjmhjRHdrmtWLLWt7EZ/ZAosr4OO+2WhLtqEFHeb/uXMNz71jPnN+desnIjigGYy3
         53oOb/GReV/1el/6/ETmvm3wrCthOnHJ7CtgqYihfD9SJ3LabuV70fILPfqQVpEAu22m
         I/I9AhDgqJj/y/TZbNxfiFY+B7PljOgo8p3yy6D+ueVRbZP0uQckERg6Gzipo7EinfmH
         YYn40CxtE6ulxaHC8PDF3yBH6pKSCYCgL6Tz4IB/xMdUQQD/EUHJ67i+ki1RMD1YuXyV
         l0FQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFK8wmXLjdpReQmxYXTyjV2EPTswyfVxv8t+Vc9LhAKgkAf7GV+/rg6YnjZqMY9Nc8K39fuKj7LkQQSIoLGIg1@lists.infradead.org
X-Gm-Message-State: AOJu0YzZEfFkjBjSuaoGgMf0OmZVID70slAoYa1GVBPfretSSALJNQXr
	KgLrYqMsk89ub8TbUYtAvT+BhFvK4Nd4qNNFLlBN2/FB/A4Of+y5Nwsb0u2sKg==
X-Gm-Gg: AfdE7cmWpXaz+ZyfdyyWLpcrB0/uAECQRtzhqW9kuboMB5gloIGi3WKKqHqye83Ejp5
	MnzXKtT7XBKHg7ZgI4iBOz7UwHY2i3th5o2hovIlPAw+GY2YsKhCRxIfD5tOT247a0OIGnH8Cc8
	fjCUZAmriwwUjc5OneOQWOQS631hBokK1D7Fr1D/Q7N2J5tZCMtY636r0QoIB+9Fk5YymDarjYa
	6/Mvo/eIZJmvvkk41TEg3uyyPyr5nu6+GQWUNiKByjkAFqvk79IFWwglg6/uQwgHml3adKBrCh5
	h1KJYtgxodNWmr8sCJTSj571kxTsSCMnbYpz84Xx1LHnB73VgZmad+8qP6TZaYHn9TpcoPvkUev
	YmduZzyv1JlX6ze1AGQSWvaa5XRwgTR5P+3JbpLFMMMTwHSYrv1GC8r2m6qEDvZOZ+7oCGyQ3X2
	NfK7k6qWXhrU9UlAc5XwPmdzrIM+JYmgUwy9twCZxULlyS2uE=
X-Received: by 2002:a05:690c:6b82:b0:7dc:e96a:26ed with SMTP id 00721157ae682-81ef22ef44cmr481287b3.9.1784250465041;
        Thu, 16 Jul 2026 18:07:45 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:e2d1:829c:ccde:e84f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e8f4c5d3csm159095057b3.15.2026.07.16.18.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:07:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: rockchip: Fix rk3399-roc-pc-plus analog audio
Date: Thu, 16 Jul 2026 22:07:34 -0300
Message-ID: <20260717010736.578419-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_180746_994889_1BF9776C 
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

From: Fabio Estevam <festevam@nabladev.com>

The ES8388 sound card on the rk3399-roc-pc-plus fails to probe because
i2s1 cannot claim its MCLK pin:

pinctrl: pin gpio4-0 already requested by ff880000.i2s; cannot claim for ff890000.i2s
pinctrl: error -EINVAL: pin-128 (ff890000.i2s)
pinctrl: error -EINVAL: could not request pin 128 (gpio4-0) from group i2s-8ch-mclk-pin
on device rockchip-pinctrl

GPIO4_A0 is routed as SCLK_I2S_8CH_OUT and is used by i2s1 as the
external MCLK for the ES8388 codec. The board dts already removes
GPIO4_A0 from the i2s0_8ch_bus pin group, but i2s0 still claims the
same pin through its bclk_off state.

Since the i2s driver requests both states, this blocks i2s1 pinctrl
setup and leaves the simple-audio-card deferred with a parse error.

Override i2s0_8ch_bus_bclk_off as well, matching the existing
i2s0_8ch_bus override, so GPIO4_A0 is left for i2s1/ES8388 audio.

Cc: stable@vger.kernel.org
Fixes: 6d9a7bd6a13c ("arm64: dts: rockchip: add support for Firefly ROC-RK3399-PC-PLUS")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index 4f2831097624..f6d62ee51f1b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -136,6 +136,18 @@ &i2s0_8ch_bus {
 		<3 RK_PD7 1 &pcfg_pull_none>;
 };
 
+&i2s0_8ch_bus_bclk_off {
+	rockchip,pins =
+		<3 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>,
+		<3 RK_PD1 1 &pcfg_pull_none>,
+		<3 RK_PD2 1 &pcfg_pull_none>,
+		<3 RK_PD3 1 &pcfg_pull_none>,
+		<3 RK_PD4 1 &pcfg_pull_none>,
+		<3 RK_PD5 1 &pcfg_pull_none>,
+		<3 RK_PD6 1 &pcfg_pull_none>,
+		<3 RK_PD7 1 &pcfg_pull_none>;
+};
+
 &i2s1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2s_8ch_mclk_pin>, <&i2s1_2ch_bus>;
-- 
2.43.0


