Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03729E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 21:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hTJ1sU7QR/6/dibeRrwOw2vrZKkscaaABpNVSnE0JWs=; b=VBzWntpZTlOD+nIeOXf00586HZ
	ot0phfwzNSrIDe3Z7poqWXNUILfhZlMSIEzqPNnkEFhPCkLfw4OF4fYvLVF1WsfJrJavZUUiF6XBU
	lLeFZJLCVlixa2+zCE9DMFHe2QKKVE5Ju7PMVjj9lw4yGS6ZpusFTQvyl+DB3JRipPs8wPIIchnEN
	R/STHtKNgOMtIDxGcnicPksk1jeeguWW5RzA97YrvxWe4VN6NsGVWEEOwD9uzxspb/tqsLnyLCj0p
	bFDQf0Bmy+vxHjef6MeOpkl3zvnCRfL4eRzLVnPYsZbSwiG0bm1vcifXLZetMrVr/r4CS5RhOEUFh
	xWxPdJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMHD-0000000Gz6X-3Hxj;
	Fri, 10 Jan 2025 21:10:43 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEo-0000000Gyfk-1UC1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 21:08:15 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL7rZI3170329
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 15:07:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543273;
	bh=hTJ1sU7QR/6/dibeRrwOw2vrZKkscaaABpNVSnE0JWs=;
	h=Date:From:To:CC:Subject;
	b=Jx/GnICQl0qukuVrTWOODnkRnC3IuDEuMDl9myG2HwFe7auzFV0JJKVvR76s/aHkp
	 zkwtMB6BYkOgKChVjUJ1Q6sINw/dXJmzSrxeqtrGysZgZ51fclkN8dMUWM82582Rjc
	 en3eCJHFifjzXZ68wEMLX4d1V83SxiwOgyYMydc0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL7r68031132
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 15:07:53 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:07:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:07:53 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AL7r9H018236;
	Fri, 10 Jan 2025 15:07:53 -0600
Date: Fri, 10 Jan 2025 15:07:53 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 1/4] soc: ti: Driver updates for v6.14
Message-ID: <20250110210753.exsx5yxmxpcdn64y@amicably>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_130814_438568_27C9B6C1 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi SoC maintainers,

Please pull
The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-for-v6.14

for you to fetch changes up to 202580b60229345dc2637099f10c8a8857c1fdc2:

  soc: ti: pruss: Fix pruss APIs (2025-01-02 10:37:14 -0600)

----------------------------------------------------------------
TI SoC driver updates for v6.14

- Build fixup when CONFIG_TI_PRUSS is disabled.

----------------------------------------------------------------
MD Danish Anwar (1):
      soc: ti: pruss: Fix pruss APIs

 include/linux/pruss_driver.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

