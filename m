Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ED3CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlKUwI5dhJwSTmBvNvWp0nZCLGdI/Dm85EIL+/eYW4E=; b=3pd6HQVW+ZBAP7Ig4mhIJ12rtV
	BVqzOCPyo0nErw+mQXM9Y3J0VwGR4ohAd5iQHWJHmtDp5SkNRuxH9w1/euDrATiKbFd/iurgBGTRa
	+jndyHCKVjnxzFBYQkNKN+zEnn1Pp5w4t9j4l0aOBVsTMdS7hY1PnUSsF0K05pP4ifX/Arl5s35v+
	b+GLM9CTDBxvR0x//hUJNyI6BffTI0j4PtdZ17aDD9cwnAxTrlefu8Fy45B6f9mo5qdW72qT3VtUj
	RqAzF9QNiv/XmoDhAwdGK8+ts3O8R1zPTghoLUwtXsu3yB9WYWAoisq1DzxmzGnFVHsF8bfp1hfzh
	66jPx+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssI-00000006yqa-3XkM;
	Fri, 29 May 2026 08:47:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssB-00000006ylC-28uR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:21 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C7861337;
	Fri, 29 May 2026 10:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044418;
	bh=5YxUz6t3BXJWUpNuKRYQwWhOjTfHf/XO0P/Y8t9xq0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CRAxuqhCyy0hKdFEdWOhxWyGdseJ+JNIy4pFSr6DytelAKX+/x99moTNG+I6yh621
	 DpsQzUoLF77lIvrh5zBpbAvEDi1ITqEkNT+GnmeDX/Qm1LEPxVW8HG5Y56bDW45YJz
	 6CZvoKa92kIC3mPOGROmW1sSafazk5+w9cEwB9kI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:33 +0300
Subject: [PATCH v3 03/15] dt-bindings: display: ti,am625-oldi: Add optional
 power-domain for OLDI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-3-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5YxUz6t3BXJWUpNuKRYQwWhOjTfHf/XO0P/Y8t9xq0U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKMTj/FUyRipkwsdk72Ss6R7PRhPUsMoVJZ8
 LCgzs65T1uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjAAKCRD6PaqMvJYe
 9U+RD/4m6jAQuBSloXMV8SWmCRgUkW3VaAIDeBY4Q/enD7xkwLyiXj/Liiz/uzwa/QXXj+cV0w+
 gqefzcfjvSplemjRn4r7t0Rh+u9FbT1IpskWQDfBy99PSxY8jdw2CDjozXfTQ7Oc6QQg8Du9Nqt
 KKNYRO/oOPg3fqucOFml++5/Ktyc0Pj/em41KQnM+jUp3f7VeKkYskfJa3X2Eu0pZgm40VSAej/
 hZlS+yn91hIibSCNkoS/nisZd7/rg+vYUByDeuTW/NaSwCFqkzEVEqKODt89PxAdhtlPuXsxp9D
 FW64dCvzjMppmcItyB7lozMU8exWu3HCxecHWfB2m5jzjb4BGUPawS4wPGzKu778OLP1lj4F/zI
 T8agNerWcBugPMvZSEgwAavcCuGaX3a7XbAj53H7nCtnRz4Leo6jLuoONZgyDoCjrOA4tvrQiZm
 95xl9kWaSLMgih+UDR2XZmdydxUkTgxDdtYbuHGxCw93VE4wNc4YyCnFeG1qbk8Ll4cIEb2/mkL
 XSrEB1FWwvzUidpM0YFIF2qHgobPb0jzO+KOwhSwJmgy3hUggC7RxdFvruVpYcQoE1WTb5hzi8/
 2NOYB6glu1ZJDdIVcpUycL2PSltIcIVYEh9hvKpmsnVc7fLyIWCx+G7pKZOy6uUfwq15x+t2fwb
 S1xuCzkCae9AGIA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014719_717421_199237F8 
X-CRM114-Status: UNSURE (   8.16  )
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

On some SoCs the OLDI blocks belong to the same power-domain as the main
DSS block, but on some more recent SoCs the OLDI blocks have a
controllable power-domain.

Add the power-domain to the DT binding.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
index 8203ec5e5bb3..5dbf1f76dd3f 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
@@ -29,6 +29,9 @@ properties:
   clock-names:
     const: serial
 
+  power-domains:
+    maxItems: 1
+
   ti,companion-oldi:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.43.0


