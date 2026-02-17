Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523F7E9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bS7q9PPDCy2sDXPZ247pIc5Aq5NHhY6a0if5OF26uog=; b=lSlOXZnH0/WJ/lNV6MXxJyXbDg
	nbGk/veqQxUboex1PFzORF7Uq55lvTEqzsNhuPU5ieGW3vPqzTR59RLUYjjvmglVZsuXNbj4FeQ86
	vKOxWVrffmikNaX/nZFwGTbfDE9scSviCMfh72q5FoKIh2RejzIPokXs56Oa+tABe8ZXAUwlkTwOK
	OSfsF9If61oV0YCI+CHCPrvmQJdA9audJKSLBz9Ilq0ri87cGCCOY+ckQ8pcFWZ1+bGtKS1mGO5KR
	v+J1MVn45vx30I49pESx/5431lN23bb1wO6lP6Ql3UNyz3wbmZeUYGmN1JpalCZrN+r36UQ/Ux4/l
	tAxHqcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2S-00000008kBW-0W9K;
	Tue, 17 Feb 2026 18:43:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2P-00000008kAn-30zU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so50844105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353787; x=1771958587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bS7q9PPDCy2sDXPZ247pIc5Aq5NHhY6a0if5OF26uog=;
        b=fl+NDnO3HSojw+80esoBTHCh8R6dq3GpPzbk36Jv3DcCjXyaxq3sRAoir/szSJW31d
         EkvNVmL6uck4tONJVPhG5XEN5AMYcopuzK9OsiOE4p51JzfgmZU0groojwwvAENzufuN
         zGAJSlGOeXWzqTleARKKWFQJtnRI/S4DCrT6d84Z9LfdhTnG0J0vF0YYkMm0Iw+yLgnK
         IXgbnbX0ZkGteMOAtisnphrIsHolT4yZwoxLCAzGu2oMi2/XWMgnLCCytpmeAzj/+dKL
         1+cOGYfp66kX/FIYL0GzWb6Vqzt+8QJ0EPj/ih6jCV8xae/WGRDDlTS7EPXq1UEncnqW
         CXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353787; x=1771958587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS7q9PPDCy2sDXPZ247pIc5Aq5NHhY6a0if5OF26uog=;
        b=JRDrzw2FYqi/JUAPNeLksNMz1nulaUEQbedwQGHpao0Ggbqx2+xOTnvPZ6bsjaVfVm
         h4eJnnoQf9PhWuMpxqZzjueGqwV4LoGOkOg5vnEKwsbDBSvwaa3v7JT9L518Q03HRRcF
         jyoTxCVsE4X28rMZVirJHZJIOmXkVzulmJcxEr7FvJuZ3RpNutsDLjt7piXMb6Lneqyi
         emYmL6DVrypRWMMaIgIZMv6kJfiX9adNnecY3zDztXzXmcL0z/gJR2cOuJhjkGFHzxGz
         tZh1vfJHX6IExYTNrkSSvrNDIhIdo6JVBqAY5j6Wnjs4wKNFmQ6OWNk3YaYV3W6nbM65
         1VeA==
X-Forwarded-Encrypted: i=1; AJvYcCUoJ2Jn15WxVFXGZiI7xLbhQIWnr6TsC5PsUUrt/6ZqBGcF1ie0d0CmG5SSKS7mzY2ixAanIN/OyYdFrBhf0aRM@lists.infradead.org
X-Gm-Message-State: AOJu0YylySAOJ6RMNf3zsitgqMkG/OASRrXZYdZ/8EBX8KlggQY2h4m3
	ntbuojzCwyfO6jnq18lL3O1UHpMbJWE9RwK9S62iKcbygQ2y/Z6RoiAg
X-Gm-Gg: AZuq6aKpOqRx0LuOVnGIfBH21e8Mm7mqsSU4fFLQcujJ4CS3dwWtcuoZbl47OY8GrOy
	zF8I8zktE+PdgrHXCvn+QmiIFahnhiaQ2X5Q54G8HMK2rjQg1r2arOus34sJed4V8MyWHhBWwSc
	CsJ1xGgH1Y+dyNu9xFK7ezxOjXRTx3b2MFX+QkWGJULodvUM3mDR/6mHc+N0NTQ+eE9T8N6Fb3F
	HiTJ5nRfARve23DNpmlDDjt4uf0QCgldhGRtCwJxsKqeH3OXXgzo/gWAxsl/4It9L1rGMTBCNTc
	JbELcAFhivS3uRGiLZ1xaP3V//qM7w2ezPWsDDurRrg9IifOhhHq9jRaxbEFBvLa53uiFdmaJc+
	lxPsMjZ1eUN91teLS6v1LkMO4kexVCpEw7pBqRXkwgqoZvqawkufN9J8tmhdLP2pvTRqUgF3r+i
	lKT8MluxYreyq+Oh2gaA7SlsN2YT/L/epmJAFZkEBngEZpv060ANQq6dgmSXn1GGGNLJwSM/hQA
	VWJVFnpMWSZRBZL+O7r8VQSk1qUR7vUQG2XN9Pw
X-Received: by 2002:a05:600c:1986:b0:483:71f9:37f3 with SMTP id 5b1f17b1804b1-483739ff8cdmr266953675e9.1.1771353786638;
        Tue, 17 Feb 2026 10:43:06 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:06 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Tue, 17 Feb 2026 19:42:34 +0100
Message-ID: <cover.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104309_773936_ACA550AD 
X-CRM114-Status: GOOD (  10.64  )
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

This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

Stefano Radaelli (11):
  arm64: dts: imx8mm-var-som: Move UART4 description to Symphony carrier
  arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mm-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: imx8mm-var-som: Add support for WM8904 audio codec
  arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT configuration
  arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
  arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
  arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
  arm64: dts: freescale: imx8mm-var-som-symphony: Enable I2C4
  arm64: dts: imx8mm-var-som-symphony: Enable PCIe

 .../dts/freescale/imx8mm-var-som-symphony.dts | 206 ++++++++-
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 420 ++++++++++++------
 2 files changed, 474 insertions(+), 152 deletions(-)


base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.47.3


