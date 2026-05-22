Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FA1CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XwywBvEJpsm1f+bVDJtLQZjSntFIsWCaI5FtaThXLqY=; b=EXIt/dOOG4bby+rCQ7nJmyoR3X
	TB2d7e5wer16ydEqoX/xaXDWpc/EXcKCMw8KNCaZb+bZSdqIoNnMyusjnUloMWnSIJxVRhaE31+To
	Lzs9QOVou6yOv9IQKkZPqbdLbY+ZS72BxsYh8MeyJx799wbLF8KKMUHLusbOZonJ5Un+piR3PTQN8
	gSRxVdxD82NnWklBWlc47bYidnSPcV59fGMECBAgti1bJiXYVxMKTpOyNLkmDCiZohie1EZJoQ70e
	slJDbFmTV5im6AagC4d5lp/68XYdZRX5IWGUTdtAMx930+99+WxArkz0naLIHsBY/wlHSHPPihFub
	+ctXlSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNve-0000000Abpv-0auu;
	Fri, 22 May 2026 11:20:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNva-0000000AbpD-3yYQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:20:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49039a8851fso17799365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448828; x=1780053628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwywBvEJpsm1f+bVDJtLQZjSntFIsWCaI5FtaThXLqY=;
        b=IaXz2W2dtGGIDRd532W66pzxzyaLbX/nHNqxB3++inO62EIOki+cqbVARKqWX0Hw0n
         q97qEzASzHAWZsubVxy8YfbLVYLS3XPSjWNTHs97xGcvN4I9YzFWdzB54OzVWEhPHmEy
         M9tKg3rPmNnWhtM5PUiIhk0jVGvjsubD/Fj/VEu0Gh9Jg39l8MbH2D+db5NkdHirz7Ai
         25djl/SpGm+6Y2VOUoNQ68q37xOslBbne4eU5XjTf8YIeMhiY8YcEjWmVYF8WpRk+TAb
         0WxDCY5/V0ZhuE1mKtgZcX/Mg9DlQS+YrmBf3LY3RJsy/WM04MPR9YV/BR1GlhNCVY0S
         He/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448828; x=1780053628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwywBvEJpsm1f+bVDJtLQZjSntFIsWCaI5FtaThXLqY=;
        b=Rwa7/pT6iejbUmz63G+iB12kCt6FKoIkwMC9M9X7V79t71nZirQLvVtUcX/I9S1sxL
         SdDoTbmDTZwnHMXTUuz+CS/ISvoQ0TjGoUIJDKN9EoVpY1yYcqRoM6NfQP7p2NtD6ewx
         M9o9kbPBB5D6YksZk0Xinu6uOtxtDx9YX79xnNKfOdJpTMVOdkAWvqy39Tza9+A0p3jo
         JYh5RsO1ZU+78U+S/S4HaeXJN46RhPvgE7lvB5dmhhJOQjsyVqV4xEbVc4rxCczOL5r9
         lk7/eTZO2ydLY0FlmAH8hTkmrW10UkHgObBMFp6kA18OTfygQ9nBfRhVhB/AE/cYFnvl
         zVzA==
X-Forwarded-Encrypted: i=1; AFNElJ9As89MQHrrbg/TdIHVHJifGo7q0lkYdz6D6oQjeofX+R2iSL9jvwInm7xlXl9BFob114elECreTfZZSDSRALV8@lists.infradead.org
X-Gm-Message-State: AOJu0YzHookM7HJej5CMpBRSraRNSwxjoTEWuMU3epPszfVYJdkNCAPc
	hfTiMz9hdF0X8RzZqgPXjwNIEkjEvSzWcQpIg6wP6Gq0ivFRZgzRscW3Q5t3oQ==
X-Gm-Gg: Acq92OGWzan9n3tgiUzp0KoMmtSdr31y92GqeR0kOEAHhy3Xnh66rozAl6R1jrEQxfb
	tYtvZ5y+AcKKm/L4jp8+EFRLwfDOj4kyL9/QhYqPe2agkM2weiNTKk5aM6SRu1ASW1BbXyqnYt8
	3WLluRHA+uS+2eRF5+alTkr7yxWQy6ilw7nRplV+XzlJ+1f+8joLweJ+SqfidECuZ1xLsdaynEY
	qEJcaiWUrHKRXJmOxeSdpc1VG7AXhLOBrVE42qqA2Ar4j49Zf0RedGTZmJJ18IpxJB2h1tFOmh7
	ELAcOvyOjZ6TLzwUKYb7dpmD3y6aIjUjm9bbWfoo78+vYO/wkgFjfV3J65XGnIDoc1uqdi08Tng
	xaUDYo7DMCQ14CL80haWoNfloGWxtZqLa+KcGgQGzXuIoK27oPolQkKh0yrTu7iMURXNz4bANTm
	Oo9AZsNa7oH+zs24y9Iv4cFgEnno7eX+NVJEwun+GbmNZP1L6dc090mKXzUJyF
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr37709105e9.24.1779448828096;
        Fri, 22 May 2026 04:20:28 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add RPROC support for the MX95-15x15-FRDM board
Date: Fri, 22 May 2026 04:18:44 -0700
Message-ID: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042031_007026_834CF3FD 
X-CRM114-Status: GOOD (  16.14  )
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

Hi folks,

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

Laurentiu Mihalcea (5):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-toradex-smarc: move CM7 node to SoC DTSI
  arm64: dts: freescale: imx95-15x15-frdm: remove common rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  8 +++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 65 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++--
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  7 ++
 drivers/remoteproc/imx_rproc.c                |  7 +-
 drivers/remoteproc/imx_rproc.h                | 19 ++++++
 8 files changed, 113 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.43.0


