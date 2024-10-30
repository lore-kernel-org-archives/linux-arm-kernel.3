Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75A8D5CC81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv28fZyUnvSoy7xLNeLLk5bmzedyTwjko9yL0PpBFlA=; b=0vDO+OLmK4aPHU3TqZh6pv6hkl
	yAkXDF6JcCiGsaVI/T/XPazelB9RaYDfnbu9Lzmneej/+Joi0UDfamciJRxmg25WdMcpICZbCwreQ
	t9N8cTjgIy9ddscEXUjvzaZES5Y1fr9jjcKeFa5srZtXLXaWqegp0C313pNifZ3h96ZyDZyiEdwWX
	37V7anSeIox7AVValU5dlW6CVyHZ7GfBvMvRUXUtDQDJgcqH4nLsNcqlrZQFM3d+J7K68Gx0tmUZs
	o8NDk6xba+rkSVpqQBEFCm1UZ83NlODYAx1g/0g9IyvTihkFcDgRBtHueNESga+69/W9JRUDdrKZ0
	UHEu3PQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Vv-0000000HU4M-0VwO;
	Wed, 30 Oct 2024 10:01:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Qx-0000000HSjd-0qrc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730282171; x=1761818171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kv28fZyUnvSoy7xLNeLLk5bmzedyTwjko9yL0PpBFlA=;
  b=NVdst0FnlIPte3Iimx5Bge7LXv38ZH+be9RyPkpnEr024FRSrM0vSkVA
   vk3mzpf3gSkTHvWohMqpHOU8H9Qkj0FK8SBkjTvbiMyoEhglnP4raddS/
   qJbyU9YT5+fEgqn9IGJgLaq6rZgBcmiPPlSh6KU6rtRJmXt1aRpzlaTkV
   +k9DckdW37sahKKV/keIdVWlKOByxX2GC0qW/WKicMG8LR1c0b88j8YQG
   tG8+saQlL8D76dJNMh7sOa1a1rtFrpxiLHfAd5Y+6HKAu0Z/60a9iCQ1s
   iyHNSz91K0cKSiKZ6rpwtKj/l6YFKqPfXAQO1cuauZblD/kWkjcjxPLmh
   A==;
X-CSE-ConnectionGUID: uoyDv6P9SzW+ZF9EaeyEdQ==
X-CSE-MsgGUID: bcvcl0nPSXmb59G7BIj7vw==
X-IronPort-AV: E=Sophos;i="6.11,244,1725314400"; 
   d="scan'208";a="39758794"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Oct 2024 10:56:10 +0100
X-CheckPoint: {672202BA-36-D31EDE1A-D52D6119}
X-MAIL-CPID: 3CCE9A5DE1379AF4B1F2317D6AAD2271_5
X-Control-Analysis: str=0001.0A682F1B.672202BA.00B5,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3406169508;
	Wed, 30 Oct 2024 10:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730282166; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kv28fZyUnvSoy7xLNeLLk5bmzedyTwjko9yL0PpBFlA=;
	b=J55rPhOXKhQMM8TciVzawOjJmY94RiQVyPZgRS9vPBcRZGfz1ymnYFzj7NbLcqud9DZLte
	CarOq5O8wpnaRHMTa4at33+QVqyx+ZkXQwZ5Dfbk+0hZQcU3byesuhG9QJW4e8h1oVvhEB
	OtqhhPb492uHpkF0sbZEflgujTgzYs7JSAF8qOG6F24/NmDf+Yo1eVc5y8tDj1O3AiYuFq
	ZLKXnyfVPji063IgbQWE3EzszulYed3+cwXP76mUz+aXc6BqB6d8S+ERHzoYLyuoRzY/3Q
	D/ni0k7oZSlr/aI+79/Kvku3tlUzNO2oB1kZTnzFRQyOyLieqc1400+fAC+hMg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2 resend] dt-bindings: firmware: imx95-scmi: Allow linux,code for protocol@81
Date: Wed, 30 Oct 2024 10:55:52 +0100
Message-Id: <20241030095555.222143-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
References: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_025611_554775_2FBE40BD 
X-CRM114-Status: GOOD (  12.94  )
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

BBM protocol supports a single power button, supported by driver
imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
using linux,code. Add a reference to this schema and add linux,code as a
supported property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Admittedly, I'm not sure if this is the correct way of referencing the
linux,code from input.yaml.

 .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
index 1a95010a546b1..112c3a3eb1980 100644
--- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
@@ -12,13 +12,18 @@ maintainers:
 
 properties:
   protocol@81:
-    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
-    unevaluatedProperties: false
+    type: object
+    allOf:
+      - $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+      - $ref: /schemas/input/input.yaml#
+    additionalProperties: false
 
     properties:
       reg:
         const: 0x81
 
+      linux,code: true
+
   protocol@84:
     $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
     unevaluatedProperties: false
-- 
2.34.1


