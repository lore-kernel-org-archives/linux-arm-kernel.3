Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723E3C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x/cQJetXUwREpJtO6U/4XH9VpqOr3ACDI9NNqqOMZH8=; b=qbkO3K5GRFFjS6aUWANBS80HCa
	qQ6lKONwu0gcbFBTpWeMOrt4Ym4vofGTYP6GZUxZ6TdV6EylsQY2Q6rQnBVA2nkm78XhicaX97oKb
	q0GapZJfLf5fNsCuSHoxemBW+NwYmFaAVczACKuptmqZvLhrA8xolSVD+KNWqqLHalHh1JEibetMM
	ljjJWu7oLRdQQaR98CTy+KwuvI6aYPMmmBtVkD+XPe11KhY7CaJ+Wo/J3CnSBOcdIKXaMer6R9Y3F
	asMtlBUIGAg6mxIHI8nRN6kMZqFj2VJx/qpXIm6/pLxb054xwxDgEheBcP1tkouPd2TO1ql1r4A+l
	cswb7+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2WN-00000007puj-1dBh;
	Wed, 16 Jul 2025 13:50:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Tt-00000007paF-1Er5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27C29A573DC;
	Wed, 16 Jul 2025 13:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E2AC4CEF0;
	Wed, 16 Jul 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752673651;
	bh=gmdutkgfIQniQfWFrKfQBe9pqVMRsWjopT4us94/R4s=;
	h=From:To:Cc:Subject:Date:From;
	b=RNBtuim0eJlux30Hn+niJkRGONO1Ri9QpPMfiy8l4+53Xv32m5H2mySpMOT8XuiT/
	 vOnly7BJRGqqOGtAhXq1bVQjjlqC1HjtZ5C/C9t2/tD9H+Bk+/Yc8DzTAliBLe8MwV
	 SGmJf9t88fBEm9SXPgcZvN47SgOkcCzAkfZmpTbGEdkg7syA4s241wX8a175aGSl5o
	 iuZrQCYnN2+mSFoo2ewX+pPwAxijUc6lPjQ2D5QgTW128GICYiy6rIvCbrALfFy7Sj
	 XWNtDRn4kgN+xCZ7obi6R6awFR/nQGTlhd01QEC2ngrUAIO+/AmRJA/UmSx4zJNH9y
	 cw6PFBkvj68XQ==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 0/3] drm/imagination: add AM62P/AM67A/J722S support
Date: Wed, 16 Jul 2025 15:47:14 +0200
Message-Id: <20250716134717.4085567-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_064733_398813_4D67596F 
X-CRM114-Status: GOOD (  12.07  )
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

The AM62P and AM67A/J722S feature the same BXS-4 GPU as the J721S2.
In theory, one have to just add the DT node. But it turns out, that
the clock handling is not working. If I understood Nishan Menon
correct, it is working on the J721S2 because there, the clock is
shared, while on the AM62P the GPU has its own PLL.
In the latter case, the '#assigned-clocks' property of the GPU node
doesn't work properly. Linux will try to set the clock frequency
before probing the GPU. The clock handling firmware on the SoC won't
allow that if there is no user for it. To work around that
limitation, set the clock again in the .probe() of the GPU driver
after turning the device on.

This was tested on an AM67A.

Michael Walle (3):
  dt-bindings: gpu: img: Add AM62P SoC specific compatible
  drm/imagination: fix clock control on the J722S
  arm64: dts: ti: add GPU node

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml  |  1 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 13 +++++++++++++
 drivers/gpu/drm/imagination/pvr_device.c            |  9 +++++++++
 3 files changed, 23 insertions(+)

-- 
2.39.5


