Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80D4C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=; b=vYTHIRwzh37e8uVl5+yRLYI3w0
	aNi1W/fK4Kv5kECffmPqj2qBvYjEvsSgD8zbDOh9fND95/8jYCbj0wJMlcAWTpzmYNigsmMmEYHkz
	6mkJ75ncneZvFW8/x9BgkL1xJ1fJBYWL8A27ahGXZYVcC3BV/RlCEv5OQNYsKNSBeLVJ3wU+9QKiI
	US8vbnXe8dtMqs8BwkHXs434kKoNyx3RMFXAzpqjZ9O3NI6Ozd1oGqpOXz5BUGKgR62k9/gem3/hs
	Gec+RZrAc4aG/A19gSjwgJz7r7emYEsk0aOBRoA86R7jnsSVJ0Yw02pzn/9bWor6+WEJ0F42YtE6S
	/FEie2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gog-00000008HQK-1gsp;
	Wed, 16 Sep 2026 04:00:14 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6god-00000008HOp-1zri
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:00:13 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so392169a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789531210; x=1790136010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=;
        b=Tj9fRP/K9SYkJRq+4nSs2HTx7BxXyBwXQkE1D+KCb3Hcjymz1YjkGEYe/eowGEGaL9
         NLbFSXFCCi4SQAm4rWFiRCJyOrzCM/8Si9+ddtdNBUO7I4Ue3G2OFrZnXbBGULvqoArO
         fS9QSK51ErsUk+syK/+B82VouvEAuoMVKpGqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531210; x=1790136010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=;
        b=bNKks/awtCCtooXy1ucl9E4g+eKf/63xaW8+lSutSRkIyonH9hp2XOeS8ibfjrmSrS
         S13UwSDb7rcf+ceJ7KfhBmwj7aff1LCY7VMo4kvPzf7LF9QtCynm3SwRtG8MREvSw695
         ob5Oz/kXvlfMAcC+KUWWL6q/SjLmQuv40Vk6lMiqwd9odfO1SVJ6bwBcAWEl0Nohzfgt
         kaPnpvgMQ780iZkxeYCvdHB1Z3LHQMlo0dpClhOFKwo1eGNYPh1/JN1DfTEhKIpYk7qA
         A+tzhmpdTh0GqVrPqJwvrU2ezCP10h3kCEASRYPFOADnc1Ylmd7lCIT9BnCVG+3Roebb
         CyUA==
X-Forwarded-Encrypted: i=1; AKwUvBzs5m9EGUWx9Mkc1sJl8zzz6zgw2pMzQbqRH5eqIWMCIKYlkKvFFU5OIJp/n/2P/n7FU132ndFjXNu8mSR514du@lists.infradead.org
X-Gm-Message-State: AFuF++nxoCQ5rlahinzlg1udlydGZTLraSRM2r4oMd29AdvPg7SNuv3r
	vmXMHPJWam0Pk5cQ+r4RdNMW7x+M63DgH1PEaw0TG/lf9fRbthbd5MfFElxoK73Ag22M3qPApgu
	Nsko=
X-Gm-Gg: AYBFou0mNzeXMpd9GG4z7KbzdAo+9eP4u9udAcZupggIGl6LR6zOYBYZX7v3f//bQKG
	vrE0AZdBJ4Ls/5fdPnmbHz9ClRls5mbfgiINORJmrw7hvYwoHLFQeM1U64YmDWhudeJ9sAB009i
	nyc/M5b/FZvNBht7u73VUhIhUvApxI1gHF65O/zXFcr2+8kz69HJEf3ghYrcSS7RMeWDi4YVkAy
	obxHuGn+LG/838DHGpUiLmEIInAO0/QNZRKYPA0uI0r+WvJh38yMarV0LvTK8P6XtQlWmdvD+8v
	YZQ8ILfe4kpkv6b/F7BFG8Txr8Cl4bY04hvz1qC2rhqqtws/rtlf/owPwiTuQ6q2hECIOFmeFb6
	ZFcCHFuaoHi58tCNMuorwPwjkNYSwYecWeBW8Mc1WfgQ6uJbegjq/qpUV9dHMkZZDqumJ3gqTg/
	+gPOvN1Npi5kunwqrf2chCP8U9otSKL16tclL/X8oLKUXbs/43RW8ESjanAZE/eshEKQYqQnG5F
	DD6s1z9M2ilmRhlydq5gzQuyO1cObS0DoW8b3D+zG1ho9WUw80sYNsRhSC0WLb+pADW
X-Received: by 2002:a17:90b:4ecf:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39e1e49a802mr2704118a91.16.1789531210421;
        Tue, 15 Sep 2026 21:00:10 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm2030139a91.14.2026.09.15.21.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:00:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH RESEND v4 1/2] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Wed, 16 Sep 2026 11:59:51 +0800
Message-ID: <20260916035953.3111607-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_210011_573616_0A7A8145 
X-CRM114-Status: GOOD (  15.39  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index b78dbedfeca8..e75ed4bd458f 100644
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
2.55.0.1032.g73a4cd73de-goog


