Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94262606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WShuHo3+;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J6QUpRF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TksXlMVZXRpHlnAwSWhbl1BTy5EqD5EPHWFrlK+U+co=; b=WShuHo3+YyEY3TxDXmhx3zqamd
	RaGzigNdegrMC9ID2Y15ebt0eNXf1Z/P1KzrutOuVAdyOoufN7KLoEpjp5VFTtpQ9jWIcyJBA8zv5
	/PkHHJMddoIDfcKZO0w+RqHAdWd/PrzicUYsC6iTy60OrBYZ3r/2YZ3Mw4n7mqPJhZ23feX97dGlD
	aY2lEBr4iiSTCcyYiao8VykuiOotky85jWT36l7KE1NHvSOZIjNCUuJU5TJVoFoWOjKN7RVi86pt+
	FY6vwFRiJLCxKQXCbcbST9LqprlJxO97EPOnlfXudsU2LkGchIUrnt2JvAYerIWxBRdG9kmJ1DhgE
	IARHvwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6IB-00000009Ij6-474p;
	Tue, 20 Oct 2026 09:37:59 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6I6-00000009IgL-3d91
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Tk
	sXlMVZXRpHlnAwSWhbl1BTy5EqD5EPHWFrlK+U+co=; b=J6QUpRF1SX7f4nS5et
	3F66bvy2i9ahCAslj/onOhZXSJPxpDCBYObeEA6AQ9aRR49DsMY2RdxpTk1kMd6m
	Qnj0TyC5AcBlgd74YY5+fapPLNMqKdsu4Qz8vCRFTnWs1ALbyVStQYxNAvuGDfNW
	fyldoJGGpPTz9s+rOAzgpKTNc=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S2;
	Tue, 20 Oct 2026 17:36:40 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Huang Shijie <b32955@freescale.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/3] bus: reject devices without platform match data
Date: Tue, 20 Oct 2026 17:36:32 +0800
Message-Id: <20261020093637.1654161-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3_4ImNtdqupV5Aw--.29320S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw47Cw1fXFWxWr47Cry7GFg_yoW3tFc_uF
	Z3XrnrX34IgryUG3WrArsFyrW3CFWxWrykZr47t3yfX3yUZr15Jr4qq3yrC39rWFWqqFn8
	Grn8Zr4Yvwn7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU80tC3UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzggoYmrXNiil+gAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023755_306826_0CD8AD82 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Platform driver_override can bind a device to a platform driver without
matching its OF table. The match-data helpers then return NULL.

The i.MX AIPSTZ and WEIM drivers dereference the missing data during
probe. The STM32 RIFSC driver stores it for later dereference through
its debugfs configuration dump. Add checks before each first use so
these drivers reject unsupported devices instead of dereferencing NULL.

Each change is independent and can be applied separately.

Jiale Yao (3):
  bus: imx-aipstz: reject devices without match data
  bus: imx-weim: reject devices without match data
  bus: stm32-rifsc: reject debugfs setup without match data

 drivers/bus/imx-aipstz.c  | 2 ++
 drivers/bus/imx-weim.c    | 6 +++++-
 drivers/bus/stm32_rifsc.c | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1


