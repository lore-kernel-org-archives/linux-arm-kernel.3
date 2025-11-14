Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330A8CE8D5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Z2RX45PQe3+e23Hg+S1cxa096rmc7JX0/zbuja37Rw=; b=qIHuVdf5xP7lOy/xtWW/V4KJnw
	dYggEhqm7+Qn33kSCIdhDx8HLaIe7zi6oUmc+dbRZrkgmlQiTSi19a4OWu1Ht1m8L4FIfm/C61HB7
	ALVvBU6Ts0JuktmCrW9XGxfh9S0shLY600Pqw2kYynZs5F70fl/exnvu0/eh/YqC5xbRXRM9+XIXG
	hbXL8KAGOxp3nHmEILETr3EjDccR2DNd3jXrHxoTcrLSTBs6f/wdig106zMErJ2cbkftrzCI8EMUV
	5IeYPKLCYEdb4YlJHZwzO8HTJ/ykMGnSgu5G306xYcXXMiSktyH1LaWWqM+4881CnfZEiiSXIZjlB
	2wTQeHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4m-0000000CmX5-042H;
	Fri, 14 Nov 2025 16:55:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4i-0000000CmRl-2ClI;
	Fri, 14 Nov 2025 16:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8Z2RX45PQe3+e23Hg+S1cxa096rmc7JX0/zbuja37Rw=; b=ngFi37na1N/cl8MjwU4G8yP+ja
	BP7r8dlWvJRaMfvm7jdE1eYfJ1Zdp86FGKOkIJPuVQhIM+Eoofrr52KxdwpootYL4nq18HEIeueR+
	kQ1+/iYdXERxxDtbE7ZBSxyz8OzAazYhgd1NGmAywL+U2d9JO+iFQ0BtI28VI5hhP5kWvKQH4miOW
	0fd2bslI5rbrw1FfC3T3BEpRcL/xHdwrH7y2vGwfj/y3T8CcO2IUH1umLYZvwbfwr8hIXMZBFNgOW
	whJa1kVT7C8eldf+67elxgHTTlUK6/niUdnwUieOBDrgnutqP6SeARCDwfG77zeTe3fUPZCjq579Q
	6QIKsJdQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwD0-000000032mc-2GWA;
	Fri, 14 Nov 2025 15:59:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139292; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZoO7WWhNV2Xk7S4KdxmF9ECHmclrJ28xzmp8wlkJm2P8bemhS5W2aP4h/DX5KQ33+5q0ptbQkpYgwhNt4OLQPPGQVxokfrJO8/opqpncHFigZeZoRCscxwE6ek+poDJTC+5fLyFYIv4rHExwB5X96JzzVWaOIf9VSVY+wScv/ew=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139292; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Z2RX45PQe3+e23Hg+S1cxa096rmc7JX0/zbuja37Rw=; 
	b=C5RiRrSxozyaK1VjSA0HHtnRxEQcaD43zY2wiOYkgNQufcBWm2VN+4uoN9nwgGoT38rLc55d3yA0H0ti/hJFfBTxPGwfBFPhDd3CxWmEI8iwdbpLq/hwjmnk/cc7ChSXxpttQXgvkKlpCKhBx/TYjaVGPUACMSl1kwKluOcGm/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139292;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8Z2RX45PQe3+e23Hg+S1cxa096rmc7JX0/zbuja37Rw=;
	b=UM0PiNL8Ytsb/hBYG1boWEA6By2aQAxsQ8dWuQaSoR/65dBdS/q2uWy1653C0hyM
	d4sHiTZgYAZVrpzCMsB/0eyvrzPzH6JKEFbqJq4Bwyqdrwfv9L11b3yRe4RdEVb9XBC
	aJmDgEKhq9QtLBeG4KDr7Lnuo8QoVjbQyFrLYW3c=
Received: by mx.zohomail.com with SMTPS id 1763139290645993.1597495532519;
	Fri, 14 Nov 2025 08:54:50 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:54:06 +0100
Subject: [PATCH 12/13] interconnect: mediatek: Don't hijack parent device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-12-b956d4631468@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
In-Reply-To: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
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
X-CRM114-CacheID: sfid-20251114_155935_053866_D03F603B 
X-CRM114-Status: GOOD (  12.48  )
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
2.51.2


