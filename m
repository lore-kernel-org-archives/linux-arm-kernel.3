Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAC4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q62PPXsE+VSeYwcr9qAvv8yZnUeLKqIqrisYrdVxhtU=; b=s/3ZzdzxIM1ofBCon783GFPHZS
	PEGaJ63LpeYS7YDfA+S4wTVUJ+/csIkWEEj/Tg6cNuQUGJEHnO0H60aWNDb4nhkymkDNYZ5NOq3Y7
	qbAShKANIyKRptn7awsWfLxrcclXr3bNf0ykb8DawuedPhVUZ9Zq5fdSYzqN2V6g2ou5eGIFfUDCx
	Dz0L4NkDdvLTr4ytjI7b0FBSZ5ssLJvwM7PJEtks07wblETu0UHdomGp+31l83qT4wrZ6PYKwGRxy
	/YDqYbc2rfrgATldstxE0+SYEfnl+Uw6Lae+fgSqdILBEV9XMrNHhREZfKhyq6HYT1+CmhF9Fu6Or
	vXvwK7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWsl-00000001V3r-14tj;
	Fri, 06 Dec 2024 11:52:27 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWri-00000001Uwa-30w2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 11:51:24 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e3990bbe22cso1912919276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 03:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cornersoftsolutions.com; s=google; t=1733485881; x=1734090681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q62PPXsE+VSeYwcr9qAvv8yZnUeLKqIqrisYrdVxhtU=;
        b=cUxaY6nBJd3hm4SvUMtqpJDy4wNOIZ4kjhy/NW4y5Q8fPWWBQe7JDAu+JfygoqvmLs
         w19h8wK5CFqglc4aiyQEcs8dzyHnkEsgOIh7shiVNp3BpVHTGlmXU1UMmGX5mBIOVgxh
         CKqEsmpuZDEpahjjilIdacYIvUTgdpeaITovwhXE2C+ANENSYV8EMUJ6A2+Oi1y/9FwE
         MQuNT8ZeqoJQD//6+Sq/m6sFXLlCXTBhYzYC15Bk4lipTY6+IYWe5Bjumhj+E35LO1dD
         72vDljUPe3Sdp0Kx7BV2j99tDifi1QDewwh50Zk4SLS3FFm0oUGMAgtdZ1ekQBE5I9lw
         RQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733485881; x=1734090681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q62PPXsE+VSeYwcr9qAvv8yZnUeLKqIqrisYrdVxhtU=;
        b=dfXxeZKbmlUXyILz2KskA3nOtbLiOyrvVFl3QNC0QoYRSbyQ+p/uiIJEm+dkcH8Ae0
         DAowqmpZGkWkZZxu1uKes3yUjzba4J54m7kOSzNLfYAGsEYNUFWFxX+AawH5KPgOCPbq
         UuD1Q7QY1OZZe8f1XNHJ0zDRyIc0rcRJWBeCuOjJQ1Ho/pRjIqLpgW5Q3nOwwbQJPmt4
         7GWdWxXNsAdhXlRS9Zo0EbIVJd0sVxr10VGwZAsON0ufPzWEbyY81Y/Oz0Go0Y8P8Gpf
         e1kJsxE5Ke2yMyuIIDG4nEWpM0iIZ8sGipMqTok8g4j+g25AO3380rqddrj934s00bGz
         FJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyKnyPaVmAiY/O7t0QWoa7TLkI8MuYP7md9uXRcTlnXhUwZ3L/N3DcB6vz9sbyjD7zVGgqR2vJH268sabJVNPr@lists.infradead.org
X-Gm-Message-State: AOJu0YwINNvMdIPoyldAO72/uAIiE8VsngeZx7uI3Yq8SdYROqHPa1Hd
	WWlQwlDL+KhiVtzW4aVqBc7ccXMjL0QkGc+pI0j8QvBO2JkUM6iFGRS6UeZh1no=
X-Gm-Gg: ASbGncuEGmlNvh//EfhEv7si80zdxQFLTIAIXjdYJzoO+KHUEaOGCqpqC7AZ+Ew/xQQ
	eydBm6HEBwDMPLu1vLWQ3wDcGBOWLs8QIbq9MDEcez6Po5l5EJN4K31Mjt/VxP0Gn/+21vJoeHb
	oD6opg9N2uueVulEDDrV+Z8pifzNrgIYBpeEEIgk9VuWZvj5WXic0jtgoUZ/CGIUop49G7cH4/2
	WAnM9BcG0y/vDZpehbk5jLLYIn61sP04Q7U9Z+ealzbAzkOd/Nm6shZpbDfT08uvTh1KJ8PFN6b
	Abn63Jy74h9PyZ0csX8m9eRbJ3k=
X-Google-Smtp-Source: AGHT+IG4eyt1sQPkyNP04ZtSf+u7M13/3ucraXNd9uqXuxzTv7vxnzMKhLqN6poDe47NCkgRh5GBaA==
X-Received: by 2002:a05:6902:2388:b0:e39:787e:d9a with SMTP id 3f1490d57ef6-e3a0b786147mr1906937276.53.1733485881356;
        Fri, 06 Dec 2024 03:51:21 -0800 (PST)
Received: from ken-engineering-laptop.tail1e0d8d.ts.net ([47.196.152.243])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6efee2fc130sm802467b3.4.2024.12.06.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:51:21 -0800 (PST)
From: Ken Sloat <ksloat@cornersoftsolutions.com>
To: 
Cc: Ken Sloat <ksloat@cornersoftsolutions.com>,
	=?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add description for dma-cell values
Date: Fri,  6 Dec 2024 06:50:18 -0500
Message-Id: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_035122_759698_E94B910E 
X-CRM114-Status: GOOD (  11.91  )
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

The dma-cell values for the stm32-dmamux are used to craft the DMA spec
for the actual controller. These values are currently undocumented
leaving the user to reverse engineer the driver in order to determine
their meaning. Add a basic description, while avoiding duplicating
information by pointing the user to the associated DMA docs that
describe the fields in depth.

Signed-off-by: Ken Sloat <ksloat@cornersoftsolutions.com>
---

Changes in v2:
    - Remove redundant comment regarding dma-cells val
    - Reference bindings doc for DMA controller

 .../devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
index f26c914a3a9a..b7bca1a83769 100644
--- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
@@ -15,6 +15,16 @@ allOf:
 properties:
   "#dma-cells":
     const: 3
+    description: |
+      Each cell represents the following:
+      1. The mux input number/line for the request
+      2. Bitfield representing DMA channel configuration that is passed
+         to the real DMA controller
+      3. Bitfield representing device dependent DMA features passed to
+         the real DMA controller
+
+      For bitfield definitions of cells 2 and 3, see the associated
+      bindings doc for the actual DMA controller in st,stm32-dma.yaml.
 
   compatible:
     const: st,stm32h7-dmamux
-- 
2.34.1


