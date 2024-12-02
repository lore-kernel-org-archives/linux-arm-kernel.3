Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5B5E69E8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hB+Rsl8dEIP80gJg1dRpUGGywa9yjHgvJWWFP9MDZc=; b=pcD8BFulIWXNixvGelhi8KZgKG
	dGUpX/6scRiJ5/J2NR+oEL7oTyLICVU866XH96ierlcB4SM4s0wYueRMCVTBqDtk8B9nfqRy42xv5
	/w6V6p3iCXFxm3VDgueYQKkVkwXJIW+PdqqgGEAYReZ6eHjxADhF2qJ6jHAIvubqPl8irKvy7wZa+
	sqCuYbRuwyAqU1LiKpv0A54MbE0yI2i+S9ABlv66NDFU77cUdLSmU0xejMf2250u+G0sBPTD+xtoz
	epSmJTXOdlrZCYh1XcgvSiBdwMIyfAwfWMCJT7JZj/E4iyRJcJB6Mh9sDKdI8FP4otm9Hvk0cFCvK
	+pmkkfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tICNP-00000007Kku-2upC;
	Mon, 02 Dec 2024 19:46:35 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICIa-00000007Jwz-2Rko
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 19:41:38 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2JfAbX018430;
	Mon, 2 Dec 2024 13:41:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733168470;
	bh=1hB+Rsl8dEIP80gJg1dRpUGGywa9yjHgvJWWFP9MDZc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yWXLnTHwyw6OZErIdXaEl0iD3giWyOLXMsrm1kKc67jTA1r9YvNYEFDLLhKXFhYh+
	 nd2FlxCcZJ2Hik3hA3QqQnQfJoNraILyRB7usN8bs6ItTAdOfNMQz6xutiW/L4nXxG
	 jEcJdaX37p4LagWo98aDTsFEf7d4YByTkoudOuMY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2JfAe1018340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 13:41:10 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 13:41:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 13:41:10 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf8iN127393;
	Mon, 2 Dec 2024 13:41:09 -0600
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
Subject: [PATCH v4 2/5] ARM: pxa: Switch to new sys-off handler API
Date: Mon, 2 Dec 2024 13:41:04 -0600
Message-ID: <20241202194107.105119-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202194107.105119-1-afd@ti.com>
References: <20241202194107.105119-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_114136_661491_63CC0487 
X-CRM114-Status: GOOD (  14.07  )
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
 arch/arm/mach-pxa/spitz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 33533e35720f8..c0b1f7e6be874 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -1096,7 +1096,7 @@ static void __init spitz_init(void)
 		software_node_register(&spitz_scoop_2_gpiochip_node);
 
 	init_gpio_reset(SPITZ_GPIO_ON_RESET, 1, 0);
-	pm_power_off = spitz_poweroff;
+	register_platform_power_off(spitz_poweroff);
 
 	PMCR = 0x00;
 
-- 
2.39.2


