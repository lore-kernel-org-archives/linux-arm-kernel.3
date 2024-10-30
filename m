Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87463D7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kv28fZyUnvSoy7xLNeLLk5bmzedyTwjko9yL0PpBFlA=; b=UyLvtEEedLTsOjs3+qRpgKD7HJ
	EHrmwaFfJ58ReDLdhk5w8NXZbY3c/IfGM1u8zQMhAeIf8+yIGPIuGGB5EfbWOwPQs7HAPqx4M0ZKR
	F44VUVvIsHgFshFveZB4X0Yk5H08fTu32q80ZRZIL9wYXOMrZA3LlxAQ3FhnWjXgRFAP36hNtoRxJ
	X4xZoZjCXewfYplYRptzBAPJezBZl7nB2fAfsW5Ibwno10GA07jj4WUMl8n9gy97feH2C2I3xv/qy
	3ewkDMwtD7tMYpXUMH/kZomt3cZ74D3Q6Dzu/0xe+ZYtLJz+Hl9RkUCM1VDCS3nsLwPKZHsQd6ClW
	EmZS28Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t64Id-0000000HJ5X-3XIG;
	Wed, 30 Oct 2024 08:43:31 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t64H0-0000000HIq6-1Fl7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 08:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730277710; x=1761813710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kv28fZyUnvSoy7xLNeLLk5bmzedyTwjko9yL0PpBFlA=;
  b=bP5Oi7nid7EWgS1fppf4+ZPISjQ1xYAuIJu+SP+EjC3IUvmB3uhHCbNl
   +9Z8pOwbuC82gJo0BJ2nR/HhUz0vIveV7+uQpLeGPuwlKctWcHCcCVlkz
   4H38Mya61e4QzCr1sStuW0ij7ntFbmoZJGYrHdEaGVVpQ+luvngtDuKWc
   lRrge0T1d/XQ3bsaqwSdMx9gyaBtlOWVENyRFKJLml2j2nksP12Cc9Ldr
   zWVlQaohKdYWl/ShLVM2Ws9hSoRGgxG705hVbFQf/1y+16X1CUAG+T0Pi
   u/9qrp6IellfoEHxITklGXhMqT6cEhkS1kKvDowUxlwTqm9tnewN0hUDC
   Q==;
X-CSE-ConnectionGUID: v0LiVWSLR7yMTkEUEYUWFw==
X-CSE-MsgGUID: NUhZCbb9SeCskmtMKAn52Q==
X-IronPort-AV: E=Sophos;i="6.11,244,1725314400"; 
   d="scan'208";a="39755780"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Oct 2024 09:41:48 +0100
X-CheckPoint: {6721F14C-4-D31EDE1A-D52D6119}
X-MAIL-CPID: 61672B9E44BD23F5585782F3A78BAD14_5
X-Control-Analysis: str=0001.0A682F23.6721F14C.0071,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7994160F31;
	Wed, 30 Oct 2024 09:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730277703; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=kv28fZyUnvSoy7xLNeLLk5bmzedyTwjko9yL0PpBFlA=;
	b=rlKazrdMT7vl6dJMxpzGapJMT+rlSAnKUilGsMOxmFzH0t7ZtG/KUemS2lOgfRmA0MolXM
	BUF1eGSg+peSa/i0hbN81YtmkBZrYF0GEMBY+hwCZjGUzjrD2n3dRsRC6RQiUoVFu6vxo6
	Sinp8fEXV4uNSLuphCGplmxHCKuPwwx/9nS2HclaL7SJVj3j2IrzborRoRUhx1fJpK5tNp
	hfWYB/AyVrQew2D8KsAo9mHU+7ZpvP6xLpvhtGL2UmA24DYWFccpvP9KYdbEJDouPn0NK8
	5R2Wd0aPSc8QD3Ham80vFRXsDU/m5tjxayN3meO9TwT6V7J6UD1CxPQuztFTwA==
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
Subject: [PATCH 2/2] dt-bindings: firmware: imx95-scmi: Allow linux,code for protocol@81
Date: Wed, 30 Oct 2024 09:41:40 +0100
Message-Id: <20241030084140.9704-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_014150_855887_304ECF5B 
X-CRM114-Status: GOOD (  12.77  )
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


