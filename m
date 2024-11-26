Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA225D59D94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX8xzwbYhyoqhIB2hSc4QZ8h9QtVSz/pkj+4ftY5rkE=; b=DcpS/JcvmH/8OAvjbtTxGtF0aO
	OHt/tw5i+5Rc556NERP4cda5rjg4rAPCLSF/rmSr4thAXIzJcQsvynpVdAk2ivgHlwFnMuumswJBA
	i0m+ieHF4RV7Pbr+oyhQiWVf+dQ2Ba3p/6CROBPMlR2gjNoFC18Ajt/sPkpuRHGC3wciK6w1HD66r
	OjuipHnGPXXJCT1NHB3XrhKxvV8XFSecyrujQcYYSdDRn5AN1esrcdKf/SAecMq1eoB66tQECA+5f
	irJJhsGljGz3hE7/F3O+VYy//BwBrfwJZVC+PtZWwcvJRYZifeQlE2AGlCRN6r9chix8+hy1ESCk/
	jvnCTVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsxp-0000000AKQH-06NU;
	Tue, 26 Nov 2024 10:38:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsvu-0000000AJwx-2POM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:36:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa535eed875so455340166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732617397; x=1733222197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX8xzwbYhyoqhIB2hSc4QZ8h9QtVSz/pkj+4ftY5rkE=;
        b=FoWk8GxyiY3r6Evo+7z4NTIZw1k96D/Qm2Nr2RPUJvj+C4A9KzhybK5hACPOKFYgHi
         lgFBY6GG3YumMO3z82TnJmfD4FxaSJkZqC8vZVOn1frLddnaU58M045bsrviVcswELYY
         jL7rVv5sdLLY2PPY7Hrih7CGAVu/2snJl0cL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617397; x=1733222197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX8xzwbYhyoqhIB2hSc4QZ8h9QtVSz/pkj+4ftY5rkE=;
        b=bJ/8RIVHmC6bs5mnk6aO7Xx4E2vcD262M8go/3v7NKuM1LWouOf5BJ2dUqcircrMF/
         CbRFataFs+iR16hTzw7eB9MXVCPar2LYZfsRT8I/y+vQYj/sF5l2NjE9qRrsv1oF56II
         5TOHERvLujDwgCP4W1CxoNytEBtfMMbt6PRecD0kZ1O+W6X8HMP+egrK/ERhiRB/MAop
         ETh3ghjQ+iEuxvUV2KbisypXHr+m2b4Wip04HbuJsDCulZhagQ9edWdNCXQdtGOFbppO
         JBP5ywWY/mxO69ztZEMuABSMkmT9BCo9Ua1XRjM0TRnDrdPgqIbCmHmx97syuFI1kKol
         Hk9g==
X-Forwarded-Encrypted: i=1; AJvYcCXeJfwg/THnLd8ypwuoyo0C4vxkEWnhFtMdx9xzoYpXKBmDHFuWxUJ1TJZE/iu8Ej4I2DWEB2Kw2WdpUmp9QqKP@lists.infradead.org
X-Gm-Message-State: AOJu0YyCXbGVx/lEz9mTYOOsMtwcaJYS3VLLr1QSNhNIB0CklIEpy/jk
	+GB2oqfHFrmeV/aWQN4rwul8tUhndDGFWeIwGeI4Ec9UDNl3Sn2lWe2P14Zchw==
X-Gm-Gg: ASbGncsTXrYF2a9pYUfFwz/+37TAgwOuDNPg8h7Wjv97W5IrvEM9Rfr/3B8EYYbJcTd
	XkjvgM/TT60LYAyvgvhfNd6SDz4KnjckDm3ILWUp744rGlM/gaM714YHaSQJFVTkwnFYIzLne4L
	kNOCmnKnUkynCw7yUOICyq3ajMCqG6zd+zHM/+39m0svCeSkdzrDr5M4o6SCa9wK+FdRFKBtwu2
	6BFzMnAwLPa2j60VNtybl1eMrM+hybu6G8M74LIph7Wp0TWZqejefC8Wi4D8LllI1/pkv2ZmiF5
	QabWEqb3
X-Google-Smtp-Source: AGHT+IH7pzt4uagb2/yHSWvl5yYjrOK0GvCI0T39Co0MwSq5iX+PgtgIfkrdFxk3mxGtBSslu+TfUg==
X-Received: by 2002:a17:906:308d:b0:aa5:4b7f:e705 with SMTP id a640c23a62f3a-aa54b7fe8bfmr702146366b.1.1732617396904;
        Tue, 26 Nov 2024 02:36:36 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa54afde284sm292271266b.17.2024.11.26.02.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:36:36 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
Date: Tue, 26 Nov 2024 10:36:31 +0000
Message-ID: <20241126103632.419469-2-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241126103632.419469-1-wmacek@chromium.org>
References: <20241126103632.419469-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_023638_614545_96D1A10B 
X-CRM114-Status: GOOD (  10.86  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
Changelog v3-v2:
 - No changes
Changelog v2-v1:
 - Fixed items/const bidings description in mediatek.yaml

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..6191a5320c14 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,19 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku0
+          - const: google,starmie-sku2
+          - const: google,starmie-sku3
+          - const: google,starmie
+          - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku1
+          - const: google,starmie-sku4
+          - const: google,starmie
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.47.0.338.g60cca15819-goog


