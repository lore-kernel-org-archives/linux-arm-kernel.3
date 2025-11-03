Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5ECCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ckLU86Qqu35C0eXAWbJnw/y0szDBNP/SshXNOS9m0Hw=; b=eeZN3p4MC8+7Lop8LW/DnSPIyE
	NdB2sskaysNXx19k4MQwQyHhRGq7HEh5ZPb90z6AxZZif+QUNVHRGUF4wXPAke+97J0z9QdW8lNGb
	M+S7nzjlJQv0TvJhXTpNe9SOgbJbBPCmRn7PuXUy6gzWxy8ywLQDebvd1JbZMXtbQtL71ScQEP2n2
	Q+M6Y1ITSjEp9U/5l0IWOj6mYKKh4V4JnDCbanNTJy+A/VUsmJTcJJzeFc7BwHiy0gbBI0TTPelFS
	exaNDnCU4ZiytCwwqxxKsp4JmKjRV0P7LCewM45Xcvmtv6XZSZSalpAlzvPvcChk4EiOkj9zHnrN+
	fiyrNlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvCa-00000009zQM-0Jds;
	Mon, 03 Nov 2025 14:06:32 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvCW-00000009zPE-3yf6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:06:30 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251103140626euoutp026d172c032c96c212b9d4108f8ae0df14~0hET9Fro32468124681euoutp02D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 14:06:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251103140626euoutp026d172c032c96c212b9d4108f8ae0df14~0hET9Fro32468124681euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762178786;
	bh=ckLU86Qqu35C0eXAWbJnw/y0szDBNP/SshXNOS9m0Hw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=X0Lh4kMlzge6uY3zrZVVO1NsQibkfys+8jn3IFdIX0h2CQOdTkKeSent9sc3my1hC
	 X9zrSrBFX8tIcwp8BKlXZ7KiNBdh2Ri6VGTK3cJWYP98emk1OWb9EKEQL6W0hHul+Y
	 dqO3BtJFQ46zWnFnvqk6Myp8sXC0+mYZeFTIB5rk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251103140625eucas1p2909567ab24fdae587fd5e43d58f27ae8~0hETJe5C12983929839eucas1p2v;
	Mon,  3 Nov 2025 14:06:25 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251103140624eusmtip1a6abb03618e594b14155620bfb31fc6d~0hEStOJ-z0563505635eusmtip1N;
	Mon,  3 Nov 2025 14:06:24 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] arm64: defconfig: Make RESET_GPIO driver built-in
Date: Mon,  3 Nov 2025 15:06:17 +0100
Message-Id: <20251103140617.2361857-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251103140625eucas1p2909567ab24fdae587fd5e43d58f27ae8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251103140625eucas1p2909567ab24fdae587fd5e43d58f27ae8
X-EPHeader: CA
X-CMS-RootMailID: 20251103140625eucas1p2909567ab24fdae587fd5e43d58f27ae8
References: <CGME20251103140625eucas1p2909567ab24fdae587fd5e43d58f27ae8@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_060629_123552_94BCAA9F 
X-CRM114-Status: GOOD (  12.75  )
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

Commit 25d4d4604d01 ("reset: always bail out on missing RESET_GPIO
driver") reworked GPIO-based reset controller initialization, so now
RESET_GPIO driver is required to properly instantiate MMC device for
most of WLAN and SDIO chips. Make the driver built-in.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 03d89f29e7c1..a234bddfbdcc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1675,7 +1675,7 @@ CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
 CONFIG_TI_SCI_INTR_IRQCHIP=y
 CONFIG_TI_SCI_INTA_IRQCHIP=y
-CONFIG_RESET_GPIO=m
+CONFIG_RESET_GPIO=y
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
-- 
2.34.1


