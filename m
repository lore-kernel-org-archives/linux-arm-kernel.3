Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E14D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EQGfCgtGxny3+etN5uPGt5VE9z/U2oT3XLy2KTaMLtM=; b=L1/tqBC+fgpn+zPNVdZDkNirMG
	G0+KXdVRahp7joaDotJQGw9rP9VThew6iroWWGlWtMh9qJrRKxMA2brt6W0JIlsPzmkcywBiGabtq
	ucs/PftCP9OVfVWjBgoXFcATifcJnWR2UIBkhglHYmIIlbCDBbILFoFUzCuLNkQu6yJ7LZ8nO3MKJ
	dMhhEfHQd1BKPCHfrRuwsoOc9nGJu9mIbxojA4sxnOqr+bIyusc4oGLzmzklO3zd0WlkdqO+3wDzK
	iKONscYpRgvGJMSY4qgR1RVPqTtDFsBA3YzMidPrxqtW/qtAiQZmCgc8y9t548Cs3P6Vcej0XQ4JH
	KICSeWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cLJ-00000002XLM-3akv;
	Wed, 06 Nov 2024 09:28:49 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bzO-00000002PFZ-3rzI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:06:12 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9ec267b879so127502766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883968; x=1731488768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQGfCgtGxny3+etN5uPGt5VE9z/U2oT3XLy2KTaMLtM=;
        b=h69h37j3p2MUDmd1u5kNoYI3fB0AW6d4idIzq0UFzrClCsW6deh2KwU+yNuDvMqZYE
         cZTTTbAiGPiChJlwnY27i6kheK9LEOfrjeZ1IQUAor3v+vwOY8mgnYEK2IpP+XO3MT/Y
         szVfG7io5khsYICycU+dzlqIcmLauySrMjet0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883968; x=1731488768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQGfCgtGxny3+etN5uPGt5VE9z/U2oT3XLy2KTaMLtM=;
        b=GkJRS3VTo0CpWYbd2Vm2QHrhEL10fbDP2eCn6gsFbVA8ze0kEqk66XAOAAmDi06TUw
         3akTy4xd6KuuK77pQbbkUCSXv1sq6C3R4S/JsZdj4fEjNhL952rYwL3ld7l5l2MaGI71
         hEsYaSvhWQNiO4bzDc0QEzkmxTl3YwfNqPAuaY4SCQJHMFHbwUeAa9+nzzI1buYA6Kcd
         6Snr7V9erxTbIvdPawBkZQIK1smCrzT0yLMt8V5nujQyLRNgFWgbWvN6w+Iuw5mZfN2F
         RSeqhW8HgnY29q5DhfDWMpoZl8BnTaEX7U64WYisLMDCHm2WLFkktILppmvh2puFjUyh
         +mOg==
X-Forwarded-Encrypted: i=1; AJvYcCWiAkGzki9TuIav/AdRV2oqI/Ocr+f2j/DDbaOjxZWIY9cNEfzCajhsmLxIml2kQ6kKQ9fNdKvouRQ/JhY8rJw2@lists.infradead.org
X-Gm-Message-State: AOJu0YzpaU9oeCAFm5hboMeT+RXtFwXxMWulc348Y+1wIWf0y7SkuP2V
	dWpilFKeDhoiN59zy5QDmSHFkWrvvI0PQs2QbcPz3qbCPImrECJcm6MjsCXNQ9c=
X-Google-Smtp-Source: AGHT+IHS33PWmczfWikAhpAdNlCU+a9+IAsnRCa7MMogy1tCzBHrZ2XtY5RmjifBnJRTUzSpIvQdoQ==
X-Received: by 2002:a17:907:724d:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-a9e50978806mr1335979766b.39.1730883968287;
        Wed, 06 Nov 2024 01:06:08 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] Support spread spectrum clocking for i.MX8{M,N,P} PLLs
Date: Wed,  6 Nov 2024 09:57:56 +0100
Message-ID: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010610_998590_8DB7B236 
X-CRM114-Status: GOOD (  13.71  )
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

The series adds support for spread spectrum clocking for i.MX8M{N,M,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (8):
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx: imx8mm: distinguish between ccm and anatop references
  clk: imx8mm: support spread spectrum clock generation
  clk: imx: imx8mn: distinguish between ccm and anatop references
  clk: imx8mn: support spread spectrum clock generation
  clk: imx8mp: don't lose the anatop device node
  clk: imx8mp: support spread spectrum clock generation

 .../bindings/clock/imx8m-clock.yaml           |  46 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  |  99 +++++++++--------
 drivers/clk/imx/clk-imx8mn.c                  | 102 +++++++++---------
 drivers/clk/imx/clk-imx8mp-audiomix.c         |   2 +-
 drivers/clk/imx/clk-imx8mp.c                  |  21 ++--
 drivers/clk/imx/clk-pll14xx.c                 | 102 +++++++++++++++++-
 drivers/clk/imx/clk.h                         |  24 ++++-
 7 files changed, 289 insertions(+), 107 deletions(-)

-- 
2.43.0


