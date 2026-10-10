Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76209CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=; b=lFw4A3sx1hNTq4EpRrH2avnMI+
	xO0tbeyEvPXA1Stmnudp4g74MqHm/UDs2E3GXh6Q4D70FEFe8LzhBXjpyVuRmz9C2NgjeisKqr3Tq
	JzQqa3v58L2wGDY/RC26q3LZCMnfbIPpldvRXyuCJzy4JnnpLKOXQ/S2c0ly1ijobuRm2GlW/xfCg
	ii/E6bf4bIf9/SDhiHPDKd8g0f6EO8cDa2rzBAqmbtbPslCeZ83NF4/p0olNWrPeBoTFJ87q1MTD9
	hLGWppzChQQLWi3PZqao2nttBIE2xC/mEJ8d6Qv23PH3U1Kf8x4+iyqrGkNQIV7BXi5uE2j0XlISX
	YF7FAiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVh6-00000007yVh-2eKq;
	Sat, 10 Oct 2026 11:56:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgA-00000007xmb-2aY1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:55:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-486e70f2457so238417f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633353; x=1792238153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=;
        b=F0Ez2enbvg4wRs1+fz+JxL6bo5NF3hR4o+YH3c8l4MylYyo/IxcOVgZrWe8seD3wWH
         J3ugqhfJWbyMh1QBW+BxAi91Pwt6cvVHIWxHfJMd/Hsm6OsgIdjW1dD1dU0K0oR5dn7q
         NZGqgZNcP2QifkbxtmDv2BITdWtOotaAnHYsOqSnc9ZZv8wHTlOgPsG/WSAKjO0+6GX/
         MtMgvaQEwvOA2zJlN+rG8bKqgzktDbJaLDqRTodaQwb1T/kHtNk6Fow+gMvIhdhBQ/8W
         gmnxcdf05YuRUzo2oBObB0RlmafUeGx1ntNPQaM693vV5KX8d8RfVq8CuA8fjdMPI+b4
         QG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633353; x=1792238153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=;
        b=S63q6Xvoyv4Q3e26nGnwXe5C9pTaOMZHV/NUGeg8aBs2grLNO+8IUwjlOT4H2VSxji
         TDnnW4OQ0hhri4XxIGomTtYWPe1fHKrK207LXVBRzSWAk1WzoILJG3HKe32CfVNx9uhS
         qyx3Tw+lUUTMDT1CFoUjggqQHr5Jb0bTpjnsSg5sTs0awqEi4IX3DMRtrelNyy9KyU+D
         gfJP3co6jlvE5PFfa/iTHnB3r2HUMhWCMxn5nydNBwiHe4ZpaqtLvgHzu4v3qqdpnE/X
         83b9TAiKk0RTc7O3kesrXnQreAoph92EAewXf3R2M89mkRzzgSBkuv4IZoIQ11QQfYM8
         ATvA==
X-Forwarded-Encrypted: i=1; AKwUvBx8dxBSjjJRIAE+hNwcDsqqbWG2GUXVVt7CYjqIK8yLuzsyXunvgalpRu7AENzNnrm0WWvvx0q55z7qmUnIMEen@lists.infradead.org
X-Gm-Message-State: AFq9FYI4PtjuhN7GLDCnrSbikvo9D+/PVImnqPbB8eVKyItKtQzM4LhM
	NqJw9huDZ+sDVenSmi3Xl4nI1OfiDU/NI7sOj0rcCk2dR9723fxuVo4L
X-Gm-Gg: AYBFou2aUo8Z3YRoJkoLg80KtPPCF5orXtM7wE8uamGEGKw+OQpaOLX0QI4vX7yf11y
	mwAz/sT90UVrTRvLQZUDmFix0oD/WFJY6+PG7IbKTIMSDLseWS3baZWppA0K1r4G3aKjAA3sCXG
	yasuwwWimEUUf/7cWaI8PrZ02rVVKOj86otxv2BfePyWYdTleuKjZSQxn3eskSqyrnGj1F6xfPO
	rTywp5K5m4awveR+HOgvB0V0f3FvsybXa5zcYC/0Ubr0+Y6JNtJTrWdHcl9j/cgS1q+u0seMDN6
	qPQUU+wxGOA/qPSEGJTbX+y6fOlle+Ofwwr/PvKsNYc3AJmgw3VAJANRu9W4vkAMfW9ftI+ymOM
	NhUjqbE6gAnYMWN5Wy5h7ACZMcXJvEnJBp67iy4Nl5wt5mMRFggw6aUVJsN5Y6O64iynIrblJBY
	AJf54xDWJ1Ty1PtOtA4hdxefhNdioJHzEKvG40oXIMoe9bfOlP5ZeLjr4hFNalG8WNLQ==
X-Received: by 2002:a5d:444d:0:b0:48b:fdd:fbe4 with SMTP id ffacd0b85a97d-48dba9c7d29mr7028135f8f.21.1791633352509;
        Sat, 10 Oct 2026 04:55:52 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:55:52 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
Date: Sat, 10 Oct 2026 13:54:01 +0200
Message-ID: <20261010115539.9237-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_045557_250245_CFB2150B 
X-CRM114-Status: GOOD (  11.35  )
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

The hdmi-phy for the MediaTek mt8167 SoC is not compatible with any of
the existing hdmi-phy. Add a separate compatible to describe it.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index ac93069f4801..f0c8ea2c72b1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8188-hdmi-phy
           - const: mediatek,mt8195-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
+      - const: mediatek,mt8167-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
       - const: mediatek,mt8195-hdmi-phy
 
-- 
2.43.0


