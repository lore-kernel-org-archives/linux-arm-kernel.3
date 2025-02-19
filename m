Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC22C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKTlzEVnVn5xolOUKQtkFBrOrduY9IM9erwyhzUxA6U=; b=e8yz8vpOONzoBegSFh0ebeNxai
	CBu3ALhKzhrvlWxfDMl1HDGRk1Y/nSNU7Z8HluP1Noc16JrjwD9TDmigxkVtgFFoWS5wlmcEsZfUF
	n8B1EVjno9tkv7AACyrn5HtiGz/wZpvHZff4b+b6CJ0u1Z/8XhN/6kvYdPQRnaq8qt6pc1ZHtnIbA
	uQPuBIDFdGoCAllwC7AGx9EdklBXEZtVhaUNiuRcMGJMCReRCBk45nJlxthn1NR9h9ivPPQcLz1Dg
	iZTPBOEU1gODVz5hX7Am3R+LWoPuO5wJBA6ndqYew9zR/ljNkKmx4KEF8UU0CIMOILjk0ye/lgu6A
	ImQRQi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgoz-0000000C0Wn-2Kq4;
	Wed, 19 Feb 2025 09:56:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgME-0000000Bqk2-44iq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DD9CA41FDD;
	Wed, 19 Feb 2025 09:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 923A9C4CED1;
	Wed, 19 Feb 2025 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739957225;
	bh=/8BENyPma1E57fsseTa1ytYOdy6D1/EypBQxBbUeYB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m7oZp1GPHV4yDMeriWYC05zFcs6bEymz+i3F8bjTa232EVq3UgDWTBepdWBMyGSsS
	 hJLkXPgT7j/3x4jdFZ5wCGsNKbT/6R6h9mbj9BaLX/9TZWguk8oKpgZ3F+I7irUDcU
	 mkmst4mCs4ieJlidpXPsrcI1LVZtHzjTBS8uft3bDkb7EORbmUDwGjf3bsawGQ6E2d
	 w7oB6iu/qM3XjxMVXYlwYIUuf6rSis39tZgHxwoYnUyinrixg0qeHmd2C0wP0OB66q
	 YGE1vlD7r7DitV0yHB6JiAYDwi6Qk931CxnzMuhH5+ctnh1CBD3skzzQ1BwEa4HDhg
	 aOtzWIP2JOrzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CBDC021B1;
	Wed, 19 Feb 2025 09:27:05 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 19 Feb 2025 10:26:57 +0100
Subject: [PATCH 1/5] dt-bindings: power: apple,pmgr-pwrstate: Add
 force-{disable,reset} properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-isp-v1-1-6d3e89b67c31@gmail.com>
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com>
In-Reply-To: <20250219-isp-v1-0-6d3e89b67c31@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739957223; l=1111;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=q1+AY+SX/HidyXOKL452yUY1CfrAy107+rMUbBBYmrY=;
 b=tIUgSAQ20H8Sh73LCctDDWcqZ8+098KXHQs/GdR+9F+SgFTynX3VPt5fV3fDgjtWC9w3AB7LA
 21v8x5BdfKECnc6GVZLlsALOJuRzMvKveogRObUVqDQNDLNsBpm9mC+
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_012707_096062_7C24AE30 
X-CRM114-Status: UNSURE (   9.70  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add properties to set disable/reset bits when powering down
certain domains

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a2167b7edd9e0491da238f21effe316..9c8f5385bee5aa1bac8c3e44963713299160521e 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -62,6 +62,16 @@ properties:
       Forces this power domain to always be powered up.
     type: boolean
 
+  apple,force-disable:
+    description:
+      Use the disable bit when turning the power off
+    type: boolean
+
+  apple,force-reset:
+    description:
+      Use the reset bit when turning the power off
+    type: boolean
+
   apple,min-state:
     description:
       Specifies the minimum power state for auto-PM.

-- 
2.48.1



