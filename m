Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11300C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2I+f3goa7Ji4rR8sSSVkVPqFWsAO6xlq0mM+CBWobo=; b=vEmmdKBbiWm1S7ayVVmw+3nbqk
	zrqkMk3UX6IhKCv7FhLhPZhNWEu8Y6NJy0Zmbkut4wf32gavl79SUI66euCTkPHbZxJff4umbZRez
	rautuVJGO1WKwKBrDN3ryWmLRWMp12B042E0nxcZ+RBq8GpJNYhgrIRPgi3HSwdizPjTP8vcWUrFz
	A8jn3zohrRv24Viq3PD5T6ly3/UEPzz7uIUGCIfSthKLXQReqNB+gyfI/YxNTrs571EEVLr26SXro
	gAuuPDEAP/kutktVI5jku7AIJxYsNm4pPSOWEzppm3bWKkKmRC33C6Q1c5u58QSOPWJzLNhcmrj5D
	SjUGn9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAgW-00000004wiS-2iBT;
	Fri, 10 Jul 2026 12:50:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAgT-00000004wgb-0HLg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 12:50:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47640541585so461225f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783687823; x=1784292623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2I+f3goa7Ji4rR8sSSVkVPqFWsAO6xlq0mM+CBWobo=;
        b=lVju62zNg0J1rC3Pu6iZKh0eYaMY3BKZr+/1Xd4dcb1UzYk9ImrdO3JFof8XX/F8ic
         IigGw07+0Vbx7Q7OlPhE9k0e+dtPArEABM1Up5xXS3iltkYekPeZXSGp/bplF2ACDNl4
         QAd0U3j1ufYUE59LjJMh8NccQuZqR+z7H08nPTW6qO2qPiOPloiqdLkqp2QqKf47VNE1
         9lQ7mCofzkcfBn5nwSYShg+GvIpTGLBOVS/9uyr5CCLXCc6vlCpLy1f4gmBB6Tezn/+Y
         ex+gflf6C5iEZT5mQcNmUeB642PmtP999XKbJEkGZ72ZYrmEcIhAcnqxLkcHmfzeMuZV
         9ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687823; x=1784292623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2I+f3goa7Ji4rR8sSSVkVPqFWsAO6xlq0mM+CBWobo=;
        b=QbpfBZMBv5uzIq6HuakbYQX2oWadfIOpNSsqcKFpIargXv9y2zsYt+YCKKuRH1L9gL
         Hwx+RUh88Z1oR/+a+4VQ8Rx9wERlAwugQVucd+NgaQBwIKkK0kBHZPNIcXw5JmDguqzO
         bMK8Wf/lfh0WnGM+geuOEgHcn6lwaE7MH4crdoaX+jeYp18RpKmHBVhqMpIMQpnVqfaS
         7oRg3GvmAdihM8DSHD0rqXpB49D5JK4KitoQBOLC5QNzH6YCHAOlYIio6RRPXRYMAw37
         vPWeOb71yGdUep/MPIQhbjCtF28QR3PFLzS2EUrwRWu1C99FzsbK4LEXx0cqNpZBarPs
         WHpg==
X-Forwarded-Encrypted: i=1; AHgh+RrpRBSlOPpbNt+aO3K/c7D0jBrx15SedTSmllGnWwYMbD+9QjBfzrE46Rgz8i+DqOYV8O+D0XtGNEbbYlvbkQdn@lists.infradead.org
X-Gm-Message-State: AOJu0YyGNPIMxjksPQk44mp+jzhNEumw48eWPcJu6nED7Dp3V3LIcbQm
	BlAvy1lBltTWEC+XbacwiWajoss6wuh2AOFkg0k1MXD5+q3aRfl3vnkiyXZ/ws50
X-Gm-Gg: AfdE7cl2evz0KjdDk4RGvpx67mUYs+sdoC0eWfyxlrt2HdOpnSHP2/5IQJhTn57BX8k
	xzCFft4dnOP124GWi14FQhJio3m5jQUX9AgKdDYmQXFqWOfcCDIMPzBw/Po/TDuIshlL17PNIo9
	xCqETJiUOA0O+QBcAdvyG7EOichTgeyb4TEFQoPuwdocmZX87YpzGZVvNYBNBS2PIBQMjCE7kDV
	6l8BCdqQYynMQ77f0EqNArtgF2MqnKPHOVYRFay29sEU+Ub3AOXEkeeTOAcJehQ3xwtgiJIjs+o
	m+5L7+mDK0HFKdZrj8/7FnJeMOjgDpH3mI8cyA1YCYB85q5Exokc5sn5qpglkHBeTPPNgASJBEM
	LsXBD44k/coLqFKg6lQaRFSKwTHfnzjxRD92KCgQZ5wcIgMOFpbBFGxCKhYVd+nAhhIvkRUH9qo
	hFjWWapA1rG3NyMOu6QTJW/BFmSWVHdUiUqmGc2HLeWlSLlFpD3tpo
X-Received: by 2002:a05:6000:2013:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47df077b2e6mr12376131f8f.47.1783687822970;
        Fri, 10 Jul 2026 05:50:22 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm61218665f8f.26.2026.07.10.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:50:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
Date: Fri, 10 Jul 2026 14:50:15 +0200
Message-ID: <10775b12b801255546c9cdefdb153e421aedf910.1783687321.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783687321.git.stefano.r@variscite.com>
References: <cover.1783687321.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_055025_118184_14EEF6C3 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b9da6e62ab79 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -104,6 +104,12 @@ properties:
           - const: tq,am625-tqma6254
           - const: ti,am625
 
+      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62-symphony
+          - const: variscite,var-som-am62
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
2.47.3


