Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A24D12679
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZdHyWWmApsjjCDn2e8QMrGzmJIItWsHx3ihQ/sGLI4=; b=bMkLipA9AhTWDummmszuZBVtRJ
	nUFCrcFyON8LPYyC/1QviTlN1P/2/OsYiJwiqHlQZZ7cWkJUXC3lNtGft/luWId9Ih69RGZo3FYNV
	xj91KSukxxY6mVwW4xOQbRTIfcGwWRPuC3eaFGJXIjMaQ5GtEp4r1FT2qAAv8hJUCdM3TCXFBvkAZ
	l1sAYqqHHA3Y7Ss8MT5JCSRc21JPDTzicIuhykqvuFQO/zWnK6CzcRRMIs4NG0kccxG4vYjdJ6tp+
	DWvpUkas3NFcX2Rt/4wa+3VT1xBkSH2G1AurMFoqVsabgTIPCB8R6XlGYbFCEe9F+avUI8Nu3BhRM
	eKOrtw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYh-00000005sne-1W9e;
	Tue, 02 Dec 2025 22:09:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYd-00000005sj2-0xya
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so61740265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713353; x=1765318153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZdHyWWmApsjjCDn2e8QMrGzmJIItWsHx3ihQ/sGLI4=;
        b=NOMcHT+siVSku81srmF0P6Wiw06pxZYOaE450drWdSQIs/7NWbVLAQc8pPB7lpukTj
         N67ELeqnLEcpThklBW2KInPYGHbgCTUlnVSse/Rv78DK1bAIGQEHrurImBcPp5zQsRfJ
         9urnk6anSJ6hw5SS/P+RcRqo+j8CAq8n+hEoqqJUq7BLVEnKqx/f2obA9H0Z/qoSALB+
         FEHRF9iKSp18YkhO7BLE5skATjsGGoTdEVSo7J3CuZaDLb4ESWZa/zER4m/QQ76OleD/
         nJCbSqS0n2izJzAQE6PMMrm83woxCKhCBype0lxAcmf/uxU+o9PUY0fPGtxKMFniJvj+
         t6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713353; x=1765318153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QZdHyWWmApsjjCDn2e8QMrGzmJIItWsHx3ihQ/sGLI4=;
        b=tOEXIv2cCOXOR6U9Ywfnazj2Y61gNhbGTfcIIFVpwvCNoTD8i1eCxe8FXjWo45BqZG
         kufJDYQGg69fWn2BZOOfiBUTS9jJ3iVIOU55nhVVwKt6hBwv764c5hY4ofe4GfX0YUTP
         BFblPQ2MAK0b05sZbcRheLsf0Vy+AKYQnhy83KlMaNjarYXho6K3TS71QWGne1Q9Vmfs
         CbDb8aQqK2SMJ3I7aWi7IKFc9Qp/Mm5jStCEm3TOdV29Bi3VIa/tEQHKHYdDLfzk2X3s
         cyRDhNXtvMSrr4x15hPf6b5JjedwEGFA6OBpt4ZjWQqFHSyc0fL5LNzl8JjqHtCCMx5+
         l5zw==
X-Forwarded-Encrypted: i=1; AJvYcCUV5aS/eCsPXN6RD5lSaXc6F9irMuwJ38/Bq5U8UU6pynBzNMAo08r/7Rubsptar4WOA7UjPtEX9grcu6rW7hOx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyps8lEd07wlFKDVqjrPvRoTILJ5wm1IX0f2fhLISm4y0LK45jq
	NU+1HsgYC+7fNeUP8+FCsBXE1f/RBpMmhDt8xXF4jjNXWt79AcqxA9eC
X-Gm-Gg: ASbGncv8hcdSw+zyWweCf70dut20A/9+ATpmAAkFuBCKqmN7JUy+41aBqFXh8xSVdH5
	Z8hSlZ49zlkOiEM1Zi1+Hydf3OJhNVyXPYqydubhSncwzXRST86dDFhmh8L6WKK2/E94lVaJ3XS
	TUuqdGhJgPinfH58gAkMKjFfHXuNIsgsqWsi9OSyhWvyxj29R2PG2QjISStNgM23x3L3TItJGcK
	U7h2AWQAegFC9bdrGqaQH1aulR0vDxlqD3gbk3uiP/QWrVBUOpBy06kk6uajAIrJAV1PlJ13SlL
	heYv4+Y2cLV38fRoXpsU/5dL7PXv12Sl09ncJFo2XQKS4B+b6RQ/kNpVglGOnPHMGTZOAkBrPMV
	pQ8fDXpuU3YJgEw6V06n8WmA+34CnfZG2X8B4YeJ0OCtkhqnO5FKSpOcaSllReUvd6DPVoE7sbh
	lPzhg9dk9XG2eEs4KawZzxLEyZaQ==
X-Google-Smtp-Source: AGHT+IH8+pWAJ529KWsWa9mRTXD17PRvLsD3mqdf9/QSEPuN1xXBNVe4cD4mvy6/Yn5E/kVLRNx8yQ==
X-Received: by 2002:a05:600c:198a:b0:477:7b9a:bb07 with SMTP id 5b1f17b1804b1-4792af44c59mr1574985e9.35.1764713353327;
        Tue, 02 Dec 2025 14:09:13 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:12 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 02 Dec 2025 23:08:47 +0100
Subject: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-review-v4-2-93f5cd2a0d4a@gmail.com>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
In-Reply-To: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=1415;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=VZCofeu/bIsFeris3Pk/WudmT01MguyTXO5GJSCwC3w=;
 b=cEnXOlidRKO+M7EF/WbGPTKdPdjb8GEsg9zvd1HITzDbTlHAiki3fvcee5exQg1ZMD//SqtQ5
 sDYaWYu3Ev8D987v6dW0KDhUp0eNnwGlY4z9EEeAwo/o38O4K3brYzv
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140915_303250_4D323F63 
X-CRM114-Status: GOOD (  10.63  )
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

Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
SMARC [1] / Ezurio Tungsten 700 (MT8390) SMARC [2] + Universal SMARC
carrier board [3].

[1] https://www.ezurio.com/product/tungsten510-smarc
[2] https://www.ezurio.com/product/tungsten700-smarc
[3] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- Squashed both entries into 1 commit
Changed in v3:
- None
Changes in v4:
- None
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..cffb0f6ac690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -431,12 +431,14 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - ezurio,mt8370-tungsten-smarc
               - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
       - items:
           - enum:
+              - ezurio,mt8390-tungsten-smarc
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390

-- 
2.43.0


