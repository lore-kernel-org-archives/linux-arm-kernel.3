Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63322C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=; b=wWgi2oOtd15nULjIo9tqNtsR17
	TtyP0gjZQX3C1Q4CzdgLvsnaWeIQ1CfRJCpgGe0HyVgEJxpM/BqyiSJvERKAqXqogBYF8Pp9MX3of
	tXR+CeNfEZ+udFddxEUo4UJ4NmFWpERu7T6OyaveOkECVFkJnnVQCzfUqVNUqn7uvulFS1kxWW72x
	q0NgP7uRXlpg4rY6iZwVwGnnZLNU/L1PrQGdnHFwWWWGXQnzYcjfyARtooQr28H1796AckdzEsKK7
	Fxi+bnC/skexGkbgTfq1xuO1tMMqd2LY5v7M7JAEWG6vuLScjmNySqOMvQiD7o7ZrBCrEs9cNofto
	b9El5H8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EFC-0000000BjBJ-2j8a;
	Thu, 17 Sep 2026 15:41:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EF7-0000000Bj96-2yJb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:41:46 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so5693655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=em6YcbkzTfrEm4mFdO3QF5P2sMKU3kJGh924/r3q1cqhwkSENbY/zLcS7IVrJAcasX
         jZOCbRIWXpoJAxyco1ZpVBJwjuVFa4rJ6BhEtDPEwPIuWFsY60WeKhQ41TmGP1W4+Pqo
         GVghi7VfNRIJBKLCO54S7FKHBmJg7HMGbeCLWxBWVNaP2a3nxSKNrY2GuMkKwMRND7Lr
         6ekYIa+d9QyuZXyJyeYFOuEQlCP7js7AsHSiFg4LGRkj38OLAdFukng9KkDHWdU93TZg
         oZc9ZutsMXdQmJ26grWT+LRZojKArCog/Y3Fv8vijHKhAULF0HtE6748ZUiJoEQ5hm9I
         aanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=npMqu28UtAjCzCe4U8HiczWVcNTb6a+/me2O/w51csXiJgnDerZIFVHKxYjfCPGqSS
         C17H9wPFWygg7C+NdYZAp6BrLIEak2AS8CLdo3WzuTBe+ROtLmoVloYMfQwLKF59UVdc
         bDvv2YL1LLg9+VNBlmvehgJ6CptWPVZ2x4k8qruyhPZmrKxuvrJYpRex6K19TGHiy0xE
         QsMDgchPjfM/66SiQlIt6YUDjuq4lYT4uuHZV5ymbPhQ58d/UaYq3nThg5TB4NMUqGNb
         MjsOT29pA+7GWo7m/RHnEQLxvWhJl1H0WwSI9P4u/CKZaYrHaKWj+ZE4a1FOfOKk81In
         T1GQ==
X-Forwarded-Encrypted: i=1; AKwUvByg5QarwoLM3ptr6hhQpgFlSmw+yp/eGb2fQjxbDckOwjhXjg8j7wbvdgtgSC2/BEep8/f1drh62zEl8QiXWilk@lists.infradead.org
X-Gm-Message-State: AFuF++m64Ym0k1gRRQ9ZSBa/Sdm38h4MxCN7PYJyl2NeyFCac3cmvO5h
	t5PsKnFHvzmap5KCRq7BksBqp+Iq/x7+UDDnULqg4CpqHcf/TxC3vYnw
X-Gm-Gg: AYBFou0tVUXmr12lUj2jyfW9qqFQY4IEYbUAUTSXpTevb2gko+txkxfESjuJJLyjGa3
	Lg5mLiEE2tbOo0XoQGaerWiGxwEU6AlqKoylaxrfGz8j0UqZ3oDYv1EXuV25l024ULxWu5dAZqE
	wDP5/81zgGz1Afinus0O71XsjTBnSHIPuFufpCM4hXuWKZQ7oUrQVTP5SU5JsOCecxUn783TRyc
	ywdW+Yvi6R58eExvwZO7d3pze7NwCujVIRyVI0h+/EfBlwIy/fRLoRxQF1+45apbBOLrVHCTVMR
	UP8IA40DZVTHz+CFBDmnBoZ62MQKBziajZn4dNb2k4Hh9nUq30je2IQOpuzapt6AeI2XqAHKYEb
	3OqbhvuJeR0q6oaAmU6mbP1fiDZWr2LH6FC/VOvykBmKqcYiDSlCtTsAx4S3fHzmYOkHFxMdiS0
	8syUzAKgF3jwdUZeaacjuFiWz2T8+dbN1j2XQsh/U/cv+Wj5gWzJ7H+teYF1eH7ThG5GqtESsxo
	+OP9iOjesr3o4xWMAE5qEAZIGhQeY6XW9FvTtDLbe0iifHK6Z/+0H6aMte120IPL2p8L5bIFQNN
	dZ6dIxTgv+4tXsuQUXDr3w==
X-Received: by 2002:a05:600c:1f87:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49eb732350cmr85671685e9.21.1789659703973;
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Thu, 17 Sep 2026 17:41:30 +0200
Message-ID: <c13d304b5eb9a82717d192aed0d81ffef5573aa9.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084145_778889_B5A11BA0 
X-CRM114-Status: GOOD (  11.93  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 953950e55bf9..4d6a79bbb132 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3


