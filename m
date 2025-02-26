Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B78C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sq6QQJrbjxptSVsPKB15/DnBsw03jMlmrEEi8aA8tQ=; b=M9duHTC3Webr7/jmSM2o9oPd53
	Bl8eP8Vi2dt0jWlPn7nnyYW3ZYXMkM6MMFccJDBDg9gqvKz9PPuI+gW6y+vhnPVWM2xT0Sc+YmgoS
	5reAGVAvBbTeA3oFx4TKiO6n8M1ZUeeGpV0G/zrbEFuXp5JxsGn7DXGeQLFdoSqpXmfqPni7RILUN
	MuJ/NIAgEO081StvKjLl+8lgDQ9g+T20qSrks+ctHtUCb7dZ7cgKfK8GiYaGhsqxtyR3LHzHP+1sM
	C6C28aZSt3QNuV1EQFnIf6KLwleq6bBx6Du6nXpiTm82IiANBdacymyujdcYQVyBT5rcL+cQGJumM
	UniW+eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKtb-00000004e9m-0YpA;
	Wed, 26 Feb 2025 17:08:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKg1-00000004bKE-3lTi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:54:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43994ef3872so248845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588868; x=1741193668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sq6QQJrbjxptSVsPKB15/DnBsw03jMlmrEEi8aA8tQ=;
        b=EdV2OylbQsdwXClz0yWyaCky/wxcA4GgzBoYRZbtgBu6gXC95ycjRhY7leTJQ3SNkq
         46SIXGvmz2bO/uk94ghnH5qmJb5pblbeb85C1Z4H/Vy1r+gp5d87QVwiUSR5PFcL9DDb
         m4rjwDqKy4clB+k0K5TKNztyG4dfXgjf+cJ/DIV69ucXLtSroukcHfg8PgHnbpUPQSsT
         fR2r4NBdTDzgdwv2bx39n2jQZX4/mWsgq8ryhQpsjk4B+K7dUcARuSxfb11sHgrj3EUg
         TfwgCoa/OxJHKPjwQElgCuihEBCI09LcUY7ZNpp7kIpImDnX71uiOMUm3oA9JwDUmvA8
         2r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588868; x=1741193668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sq6QQJrbjxptSVsPKB15/DnBsw03jMlmrEEi8aA8tQ=;
        b=UPwNF6BZOq2+1XW2JoDvtnrMhIaUkreZqqLPMtfxW83xMucQoghSI/X/SgFIucfjQd
         NMgD7azxZlH5h1bnrM3H7whkNah58eR0QvhrI8gp60c32lUMvGL/mbc7qNrpmWFxlsHa
         K29UfwpmlrDVnI4smJg79otCmGVWA4nef0GBKl8phnpXliLyUu3pwnuVZdFL1vAv83Gt
         EaoE+XL3g58/Rfvr7VNSCV/hVAAjbKfBFTzqNhfLFdaojlTyJt+L3wRublTCMAbFGU10
         OS2c69/lXkpu2qbJJzcBXV3lcfWjpjmtjcwx13O12RfZrASnOpsN4BB9tYXhBC7lu0iE
         Zm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUasBytBZ9adIQs+SaxyZQ8eRJluG0r1u5rQoX4w3AvVCTLBOTb2ai5Nqb44SSFhxLNPCY1VYIfF7zPann1ADBb@lists.infradead.org
X-Gm-Message-State: AOJu0YwCyK+ZlLOZ+6rfAcLzf5qtfG5T+SevSCVm2C8jMPf8ZJPIQJ6Q
	l39tYqQmO28rjpmgFmFCe9AulD9EptToxT5Dc0JKHc3HBkOBjAdOfB+OmDnV
X-Gm-Gg: ASbGncsPx7dHJstKK8NuENug341ygKhhQiBnpH0iiahBxxuSu09Z8LnZdwNtlL0+TI8
	z10MMQu23LcnDLyY8tb+EPO6yi1QK1vCad3x4j9jIsYKylRLjrJ0AuhXYGW07vY+wzcYVX09zeG
	q4uwaLnEy6kkCMGFiD9tLTDVvZe51RbIo2iiUuCi33yavdFQSz5D7lS1VxcCI5OSGPNEHeoRkIT
	lxdR6s8tp2qU1E5InT2Rb5OrjX96EKw2mLMJOJwe6KQ5FY+192frtzGvhclmwVjsr9YBjDGlWze
	hT7/GCYZdZu9fEq+/hmO1XwCn2wtrqElFd9q1Iv+Rnmfz21KzlzyUtTAV1vXG5TZ
X-Google-Smtp-Source: AGHT+IEXXamHHiDSidMVxG5Ktdrqqy0wdXIkMLj75ieYD7dfdn0/9TUpigpU8mKWwmnghiqB5cWMCA==
X-Received: by 2002:a05:600c:3b8e:b0:439:99ab:6178 with SMTP id 5b1f17b1804b1-43ab0f2883dmr71707325e9.6.1740588868020;
        Wed, 26 Feb 2025 08:54:28 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:27 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Wed, 26 Feb 2025 11:53:13 -0500
Message-Id: <20250226165314.34205-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085429_948773_ABCF5F2E 
X-CRM114-Status: GOOD (  14.59  )
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
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..3097acb4bd21 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
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
+			#access-controller-cells = <0>;
 			ranges;
 
 			spba-bus@30c00000 {
-- 
2.34.1


