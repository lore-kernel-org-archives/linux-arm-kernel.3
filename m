Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A3CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wX2YvpH7DdQdsajdJe3TNhQ1nhuMxlfbSIyqkAE8Z7E=; b=3p9CSMC9iDtA3jGYjMvVoMAOkb
	4TkaW4b/IZWW5tJ5TJaxsbWzvEPNA5M6H0iYMSgYKscUH4vfwo6zFc4lRsU53gAe+RYOg2nkYLZ2C
	kZkYNBiPtcKLEPHqNMacRMVpnNEstb5a/E4rdBQd1CbyuwJJGu0Zi1+RR/IUxJiTYy37v3p7HH5iF
	fXGiNyqP+KDBn5ioBGHrUfqNi7wjlvTk4XfEzGID33DkrQMa3dPJrqoJGbBKyJgK7tXtCDdV9Oz2r
	UeR7cOWrc+nDTUdGS1DTC2SVeK5BFXmxjtCh0VNegPfvPxkoVn4T4jFjMj4HDP3phHKMVETASijRi
	10/y8lZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7m-0000000Azue-057r;
	Mon, 12 Oct 2026 16:43:42 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7g-0000000Azsr-0wwz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791823416; x=1823359416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cv0YOCl67A2bSUYRl7ofUt87v7F05LKG20xnzj4vBDQ=;
  b=etABn+zreZG82UHdUj8viJwI/aaDxUxVPVJd+dLJ/Fr8E+g4OJwgSD5h
   TmhICwW/DQCRrSplgmrYJ5jcJHj1gJ+9N65bzndrGS1NhAlHndYC5UQLl
   3IalA/cPhpxum/xUwz4NNzUStVDGhlBZBaYOrWVOGBaLduqslZvvkv0x3
   Lq/VmhPZKx+NhCjyOEBszRchxW4vVe19+Q+afDuOzriYE8L0rkSH+pn1w
   2KaaBp3uCDSdqz1s6HHuFxIxqmk2sbq79MaOne/1nB6/jV5U5qdM8xi5D
   Bqr26L0bvEYqLaaxFXZOF4TFF8YEqSbeypdl2UqN+FBDLIUN0UI2MF4uv
   g==;
X-CSE-ConnectionGUID: lCsQL7uER3qe14uzIyLOtA==
X-CSE-MsgGUID: OmYrY7gAR5egU8sDyWBsAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="410050"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="410050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:35 -0700
X-CSE-ConnectionGUID: xpmaf2bASx++l5FWpus8sw==
X-CSE-MsgGUID: r/lN0FUZQY2Znx5r3hSaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1004908"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:33 -0700
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
Subject: [PATCH v2 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Mon, 12 Oct 2026 19:39:04 +0200
Message-ID: <cover.1791825961.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094336_320787_556B69AE 
X-CRM114-Status: UNSURE (   9.40  )
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

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: add Intel AVCRP BMC
  ARM: dts: aspeed: add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 315 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 258 ++++++++++++++
 4 files changed, 577 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061
prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42
-- 
2.43.0


