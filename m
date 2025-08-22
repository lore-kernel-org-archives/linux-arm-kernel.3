Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07751CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjQX70QV7aMacku8VI7h9UTkT8ZkJjhi9sDK0Kq7u90=; b=W/wwvvdmSJGAZsZaqy/e3sWUc3
	1K8EIpX/SShSfgyPPo1C5k8eSGxRNYf8SbLp7eT5HY6sRXV6HTd9h+r1j2289hIDB8xrwIp0RzCEQ
	EA12quFmHvDzX70nNa4Dq1ve7ra9sP11bXq9STAvhiDpnkopmnNwbPuhmfhZNt/nRZRLB5izjPXeG
	qwLGZofAY7+6h91VhXwyFIsZr4awJjX4LRPfiQlDaNSK/oh/xvw15XnKiolZY55rkFJlTOp0pgVNa
	u6cOEpUv9y9cfrQR674Oofe5zJZCNGT5ZvoSAeFaNsEntBOH1vuaegW1cVTXDobGb+/WKrepkiWJk
	H7HdhWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphr6-0000000468R-3czS;
	Sat, 23 Aug 2025 06:36:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuH-00000002rB4-1hYz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 14:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yjQX70QV7aMacku8VI7h9UTkT8ZkJjhi9sDK0Kq7u90=; b=WFwvlInuvlECA/8KKJ0E5je3Io
	HTD+jlP7+3Y8KjXWtinF7FCEgCwEdr2lUCpCH5CQiOoELXhk2IQMWJBF8TZcbo8beNiMPG+IwL4cM
	fkzye0vm+3A3jZvVxnK2CKQispS1NUAaHAzfYDmEMdjEdHGw+cT/dM+PfT29o7Vm/XoRDt+6xBo08
	a14Ve1FBXj5Dr+K1tSYCimc3leBFEYycRVzuf5bQpSOKs/SOfp/FqelsOCf/32OKHqnW71QfgJlLt
	o1dsjwuXQVJNmDmaaxYdljj5OvVG5eQIncp3gKSMoxv8ARt5dPiT28dv9vjrCJ5ircXh/ieqEqt0g
	KAUo5HBA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuE-00000000x5J-2DS7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:38:16 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCrMmf000963;
	Fri, 22 Aug 2025 16:38:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yjQX70QV7aMacku8VI7h9UTkT8ZkJjhi9sDK0Kq7u90=; b=wHQdDEG0GTlX3HJH
	DMgSe7k9QJJJjqmNo8k68EQD/e4lhp493SvJCrUv/6oB4DaXK7RAj2wkmZtxWowC
	EQNAslVI2nDlNGSMmIABSR1gyVLfcnkwmwLTL0OspFSBBdmqz4K2ThFUn/gvJbIK
	hr0ChQscGqGWjLHMZwGReEQii50WGhTRNNIJDEz+3BgMoVUJKo3jwp0uh0rzdJzr
	OdHZnvdCB325Ah7Z/JVHhjRb40Jd9m1ZQiN8Cb2wJzWH2yEDl4zXTW5tAo1tNLrm
	6UrsLNNatNoJL3YaA1CG+kEbKQyKzzROD0GRWkWEV8bbYTjyt1LpGrkamWL8XKZA
	OuhfwQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n7hnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 16:38:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E24B540046;
	Fri, 22 Aug 2025 16:36:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 382BF726F13;
	Fri, 22 Aug 2025 16:35:52 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:51 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 22 Aug 2025 16:34:14 +0200
Subject: [PATCH v5 05/13] dt-bindings: display: st,stm32mp25-lvds: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-drm-misc-next-v5-5-9c825e28f733@foss.st.com>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_153814_688255_DD20443E 
X-CRM114-Status: UNSURE (   8.75  )
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

STM32 LVDS peripheral may be in a power domain.  Allow an optional
single 'power-domains' entry for STM32 LVDS devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
index 05a73bbc246a8994b6aabf7c2cd9dca773232be4..14e042156179cb2f2d906422eaff6840da3c91ea 100644
--- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
@@ -62,6 +62,9 @@ properties:
   access-controllers:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.25.1


