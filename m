Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F9D11717
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=; b=GcH5hNJkycc3PkoaMhNtzT0xdt
	tPnbphL8kKlPT3EcAFi2rtoYYRNFfPrt241iZBsbWV2wSnuy/9urg5u/ccNs4ljxaO1PXBuZWy36c
	4cLLiVe2w2jS6abBRJ4oS1V8O4l2y64fPXQXZBVbmMeqOTuSSqTsQVsPlclQCFrghVNTg5MRylbj2
	8qd/G0xxncckDLuiC8JjpjsVNoOTo9rbtFyDfVJ4KLiOASGtA1dDXjUKW+GVFnLXatnn0c2XBbQb5
	CMZXmXIcfdn0Xl9CGK5V3kgREepW98gGN+fGAnopV3fTsqkzAe6ax2Cs3sAfqYYHbfIeh4FRPmLYw
	kIxaXu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F5d-00000002rBE-0Z52;
	Fri, 25 Oct 2024 07:50:33 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F3z-00000002qrc-3aYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 07:48:53 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7180dc76075so959843a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729842530; x=1730447330; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=BbTFXmWEOowYiQJnFqWHlpVxWcSjM3fN/G8tpIZ/DOi/ZBZKLf/0/LBW9W7rlI4aG9
         BRg2Yw0f+JIYMJT4aiTk+nLsaFgO4zuImbKpJdiHUlCC6n6X3l3tmB22y5Fl0OOPS9D2
         P7J0n9Yzp0os4fOKkhr/cYvuM+sw0ueoEbtLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729842530; x=1730447330;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=IIpwb+t0O+qgq619WfpD8Bqbhhm8zsMc/C5sFDcISexk+NqS8YDNIc0DQseEYSlmQy
         7PebMHLPQDlUYKEJrGiX9VL3wy+L2vkFP+BXFFm/kV8XWiPO0XiesxHPceARKNDFR4CM
         sYT6BojRtSYX5UbZx+HWOrsKuDRgJe09+QRtNUeKMfsSvtUf8Aifgc4vEzY/5aeBJrxb
         RQM41HO2pi4uW0IeqmvjQn6M+1RI8+thCrplOgs/7EZ20D3CmxZdgbtobFgv4M68zU07
         mxlBgLA2lUKweta+k30KuJn1YuwE/my+MYOcPafXBSDnvdw53hoiESYDSXAQZ90Dtk47
         23Og==
X-Forwarded-Encrypted: i=1; AJvYcCV+0KNA6Ee1+VzrQ/gIyX6LVG8HucHBSHw2fy7AFNHHNtvuQtoMwJgOuhvcH1BP0c/W6M9q8rge3Ni4pzEFkIfU@lists.infradead.org
X-Gm-Message-State: AOJu0YwY0ej8HJs5c4M7sguOX4qbDbEO70SVFiBUiUOQXDIG2+4EAr2o
	VIWuE1rLTuF4qjoTLhiB0b+DHqrK7787Z9DFQZ5S11jK/xXfC1wvJvZLV7uXMg==
X-Google-Smtp-Source: AGHT+IGSIU/bFTwcE96kf/0wGJ0BJfJiuO8y8CrN5NyTUQ2vHijmdL2HboIEe85P5cA+/Hj/rUfY3A==
X-Received: by 2002:a05:6830:25c2:b0:718:1606:c2df with SMTP id 46e09a7af769-7185940f8e5mr3286435a34.3.1729842530333;
        Fri, 25 Oct 2024 00:48:50 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:5a9f:16cc:8d5a:55e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793189esm535527b3a.58.2024.10.25.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:48:49 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 25 Oct 2024 15:48:44 +0800
Subject: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode on
 Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-damu-v4-1-241bd9366c20@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_004851_968377_33F5DBAE 
X-CRM114-Status: GOOD (  11.56  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Sets DMIC one-wire mode on Damu.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v4:
- Add Reviewed-by tag back, which is dropped in v3
- Link to v3: https://lore.kernel.org/r/20241009-damu-v3-1-1294c8e16829@chromium.org

Changes in v3:
- Add missing Sign-off-by tag
- Link to v2: https://lore.kernel.org/r/20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org

Changes in v2:
- Add fixes tag
- Link to v1: https://lore.kernel.org/r/20240910-one-wire-v1-1-d25486a6ba6d@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..06a689feff52945d141d196d439cba034f25fdf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -26,6 +26,10 @@ &touchscreen {
 	hid-descr-addr = <0x0001>;
 };
 
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241009-damu-a3f2f3478409

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


