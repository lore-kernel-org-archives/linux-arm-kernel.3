Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B65EC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=; b=ZF/8rtAJJI0qcH61tEk4Qmr9Iv
	oFWst2Sr+iSnioalW7MTTr5De97SmJeIpW/BfdYodSyzKifq633FUuBjscoY48kiXjxGatEU35S75
	hqTIGCAdAFsbL4cA6avdoidwbMHy6cITwkAIEgM7EI+jXRGK36b4Yj+nvrpJTmfcjCa1F9khCxRo6
	FNh8HUM2EGPJHtX/p2qyPeCAxXUYKodQg6f02vvzVkIfkjauD5c+c+B6vJSyM9kyu/MfXrVsn4q8h
	Em0IFrQ+IIlqki458Q16Syb9pamKwfIrZO5Jo34zf1NVhoQ6+4hxN/n2ta/pwOCV+VGbAUGAIFhuD
	h6434Zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdxA-00000003muU-2Hhc;
	Tue, 01 Apr 2025 15:55:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoG-00000003kvO-25Hi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:45:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso55453175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522351; x=1744127151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=UxLoAf0U7uTBA168fCP73VmtmML5RZ1xYRrYHxBrNJkaggLyDXPyGXWKr/RzkkcqID
         gLgvYwEIJ1iscRuEXcpY5VuomzZW0+jcNTsLWalLN//WIUF9yRufHzipei3uWJuVEPQp
         AnOiMcEczAa5SB+BulAGaZdaBi9IM2chbrPcEILEsSz7g7odmT2lcw6SjNm+2l5deBvy
         HM6XNUVkNj8s+J/xThdRGTya88sRcQe4keJnczzu4juJDLF68WY1TkfneWm5Eqwfj/q0
         71topAKUFJUelQ9mG19BeCSiYEWFjz6VO0TluEiYJKs59TATQp+D+Mmgik3N76eZUx+n
         8THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522351; x=1744127151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=SAIqTdPdpAZ4lAng2Dcx2DBj71VVgEOnteScBJPvfiBpYh3yTtb9vbZQ+XV1Qc2q/S
         +m6U9JODVXua8mpSmu5L9IMiIsn86LjZojKp1rHLy/mwXMHH1r1o7iS5XobaQVXcUnV9
         raVI6VefGOBQ8Qkmj5QOvAkR4nAvSXOzOUNUzo7vEA78j+5rPK2H+cZJopzqpPivWIKW
         u1WGkzK0V5nW4nxjVeG8K8C0uQ/4FcMDcjNeGXX6arftzgCYKcZnwbgxD1HYJ4kioh/4
         wmANMqfZmac83bLNFpHRdGkGA4Ss15O00KybJN6AqfA66s5WY2R5o8lPshnm9EOWNtRT
         FLnA==
X-Forwarded-Encrypted: i=1; AJvYcCWUxc9+rt8aXN8AWlFnJYI8x759ewaoxMrBFYD+HRppW5iyD5ilaugP/4MQEJi7C2xymL4YwttiG+57H/Lhv1bg@lists.infradead.org
X-Gm-Message-State: AOJu0YzRJKNbrmxKtSJzLdg1FChoYNKQEPeBy7+P+xnhsRlTBy6Ym85Z
	CJoYlUdOhzrqMnDGzisL4icZNyaiY9yBGMopHKjIyRdxNRUyB9sU
X-Gm-Gg: ASbGncsolFQJZLEq4TeoJn6ZM8vxiXLWrM+QtvlGf+oDHn/fbBUP8/y3WDSRaTl3yvf
	2GvM1CYVoOidAUjU87aurd5OPSYXgFSPeQlRVjd3Zh/eFv/Wl6E1gC3mf6BTWiqyaHKsdvodYuz
	T+4vJkFJxnGq29L15T3IM2aVlHDAfBVs5XIDrbQP9uBnHESekuJrU1dx/7MUt+rnYUFTDzxgtdC
	7LaY5NVfbSBGAdjL2R37rHgJVX/wHVHyuq/4PMS+2ynWmiXzRx7BZMGxcLfDk651ZWcgPjvkIKa
	vMALpneFLeGwhSLZkf+H+t4q+4y0B9DThCPjqOoSmBuH0ez/V7l0nNvc87nh4vhwv0AbMUVljMA
	d9sY/7Ws=
X-Google-Smtp-Source: AGHT+IHGjpv3EKCnHFF5eKJe9tjoaQRXwwsvagQBmS5kvWyHdixkP+Aak1uOZaWLdm7A5+xOdO8cRw==
X-Received: by 2002:a05:600c:310c:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43db6227bb7mr114695995e9.8.1743522350993;
        Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue,  1 Apr 2025 11:44:00 -0400
Message-Id: <20250401154404.45932-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084552_577758_D471C698 
X-CRM114-Status: GOOD (  11.10  )
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


