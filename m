Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CF2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hfaIU/yPmRs9H27LP1GQSu+5nTkg84M2KD+Fv53tNQ=; b=vhN4+tmeesQiJNdI+TW4MNY+lJ
	rB6NmmpLOxxcAXm/PCxLf2HY3o/5g+HT6txn39phLFzgbZWFMkuq/N6FeQtGgXKm57rOVK0c7fLts
	Ls8JiqEuUGkm6zzZflWfXhlH9jk1Z2BKj50t52X2x47u2uORqJHXUSZ/sYQNNiqz0I/2ufPeSDerB
	ijks0R2Az5G7iXimrKD3vb/4MqPwgMQxReCsEru0Ro61xhZV7L7w9LwWLYuRgMgRjfJoNmkz4uRfd
	mEeEZNQL0dRwo9bFjXhNJMfS+rFeXqpCzPLLZ64l+5ckM1Gk3PxDz1vpHxK9+gEK2bBNFszITASO1
	t/51I3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRYg-00000007aXv-1Zq3;
	Wed, 08 Jan 2025 08:36:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWK-00000007ZgH-0vFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:34:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2162c0f6a39so11091745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 00:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736325271; x=1736930071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hfaIU/yPmRs9H27LP1GQSu+5nTkg84M2KD+Fv53tNQ=;
        b=Muv0luNP15mtRNC83ydUQ5OPxi38FZMzZfLlR4NdA0+Jvgdu+X2PI42aY10odD8Q/A
         bMv8/lXHboVYo8LaB2sEI7NRV+SrtKqSxD3VQGpVqlIblVlDJFOgrMBQ3MYHIzr3MomJ
         X7Pqzo04slHPwTdhWfDg/fMUb1+15lhkaVN18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325271; x=1736930071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hfaIU/yPmRs9H27LP1GQSu+5nTkg84M2KD+Fv53tNQ=;
        b=BRQ5NM9XPvVzW0MCqNQntHsW6PvEjxfs5CLmPWGMRNhwbkb9OxOWnQ4yyoCATXpbDF
         txjyYR4prqA+8pTESyLQXUWGkc1ZboAS6fIFNByAiM0UH6Z55swR7ZjEXTvOVEfZg0AR
         LH/wOgF4MURaSC0/6l73rABXfozvydLcW9uO4FbH3vZ1sJxq/JFHFW8103mVVGSYC7ur
         FAwdRBhBi0mjmprzOjGB0WVgaXr7LBc1/cumP92qVYMIM5b6OGsazApv/YWS8+yTowlv
         p63iWnGn0NgzBmSNKulnPS7aLNXqfglVDdmnMaGMK6PWz6tu261UdV2qPPF/U3pz2a4N
         MLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7gMuQwrteQ63sesbpHbiT8RqwQw/BlTYyNaYYCRfUXLIAFkXQZ6b6k95OyKgZFYp3HjIZDH4mUqHQRVhltSUb@lists.infradead.org
X-Gm-Message-State: AOJu0YyJimGm2T6xJC+eVEVd1Lf4XDStd9c+kiC3FxJc5cm7d9nmm/Cq
	vzbyVQLJDKJjLEaqwqMl4rz2J2DQRlDjgBz4FAr9GKywN7uExDPMl5g4Gjaqtw==
X-Gm-Gg: ASbGncv5+pw0SyuRJsTywkwS4tY8hfIi3VaZX4P7SVfiVwu23gYkkrkRwv6SCa1W4h8
	5cTSq1lVkRKCzO8sLk5ZQnrJ2tvxJVycEqSOXC+XZszj9KMHN8WFVFG40aro153cFj6iDpz34ns
	n7VCmnf4IuVKUrp7/6mD5KtNiNjLw3rhJAmVc5B9qz0YRDKQX1OmBLccb5YynYIhv8rY71Y0EOs
	c2KAhnjTWuscrZni4brLgHdl/+XWtY9Y5YUebTT65BTq9beKbvT20crrDUhb3T6QmHHQutaazw=
X-Google-Smtp-Source: AGHT+IHh5Ox0Chj79W0aML3FVEC2y3iYMrkJc9FjsPLlxqd39yrbKX0TlyMbXPcw3G6R3PveYRKL4A==
X-Received: by 2002:a05:6a00:aa05:b0:724:db17:f975 with SMTP id d2e1a72fcca58-72d2174e8a3mr3807524b3a.12.1736325271398;
        Wed, 08 Jan 2025 00:34:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:511d:2d5f:1021:f78f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8361b7sm34602275b3a.74.2025.01.08.00.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:34:31 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	YH Huang <yh.huang@mediatek.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
Date: Wed,  8 Jan 2025 16:34:22 +0800
Message-ID: <20250108083424.2732375-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108083424.2732375-1-wenst@chromium.org>
References: <20250108083424.2732375-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003432_248756_EBC90754 
X-CRM114-Status: GOOD (  12.29  )
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

The MT8173 disp-pwm device should have only one compatible string, based
on the following DT validation error:

    arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm', 'mediatek,mt8365-disp-pwm']
	    'mediatek,mt8173-disp-pwm' was expected
	    'mediatek,mt8183-disp-pwm' was expected
	    from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
    arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['mediatek,mt8173-disp-pwm', 'mediatek,mt6595-disp-pwm'] is too long
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
	    'mediatek,mt8173-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm', 'mediatek,mt8365-disp-pwm']
	    'mediatek,mt8173-disp-pwm' was expected
	    'mediatek,mt8183-disp-pwm' was expected
	    from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#

Drop the extra "mediatek,mt6595-disp-pwm" compatible string.

Fixes: 61aee9342514 ("arm64: dts: mt8173: add MT8173 display PWM driver support node")
Cc: YH Huang <yh.huang@mediatek.com>
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 3458be7f7f61..f49ec7495906 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1255,8 +1255,7 @@ dpi0_out: endpoint {
 		};
 
 		pwm0: pwm@1401e000 {
-			compatible = "mediatek,mt8173-disp-pwm",
-				     "mediatek,mt6595-disp-pwm";
+			compatible = "mediatek,mt8173-disp-pwm";
 			reg = <0 0x1401e000 0 0x1000>;
 			#pwm-cells = <2>;
 			clocks = <&mmsys CLK_MM_DISP_PWM026M>,
@@ -1266,8 +1265,7 @@ pwm0: pwm@1401e000 {
 		};
 
 		pwm1: pwm@1401f000 {
-			compatible = "mediatek,mt8173-disp-pwm",
-				     "mediatek,mt6595-disp-pwm";
+			compatible = "mediatek,mt8173-disp-pwm";
 			reg = <0 0x1401f000 0 0x1000>;
 			#pwm-cells = <2>;
 			clocks = <&mmsys CLK_MM_DISP_PWM126M>,
-- 
2.47.1.613.gc27f4b7a9f-goog


