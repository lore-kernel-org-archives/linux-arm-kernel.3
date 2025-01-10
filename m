Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66619E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czQovKHFJiawW3q43/tzxcBianm24ydViBCbQnMA+dM=; b=1wRMqFVlucVdsiXli6RHfo1dT6
	gS4yzSlhyLFwMMUOhcDUcAIDTkmiF5vZRRlSAZ2FRsvg5G1pG5KJXuWEoPVSLvuVqhYXLVBXwa5DI
	TagfQeVUGO14JdxlyzE5MSOkEW3HZYUzOdUY0IYovnn2X3uoBglsyIj/PLAJcJmVGsgVUcxYZ8SJ1
	oCbqRl0cs0Tdmm2A/i7RNy66MHODe1aes5BzY4fcdKE7xkx54G/nSO0A6i7K95COb2gAVyQe1AXSW
	8xrzQNl6ERAanOlI9USeWT7TPAriiJlf3yRyTiAnAXIguukyPQVyB0hhTi6Ygo5Kkuge+OzsmhiOJ
	p5v2E+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFCw-0000000FVHe-08Hw;
	Fri, 10 Jan 2025 13:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6p-0000000FTvC-0rnN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 13:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=czQovKHFJiawW3q43/tzxcBianm24ydViBCbQnMA+dM=; b=qGtqpihUZpOkhDd27/pxotPvdy
	IM43hu8UL3/+MkcsLI1hxbqSsVdV3VawMjKDt0saLoRVdr8VBXHlgEzF99URkbPYY4Ys3ZCT/4dOo
	KnVLPLWVxeP0ycfu9lqz7HI+00G6QMTvQmYSXiStcG8OkaFkBRptfC1lCDb4CBmCnhRtQWWXGnUil
	98MUxlfRjv0xwwO4NxQu3MOL8vSFHEKQjPYiAubBwREqJZ4sfkeS2puiZdclaSIoxwIa4BDtIL/7I
	f70qs1hQ9KHLRgBhk6Tvpal4jzQy8z3tCoG2taxspIwS6IKtIdrVPFXFgJifXYeaD1e8a4hnhbnjn
	RQZeECtg==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6m-00000009m9X-1zT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:31:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15541435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 05:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515886; x=1737120686; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czQovKHFJiawW3q43/tzxcBianm24ydViBCbQnMA+dM=;
        b=jeXMzEKAoM3BVFS5eGdmBDfTDkBMykOFZp4TmVaQi/N9WiUnzFYeMNk8MqVPL0H/zz
         1tlNlyF1vhyT8VAyozlejgNw9532k4ZbG2gzDqTuxBX9seIJfZHOC71BD+Ze8MXu3TYt
         /0yBkOabszEqP6bxZre2vLWz4sbCSBC3vbjlJoLato20uzICb00QdkfhpJv+hu3CbHJu
         zCWUJKZjEPdMLmc+R+CkhHDZyuA6sIn/gDYlcVXnL4GNEKgQyjKT5EYJvgtl0XAEHhbe
         HX8zS3i2pDKYFtYvMMwLY6QsVTJgrvy/+fZUpK2NqVXuBv2N0w6QpbxYV1mQP8hYCEIc
         WFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515886; x=1737120686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czQovKHFJiawW3q43/tzxcBianm24ydViBCbQnMA+dM=;
        b=AkPLf2WUqRlez7/ozzndlFwA+xJj9xgGoWcLMeYbWKZZ4xLHYmuIAFZD7wEjdDUgS5
         yxgA8z6XhSebm0EsX34bUH6tOFtI9Gl8fbiwpJzeZ1r98/L62PlG9OXL8ci9uOV4Ce8d
         FE/K50AqTC4FaY7b3pjyzl6533lwov3rOGYD90RBTWZGwj0WEdltyt+2v++Ok/xvqA96
         PVSEwgA550cgNkgAviPmj5kcEhWJsg4YUGHANav3fnVKodRusWbYDO1yicik57KmarA8
         0uNMa7e76XimBnwd/iSb0m2NKBj6L8qoV/SYoewaJkrhc1OfIdfF2XkCAEhAcvtVPDrW
         kDbA==
X-Forwarded-Encrypted: i=1; AJvYcCW6iL6yHxWBZNZRal+rq8lETNaCX5v398BCkMu6o6Ac7IqZRJ3R07KEmBNivBvAvOr5NrDl5D6NPatoQg3RH6pS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzis4h3SBzNWvzuCSqVuo4k0uUwJaQRWd9MkxGBz045kSLMcETT
	IrXBfXkd0m/tRaP3DfdNFWiwzLbDdpvZO2/ot0sRj6kH8ghJ39AjmKJ3w18WFVA=
X-Gm-Gg: ASbGncuKpSbMOe1DAIJbu9o0C2zqL6QgnRA157jAZZVX0kth9joFfe9YtaQGRO13qFV
	ImPz8VquWkhD1utcA/Qa/FypjJBr7vWOYq5uV2vQhqE+qMrYkPxQT+P9/3ny+3Ki5thsWGjvSWO
	L1FtZVx+dxQZL53vXuQ8TFOWtcJGE/HRYcFIEX5uKEwlgI500zV7qbuH17W46xWwiM3IPQSuKcX
	c/bqWpToVT7gwj9gEuJw7yj25rTQMn3dw2lynmkalTVXFvod1Ua5m70G2Tk
X-Google-Smtp-Source: AGHT+IGPagTUjFwrYYmmjtjuTfXbN2bDVAsHyXfD27cOpCNW2lmXYAioeDkCa1NDyoNEQON0v8I1+w==
X-Received: by 2002:a05:6000:710:b0:385:f4db:e33b with SMTP id ffacd0b85a97d-38a872db2c7mr10663137f8f.21.1736515886322;
        Fri, 10 Jan 2025 05:31:26 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:31:25 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 14:31:14 +0100
Subject: [PATCH v7 4/6] arm64: defconfig: enable display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-4-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/FrM5Q7dkW2P/a4wYWyi5MUyL8Mql8ICFVAZt1ovMlM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEnoSo2eM6ojRqCmld2hpFcaxilavl+I21EUqLr
 Kup6t+SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURQB7D/
 9A/L91PiiGu2rK2SMP9XGcogr6oaqx6UZaDXrDKetU5D8kgdn7C2qhIjPzekgzy5B8ZbekLxqmm7YW
 PMw7IdT778IA30r2Dv3xkkjoe0EZZ39x+QTxTLbhd4xFSQLL08xnf2BExPVCJMrVBA0gI0zjNxw0dB
 UvzNve5p8WDSB3b8EYX7Tcx2r4tnFWRhlv5uaGziE2vIyxMAEVAzO/jwryBD4w9IoU4GIHp2w5rmsd
 i8l+fwpJp+rvhZUIrm86OU282/J5plCcuCG9NdxJjwAf73Q4m5qAhyz3JQtrFWEsv9/a3FY5FjFgLG
 Kp/dJXr4rspqMnXVGnIc+9yfRR6JdtGODsq9d80FoqkPQ8HQ+Qz8bbaHAg63EOTIFx4KX2nAdXqQSJ
 H3POeEMfpRMigfsIDX0mKw3KJzpRVdfwYKk8zOiKvjsIGq+c9HBXz8mQmq92oPyHH17wBN3EFKfTN9
 Q7x5bPl88hrGjH927T7r6sPCPckmUgZ+oooJjucg3R3CbiEClThzYPsswxpict7DcNfnzz0sXGG6wr
 wNIw7x1GPN2cVka5ughYRn4aARpjw1XAlAmKyGN2rQK7ToCTkoNYzW2VBzi22tLfe+hyreHgTB+9MS
 ThR/RoVxRpcIOa3VzZ5G2cb4Fur8bl/CNAQT5uJ0J0LAczK9D9jTqY/jMpjQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133128_733951_B2056CAB 
X-CRM114-Status: GOOD (  10.72  )
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

Enable the DRM HDMI connector support and the MIPI-DSI display
Startek KD070FHFID015 panel to have HDMI and DSI display working
on the mt8365-evk board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..1e2963a13500 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


