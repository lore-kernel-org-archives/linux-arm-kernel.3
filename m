Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27216C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=; b=lbpSrDE9B7xJe6BVfPse55gykX
	Aqhg1QNr51IhDVC0OFsT4hdCfwEY7yjDXxnVt90EGEjzMn4qvJiMDj87KhtbgFIBnBGhbxL5SQE7R
	eB9UVmUfZdyU55Xz4f2hz8qraWG6/kZOrxixdqDOQhnZazoPZnhG+OF6pXwNuEyQ6UTf8tKm5fyQ9
	ZCSYMuaB1g7yYcdRUypiWk6XkcrGAXW+HwrN9pmvenRxTQ/dhCHYIR8iX0Tfgm4gtjViQknwM/H0f
	6ouXYFsLDL3F9KgERw2ntcax1avuvurxpME96g2wWkSjA+4VsljWXZVCN/r6TqarcGGgP+O0P7mGZ
	Wchu4YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Bg-00000003fGl-1XSL;
	Mon, 14 Sep 2026 12:53:32 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Be-00000003fFy-2e7h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:53:31 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so7865335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390408; x=1789995208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=pCMhY7+7on+QBo2l+fIBBjIvrhRhvib7h1SEZIzyoVnC8l24TPRH82aEqnWGdFz+pq
         oFBdRqRza9dZVKBYvyavewdXdisg6ZU43/3LYIOIdyoOp4uOUM2DT8plMopvN2n3dEvr
         QRaAhEsFIkxkIUqrNSC+K0vHxvttlltFocukiTYho0yMig6IbEcML7QXXA99lStKdNJv
         rlJCrDNl/VDmhZvN6zW21gvaeYeCZvzBl0WQStt/ZgOEUOkf4c8M652cEkrtxNZ6JPkp
         OJEPhKDTDqSG0V4OSBjJzjercXh9tEOkW0I0I6BnjijK0CT+SIVM+eHJ3c5L5PiF86/I
         /tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390408; x=1789995208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=jipBNNpHTkM9qVijgMq14kd90rqxFGMcdSdsI782EFShP6BPE0UCMsJgG47JZY6k8c
         cZqOhrdxSkIHwijclHBRmb4nJpi25mFlPfJH6+eza1iKtJP1Xv41L0uQB1Vhy4+de2qk
         q4vC4OJORnPC5H7PDPbs70hCChvv7cj8bfxpNtXL8Qa3R3/OLVIIiIg0FyHCdgEzOlQS
         9ZOos2uGMQEW/vu3I0dLmlG7pLnMSkFI95w4HE2OCRFkkC7pTPTm975syHv4c6qITplD
         gjivDmsukRuPvORncYuswe0G/VuJz6wBw0opRnE5yQ767pAZGXjMf8xIX+rEZWVi5X5Q
         Ct1w==
X-Forwarded-Encrypted: i=1; AKwUvBxfn07wR97HEZODp57KSzzaX6rU6nTe4PJCBr6VLUF4OvRPaLDsEKrYQGrVS8dAbeH0ct6NS/YEp8GFlw8rzPDL@lists.infradead.org
X-Gm-Message-State: AFuF++m1ug1C/3+hlugzPMDM21TgnS7JX2Uda3hPkxaMs5aKBrJiasAp
	Yy8K1/TSatqtb4BejNRjZqpKtnmgOrrK8WIv/cq1g7LJxjfPu8ajUBZA
X-Gm-Gg: AYBFou3dQNpwGm7hghiBMvGn8wZRy4IQQ/0bcE98lUt8IRo91Ajf+4fBEKNJRVahtTu
	hteVOe0NmxhutJdpMjH+Nkq2uj/OBo97mXnSfk9qz8OgDmbWXYCrt3VMsO/4qicRhGUQSSV7gDo
	6oKWNEtFL+kBMCr2IgNJ1KoUGMtz05kAslJ7fdDY9585faQTfoUJwny+/oE12bBKI6AfVpn1u72
	wF5j9n8XHpk568EzwLXOX+v83GyP0PsACiQdWgK45wLuJrymTksklWQsfvaRh1bMVOEZXmVzBk7
	whxgq87I5vohnKe/NFrMOdnvpqS0At81mqLdnBPlWbBi33ElgFlOzbKZsglHY3a/Gw78f0sHAGy
	sTf7IbZWGu9SRW687Cq7LuwCTbAHqa8xUxvaHOjJqKqgVTWsadTcdv+vb3JN29ri21NsnQ5pzUh
	P2n7S8B0GKlrmxfKpCMJfWsTE8Gm84TE1cA4nOxb9Ex0CmY01HZ2VBw2Nvycs9lfgmeXwA3JBn5
	FX/2z3ahkUu96Kf61La+uGwF3UcX6i5Kk05fPwafxDiRkAAGqiTa9lhe3URiQHVd7TJZQbK4TUr
	4FO96tv00TBwGsCZ
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr30526925e9.19.1789390408188;
        Mon, 14 Sep 2026 05:53:28 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm320954365e9.9.2026.09.14.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:53:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Natasha Kovalenko <natasha.k@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
Date: Mon, 14 Sep 2026 14:53:11 +0200
Message-ID: <20260914125311.8354-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_055330_674372_EE77426D 
X-CRM114-Status: GOOD (  12.60  )
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

Correct the UART8 header reference from J12 to J6 on the DART-MX95
Sonata carrier board.

This is a documentation-only fix and does not change the hardware
configuration.

Co-developed-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 3479abc25df2..9344a0d99418 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -336,7 +336,7 @@ &lpuart1 {
 	status = "okay";
 };
 
-/* Header (J12.4, J12.6) */
+/* Header (J6.4, J6.6) */
 &lpuart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart8>;
-- 
2.47.3


