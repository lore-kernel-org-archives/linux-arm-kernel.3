Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA55D1171C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V426SONJx3MLBE2ouij2w9iGSgsxKgZI4w/+L3SS0B0=; b=4ARiKeY+hUjazEre6E0I25aKxh
	k4242pxo6ngdRSRqtw68wi7OITveV2Oy3arYenhs3bmnRgFIvTGhQxR6oedJdosC5ZvgJW+Ppuur5
	aybbUM/XT0KZvkJqthi/qP7FDsS12o35a0WIBX1aIImHLR/n1wjuZDkX1k+NPPC8eOv+z0Lf6GsFq
	IZmaNKBnt920lFqZSoVWdI1Q53bkbkwYB443T5Ix4QEO+Ko6crUXCNPg7KZ7jWxIE+TUbifZ4twPL
	Y8wrlYh5eJio1yjB3dSFwIxITiSS1nzFLfUwOoq+stfx+hvw5IoJcrh9LdtXy8SIhbodCE7bLozjR
	vXuNJHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FLl-00000002vJr-0qIw;
	Fri, 25 Oct 2024 08:07:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FIa-00000002u6x-3Cu7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:03:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e4fa3ea7cso1240828b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843436; x=1730448236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V426SONJx3MLBE2ouij2w9iGSgsxKgZI4w/+L3SS0B0=;
        b=ZkKGzL26BdmZT0o7sT1fy2dgDka3KIceSU981s4ay0k+HRHP4bJGnSH+l4dcKygQ5w
         IcCt5jQTk7SZufg6tpPw7y3Cvdq3D4opkVNfqBXUQuZoUv+rn4T+NCm1ESZSe8zyuoPj
         qgXL93mRFKxkrZDycewaXiT6pEh87SL5csw5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843436; x=1730448236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V426SONJx3MLBE2ouij2w9iGSgsxKgZI4w/+L3SS0B0=;
        b=rcrp9pLB5uA+RrBeUxIAml2VHXIsXbIUbsn1mitRcCaXSwWM8M88c34MfvQESkum8d
         xQLYqS0qx0wwXcqoA9SlWUGRkkUdP73Pp0Ast2Hxgg4gEno0HlFxDBEFsCixmM/AnTcO
         DY1/FvBijA5juNLfxnDGkoDGU4AyD1b0zgLqzCa1WuhNvlgD6LfCPv4y0WJk+CTuuE13
         6sbdg++zHZ0X/OY3+vU7LzegFaFMbLuBn3/kRa0Hehj+DpjvdBCJcI3VPplmmWCvfh21
         anWEQJgSSf59OCanx0W42ZJLV0Kp0SZVFdzMQa0Hpib/eK8fBY0bcFreAWIzHca6UZSa
         tZlA==
X-Forwarded-Encrypted: i=1; AJvYcCVbkG3l84KAe8zAqDuzCwHG5i3m390FBL6IoVtTdAqqfGyqxcGaGgSKIsSP6dfcmxYeIBpljqdopB1RIoCSWHvK@lists.infradead.org
X-Gm-Message-State: AOJu0YzkWEMoet7gl82QGB3Wd3xVQIKIV2vHf89S6cW7YAOVPC84FwNp
	T8++neCkW4JO81eNuxO2XmLokcrkruFh4uOGJl3hvYvOz5oOzjqtyntEvaePig==
X-Google-Smtp-Source: AGHT+IGPF7HJ8L3nCZ+GHTH78bcR+LvoLHRv7xDwbVUo8kTsgGTY9/4E2fHll3lkd4t166jBzlSafw==
X-Received: by 2002:a05:6a00:194d:b0:71d:f7ea:89f6 with SMTP id d2e1a72fcca58-72030c6f2b2mr11752920b3a.18.1729843435814;
        Fri, 25 Oct 2024 01:03:55 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:5a9f:16cc:8d5a:55e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d025sm558120b3a.101.2024.10.25.01.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:03:55 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 25 Oct 2024 16:03:48 +0800
Subject: [PATCH v2 1/4] arm64: dts: mt8183: fennel: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-i2c-delay-v2-1-9be1bcaf35e0@chromium.org>
References: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
In-Reply-To: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010356_857437_CEE871CD 
X-CRM114-Status: GOOD (  10.26  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: 6cd7fdc8c530 ("arm64: dts: mt8183: Add kukui-jacuzzi-fennel board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
index bbe6c338f465ee7c11bfbfc30767bdb142706480..f9c1ec366b26607581c116b364cc2f80f8621a57 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
@@ -25,3 +25,6 @@ trackpad@2c {
 	};
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <21500>;
+};

-- 
2.47.0.163.g1226f6d8fa-goog


