Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D7CFED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9hnG+Q/MrYGKRftwGvdBxXRGFmAraFgEeSCELv07SY=; b=P8TtUXjyuXFUMGR+DK07UUiQfE
	+0X0J2flotUEdScvWngporwADuRtcKoF1ITnKhDfJRibAZOd4/HfXa7Q87ha7tKN9ijI/8xItphT2
	eHNYt15H6fGvlEK8rsmZd+vThYAtL99kMGhddM8MjhvtdcVwWJy3Bbrce2yKz0K2BxPnbHTUBRWov
	dcjHyFGB3o8As2DGYONATx2DRkoWas8x/b7ilqTCpeyLG4FEmRZy4d+MpAjSePH2OV9XrIbHGqcYr
	5CjaSssTP36/S51oWgarJGxooCZ5QM1b5Q861KnOI4JLWWGMeiKWURXEOWxuT1g3/8+e8Q9NwrpNr
	Ia2SMDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGM5s-0000000DhCd-1iZl;
	Fri, 24 Apr 2026 19:21:40 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGM5q-0000000DhAP-1MZT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 19:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777058498; x=1808594498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CDfuH2SmmN+K4WcmOTWBN1VqRl4QabbTNxYayYalR8c=;
  b=PsSCmXltqccWUYMCjnTc2dKX5Czb/md8CP01gkAgQMHNEg9ixghNtncJ
   GY7OQSZOMjey/ZrFAO8W85Xyn6Y7JN8Zj7jA2q97vpuAjMZ+SxI+UrZ5f
   OGga1Vyvkk4uZ7NkIQVwOyDVDCluvWjTEHw4pznHV4qjKHdHys/5nEeCR
   N/RG0Lnz6AQCOn8uOwi5IRr6tpYlxKl8gDcDvq4XyA/lq8n2W5IiQt/B2
   ZwfPxhtIrEYJLSR6FIdBf4f46j+eLLlqSCxFTU1NBAiDAAbTVXA5H//NZ
   6rACQhgMAnoLfPl2ubLmZqkcXX9vp07bPeBcWllNTooubTY3dKCQYi6De
   w==;
X-CSE-ConnectionGUID: OBbl4oRTRCqghkDbr4UYrw==
X-CSE-MsgGUID: ce/mz59NT1yADXX9n7+2wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77208282"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="77208282"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:38 -0700
X-CSE-ConnectionGUID: maz5UlhaQjSklYtwVIvBww==
X-CSE-MsgGUID: 8ypUnF/8QDiCDFus7CbLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="232040496"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:35 -0700
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
Subject: [PATCH v4 2/3] dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
Date: Fri, 24 Apr 2026 22:21:00 +0200
Message-ID: <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777058942.git.dawid.glazik@linux.intel.com>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_122138_376521_CB5C7FF5 
X-CRM114-Status: UNSURE (   7.58  )
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

Add aspeed,ast2600-i3c-global to the syscon binding compatible
lists to document the AST2600 I3C global register syscon node.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..50c07038122f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -49,6 +49,7 @@ select:
           - apm,xgene-mcb
           - apm,xgene-rb
           - apm,xgene-scu
+          - aspeed,ast2600-i3c-global
           - atmel,sama5d2-sfrbu
           - atmel,sama5d3-nfc-io
           - atmel,sama5d3-sfrbu
@@ -161,6 +162,7 @@ properties:
               - apm,xgene-mcb
               - apm,xgene-rb
               - apm,xgene-scu
+              - aspeed,ast2600-i3c-global
               - atmel,sama5d2-sfrbu
               - atmel,sama5d3-nfc-io
               - atmel,sama5d3-sfrbu
-- 
2.43.0


