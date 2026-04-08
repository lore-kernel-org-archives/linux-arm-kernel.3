Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CD610F9968
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wv0AWcHgu06bDFm+BUwIIlJ6phYQwKz8lXRSI36ll0=; b=WcG7EDYfKLAsptu2C09dCBOsuF
	bBEIddB40CEAazq8cYmVIX4vBWEfyStib29RI+txkNqgrBr4NdHUeIFCKWOzJ20APnm81/z3Y27c1
	1ddSeoFxnTnLAnJzOojt3a24fZS8vLaqaB7jVJr5C3T52c6wP/e90aOtg09RPs8WBgMldOSgvPvpr
	Le1uwwyqXj4i0GE3Jo6lgoAdaiygYURTAaI/Ef6PhnX4rjgqsG8Nw/l1miCHMMx++DDddp7tpNlQf
	ob3smV17RxmIVKLHTik2ynPn1YLA5Lf3nvy/1/r0+ny/xCUbwFxDBYcUCvaDWiRLALfC9dKqe6JSG
	GJqzGk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmS-00000009K8X-0nM6;
	Wed, 08 Apr 2026 19:41:40 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmO-00000009K7k-00n9;
	Wed, 08 Apr 2026 19:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677296; x=1807213296;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m2f0MgviSe4n7FamZwL8P5PBCKEndEE+/KV0B5nZuDg=;
  b=VRVUWw87ifky6nWudnWM0PAhXNiiBXS+1XcesHaXOXAgMWIVhVO11Od9
   HOgFscmQL+S/DB+wt9QzHUIVWxmvx0fjKvBs08Wzh9/8nPnSMzbm9OqPH
   Ymb1g8NNO/9C33Z1fh99L9BK1DqORmY9fkt1mJTxJY5ofv1ZksZhtlTYt
   IFuUh11PNNsjQsB2YgUR/BV5WSL+TdsPrDCn7IhYpf3Sl/oD6DzYTyyub
   VVj7en3dWfbaMfNMvfidHEpTSZfLGcp/KYGJjAHZWlsCSAf7TnUM2OvBN
   bDOJ9xvz7UHnnKcGKQ6i1i9GxAxBV4zvqFw3dKMV4jcWvuRLwHkD6HCIP
   A==;
X-CSE-ConnectionGUID: SzpP8guWTwqrrRyYczx5ig==
X-CSE-MsgGUID: mN41o4hoQeGie6aimAUivA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88056882"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88056882"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:34 -0700
X-CSE-ConnectionGUID: XAD6QAc2SwKwIrhvqhfXHg==
X-CSE-MsgGUID: 8wH8aIgPT6WijufKP3yuHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222053320"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:30 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: [PATCH v3 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and bindings
Date: Wed,  8 Apr 2026 22:34:32 +0200
Message-ID: <cover.1775679285.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124136_094996_62776887 
X-CRM114-Status: UNSURE (   7.62  )
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

This series reworks and resubmits AST2600 I3C DTS updates that were
originally posted in 2024, but stalled without further upstream
progress.[1] The series was rebased onto the current tree and merge
conflicts were resolved.

The patches first move i2c nodes under the APB simple-bus for layout
consistency, then add AST2600 I3C controller nodes in aspeed-g6.dtsi
and finally add the missing dt-binding for AST2600 I3C global
registers. Jeremy agreed in a separate email thread that I can continue
this series under my authorship.

Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c88e.1714647917.git.jk@codeconstruct.com.au/

Dawid Glazik (3):
  ARM: dts: aspeed-g6: move i2c controllers directly into apb node
  ARM: dts: aspeed-g6: Add nodes for i3c controllers
  dt-bindings: i3c: Add AST2600 I3C global registers

 .../i3c/aspeed,ast2600-i3c-global.yaml        |  55 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 549 ++++++++++--------
 2 files changed, 377 insertions(+), 227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


