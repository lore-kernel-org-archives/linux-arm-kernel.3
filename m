Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A55C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kotMzWZ0zLMFy7t4bMJZwNuDsod7XWhOWO/9hNBXGWI=; b=QcAC6bnwgolqtqKUAnwrsKeElI
	DmrJRyzRX6KiMYgSzjQMKykF4xC94dKtxu2I4M9uExIP6aY3wT0H54dGmRJoGUEHocHVVfcEx64O9
	p5b6nPG6YV+ujBBHl1xG1DGLBV8nmdr33YcfA4o+rCDsW1zN3J4tqSGY+aJqdqWuVp5ilTXJzxVkN
	596WK38o06KP4FtJDrBTo0bCHFW6Z2+BBLmQBfxOCmjJQnEbEVUkQDF35xPC8ojA5oex6b4NrQv2n
	Y5wXs9uN8TZJuHby9IRYrYONcSkl8fF/DYi93g0TSVRchJ7u1KpATovJDs65mt41hsdungIcyPKip
	49udfx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVTb-00000001ehl-1HqL;
	Sat, 14 Jun 2025 18:19:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVPI-00000001eCN-3cwd;
	Sat, 14 Jun 2025 18:15:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a575a988f9so421132f8f.0;
        Sat, 14 Jun 2025 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924907; x=1750529707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kotMzWZ0zLMFy7t4bMJZwNuDsod7XWhOWO/9hNBXGWI=;
        b=KP25/cDzAyQdh5Aw8C0sI0X42scvcwP/ehZ+38utEv9WkpYypcNyKkvTlbRpK3uHta
         g6Jf64//YijL5uHhIAMK9OAVNJ1TAmVx1Ilv3IPQQIjoZLzjEH5HU/sOtqqAFJb/kDPv
         6ORnqSO60etzNYa7JC9/elDKhH5q+Knbxy5oDeDFsM0hULWF7Mpv7W3JrMYFt32pR7hS
         oesCEl/D5ApoWnV6i/SVEnBvR5gyHJHDA4Y3YMbtm2oRHzl/ep9rkX7LiAeo26xxelmo
         YQJstzLCcP2QwRmMqKmQBW71b02J3+S/hEGnRFFUo9V0uCcn5ighLBJ8U/rgNih/Db8p
         N5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924907; x=1750529707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kotMzWZ0zLMFy7t4bMJZwNuDsod7XWhOWO/9hNBXGWI=;
        b=dBL3gMFadDJoMDwGBzMVsKykyHtGJTJ7zGi7vFKtJAbHYY+NXQVeY246hbIT2SoYkL
         lH1h4DVwa3jTaUDfYUiPn169XGjzIJamfsbh0I5ovNhV2a/TsohYbl0yBMmav6oySeY4
         I3gKOordEj4LlEDxdnt2tZLawNKrdaPBDuwyqxHfC/Dwgp+/6VtE8x3znbCrm1AHjapg
         tgw+0tzddLV7WQP8hvkLayFXyabqES8evLZp86ttoJvHnmf/rj8KWq9EPkIwtHF+6LFH
         pDZs/khw6GRY7NEDZmGYSa7ofino9TegYu4Pv9lCix2knWIVSRud9keZ2N53vwSMRInl
         2QdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDsau8PrjdnNCgEfmemNSJrUyjG5an8lF8PBO9AnG6ZCrJ0H7mTMms+bWTpmFcagxtCPs/Qw6Zlr1jXb0QcbLC@lists.infradead.org, AJvYcCUt9ABXyk9gnLYJHCBU7oZx5YentSVt2rBewGRz2Kajo2zmgAmCy0J+BD8LLxJrH5O2fIyE/76RMizQvxsMX28=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5TxkvvW+qja98iEN3BNBpwnvVqMJg28bSU26iWQDoB3g893Ra
	GML9ujnFLwNP2ledaqjD7nMZ6Pq7cxuZtdjRrhSqaMdEKo+iAd9/SwI9
X-Gm-Gg: ASbGncs0MBfvw+8tfy+GntRWgfU2YfKNNMH9UQTj8nf/JbIHnLMhbqxD1yDXm/myNpb
	BY6rOdjcFbQPrLX85Wk1hFf/ptf7Lg4dsab0IAqjeU+u9FDxOFlFA2lD+sL3yy5PRFlvT8qPiXS
	NVKs8wQWeTqJyWze6effArcScQjNwaq3R6R7p6re/wSCzILHUMttF//CfpEWJJcFrjkR+Q0VyoE
	FDoGDADN12r27XWHQt+RfsO8oFaLgTlctnN9JhWFXVD02amtoii5kD6SeWXnKUbFp+gfIeudkj8
	wbElcg4YkxO8m9iBQFPWldoGoCuw+bt6+lcBOiUNKLt7R6ePXNi7a2KScP0RfOUBuXP9I8JSK9J
	rkA==
X-Google-Smtp-Source: AGHT+IFR4cqqc2eCOz0C/iQEhfLitX2elIxGt3D3mCWCWrmmAD6CaePuepyuNfM65uKa6bxZ3sBGTQ==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3a572e92c50mr2925691f8f.50.1749924907228;
        Sat, 14 Jun 2025 11:15:07 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:06 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 14 Jun 2025 22:14:33 +0400
Subject: [PATCH v2 1/4] arm64: dts: rockchip: list all CPU supplies on
 ArmSoM Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-sige5-updates-v2-1-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>, stable@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=1915;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=QdElGcOzwWgLhHGEr9MDl1bHr4d6LFvNBBvG2cBo4I8=;
 b=cgSA57cepXZcVv6ZPbKxYOxuxZxJek5TAKiawvvBrPyXqC4Q5ALi/AvBqL7/VFcoqDr2XbqKY
 v765NdmZ2EeAAYtEnDczgPJ+i3fgGivUkqrhlv++n07kN4UzbWJxNbb
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_111508_907587_72FB393A 
X-CRM114-Status: GOOD (  10.07  )
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

List both CPU supply regulators which drive the little and big CPU
clusters, respectively, so that cpufreq can pick them up.

Without this patch the cpufreq governor attempts to raise the big CPU
frequency under high load, while its supply voltage stays at 850000 uV.
This causes system instability and, in my case, random reboots.

With this patch, supply voltages are adjusted in step with frequency
changes from 700000-737000 uV in idle to 950000 uV under full load,
and the system appears to be stable.

While at this, list all CPU supplies for completeness.

Cc: stable@vger.kernel.org
Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board")
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..801b40fea4e8808c3f889ddd3ed3aa875a377567 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -211,10 +211,38 @@ &combphy0_ps {
 	status = "okay";
 };
 
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
 &cpu_l0 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
 &gmac0 {
 	phy-mode = "rgmii-id";
 	clock_in_out = "output";

-- 
2.49.0


