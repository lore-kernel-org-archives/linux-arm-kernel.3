Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE3C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L5YKji8ga8cnEJT3rWxeR3O9yeC/t2rato6E1x7W+wY=; b=B/pqjmmStsE8gB+Ff1FewWEV8r
	eM4fQv67Zxe4f1s5UR2MZWnjqnfEClqHI9NJkYcVohHQXKZhj7bD7dlfKRqQSk84L/uUCwml+CNoy
	5BDvW2+4FWJNZ52WdxE9ZqZPEKrGGTNF8k0RtJ/8n/gQVOPJyAHfB0E4Ztsmc3gTm45W1z9neXjh2
	4ccCZRMgGZaUF9LyIWM/YrvGfwKeQjtVshTtWiPUHGj3s+I5PVEDqOgDDEY0hFnTvjqf7/zpCXBOg
	zfhTPXbEGoBWGixazrDnyM9WNPW3InxBayy93UnIYSYWjf5k/lIuSrVc1gbfcegksF0ErAEO7GEZc
	PBnNFuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf48Q-0000000GgUN-0F0X;
	Mon, 03 Feb 2025 21:37:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf41Z-0000000GfNf-29eq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 21:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7EB06A41E0E;
	Mon,  3 Feb 2025 21:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A17BC4CED2;
	Mon,  3 Feb 2025 21:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618232;
	bh=p72PiHjsMc3b7WsyXXFFfwMbwIVxFGnML3vWUepaJEE=;
	h=From:To:Cc:Subject:Date:From;
	b=FHgwl3UTgGmzRxVHE1y1rTWarg6Y+vGC6GFUOrk+hyJlZbV+pCiETRcbi3SoT7tgT
	 /4v4RiSGQza3oItrSRPW9Xd2S+ci8r9dDvdlNjZk4St4ZKrPda2XquyvGxHRrlM6D9
	 MGwyHMiaLTKbpVF1dqWsmY9sLZPvxw4KWjs/XmDbA30Qh+qSjuvhSSrT/xATXYUdub
	 OTR5TnEd0SIiiuAb7Ri/OfBujcM7kfN5Ysql4v/OLA5m3jSK36ITx6s3/XSjbczfFD
	 f8vbuhYz1LIkv9W5jCBuOngeAwR5/RLMZzHAgCsWJB4tt4tg9cyVuThsQMoEnLk4SR
	 zCzovsN83KEoQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties are defined
Date: Mon,  3 Feb 2025 15:30:26 -0600
Message-ID: <20250203213027.8284-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_133033_611315_FFC2A9EE 
X-CRM114-Status: UNSURE (   9.57  )
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

Device specific schemas should not allow undefined properties which is
what 'additionalProperties: true' allows. Add a reference to
simple-bus.yaml which has the additional properties used, and fix this
constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
index 80d99861fec5..70a4af650110 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
@@ -22,6 +22,9 @@ select:
   required:
     - compatible
 
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
 properties:
   compatible:
     items:
@@ -35,7 +38,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.2


