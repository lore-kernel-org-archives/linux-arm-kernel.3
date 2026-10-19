Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6485FCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DqJahHfr1UsBLx8USbl6IZSZVQjmiL0holT7orMb9uo=; b=XCeOlNjqRTp3gX9v+xcnue/hUk
	cBuq7evyzOAsKpvjBgxaXZ9Wp80nNKkKhXX/RfiwgoWTh2yQad2XBj80DS8OkrLViYoKqJMSvYy9x
	YD1/bsPGqAj6NDrcg026RicG+NbGtOBK90Mom5bTY7PxCq9syrWQnEzHTNnpwIxPfUyicARJkrdaR
	2YX/eoOeiJqiDTQIHhW4GcWsmRNAdqdqsvN884qd2gECk417aP4E0uf0nYA/jlUADGHJBmsmYqW/Q
	Oic/iN5Em0udwWpAeJwK7JD4ptbwyeuRl/40/sJ0x+du7dUQooMQFxYAB8ssBXAc7po0ueAYDJQYa
	VjiVTB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIizY-00000006tZ4-2htf;
	Mon, 19 Oct 2026 08:45:12 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIizV-00000006tY4-2rhe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Dq
	JahHfr1UsBLx8USbl6IZSZVQjmiL0holT7orMb9uo=; b=m5hFG6uQBjs3cbTEJI
	KMaz73vJMwPOM48mwB1dsGl5UTJhJC72PhMibf/BXSNFfh9vzg7P3RwsA0mplte+
	GYBwpwR0MVyybP1nTXxEjugGFCEmH7iGNVxxZ1uh663YRXNyzcZtcn44nit+7WsC
	vCAjggFCa7CpGKjwMsrqULQYI=
Received: from pc.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBnaJF82NVqrQQEAw--.30772S2;
	Mon, 19 Oct 2026 16:44:45 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Atsushi Nemoto <atsushi.nemoto@sord.co.jp>,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] spi: handle runtime resume failures
Date: Mon, 19 Oct 2026 16:44:41 +0800
Message-Id: <20261019084443.1824122-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgBnaJF82NVqrQQEAw--.30772S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4UAr13XF47Zw1rGryxuFg_yoW3ZFg_Gw
	4kCF97X3WjkF9Yya42vFs3ZFyj9FWUuw17ta4qy3ZxJF12qFs8Cw1UZrsrC3WDZwsIk3Z5
	Kr42vFWxJr9xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM9a93UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B1ln2rV2H3F-wAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_014510_101553_6328205B 
X-CRM114-Status: UNSURE (   7.07  )
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

The STM32 OSPI remove path and the TI QSPI clock setup helper ignore
pm_runtime_resume_and_get() failures. A failed runtime resume leaves the
controller unavailable, so following register accesses are unsafe and a
later runtime PM put can be unmatched.

Keep OSPI resource teardown on a failed resume while skipping the
controller register write and its matching put. Return the error from the
QSPI clock setup helper and propagate it before either caller touches the
controller registers.

Jiale Yao (2):
  spi: stm32-ospi: handle runtime resume failure in remove
  spi: ti-qspi: handle setup clock runtime resume failure

 drivers/spi/spi-stm32-ospi.c | 12 ++++++++----
 drivers/spi/spi-ti-qspi.c    | 21 ++++++++++++++++-----
 2 files changed, 24 insertions(+), 9 deletions(-)

-- 
2.34.1


