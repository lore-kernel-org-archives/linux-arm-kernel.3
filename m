Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC083C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgiwnRvqXQyohXJgGOI5oYCACH+C1E4pfz9+3bhuLq4=; b=Y51YSfXET+dJy17KbBQ0lmcU5m
	rtz8n6yAm8RlVFEEEKwRg0H+S6c9dGC6NKAZg4/up6/OsZP2z4nquflSQDZeGnAT5NBhV23GQahM9
	6I9UbThpu7RuyfPBaW6SuejcPuQDo7qeQu/WWpjlI09u3ueGU+/BaI+q4mMx5BPDxKwzqOvR+9LEq
	/9AXeReRCcKbgDXP16yc4dTCvf1ND0STJqXIwznHWG7ZLfjdj0QwS8cgZRtvN2Q/XjwzZIu+AHEKF
	kl+44r71D2jeK6dVRwjn5yE2FpurEAkgPp8XKLU7+sErR9cahH9BTk+MKAjNNbCAtqyYcMhVpUyNF
	lDd2ocoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrc-0000000Ddsq-345M;
	Thu, 23 Jul 2026 07:29:04 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrZ-0000000Ddqu-0Vub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:29:03 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgiwnRvqXQyohXJgGOI5oYCACH+C1E4pfz9+3bhuLq4=;
	b=piJI+BdeFoeti+kt/rTcEv166EZoBPGCprtdpfH3wvxZJ+1OfVV6ry10uVvXnlFhZMQuWz
	cpeRe2mH58+OdpH1VqzHOVbGXt2lqnSGh/ujjAceO+GT0zxMVndnycOCN+9SXsasj2zje0
	aXUPEqTtbZucBADUgTtxm0rjCYFCo9I5VDM7fl+zph7E6PwfTmT8QFG539fwdu9OJ/5IyN
	UBkHRGWjkisYhTNrAK+MNvheyE9GBHKEVl20O7wnHr6La+VdmIsXrQeWvrfMZYNqWNm1pN
	WWu7bGkMSikL1SVByaZklISfXr09iG7DIKjRFOU7v81S9j5t6EhOYxHMwVSulg==
Date: Thu, 23 Jul 2026 09:27:23 +0200
Subject: [PATCH v3 01/11] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-1-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=VFW8MO++U+kECJD4HNHkYMwrSbydVRwF5+pIElZnwEk=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0FaT69bGXAK/c761cQcedwxzflvZt/JP02rGMNkEt
 lWJX8Q6SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJpIVwsjQWP+nn5/DiCXUJ6sk
 5PLSWMXfvKtXJj474HguhW+Phvwjhv9+G+Y6ZdftzROY9F+DN/GGwmWuxZuWyLpwsuy4UTKp6Ak
 zAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002901_723396_03C38924 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The driver currently uses the limited MMIO (FSB) interface to access the
OTPs. The intention is to support the firmware interface alongside the
MMIO interface so the driver can pick the interface that is available
(firmware might not be loaded) and fallback to MMIO.

Some SoCs like the i.MX9 family allow full access to the fuses only
through the secure enclave firmware API. Add a property to reference
the secure enclave node and let the driver use the API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..38fe451f808f 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -20,6 +20,16 @@ description: |
 allOf:
   - $ref: nvmem.yaml#
   - $ref: nvmem-deprecated-cells.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,imx93-ocotp
+    then:
+      properties:
+        secure-enclave: false
 
 properties:
   compatible:
@@ -56,6 +66,10 @@ properties:
   clocks:
     maxItems: 1
 
+  secure-enclave:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the secure enclave node
+
 required:
   - "#address-cells"
   - "#size-cells"

-- 
2.55.0


