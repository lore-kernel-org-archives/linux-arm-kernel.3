Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B56CE8D5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUMIb9y9wVXtiwc+9+yjUEpvI/XwAAeCzmUhTxPX28g=; b=D+ee1Nak6CK/gpQzCwCQtdDPY7
	sT+OpnN0Lez7GvH/1ZfNSuQv7sj13LUaGhSY9MHzuxkf2cQApaK765qCnm9EMR7TcwaUiLVmG3epr
	BqdTlZ3pShAMjV20XNkJP7BgO5ejoyj3w+MlhPGzan/IPPF6e7N04Tj2JZWRtXJSIwTzwzieBZ+Vd
	PCjE7Mgti7mwlvWSc1kg1CW+ajELojaQrMKgHWvt4RolqoJv04wMmUMV15lJPgdgNqCTYohzVBVXO
	FtjXCvOYHZJo/qObvI9rC8DiQLyvw3ZE7PXwXYWBTli8lfkzat6fgjuFPyczsPMdDrTBkvVC1SGZA
	ovBa/xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4J-0000000Cm1d-0gBj;
	Fri, 14 Nov 2025 16:54:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4H-0000000ClzF-3DXC;
	Fri, 14 Nov 2025 16:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hUMIb9y9wVXtiwc+9+yjUEpvI/XwAAeCzmUhTxPX28g=; b=kZw3/47Fi12jcjoWnp5r54QBFv
	1kTX3izqYB1GB0qsPoFn6vTIvMxx2w3vf5dcwU0rOpoPVe7uCN+1HaiXeZZjJfoFiMB8R+blv75AL
	tgDhBLImODu5pKsPoJHgYNFkn/8KvfsG1fCZsc7CxWAsAZ0BVM52LuYw+XsvoNe0sDxULHhnTdYp8
	TDKa4hbEDDYbIM6h2UPULlDkdcUnYaVP82AcwoLGz0VTzNtEzWMwGpFctUUYSbaOnofwMSUkA94ME
	WQAzx1qOvnn93WRg7tqe289Mzv/d/fBh8QlwgdTB9+T10JTFxM0oUOb9TgaOMHJsadsyJIfOBEUHh
	tDmb6N5w==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwCZ-000000032f8-2rp6;
	Fri, 14 Nov 2025 15:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139260; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ac2q3Q+dYjA6zavR7I4Q4nebD5BkUZ7iuSRl66TGZDmNN6Myvwjy/fZ/ZKaeduIInLAnhqCzi9an/pini76iJo403zO4sGkA7fsMmVG7P/rW5xluzXPIxGuaSOrpcNXo2bdTE4ZmiTeR/zpdUEpjGw/OyLKZEBIGJYqOGfUir/o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139260; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hUMIb9y9wVXtiwc+9+yjUEpvI/XwAAeCzmUhTxPX28g=; 
	b=P15eVxZXSw5OYE4LaaJ5mrm1S2YhZgqykLNpFnBoWvr4hX9WndJr4P4uqV1h4WX08bDyi4XT+GF7whYO/gCgvovewoViM8cwwF0x8E2y8MB28oZFTdWQPIHKWVupj0OkWjj5K3sqyBKfLMyGMbmK+Q9McDfcbuB+B5V08CKEnk4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139260;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=hUMIb9y9wVXtiwc+9+yjUEpvI/XwAAeCzmUhTxPX28g=;
	b=B0Vu3EsN1ToxHBjcmI5S0g4nvX/JC5SEwKcwGSr/wYgOkV2zUIZlv1Wcr5Ye0tT+
	WgUJ1g40W+xIin2ZehiIgB/Zym2u+MZqafq9TQxllAM/AHtZ3oh0sW6bEKiiY+aoMXz
	6LXJPjO/XtnphwY/YIGA1eAZXCxMshW+X2fGEmD8=
Received: by mx.zohomail.com with SMTPS id 1763139259572869.2446106413408;
	Fri, 14 Nov 2025 08:54:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:53:58 +0100
Subject: [PATCH 04/13] soc: mediatek: mtk-dvfsrc: Change error check for
 DVFSRCv4 START cmd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-4-b956d4631468@collabora.com>
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
X-CRM114-CacheID: sfid-20251114_155908_111437_619976BE 
X-CRM114-Status: GOOD (  14.63  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding support for DVFSRC Version 4, change the
error check for the MTK_SIP_DVFSRC_START command in the probe
function to error out only if BIT(0) is set: this is still valid
for the previous DVFSRC versions, as those always set this bit in
a fail reply anyway.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 41add5636b03..7708b07ab2d6 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -440,7 +440,7 @@ static int mtk_dvfsrc_probe(struct platform_device *pdev)
 	/* Everything is set up - make it run! */
 	arm_smccc_smc(MTK_SIP_DVFSRC_VCOREFS_CONTROL, MTK_SIP_DVFSRC_START,
 		      0, 0, 0, 0, 0, 0, &ares);
-	if (ares.a0)
+	if (ares.a0 & BIT(0))
 		return dev_err_probe(&pdev->dev, -EINVAL, "Cannot start DVFSRC: %lu\n", ares.a0);
 
 	return 0;

-- 
2.51.2


