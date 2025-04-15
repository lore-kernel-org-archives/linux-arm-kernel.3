Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7C5C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 02:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD63xWUiken4bOc7UVHKp4kXOXY2WeTmkakYs1rcMNg=; b=3l/X+9CqSSuE9od2SVRuI9JOZJ
	gmRPETek3G/Be3LKNlymHSa0uRHXcJ2WXBOKzHgFgGI62Rt7vjqMnBAy+A2YM3c4cCjnbWEv6E9GA
	mS6q+2AC3meqG4uwORgP1JHEDf32pzaFL/Wzq0tFPZHTSsZ/DsfDefco1GvtbtWbc0g+MVbqpItOF
	c1Z6rqUV4b0GaHwYrBL1cjHP5e/Tcp3/Qo4ma9mLSA3n/dku+2wub6trUCO5oM2E9KMppwxwaJiZv
	/SMNSXbIv1r7yFTKsaKwOkO1pdqP6AtMdD+rDZKlz/8MtXUkKmmCMN0qw/62fIPmhoEL+WwK2O2jb
	UMWD/7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WU0-00000004G7m-43qc;
	Tue, 15 Apr 2025 02:57:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WJD-00000004DRa-1uEX;
	Tue, 15 Apr 2025 02:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A5EE4A2A1;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE3C5C4CEEB;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685157;
	bh=uMxf6PyjUiBPhkaKa+YXG1JpcOgoPD6r+dpLZyFYDyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mmJVinlg+Yvcj+cvNnDyPnPCW2jXJlX3cuJcDCioPLiF3Ts/3lQAaX5EDNwD1H3fT
	 DRDG69vBR9ZVAn3QLwB1cek/y2aqyTxzroE2U8xPlvedzQJc1cHK5npC8qM2ERCZdP
	 0NBhE3e52ZQYGE3UE5EwbnJILGfraXM8VM0Tu1V7AHpYSZFu3GSOxqLmhT27dfNBQS
	 fU1t9HnVCGcVN3yBbEKw/7tkRxCVkvy8CgLngFHJjWJLKRdlVGjH6wZYb6IT41Eka7
	 4jpg0aHodqzwBRTz+bvtOohXwd7fQp9TSUYRUgsHTo/g/2IX3rLPPwKI7Q/HvbkzRY
	 2aTL3eBdocHlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5817C369B9;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:25 +0800
Subject: [PATCH v3 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=875;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=P5KRner9ELHl3o409yiGCGnkva5HFExJ3rMn3+oG1ko=;
 b=uMAB9xx7E431TayRAue3yuobamxsychqlDaQKgfjp5C+LsrdIFynUExHqnWcAPkJpRnP507/S
 HB0rtVEChGQDNMWcDPOC9X3c6YJfRKLOPTDsY6lQyP593/Uzqy/mSWQ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_194559_512844_3AAE64F2 
X-CRM114-Status: UNSURE (   7.47  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

C3 adds support for clk-measure.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 77c281153010..275afe7fe374 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -22,6 +22,7 @@ properties:
       - amlogic,meson-axg-clk-measure
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
+      - amlogic,c3-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0



