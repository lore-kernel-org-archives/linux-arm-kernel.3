Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30013CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2T7BIysSM4Y8vk6YV25Wl1L4tMEC9reFcGRGZZ14rU=; b=QvVCudLAcVcLl/mqiNxs7lihev
	zSHhHJxKtYHipeH9i0twsoiFXOj3gO7wqiLC0EsijddZFuqOkfWHzKP32WRMmR355oZRPBNeR29Pj
	kVKpTA7zHe2oFZ082yjqxFa6IBIbgqiVcB3lDfB2pvzfhleoIAvD6JQ7WLbXvF47kciJBHQkjucT2
	fxKEecIVRciIvslHCP8ohJFzrMFgSj5Ak8EL0p+QybtTxvnooBdXWydbTv1MRos7qDazSBZ3FZhLs
	D13x3DxyxrrzR+rL8/i/GEyK7KgwGJuv7Hf3tm148I7tTJ7h0/wnAVoTwyH8Eo4b/piM94ve0vvlM
	tIoUk4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Eq-0000000HMCM-2Wyf;
	Thu, 21 Aug 2025 15:30:04 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3De-0000000GiOX-43X9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:12:36 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LAXMTs019049;
	Thu, 21 Aug 2025 13:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	P2T7BIysSM4Y8vk6YV25Wl1L4tMEC9reFcGRGZZ14rU=; b=ZtCEfDe3gH/hsNGj
	/QHKuk8PyCwBTceIsgYilP/lxDH+pxIUaZs8RhbBfapQy9It0tVAyUNJsfbR1jCq
	2ckRkAElhXYF6XlGlxmQkEJAQqWeAa/pYjYnm3IjUbuj+/ijfMDXKZe8QbT38UgG
	ajtJAuzUgN+rlz/XwlxuzMUpyBtSdyN9ysZt3ABHe3vYNNokm4/Nj+kGbt7fFlAZ
	JXFS2BBgZxRUvVjTi6DrLGc2neHXTnl5rA2RBeXSDIGwzRPVuURTKUUmBs+oU0rl
	cQMnoGapBR4yQeW/BrJl2/BeWWPNL+sx4oKxJLGzZp68D2Z1QXDoFP0fqzWWSfWP
	iCVYSA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n754ehjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 13:12:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 15A5C40052;
	Thu, 21 Aug 2025 13:10:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63EF174EF05;
	Thu, 21 Aug 2025 13:09:53 +0200 (CEST)
Received: from localhost (10.252.7.99) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 13:09:53 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 21 Aug 2025 13:08:53 +0200
Subject: [PATCH v4 03/13] dt-bindings: display: st: add new compatible to
 LVDS device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-drm-misc-next-v4-3-7060500f8fd3@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
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
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041235_303163_3ED0BBF9 
X-CRM114-Status: UNSURE (   9.80  )
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


