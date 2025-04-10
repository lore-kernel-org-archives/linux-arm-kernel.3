Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745D8C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozOQ03sKIeGqangbAN5aU+tyFWilfia8cZMWR/LhV1U=; b=XGO2G0yKc63V3Aj8WMh7gfrDFu
	S6xA7ES7tUUz5TyHPAOEe0qTIkxFKWpLJTkETCQq+1rDBbswP+TJdZQW1B5V37ZsDCLecDLYNwqz3
	6ea4HrX48WJ//dneXZ6mEvSCMORZETR31LwfbHKge0CtzfQ7dQwTs7DNHgRpE0Z9ISXnK5qKpPJm8
	DY6EbFBAYFI4WsK+vqUPL/gc72JHzQYsNUT0a31qQNRI3dJA9VpVP3yo5ptABLB+WZduFd1ptaGLQ
	uuK/QQCkAZuG7upeo/WheVQILweY4ghfWhrOyHJdM9vNm9zMDlbzU5Ro3xV6nld6Y5pHD9KMaGva8
	4d93eIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tPM-0000000AwSn-2N8V;
	Thu, 10 Apr 2025 15:01:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4s-0000000AsTN-0fnN;
	Thu, 10 Apr 2025 14:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296024;
	bh=+1AxlEWA9rTUJ3K473VBMo8O6oTItzctYKiPygH70ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SwiOi4fOM/NJPjvApcSl6ve/pmqa8sBStsNbIXyG9w0bL7zdiDHC/U1ewJhK9cEqE
	 js2eN5Ib/EIvjOipBGTnS47Hw91PCubuBgeqeXumw/NbFckQX+zekJqs0Dp/TvaC03
	 DMux40KKxpbuuO/Au7f1Rey2ls9bhmFtfJB39uOD21zGGCYwEgISNraff0L8Oz/+jj
	 rYzeSq1wlaImgaDg7wvCq/e+rokIWWO7PPUXi2+aKPJY6XbpfIjuQmdobsHEoNwwlr
	 ndUJJ15r8gI4tMWJM24a7axEsuiTNoub/sKJq1dKFWDTERg84blLOJ1EpeH2RaeyzL
	 HboI8eq3ctuBw==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A3D617E1072;
	Thu, 10 Apr 2025 16:40:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/5] dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
Date: Thu, 10 Apr 2025 16:40:15 +0200
Message-ID: <20250410144019.475930-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074026_342467_57C1EDF8 
X-CRM114-Status: UNSURE (   8.46  )
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

Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
DVFSRC hardware, introducing capability to communicate with it.

Even though this SoC uses the same basic version of the DVFSRC
IP as MT8195, the vcore-vdram parameters are different, hence
no fallback compatibility is possible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
index 1ad5b61b249f..4c96d4917967 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-dvfsrc
           - mediatek,mt8183-dvfsrc
           - mediatek,mt8195-dvfsrc
       - items:
-- 
2.49.0


