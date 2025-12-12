Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49605D44145
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPA4cw3Gvq6SBCJV/vWcX38SZi8PRTPj9bVk8hJPiao=; b=MdFmUvv37nLwophwHuPaaYzelp
	KLxZCWY+Um9sCmTCaXwF0etNLcFJ38MJLHqoGVpqn2RGxZZ8NAUX6bktTBSUiDQpPPoGpVite8ClE
	c/qnaC/53OUByy24K/KpFvx497cy5bpO+qgDTTrdE5C6kZ3V3nQtUtikUyCqCanaw593n8eGXpgWV
	+diG9pdpnJnIr2GgnmF/IAgmG3YXp7a71SU6KGkA8/6HHJ6MChZsSQdd7F6C7o0ca4ejMReNY6ptf
	R18FvBuHGcHcznrFdqyo+NLGSm+3jI8+JibpcsIeRER52lTcNpu/+jiqGoJYGjQxEi8Vda09vX9L4
	P/VAQHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz02-00000000ICi-1DVT;
	Fri, 12 Dec 2025 08:59:42 +0000
Received: from mx-relay175-hz1.antispameurope.com ([94.100.132.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyzw-00000000ICA-3FRk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 08:59:40 +0000
ARC-Authentication-Results: i=1; mx-gate175-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EPA4cw3Gvq6SBCJV/vWcX38SZi8PRTPj9bVk8hJPiao=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765529965;
 b=Bv4Pzhe8O3Np6FPKD0XnEah2pLJ/Vg0OE55oyEKS5XMElp1K4YMx6fBj2ECtD+y+xmDBKO0S
 qf7Zb62hsoBVHKf2cb5jHMbNlLjqcawaTB+SA3hCp3O/4O/KVkU6ksV65lo/2sPbw7u9vIC8jKO
 hQHAfnzn8hpHXgJkdmKPaZ7ggiRZP0r7YEa+BsuQHqRSZFfdZWT4AKv3bIUGdZYfKCvkI/AvXEh
 tNr9ZAcNWq3Fm9/Q0jSyCHN3qyvnQEAAJhmRQb2lRnYWHalZaYbNRv6tevXFbqWlmlWy1vcd/MU
 wf/yZkZoD58kvgohJsPfWSgYJfJRFX8I/DCqxH2fivsPw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765529965;
 b=aMtP0Hh6Lwg03ilzSBlexfppMEDHHuAeXWH8H5SRafJSwvxFJZJ9DTkGydiOvWZY6LpavrPP
 abj9pbMLpRoo85oPlZxGjJqfShU/lgdtCueMSiODg2WohpKLJpwNtIHT4rSawDukk+1/MivhNm7
 WxZZqKXejPi/wDx6P0+DCovX7H7eoZamcWFHMJyFXsfJbaM3WFrUPieV2Qph6kHFKcQid2GV8aa
 FPvE+ohuUelWZa1yROnhqtZSJn1/Uj61/iVkt5XoUEPGZpFFbxA3D2PRTioaNPbJ86Wx3FyqORU
 ruXpcYwUybeRQzd1f97zsgenkHUlTxYhL2J5Msxh8xoLA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay175-hz1.antispameurope.com;
 Fri, 12 Dec 2025 09:59:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 434D5CC0CCA;
	Fri, 12 Dec 2025 09:59:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document address-cells
Date: Fri, 12 Dec 2025 09:58:59 +0100
Message-ID: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay175-hz1.antispameurope.com with 4dSNg273DBz2SSMs
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fa6caea5f90cd85704070cb335c8b449
X-cloud-security: scantime:2.182
DKIM-Signature: a=rsa-sha256;
 bh=EPA4cw3Gvq6SBCJV/vWcX38SZi8PRTPj9bVk8hJPiao=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765529964; v=1;
 b=in1tVDAoXWC/XqmD9jykNygNDDy+A6AKTMjtEOHb9iqjN/htG7dd//mUcj8LY4wW/0kXhoCM
 xgtz3sOZPPe7rM8xwXeHPybcyH4H9PA8h+XWnlnjUGQhE262iGvCuqV59AvsvbwgOEU7k3zTm9x
 6OoYWdqjSkPm8KfcsEfXfsq3raKxLOcQ1UR/CtOvQCZkC6rUVJKiWJjoeTv9W9xht3C61spMcsL
 wDP/QFukI7GyfP2MlZJCAJL07ZnOurUEYkhcCmY5/Q3pLsdBKiLXeXl2FVOnKBxaKoV3U6WiUvI
 adReTqUo+6nWugphqO2ztNtI/cC7w9oQDg8UMdg2alUGA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_005937_195455_88148F99 
X-CRM114-Status: UNSURE (   9.85  )
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

The GPC power controller is an interrupt controllers and can be referenced
in interrupt-map properties, e.g. PCIe controller, thus the node should
have address-cells property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
index 9de3fe73c1eb6..d49a5130b87c7 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
@@ -38,6 +38,9 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 0
+
   interrupts:
     maxItems: 1
 
-- 
2.43.0


