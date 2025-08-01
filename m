Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B1BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXeN0yTk27kYqpqxg0K4LVCdNCKqXnTt/crAYYNXwbI=; b=tSJGCFx6AMnLupGxKLdzhQgAWn
	/lGjbyVVUyx8ur64rIwV5ooBT9F50un3Qzt9/HWIIw/fK0Ea3sjMPNriVUTsT66fMOv61nmxrg2Xo
	wtfYH8HiA4qBZAbNsx1o6/tOo7qNSg/0E6pd7hXPniaPWWz2vUsHBOb7hmy3ad8xFhitSCv2RXFQC
	xYzxaNMdBT/uqqUg0ErldYD7itog0XX7Qxi7Io1vxIYaxTA1hp3F6UimdfsOns8rPdsK1QhKF1vr2
	CokuCoOTTjJ0ynv947QuxZLUJpMVQxukNaR5cmM6ILsMIqJyJ1Ue5tPvc8DIEKHfMdQsxiZME1E/z
	D5gSzs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpfc-000000065uK-05cH;
	Fri, 01 Aug 2025 13:19:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpd0-000000065WT-3Qgq;
	Fri, 01 Aug 2025 13:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754054213;
	bh=5ietD06f8Z2UeewCIdXHPrS5WF1AM8TGkC/CX4qWjOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KpXd8KbtYIbC53CV9/bcGCey1JzAGtn6x3OO5N98xTgrg1IeDe2C8YthWcPUhfGyE
	 eI9quD6l6FzrXt1ILTbSibNwbcfNI0i+Q+qLjkAGisU+klqbsdQ+CH8Gj1kSz5nceL
	 2QrXgEl2pt9CKrCW6+Rc5YnhM72Tto3/e1ue2S4j6y6C58rlzZZx/12MK0OFDWB2zw
	 A71ac4k9WddICRILXNb2SSFIXX58uIDEDeImTH2+uHPLuj1jNHzZkd1rXmBm1HNInB
	 nKgC5pixmsB95nKIl7xUmG1Hqaj2VYeCCp/tXjPQrTJ06w9Fn1NvYmTsDBym6Y/egh
	 D5B7pW0PnUbxQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C529417E0DD7;
	Fri,  1 Aug 2025 15:16:52 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 15:16:49 +0200
Subject: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_061655_005741_5FE1C6AE 
X-CRM114-Status: GOOD (  11.59  )
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

A recent commit in linux-next added support for key events.
However, the key release event is not properly handled: only key press events
are generated, leaving key states stuck in "pressed".

This patch ensures that both key press and key release events are properly
emitted by handling the release logic correctly.

Note: the code was introduced in linux-next by commit
bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
and is not yet present in mainline.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 50e2e792c91d2626d3f282d04a1db60845827ef2..0f9a589306482265f1f65c5a100b3f4aba0a2ed3 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -129,6 +129,7 @@ static const struct mtk_pmic_regs mt6359_regs = {
 				   MTK_PMIC_HOMEKEY_RST),
 	.pmic_rst_reg = MT6359_TOP_RST_MISC,
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
 };
 
 struct mtk_pmic_keys_info {

-- 
2.50.1


