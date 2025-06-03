Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41412C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzatrJm2k4pmx/p4YJ36TGmLlfwt6dnfGgitEvcbd6c=; b=bg9cvh95AS40Qbs2Fm1EfXmw88
	FqjbMj2QM9uDS573JY2emYiUAOKVvz9mSpxULE2k+cCkGhz5C7uSPkfAXKNsv0Ck/Q7WR9RTsmX2X
	vtriPy1sZHr2AT40d7uHpqFAp/xpB90rqmr11v/FGNS8UnKFYa9cS1B2HsH7rkVHax2ZBLSc7mccZ
	aKyS2fQnS8a/3aB1j4pmXUwSSVLhL+RgiNNawqyJBboIt1w6iG32ufol949DW4/48hfB5Hv3x5N6r
	Tg7IUJOAnZnf5X/AC2qwpffE+qhX4dPbT/3JLn8t2XBBArZEh8Eb2kGTfjgvsr4dNX/EWcmx6toQq
	dSuQ1wbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV5E-0000000BRfV-3q4V;
	Tue, 03 Jun 2025 17:05:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV0v-0000000BR13-24j8;
	Tue, 03 Jun 2025 17:01:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2068018f8f.1;
        Tue, 03 Jun 2025 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970084; x=1749574884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzatrJm2k4pmx/p4YJ36TGmLlfwt6dnfGgitEvcbd6c=;
        b=bhRwmewn/Cs5l3QdivX5fGhd4hGaZ4CE9GEAbH+/c7OJuX8W4Ue5wSCdn3nFgXZOCP
         mj3Co7zUPO1Qnp1nUPPPtl7a30pQQ2mSQUS9asqQ4pjmAB7Tmh7GebD5HEfiuxuOFDJV
         yMIii6zZJir5kdaTNy7FVvrp1XQK53M2m07krYQFngFYrYmq3ojOe7PC56T8FouqjEIF
         HJxWubXJ2fjCH5I6OrrFOmE8pz5SLfKT/9mZm7plzCZCBi9k8eC2PJ/Qw5yvtNBrVLgL
         7elRNE90WWZmaJ2iWHW4wBPtu92OsbKWnIpie0BtHVpxyyoBSOg/9dlwOz2TyI1fEt24
         y16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970084; x=1749574884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzatrJm2k4pmx/p4YJ36TGmLlfwt6dnfGgitEvcbd6c=;
        b=EbXJ8wqj7tN0kwg0qYae1ItoD57qIGETKNIi0OvZG9F/4/F0uFDRZkc7yL8T2IYwpu
         Ks/nvPklGA21v30d0ze2wqPu1uK/MGYNf1es5Bad7vIkS8ukkDzVZfqazKcKyRF6mzLk
         17ORBYowVTraKnFCncigVqndrNLu36Lsn6Q4KVIIIIybf6v8F3Ry2jEjBTLCb4SeRGPo
         Q+aVpnKz2xWeHqm8SZ8hfX0aPXh1aYNk2mZHiP0BWej3kIMiiytIcm+G9FxkZmyTHhre
         FIrd9SDlwAQwZNaorn2Ro4bV2Vzh6xaV/n6uIhmPdy6nMh3JSy4CfQZawmTfCeVJKPAn
         HIfw==
X-Forwarded-Encrypted: i=1; AJvYcCW0FUKUvnlEDzb0nlY58CgF+B9Qh991RgfoZN5sJ6tsXp9AlMtLBzpQE78mDXvsV+DPoLQWK6G2Iifk1Jd0uVc=@lists.infradead.org, AJvYcCWTePAqzNFkV+CPLGtxV44PwXAxgUJH6657wTUziELhhKN7LHIXs9amQOlb2wOFaZj8mxXXSrGbLobDbGWp5wUh@lists.infradead.org
X-Gm-Message-State: AOJu0YzMg78EoyxveYYYyY6J2VgFTOun97JdMKwD4E81BsZZ5impjEP1
	jEVSw7pUbHrx14dKu1+ScOsIB/G6IwMC2BH7azoEvryI2JLyG8XWXI5xK0HKO28sl64TeQ==
X-Gm-Gg: ASbGnctqK26zqK1f12YHH/1C9+CukHh54q5i5JU386fTQdV1Qpi1tpDA7gJCmxIKzm9
	R7f6XfgUht38FsNG/HSQvxhqNMnAE8TaErdFXei1ScJffe2vhouatIa5j7JwO/Juw7zD25xKgjd
	+xWrI0U6JQg/ouYNxIFlA+Dg91kDcJ5QZMPS04Jqc0gPlVIrtm/WrwO9JxwHYsAjPrXXwEGZBgf
	OyOpnmBbnYuelRYsFqbqv95SMUJzBBsWjiKtjCyAuIapDaUOh1yTIsrHjpFI2fpM391lJUO9T25
	H7hzYG0pcB/iAA3P0xbzLINZN+lxNyJrDs8Bn2GxprU3HtIyMFfGBLwOCujaIOaPQAju8vCbC87
	fNbRMBupAd6PPvP+QhJXONns8Kw==
X-Google-Smtp-Source: AGHT+IHoEUws7FMt1scFj0EhElYUfsczF2B30ANfKF4ODg60bbqP09s/Jx2WbI/R6GtA8zVRkMvZMQ==
X-Received: by 2002:a05:6000:4023:b0:3a4:edce:b2a6 with SMTP id ffacd0b85a97d-3a4f7aafdd0mr15909828f8f.53.1748970083324;
        Tue, 03 Jun 2025 10:01:23 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:22 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:13 +0400
Subject: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=1299;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=xZhFB3XJBfhELsJB6mdjiA7QVyCbILi3vpU1pgDpkPM=;
 b=+jI/3w0CBL9qHET5CqgpBOnomcQ5HATFqZswRhmf11d/FRSkfKI/SAfIFQJLB5P6wblGRB2zD
 YGS/bF5InOqAgXoiAg1/z69FxkSk5skk2djVuCfvWW/lrvw4TM4ZQxb
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_100125_538710_7B0451E1 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d677cdc98fb50353418 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 	};
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
 &combphy0_ps {
 	status = "okay";
 };
@@ -215,6 +231,18 @@ &cpu_l0 {
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


