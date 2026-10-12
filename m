Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D49CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCEnnIXq+wscEvAbwOlCsu2gpg65/OuZHD1QbNIMziw=; b=L5feiLdgAdUcMkxU4UD8A0LajT
	8mTHBQMW3c0w9eLi6+ZOwbpruiUOagS1vvTxWAiW69UM7oEZcwdX6EoYezQcH1Vc4/SPtaHzyPt5Q
	tQTYuIgZA8hiPTBlnliikECO7AtNiqpnALAIK0LjxN4eK8BZRvd6HgJOv6TcQ0Kj7z1b3dw/ZW0MI
	5VprEXxB8Bg/KFZeUm9CdtX+LagIB0ByU68uO2a/s/5OlUPVMHBrNkPDNLm6eC9Jdn6v+lmzdASYk
	Ula0CaDktFd70lxKEB0tvQ+NoB/U2B0J965raj7lKf/SIo2h6Hdt1QH0cYaBbb8g4P3UPtot6CR7D
	iThzWDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7q-0000000Azwk-0UTn;
	Mon, 12 Oct 2026 16:43:46 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7o-0000000AzvT-0Bjx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791823424; x=1823359424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qp8ehQlKBEpYMpNpbGBobCp0JbCv+zToa4qq8WFMcAk=;
  b=U3qhk5OoiMGE4Ev4mAKeEAmgmIOogg/7DiJcrzp/kRIUvwVdiQnySdox
   5OKkHjtEop8qx48+ouUHohIkhaWXqXCSrgRQRG53L/TPkZUQMMjPJSQPO
   nXI3EMg8oVQxU5rMPmP+pgWDeb4nZxuxAx47T/ZKStGZ41Wpx2x3vc3sx
   aha6zXvRaeXLnfybCg7hVu6unT1K39PnVZKbPHP6IJfdSygZfR7W/+mib
   GNJgfWm2NIdEsfXfdr2LmCgQuOusr+RumtUqW+xhx5CHV/kAi5TIlMlnF
   RhW5hsw+5MosjbrmYhkNXPW3iYoIBKtFKY6ylavv/XH3zd/0JWW1x0v8/
   w==;
X-CSE-ConnectionGUID: d34xQooiSiKrVZVRf5sa5g==
X-CSE-MsgGUID: kwvIe+LFSyef4UmqAm3LDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="410087"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="410087"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:43 -0700
X-CSE-ConnectionGUID: asXuhYDSTKqumKcmgKmFqQ==
X-CSE-MsgGUID: 35YRVcKoQ7yCpmP4X9cXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1004936"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:42 -0700
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
Subject: [PATCH v2 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Mon, 12 Oct 2026 19:39:05 +0200
Message-ID: <0b8fbf07323894a48a777ea531713a0285e319d4.1791825961.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791825961.git.dawid.glazik@linux.intel.com>
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094344_130498_B0796D41 
X-CRM114-Status: UNSURE (   9.60  )
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

Add compatible strings for the Intel AVCRP and JNCRP BMC boards.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
v2:
 - Squash the separate AVCRP and JNCRP commits from v1 into a single
   commit, since the changes are small and closely related
 - Fix compatible string ordering so the new entries stay in
   alphabetical order within the enum
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..60e8e73da3f5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -107,6 +107,8 @@ properties:
               - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
+              - intel,avcrp-bmc
+              - intel,jncrp-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-- 
2.43.0


