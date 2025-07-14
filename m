Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA77C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PeQD1Y6qSI8rBA+Va3N4iXrKAhnjsutZilvD5RN/6Q=; b=T+baz+jKu4xj5uMceTVm0UcTaY
	WJPhQ+oN+6xysvpahYoLQJaEBF09tUjO2pSi/IRBuSkYVtJTbfy+rpvNde5l2gsWhRtGQlj10mBid
	rYf04vgmd9LPvpE2ecRmi0gYChDId836otR1AlCd7+xhuhKReyUUR7xTeGdtkNfjAZfElbPP71P/X
	7DlmvSIZYPmde2seIgN3LTl8HtnaML8+kPAzCGpRM8ibQbmUyHqRRXWfbG2sOQmqQPlV0hkrVLmZN
	9Rr8s+Li6nWPELJsjaA3DpzZ70jn5aJlTixtJBF/OBvYFuT00kWIMq+ItqQXP/RcISH9ICaJ9cOeF
	ji5kQdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMc0-00000002uds-2zRx;
	Mon, 14 Jul 2025 17:05:08 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKtC-00000002cTk-1GGG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:14:47 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ae0e0271d82so803961466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506085; x=1753110885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PeQD1Y6qSI8rBA+Va3N4iXrKAhnjsutZilvD5RN/6Q=;
        b=Vmrr0vBYkeq1Tr+kIcL++B7f/eGxx50UD33x0Ul4Z0ZzANs1VAU3m6JKwa40EmVggW
         Hb5+yR/Bc1dmdzm2VHbvVkT2bavQVo6DODOqHWXPQR3Q3aeVoRLbOKTIjR8xxcNyYw1b
         hRmmf9ZhnDsDu8/6ygPnLycI62cm+CUqHQusrvCPUanrjQ0hWU+ehxhptr7F0gAuSfIA
         j3qnRKkbrpEc9xXlgdMc5cCnRglx96AyewsbE3loCrGWX17JwHh0I0K/dO6nq6o6H7GZ
         lrprZSPBq9lSZiN3F/PUkBOQsoV2Vy4E28cJQNY6xGXKfPzJ0EjN3u2ECOKyXGMWyxsO
         kBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506085; x=1753110885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PeQD1Y6qSI8rBA+Va3N4iXrKAhnjsutZilvD5RN/6Q=;
        b=baBKE8eF7lWg4wKmRWXFgAhR6C/Ch4nwkuCAo/m0y8xQRJACPR6pRPSjWs4q/Bpmeq
         7+pjBXgI9q0CtLAAvAgjYcIfi8X9HEDas3ipFdX7+QdJ0jB1C1VesoC8qYUb3q5ZuuDS
         T4TA5OCPmY465i+3gEJyZzp0g59E9V429ofgIJs8vvJBwXNhd5oNWLTNRJNihTaNHvNz
         bWbZZMLpN+Ygpk4cjqSm8QnaJg2e3lcPcuIT0q4bxp8ED9MwmKSEpWREtyu1xkW+KzvO
         KuDq32ORlM5xSbHxGOq5fsCAz61VRgq4TCe2CNxPGpPzti8lnve/+xulevZhsiggFOXO
         Xh9A==
X-Forwarded-Encrypted: i=1; AJvYcCUlIM/pT+P4D7LSjM+KreNptQ93zqHiky7cKokj65eU0ArYeY/jVhGNIxIR2p3jnpG9Ipu4YABfU0mvzQr+Eiqo@lists.infradead.org
X-Gm-Message-State: AOJu0YxXXWQD4gO1kmLXVydA5B2guyCDNCUMZXZYzAEhNr1McjFnYWQ/
	qQF5hCaKMbdZbp5HpWTjctutAsu3yXNGODT8I7/tPZ9cZdAFezqN4Ub0
X-Gm-Gg: ASbGncsVdbzng+B6Jw4uSJw94t3MxsToKy0d5KO8AZWKEo0Yg+4xq7v32MGyXp7x3jR
	RQnX5jIpz/hKpshljvoblXypgFHW+V8whFH8OrY/YWNquftxAhdhUWSrdMrch8nfmQKLX/3nyKm
	oNa9tPDoxLZIJEDVf3edYqj1m/lx+n2XKkoaa1s+aLUXGckN8Q6MJwIfxyTyS6541k2X0WlzICq
	T8JNYz0QyCaQ6bbIcFKJgfbxE3GxA2DRYsKzVQRDOR6md9MlQLc2vbgyS/4NEQCeoVL/Gsmf2ji
	VoemHR96Ug29ZTd/bJ7t9olzj8cm4XwjykhNPYj9GQ83wi8/ggb8T9R+dzebPm7jbVDZ2OSOOGl
	UJzLkBuyWpbqyyWvnRcMsHqFcAYhDcJ1pXHQYWalvLZGsY/oL3uExQEUVIqVGfamNzd0=
X-Google-Smtp-Source: AGHT+IHbr1DUfsxyJQ/Rn0DnkunJshTrtrZW0VywVHwhgB47bSh6fWGAKYyG5rgMrlzWkWy7RQNqMQ==
X-Received: by 2002:a17:907:e2ca:b0:ae9:8dc8:511c with SMTP id a640c23a62f3a-ae98dc8534dmr626945866b.13.1752506084433;
        Mon, 14 Jul 2025 08:14:44 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2b1sm847701266b.68.2025.07.14.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:14:44 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Mon, 14 Jul 2025 11:13:45 -0400
Message-Id: <20250714151346.7575-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
References: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081446_341354_473DF2CD 
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a3e9f9e0735a..18ae807d5950 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1382,6 +1382,7 @@ properties:
       - description: i.MX8ULP based Boards
         items:
           - enum:
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
-- 
2.34.1


