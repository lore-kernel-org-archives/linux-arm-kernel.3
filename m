Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E4CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1coMZ97bVtUDCS1vnxrIC2clN3y0sXn945jJXZbbsk=; b=C0qbBY5jT6QSiFLJqeveLvMxOd
	jToXBe68OZNU0RUDelEyX6c/PZcz37dj68mn9zKW0Dtr92OzAiYiVuLrRfAWPoKG/kjxdDt69u0bV
	8T976CPgJz7TDr5BJg9TvwhfKVWQ8f6pWgzHBNce90Pvf40S1KGobIkPgKmwSattQ+dTblAZfNMIM
	2pXekuDzC6OyMWVWMKUVu9m8Xks94ADaMB4oBueuA8FDz8CC/55S4RaSL8cdqPYIjDpYHwb29akr1
	GCDHNB+w6gSRLF1jyFvgy4X1hb8bgSN2rhSCO3Rx0kjECYR5I6RjpryDe97+IqxEeQW/xr5BXIahz
	u8Ztekng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCuJ-00000002S26-2Kj2;
	Wed, 26 Aug 2026 12:39:09 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCuB-00000002Rxb-48vH;
	Wed, 26 Aug 2026 12:39:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787747930; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q+5jNcULq0cLXM7KsedXTxLDCdnQ850rDn7Q4ZFfg8L5U2SJXri1O8+/qp1+tUI9i5mGVAjI0U5ldQ6kdAEO1B5qc6duS9MT0NDu5zTkGHRrqVWSjmRBqSjAWjXs06wqNY0Tf63kl+5fCu9DBrewtRL3LGqG8/rrfiyi1c57B0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787747930; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S1coMZ97bVtUDCS1vnxrIC2clN3y0sXn945jJXZbbsk=; 
	b=D869j1qRA97jKIUWhXaJeXNWr6nKfMnVYTadbDncHyIEtvj0rZ/GFgPsYEoxqjG3Pqj81C8kSF7lhnC9Er1CtENWO5RENLjuOWxW/J9kLKLYB1pmNbwfI4arvW90oWoBgan2UozY9TVQQCHq5ljEt6XlyXXzqdLTe89x5Dwaj2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787747930;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=S1coMZ97bVtUDCS1vnxrIC2clN3y0sXn945jJXZbbsk=;
	b=NQ3E2wephT+lTo+hSI1Fy7F+qRg0wY1rk+MupzUbkXlm4fRj8kbJilLM+UIxJ6JE
	P8bCF5t/Sf9e5uNAyJDMprdA6vaEbyaSZBVaCStJq0DiLXJzoyQyQr7iMFOs3NdHSBD
	3or9deRSGiTfMJhtQSmyUK49DK/ENKZz8mys7fLo=
Received: by mx.zohomail.com with SMTPS id 1787747927438124.99498758344873;
	Wed, 26 Aug 2026 05:38:47 -0700 (PDT)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 26 Aug 2026 14:38:35 +0200
Subject: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add optional
 repeater phys property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mtk-usb2-repeater-usb2-v1-1-e8e48e2fd6d8@collabora.com>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
To: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053900_609299_EB9DBB29 
X-CRM114-Status: UNSURE (   8.82  )
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

USB2 PHY ports may be connected to an external eUSB2 repeater chip.
Add an optional phys property to the port sub-node to allow referencing
it, following the same pattern used by the Synopsys eUSB2 PHY binding.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index edeb32a97978..e779e21a725b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -109,6 +109,11 @@ patternProperties:
                 - PHY_TYPE_USB2
                 - PHY_TYPE_USB3
 
+      phys:
+        description:
+          eUSB2 repeater PHY connected between this port and the USB connector.
+        maxItems: 1
+
       # The following optional vendor properties are only for debug or HQA test
       mediatek,eye-src:
         description:

-- 
2.55.0


