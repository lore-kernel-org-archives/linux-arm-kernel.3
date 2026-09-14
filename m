Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6FDC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbwBXKd7q2gYTAYPb0bXWljjvKM8Z9E6k5toT6ug0rM=; b=Vw4axiAC82glP2/yIww97yKTaV
	d+h0cHNf+J0xHoASyQ2qEUbjPXTO6m8rw/ohhzpTzMxNhhVxDanILgxMnEs2fz2VNkBllNyYO9BPQ
	Kx3cCNmgJkkM34peFvxakmPqOC9cU6OYRQY3/qejtVoZxRHSYteKanSNwmedvd6zxBsrlwRrL8bin
	eSxq7IoIFJj9kqDiJzMze7o0UBtv2tVAutC/IbNz/nXZXGw5bkM+K45NCeBYLHhzGHnaZI82Dq82s
	B50ucde2ZVT4CiOBF2s2Xz+KSRwiuhgYqs/zBaWftAXYi17I00UJi6IlYpCOkBLOAHujMQcZB6LZu
	dngKwwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65H9-00000003OfO-0r1a;
	Mon, 14 Sep 2026 11:55:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Gw-00000003OZK-0FD3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:54:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD2954362A;
	Mon, 14 Sep 2026 11:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0021F1F000FF;
	Mon, 14 Sep 2026 11:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386893;
	bh=ZbwBXKd7q2gYTAYPb0bXWljjvKM8Z9E6k5toT6ug0rM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QdMFCqvUeUK8rp7qqMVtAarZF8vL7kyXYGBW/J9+H2dEUKqgNosKklLW6nZvbxUuV
	 8etSXBCQV/nYBRnhE8ndRy9nuSHvwDzM7gZPcNytNDIQutPWgTvmTQG+E411ACAxHA
	 CBxjrfA3iifT3Gw19maA+puR6yG5MJ+hD1OGjQJdcRVAEhzkf9VFjLiyaHIH1W6LLs
	 JcvTyKrL0MfG95pSqbmlsFHJx76kt09WwFOJmt9kMT3m0Wbk/5U0ESLvwEKd562Hbc
	 Vm9w4fmI1A0QXbo+veEBV9yOkNwLa8+RKDlNdTySHvlM7bRnm34FiRic88Mgstk4jK
	 D6DfStow42LDA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:32 +0200
Subject: [PATCH v2 04/20] dt-bindings: mfd: db8500-prcmu: Relax EPOD
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-4-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Allow the VAPE and VSMPS2 compatibility regulators to carry power-domains.

Stop requiring the EPOD regulator child nodes that are being replaced
by generic power domains.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../bindings/mfd/stericsson,db8500-prcmu.yaml      | 24 ++++++----------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/stericsson,db8500-prcmu.yaml b/Documentation/devicetree/bindings/mfd/stericsson,db8500-prcmu.yaml
index 4edd4a3bab88..ca798c3fe7c8 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,db8500-prcmu.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,db8500-prcmu.yaml
@@ -72,6 +72,9 @@ properties:
           main voltage domain for the chip.
         type: object
         $ref: /schemas/regulator/regulator.yaml#
+        properties:
+          power-domains:
+            maxItems: 1
         unevaluatedProperties: false
 
       db8500_varm:
@@ -104,6 +107,9 @@ properties:
           for 1.8V I/O. SMPS means System Management Power Source.
         type: object
         $ref: /schemas/regulator/regulator.yaml#
+        properties:
+          power-domains:
+            maxItems: 1
         unevaluatedProperties: false
 
       db8500_vsmps3:
@@ -208,25 +214,7 @@ properties:
     required:
       - compatible
       - db8500_vape
-      - db8500_varm
-      - db8500_vmodem
-      - db8500_vpll
-      - db8500_vsmps1
       - db8500_vsmps2
-      - db8500_vsmps3
-      - db8500_vrf1
-      - db8500_sva_mmdsp
-      - db8500_sva_mmdsp_ret
-      - db8500_sva_pipe
-      - db8500_sia_mmdsp
-      - db8500_sia_mmdsp_ret
-      - db8500_sia_pipe
-      - db8500_sga
-      - db8500_b2r2_mcde
-      - db8500_esram12
-      - db8500_esram12_ret
-      - db8500_esram34
-      - db8500_esram34_ret
 
     additionalProperties: false
 

-- 
2.55.0


