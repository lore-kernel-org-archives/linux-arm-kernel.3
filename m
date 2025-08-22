Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC40CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xwng4tLCmXcfutoUgEnbXk+sPZQAQDCb+EfzGCxzZ1M=; b=OvMoNkZkzLBCFjO7MFBPSx75wv
	XctWwhE0S/Mdw6y1/dLDwoTnz6O1w5QQ0tb5LX1c2FsfMMSZvorFq/yN03Tz0vvZNt7T772N60yH1
	Ybx/pwixtxnM09T0LdMJzYzq+uiflURTUrgbuApY3T3Dnravdz2sjCx/KrMFL1gua4Dto/Ou7EcAB
	kHvI3Yhrd1dIMBb6kcKLX9guQTpKTmYSHmSmoGXfEZMXEVpaQwHRW+D2wC2OklRT8LYdN5Bbvl0Gs
	1CbzCSGebtGh9UwA2NExs5+dW2VHe1p2EuLM+ClMwqOlSVXSKrMLklQSRtOs0amMRlwUdRZfrD97Z
	cpOFDcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploR-00000004ey3-1yBm;
	Sat, 23 Aug 2025 10:49:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuT-00000002rDw-1eph
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 14:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xwng4tLCmXcfutoUgEnbXk+sPZQAQDCb+EfzGCxzZ1M=; b=oz0ReMb5apVRKAsZIqxHJZNPyI
	VMY8FjXpc4CbeVIsQMQN36PcU0FWNNPl/j6vQ/PYQk731IvBwbZEPm+WDH0SRQbHCK+B+2qe/9KkL
	kALoz/vV8QbiOnqIx2IXF60ogxVEEa3tEBGI8JTknsNTmh4kYkNr7Wx5RsFbqhFEP3oPCGRnkJ77Z
	sCnDvrDBo5UB8AuYIdqBl1zSr4KFn1vF/6PIleJyHT+8gbw5elAuo+uGf1B+q2MSxCGx7yQ1wuHNd
	/z9wSnF9hvDaogBRT7wT+xINePUjwYLjt6fj7HEJPlu9o/7r7kbkRlwKEB3KYLhN6V7ghl2L7bpYd
	Cx++rQRw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuQ-00000000x8m-1goG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:38:28 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCNlUw018576;
	Fri, 22 Aug 2025 16:38:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Xwng4tLCmXcfutoUgEnbXk+sPZQAQDCb+EfzGCxzZ1M=; b=NBX7P9w77+qHcvpt
	jA1Rh3kmQHeoCbUFdNElDR5gamQQPpP1JlBIA/AiQcd/dtjjTsZR8pwGCCpNkC7i
	4Z+6OwRjuZb2FmmdXbFIyONRbsiDyFv8R8oA6BryxIpT5vi3quE8gUsOqgUtgXHZ
	DulNlJwuQRu6V+sICTuGzUi/+kYVB6e+34cuWIUNsSp0EoPnVATTyAaoybe9BLhU
	ZrDJqwiI60Q0sPJmifttyCplZ3hlfSTtK5VxYTUKf3zmC9Rwhm03RIsBVySK67BP
	XYptmVIGkyyY1xOMvK/vypvFYiojD6/2IYr9UYrbkmFPEgBKVINCbnVsj7AkCbBv
	aR0Srg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n7hp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 16:38:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B25FD40049;
	Fri, 22 Aug 2025 16:36:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3A98726CAC;
	Fri, 22 Aug 2025 16:35:50 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:50 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 22 Aug 2025 16:34:12 +0200
Subject: [PATCH v5 03/13] dt-bindings: display: st: add new compatible to
 LVDS device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-drm-misc-next-v5-3-9c825e28f733@foss.st.com>
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
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_153826_624282_7FC03582 
X-CRM114-Status: UNSURE (   9.59  )
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
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
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


