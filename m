Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99970CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 03:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rhJyrh3aV+3odzPmpWAqooXptKw5M2zQUOI+wqM08wQ=; b=2bgpx6u/axN2km8hOwIeq0e+f8
	zBqofDHiqs4WMV6zjBP3WsCY/BnV6502+eQMU1aCsK2/ixA1JixpsJGxOa97k7tymjUQKKaJG+5Ij
	lHNf5Qy1te5DXe0AvQbLvKKXk/3mNPKOR9MeCJSbwbK/RFPHtN2L7mxnNiqCbNZDLRD6fUWMuCozs
	voKEScFlxMx/6UE94iLfqnD582hhGcwduFj9lSSvDO+mjl4JT26n66qQ/C9hQIsmF5AnEAvXWK9T9
	MCSwbvNMLRncWpCGKnbTuqdQ0Gx+ebpPJx8fMgF63fEPIbDwOkiUa+tsEZT/UfWxrdGGwLPD0J4gA
	lPgjG5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7Iu-0000000DuGw-29tU;
	Wed, 27 Aug 2025 03:58:32 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7GE-0000000Dtxo-06Rv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 03:55:47 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b49dcdf018bso2213934a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756266945; x=1756871745; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhJyrh3aV+3odzPmpWAqooXptKw5M2zQUOI+wqM08wQ=;
        b=XUIkVY+4F41mHuQ0cXavI04gvUvs6O8OyOO0CjXuEX7dqUat8SZ5njNPWSDnQyiMeW
         LlexByqMVQL50Bzhmnmyr+xdeGy7E0TVmrVeLPNTTNRiQ9GlbVbc2QVsThHpHDkPMKdH
         eQUDdz54pX6AJWomRMWX9zBSBsxOhUloTwTU4qBO/iixo3vi0L6OTaTzJpx2sRZArmRn
         mxNccQSOazHstHpy9zmSc+uNpObb9cHeUtXrZ6E18dZfqUjhZSPOSJSZ7qrdVoReJ7Wn
         qOmVp58jBblhQwlIW9Xc3HxLJzBsK4SKbPkQ2hJTn10UgjpKEC25fTeYl1wHwAfUtA9O
         fhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756266945; x=1756871745;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhJyrh3aV+3odzPmpWAqooXptKw5M2zQUOI+wqM08wQ=;
        b=XRsU69c2/eYjxnYyOnAKrzb0hejG+bt4RCnQ6XqE/6iJb3Qmp8AZR53euSoJ9HiSul
         nvBwoWKRxJokqcsTzsgdGi9UoBCdf7Whe7tlPoERQUAeYyjxM+2Xznj16W5r5ZwSVGtb
         m2JzN/SrHB0tq7FrzPBMfX9LTEQkQ3mdZyyOhe0Xk8umaM3X1gUTtd976I+7yqaIbYOi
         Wzn0zVsJqqTxG1IytLpR8p+pizYhC1bRg02Kg11IkeH44RmoNcf9NmD6VPbCS00hRw/3
         KASJ3dVCcBK0J0/FtaEBGgxQmNi7Og+dfnTdvWIwgB6vv9qpZQ2OthCKpZb7l75shFal
         e/Og==
X-Forwarded-Encrypted: i=1; AJvYcCUfu6USfAd70OZe11/BQ0hRE4z6O0wXaMbGVxEtb6V7RRy5rqfrIKM0hQ4ghIRI0oMHwbj1kKNpGiDE08/aLn1A@lists.infradead.org
X-Gm-Message-State: AOJu0YxXgsjxY+TclrIGad+bjBdKuhsCkZWGbd43LhDXtej0SfOC7wI3
	+BxH0DN7ojjzb921py6Mh/vZLvs45N0GFnipi4Ce2u6KHsZYzFpmEjQDDzHBYV5n
X-Gm-Gg: ASbGncvsTntvFPDem7en/g/7V0UC0upc3sinnGHbhjCVomE2roR5pTK08o7wIJd1fek
	wKlpz1RHCQWO2Q2KRZG2TyleZ0AxCnBYhSRWo8KelLj2JuTavC4pCwSg4U1AZcAVBIKb81bQMBh
	2Bystc+Hv9yGvwTmZJn7NTGpZj2UZwfryqda/YVHeCJUGFRgvlGUdJ30Kvr0/2bE7etzbdA2mQ9
	6w9/JoySwAWI6l5MMXDuyjApOEkNwJszCBIiOFtyJSVdKX7XkJ3dMBidZe8fJO793Np53UL+IVK
	cVl7n2Ap+tAr1MtCYgmBnsNhS0jxWefHterSJy/2EoDJrVMFZIL/eoWK6BCjbBXe/kUOF6VvAPr
	xhLPv8JaGNN3RBu9v2eKPtvWE1YybI6LSAJYmPNXRAz0=
X-Google-Smtp-Source: AGHT+IHCKulS5BdqLp8mRSWpksw+q+splIe3zzH4/ipKfWgAt9xTzPA2rbkbMvF0CbSu69Kz/T0M0g==
X-Received: by 2002:a17:903:1207:b0:240:5549:708e with SMTP id d9443c01a7336-2462ef942bdmr209447475ad.46.1756266944779;
        Tue, 26 Aug 2025 20:55:44 -0700 (PDT)
Received: from dragon (23.106.129.234.16clouds.com. [23.106.129.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2489b6a7633sm4970755ad.85.2025.08.26.20.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:55:44 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:55:39 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.17
Message-ID: <aK6BuzIYwUBRU1GW@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_205546_069152_F9EDDF8C 
X-CRM114-Status: GOOD (  10.38  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.17

for you to fetch changes up to 37e5caa5571b5a60b0c835a0bc09ab1e53f57bfe:

  arm64: dts: imx95: Fix JPEG encoder node assigned clock (2025-08-22 17:45:30 +0800)

----------------------------------------------------------------
i.MX fixes for 6.17:

- Correct FlexCAN PHY settings on imx95-19x19-evk board (Haibo Chen)
- Add missing microSD slot supplies for DH electronics i.MX8M Plus
  boards (Marek Vasut)
- Fix assigned clocks for JPEG encoder node on i.MX95 (Marek Vasut)
- A couple of regulator setting fixes for imx8mp-tqma8mpql
  board (Markus Niebel)

----------------------------------------------------------------
Haibo Chen (1):
      arm64: dts: imx95-19x19-evk: correct the phy setting for flexcan1/2

Marek Vasut (3):
      arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH electronics i.MX8M Plus DHCOM
      arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
      arm64: dts: imx95: Fix JPEG encoder node assigned clock

Markus Niebel (2):
      arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
      arm64: dts: imx8mp-tqma8mpql: remove virtual 3.3V regulator

 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  1 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  1 +
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   | 13 ++++-----
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    | 13 ++++-----
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 31 +++++++++++++++-------
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  | 10 +++----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  2 +-
 7 files changed, 44 insertions(+), 27 deletions(-)

