Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D8BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=; b=1PEmzEfOc6SkAJFjgVAmbvCLBi
	VVoqCkcNpsuDrla+A4EDqGEBfhHRRKVUu4XzZenpc6sN4vGr9KeWJmrjzEemJwA4mS7gj4lMT1vKX
	UYQ3QXR9ojl0cpw+6sXQTRWVEMWuDekfN69dvtZEwUSET6qQYxYFHyeBVHeKjqZsM1RepgLqKs0d1
	29GPwR5LCBP/Ntfr/BS1Kvc/b1YOHbF+hFA00ee7a1ZZ6/SEGmZUiDlmSZ5Ok8AbwFrJHPuAQoyKv
	kYlwk2AbhsimAAB3MKlV55HthymwXF3z56YnLMWZDs2p4e7MYgm3HxRb1xGPgaMrr8WMsAv+F1clP
	nYTUBfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdQ-0000000B2QI-3iW3;
	Tue, 14 Jul 2026 06:28:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdM-0000000B2M6-2S4y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ceed7018c8so2560945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010528; x=1784615328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=DseFrptO7SblaU88raAXGTmIB6332zZaZ96FQrHJlJnWFXyVtX5aE22S+kaXGNgaDk
         raPaR1nVG9YRHDxykqPg6oXPnT9/KEJQiihUtm+O4a8WmACG9xWnwFryQclUHaMzjbp0
         rn8exe/0pD/MUyg5xVbzfNzXSMSOZJ/sh+2clNFuk3vlFc9z4PNad4RJSOopmAbJmWxs
         RYuSNwwCUfytvx3TcXvaYxTCfmzRwAmCTTU83iGRiX06zheA/++B2IcaIdJYf54A5ynx
         2+1JyOqfU+0n2kaWKB+TtGZyasc4yvw1ONVyPfQtNUitN3hI5J2kgmgcq0O03INhVHxM
         cC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010528; x=1784615328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=h2kv6AF1CS1cR0Slq5C95R3inQ8AxlKxKwgwrp/9n77x5TVvcbGmLJtH8cjniXv+kv
         1KU/TRinffcJ2KQJiIB3LaeXNlOVWSYeqZSFmG+mo47BqEjXtilFyQmtt71uF7sQYcaI
         RBhmogzQArHnLUtDrObApZAFiGrH/JDkMvSa/Rm3csUizB1UA/Xc81pgVWEvqSLJoybs
         eyEKfkPOUftfXsyq/iXlnul87hLro7ydiOhSR6FkYCBCGlmsCerim2Wl5CQWxLTgY23K
         y4So2NjJdOyI8MNYzMYR3CmKVIUDKIvmyYqNQF2QsHD9yQrV0srSHR1ync0Y2CG0H5W2
         Afbg==
X-Forwarded-Encrypted: i=1; AHgh+RoUz9QKwFZP4Y6PZMbjuf8OmR4iR3T5BSzBmPgV5XHwqbPad8NNflz0E70n6MNTDge3JJToZruTOJtsfgorFs0F@lists.infradead.org
X-Gm-Message-State: AOJu0YxdJYwP0VcwaEhaQT6kGDn0osbwy2ogz7UZsSfDucO9mwlhdPqG
	HWUUQetyzpSpFDLuOFzPg0dQ3G08SIyPnZS/0ojJ8Wfy4OWKc7OfGije
X-Gm-Gg: AfdE7cmQQHs9ymUFQQLNTgNPbf+GCIuxMZBzpVZSrlMxz0yt+bZDjAfn5Hwn0FECrpb
	fyVaSuODt5ANxFvPvl2Sri4BNmeKJ+NcNHcnmN0RxTRjtoYmqQctgZcqPToGWrUwql8bvU6OCWv
	bdpWyLXbqYF67E+FfMiUdJ4ZamCPeXOASaWJUvvZuzmWpZoxLYseO8iVascG/CiKH9tTcgJoC7A
	2l6gJPnE6IifT6pvCjYdhMkEO7VuU5dgK+vj5wm98OcFlLkjMoX9aU5PnlyuE+eTCP1zofLa8/t
	sl643JSzGm+KtGw3OMNo7+oLtxYisOeyCcTw15BvRPP2l4Qiz7eTuMDSp/m5ce9Xp5LWixYYOXT
	ks+zbdXDYETO/G4hhA0Ufj1+MGAdg/eyfqWapI7xZiGRLcEk9IqsEBOuVbngRF1hMRkRdlgJP+u
	y1jDj3ZU1wU3aWt1clNmjvNl9X2cGjQOLt/xZ4rsbzK1X7WfK2gcoIWNPLW9jkOJ6bez8pEDjNt
	vZCU8jeJBNQaT8CM8MbXVHZrtDt1kvflDsPmuKYDL7ZNZEisGm40Z8ShWC8xy6H
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr119230495ad.13.1784010527653;
        Mon, 13 Jul 2026 23:28:47 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:13 +1000
Subject: [PATCH v2 06/12] arm64: dts: apple: t8103: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-6-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xmMouJqPSJF1noyrbuU/0zUwupFotSdCUmn22tNL
 MSs92h0TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApvr0IUaGNct4zP8pn03a9lHU5/6Uf7uPburYLLTokoCc8bOoqbskGBn+Z1p5ude
 H77je+v3po+cBclImC7/Ovie66c6Jt66B6s+T+QA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232848_630166_6CD231F5 
X-CRM114-Status: UNSURE (   9.15  )
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

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 4d6a0411f086..5b68bf0df4e6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1250,3 +1250,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0


