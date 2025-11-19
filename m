Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68AFCF34A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRhvpd6x1HY/izs//K1pFbwwDcGX2ZhUl9lY9Dlgo/o=; b=Uw3EPxGFbmKuA+miVElQf1feZ0
	b1N2Q9N4+QqObIn5cLAPq88GtnUAHcwkmm2sPv4NqLHHx1Gxi+3izhBgoGP3WbOdFf8GfAJJ4SsRK
	RiTk2fJYupDnx6lAIgpDHxbNgRUVLf08ZDKWYotzzBR0Dz3H3+ODgFrzhs44HvxaRc0PwLTfqLWku
	Bonq/I7DGiK8eiGPavXJXulFSlfyMuQgIEg0axKPxEy9nGTQ1irq3s1d6QGStFwEXTi+OzO7HQVA4
	nOYV4HFDsm+K1ChUsgotuASVaKr0oBezT3ce0Q6wpzHXk0Fl6RUQyzO8HoY/q2pDSZytJnK2kcG37
	mmHyvOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi1L-00000003GBs-2fTW;
	Wed, 19 Nov 2025 13:14:51 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi1I-00000003GBF-0cJX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:14:50 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251119131441epoutp03e5919d69d5c1cdadfd2ac30e76285420~5artNiwMV0084300843epoutp03k
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 13:14:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251119131441epoutp03e5919d69d5c1cdadfd2ac30e76285420~5artNiwMV0084300843epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763558081;
	bh=cRhvpd6x1HY/izs//K1pFbwwDcGX2ZhUl9lY9Dlgo/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AkC/4mmFS/nA4d/NpfM8Y+IZlHXTNNFlFleQ7+Gjv4CSPOkMDFBZTwu/HOB8X65EI
	 jC67FsbHds9KoBs/kVJGuKrdNQtXkyNxhPyrlLChYfXfzGFCBO38oNdRKOqxvtsQTE
	 sZkHKAjlitwxu17sbykXcjpe9iC9Wibp6wvf+KLY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251119131440epcas5p40389f59cd6919581213182c2ac276d72~5arsX4xII2519125191epcas5p4y;
	Wed, 19 Nov 2025 13:14:40 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dBMQR6T71z6B9m7; Wed, 19 Nov
	2025 13:14:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12~5arqerEUc0462504625epcas5p1Z;
	Wed, 19 Nov 2025 13:14:38 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119131424epsmtip194b252d9b5e9f3b24b24ce2f36603e76~5ardTSWIL2550425504epsmtip1w;
	Wed, 19 Nov 2025 13:14:24 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com,
	kitak81.kim@samsung.com
Subject: [PATCH v2 1/3] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
Date: Wed, 19 Nov 2025 18:43:00 +0530
Message-Id: <20251119131302.79088-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12
References: <20251119131302.79088-1-ravi.patel@samsung.com>
	<CGME20251119131438epcas5p189f617cb2a9d7b0376b9fedd9a738d12@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_051448_344242_C1C81378 
X-CRM114-Status: GOOD (  10.67  )
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

Document the Axis ARTPEC-9 SoC binding and the alfred board
which uses ARTPEC-9 SoC.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index 63e9aca85db7..3062901196a6 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -31,6 +31,12 @@ properties:
               - axis,artpec8-grizzly
           - const: axis,artpec8
 
+      - description: Axis ARTPEC-9 SoC board
+        items:
+          - enum:
+              - axis,artpec9-alfred
+          - const: axis,artpec9
+
 additionalProperties: true
 
 ...
-- 
2.17.1


