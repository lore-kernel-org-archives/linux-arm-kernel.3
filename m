Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702F110BA456
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=; b=pSDDTFUo9Zl4TSTtnGyUDXDpr7
	EIG/TNWqLrOy2h65sdll8TjnzDUx57dapevoNBp//VNUxyZrPZw1OpdPLPANoaPqyvjz1dbm8JFc0
	A+sZPv8TxYxlCwfCFtFy9U3Xyksu6PyJEw8aGboy3aDbvLVKjPn2xbIwu3KppDTYHFKuQArBHBPyM
	A+UUXjVsQBHlHFSnQbsZyAfMGFU5alNBJqFZuTFy0Vj5/8a3Iwl2yC1IcTIu+HdpIpWJYZYuxcbhO
	eiQjamwtiaSOjnENgMNIOWWmL3dAyAVQt0qBfkIyVE+AsHQD8I41mibvRhTRcjhGGKZv1L1DTjadZ
	gM1pbAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Br-000000072Ng-0LK5;
	Fri, 27 Mar 2026 09:09:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Bp-000000072NR-1oNI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=; b=YcwXgsqD3C7GPuoHxkxtsE0GP5
	awtkPDMlqycy+3mjF74Y4lFzUJb04Bv4l5QVj/aASAVVIfLe4UmmYTfuci2LB26poyvXcickHIcKJ
	XIeXpLVhUq0ouP9GahXJMjXwTupTGmF7hGqsBCyFADbeb/JnpQXDqh4pibsFfRPP4tLxH5eUfGMG6
	XP2VXl/u5YK0gHhOq+/B0bmpPpYeCCorm2wc1fgcgSgYWPAW8zooE7BHNoqM286IAMM139QR4YKQK
	JUrXxzLaih0sbYv62a16Hem2tJyL9a8Nd1WOXOerMLM6CkE/+1bmgHVgD76Q9Tulz2V18spEk8Rag
	VitDKURg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Bm-0000000A2J0-1jHA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:09:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so15162145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602548; x=1775207348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=;
        b=EAXxtNJtwfRmxqr+fZzoUpj3J2BS0E48qNX8TM0hypO3iEHUldMHsjP/Xy7Xji5lmF
         akggDMrDf71j5FIsTlsshOJ+bG0Fc0PM1cRgM7cZVF5TZZ+fvvNyxZq2nPbFVdC/ETk9
         Hk3lbf03hsqZdKRY41v8OAVsqDak4sA9XQ0Hm1CKgcCTvUsWzz26rUWBzYpLpDp8j5Gg
         +CYcG34M1bg0mUo7Te8JYsdrr/bg/8TB04QZhKMlt3T5IjSz7PE+K/30YJalt9GjsvRV
         OMpniM+ix0d8TrQ/Ukozcq/9vj10DkDj7Z1rLwX/Rg6g0MYQ0zbIrZoLgghU7p8y0XtL
         bKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602548; x=1775207348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DZxYgh4aepwVuqW68CLpxeO1g3J5cL1vxhzxoBtLyU=;
        b=CoIwb66OxMxvwlgiU/j4hsYRcIksTd1xe+22Ha1gWucaDjo+MtU+iHPDnpBRd/6+Kb
         A5p5cNDicxiZLaQUMCyHG5T4RjrKiQAkSl+/+/DkSqKgjZVfm6znmATPr5pw7lIrLgOn
         S48rEwT1r+9NC9M433jIkMlTgu0eL9lrU/c1MCtqdgv6ZeDue8Jfpvftr6fK5yeG+oDF
         u2L9cxSYUIK/CTaLWt4sSmsAOjmS8Z+HxPxlAexOaoAhrz6WhjrNjF0jEXMwsrPdIVHM
         8UVgonOBn241jzFjEErom9Tq6krRfxZxDq09O4Dv099nzuANuE3AXgU8TvuGlCH+LFet
         Dy6g==
X-Forwarded-Encrypted: i=1; AJvYcCV1UXEPokMktl8Nm0uHKO5lbpiNtACFQ1pxmzE2/dzZXU76eB4AykZFiNOTGJnjLJed0MNJY0y4F8GPoe5aD6D2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx95lWpcebOe1L7d3m5deKbBBwBDcJAIUbXpoAHoEyO98fM6m5+
	jnIRN0GI7DKcEPNRo01c2ZQi3rM0ugWphxxQjUrQEZ84UY0EJdW1zHVA
X-Gm-Gg: ATEYQzy1GVqgvxhaS7rRZPoSlRBJczlTYSlFFd/OlQ8AWnnsXfQotfbXNiCDzGaZqYY
	mNYoifIfwo+7gzt723xCAq3G/N9dPIwnpoPb5pSEB4ABKbow9E9p2GMOBt56S0/gJFzHNhjaCYD
	zVqvioMGNiyFizhMStDLSruzm8YeQhO2zkaiqJpSPgK3W5Y8R8kjipIyHkA1xDVBhxnkCo+nWe8
	7PVRnOQBSm0bn4CvVcwdb1FCBDqFuzWcY4yy9sdrX4PM9C5ZIHLQSpyzyhZZ6x19s6MKvS/h6MP
	OrqZhZ80dq1wSzfy37sCAI18iTQIlLmqR+5duQn47vEkwhkp54AtWm0QnWUri91qD2aLYWUkNtF
	GcIknwThplshWnzmLuyKou8NbebDRa48+83jNfLmocLt9ZTEzWdyBx3efumtPfxEswt/MNLW4ql
	Zp+lpJW8zcrpCxRsPVzdRLkFjSeBtoKSmm2WCrrdlWKttHs8PWeBfRn0qD3VW66QujNUbL4dIa4
	4u9v0uAna3bimP9D26cbqLqrstQNkE+mwXjHPTCYugL1r/f
X-Received: by 2002:a05:600c:6387:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-48727ed5618mr24598325e9.27.1774602547562;
        Fri, 27 Mar 2026 02:09:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:07 -0700 (PDT)
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
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX93 and Sonata board
Date: Fri, 27 Mar 2026 10:08:53 +0100
Message-ID: <cover.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090910_696135_6FB94D09 
X-CRM114-Status: GOOD (  13.24  )
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

This patch series adds support for the Variscite DART-MX93 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove clock-frequency property from eqos node

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX93
  arm64: dts: imx93-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 461 ++++++++++++
 4 files changed, 1122 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi


base-commit: 6c4b48012d57f205c94f25da0c68a4027ea6daf6
-- 
2.47.3


