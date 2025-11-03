Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3BCCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPWqT9ltZKPbWWhVTqxcM6qSbxQc4UppEkvUs5jJNuY=; b=VNpC9AJekLz+TZN2/ZH4nMdvtz
	hsatiFHzqc18Q6vsl0KRsEF9SlCebOWAgO4Bt3lVavWI6dAjH4ICqaPwPvkkjaU4hSlBtJgGKfPK3
	ZFbPOOJtmC+xe+h/R0kxeAkmX6SeQUnWs8uvXykbeRep+QypiFZIdnoklJLDg5CiibMTIYjiEF6Cz
	KFXjsAyuIQ7qITuz4eSiSXuy2JRP9bRuTTicRJVbcYicBi6XeUbHqkNogkfbP1Bqfxs+2ovjifMiA
	AzEMqlbEZ7xMK4/U39vCdtZRDY776cslAbMDbHFfEEae67DGUSduOP4DXH9M8p7D1SlTKnN42Lfmv
	FaRErv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyBX-0000000AOdS-3a9s;
	Mon, 03 Nov 2025 17:17:39 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyBV-0000000AObY-0V7S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:17:38 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1290211b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762190256; x=1762795056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPWqT9ltZKPbWWhVTqxcM6qSbxQc4UppEkvUs5jJNuY=;
        b=Vwxc5JrOL57uCLlonhTjvNO9mkYDBK8APboW3N0u2kGyq8YTVxYdIqoJplHZZ4EWsh
         vrAoeazre/1EJ0BT2RxejZCExL3eRacqk4wA3YXBg0btNadDWX2rFkIcZuzRufaBAZqh
         4aNg6/FSIvlYgxraqUTVifRvRbZbiBWijBL2oLS/zUw+jSsbC1Olr+7ACLOmWsDWwHZH
         3vk7xKQ4GzfD0S/r0RyxELQv81pLov5BN9dk/FpxlB9lSnpScvgSoyyYDDyvtztWL6s3
         MXFhQB1Z4Mr2B9UZ43AmhLNSJR+FxTpkYweCVnl+dEajHi7dSTsLbWqAXm4m8qFeplHq
         qdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762190256; x=1762795056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPWqT9ltZKPbWWhVTqxcM6qSbxQc4UppEkvUs5jJNuY=;
        b=m4OWhZzClp2AFCNRNVMNZAOx7rrL9vVzJ/CbBvISdGpNuIPShLqF2fdU6qBZblX/Sv
         8UO+ZuRsN6aLqqRqeIQ+aSdAQtafg1poOFVxin4qZegSasriIplWikDWQPfpbQB6+QJN
         DHUC4khsSqcv0ddrwiB8UqbHW4puzLIiM2H4VV11NHy9gi/2XIRQgFKOasVrDf92z4me
         nh0qAqol2dXfeNGbsdyl10IOVOXiKQA14Wfp+bc2Snbc5uHKfsTnFilcDFzg9skW9La1
         DjbydyKZahgWzSn2+srGvRm3X3j0j8La6ApNQcREmQyrUgAdC2q87lDZwV5bBy3SwWqT
         MDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7OH/hFWQM2G+MBWQjdVA41LWIIrTefA2xSzIYaCOwKyK2OmjrrCFxg8piFEspJnCykGSwEPNt93Wc4/cXtL4z@lists.infradead.org
X-Gm-Message-State: AOJu0YzKyVo/hEzz9tXI42UqEv3WPOMohcS5KP13tmYg0UjYX2fzpYBF
	hnzTU49R0j4QVJey6I623QZ83THygozZh4wmaFo9POKmofByHsCp7QIp
X-Gm-Gg: ASbGnctZxYjxFgQRW3QmxyQQzJLWIi/oBvGB7ePd5HHmFWqIkXHdUFca8xt1xf7SNHV
	eGcSWGIGOo7JYKuM5zCLlhZBIz4JVkmQwtgkDLLjWvox8bkvPPy+Q6phxPEy4Hs8PkVH5Y7S5xY
	I3zxghBt/WXGMktTCClRe+8P3+07ltQ+rrgZvmdU2bNDa8+apk/UP8IwDv9ecWJXzm8ZQLig3do
	sGtm4ihdvgss/KiWTaKtBuBM60GAdf4XEPa6QPDOPUv4qmrnPMZMU6EbSg/JiZrsljHBR6zoJOk
	ZcJ1Nr+8G7SUcq05FpoVuWX5tGz+F9vOD3zdU52AhF6dMJppam2j1FZ98EWpQiXQa/3GBdLZR/T
	XPL6/HfK6mpO5nWGql9ENnHB3f+PObIAO+xyVIM0gUSsJKWGHuYLYO7pmHh7g4y2mc1CS2/AbU4
	coXb+b7rH4/w==
X-Google-Smtp-Source: AGHT+IF/rCUTpuM1jtcm99InanDksEwGe6KOBOO9WDLmz0bycdnKff9axedjvSMnH2NA1RIHweT5UQ==
X-Received: by 2002:aa7:88d0:0:b0:781:2291:1045 with SMTP id d2e1a72fcca58-7a77737e08amr16094326b3a.8.1762190256392;
        Mon, 03 Nov 2025 09:17:36 -0800 (PST)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db28d3fbsm12148112b3a.43.2025.11.03.09.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 09:17:35 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add 9Tripod
Date: Tue,  4 Nov 2025 01:17:00 +0800
Message-ID: <20251103171702.1518730-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103171702.1518730-1-coiaprant@gmail.com>
References: <20251103171702.1518730-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_091737_165749_447C0C94 
X-CRM114-Status: UNSURE (   9.02  )
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

Add 9Tripod to the vendor prefixes.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d188200..97b169f63 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -30,6 +30,8 @@ patternProperties:
     description: 70mai Co., Ltd.
   "^8dev,.*":
     description: 8devices, UAB
+  "^9tripod,.*":
+    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
   "^abb,.*":
     description: ABB
   "^abilis,.*":
-- 
2.47.3


