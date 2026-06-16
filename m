Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD247CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CC4pQBR74mo53LWq+yitH7clGdozvjJ29YJSAet9JCI=; b=DiGGVbfUN0ZBkxF57SHBAOhQIB
	TRTbiqm7Z575R9SzH6jqcnMIu/Y4gWllr/QS0zO8sz2AwbybEDMkQHbDaoKGj9ryoGU+IDTMCwlAm
	h1EFl3UwEKvdLnUthT8wnGmfRUnB0+cD2gwQrYTXvboJBFNFv/XnkHo/n8CBEGHZkwbiHIElk78xg
	VfUieW0Wr91SaRoCk300E3cx4Bih6h2G3froEX63yVS9ilgzygMySSMwYt3pZk4vhvb2o3DBnxJJp
	lR9cJxsLNx6xk82vRlN3pZIUvwEF94IkPGppChOvT8nBvl3fVbaLe0lE0rhKz4Knn71v8r8b0WIza
	wjv3VZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSMo-0000000Fhe0-3owh;
	Tue, 16 Jun 2026 11:54:06 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSMi-0000000FhaD-3o0V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:54:03 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CC4pQBR74mo53LWq+yitH7clGdozvjJ29YJSAet9JCI=;
	b=3X3MkwZYmEY3JDXqi91Ov31Yxx3tk6Y2gflCc/3A0XqIeUg69oEf5IRIo/O57dI+LStLVu
	+w9dK2Mtl2t4QksPbi8Gie/qYBGVAt8P52//iENHhH6mxeIgAnkGW1Q8rt0cEkMpOCuAq2
	ebZiCgnINDQzANBUBsAIaFdiTiy+Hl2FAZD3YK1QsozYLRyBrJM4yz+m1FcjJrKvS6zMIO
	9XVe+msJrnlkxtTUp4qJHZLA25ZzreUXK27+O+RHjpj3obXzLekzoj0UZKPiiVLzdNmIV8
	DCzqh8vlo/TBuHXAB+C3VC/ipDxlIMg1EKg8FyxVnvBsSRp7xWceU6V9hqWVZQ==
Date: Tue, 16 Jun 2026 13:52:16 +0200
Subject: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=QWE1SsXb2/HbH2oV2EUZBTZVKiDh9e7EbFlxADzOCVQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMmRS8H5Ble8enx50TKutvRaY3vvj154Mjb6XCnlCn
 yRSb3N2lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATMSigeE3+4qQw6Y7WZj3VjZ8
 k5teckRNq++CXt6E0B3TtgqVnJWNYvjvX3+V0XrTAZ83f1UPVr1fu/yMtMAGodLzj2p5wiNs5A+
 wAgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045401_635626_1D6470CF 
X-CRM114-Status: UNSURE (   8.53  )
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

Some SoCs like the i.MX9 family allow full access to the fuses only
through the secure enclave firmware API. Add a property to reference
the secure enclave node and let the driver use the API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index a8076d0e2737..14a6429f4a4c 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -53,6 +53,10 @@ properties:
   reg:
     maxItems: 1
 
+  secure-enclave:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the secure enclave node
+
   clocks:
     maxItems: 1
 

-- 
2.54.0


