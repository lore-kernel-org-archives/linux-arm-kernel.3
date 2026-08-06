Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C825C56207
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5nNvq4xaxP+Td89jLEXIwCMlG64uS80UP5U7rijSgA=; b=L9Zr6yfowPGPvEazWyv29jkG0k
	sWWEJAw/FwRRT1ra+9II9xzJG97SxnCSBUkDm44TbOG7ud0bPrGKYTYDL3cNANiamjBqcf9o+yrsR
	fNmTITkRNRywuuQ+z/v8BVmKA984LGjp5LZLydx7sTPOw4MJu2lOYXm3++iSk8yA3450LwmYi63cu
	cGPfwZwfJZr/ipZehvmzA+YE2BHBt3gl9zevESfojwDpFG9xw490I+48V/Q8sdfYbvdZZ4xysVpyU
	bNtvtQXw/qiGfe/sFmW2XZXp/eHnhDl+hxTO3HstW3KjdEc/e7JIoroMnxV7Vr9aNs+HK46vuwgd2
	qV4YgCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzMv-000000061bR-3KHl;
	Thu, 06 Aug 2026 14:46:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzMt-000000061aH-2jCW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 14:46:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BAC419F0;
	Thu,  6 Aug 2026 07:46:41 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CEE63F9A2;
	Thu,  6 Aug 2026 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786027605; bh=YEqhi0ns9dOGIwkKaThAPGwuXkqZjMn1/micDNziDLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4qyDf51HPdHHwZ35q1LnwXeGXMd+tqFMfkZh8KVXk806CqCOX4YXKR1PzJvd+ck+
	 Af1EUm+0rhxhjXMqXOjclSpKqmpf5FrDpzDI55QTwpTzsC0CCAFJpnrjqrpkPsaqMU
	 ESnfaRRardigZ3zp2H0nxM9EGleAssHJi3ePJLos=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	will@kernel.org,
	catalin.marinas@kernel.org
Subject: [PATCH v1 1/2] arm_mpam: Fix a NULL pointer dereference on unbinding after an error interrupt
Date: Thu,  6 Aug 2026 15:46:30 +0100
Message-ID: <20260806144631.2502918-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806144631.2502918-1-ben.horgan@arm.com>
References: <20260806144631.2502918-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_074647_758507_219C3BF7 
X-CRM114-Status: GOOD (  11.47  )
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

If a user unbinds an MSC after mpam_disable() has been run in response
to an error interrupt then a dereference of a NULL pointer occurs as
mpam_disable() sets the drvdata to NULL. Add an early return to the driver
remove callback to avoid this.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2f09f4b78bd3..bc6cc0b5c96b 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2025,6 +2025,9 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 {
 	struct mpam_msc *msc = platform_get_drvdata(pdev);
 
+	if (!msc)
+		return;
+
 	mutex_lock(&mpam_list_lock);
 	mpam_msc_destroy(msc);
 	mutex_unlock(&mpam_list_lock);
-- 
2.43.0


