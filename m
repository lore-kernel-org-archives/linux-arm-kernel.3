Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E13BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gIz69rx+O7g3l2dUBVUwaQsvlZ4QBJNSMujzHzSCeo=; b=VpTb7o0/RQtfftDf1NPU0AHn4F
	6S2YDN8EfgDt2qF46NRdUspqHj3h5S/BzCNYVOeQKezoLwrZgMjCMzD9YcTo6r85yEtdtW6Vm/jI/
	MMBXl60aAdQQQEVcoF9cpE2gFFDSt7pAMlgDlANrXbFUNGk+Ia9iPootWvZrFia9A/Y9UDVImVAOm
	UH6hyyY0cFDvzHP2QpClcE1aaNZTB7aWnlUUkrUcQHQ8KS6J+u5uHjzfL0FigATcYThvn/nY8lxpm
	WvTpmQQ1sBbv7vs8x8+eqsrXOqf51t9veqJ3ljX88H7IzhLsgJsGCBJexqO/ChDlXOcdAcLDexcza
	1bdScS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIz-000000024I2-1Zoi;
	Mon, 07 Apr 2025 21:46:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rer-00000001iSY-30DR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8gIz69rx+O7g3l2dUBVUwaQsvlZ4QBJNSMujzHzSCeo=; b=kPbB2dOgv/GFoSldL3m42SSQCX
	7d/mKA3CIhZTVim5xZZs6Pphp4Z7Cck/KSKMXXwItPtas2SpO5IzG3xubcEbEkC6QLn9mJ3/aQTux
	B5Kl13dszmhOmGN27hyIjtK4HwbmWh3ND7YKl4C1u3hBCDNt6ba8fOFrc3k336EtUmb6fPkYJdUAG
	+fVJzavWee6xw7N9qyUDyN+VPEnkEQfG1G24q4dE+VlgRMb/xsoN3QYDs0jwQkZpf00Si17uaYNHI
	cGyqYR6l1qTNf1Mms55yUzkNRY9fJygI6BlIZipK0V6Ti0xUESfEi+Gq5EBqwlP76f21hOFlltH4A
	7EiO0ePA==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1reo-000000086WT-2XFN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:57:20 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537IuslX1000126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744052214;
	bh=8gIz69rx+O7g3l2dUBVUwaQsvlZ4QBJNSMujzHzSCeo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FxvkF8mUMVXmYrbzAHPSuAjub7UYI6hag4RR6eqGRQOhL5fFddGupBnv6dxHbPUMu
	 nCsj7MpOQofo/CBa7I9weXUVHxHCPw4hL8w7ZRal7/i3Jrxzm5TXGMF0BjycoN97i3
	 SYHRvYO/XtARRDp30MMmYP1aEYwfK2kHhh6QrAM4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537IusvE093037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:56:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:56:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:56:53 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Iup4A094348;
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
Subject: [PATCH v5 3/5] ARM: sa1100: Switch to new sys-off handler API
Date: Mon, 7 Apr 2025 13:56:48 -0500
Message-ID: <20250407185650.411887-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250407185650.411887-1-afd@ti.com>
References: <20250407185650.411887-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195718_905746_AF743070 
X-CRM114-Status: GOOD (  15.29  )
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
---
 arch/arm/mach-sa1100/generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/generic.c b/arch/arm/mach-sa1100/generic.c
index 0c586047d130f..5383a26f51169 100644
--- a/arch/arm/mach-sa1100/generic.c
+++ b/arch/arm/mach-sa1100/generic.c
@@ -298,7 +298,7 @@ static struct platform_device *sa11x0_devices[] __initdata = {
 static int __init sa1100_init(void)
 {
 	struct resource wdt_res = DEFINE_RES_MEM(0x90000000, 0x20);
-	pm_power_off = sa1100_power_off;
+	register_platform_power_off(sa1100_power_off);
 
 	regulator_has_full_constraints();
 
-- 
2.39.2


