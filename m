Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B654CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETjEyiQIzV8l8z/NOU1666fyoIdwAvB3vsRj7Uz12Ko=; b=KGIltTXV8eDqFv7tiB2qxb1WC1
	Rk4wMrEcas27+T05TwtoO17STRUpp1flZmEqpEYkLbuPtNFIfKgYnxq/kBg9DNrPS646RTci+HJod
	eKYdylCyJ73iBQAyWxPBNR3H3oX1weA3+cU2j0GASa6oHgqaDJNRJ8CNBktrifeFWZYf8jqHg9rom
	2uRNfjiABml0xxyh7LxAgsg27+NQMM3aTIxPv5NdOlIL/+CIYHk5AReCbyzJAb7Uqt4tHfEYvCF0L
	7qRDEJOamw0YYnE1qBzm5wsDhuaY8Q4p8ck4gvNfj8zvHCcT02Yqff0WL1KXjU4d8NAqfxChaBQXP
	69QXwhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrB-000000046DQ-0C95;
	Sat, 23 Aug 2025 06:36:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuI-00000002rBY-42rY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 14:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ETjEyiQIzV8l8z/NOU1666fyoIdwAvB3vsRj7Uz12Ko=; b=XXd8x9NL1rhrTrW7ATBl0IVLo1
	5an3WOE652YVzRp5z5URbwDOTXv1ONvxHQpaPOdfZrsyjktF0QAWT0T1RS/kXUBJ4ZPTXoLGvOXIm
	jZFp7XHZCkx+mthWRP5BYfedrKwPvw0Sanz92yHDkPpoq8FA+yNU68WMHBwluZwPxeLW18KtHMyei
	xyRsXn2JqFAP+s8WhLTr8sABmFKHHMjZM2ihIHnqJcyHX/elAwa05SuT7eTwQKz4JANYYL4I+R+P6
	Sw4bfDzR4V9/GpyW8pI2KfmjrRm2ybGXwUv/3CDJwC7o3n9pmt6swedLclLkrO8+cc+QR1d15TGcc
	OYNIDtBA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuE-00000000x5W-3cDQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:38:17 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MD4wcs018818;
	Fri, 22 Aug 2025 16:38:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ETjEyiQIzV8l8z/NOU1666fyoIdwAvB3vsRj7Uz12Ko=; b=FzW+C9XYQWsK4vfR
	zS1rANwHGFxFpOvRrobOEMuGWY4r+weZXGRGKUj1zo0A2UWXBwBiUSG+yKQYEskA
	ntE1U1B3fUbxpO5uX+lTawlqXtdM/hz7gmDobt6WiPIdSrm9nndHYG8nOHnz3YQY
	VcC2Gp9zEMMxZNJSNQZO0Gn+Fu4tNOCuqOYZglxLTzd1Tk30ylH1DoTsX69qQBrA
	Kf0mA+vYOZnQuQG3sMz59T0zCkXUPaH/occVZ4Xt2lJnUBOuPRG91x1BPMPICcSb
	1AiK+1nTUKl035O7Vuwn0Aw1simN2Bn1AKJT6QXOA9+wEZSiLsJcUDCHrIBiyi9F
	x0nAZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n754kfxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 16:38:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9F0AE40045;
	Fri, 22 Aug 2025 16:36:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97A76726F0D;
	Fri, 22 Aug 2025 16:35:51 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:51 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 22 Aug 2025 16:34:13 +0200
Subject: [PATCH v5 04/13] dt-bindings: display: st,stm32mp25-lvds: add
 access-controllers property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-drm-misc-next-v5-4-9c825e28f733@foss.st.com>
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
X-CRM114-CacheID: sfid-20250822_153815_020713_96839E0A 
X-CRM114-Status: GOOD (  10.27  )
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
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
index 74e61d95370c299130410cdaae833514324c3e8f..05a73bbc246a8994b6aabf7c2cd9dca773232be4 100644
--- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
@@ -59,6 +59,9 @@ properties:
   resets:
     maxItems: 1
 
+  access-controllers:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.25.1


