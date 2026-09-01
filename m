Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C1EC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=; b=hNjf8KXMw69fnv0ZuCZ5QwlDzr
	X8RzXbqw6JsBP3o3snTrNCZw4ql8/C6vkH/eZm5bMojPqEUzRtjJsVbno6hxV8N3hRwGYbw5/Lj2r
	S42tLGeZ7zb23uv0OJJsysyUcl+10j+4QZ3F1YX+gIaP9hI1A3abT85/EwMv6UBgXFtgAnLoCzJYe
	mDj8gWisZN9e6V2ltXh4ps/Q6y24GPIw/j9wKufrKk7cPRvmLwPaRqQP6CSFUldMJoEkmhan8cj2R
	gCUjvIsx3ji368Pt6BRiwHunzYZAsdl1l1NPXavYavsIC1JwhF2CnoKHnH5VJ3N+NCYSwNI18zmLC
	CTxnI0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OPb-0000000CCY4-0XSL;
	Tue, 01 Sep 2026 13:20:27 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OPW-0000000CCUP-2Grs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:20:23 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c253425b253so133050966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268821; x=1788873621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=Kzzy7HnuSuCLNqLJnHxRLGNd0VdD2pdMvLO7lMfdoZXIs4G/nN7/eVdB2UZsUKnC0T
         QBBz2L54SzdDdM6ygD67+2vPQ1DAH8bMUK0tc/OJZ2XnCWUMR+1TOVycZIAq+xXzjViA
         rli5X8CxFp7fSUMIucz0+OwVfvoc7BldIaiuX/yG1sCJS33KysCNzM2gLN+7naH792aD
         QGR8nRFWkfHxejWnPnC0CeSn++8U+OuMoZ1TWnCvfTbCyu3l69OImfLwaPIK5Fd2Rctg
         05tL3Et03kKd2WGElOXU3LvhZpuCf++KTDJfpYbtLZf88eawWRkePJR7wtTFdIfVtT9I
         hlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268821; x=1788873621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=W0yKHKNYXQL7Vnvu6biXYAdyiZVt3D0oXzDT636QtCwtf3ZZPcWkb6e+d7fnlRgXm2
         /ZvdN3pu1AgSnbptWo+HuGvj2fIld4KM7Jf8BIsA1oO+drA3d9I3iCyhUVhXKyx3q0rv
         0jJXAi/YUhjLMtr5d8pS/KoCjEiUneDlhf5JDGPJTbcDcTSS+RjBxjOmBcpu4MNsg3Wy
         AqAl5/VrMFH18/0+sEicVWaB8AomVat3qvI5xaN95vcwVPJSWIlUsfZtCX9SuS/HJwCX
         CYIyrSlnQac2qSbxJDvs0weJr6OHzmiHGfD5MFI9zj5c3/ELzmrtxVDxhjIXMfmjmAq4
         uLVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrp5fSmQzXbzd5wawxDjEKqAQerIR10Q/VV/18qksN6iCOrSONlLl0NeZ+3oAXse5Fmu6qmSA8DPHELTnNXMl6@lists.infradead.org
X-Gm-Message-State: AFuF++n8LaTg9MPyxMRJVhhQG6SSSOw7L38YdAXcDmAy4RB13aLsdGm0
	X9jPyUbWDo5wKW6uaiIUdqRgeD9DVof/iyfHai+m9BZ/J+14p6Kocnro
X-Gm-Gg: AR+sD12NsmLyuBAYsiqPp7RY87J+J/MyGy2ZkiZ1SUs1RzFzlEYLLA2z7G5eat0SHYI
	9wInrCjitqQXzkse3rtNWLf2+mqCBvoR1KPuAJlaQ0CzwW/OCY3jPPcOaoJqJiLAj0Iw6T4FjBC
	cIyk9X07Y4MhxqDqokAmR66pXlxxRxxaUdWSDrwArfMe2kYpqen2mLbzgpfyAJU0+GO0b+vbZam
	ZaJYI6419FwFuAEa2d+YvJbmKmAOLvdUZ+SCYj2uzx2OOqCE7Gi6nyyDIT5Yd5BLMsSbWpV7Lgy
	rAX8x6gnkiVeHwfE9SthPly2OJ8Mpuq5xDs9mooGJMyn/73ZLCO6FDBy9InVl9TiLqdnyNPTfVU
	3rnMt5mbjJPW+T4VwWRVcm6MnemGkcncr5Vl8hq/IuV9Kdog6Zxdnz0oCOMlmgKfmxYcMhAYyIB
	q0LmPNJFJtkMeg7evdRVaUQ3gncaN/miJe5dBDoujHtQznB3GSf5vGnUVKtqVqUDb7N9Sgl9sJz
	sY72ojITb7//MBp
X-Received: by 2002:a17:907:9618:b0:c24:457b:86fc with SMTP id a640c23a62f3a-c25571d3b0dmr2071588666b.21.1788268820741;
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm580304366b.22.2026.09.01.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Tue,  1 Sep 2026 06:19:17 -0700
Message-ID: <20260901131918.1189-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_062022_582154_63FAB42E 
X-CRM114-Status: GOOD (  10.43  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0


