Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B559FD1038E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XJyr1k5hsMzXecc3r0bnTK4J08ys6q4zjF7voVTLkpg=; b=pFOgdbJjnotZmCblwGu/q6XnnT
	ASseYjvisLmb/ensYDmjcb16B2E8yojsxA8MPJWd9LcMLXgZPqus6FeP0DVQuhobyF6jFwe6xNGHx
	mGxXF1Jr3RXjAl8eeRFYZTPAQI5dr2GTWuevRLdEvyrN3zoYpPCksTCMI4EtgO42rdTksBPQDfHPj
	80rB6nQm4bEC+98Co7D5Dn64zz96xzAiutBzgoerNhOZBIrODKnn9BIOMWCtDn4eYxpLBsRF1WQLL
	ZeR+KH4DMLzKLxLARFETo2QOfdPC1nu88Ft6d+fsfY/jQn3W++tQ6+jnbj6gLJHqNbxT4VqjUN0g2
	/jt/K3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t494i-00000002BSH-0v7Q;
	Fri, 25 Oct 2024 01:25:12 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48x2-000000029Um-33d1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 01:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=XJyr1k5hsMzXecc3r0
	bnTK4J08ys6q4zjF7voVTLkpg=; b=pMi2kEfxiIEZOJHUsSpWJZ2k2YumTBKBPl
	lRckLnLyiKZ8atECugJg/NspZkSFPYJiH/IPjqftH9RtOuOVYyreqZthl3YD6Vw+
	1TRZRlTcKLv0icbee+fieUzazkSodq8jpQE4PRavihc7wXdob8jCzvideJHD+4Ia
	C1Q+00Kg0=
Received: from localhost.localdomain (unknown [111.48.58.10])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDX3xV88RpnafuUBA--.35786S2;
	Fri, 25 Oct 2024 09:16:48 +0800 (CST)
From: huanglei814 <huanglei814@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huanglei <huanglei@kylinos.cn>
Subject: [PATCH] arm64/Kconfig: introduce GENERIC_ISA_DMA
Date: Fri, 25 Oct 2024 09:16:41 +0800
Message-Id: <20241025011641.4858-1-huanglei814@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDX3xV88RpnafuUBA--.35786S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw45CryrZFyfAFyUKF43GFg_yoW3XFg_G3
	4fua1kGw18ArZ0qryYqF4fWryYka48GryfWryxtr1kXrW3Zw1fGrWUZF42kr17Gan09FWf
	XrZayFn0qr13tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbQ6ptUUUUU==
X-Originating-IP: [111.48.58.10]
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbixxKD9mca5F34ewAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_181717_216155_74AB33AB 
X-CRM114-Status: UNSURE (   7.82  )
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

From: huanglei <huanglei@kylinos.cn>

Enable GENERIC_ISA_DMA feature on arm64 platform,
thus, request_dma and free_dma interface can be export.
and driver modules can use the this interfaces on arm64
platform.

Currently, many pcie parallel port drivers still use these
interfaces when ported to arm64 platform.

Signed-off-by: huanglei <huanglei@kylinos.cn>
---
 arch/arm64/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..986eb251f68f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -367,6 +367,9 @@ config GENERIC_CSUM
 config GENERIC_CALIBRATE_DELAY
 	def_bool y
 
+config GENERIC_ISA_DMA
+	def_bool y
+
 config SMP
 	def_bool y
 
-- 
2.17.1


