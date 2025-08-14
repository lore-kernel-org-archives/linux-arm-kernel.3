Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E2DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Q6xL5MXF7dySLAHHNSA7pzJYEiFd4BuYsrkiuqK8P0=; b=i831DqpZld8k0HjmFPcDyzp8Qv
	+cJeA8NMdoIwi4hKTvA1dSwospi4AQpjrj4IdedpV2u9APYNkjFnzl27YbGzbR6sKqeNQ4GzFSFvM
	QOXzx1LdeuW+CXzTc2aToKo6Ji/+fQGxKNGPe7Hq2xTB5rUGiNydKwEmPupZccfq1qxBRCzurMBiW
	ueHdwWwBS0ISO5xbcNMi5SZOTrYTlTCxplYVyMoQRjqAzExtseILfWassTvisRyv6IxCy+6Rk2hrU
	fho92Iwsszawzqb5BXhSoGFrn+tGDuCmFaVRfsi6AHxPetqqJqk1GI9ov3ubHfXJvlt19MlZqDqQY
	TVvTJ4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYtX-0000000HFZQ-2qDg;
	Thu, 14 Aug 2025 14:25:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYIR-0000000H65x-2Hjd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 13:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3Q6xL5MXF7dySLAHHNSA7pzJYEiFd4BuYsrkiuqK8P0=; b=R4FfrVMVy06g4u3CWpbuqJ+Yki
	wJ+LtO/XANeb6U4hSM4lwh7DrDkUyuU3o8RcKK/52tlgm08CFQ0rlguJYJY5NF54olnZ+YD4mvtEr
	io6CUJiHKwZy/hXh/2TuMS8Saog/gkwwg6I2hLglY3cnAb+k6h4mXrOPO5j/NGPAZBIlUnUfKGgih
	EIRS1J8DxAvygMaPkaD5aft7tygVfaK196CwjeDtDFqB+psSVpJcyykpVXcauo7wOPcecQWexTgig
	lgUfXujk4bsqdOVOB5PeN2jx7ULMJ+WR4snBMw2KnUNp0awjxj4sxbiZyB+CkFuGPhRTxbgqMpgW8
	8Zv1gUPQ==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYIL-0000000GPqx-3EA6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:47:10 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EDkvrt2391527;
	Thu, 14 Aug 2025 08:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755179217;
	bh=3Q6xL5MXF7dySLAHHNSA7pzJYEiFd4BuYsrkiuqK8P0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=THNUIrIDp+MfNJsa56kFU74lXmc43IMWdObgOo51y7ekyiINNtP3vZT3zTXYa85b6
	 D6pE/hW5wXFUsc/m+Y5BzEBZ9CbAuW+yq5j3z+A3dRUFVB6f2BGasqgO1VOH8zdI6u
	 3WuC3soztLM5W/2L0X61yNq3gfdIbKJCJiCpmzEo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EDkvHH1187766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 08:46:57 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 08:46:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 08:46:57 -0500
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EDktiH3995940;
	Thu, 14 Aug 2025 08:46:56 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: Anshul Dalal <anshuld@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/4] dt-bindings: arm: ti: Add binding for AM625 SiP
Date: Thu, 14 Aug 2025 19:15:28 +0530
Message-ID: <20250814134531.2743874-3-anshuld@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814134531.2743874-1-anshuld@ti.com>
References: <20250814134531.2743874-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_144706_069802_C13CD9A2 
X-CRM114-Status: UNSURE (   8.36  )
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

The AM6254atl SiP belongs to the K3 Multicore SoC architecture platform,
providing AM625 SoC with 512MiB of integrated DDR in the package.

For further information about the package check:
https://www.ti.com/lit/ds/symlink/am625sip.pdf

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa438..f98817e97d4c 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -58,6 +58,13 @@ properties:
               - ti,am62-lp-sk
           - const: ti,am625
 
+      - description: K3 AM6254atl SiP
+        items:
+          - enum:
+              - ti,am6254atl-sk
+          - const: ti,am6254atl
+          - const: ti,am625
+
       - description: K3 AM62x SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
2.50.1


