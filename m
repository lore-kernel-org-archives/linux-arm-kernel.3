Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AA1C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 03:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czsV1XmnEkzLgfR3k2U1B+o7cQbHMg5oL+Q48pBs/VM=; b=1YVbG+Au0eBDImeEFeytRnV2Um
	5/19lq6Kj3hBCE6mCDVVBcxdpC57G5cP1utI4cgd276va1+QVKgERzz661Mi9TB5huAFWk3nyqWi6
	L9h/ybqupnez25PjZQEXdhmBbaZuY/fvC0bE2U1pOShuJ1eMotBvr8vAGyuV8UvOhScsynj2UJewY
	v6ogGupfN0ZDXBQ+7maYYHb926cQu8ajMKL3xkKaj7vPBWYO0nve2DlZGb7SntjLH2BUtX9KAiJRx
	/Q56Mx9Kd1Sv/PjspbGTvnNYDY0G1L/NdDBmMvynDwAA2xWyBdR8TbPdp7CoYzsOJ/dP3/p3qQJdi
	G7/U6dkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDKP-0000000BqJx-3pyC;
	Mon, 26 Jan 2026 03:31:49 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDKL-0000000BqJ6-36Ke
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 03:31:48 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 60Q3UXk7017409;
	Mon, 26 Jan 2026 11:30:33 +0800 (+08)
	(envelope-from baisheng.gao@unisoc.com)
Received: from SHDLP.spreadtrum.com (zeshmbx08.spreadtrum.com [10.29.3.106])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dzv6K0TC9z2MC1Xh;
	Mon, 26 Jan 2026 11:24:41 +0800 (CST)
Received: from BJ15137PCW.spreadtrum.com (10.0.73.52) by
 zeshmbx08.spreadtrum.com (10.29.3.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Mon, 26 Jan 2026 11:30:31 +0800
From: Baisheng Gao <baisheng.gao@unisoc.com>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <cixi.geng@linux.dev>, <hao_hao.wang@unisoc.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings/perf: Drop irqs for clock domains without a PMU instance
Date: Mon, 26 Jan 2026 11:30:29 +0800
Message-ID: <20260126033029.7923-3-baisheng.gao@unisoc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126033029.7923-1-baisheng.gao@unisoc.com>
References: <20260126033029.7923-1-baisheng.gao@unisoc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.52]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 zeshmbx08.spreadtrum.com (10.29.3.106)
X-MAIL: SHSQR01.spreadtrum.com 60Q3UXk7017409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1769398253;
	bh=czsV1XmnEkzLgfR3k2U1B+o7cQbHMg5oL+Q48pBs/VM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fdAYSVhv4IfLebcYVSHtcTLZyK4eKSt350dQhL/nJTRow6txiW1XgP15hQ3uwYuDV
	 QvQg5pCVhaZFc8qGoziaPUbq5dBtGtVjxjQmedvgGRlgmaPSEeHqxzLG3Igr825XWE
	 6kZg89ctfDFZx2Bbn5q7INyyHsW3pwb7M5BbE9MJ76aEi/qwz+yxXfva47t9Lgx9pI
	 vz115Q5afkO0XXhoxzJcRsGiw8YqgMHCjt4kkY770cmRWuBMEIelklaHVyIJID7tWM
	 fvBb7wzsY8g2ZnjHCrEmrN/yMI19R8XHte05l3Jmo49WSWFgnolp0uTt9seD/d+vCh
	 eeqSWeSB2on4g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_193146_503866_1D4E24F9 
X-CRM114-Status: UNSURE (   9.43  )
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

No need to specify the interrupts for the clock domains without a
PMU instance.

Signed-off-by: Baisheng Gao <baisheng.gao@unisoc.com>
---
 Documentation/devicetree/bindings/perf/arm,ni.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/perf/arm,ni.yaml b/Documentation/devicetree/bindings/perf/arm,ni.yaml
index d66fffa256d5..40a5b8929ef2 100644
--- a/Documentation/devicetree/bindings/perf/arm,ni.yaml
+++ b/Documentation/devicetree/bindings/perf/arm,ni.yaml
@@ -20,7 +20,8 @@ properties:
   interrupts:
     minItems: 1
     maxItems: 32
-    description: Overflow interrupts, one per clock domain, in order of domain ID
+    description: Overflow interrupts, one per clock domain which has a PMU
+      instance, in order of domain ID.
 
 required:
   - compatible
-- 
2.34.1


