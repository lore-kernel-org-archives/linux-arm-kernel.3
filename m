Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A5FD609D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jtF9ci8OPnOP4Hi31zRxsQ8dcNSQiS08yT+hSgOwYg=; b=PaKbTvWteh9+BRU5gXZEVVpTlt
	B2nN/fiv2GxBws0ZtV5TpxcNwbmWyG8+lfJrkAJVgA1YmEo4YOP7TmsTZlGUKKzBXu2mN9h6qwRB4
	5GWomAbpZw7PkkqHLr64+16dzabSO6M/I2yP+X29PXELMwZsMoqPhM2o9KJAtyyPLjsePgm+ywwr8
	p0p2xo+PZcJKt22ZPEpj+DDX/1AHDOTwfHRp/jhfqrap6K3geNz5qFVzyQi9lcK93C8j/uRjI+dxn
	rEOSJGeupNycyMlTenrMM70gU0ggUweeyyf2XaxjVWDlDqg5DeTEhDEVK0Kq51erPDXkGiGTn0t9q
	vZrPCJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFmJ-0000000Cvfz-2X5k;
	Wed, 27 Nov 2024 11:00:15 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkN-0000000CvBh-02Bu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9aa8895facso1033599366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705094; x=1733309894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jtF9ci8OPnOP4Hi31zRxsQ8dcNSQiS08yT+hSgOwYg=;
        b=hnFB+MNJ7DWuy+A4Ou0EgDhb6Dj70Jl0yFPve73Jxj4j4y0jhvkgZ3J3ac5nAPfJkW
         h238W8WFUdY01a0qfQuDkyEiodAEqrEczw327R3pWjnx/hZLroupJWN6b/l/ZQUnVy+I
         wbI/VUuhrS/KGY/En+G792OatlsqVRMFgrFlMoy5s5GCn5Z3avdOV76k2cejL5174o5t
         K75P6Qv6nBoNGDqTUvNTnRjZ/UzxSETfrmJgpxTonMQuRJa8C0YcbuFu56ScTuAvGS5A
         Pj/KvGX18XdejBXYoJPRTFTAfH3EBv4PzWiB6jsPFcDllaM3DBUQ2xkBVBR2GlqMG+jH
         4XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705094; x=1733309894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jtF9ci8OPnOP4Hi31zRxsQ8dcNSQiS08yT+hSgOwYg=;
        b=P493unkHI62Ma9HLlYQyJ28nndHlhhKOrAt6hkvUKsBiMRrxC93TmiJzINVfyTblq3
         Sfn55KWIcmG+iauyrtaU3l4AeL4J4tK6IXa7LM/AQrfEe1jJhqxL31gAXG4WVNb1jrIz
         CqhoNPn8SqsHhknAuFjBuR2ladK+f2QkVbDLqAClFs+66GTG4cbHCeNEf4LpCBWEqC3T
         OEIU+1TUJm4nVRIb2LciEoWBySQzzX9UEoht9ej/eUc2ZLSByL8n7WafAVQ2i/RAJGI1
         qKVTDoes4bdPK3gDGZGDX0G4IvpKMMl6SssLioNeiVShC4x3YgsYlcRpaVxJRbR2ctci
         lIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbS7QBzoUnAPT4/OS4zNwD8lPImr8V7MtwEYNTN+Ag4y2i5Ldyn3Kgm6fX5zqxnwtUFUG1PHTSov/BS8DNQPkc@lists.infradead.org
X-Gm-Message-State: AOJu0YxSzQwfrE+a1oFAqbA2HUcMkKTTlgPJ6IBqzFWCq9+8FnxVcG2n
	G6YxKGYztRc68OoHAnytF3RdHJ8u/SFxxqWjoKktMCSZkal6o5vK+P1kWexD9c4=
X-Gm-Gg: ASbGnctGk09IDy7m9vwlyx/dWbCBL4zr1uPRXicMB+p0CQ93Iw1GEXhCz7fzRs86dxn
	gJeWIGHB6DvxEOQ7JpAq0IKujeObJMBqYq/BvUoQ3gKA1t2w5BSeTDJPNKWTLEQueO/XwIId6TV
	t7rdyGiJs9Fn84GZY5OqGPo4XzRIDTnGWKmTkRdquhnsQZskNMbs+QuGp2vzSF68CgE3viUZzMy
	Jm0/KF8sJ/uJsH2weZqv8TJhu6WGCc3NqUsWtOt5VTFD02G7M4Jb9EFGmbxsYFqN6h4DJNq9lAt
	qoKvlwDcCvUIm4CFIz2mMao7pA+Dfe9sKw==
X-Google-Smtp-Source: AGHT+IGpI0XPyLOxUc3SxNULKeFDjg8DEK2PQJHajpwT4G6OmiaLmyMslU+q4NFnVHObUoaipseY+w==
X-Received: by 2002:a17:907:7711:b0:aa5:12dc:2e19 with SMTP id a640c23a62f3a-aa58107690fmr187546066b.52.1732705093727;
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:13 +0000
Subject: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101: require
 Type-C properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025815_052598_159E67D7 
X-CRM114-Status: GOOD (  10.20  )
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

The USB PHY on gs101 needs to be configured based on the orientation of
the connector. For that the DTS needs a link between the phy's port and
a TCPCi, and we'll need to inform the phy driver that it should handle
the orientation (register a handler).

Update the schema to enforce that by requiring the orientation-switch
and port properties (on gs101 only).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 6c17a44718aa..0659fc1ce13e 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -142,6 +142,8 @@ allOf:
 
       required:
         - reg-names
+        - orientation-switch
+        - port
         - pll-supply
         - dvdd-usb20-supply
         - vddh-usb20-supply

-- 
2.47.0.338.g60cca15819-goog


