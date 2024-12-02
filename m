Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336EAE69E86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gIz69rx+O7g3l2dUBVUwaQsvlZ4QBJNSMujzHzSCeo=; b=q3pQyQB2nzwMnXTtrRQF2KPd+T
	Azvcbu7ppXheLdhgLmt6p7f0Q9sQq6uZ8mKPPfBdIQ4P9cIjF+OMdAMCIFlEfCinW81L82ysbieJu
	AlglndHIq7RdwzFk7MzUsbHEQBYx5pxeFbRC2omQ+eSv7ll469XkYo5lvNhZWK3CxXVQosh8ml42/
	3cMAmWhAlzPETPaErdm84SDkPwDmolMVBC79VLGR9a0MFhMEnAJ6Ua0rUytORYtxwXJB1zLBxOprk
	c5cT+//H4D9RCVoNBaV6u4EHV4w1sgK2fQoGWUFv0crt+6judjoExEWUE++EJJXPXo1RKZP3p2EwV
	FvIudsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tICON-00000007Kue-1CFu;
	Mon, 02 Dec 2024 19:47:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICIk-00000007Jz3-1JUi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 19:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8gIz69rx+O7g3l2dUBVUwaQsvlZ4QBJNSMujzHzSCeo=; b=p/oeFzWS0LVJtacAnnzdRb4dYZ
	WduCjcCDh52idaAhuQbntCzIe4Jwb0l/XTVNdXRLmuclvxoFwww72mpnH1rNNsRk82O9vvxV2E1Q6
	ztACRW4SgIkm1PAUn4jQzeJvw5HKqonnxrWumg5t8q1NUoMwj7jfef5Lk5SFZ323WITVykKa8lHJq
	QEqX/9i/TsVAd6FNIlleDo0KGCihOAlBoGXE9mQB2UsGLHpfjEIuJaoLZJPRPH98wyGiuZTKt1E7Q
	ZF4Ea/zBv9a4eYST6Mnk9oV6jegU5VLhEm0Bja556aW/8h1VkOxWmXpdreT4K5I16ssEe5ASoWMpf
	b+1oJTGg==;
Received: from [198.47.19.141] (helo=fllv0015.ext.ti.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICIg-00000002FcP-0mC1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 19:41:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2JfBHg018434;
	Mon, 2 Dec 2024 13:41:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733168471;
	bh=8gIz69rx+O7g3l2dUBVUwaQsvlZ4QBJNSMujzHzSCeo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t62o3g685pCzx96mI0/dHENguE2daTXBpYrgLh0cn+WfgnPhOsx4Ad4tPHOuH5DVl
	 jI5vTfxmbYpfzLfcc4fSSDSxqnCQU54Wx74TOOLbonG3fpDlZCCp+9RQjE10eQH+k1
	 WpkCLDsfC75vGblnqkelqHwXxydf2Axg/O2QF+WY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2JfB4d073869;
	Mon, 2 Dec 2024 13:41:11 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 13:41:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 13:41:10 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf8iO127393;
	Mon, 2 Dec 2024 13:41:10 -0600
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
Subject: [PATCH v4 3/5] ARM: sa1100: Switch to new sys-off handler API
Date: Mon, 2 Dec 2024 13:41:05 -0600
Message-ID: <20241202194107.105119-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202194107.105119-1-afd@ti.com>
References: <20241202194107.105119-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_194142_619613_5DC9AB7B 
X-CRM114-Status: GOOD (  14.24  )
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


