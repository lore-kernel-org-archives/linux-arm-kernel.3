Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D98EE69E94
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 20:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pn8eSTUe12a9qvKo+zKnPKpjS9szyd/Lpr/Ci+nt4Fc=; b=LzJuhef9KkNfUdU9GadvEY/jpi
	syMqZwvXf8XZVPMynh8A0YHaWR3vqHS1KD4bM83keuTKGPfUd+h/9uYO7nUK6HJJDWlFT8Od6VtdH
	r95F21CS6kpBm8zw5MkbQfabzKfXfxkqndXRsCZTMoO3ad83BPXwkJLXfP/ZTPz++/wfJkavWIIfK
	K+JpMnteqPSqCNbatx3kw1o5BvZuvTM+h6/Ntc4NUpQj5hjwnAzDGXIsWeeq30bxvL4qotJgheCOd
	oTNCkrE+5w/YQlODdpOzTimpopTMk2ajlfVlrPxAhm0eWsfgDmCleVcuoqND5CugPsxpXD/SDLYzc
	G1JG1Ntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIDVH-00000007TB1-2YaZ;
	Mon, 02 Dec 2024 20:58:47 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICIa-00000007Jwy-19dN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 19:41:37 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Jf9lX1777088
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 2 Dec 2024 13:41:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733168469;
	bh=pn8eSTUe12a9qvKo+zKnPKpjS9szyd/Lpr/Ci+nt4Fc=;
	h=From:To:CC:Subject:Date;
	b=rGZ2UQZlyTutS9HlG7KOnvww9jInzBxpmHEhaqzOPWlCIo3EAJfyjlgGd5KQwoQ4g
	 LvdH5tRnJFnnWrKFeFrDXyCSSAKwp3jVeP2lzpptJecgucUqfZrT4wQimmYZMZyJcn
	 VxOBnZWy3IoAosbhUb9IZwQBIjSeZ6jb3Hn2a6zM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf9o8073856;
	Mon, 2 Dec 2024 13:41:09 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 13:41:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 13:41:09 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf8iL127393;
	Mon, 2 Dec 2024 13:41:08 -0600
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
Subject: [PATCH v4 0/5] Switch more ARM plats to sys-off handler API
Date: Mon, 2 Dec 2024 13:41:02 -0600
Message-ID: <20241202194107.105119-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_114136_355601_EFA9627F 
X-CRM114-Status: GOOD (  11.17  )
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

Hello all,

Continuing the quest to remove the legacy pm_power_off() global
function handler. Remove uses from arch/arm/ using the helper
register_platform_power_off().

Thanks,
Andrew

Changes for v4:
 - Drop already taken patches
 - Rebase on latest master

Changes for v3:
 - Rebase on v6.12-rc1

Changes for v2:
 - Collect Reviewed/Acked-bys
 - Rebase on v6.11-rc1

Andrew Davis (5):
  ARM: highbank: Switch to new sys-off handler API
  ARM: pxa: Switch to new sys-off handler API
  ARM: sa1100: Switch to new sys-off handler API
  ARM: vt8500: Switch to new sys-off handler API
  arm/xen: Switch to new sys-off handler API

 arch/arm/mach-highbank/highbank.c | 2 +-
 arch/arm/mach-pxa/spitz.c         | 2 +-
 arch/arm/mach-sa1100/generic.c    | 2 +-
 arch/arm/mach-vt8500/vt8500.c     | 2 +-
 arch/arm/xen/enlighten.c          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.39.2


