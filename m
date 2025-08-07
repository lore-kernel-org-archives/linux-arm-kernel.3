Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB0C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWJZVh45JxWEpjMzzyOEhDUy8kia50rucaLKoGuxy+8=; b=JEBdfVTuvlrvHelVXwI/ARkmcs
	6ppNtAdmEsv2q8tvtXl8iR97oqV/ZUePuZiv4BTnSJXQHOgYnyKF7+YqqZwe6YKzD1Hye/tJ8e5BN
	ZHqa4NV26dnNT67LOSho42MA9GEM+2lnASw7NkPE3xGYYcEU/jTrgChtQnAGtsQHyIK0xjCO2MRAC
	GDD633BhvvRQ+BWyhkO9H1iEpctBMxMLbB8mX5O1CmXYGmYzFWj81PPUFbEKOKKP31TO6tvQsiHHO
	WpuvMBYoT+WpFnIgGM1wltboakDkfiYwO8mxsctx75BtcaOCFWx2q5l1D5O8Mb/eYdNTiwXfwWr+K
	j7/SUZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0id-00000000hve-3Air;
	Thu, 07 Aug 2025 13:31:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0g7-00000000hcl-3y3I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 13:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC0275C5E69;
	Thu,  7 Aug 2025 13:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BCCC4CEEB;
	Thu,  7 Aug 2025 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754573346;
	bh=1VQ4CEYYvmVtvSuzcssa91RQvPgNCUSDeA69SoGr7Ds=;
	h=From:To:Cc:Subject:Date:From;
	b=Wl8h/3jSD4YRguyd//yDPsjdV6kNSuDDUKJ5SfvtAJWCBJhkiE4QSNjMLu0MnWC1y
	 vMv4m852bgEVvnxbYtV2fLcZwEZB1pardhns//wJcH6XgzgCo/Ii0aVcQmQXpYnFzM
	 vQxVaZU3fbt/hY1p8+lm4KYYBgvcuL1SJkF2ohQhH7tcMYP90pnv/Hv3EyWIXILp+i
	 NgzbkISs+NzJ75baFVEHXjRzeDJVQtrQjzP4OpMG9NrWq6fCxDMjoFTRE/wKwEUfjQ
	 hbH2B8klSdMxyBsIx5oQ4p5f1th1cbJqjs7bykynKcBt2Op9EOzcfhyAjm14Q7DwvN
	 jq9+oS/MStvEA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Corey Minyard <corey@minyard.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: Add missing "clocks" property
Date: Thu,  7 Aug 2025 08:28:51 -0500
Message-ID: <20250807132852.3291305-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_062908_019819_FA0CC50D 
X-CRM114-Status: UNSURE (   9.76  )
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

The ASpeed kcs-bmc nodes have a "clocks" property which isn't
documented. It looks like all the LPC child devices have the same clock
source and some of the drivers manage their clock. Perhaps it is the
parent device that should have the clock, but it's too late for that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
index 129e32c4c774..610c79863208 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -40,6 +40,9 @@ properties:
       - description: ODR register
       - description: STR register
 
+  clocks:
+    maxItems: 1
+
   aspeed,lpc-io-reg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 1
-- 
2.47.2


