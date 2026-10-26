Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F360A2601
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nJe8BYkV;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H6UsqQib
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XPlIwY0S0sn4bBSh2Xil5xdrfx5N4jwTm973vijhd5g=; b=nJe8BYkVnzeo0kZ5NZ96vcWh5D
	Om5elpXKUgtyYRBSjDCJ0s/0Rkr8gJ2Tn/jXqHhkRr8jbPhK1T7k3zTy0seMWjVOJkvn0LHjxbUk3
	vk0iXlneQPle6cMTgCBv0cvgW9YnOPIi0RmTXkUKxREkSzzeLTrzj1jH/SviXZrv954QksceVMsu0
	BsIjTKOLrPOiwLxZDsl0EWahal37AvP2Hs5wR/ubPEDLrsx+SKiXWPf+WnHKhnSK2ITMYCbqVViQt
	+Yt+dMnG5wfAI9NFef6JRgMMkw2K6eVgOJxkD+NmwPu9bF3sKZvSYnwkN/yhXmt0zVKjQNS51086Y
	HUAj2vIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMth-00000002mYv-3HNb;
	Mon, 26 Oct 2026 15:46:05 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMtf-00000002mYL-0yBY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 15:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793029563; x=1824565563;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gr6yVywM7WwdkGlnhrf4VhiYPUPRKPdnfkDFTc5rT8Q=;
  b=H6UsqQibwTuR2X2w5/e7C9NG85954qnJkc994czoSsAoYrwawwTcX1PP
   ff0OTkF8Pu4fV25UaZYfo5QPFKsIHeCXVku3eSpva2VS/vtH5muwRexmf
   FHtZOYGemz8OLPnNkR2fJfcIATSecnYWL+EPoulWUz73Ebw2yhx0Hnc1k
   NPd+kWfV1QXfvBqGICoIdMqf3qGcfslMq+EmQnrNFMXzUpjxw/93uVXrF
   aXKNNZSoV6SThGv3yDzOQtZ79R0p/xE9ONr1JvIzNVZX1p0kFZkcmRxID
   5RSpd0mGseemc3mu+MZAViQcoa+FtaoBPxlDRKjx8XxuGSx0zYpVdkI4u
   Q==;
X-CSE-ConnectionGUID: 13fDb4q0TKqjWeBrWvkoig==
X-CSE-MsgGUID: 2xN1DYHZTiO5It69IM1YAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1730840"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1730840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:46:00 -0700
X-CSE-ConnectionGUID: iG/+IbbbQmmQmtRlk3ZqgA==
X-CSE-MsgGUID: RX6t+cpLRXaHAx7WnzRzmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4369322"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:45:57 -0700
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
Subject: [PATCH v4 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Mon, 26 Oct 2026 17:40:27 +0100
Message-ID: <cover.1792749922.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_084603_318920_CCA639BE 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.5 (----)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms based on the ASPEED AST2600.

The first patch adds the board compatibles to the ASPEED binding. The
remaining two patches add the board DTS files and register them in the
ASPEED DTB build list.

Changes in v4:
  - Rebased onto aspeed/arm/dt of bmc/linux.git. No other changes.

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


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.43.0


