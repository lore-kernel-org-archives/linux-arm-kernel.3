Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D970CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Pc5FY+vpBD78oI22TjAWL4xC2GsHLjSnp78r+My6kA=; b=NAlH1pbUGnEHKV5FpJFzn99AFd
	G+JLcUjm1W8rJFZ/dr1lyn/hr4G6Hmrza3tdZyl39460OcTCl/+W+rLENWUouNujFJl/zSWiGoWWh
	C87kakzd4o1AYxagOYoDRAZCVRe5Z9kCa/sg+MQOgTRsZmS4mNWNbFJvHNQpemyT16lNs7apdU8fP
	/yR3Me+6ORok/5yCTyTHM4/gy3MmmiDeO1J3XKOYZDnRlk/7IntGouGgyzONxSHA+w7ENyxb/7yZx
	LMQXx+X86eCAByYL5ossBs3wRH0G+xKE45KGeA4hURgksB68KcOBIOd76NQV4UQhm4wIx9cYib7VG
	NKO5icJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzJr-00000007EVf-1iFf;
	Thu, 21 May 2026 09:03:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzJo-00000007EU3-1jHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:03:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49039a8851fso3309345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354230; x=1779959030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Pc5FY+vpBD78oI22TjAWL4xC2GsHLjSnp78r+My6kA=;
        b=bKixwh3W47Fr6CRW2lFACFL67Y6fz2Zn0Gs16ePOkx/irb3ds9StQCmTdF30XfksLr
         Kn81m6O8q+99KK4dd4mmTf3X13WBP9Q4TEKvH4q3iCkuG7IZmzyDVlkMSRgrud2OZg0C
         L/0gwtFLHIQkmZUyvmPjb0qQoOyv3nW2Ifjep/WF5JKoRVNbFyBoH//lWQXpvNEcShkI
         ZyHa5kxUlyF3FTvluhP8W8ZLqRRFknKjqVARcg7JPBo7lVKH8W+iG6uaJtKJY1ZHoAP2
         Ze7F+uq/HiYzsn5TYEIwfCYd3Fc31W8tqq1u/3bKR3A1rvOkCtmmnt53PVkALiyvQfW4
         TNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354230; x=1779959030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Pc5FY+vpBD78oI22TjAWL4xC2GsHLjSnp78r+My6kA=;
        b=hoPd82MNX+lvtHR2FHwA1CpTNf3ffvx8ozV9KPRtp8KfOk0AOlE4wwirSveYqiwTTn
         k35D0io3DTPTRuZBLQifN2x9oEIt06LLAu5ihYSt3u61S0lhIE0rR9uVo7/px52UaiNW
         YEEGXP2XM0Rgkqno/nP1VhotgSFYsBrSXznWYm8yermqu4P8PF/b2GnlGpcxO0HnsLWk
         jFcLhUdhEeYkGsDniUU0tSi2PPHuom9t78qaDbY33Cjfup5Rzri+7Zp96R9BXU/Fhs6V
         Sw80588PQNOcaRBEqTZSuCbsDe+8MNAtJZqMG2nbMLopkxr7ecvLZyrnncFzAToIm8LT
         elTA==
X-Forwarded-Encrypted: i=1; AFNElJ9JDFRg019vfJzUmiQrDu004yJNE+k5naLup3xoz9yfEhyuOQatW4FLmbdzYlV+J0zSau2hRdCNLfwuoAUht57u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+9UCtfSRsBNa4V/L7D/8nmkqChFPmlhKdjI9Iu1pw6gUL2Ae2
	/BhcgnbXXFDDdANSH1/0gBKUz7b5PW2GnCgvwiu8DhbF1DAg/fuliQIb
X-Gm-Gg: Acq92OHTl4gZodiKBjaaSMrSvZHr7/WIjmu2ZgcWdHHfyH3YMtiTgNKQA5LsepHFN5w
	kXEBElvR2Nrz/rHfpJ8eA9pqWPPOq9mURK1l5FnlDAq7YYtBnhHNrwDLd0LCYCGB1NI10BdTDZz
	6QeZGMbOOdSLdz9Wau+6zlrhaVy/aViQN/gM5iJ3UZU8L1WwLz8tkiHvV9YKsZty7G8p8LyYht3
	nIGxGRxP98dsCTzqRnbp+2HhGlHBXhCjsGCqnpQRwxpQyZoXI/ylGW1BL5sOJA7mp0sp+F+tPLj
	6pmA2E3EgvTgdfHe0NaOaamWgjDCpGd35y8Q+j/76oXd+U5JhoOxitfwtFYoyS77Ao2P4tVNzZC
	Ui5W2rRXDAWOK1O1zz8OvYZca7mrZxV9/gkKXcfIPMn7Cxhj7sbkGRmJAuTphqsf9Xd4yBwuqUO
	pbeOrblUqPX51VjFPRzGi5iJHDoP4OJjNQbQIvMHwOEs5P4jADBm5ujdH+j1MwEqWSpxlIS6OPs
	2IPfn1qMfV49UQ0M5wNjKLOQr0mdH6ql8Xqb96eePMUH4+JDqjlhGTG2AFrWrfJ02Z/HH+5vJo0
	CQ==
X-Received: by 2002:a05:600c:a108:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-49036039969mr21695725e9.10.1779354230309;
        Thu, 21 May 2026 02:03:50 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 11:03:45 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Aquila iMX95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v3-1-621843807def@toradex.com>
References: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_020352_471340_C3AD70B7 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v3: No changes
v2: Added Conor's acked-by
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0


