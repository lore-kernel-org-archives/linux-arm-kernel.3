Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EF7FED3FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VxBRN8XZjJPL2qXcKamKesTsP2QnEc9zbo5fz7dhiUQ=; b=UGRKA6okb0xN89kdTbMA8coaNT
	aka/8xF1+qHmraPDulSyQkaQ3Q4gcrORE4JPDN59fBpbagzX0WNs3KV8RdNCJFJRpTmDMAwl/EVHN
	r65v7ajkc3Khh8Nu/Eb5Ut0W4PHLR3HCv4d+uQoM8bvZN3K8xCe8lBl5HnRdRABpu4JGdy+lYD9P8
	2aFrptogrpChHafw9mmNETPfCScDeQX39D2MhUibBjPeidm3vqodLfDqaw53Aw/EtvXnrelcHLOc3
	BEhlICHFYjzknMdj9b4C/qt0BtuP/Rej1u3XrCZ/Yj9869MdBysbjKSIfUKwfPchDeTNnwaN6NaQV
	Av/NdVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGM5d-0000000Dh96-1IGG;
	Fri, 24 Apr 2026 19:21:25 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGM5b-0000000Dh8j-06UA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 19:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777058483; x=1808594483;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vtA3a8VJttJ/RUgugzEUJjXVC/tqXxTv7XGOrZdWfp8=;
  b=M8QUV7cYLh+GbsgMS3ZiSOGMSVgCQ6amRea2kiCwTNgh0SwuhYd7B1zr
   GisPQP6IBEnAtXqsQm5Dxd6HJKSMo3k627hl0OfCW07hwV3+DG3SYlAQf
   VIj8exej9F1Tui5cSHp5D0seM6DPRWPpcCeTNU9iC9mmeJcdOhxtvSABm
   G5AGn1euNntYtoeP5tSrcvG9SuC7auApY0Pfs0hJmRuOhg0qQGuwBRjkt
   pVEYSa6c9MQV5xZ7fR9HNErUk2rZIRozSxhWc8CbRPsBeNBJMWIBygrIp
   m91/XNwoseGya3LCNnI7ihD6pD3GtKuPEmbVRLq5oYQDipZvvJRH7B2hc
   g==;
X-CSE-ConnectionGUID: PoGisV4qQTiwinnWdNimLw==
X-CSE-MsgGUID: fKSTOu2HR7KpzI35MK86Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77208267"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="77208267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:21 -0700
X-CSE-ConnectionGUID: u9JzOGFZSP+X9N/OTCGh6Q==
X-CSE-MsgGUID: pms+UV2zQ9G5cpUtbEqmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="232040479"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:18 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and bindings
Date: Fri, 24 Apr 2026 22:20:58 +0200
Message-ID: <cover.1777058942.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_122123_075038_807B1112 
X-CRM114-Status: UNSURE (   7.40  )
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

The patches first move I2C controller nodes under the APB simple-bus
for layout consistency, then document aspeed,ast2600-i3c-global in
the syscon binding, and finally add AST2600 I3C controller nodes in
aspeed-g6.dtsi.

Jeremy agreed in a separate email thread that I can continue this
series under my authorship.

Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c88e.1714647917.git.jk@codeconstruct.com.au/

Dawid Glazik (3):
  ARM: dts: aspeed-g6: move i2c controllers directly into apb node
  dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
  ARM: dts: aspeed-g6: Add nodes for i3c controllers

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 543 ++++++++++--------
 2 files changed, 318 insertions(+), 227 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


