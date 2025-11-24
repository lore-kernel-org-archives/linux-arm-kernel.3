Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF81FCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoo4mVM5kwudM7/8ap4xpMpg2C8udD4BnzAHqgC7CL8=; b=fhXzx3R/xod8PMev20aq/10OZ1
	jHGmmo11wkpM8/bzXH2RaOfzeLizKEJow9XNTExwTKDe1G8r0owSMzHMxtQoZbzVgkF1mU5N8BRXO
	lAhl9PhxOZyW1t3gTcpyrlS9rZHoyGKhqP7Z6j0HEcg3jqO9fi0RJRX9G2hPOI1QgiauoHmAO7DSM
	N2aSXBJ1UekcZFU4zVtzMbu9AOaaR6VPA73Y8FnCszqvh8lxB5VCTgEcEfVtvQMDXQSa/9jBNqTR0
	roqB0O4kikrqPU3NnnLYesQM2R3BZfSb5XSj77nQKsS2erLD1iffgOX2a05l5z0amyVomAFkU7MXc
	jq9AyWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUQP-0000000BVtn-1iyL;
	Mon, 24 Nov 2025 11:08:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUQE-0000000BVhc-3MDi;
	Mon, 24 Nov 2025 11:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qoo4mVM5kwudM7/8ap4xpMpg2C8udD4BnzAHqgC7CL8=; b=KqWL7tlJ41fICsH+Wiy0Uhmr2I
	tETBc0pcRg+gULpI5BLvE+pHOoeUwTE1Q2LG4TFXgdvxMlsZS8lncus0xUxjTaplGb4dKYS8PZocs
	sdtPWivbGjHIJ82jYTa56Si1doZ6Un+Zebr1ETlHtnVj4V7lZOFfXoTuVmyKPx+D7Il7XGLqicS0B
	HC0pzJnvaa0cPGD/R8la1LpyGGb5F5a6SqlstKrsPglECFvpeAN2Ecy9rXlSfn48qXQ8kt+31A4zw
	z/kPKOCNIRsg01U8897tIt+iPGPzn5hzcpayDcDVWqX+miHlXJTr04SeklSeCEsEdB+Pcd2zXzD86
	knM7+X4w==;
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTYZ-00000003UNv-2RuR;
	Mon, 24 Nov 2025 10:12:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982459; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ex3jGzV73lIUVhhi9LP/QgpWjmoa5ygJYj4xrlQrHBHS1eFv6ifCiokLOIi/jgLUBBkc9IcrG/hYOH/hGBJF0O78S88FQkaWbQ9pf5ImCF2s2FXfphHBPw4cfutnaeI7GoeUsgA6KB3+jgMgpOuLJjjet6DF6LmNaykNY5K6JrM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982459; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qoo4mVM5kwudM7/8ap4xpMpg2C8udD4BnzAHqgC7CL8=; 
	b=Jfl9EzPGfi8WwdmKVnZzgqQtA1O96g7+H/+VoIH7/G22Yu4wvFszIY1kinnFoQnnb+XU6iPqs/qIyyBNJFkv0zgZ48FUIRqsA6AjQ3T67bN0TuMvwDVVbOyvykmYxDouh1PrJicsw5NXTjk/r3yRbr2z38nOyxdmLgpX6S16h0A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982459;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qoo4mVM5kwudM7/8ap4xpMpg2C8udD4BnzAHqgC7CL8=;
	b=BJtohHxvDVDXP2GbJtXjc50uSSPNEYr6MkjblxkDeFJi2rqoKFS2mcGlf1AjLDa+
	z7Id6HehKs/kHLvImNOYlhowRuF2+dzSfC2WSy4yXQEv7p70siafgbePQ4X1vRxvgLS
	5h9LolKdHFOwhdOtboV/XsWyFKvtMG5DBt6fG77c=
Received: by mx.zohomail.com with SMTPS id 1763982457081364.29471024039515;
	Mon, 24 Nov 2025 03:07:37 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:07:01 +0100
Subject: [PATCH v2 12/13] interconnect: mediatek: Don't hijack parent
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-12-d9c1334db9f3@collabora.com>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
In-Reply-To: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_101228_034369_2A0A7D65 
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

If the intention is that users of the interconnect declare their
relationship to the child icc_emi node of the dvfsrc controller, then
this code never worked. That's because it uses the parent dvfsrc device
as the device it passes to the interconnect core framework, which means
all the OF parsing is broken.

Use the actual device instead, and pass the dvfsrc parent into the
dvfsrc calls.

Fixes: b45293799f75 ("interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/interconnect/mediatek/icc-emi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/mediatek/icc-emi.c b/drivers/interconnect/mediatek/icc-emi.c
index 7da740b5fa8d..182aa2b0623a 100644
--- a/drivers/interconnect/mediatek/icc-emi.c
+++ b/drivers/interconnect/mediatek/icc-emi.c
@@ -40,7 +40,7 @@ static int mtk_emi_icc_set(struct icc_node *src, struct icc_node *dst)
 	if (unlikely(!src->provider))
 		return -EINVAL;
 
-	dev = src->provider->dev;
+	dev = src->provider->dev->parent;
 
 	switch (node->ep) {
 	case 0:
@@ -97,7 +97,7 @@ int mtk_emi_icc_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	provider->dev = pdev->dev.parent;
+	provider->dev = dev;
 	provider->set = mtk_emi_icc_set;
 	provider->aggregate = mtk_emi_icc_aggregate;
 	provider->xlate = of_icc_xlate_onecell;

-- 
2.52.0


