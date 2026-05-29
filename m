Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A224FCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N9pBkAXW7gLZd8FKwdSxA3ABXZRrpLoJn++TQ4FzcjA=; b=QxivfW/WrfNN0vHjknhIbmNym3
	WSprqJdl2mqzo3w3LOeA/0wJzTQ0XhaGOnr33NpFjP4vXJFS9AMiVpDKzY8s02h1jVJ0dtJzRCs0C
	jdNG4M7PL2nJPhnfsdBj5KNlOodO8wqvBfxoYzxmoj66W0HbsWmNtaHYfAlkfcg8XMtBaMT0MxKC2
	0TpdDbyY9cJQYrHtU8V9Bt9H4THBweGKSmbH2aJI8y2jTrByxo10cjHTMbxyUBO7YE3mVo+gYkTHI
	rwH3tjwuqFpBHvgBnSaZ6lKZDdnpQtt/1koWYfeo/iNmNvbvjC77CMAqCO1Oebg2O1AlZyVhvuK4u
	bG81ZcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBO-00000007975-2PrL;
	Fri, 29 May 2026 10:11:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBM-0000000796Q-1Wu2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:11:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49050bfe053so43489295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049470; x=1780654270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9pBkAXW7gLZd8FKwdSxA3ABXZRrpLoJn++TQ4FzcjA=;
        b=U9Ubt/ogENTyMDNWpz1GP15JrNRySlUwXmbYGulyP/I5owGTE7jwBQDkSaD7G0nCrT
         AvPNd60Z3lJgCFGNBv18LuEOGlAzLIoAAEJc317WEI4ge5g9DBdWbo058+4LwZJzKd2B
         NTZxHUHTvMQ1hQUFrz66vOhpBsLvE/W7oM3FCgh7FR4OqjGkuyxscMj7F3Ai03JrBxnC
         1gJcsEz00vL2VGX3qrJoSiOoWJLnVt1SNoAoFmQuKVuPjuCsqnMwSitu3nXlmGOyx2pv
         XrI3aSRZEVI+pXJYy5/eRvmMd2I5cT+IrrmBr3dK4RSXI8nJJTjE9GWanOa5VoW7nnhc
         t3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049470; x=1780654270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9pBkAXW7gLZd8FKwdSxA3ABXZRrpLoJn++TQ4FzcjA=;
        b=dZ+GMUQiEd/mVSj+PhNKgCz3k26BMC3us5g4+MOtQtJdhC1hxXnz8/ZRHMNcUelN3d
         HON6+qsKxQqzJUfwE18iHOz4n95KlRf2LfjGHwErQ9L82keV1wCv3fxl+0EBkKhInXQs
         pj0flbOSPCoRLErNs3iWoy04rUgouQS8/N88pklgxPsQ65+YLOVhfRUvScA0KTkJjFe0
         i1ibiPw3qpO85OAHjhBcE41p3Qw+P0AJWgAUmBJD239OBp2jST5j7CAK87KG4bEU+kKD
         xILy0C2oE3g62jbcLzASW+uasM42ntpiQtStIrvYYpxt0lbR52dE8vehi7CtOh5EWUxI
         thBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wNb0mDoeEnlUcQX97a+EQ7ZDq230DYCr5Kg//W4j0eyU7VYGt6wuEPI/6qoCHk9tBeN0QqTpBsFROksg9XkPr@lists.infradead.org
X-Gm-Message-State: AOJu0YzXbSIK0Et2v4xMkZSnl+rDvYML+V53REjrinDvJm3VT0nnoX/E
	UGCA5YUdRBnvY+W06akodt36TAzFGBruw2OIJDt5ByEtcwSSoaIbdsO9HMuidg==
X-Gm-Gg: Acq92OFjlABt8mo65dleYT7ncpS3iWCIBJaiv69RKN97NiRoamCIDcdqZQxH9oIA+KZ
	At8MBgo6zDOxv9FZTlIyn9sTJKF8Qu9AbD4E37zx4l/E0JTYs8IYWJIlKIyFhcXspO3cpziTLCK
	WA6sajchIaIg/fdBn9OUS+2BQe/v0HnO0mdxIKJ4GZTiHsYb0zpl+jEkc9LtAh/i0IUZwvzYXxc
	Xuo3eHIMkbQFkKxJg+dwSqNE2EmmugWgEw4Yqz2KSOEzqmqBsssYLZDQH+endNVkTdlG1xTxWSP
	aJWlmcMKrhyHcVnfjqisk7IV1fFZcdq7byEfLGUiaN+TQaj4TQZ77AOWLOdFw+8WL9r9jzu/JE5
	A/Hch9AEwSW+OLSNXU0F4u6HV3uj92cjqrSIhWwRfZ45+6FwGaCVw9wdk2dbelGL8geCu4+QjmH
	JxIkMWXO4K4CyTzmSOoF3UfG2MbGlTcUw/M36zJPI/ZyuzneHW3zjZjlx9B8P+tfyuOaNpOBWZy
	QCzZG/pmde73KJXEmAVyiykTgO2zqn0zA/ooZbysf9ERrg=
X-Received: by 2002:a05:600d:6413:20b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-4909c0c9f56mr31124965e9.29.1780049470077;
        Fri, 29 May 2026 03:11:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:09 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/4] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Fri, 29 May 2026 12:10:47 +0200
Message-ID: <cover.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031112_414545_156466B5 
X-CRM114-Status: UNSURE (   8.25  )
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

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

Stefano Radaelli (4):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3


