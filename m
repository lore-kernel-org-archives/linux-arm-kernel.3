Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB73C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mraqavKEL8rZFk/6+m83umFrUpJ6nJzwQqBUF9zz+s=; b=DssEY0K503q6uAM9IUtnhHLrxu
	Wl3EToCqhBZo9U4aSh2NDGvy4kH8hf18wSyqu3euGfEOTOnsOfvacdgfirOGcGrWVfEgFHjBpKmC4
	33EFZS6voFUL2oj87Q5LULZgAQ6seWsNotOHj36e8Dcsm5MDAzK5SBIIo9yEk48ROUmpNsMt8MR1Q
	woMlqrNEM54kXYXckpDCRkcYzPZO3sFz7uMWWaez+UsurvxlNs5wtvybkoe/RWFMxsIgjFpBH3qIO
	AqW22NyE1ttgaipj2lEZBcuAe2MIgI/JwHMay+rcskruAYc80WTKIAODE7wvQ8+yKMJPTJrt3X6wF
	tefoLbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOg-00000008wib-07Rc;
	Mon, 13 Jul 2026 11:00:26 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOX-00000008wda-0EzU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:23 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84861fc51f5so1624057b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940416; x=1784545216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mraqavKEL8rZFk/6+m83umFrUpJ6nJzwQqBUF9zz+s=;
        b=FRX9lMO96WG1qeU1j5QZ3UJpKpTza40RZ4cJ0jRcLKPyaleVQlEH7lvvQ+sXnNufKw
         XfCWbFnE4rjS06fAP5+BW+GR6p4Dq6Dn3qb59E4FyJQuFBUeZKCnrnA/9SSiq/kLp0X/
         LRsdkwtZ57n3N/hd+o1Bd4n4IbK2BGd4U9DrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940416; x=1784545216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mraqavKEL8rZFk/6+m83umFrUpJ6nJzwQqBUF9zz+s=;
        b=Jzs0ior0PAzqJsgcBYh67IiaaFJtEDIGSE++4u1HGBs/dCrKvPuUn6N6hEx1KGdADV
         YdA8zvE9XTbV0CNxAJ/NvS8N5ElTVEa+sUOgBvNRdCGOt+WyE5P8KI8b9Et+iiLn8cHi
         sbpebHQ7EmdJ/I+0HidBbhxde4nZXEdAZFaOSJgYGf0jKg/2m1EoCaqIPITnh2p4MRid
         OVa+rPVCguE8TYIulCgADqfMaQvRl9iWZoMm6gZOCyT2e5b+5cddI5y2K3iME1Laf6XP
         UZP91E4InEX0LHR8RLTGLg7FXJi/KBy9pvv6r262BwiWcKu/Jge90T2lKPAd8zcuuue0
         rkgw==
X-Gm-Message-State: AOJu0YxuCgUmaZK29MicmFDvcNWJo0p2zFe2oa0mpjdm2vMX72BnW1c/
	R72KLBVLi2gkSrkaXMUAmvu68RqYID3UrnqZqXkgnRDSOYq/RUTaRGllfdvGYkhZ09CrHlIPBTv
	nQ7hj
X-Gm-Gg: AfdE7ck1bHbtsrLoZR8uuyrAv+RIlSwUaAEb/rmvmfgMzyQtiHU/6NgDKOcdRTDtNZ8
	SaZz+EZnWtY3OdTdAgFEtxYyAfL3CEGm5sHSOaFfz1yQW06tV+O4jKGH9EkT4e1iLHt/ByvJni+
	RhPNp0UyjrL6KonwjLrC/jnCPTEyI4rrXqw/skjttSL6IiZ7qQ533Jmrupgb+8Z3GwsERQxh5NQ
	UJUTGicndwGyeI8NsbSs/fGlSMZPmCnBOjQHQIDXGPoLk1DZ96qzawOMXYTc+04jzHzqbY5uvOR
	9oZZlSJuSjfXxcEsg0pvdKJ51S1tZlel27kPlFzO8vt6gckiiCN0XyAKrl4m77ewfU8r7Ua7Y1A
	i15UviG9mCkT3HgMS0DioQV5Ev8zHDax0GBM8qhpF08UfC+/RZC+E7NJ1g4WuLkoYehZuDsvQY4
	QkWPZfBeJSxlF77I1jnBSOzrYTdw==
X-Received: by 2002:a05:6a00:3d0e:b0:845:f107:38c8 with SMTP id d2e1a72fcca58-8488975ad8emr7159281b3a.47.1783940416384;
        Mon, 13 Jul 2026 04:00:16 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:15 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/8] ARM: dts: mstar: unitv2: Add regulators
Date: Mon, 13 Jul 2026 19:59:44 +0900
Message-ID: <20260713105950.1346962-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040017_108941_B750C027 
X-CRM114-Status: GOOD (  10.57  )
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

From: Daniel Palmer <daniel@0x0f.com>

Add the fixed regulators for the core, IO and DRAM voltage rails and
the GPIO controlled switch that supplies the WiFi chip.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../mstar-infinity2m-ssd202d-unitv2.dts       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
index f02de5b475af..5e79819a070a 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
@@ -39,6 +39,38 @@ led-1 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	reg_vcc_core: regulator-vcc-core {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_core";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		regulator-boot-on;
+	};
+
+	reg_vcc_io: regulator-vcc-io {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_io";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+
+	reg_vcc_dram: regulator-vcc-dram {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_dram";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-boot-on;
+	};
+
+	reg_vcc_wifi: regulator-vcc-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio SSD20XD_GPIO_GPIO14 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &pm_uart {
-- 
2.53.0


