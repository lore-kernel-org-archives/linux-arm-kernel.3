Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BF9C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DDSNdi1Vm7CF1r5MUhXK3gIEzhoSFzXZa431fz1lzU=; b=Gs2XWBrpkooDjI/vgqNVVUj89a
	4lDQ/h5oBr0SigC/LauQXgdZEHFc0C0ASg/jg3s4o8Hiarr7e5T1DBfLxdATvY5FE2URF9TVEXGR4
	BpfLIUUGIRbVhDdusB2AcjzlRv6O8yfPOJT+c3god0raLHvhAXBbSWtbPxu/J+cRDrHHaI/3OB79s
	KX0MPwz3ab04Tj62K93ZvHkSKRcN2hIFifyK1s3ztqgt04uMJm9Wp55J9Kykd3MYt3zsejJEwWFn2
	p0QFfbkNfj6peQOUBmhjg8rN7qZyM7IjWE1VXz9+BbyP6OHtuxmjdOnxCcujy4iEQwd2TOz2wDgr8
	2GOfZqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIx-000000024F4-2f7p;
	Mon, 07 Apr 2025 21:46:55 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rej-00000001iQn-3JZm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:57:15 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iusmv316741
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744052214;
	bh=9DDSNdi1Vm7CF1r5MUhXK3gIEzhoSFzXZa431fz1lzU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eHyiPm95etrO5lg6pieTn5132+O+HC9GgCbDlhR3kFsLpsjI9Ai6mxh87PuXxra4S
	 aZAJPOlN4/K2Y5WccNbVryrtax4FrtrnWFMkYFJQH9A+AQitjSq8CrUi+x7cZ2/KLA
	 C3tfBL+q28aZDmMfsLhajeVp6eRwWgx4Aw5y2V/4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537Ius9Q012013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:56:54 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:56:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:56:54 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Iup4B094348;
	Mon, 7 Apr 2025 13:56:53 -0500
From: Andrew Davis <afd@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>,
        Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik
	<robert.jarzmik@free.fr>,
        Alexey Charkov <alchark@gmail.com>,
        Krzysztof
 Kozlowski <krzk@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v5 4/5] ARM: vt8500: Switch to new sys-off handler API
Date: Mon, 7 Apr 2025 13:56:49 -0500
Message-ID: <20250407185650.411887-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250407185650.411887-1-afd@ti.com>
References: <20250407185650.411887-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_115713_870982_78795C47 
X-CRM114-Status: GOOD (  14.35  )
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

Kernel now supports chained power-off handlers. Use
register_platform_power_off() that registers a platform level power-off
handler. Legacy pm_power_off() will be removed once all drivers and archs
are converted to the new sys-off API.

Signed-off-by: Andrew Davis <afd@ti.com>
Acked-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/mach-vt8500/vt8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-vt8500/vt8500.c b/arch/arm/mach-vt8500/vt8500.c
index 0ab40087ae1cc..1d294255d7083 100644
--- a/arch/arm/mach-vt8500/vt8500.c
+++ b/arch/arm/mach-vt8500/vt8500.c
@@ -141,7 +141,7 @@ static void __init vt8500_init(void)
 			pr_err("%s:ioremap(power_off) failed\n", __func__);
 	}
 	if (pmc_base)
-		pm_power_off = &vt8500_power_off;
+		register_platform_power_off(vt8500_power_off);
 	else
 		pr_err("%s: PMC Hibernation register could not be remapped, not enabling power off!\n", __func__);
 }
-- 
2.39.2


