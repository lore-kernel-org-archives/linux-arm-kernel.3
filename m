Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF6FC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3t0rqIk6q5csxKdXt8Okf8D1slDFkmCRGV2qSYVss0=; b=WgbdKlbqNpZmpCofMrwXTG8P8Y
	QWsls0UyP832cGvT6ZDRdMAA8B4NV6KeckyPJtG6UUD2hwy42Xd0YiL1QhGvWFHAh2dL27a0tiV/8
	XSvp8Ylo9Vkka5dQ70+Kv7Mxedg/0xNelFySw7TR+a2vezcr7PCqS3GrRcv5nHG50hoahECuKvZE3
	RtVO7QUE3reBNJsMVPHcMUW6rv7gBwBHiw7cIjmOVlTPKbCSbIvhEZYoF4EC0cgxmp5G9YZISYD54
	ksI7K2K5kGbjSowZHhjKj4jRSkXWvZbGuXmdVK0edBENdpm9ZegJkNBW88frD0qbdkrYWjw0heZOw
	PG+FXtzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iso-00000007ejb-241o;
	Wed, 23 Sep 2026 09:03:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ism-00000007ehb-0Iyn;
	Wed, 23 Sep 2026 09:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790154192;
	bh=ELuyAkQgxdFhKJt4yeIbM3DoiWg1n7T0T6wH0WdkcJ8=;
	h=From:To:Cc:Subject:Date:From;
	b=QfuOjIhCOMGnDcbq82IpoZzvW9kkbfm5pGTLiCBKjrMgouZnJY4+lYmotkPNfagLW
	 Ii4E1GK78crXuRdq7qA7eWJYZGmcNEKO5w1J+gS35ijjLlRuu6uuPK9YMNPGrKVljB
	 fqczpKG/LRDD9D0Fo6q9/veYUc4lUhZkrqkPCbTV5Y03MYJKC9+OZ5ih/ygnIrUnCz
	 nO8XLrWmCL+iRLS5OTPknrXymhsHyyGPKiORKauS1ShpoA6LlPZroNxtzgq0sS6KKi
	 mbEq0ielNCIWJO0FQFk6O0gmtRy7T6F2RaTGAP4EyAQpguf/fpQVxSPsiToAlw484r
	 1tXpAXmnytHQQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E7F217E03D5;
	Wed, 23 Sep 2026 11:03:12 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/2] Remove unused variant and code clean up
Date: Wed, 23 Sep 2026 11:03:05 +0200
Message-ID: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_020316_264943_E5B66894 
X-CRM114-Status: UNSURE (   6.56  )
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

"nxp,imx8mq-vpu" variant has been tagged as deprecated since 4 years
now. This series remove it and make some context's fields useless so
remove them too.

Benjamin Gaignard (2):
  media: verisilicon: Remove deprecated variant
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  2 -
 drivers/media/platform/verisilicon/hantro.h   |  8 +--
 .../media/platform/verisilicon/hantro_drv.c   | 21 ++-----
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 60 -------------------
 4 files changed, 7 insertions(+), 84 deletions(-)

-- 
2.53.0


