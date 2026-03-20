Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5351093190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTU2TMlRUybrUic/FwbykBhoe+23VKaHqHh1ixkwW9M=; b=ksQIGhW5ewclloRYPE3nyPmTEF
	6vy3civekMQ80fCa9enJfc0ccn66z1m7tOg8A4q7TgapREPh9NL3wpn6IGD/PiIJ64xZ3NRYEmVSz
	o4ykPe9oK3lefLuzuQxEZCBWDT7gbL9tOrbruWj672D1F1fg9YxHhz2V/ZiniXH+6JXJVi+L6hYKm
	llmmN8K8bm6Ps3CPi+1Iujo1djK4XxQ+14sE/V4yxRR9MnsAAL8T1pivllRg7BehR+9LvQp7F+bxQ
	IHL+Vwi1BfZ65YDZv7ZCOcZ6Wkj6mGeKZRRiIa2zP4tZ1iYPKxy0ExWv8wYgD4OeaicTD1LBsav3k
	xxj9nNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTW-0000000COYa-1mQU;
	Fri, 20 Mar 2026 08:44:58 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VT1-0000000CNyn-2rjj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:32 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c74280e3468so151598a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996267; x=1774601067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTU2TMlRUybrUic/FwbykBhoe+23VKaHqHh1ixkwW9M=;
        b=CM/KzJpBQ+YuB6EFjpJ0m8QHRzEk3ipPAKT/V/wzgcYnLObb2dWngLlA8S61o4F/UZ
         FEOKYbLFoGOtY2Sh7hENzFLMyYNw5107iZDY0X5fJ3TlLp92IB4GaLbsHqbqu27XRgs5
         N+ex6lD2Ksgw/GQjx5HAgn9D0ILaaCXpcrRRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996267; x=1774601067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTU2TMlRUybrUic/FwbykBhoe+23VKaHqHh1ixkwW9M=;
        b=gNY9GAh6WsknnpllgyyVr41aiV0ZqYkTz60Uxbg4pAYhPv5qsFjAMuMj/F+5j3bpFS
         bPkCi3hKOQx97ygp9Wy43abs/TDJrYefoIw9ZX7NPlaG8sHKPpU1R5UQKl0p/GU6/+vB
         odtlwkg+ZtPFDmNkMS4axzEkr+t58kgNdrxa7bkyDKnmUuCqC2LiAwTfN2NneU9Eif3l
         zJpmmGEC500kdfPkbYEEEk5WZWdTEe5QuSmT0f065tyO4QYg3Ch0+Wmm4we1JJEodMJu
         hDeGsxlCug0d+uvWCfEHm62ehaP5+q2n0dOsEON20hjA3SkLXbcsVEvWYnVaMa/3bh1q
         yFmg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Avj9wiIchZasJ1/i/6f90eQ8OBQl4PlfrRAwGe3vcUoe015aNB/JWhDodzW1q697iiAi4Q34fF4Ck/1Yqco4@lists.infradead.org
X-Gm-Message-State: AOJu0YyK65aMXf32KL90Vyu27H6mnkE3PlqJuAodHKnPth9O34+AqrHq
	meou+e5MbsJ/N2J6AnS0Uy5L8nVyZJVWtMJX6dhpDPleE8gA4iUR2e8QP+8Ys2E32g==
X-Gm-Gg: ATEYQzxQSzhoWQNOwKn+K8z+6MthsN7znip6STztyPDj87sOgEufuaZLilop+HNYYwN
	muRx4k2v8sPzfwBNPd/aNs5gfBUzQMLaIunGL9Qz7fqMnr9IGxzELzCcbOT/8eZhV3IcRKuGoIB
	k0Ix338Dyr2RsMWnpEpXqev3g+GrpS7vpS22lMnGr6CeyXkdsiAtcFu0WWHitanb2DFQqBgZ1Ce
	yBlZ3NsZUdbNn9xFKpYcHKyFKG60aFk3hKROWEUhgjLKGbErbCx78pjI3u0vmEFpxqaSTSu17jf
	QzSi9JlJKd5Ag8L6km2zceebnaiviJus1sNpdOeEw7xDW8j/sE68tgqGgD/yW/oAwy8lmRkHWHs
	GfZ0Pch9Kq6si2tUy50tkciuiXmLhHefXooM3sYAt8y5+65R/o9MflXuLsPsmeBjiObbs0vjTC7
	7m0ALLbYuhZdNVKKogAdaT23HkvmpScfdTIoZDYX0Z9FdWs23uHqaGYTOAYjsODg3KrmQrYoplh
	M3yqj1G
X-Received: by 2002:a17:902:ccd2:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b08273d0d4mr19970415ad.19.1773996266943;
        Fri, 20 Mar 2026 01:44:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:44 +0800
Message-ID: <20260320084351.2461060-13-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014430_017564_443F66A5 
X-CRM114-Status: GOOD (  10.62  )
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
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec05..fc84dfedab03 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -544,6 +544,27 @@ &mt6359codec {
 	mediatek,mic-type-2 = <2>; /* DMIC */
 };
 
+&mt6359regulators {
+	vsys-smps-supply = <&pp4200_s5>;
+	vsys-vcore-supply = <&pp4200_s5>;
+	vsys-vgpu11-supply = <&pp4200_s5>;
+	vsys-vgpu12-supply = <&pp4200_s5>;
+	vsys-vpa-supply = <&pp4200_s5>;
+	vsys-vproc1-supply = <&pp4200_s5>;
+	vsys-vproc2-supply = <&pp4200_s5>;
+	vsys-vpu-supply = <&pp4200_s5>;
+	vsys-vs1-supply = <&pp4200_s5>;
+	vsys-vs2-supply = <&pp4200_s5>;
+	vsys-vmodem-supply = <&pp4200_s5>;
+	vsys-ldo1-supply = <&pp4200_s5>;
+	vsys-ldo2-supply = <&pp4200_s5>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
+	vio18-supply = <&mt6359_vio18_ldo_reg>;
+};
+
 &mt6359_vcore_buck_reg {
 	regulator-always-on;
 };
-- 
2.53.0.959.g497ff81fa9-goog


