Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965C8CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VFU9Ls0RBEdLvBJfd8qPbFuQCB6ojs0BpLanUuJxB8=; b=aoh5ANoqgCoPaEC9f6ODnec2fL
	p5el94iZs6CqO9UNY7XxZ7xmpCxXjRJfzOzkG0hbX8amNYzqSpNMBK2il4hRQ6OjhwqO2C77tw9Oc
	NPdFp1XAW8LjoZn3jk9X6xd6or5ZyaF93ysc51thBneMM2RJSu2RkThwq2uh3pl2k/32HOK9G2fj2
	5FVAhbrDiF2zkxaEHjhaWR01ZM5j5/s8J6XgajQ+5JyYkAkBox5EutL66GBXk6wryANXo1nu6MxBK
	MO9s/n6capB9af4MBp7vjzGXpY1Zgl005SQ/FpFMF0ze0SoiIIgFrD1GKYMeKUp0ekqvLBFJ7CGqO
	ivN3tAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsOY-0000000BVGz-1APJ;
	Tue, 12 Aug 2025 17:02:42 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpPC-0000000AyVX-3WCR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 13:51:15 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDerQ7007652;
	Tue, 12 Aug 2025 15:50:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	2VFU9Ls0RBEdLvBJfd8qPbFuQCB6ojs0BpLanUuJxB8=; b=ovvKccAUp/J/wlm/
	K9rcrxnnja/YavEwQ3kI0qGV7JAOhAkOq44MGW6EfHXjndgcmwLdznuyf326QMVc
	PPi/vc0Kv9fmgMiSpQaPVknjdC2qeZhDjppbfHkhaZPU8WySzMxsVsY8utUM2NKh
	qC7578HpQNsGXFP65d2CUsl10eHWT9NekF9yO55IBhrZ4eU5QH/YTt43iaLsUTV3
	hHI+y8rW247ZULLgtsEwIKwf67zn2k7m0LFa8kSn1EdCT/4Gf9xfVyWCW7jTbUd5
	oegd8nGfOrnXNc/aEf0RZDJ26s7leHe9QBSqbzcDtY0huYe8HtsgINWeUUmb5hvB
	G0+caw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48duf8tmfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 15:50:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EC7D840071;
	Tue, 12 Aug 2025 15:49:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A66078BFD2;
	Tue, 12 Aug 2025 15:49:02 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:49:02 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 12 Aug 2025 15:49:01 +0200
Subject: [PATCH v2 04/13] dt-bindings: display: st,stm32mp25-lvds: add
 access-controllers property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-drm-misc-next-v2-4-132fd84463d7@foss.st.com>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
In-Reply-To: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
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
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_065111_475491_884E2C39 
X-CRM114-Status: GOOD (  10.97  )
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

access-controllers is an optional property that allows a peripheral to
refer to one or more domain access controller(s).

This property is added when the peripheral is under the STM32 firewall
controller.  It allows an accurate representation of the hardware, where
the peripheral is connected to a firewall bus.  The firewall can then
check the peripheral accesses before allowing its device to probe.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
index b777c55626e4b322d77ef411ad9e4a3afb6c9131..96fa0cb5cb86c41d978c4093448afa3bb2a946fa 100644
--- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
@@ -60,6 +60,9 @@ properties:
   resets:
     maxItems: 1
 
+  access-controllers:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.25.1


