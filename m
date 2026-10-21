Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD05F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z+XhcfM+;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GXxgBhyd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3dwvi8Bpy2jkTM5NMOT9ZeaArUVyCEJHSfhITQg8gn4=; b=z+XhcfM+mAwDyYSeQ/Np90yzhb
	HHTlKATpd/8qkhSZzhWE4v7hgejD+LlSANnaEz2kcb+pVkib1bJuAIevQB9lJz1bxxYTPK8sbLbVM
	g6Qdup4k1SfwU92s+dwzArkFHS4wlLCxGUBHh6i+0VCmUQ+V2Vk0V9X7T2nG9y1XjYikO2gLyzDFS
	QUKRRP9+3iI5V/37Wx9vzuvumRQgjHBm+oRMmVvLqFWDhKa226R2+hTuT2pVRoy8fS9PiuAWq/+d+
	JHXpnHdZDQkCnXR80kcdKvzO6MdB5vB1ChS7fviFTh5NyEeXBKV9qmXkXJBdI1wvQANAn0/Ck1rxo
	dxoejQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJc2L-0000000Cjhg-0mX6;
	Wed, 21 Oct 2026 19:31:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJc2I-0000000Cjgt-3EsV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 19:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792611103; x=1824147103;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=THW4sdUtHqOvMX2OSOZLFucPcnAbZSf+yoP9iqHJj0o=;
  b=GXxgBhydE7iYladMpZaa+agblIbYJ/QAZIHDB8dfUpg5osV3UU78eDzs
   0HfZUzkuvouXE4PDe/RACsoaoeBan6vDr7g7gqTGecAz8JG5YDvkqH38s
   8G8sVrfVAh7Ut/R/tOi+u4QgQ8XdGnYu2G7wviyfmcduj1PGbztRDjxC/
   YS4TXg6NWi2IoGFrCuEeWG2wsWgQ4mhLA03jH1G6VmvQoxILbHJR/Pmrl
   H1CS4F8tVXajneZ6NxH6LJBTwUBY07h/3Eixb7ZF3xoC8daFMcuTk5n++
   wrPxa5IwR07BceQ8v6dJXzV/zHZBmiEZyVF4tQEzAPBfhHLUK1F30LG7T
   g==;
X-CSE-ConnectionGUID: dpo05B2YTVqnoe3QemQQFw==
X-CSE-MsgGUID: b4veH/++SvO/9PQdlQ5Afw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1382510"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1382510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:31:40 -0700
X-CSE-ConnectionGUID: cu1H3ycBS+WuGh32R4bVOA==
X-CSE-MsgGUID: LKEf30hhR3KrVvjqgvin0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3170385"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:31:37 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Wed, 21 Oct 2026 22:26:39 +0200
Message-ID: <cover.1792613583.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_123142_817249_3B8B5340 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms based on the ASPEED AST2600.

The first patch adds the board compatibles to the ASPEED binding. The
remaining two patches add the board DTS files and register them in the
ASPEED DTB build list.

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: add Intel AVCRP BMC
  ARM: dts: aspeed: add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 322 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 276 +++++++++++++++
 4 files changed, 602 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061
prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42
-- 
2.43.0


