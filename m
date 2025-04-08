Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC6DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=; b=oDn6cnzFJ6Npl7ekXVyAnV5Jz4
	BXY0qbWEBJRkrVFSdNCSQYbHIq5n0S7/G6prPqNhnk06Yyz1z+60lqO2ghdMmCwruu2+etwsxfbaq
	KukYtGJ/qjGp6cSgRMYqzKPzhh+EhaU77mFGy0Z1NZIjtVF96U+LWsStyNFEKOa1ghNVVbQUh110y
	BOBLP9X52FT7nc8LJLxmjen+Jc35ylsvIUE6kuqCBQNO4SgpQuS7ivgO2sO9Bw4QrRnHrwPafuBA9
	cO7HCFfJGJR0sC1h5HkklharggP9IiaYQf0iAz4iuzaWueGSJZnHNmuPBI9zsa5raXswEXVXnxfbL
	mjnxohGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BF1-00000004hLV-450A;
	Tue, 08 Apr 2025 15:51:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B6L-00000004foW-3fZf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:43:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so29865755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126980; x=1744731780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=HbpMikaFHK950YgWFlNZ9kR/6GH5xdzUOJ0k+mvlkvjZcHYsIfd5oMh4G9q5Rd1094
         gCyYiF79fU2WIVm/4I9u7SYS1iBVM3hZ7/jKZ/B9nlS4Jsa/MEa9M5Bbjsx98+yhMZRJ
         P5ZwEbLLm1JEYRjCj8wb57nj88dRXXJDOVQ+XtQZTmSw7ameB2tClYX/46oXt55QkI9h
         BauT14+qsY02gUgpgG6dvbYVLL/1CqsM01ptCkp+M2N+dQJETy2iIx41PdUAwrfqjnX0
         nqLpLtkv/cCnf2UXLtaFTFb7l4Ik3S8pz4IEHXUU6Io9+k3NV0jOTG32aR0jq7tls8N/
         637A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126980; x=1744731780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=EXoDOxLLlTPTYwPADMYn37CWf/aXHJa+hjHTfnNRXyBoc4ioIvZhShUqjd2gRuABBg
         ObXcOFfMrGg4LrSOGrInvkMryGxc1YhHkkzezxjcf47FJCCNv+XighRAMFznFddiRwRC
         QUM4Zxq63gSj2Pc/pnuaY1gVDov5MncpjvMT4u6QIlEu24uRyg25tZw85Lvtr2eRnvKe
         AA+InKczj2VscDHAJxXAvDhvLElfwTILIQ+vfUdwR8aY2oJQ2DYCFf0lyBgKC0GTC8gC
         7P26HM+tbUk8ei/cpWrCU+wKCjW2IiAEeWxqiRtcBlFoWAUDexb58HY8c7rsjgAwYgZG
         4Fwg==
X-Forwarded-Encrypted: i=1; AJvYcCWRoWW9Jks+mfpgRdyUvKFG4b9uqkKswOXN2mqc6pe3TiPlLF8HKq4kQikF/2zebr1dbbANwKvhCDwi5cAasCYJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9mYMZnTd64pKthNn5b3CpV4S70aEFqpsd+t2BwRqmHWWKe6pI
	IItpht2VeGgkIezbooYwJrK04rngWhbrhccsxoqzqdjnAEB2Hn0A
X-Gm-Gg: ASbGnctdacTrgaxOsKGpl/MAJTg4JfZJ/5Qf04JGUbMi9gwsU5HhUueYCPvZvwDFn0i
	xgVJFBe8xtt2FT4aPIQlUDrelINo33jmow5zEAcYEw/L6IBI7ZpvxqRIQkD2dtFF8g652LPcM9P
	/0EBGuuVqaVQBuKk+LpuaN943n14y2fYgP9C6W8U2JDLxZITbFpH0vmNDpeKadogdRQ0RNiwjhN
	ihaMUsp8Nqp/35ETRcNW3qSkG5yxr4bH7bX0HR7wX/53Zp3YDMDyMPH0HAUy8/k04jJo5+jp9rt
	VylnTy96Y0eAmI7aCzMPT/2UdLYSAt0nk+o3O14LY9092jsXSAzgoPhrgI3YJH+u3kkzYAfOnGE
	APSGA9ao=
X-Google-Smtp-Source: AGHT+IGK0ruPX4WysFV+SZLwQ89r5QOiFeAdeHiZNygg9R+OkQB5zmqWtRPqwT+0SEhCLeJWSD9ebQ==
X-Received: by 2002:a05:600c:8411:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43ecf9fe1f0mr141672885e9.20.1744126979744;
        Tue, 08 Apr 2025 08:42:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:59 -0700 (PDT)
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
Subject: [PATCH v5 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  8 Apr 2025 11:42:34 -0400
Message-Id: <20250408154236.49421-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084301_915022_069627EB 
X-CRM114-Status: GOOD (  15.03  )
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

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..aa7940c65f2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,12 +1399,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1


