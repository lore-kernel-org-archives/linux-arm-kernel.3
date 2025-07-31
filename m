Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7229C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98SHBebru6MCJ/QnRQtH2DcDv15Ssbf4Sj22mQlx6D8=; b=s80Sr6oYEKXi9mRnMq9BKBL9NM
	i+scelbdgyYkxWaRZw52D6rpgjRxJyjTgEL0NBJBKsnhnSwF10zRofaiKPhB1KZt5ZPUS7PXsh0GG
	OH+jEuQOQqX3LNlT9i5ANVMvCj53Uf1Mx3/gXpKFqElgDWOZIzVm/XxJ+nGqfJQkbhH6mBy7njtja
	2fdG+knY+sFKP1X0ZW+6xAnlRoefbaJanqXDvC3xio703MJPIOIYSEQIf/OjkHzTJiJOFe+x6PY+d
	54ULK0iDWteO6Ar8uCrw4WlVHUuUiZlZk1XEnqRHmPpsVbyVoA9AHQfk3SziCLmA2toKOvht9FBdh
	7oTkKiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhMLe-00000002xi9-3rbD;
	Thu, 31 Jul 2025 06:01:02 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhMJ9-00000002xKx-3ylJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 05:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753941508; x=1785477508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=98SHBebru6MCJ/QnRQtH2DcDv15Ssbf4Sj22mQlx6D8=;
  b=Mxgi4aXKE6i1kQvTfqQhrWxz7W+Rv3a760ucZxxTaZnznvhfdfGQC41H
   6DjIwqPZScWfVdL4Vlk4rDP4PGKf8Y0vDjJPNbcKNBqdgrPpSAGZ8Lgah
   Vh4nlSMOgvppFUJoVZULQJ2BeQHxcKt9ZxVc0HUQUGMMqJF0tsVSzi6ep
   r5UhtlSpBa5JGQWuAZGqlyin4ENHxilynvDWJHkKTINb1z/ViHvKAIYmC
   QH8PddgFAbvAonY4tT4HJcodASNBu3VB6cfWtrARklXuKQrcM5x5UKyRa
   TG3Hv2mdK/U4WbeQ/wvE8MjHF4NS9QAqRtDuXwriocFbUP+xJ8V4NIYm0
   A==;
X-CSE-ConnectionGUID: 42qa7/ZfSFKqzF0ESfeQZw==
X-CSE-MsgGUID: Yx8XBTCYSbecOEUDS8gpeg==
X-IronPort-AV: E=Sophos;i="6.16,353,1744063200"; 
   d="scan'208";a="45509996"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jul 2025 07:58:23 +0200
X-CheckPoint: {688B05FF-6-FE216C80-D1ADDD01}
X-MAIL-CPID: 343950EB2E7D3053FAAC216CA983035A_4
X-Control-Analysis: str=0001.0A00210A.688B05FA.005F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66CD616B0A1;
	Thu, 31 Jul 2025 07:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753941498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=98SHBebru6MCJ/QnRQtH2DcDv15Ssbf4Sj22mQlx6D8=;
	b=fYaC+P1xLljM/NdSckBIk110Nhmd1J/Ou3zJkfO2E39fvTHYbPAkTpDurN7pZ5dqN1zv7t
	32gjV002+v6EELCUgr6ThmxHXKVlNMeilROyXBWFtHOrK0mIg6HCLG64oHpx+lPUv3ZyOL
	oicN55gMPoRsRRX1unSIYzfpsGYiaSf0SjHtbNCOw0DDPPsMmIgElei9iCHwFM6qnOwg90
	GUNkwpWN+9KFonU63w42lG+IXMI72z4E4qP/behfKf2Z+uiAUe2y/iFVZVGqM9bgEErckL
	ahkJBbhgEpYYOzgGirYRBYo6Scj5gXbNPfS2Omwhybral1ccJDG2LLXM/Cdz4w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: fsl: fsl,rcpm: Add #power-domain-cells
Date: Thu, 31 Jul 2025 07:58:04 +0200
Message-ID: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_225828_474952_1F5E2973 
X-CRM114-Status: UNSURE (   9.47  )
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

dtbs_check for ls1021.dtsi warns about unsupported property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

But if removed the check warns about missing property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property

Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
for power-controller node") explicitly added that property, add it
to the expected property list as well.

Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---

Changes in v2:
* Add the property instead of referencinf power-domain.yaml
* Adjust commit message
* v1: https://lore.kernel.org/all/20250725055835.260930-1-alexander.stein@ew.tq-group.com/

 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
index 03d71ab930d79..2aa8e8a2643ba 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -49,6 +49,8 @@ properties:
   reg:
     maxItems: 1
 
+  "#power-domain-cells": true
+
   "#fsl,rcpm-wakeup-cells":
     description: |
       The number of IPPDEXPCR register cells in the
-- 
2.43.0


