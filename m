Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F55C43211
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=; b=sii+mZhlR7ngv9bJ8J0jrtg7+/
	tUH1h9k5l3QUgZNqNpBaV1UFb1X/Tot2/5774/7YY3gDWoVRGWecZGMeGGmKmTSvNQQMm8qmfPDKs
	4pJk79JAYex/zlloNzLRBko9bLDLPfzhTKBFSZwIYWGLATrRAkBoxRXOhas977bNK1HaxBiUf/bF8
	Y/G6l54oLQat/PGkZXW/Xa9Cw/XgKKYScnL4nEsTyLofzhIq0xIesksNKQoTbyhZidXYr+tqHcxe0
	0o4RENwitdL1fg7W52KmZMWzZ6skVEsdiQFvt0f6J12lm1VhNxVl9bTtThq0idSeo/KnYwH9IpwBZ
	iUjB08Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQFQ-0000000CNLe-2Lpa;
	Sat, 27 Jun 2026 10:26:52 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQFN-0000000CNJq-06ht
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 10:26:50 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-139f1dfc9faso359835c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 03:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782556008; x=1783160808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=RF6LMMxbbNFUXFLicImDlmgh/CxnjvTa0a9DiRfAHY5u+MrU4ZEJB74T1N0k8eGLdK
         zBiqXhPODivY6MTrCZcGVIpbYLunNwHKOVtIFH1lc2Ppc1m1dGl7bNKDtIRXDlBYLI+X
         RROcAShovuC7IrO7LkoKh6qHCrOI16Ur1gzFOOxCGB+45WLGNZJWvn2uDs+cOt01p3gs
         P/T/P98IPN2sNQeR3GR7KQVCooKQwxUaFy8aSlOugwz93E8u8x8kA9Z4aLa02Aph/etd
         NnfmsDxgvNiCpqPUPvATIb6HLiXK/3rN9miTq3Y2gAzwVfSYr37PZAJYE6DobAC9Yqab
         EN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782556008; x=1783160808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=GdD5YJBi+3zn2vLDmSmogL7ANalqzdVaH/zIZ6rXBPA9COsVLLeZzwJmz4yrnMrF8c
         +EtX2A/ObA1Oh6VBSQnx7zjZIKixLfxw5SV0nAL8+UMcL3NUJHKmqPTsI6eunn8XkTnA
         qhRed76QYLQ1NJ60awSOsiNyG64B2OT/44krdeaQdYH1ZPAebKtI9YSQqyTGi8JmvUzA
         w6lg3yqv6YghnDSzBWKk5pFKUo10MBIEIVwrUvsw8pONZm1QG0tcXrbHpcw8AruTcklE
         R+DatMZTXESWGQrXbinzhf1Z+7uV5XrklmCT5ZBHV1xf8EA0WpGt6A4J58FOxIcAvvMS
         EOIA==
X-Forwarded-Encrypted: i=1; AFNElJ96DFORnZF4AMV0mcnxkt4jz+OvjzL8yvYfZen58fF2U/0onEyj8adEPTULXQ7i4PTw/69VXHehZ6umG6ArY3Zl@lists.infradead.org
X-Gm-Message-State: AOJu0YwesFKBo8+AZrAsmmnzYrfswhb+Qiqwg5KUrWZ4yZ9w3TTJbY8t
	XR5utaKYcw0c3iNOglTpOlYU9VfIh9oqkyrDGQvo7QQh3cEUHR8MNhLQ
X-Gm-Gg: AfdE7ckSn4+KFtBDmpLBVhpQE9khHEauapIUg1t1D4EvHixlPVTdyAQtdMXLLcVtR/Z
	DFdUQLPOVs0HNvivztPglRtVaRJIUhsI7cO1Bd56Fvot80GbZU14BDDIovzt1K/K4o2TWykWi/E
	Ist29wJ9ZGmUiQbhaD8KfDiqRHX2NsLiIPnfX9GDWVQ0pGiwdbuQRVKHsbRSgBBxRjlJXtBj86B
	EhQg/nnkGkBo4TqgzkYlfSttdN257gEjU19BGwdmUCD779mUkfSjDbs7qMIReSQobrEob7cSHYo
	3JehnxZ868wpAibMMBCGGiDOnZOHCeL4QGUepfCgRppVLWWeFhLvoy6uVjeGeD6vXv45J/mF3Bo
	HycDRn3jSqrciw7D2BXtcEU91dzGVTu9Mt4pzrP9LW7LrXzo1K1WVz7nEKB7ARn59dVsRTP/h8x
	E4VgdrVmG/zcKCdQq9p+g=
X-Received: by 2002:a05:7022:6098:b0:137:fb6c:5355 with SMTP id a92af1059eb24-139db9e6413mr7764693c88.3.1782556007971;
        Sat, 27 Jun 2026 03:26:47 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm43776437c88.15.2026.06.27.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:26:47 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Sat, 27 Jun 2026 15:56:32 +0530
Message-ID: <20260627102633.86222-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627102633.86222-1-hrushirajg23@gmail.com>
References: <20260627102633.86222-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_032649_064356_1DD89B91 
X-CRM114-Status: UNSURE (   9.53  )
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

Add device tree binding documentation for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index b023d4cc9842..b5a43fd5e546 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1311,6 +1311,11 @@ properties:
           - const: vicharak,axon
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman2
+        items:
+          - const: vicharak,vaaman2
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


