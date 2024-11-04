Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A1ECFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bZVznDietMqc8CDisChXL1GqxDSxeGo8m3Z1J4jxM2Y=; b=PD9DCkUmHhWhjv8+bHt0sWdXXL
	LmY6zVrHilZYuS15fqnw93pAJVrMf0x15PFS8XFzliPFblF4MrNocw93JEnpclLGmVDEfjPpMY75d
	Me0nFZ1KiPVOTjp/28tj/2bbzKMELdE3kh1T1WRnjorXzbIbeyVJaoUHfKVkQM1AhP3kDVmj4ngEz
	/3H5VeBx8H3BKEGuFqD3nCLIAE4kbSSxVRT6hWwmpmOY92qCqR5SbelUeT+IHe0FihR0f6/wbTjdg
	n9so36XWFa5C6zpWKhBR18ViGCBFHstaRuiCIsAGjYyF/687m75Iny78HxuYnUdrEKB8dFZQQ7iSz
	0R7tG10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7svb-0000000D45E-2HZ6;
	Mon, 04 Nov 2024 08:59:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7st3-0000000D2n9-0GZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730710597; x=1762246597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bZVznDietMqc8CDisChXL1GqxDSxeGo8m3Z1J4jxM2Y=;
  b=quq5Ub36lhgnvqowMITt1pcOGS946Lis218EP2JtSflI2OwPpqilnQFu
   UqQS47dLKux3rL9ZzCslMDGuOAW47oxC0g83gbCp7Nt2lyySrDG8O9k/x
   +izLJ2VwfBgQjiVJZiJeI0Xu3t9biDKCSCur7Pt3sIMHcHFjsscv2n4o3
   2SFjpYbIXAdq75usP4i/1bsxJXPtZCpoHHE+ihxau1VHWfQHcbBmbuimx
   w0rbdOLm1/vgEBMVhRKU8VDGPufplfGZ9n5wAHqVuel7gkdYeB2qb1/a6
   mBBG74++HZ6XeQTsCwfDD3xRpL8E/ZjfF+KLkFOwljGKGZuDQ6vhtWmy+
   w==;
X-CSE-ConnectionGUID: M8Pqh8T1SQubNcH7SyS38A==
X-CSE-MsgGUID: NH7lcu2QSreFwOgS1H6gcA==
X-IronPort-AV: E=Sophos;i="6.11,256,1725314400"; 
   d="scan'208";a="39825187"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Nov 2024 09:56:32 +0100
X-CheckPoint: {67288C40-C-90CD5875-E0265C0B}
X-MAIL-CPID: 0A056B4CA4F8B68938265580AB1C91AE_3
X-Control-Analysis: str=0001.0A682F17.67288C40.0091,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 788D8160A4B;
	Mon,  4 Nov 2024 09:56:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730710587; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=bZVznDietMqc8CDisChXL1GqxDSxeGo8m3Z1J4jxM2Y=;
	b=eSuOISPKfPImLq0eXXN5Lwhyv503U1T0BcpmaKEIt/m3tpbtQ1gaweKcvynPFBkRcVvBCl
	ZGJps3JG6ZdK+kOz6F0mFQgxjass7YbMLdf0kAPzhq/cFriJL7weQK5S5DkZl8nOuCg1K2
	aEGVcKqsHUoe1LqOWgEOYV7pmsxtlMRt5eJ1AAYXdcKX4abFWns5h61FteR4//7+7CA2xX
	qZRLoKEBPp/42gh6GY+0fA0E29eN5ABwAlsPpBtQQoRXA1InzslxdhPUYspnKyTyIbtPlU
	SgG3Yh7G731Si5uDbqPhZ75eEF8s9Cb0XuqXiXbscyA9TWUzZnlQgYz8iKtZXw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow linux,code for protocol@81
Date: Mon,  4 Nov 2024 09:56:21 +0100
Message-Id: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_005637_778362_554B2E9A 
X-CRM114-Status: GOOD (  11.30  )
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
Changes in v2:
* Added default value

 .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
index 1a95010a546b1..c1b7140ee0098 100644
--- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
@@ -12,13 +12,19 @@ maintainers:
 
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
 
+      linux,code:
+        default: 116  # KEY_POWER
+
   protocol@84:
     $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
     unevaluatedProperties: false
-- 
2.34.1


