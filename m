Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F275CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVte+qBFAiblhyzUMBEEPT044OiLyJRnPNqnE57mdqs=; b=dyIDeJRSYjARGgD7ntK5q+7WFy
	RJe8pI8Z/GSxH4wlcAgDXBQmxnVN+mykfpMaeJax0pE0XVAgJUV1sB/h1SN3+v/jb7SWd2yLNQVNa
	fN69h1bm6BnyRqEKY4t3tACPGV2IGyEav50m64FcbKr2TDn+bA7LOTA0TH+qTqlsSC0zX40AAZro7
	3i8JnsAV/YPdVJiyzx+OckAwaewjPgdofyHCKnXolPiUKBdH1+It2ZWQOlgb1o3Q68aSYTnegT7TB
	N1kTdPDTgtd56Ezv8POexWURgxTxtRKHV4I5WCoK1Ur4Qrb+4rHtavCPq/1cvJD2ADfQIACdG5JK3
	bBMVjfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4ys-0000000Fl6A-08Ms;
	Wed, 15 Jul 2026 19:09:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4yp-0000000Fl4W-2PmY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:09:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so31528295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142553; x=1784747353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVte+qBFAiblhyzUMBEEPT044OiLyJRnPNqnE57mdqs=;
        b=I/BBGTHEyd8HU+9iO/FfXqALTQtSSraSCoHopCNo7+1XH0t/g+WX/2EAELxolmZ5X9
         5FFQFVulitL36oS0LYIHfP6gWnsuLTZvD/uW9apQqkS+u89iOXcaQ8UNxhPOPR33fsz6
         GLHArpSgk3wEZ06DwIDWDN/QjwrW2uvTj5/kkvsAGL49A47livie1cfoUTPWfn70sXbc
         prXp0lOQ23j1HiXrxo07z0KaF2K+JKLbRTdMq9otHIxffNC/0ZO8st42N0ysGo9hzgXz
         WUvS+1CRwjYlgwdqonnEn3dU2ViiQJSDBDYpuTth6AOwVdrGOZGmqf8UQ/o1VvOHJeV+
         vRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142553; x=1784747353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVte+qBFAiblhyzUMBEEPT044OiLyJRnPNqnE57mdqs=;
        b=c+w271rJbI7B2+cHduHjI4Jq6cpiKGk47tLRvsSmJ+8tvvWsEkAm/OAhPsF0m5nEhn
         9BiDZYYCShYsvIxXiZ/2xY39td57qnBNBxA7mwnLA5+oNDSkRbhbzQP2Gl4JTHcnHLz8
         LYrjy3Gzq8bJ1jCVxntd6pwqS3ptCh+zY7qDMKSX7tR9geKjQ8+L2ht/JdwX2RlYZZg0
         FOf5xJjcLtK5pLU3UySxEwOL4f5qVMcTOTLPZNOCPy66oq3P7rAVcljIu3Ai499nRwIA
         D4MrfehIP8TQzPtONQ/VBP0HO9Li+x1kbM3Jopqss7RBMvpepBWLwcwkyJVZEFFhNEqd
         SYzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnfSRuVGG+Q844ln2aNdF+gFPRZk0cYOOBQ6sKzu/u19rv8pewY2Sd4C0T+cqpku9jFqP+Y6TSly05C1Bi7JHH@lists.infradead.org
X-Gm-Message-State: AOJu0YzxYsbI+iAmGROjpjBYymml+rADiVdWEcNaxLL2vNybiJjykR4p
	8bUOWX33Qmcli+/3VtS6oef+QSfoaT8Zs4+YmGk9w7StBOyTj2hPkz4T
X-Gm-Gg: AfdE7cmpDwgQUQ9a0BHNIzvxLkI8uTvtG6QKMTd/c+fZAaKfylPNXQpju0RqxDcyN1V
	F6SJz5OVFBaNDIOlN7ljFVhbXyAUrDERo5U9NecN+6dA+oDs69Aewtk8ukXt7ws1oGEot3dozUw
	ImiKCHftHbUVIthG5hhKXLAmgSMBP6EqtrMFKP30A3ZSrfXa/mRokjHSGedmKB3R3HCYq5VAKW9
	YEY4O/C66JP+OIuUQY7Y9nzVwr+/wrnUeGLLcdhe8MbSIVMr+AzP71yfheCpMJODKMHkNbZuYJx
	2W3UKklwxRKGTr5gxa2LaWoxEOKs2XmPHWWWo3y6n/oFrirf7k1GCrRPPOY6lh1VHzIJr85EOJz
	d+yLo6AhzWDHGbOjuUlKVK6UJGa3o3sAE2Pfxp+cMHEkNlYabqEfhBrNQmdu1FBIV3eWH/Niayj
	J/GScho/8ID3YHpKJxcEgi+t+GqaXrI4X9LFt03UqC0NAEOr+SlvKBFdHz1hzeqX70nG839d/fP
	V4OzfTrkuZESW6xd9HkVa568Oa/1II9dV2V
X-Received: by 2002:a05:600c:19cb:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-4953c15d121mr46243825e9.11.1784142553147;
        Wed, 15 Jul 2026 12:09:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:12 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 21:09:06 +0200
Message-ID: <cover.1784142385.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_120915_632188_662035F8 
X-CRM114-Status: GOOD (  13.67  )
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

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 4 files changed, 1028 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3


