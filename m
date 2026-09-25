Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FACC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=osNt0lA7xwcqYkkI0I2940/5E4UQ8Ast/hv5gsjJK6w=; b=UvL6gBZAnwyLBvG152Rqdz0wjC
	FWtmcTLYCZbI7XY3aGhpVwthsrbjOCVmNiLSMTMFJZYoviWBUh5bGD5Q0x9k3FKFFHWEmVCdH1jkS
	7Ami62HkwxUYpTBWyDR6Zmj6QcTPq/+WBe2yHn7l9WtYHfnS2ESElBiMIK9reMQE6iLTb6gwqqNdc
	Ysc2pXgPaK88IqrsazyaTXQTTxTZQ0Qi/gB2Q+xLx8VJKXdwty6wo5v6xIZraQo29RGhKBS+yGpsN
	QbP8D++X0E4xaN2AcPRJV6Ouuk+wAIqW0PaCpwz3JpvfrW5KY/NYfjNpCCeBsZhQueJsGIGviLAgz
	+V0w8lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1f5-0000000CwKb-1Hnj;
	Fri, 25 Sep 2026 08:52:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1f0-0000000CwHt-0wFy;
	Fri, 25 Sep 2026 08:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790326317;
	bh=0ww6mYNLdL0BcAvD2/pYjaJdM/Z/4qussweK6HJ34hA=;
	h=From:To:Cc:Subject:Date:From;
	b=pQqjLsGzUjLdS4pEd6D+E96QGLgNTZZ4wLp6Dpxz3I45a+0elNWCyLSP32UfUz6SS
	 BJEi2ZqBnEo7dqgvCmBlgMkGd5G1eHKofPRL+GlGqaQl3eBEu28TTdB/o6rgKj/KiD
	 I8yesRrXAE9PIL1bY+o0/JiK42fa/NU0u5vLElfoR7YQrqUSa6cv1vObegB3YRyg3s
	 QrJhfnS/aDpT9Rd2WvEbuqqRGe96EvL0KRogGVR00AuSNd5H4OEOqTQkk/WUo4aUwM
	 Jd4KQEDb/Qjt+nBab9gJMzNmTxXLVsrP8vFwwzKovxh6FkgaHHsHtTPRT8qpovFPyO
	 73kHFMWlD/qYg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 621FE17E09D6;
	Fri, 25 Sep 2026 10:51:57 +0200 (CEST)
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
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 0/3] media: verisilicon: remove unused variant and code clean up
Date: Fri, 25 Sep 2026 10:51:49 +0200
Message-ID: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015202_419731_F0A51AAB 
X-CRM114-Status: UNSURE (   7.94  )
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

changes in v4:
- rework commits messages
- add r-b tag

changes in v3:
- remove more dead code

changes in v2:
- have a separate patch for documentation
- fix dt-bindings
- rebased on v7.3-rc1


Benjamin Gaignard (3):
  media: verisilicon: Remove deprecated variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  10 +-
 drivers/media/platform/verisilicon/hantro.h   |   9 +-
 .../media/platform/verisilicon/hantro_drv.c   |  30 +----
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 105 ------------------
 4 files changed, 11 insertions(+), 143 deletions(-)

-- 
2.53.0


