Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB8C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:From:To:Cc:
	Message-Id:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jK9L1dvLd5m9lPWVnJzTvy05KzJHfRiYwXisKwJCxs4=; b=Yn56zuD8FG/NnsOpusvizPpQN3
	ZE0Uzg9O7NeDkDvjlNOJQhcCsjXoN1Mdz4UzEwLKgmCC9FBpSBNk38cZDxSwX4IOqHeHpPrjAYKXr
	fqFH9fBZpiLhQ1CyjgPR/Ui68WAWEvg9iqJP4IzOx0eykcDa+7oim+BB8RqXsbvQjoGo6Lb4/bBIb
	EQW0nNmLtyNd5X2IYWpaxcXbGaL71cMLyObSLREnIygEz+H1WL5cRt1YvXkFtQmYAZJtK7lZnK3Ol
	KRR7cPKPX9HFQC6mfBQZMmIspmwcTCH8cG+FUwtQdPGJePAcAzDEqoFKqI3bXbXJIv3zJSsMrpeyj
	nFyGbMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQza-00000009Gfv-3aKw;
	Wed, 12 Mar 2025 18:39:46 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQwG-00000009GIY-2R76
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 18:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=Subject:Date:From:To:Cc:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=jK9L1dvLd5m9lPWVnJzTvy05KzJHfRiYwXisKwJCxs4=; b=md0LVs6BQzj1X1zReYSbbEAf3F
	694zkVxIQz469+06JS7no5VO9Xie9h5/g3wgUi4gYLzt0KypJIZQittYRkkEq+jVYHM2aVhUHNiu3
	OkuY+7p+5XznH1qopCzq+h1N+1dbk4T0En1TYn90QGdVKxfOVOUl/h6HePMwJfQazJQqszB/Supj4
	8dT3Y7sJ0iBeyooSjMT1f89XAsLNj1ymYmzRgDUUdapPUS4wPPNG2b8g1ibpcVgMCbhNVUH7XRfAU
	M3rzoCFoTbYX67wwQkwb71cJUvknsIKAzjQDUE1BL2+dauRySCSdQeMG/7EVgY/BoU6uZM8TuaNZX
	k9w1llZA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tsQw8-000IGP-0w;
	Wed, 12 Mar 2025 19:36:12 +0100
Received: from [185.209.196.170] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tsQw8-000JzK-14;
	Wed, 12 Mar 2025 19:36:11 +0100
Message-Id: <D8EI6SI5E4PE.3GOBCNHV38K03@folker-schwesinger.de>
Cc: "Kedareswara rao Appana" <appanad@xilinx.com>,
 <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Vinod Koul" <vkoul@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "Marek Vasut" <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
Date: Wed, 12 Mar 2025 19:36:09 +0100
Subject: [PATCH 0/1] dmaengine: xilinx_dma: Set dma_device.directions
X-Authenticated-Sender: dev@folker-schwesinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27575/Wed Mar 12 09:37:42 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_113620_909434_75803630 
X-CRM114-Status: GOOD (  10.23  )
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

Currently it is not possible to use the Xilinx DMA driver as a backend
for IIO drivers. Setting up IIO DMA buffers with
devm_iio_dmaengine_buffer_setup() fails because dma_get_slave_caps()
always returns -ENXIO. The reason is that the Xilinx DMA driver does not
set the directions field in struct dma_device, which is checked in
dma_get_slave_caps().

This patch fixes this issue. It basically is a partial resend of this
patch [1], modified to apply on dmaengine->next. It was discussed back
in 2018 in this thread [2].
As I'm quite new to the kernel dev process, I'm not sure if I should
have included any tags to give credit to the original patch author.

[1]: https://patchwork.kernel.org/project/linux-dmaengine/patch/1514961731-1916-2-git-send-email-appanad@xilinx.com/
[2]: https://lore.kernel.org/lkml/20180111062111.GH18649@localhost/T/

Folker Schwesinger (1):
  dmaengine: xilinx_dma: Set dma_device.directions

 drivers/dma/xilinx/xilinx_dma.c | 2 ++
 1 file changed, 2 insertions(+)


base-commit: 6565439894570a07b00dba0b739729fe6b56fba4
-- 
2.48.1

