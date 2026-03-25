Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A74FEA832
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=; b=fk59s3BHU8FpLVeGHQ4cjlpQOM
	pSqrm/v/6nlQrPMwbf9QdwT/924R9ShEUx3UkByMIB0rXnYSqrPKE57zv/17Q5UQETjK0Awh4a0Xr
	+4pnVFpe8FOTawQICmToLpArrds4oq3+jBl/ugTVTOE74SY/4JzQxIf4cbzBukYem1YOygioRFb8n
	Y613EMrO5Ov0PDfzkzFjnUTn6Xc1tZUJCQSfC+icUakVZXt7BgKcCGjLRKfolTsUeZNOJq5tgIwwf
	TLu6BSTlOvU8LYqevXZz44idHITkkw38VGpp0zraPvQt4gQF3potEEGSBbXUOHAJJakODZqp75b57
	ucKxCWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8a-00000002tDe-2fDH;
	Wed, 25 Mar 2026 07:58:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8R-00000002t4w-0KKr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ab46931cf1so5167705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425518; x=1775030318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=hRD6VddqlfRmEeBG5up0gys0KyL9Lg/cPuKaXaceqjT0afJPQSqdNMo8PAtPDRo0cG
         SgioNxxjnOyHg3lexfsoiu+884Xsi7XLVthHRphdnhYgBbPdaC/9z6hszwz3am+AdOne
         Ob6pV3h61hBvLJku8CdZCI9Qf2YVHTQdmPq7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425518; x=1775030318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=ilOSF9EX2sBmr9hOgDqqKh94o0B8UOsBvJvb019ycFxSvGabKrx+dBD+FHXTvVClU9
         4mGx+ugDWi2H9kQJ53o77902u5t74L9bFn+JVG9kmxA6HzsOolySypOm//RlnK/l68M2
         D0+tK7T8TnpC4w82Kq5DJRPwZe1rFCP3UjF4qcNZplf/Z/sXFAsYmVwYW9/W+7hQun/y
         +N3kMyDJ24xA1U2KOKedxPkZOFLDWOmbjv53ZeQNXmvHKQI2STh619sQejtP1gh4REKL
         Y/H36Q223iiRIrGqcOhyiExUy3Hn7eeXFGQPomeXZ5DsNr9fF11ZfdQXUeivYBP3hGfo
         1dZg==
X-Forwarded-Encrypted: i=1; AJvYcCVogDutC4o5argVrHa54Ct3123zjHFNORecRur/PfsBDsW23uV2dJ4wIL0ccbELtxlcnSKa9b7aqqYRgwFIAss3@lists.infradead.org
X-Gm-Message-State: AOJu0YzOG3eqQh5zVm7j/P2b/xMCdLmBBWti4GVwGLZF25gg2akR0sZp
	xJPbQ4UJ69O2JqDANLG4EWnSRtZO6+l3ysV7gkRg7IJfBuvPc+gT8+UvIzQ6neCA5w==
X-Gm-Gg: ATEYQzzxHE1PdFqh02yw4FmNo084LuArbAdeS9nlp363MLa13RnIfCEEkKtc5iMwhxf
	diNgrFijl5NIBRkVxloLlHeTEjjq0/vrehPfcslR2atjITsQ6sRjzazmrKRVLJZE90F1GH3HFzg
	bSDtg6PUGfQ8Qyninx/6Sn2+jc7iD3Fy38guoEemKudCLcQgRG68olY06Hadd9ELxCG6B6j0B7E
	Pbxq3uNCo0/LfLyn1tYAvv7rWOmSqzLFS2rNHAfk4tFsT5VwG3rXlnYobl69G2YWFpwFNsEoFEp
	DddK8bnSBz+9t/yoO9lCJpW1nqqh7Z6Yk+ufMbxX95HmogK/iPn+4UEt7N/6XAeTYT0sdJqDcnT
	CCCfbdL8rAAIXTBetbOEhftzKWQo7yHbcLfk2xOEoPZICEeI02SkNgDsRXxp1EMqcultY8Z9uQX
	jSknvMv5cpb7fOVeWx7WDpnQW7ydeQ0qPidIHarvAnhhTEF0VMDTmobhBVZSpqgP9YSDK2uTwf6
	voAPBkE1KkIbD2ktg==
X-Received: by 2002:a17:902:ec8a:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b0a4dc9efbmr60505455ad.13.1774425518163;
        Wed, 25 Mar 2026 00:58:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Wed, 25 Mar 2026 15:19:48 +0800
Message-ID: <20260325071951.544031-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005839_129403_0E4EDA96 
X-CRM114-Status: GOOD (  15.87  )
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.53.0.1018.g2bb0e51243-goog


