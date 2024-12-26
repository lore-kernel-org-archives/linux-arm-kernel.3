Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20ABE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 05:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZRP9EHYiDMQSE40KS4tBLSjVo3dw24UwSYUpDAW6ko=; b=Q2KNmlds6EOW84Osm9VyPu+L/a
	o4YUuFP6VohZX/31uWS1rIDkWtep0lP2jJShAC/Xr6P7IDOZZs9wPGlBQxqeED2XoUpA8+TFsarCA
	9l3RGLuTm7wxl562tcUts3nytPh8FoihQaCxcmFeDbD9wmbbU2IPQwLnIi2CIGxPuVjEgb0ha3Qix
	feu7XFI4Nauo1C4ji9VwA8FRSHfoigZGBsOkBXGmpiijdZx5CALl7BMT9OcJimXMYSvz6nN45Q5Xa
	5Psk207w73MU4nKGs7KbNvhvTj1oZtFdMkFh5R2kashZLumANNCXn/BOXmuETl6hAAX7T3LpG+56c
	y8s8YyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQg9J-0000000F8Ny-3F62;
	Thu, 26 Dec 2024 05:11:05 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQg7J-0000000F7vg-3tCf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 05:09:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735189739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZRP9EHYiDMQSE40KS4tBLSjVo3dw24UwSYUpDAW6ko=;
	b=F+SNPbVh4FdD9yMy1bAbihcAIbPtkt2JBR5WmXnwwuKaAOgpJCkHP5DeoQLyYfTCFWxtQU
	0pzScr+1qMK315KnWelMxeL2unZjvukBMFM0No3D4SItsfW4fxkimOGpGBqBsDg2rzdeTl
	k+VHNc0ImSufNn5nQhvveMQ3tlIej/rqIvSmxZdu+HZ1XTBbH9eI41Cc0+hoyZdru9ZaIE
	2e9gjOmiTbDaEyixvKhXX8b9YjTZIYB+gzXLLxNMaYqQp/Xjy6RBN3PxK7xmkTP1wv4aPo
	KUFWj7a0zRLuNSYWlb8cpoQ3zl701Gsk+AMEG9+jCDFgf2txg+Rxvk+km3EtjQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Fabien Parent <parent.f@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Val Packett <val@packett.cool>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Thu, 26 Dec 2024 01:58:01 -0300
Message-ID: <20241226050205.30241-2-val@packett.cool>
In-Reply-To: <20241226050205.30241-1-val@packett.cool>
References: <20241226050205.30241-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_210902_112271_7D8C20D6 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 86451f151a6ae..73103922978f7 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -38,6 +38,7 @@ properties:
           - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -66,6 +67,7 @@ properties:
               - mediatek,mt6323-rtc
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
+              - mediatek,mt6392-rtc
               - mediatek,mt6397-rtc
           - items:
               - enum:
-- 
2.47.1


