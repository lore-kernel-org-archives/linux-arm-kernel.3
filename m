Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D24C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF0uyJJDrrwp8Lcf2KUo2KH8XfvefSad6sEynq5ZH8I=; b=QIEtgPHP8St0LQZLlYo6EB+PrM
	UfSo0GpDQv+S1ep+pV510FlgBiA6N1Maor3FHlFwbIsQP6whsSEKyPdXJqQK4j2tRHd2wB9XFcmJc
	C+YBSmaZkX2B7qbI5cweYzKUYTBcDHGDurEm6uU5QSyqZKqzsKv3+vXKw+RMeqQ8KKqBHyOdLtX+O
	y1vs+TW9oX8vCoG6FLnrKcWPb4WaM62gKcnaT1WtC9Jdvc5TLhCiXdVbgcMOff2GsOYlKzPYXBo3F
	qx/w2o7BgEEN5TDbVPLZ6tVVrkVnIN1JwosZRL55iqWRQC4IVHZMrsg82eakmKuuado2u/ic4AGft
	1euN5Lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xrg-0000000545m-3Ugl;
	Tue, 22 Sep 2026 10:36:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xrf-0000000544h-2uRD;
	Tue, 22 Sep 2026 10:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1AC9448D4;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5A3EC2BCFD;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790073402;
	bh=CAcQ7Xu/9h2GhGu0CNLrvi0qn4QCtyqsChF0NqMeacA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NPodaoxzxRXR6b2AcmJyZgKYIexfnraLBtwb5gjBjdNRQWB2OSrBRG2TVcmtkr1lL
	 +guNf2M/1iLm7UJ+h4ku7A/Z/IxyQixTP1t16xKjASsMg4uIuYtSVBf5jO+PRStT2l
	 TuhDxS52xZkC5IaGoo1DtvXIhSGI0RHpdDEWm2iwZJ1BLo4xGDdJYISt7x+mDsaBCG
	 GUYT/S8stqrspXiTeY05C0Okq8jT2bMex4nJy8Mr5waoeszHU9zDVlHYzEiiKudGhM
	 Imt4Jn3j9gkLnwqD33dYxAb3fkDuLbKQgMMb9SC9tu4y9ZMuc5mx+LiyVLs2X7GvAm
	 YmbjHxV3QBbZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCBCC98306;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 22 Sep 2026 13:36:42 +0300
Subject: [PATCH v2 3/3] usb: mtu3: add mt6595 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
In-Reply-To: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073400; l=1072;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=4eJyqPWqICB49dnoynS9NuK90SAls5nCrv8lul+jrkc=;
 b=Helez+SfQi3Bl9XUgDSgIs6bK/Q8s1SERu7FfzNpipN1fTm5JbN+e/p2DW1N4YCQxBU6QAvLF
 bUsvlsZF7C1AOI7Pt16x3Jnu6rV9DVeqZu7UaFCjIsZEtes+b9bv0yi
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
quirk for single FIFO slot.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index bb67da4704b2..9d633695a9be 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -611,11 +611,16 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
+static const struct mtu3_platform_data mt6595_platform_data = {
+	.fifo_single_slot = true,
+};
+
 static const struct mtu3_platform_data mt8173_platform_data = {
 	.fifo_single_slot = false,
 };
 
 static const struct of_device_id mtu3_of_match[] = {
+	{ .compatible = "mediatek,mt6595-mtu3", .data = &mt6595_platform_data },
 	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
 	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
 	{},

-- 
2.55.0



