Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD81CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QVnnxOjUH7k1p8kMe6zfSI3hFDUENcs464p0YtSvb04=; b=vRpmtBeBtGWEPn0p5PKc0GuKSL
	NHAB9GHKx4vMk4YNSLwDCOuRiCEthdlVFUHDGeNczk+kfP0Zrl9+rZmZn+HNgU102AOlXA1Ud8tdB
	U6PkcIIUr97C5+XWacCfzwniaB7lQMMwjpVi4c0xKyWMriY9fRwf5VziUFYVHekrxv2CbVUp+2IjL
	Cb7MMWnmTlIk0RyWstvBepCyZDlaIDo+3NfUPlHYUsRDldDz0swgDqBzJEZGj9L3zLHkWnlq4CmsG
	XFvo4DQdlXg+D0qEs1UmkLDqhcmOLEfuhVRHTmfe5epqpBkvicaGLNOckY6U95P4n9TE/GcoNYn34
	J2kfTVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvzJ-00000006RlU-2G0o;
	Wed, 30 Sep 2026 15:12:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvzG-00000006RjR-2XBV;
	Wed, 30 Sep 2026 15:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790781167;
	bh=8hOdfVeO8+152V43moBjalksfRu9BZTZ/UwSBkHEa34=;
	h=From:To:Cc:Subject:Date:From;
	b=mrdRqwYdhim45pl+JV/YxBn4Xzx5Ka/ecDUgYj42T7mov6MENrN0V8XZEi9XSkoUY
	 rxlZDsPb1wIERJVxJarhrcsl8HVlMt/6rXmoqzXfNc1bpf/TDEICJ5u3k218XHKHmB
	 HA9BSOUNEs88z/m79P4eetNNwlvPc959jadHXHNytuj8hk6N+lUuPzVJZ+LDNofFs5
	 sVV1OnTgFC+PH1GzvWI1RUx8UYrZg8v1BvPNTL/aVZx8azFoY7ACXV2ginzfZDxqFO
	 soYRIq1PDg/6jVUCv3nqJneJV/SuahbcPkfZXNi5uvIFxSrc1WJZN89TU0SR3ZiocY
	 2OLzjPrIxqHJQ==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1D2B17E0074;
	Wed, 30 Sep 2026 17:12:46 +0200 (CEST)
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
Subject: [PATCH v6 0/3] media: verisilicon: remove unused variant and code clean up
Date: Wed, 30 Sep 2026 17:12:38 +0200
Message-ID: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_081250_913107_6757387B 
X-CRM114-Status: UNSURE (   9.05  )
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

changes in v6:
- rework patch 1 commit message
- remove pw-bot tag from commit messsage 2

changes in v5:
- add more details in commit message
- add Conor Dooley accked-by tag

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
  media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  10 +-
 drivers/media/platform/verisilicon/hantro.h   |  10 +-
 .../media/platform/verisilicon/hantro_drv.c   |  30 +----
 .../media/platform/verisilicon/hantro_hw.h    |   1 -
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
 5 files changed, 11 insertions(+), 157 deletions(-)

-- 
2.53.0


