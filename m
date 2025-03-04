Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF11C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rf4tFMi5r60hYNH4Al5dufAoOfgRT5urdOoydlL9swY=; b=iRlUlkYkDQk5RfTgg0DEsL74C4
	huwkGpV6bPLzZ0uXnsE/8E9yr1P3zCeYTLKLVvAdLcKT2KOXn7gy589MXbWn3ZcJ+5nOLqEmGxVvW
	hkOBHwvqXGnso0nO+mamIKOD/OAfpQG12FLcv24i5Rlf5FNkmnT4eyfvT6ZI4pvXgKul36T5i8ssa
	qlJvgzadusl7O01qFmEUWDG0t5a700Z1Itcqq595NXcIzAx1NRaErkSjenXhMUVIB9NZyC+5pipO7
	tJ3IXqILVHh8B9Zv0jomp0Nls7kDKd2GDp47k56Abvo9ltKkk2UZze/pIxSI0Zf/sIhz5xwGi40qn
	1SDapS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTHo-00000004zuU-3wNO;
	Tue, 04 Mar 2025 14:30:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTFi-00000004zNL-1k5g;
	Tue, 04 Mar 2025 14:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DC13A4561D;
	Tue,  4 Mar 2025 14:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5963FC4CEE5;
	Tue,  4 Mar 2025 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741098489;
	bh=ZP9crCiLqCC27DzizkJ4ARDSaafzhltXkaVGhTSqjQo=;
	h=From:To:Cc:Subject:Date:From;
	b=DkIFqbWyusoB3FRblukNCbV0zy+rX7iyW6CGrDHjAiXe26bjUf9x3qJEp65/jMEr2
	 lRljmarzXCrwNqcu+7+QIXQ9Gb/7LaB0Bi0PzW9ouEW7JPcLPZHwYU1XoY+rlc9BBD
	 ImJemoPKOPp0yacfnA0KGQ5VQEmzGzl2b+s9VlLyhbq5sQLjLUd9SWkIcmFaLt6ERq
	 MCekeJKnJK3TCA8z/pbK89ykMrUdjyVx2xtFi5d+gDTXSy1cAVCuiI4pT6V2WWco4M
	 QRG/z/YOSYUtmc/7WE1acWpfEPX6KRU2lLRQjvQ41OTgkDa4tPagvxR340Yb+Ao5Xh
	 LCitY7hmsr+uQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: rockchip: add regulator dependency
Date: Tue,  4 Mar 2025 15:27:59 +0100
Message-Id: <20250304142803.689201-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_062810_515854_7EEEEF40 
X-CRM114-Status: GOOD (  10.20  )
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

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_REGULATOR is disabled, this pmdomain driver fails to build:

drivers/pmdomain/rockchip/pm-domains.c:653:30: error: implicit declaration of function 'devm_of_regulator_get'; did you mean 'devm_regulator_get'? [-Wimplicit-function-declaration]
  653 |                 pd->supply = devm_of_regulator_get(pmu->dev, pd->node, "domain");
      |                              ^~~~~~~~~~~~~~~~~~~~~
      |                              devm_regulator_get
drivers/pmdomain/rockchip/pm-domains.c:653:28: error: assignment to 'struct regulator *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  653 |                 pd->supply = devm_of_regulator_get(pmu->dev, pd->node, "domain");
      |                            ^

Add a Kconfig dependency.

Fixes: db6df2e3fc16 ("pmdomain: rockchip: add regulator support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pmdomain/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchip/Kconfig
index 7e4f9b628f0b..218d43186e5b 100644
--- a/drivers/pmdomain/rockchip/Kconfig
+++ b/drivers/pmdomain/rockchip/Kconfig
@@ -5,6 +5,7 @@ config ROCKCHIP_PM_DOMAINS
 	bool "Rockchip generic power domain"
 	depends on PM
 	depends on HAVE_ARM_SMCCC_DISCOVERY
+	depends on REGULATOR
 	select PM_GENERIC_DOMAINS
 	help
 	  Say y here to enable power domain support.
-- 
2.39.5


