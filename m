Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28E5CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=; b=QwIUln0VKFggD0aHyWdn7Z63ld
	hRl9BKqcEPSmme5m32SDnWPHktN0nh+kPdZGKYuQHnr2ohZlIVEGBEbOlufveN2y4iDCryVyLr6qH
	5ilcXrC9i5RkOFnAIRL+sHgOg592C+kX20ixyem3DVhSIqktY5Gmhqq0XijHfPJz23mIwx3M89tF5
	nIbbS+czIX7TpqVjjZz1a4cNAOCuOXESbVWX6/5KLymAjuVrsbcFss7zXNZ7bOXOhscwZ61W6LQxA
	i4kVTopk/oUP5dp+Ab9qwxVKw2/7aCQ/zFEDeDgTOXLiqL6xsGs8bJdClMAOyFFTbGjQY+PCMqFxT
	kurSmrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVa-000000075xT-03kH;
	Wed, 10 Jun 2026 08:41:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVX-000000075t8-0Zt5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:56 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso62700535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080914; x=1781685714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=G9l/vN7DXahICbOQOoavFEWSH1un8MdnzCG3H5k/GuNSjwNwzzIEer//SfCcgXGJ1Z
         UmJqPxN8fmsLpfb1UVvg7YguS8lwPWjemAk+hlF/utsNzMSYGumwRmH52jsCZH2CnuWr
         VdkCHwsWif8gLVn/k5eGG4WNGXOO9rI4H8PZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080914; x=1781685714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=Wh2kBiYWU+EA3KhP7CgcMhxNc+RdlIcsv1SDQZNqS4xw3bzAtReYWo5PJs3gvWZvsI
         Ul+Tx7tVlOUMnA2K2ieIj8HJcsE6mpo8TAdZcf015OvGszhYECd48kasqgbboD4ZQpjk
         RMGSmwX4JO8LDUuqnrJRLDZ+owa3XodEfZpwni9B0rVfU9U3svKtBU5BLE/sO7suB2Xl
         AvTdxpSpb2eJQzpkAshBN4w0XRgVeCKrqwLvknriCLUx9GtpHfSFK9AcHnZLIiyl2SMF
         sYnrllngITi3qIiJgylLgrF/UWcHgHHWYekODv+zCf0nF0SHK8f8+dWzj3KGYZ7VRd2d
         TLQw==
X-Forwarded-Encrypted: i=1; AFNElJ9MtCHkkMIp7NL3HO6n3G589paR83sdO0yYjHuk3ZanOmWrwA4G2GtJ7U3frUy9dTb8DGoVmabJxeBx4rw1zNKW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/bL4yqX7YWWek3StJr2fa0ePnKP5TTDQz1pKque4hTe6gZOaS
	RoOmEsbnG57bhFhnpqLWTetPhKw2+mIhDT6dgxORGOkIvD5njX9ZZ8T52i6+eGtbUA==
X-Gm-Gg: Acq92OGlfV/boyp9JS9kBGS5uSagyRzXdOpErC81g8THS+kRD8bixzitDEG6+SLnjUn
	sNQCFuD6S3MH5QL6jsv1c7rdrLEKu1UYMtOl3PErqLG1Wcs5oMBC8n6pt44nYodGgX2ThIZt5iG
	2y19DENtbQoR6haJGFbTe1Uh/0FSzwaj/MIDmx+whseGk3/oJgv5SJyi7jSHMy/qMIr9zzJyihz
	FTzg8DhUZhMisrxMUw8x9PT7pSQsGWZwcO7aWFWs5IvvOiH3IrU29oCJ6vbQeFkVZoJScFIRmkV
	MBgxaUuy858Omos4qxfsnIOrssN9+Ug+Dn5+sNd845zIGKplOXehs0nEdDNhc0+JMRQKCSsYrA9
	mxvmfWzBqx/Vbze5u2wIEVCHHk/so+BGLC4rAl1PllNJvVAkdTgrOs+uzb2F8VbmyDReXoH8fdK
	aa9j5KFzqZ9IzcSsd1n9FpnYxHYpM1rI9zvRk/a9+C4tEhDA0KVIpB2S9jvVOpko045OTLvo5vC
	LcxNfUN3YYm6dkqiA==
X-Received: by 2002:a17:902:da8b:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c1e85ac571mr292987545ad.31.1781080914415;
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 08/16] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Wed, 10 Jun 2026 16:40:42 +0800
Message-ID: <20260610084053.2059858-9-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014155_190843_E3642C21 
X-CRM114-Status: GOOD (  10.66  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.54.0.1099.g489fc7bff1-goog


