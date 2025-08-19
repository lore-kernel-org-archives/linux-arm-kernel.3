Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F57ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2T7BIysSM4Y8vk6YV25Wl1L4tMEC9reFcGRGZZ14rU=; b=MMci8f1lojgix2uxMvyAqsjCBX
	4Iz3lOgnXyKFmbRLwJ5X20ZOS2JGZEbmTW55SbvLaTVWlb4BloL78K6ynhXshCSdRjdR13dyc7soV
	eqrdYLc3f4RF+hiU2piqzesWxoTDCf6UlG9DCelw0yWsYkCLKnCs3ghf20ipA5esmEWgiiDKxAY2M
	xjXH858UEDOOt1H4XI10oCMMP5Ln8XZhmNICjMn5CP7NeOz8JQyXmgHbnTNeezuftfgo7xcm5ZXOQ
	Vn+uybE8Jg/NI/6U3idp6CKTB7fBBQ+NCEUkdiY3fR+8qw3b7+dARLv5rgwACZYm1hXywXf798e8T
	bPG9cOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJpx-0000000AAcz-3nLI;
	Tue, 19 Aug 2025 10:45:05 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIUK-00000009vfk-2JT1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:18:42 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J7ihf7008307;
	Tue, 19 Aug 2025 11:18:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	P2T7BIysSM4Y8vk6YV25Wl1L4tMEC9reFcGRGZZ14rU=; b=Ku7UFQcOyegw4r3b
	v1NNhFacy6WPrCpfNmMjD/fi5Fc4FcO1s64oHAF0e+o0zmKPigRZ4b8W2e62lSup
	siOCyJw+5eDP86u2dkYNCnBjrSoJOcufLTkLJ+i6krdgDfBemDU0yLCGUlHwm5jj
	kOzLl512H1t8o4sw2bQH9WrFwrUVfjEYk1liVArCItQ8IQtG029yOzAIN2hypYjr
	S/Q3wfqg/7SEf6Xe1dJAFKZylP0g4Lk3H6QmpVw2407FIwkkJVPue8OOqMKf/auG
	ecs+qaxwmEWpjAPaSQLXCPWcnWhJqVKz/Jx0Lbb9OkcOaLWEjMveKNsH9IBc4/yx
	i2B7ag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jf47t0dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 11:18:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 61FEF40054;
	Tue, 19 Aug 2025 11:16:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A78BB717636;
	Tue, 19 Aug 2025 11:15:58 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 11:15:58 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 19 Aug 2025 11:15:56 +0200
Subject: [PATCH v3 03/13] dt-bindings: display: st: add new compatible to
 LVDS device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250819-drm-misc-next-v3-3-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
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
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_021840_859361_69640514 
X-CRM114-Status: UNSURE (   9.78  )
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

Update the compatible to accept both "st,stm32mp255-lvds" and
st,stm32mp25-lvds" respectively.  Default will fall back to
"st,stm32mp25-lvds".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
index 6736f93256b5cebb558cda5250369ec4b1b3033c..74e61d95370c299130410cdaae833514324c3e8f 100644
--- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
@@ -31,7 +31,12 @@ description: |
 
 properties:
   compatible:
-    const: st,stm32mp25-lvds
+    oneOf:
+      - items:
+          - enum:
+              - st,stm32mp255-lvds
+          - const: st,stm32mp25-lvds
+      - const: st,stm32mp25-lvds
 
   "#clock-cells":
     const: 0

-- 
2.25.1


