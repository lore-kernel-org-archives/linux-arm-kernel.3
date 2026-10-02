Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6DECA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijByx0+/K4d2ninXLykZb17+oCSqxaAY4HTB4azbBqY=; b=MqupH4j412Q35LBeo8eR8pdCLe
	jl7wz+O12c5+b4xKcPuEuU2bQYa8tes0RiKT7feZPoYNd0qPKQcYdd3PKR5LRRx0VaQO2V2FqS5NN
	YDiGufivPo+fL8l5vZUxJi6A74OqnHH5AV9O2P4s4i0Gc7uKckCaDdwB8kMbIItYsa6w/6a/QZOGK
	RqtRDE0S9Hus1MBbti/v/PYXzqUzJVII4OJCsLI2QzA4S2gw0MWUg9rjK4X0Swz4xIeoEFtbPOC3Q
	lZEJBljDmb+WBuhlMA55S1GRWVIR0ROPJwc5jWWFKTTyONzddMYlASYvFg5GP1BiVmdo+hezN3ror
	WXhtnc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJS-0000000Bwg9-01wl;
	Fri, 02 Oct 2026 15:36:42 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJP-0000000BwdW-1uSC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955400; x=1822491400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k7Lyc4eyl86PbGTSOmv7ydB0HYVEW7WA0vnMeArh/5E=;
  b=fXHK3xeG7XgCNAKcBO5yLe8OkntE6YqQFMYgOzip/SgRyguPmVJGcWku
   LmuyEfRjEg9mqgG9a/8CLcfbMbb/otVzt1O52yhYISKTFaiGxl/FO+PBr
   QCKZjcz0XHNt67skzeJLLIj6IS6JvlNneRYCGrhXoZXD6wS9c0soZ9uyp
   XXKg74HCCSMars9gGCYzvYatfpdMGQZFn8RnrKMPSaLQIJ27rddvaUdwM
   7215FZpIM3YCOwFiy6BzyvlsJkS/txiRXUCt0muoZtiUV3iYR2GyZ3NTN
   asEbxpKz47QURov+mqgMJrzk4oPrA36+Rtr+DjDK8H1VvXsNtaqNV1jCG
   g==;
X-CSE-ConnectionGUID: Yxa7PbgdRdWCxAuG0XdtUw==
X-CSE-MsgGUID: ess7AcjsSJGsOpFt2uHzIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117247716"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117247716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:39 -0700
X-CSE-ConnectionGUID: V22czOdbTVWeMqrDTzxWAA==
X-CSE-MsgGUID: 3X18j7onTsqwz70mkBfEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279522397"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:36 -0700
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
Subject: [PATCH 2/4] dt-bindings: arm: aspeed: Add Intel JNCRP board
Date: Fri,  2 Oct 2026 18:32:43 +0200
Message-ID: <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083639_505454_DE46F0AC 
X-CRM114-Status: UNSURE (   8.10  )
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

Add a compatible string for Intel JNCRP BMC board.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2c8180e49b2f..6f7d77efb30c 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -107,6 +107,7 @@ properties:
               - ibm,sbp1-bmc
               - ibm,system1-bmc
               - intel,avcrp-bmc
+              - intel,jncrp-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
-- 
2.43.0


