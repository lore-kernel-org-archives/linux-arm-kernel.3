Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A4BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2qPw+Pg6F2BVS6Rxytm/LCoHFcBV7RBXe2zcL1rJqwQ=; b=xlf/+YT/mfSg6Dy8gDLnfdrknc
	Q7ZKf1N1mY/i7aMUoIWKEqpSDmF7dvSU5zyW5rd3I4Qb7AWQ+2NXOSX6KCC90PSJBsNhKOW70GQcm
	ZAGTsWhl1yKABkoM/uxoDAi9J2eVrq3NECbCDcPAA9VPWMnvaS5/miFVaVSpvB9mggbCe92YQQRRV
	n3OiunZZWZsfoy7Hr5JrBYtcZr7mLBTikyF/b1hTIgVVLkCbjA8EdqOFP0P7js/daj13ZW0U4SuZw
	ksUxdTqlzgE2Td1rIQIK/6EkYpjWuU3Y/wDsZZzZAxepBF3wTtYC+eMQxGH6Ha13kwjzmjsglXOYL
	55NO69cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJE-0000000BwbO-3L88;
	Fri, 02 Oct 2026 15:36:28 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJB-0000000BwaY-2zNx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955386; x=1822491386;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ID/HkmFMTgXfBvEK9zp6+sIFgeqPAHbQ5YXi9GUqiE0=;
  b=jcuUzkFMQGFwdm3zOyLHtugz5LRvVHLjEmOJITOTrGh+MZo2SrgAoeVg
   ttExL5OX4ZNxGcGHmQR2SjyEblc+cLCHG/FCTmleJxlaZ2IsQpuH5m2zV
   Xp0pf4sFMXbAObQhRbDnTdEH1t4+EwiPI2ZgkPiSuPUPj3ogCKqyA1/vG
   5yRMrsj9RCinyOhhza4x+12YgC/JIRMgPbP1b2LnjUuue+8GioF7sCWOx
   lpfuZ/yTlscY+RoNioa8pTBwJlgeKvx2OrbVXbjbz9YYcPh4oniiQa0S4
   2/0zsFSJ/94jokE8R9tciKYA0862J8jUr8QiY9kz53wT97+FsIOjdqWLu
   g==;
X-CSE-ConnectionGUID: CAqClPRORPe2vKS07rKQhw==
X-CSE-MsgGUID: JLIjle/BSP2dtC0OR4PXbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117247683"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117247683"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:25 -0700
X-CSE-ConnectionGUID: /exO7IEOQoiF36dXfvuycQ==
X-CSE-MsgGUID: Btu7op7IREy2zYlUhnhmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279522351"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:22 -0700
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
Subject: [PATCH 0/4] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Fri,  2 Oct 2026 18:32:41 +0200
Message-ID: <cover.1790344811.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083625_762671_54CCA861 
X-CRM114-Status: UNSURE (   9.44  )
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

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms based on the ASPEED AST2600.

The first two patches extend the ASPEED board binding to describe the new
Intel platform compatibles. The remaining patches add the corresponding
board DTS files and register them in the ASPEED DTB build list.

Dawid Glazik (4):
  dt-bindings: arm: aspeed: Add Intel AVCRP board
  dt-bindings: arm: aspeed: Add Intel JNCRP board
  ARM: dts: aspeed: add Intel AVCRP BMC
  ARM: dts: aspeed: add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 321 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 257 ++++++++++++++
 4 files changed, 582 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061
prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42
-- 
2.43.0


