Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A841C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=; b=o1g90Wyumq/qsOPKW3IoIRMWDV
	nVXu7+MAK9lRtEdEP3wGS49zYeMQS1oI4kuhN5cg8+rSq98o4blJBsH4Vj6lL/WWqlK2SLajq4N3m
	HZderqdf6xuGv5l4RtZqAkImtGUeGiqUzW5AKHpFR1BbXsBTvI6RtciTCwqrxeD2R49uLMKO2esnU
	kgKXGXmRMeisZ4/qHxiDMTBnKTSz1TJd/6GAjxZfFNDtH/KNP1FRqGIfSuunX1pMfScJf75pLy+MC
	usnFQ+7YfcGX+ggMKq/+e0pnQlz7sUvOyQxd/GsylCmNA+uhLIerRsYwzngGJNtoIo5Q7MLAb1zn3
	VLtvMTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kM2-00000006cMQ-16MZ;
	Tue, 15 Apr 2025 17:45:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jy5-00000006XoJ-24b8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:21:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso42252525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737664; x=1745342464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=j7ECoMasXb+OxsdU7qg8yfvJV3lWbpYHndnO1nds8TFhODXd4K7QT0fdRmKSEZ18IY
         TRY9RMasFYpoBzHMZjet7AB39onLLtov/A6A7XutmGOQoS93ZCDgig7odv4InnjTml6z
         q2T4WbUAHt416FQNk5DDlZOn/vbBOdlUhAVgl4CD6l73/2LZY4jhK4NwfNnvlNq9ZFzs
         NJkNq1RO+KvTvHGFcuHUVeep3f96qW5h5yUJXhD1RXebRRN0An7NQWeNQgVTtSBSZhmm
         b70wF19U6hCTWQD8Ss8hupsSD52vm/+mXabl6v/VRoxfccRlRSOxI7wCrl2+of1erdIo
         SF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737664; x=1745342464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=LN1dR+FzpV5BCR1UTVALxeq3/rcwm46PCc0q1r59iSAgcnYYafJrxxHy5eiYC4p6Is
         +Q/EDg+syLTrhuOv3sJsKsK5cejC7jQ8fSD593+iRnK3yqIfW1XOoCcD+BvbAIr4hLn5
         qp8YkMaMW86KgUyUSEvwGtCIXPH4x0xEogPMYnJg1v3UKk7NTteBq0uJdW9Cz1tMPPZ6
         ihWqzk1Y27xjcEs/fkyapntE6uisj1X8DxA17fdN+ZqdKXVajAD6lCveXqkmLtsmOHE9
         XxsWNtDzAfB3dVhY5mn7pyRAwDuGyzbUKuq0mu1ONJBqJ6Tvzm4wVXor0AeorBclDNAj
         YkUA==
X-Forwarded-Encrypted: i=1; AJvYcCUUCSD7m7Y34P+Ppg8gdwwXSBHazFVV2y1acrCQ+LFoq+J6LT3Yqrlx6NCLeim/oXPxUbxQNI+0Pj0HnRiG4AyJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ln/f+fUyxymIRPB7S1bNNgWbNRLeJV0RGli5c2TKehIewBdY
	ALhUTFFh7PTJjgw3QPYUYOkXCjzIhx8Vn/bJEYdN9UGgN8OnEesN
X-Gm-Gg: ASbGncu/W1y0HuCeoQzYO1AGqPWNJYmMCg8qepsfHRK/H2lgHZoWZbxN66/Nw/6h2d6
	Cra1dH3QlihEnrcxICgdsHcQUmxJr7bzhUD0EQ+aRi/sd9UdgMUxYTLPGHJeSeUvbcrabHPVJO/
	S6prShzIVxQzO3x7nnxy71bAwZHX3xH/ZfMmaMD6vg1+ly61YyOYEXzh9k4gqzu3Eu9C+/0GNMp
	xJK2psLGzGMPGicB0VyJl2PQ1ihMfmPG6xNRD9CJvFxeYaxmNdEZ0sx9xywxyNbGCACgRIgidry
	OXIA9AofWuQ4kcPkQtNqv4s3XRIgggFYhARKSsEdUJ27TrJfUz5tb5RFm5/G1pF92+p1xYyMeaX
	rABU=
X-Google-Smtp-Source: AGHT+IFhl0ZD6Te4jksLApB9uC8vj5bATARcjgVkhtCEkuWPZe/GZXC+cxHuIeY6ryYtb9ba8vUOMw==
X-Received: by 2002:a05:6000:1ac5:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-39ee276eba9mr240487f8f.55.1744737663780;
        Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue, 15 Apr 2025 13:19:15 -0400
Message-Id: <20250415171919.5623-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102105_534198_D1050AA4 
X-CRM114-Status: GOOD (  10.75  )
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

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


