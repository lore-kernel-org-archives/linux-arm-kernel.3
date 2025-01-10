Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD22E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 21:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r/ue8Aiufy/wDZ3a45YXCfTJFJXDyUS9LLmOc/rSl44=; b=OSOiAJHSzCVOpLncphU4ZLug25
	hK/70d6oyK62M2Brhgzng+qSelws3HhkGvA/DB10kdBtmSw2Wyk/qUeGYG4EOp+e8gCO3+3Z5t/uE
	2L6Zgh7FjX9IeVzkK2BwtC8uIQhi61F2BLu9wjHCS6/yx3z6iNOvButNKV3gieFMbyA5+Ut466KaL
	Pqy4oDVg/QhlQTYjSzAYjlGhuf6lvk76Eqv/fgggMkalxoDxClh+6kiAvk9LXrCADy51de15BXw7H
	PQdIyeUdoid0zaQuP5x4KS7nM0BdF5pw/iO5gnEHvKg9wzuLxHBFDu2qp3iIew2uKES5KuCslEFUD
	QFBOXxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMJc-0000000GzKv-0TWQ;
	Fri, 10 Jan 2025 21:13:12 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMF9-0000000GynA-2zGO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 21:08:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL8Qa33468797
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 15:08:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543306;
	bh=r/ue8Aiufy/wDZ3a45YXCfTJFJXDyUS9LLmOc/rSl44=;
	h=Date:From:To:CC:Subject;
	b=k44kWVsgWgbYhmIgJeQr4L2mChKNVOgqLSLb7yIKrVv+eV7Ucwe+x1/QqkbgiuAw9
	 ANIhqZjhXlumYKyIChtPXEfIkA13BtCcn31bpOKiK8PPNDf9f+7IXuF3JeoJ80kZO6
	 wshTwOela3fW4e5wgvGeXWkeF+DPd6sRnlc6maR4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL8P7K031422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 15:08:25 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:08:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:08:25 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AL8PBN034126;
	Fri, 10 Jan 2025 15:08:25 -0600
Date: Fri, 10 Jan 2025 15:08:25 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 4/4] MAINTAINERS: TI updates for v6.14
Message-ID: <20250110210825.emk6zh4tfc6obv26@celestial>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_130835_794487_DCF5F7E8 
X-CRM114-Status: UNSURE (   9.70  )
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

Note: this PR could potentially go with soc drivers as well, but decided
to keep it separate to allow your discretion as to the path to take.

Please pull

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-maintainer-for-v6.14

for you to fetch changes up to 31bd1f4517b651e132fae7cbb5f63b190015da94:

  MAINTAINERS: Add entry for linux/pruss_driver.h (2025-01-02 10:36:36 -0600)

----------------------------------------------------------------
TI Maintainer updates for v6.14

- Maintain Programmable Real-time Unit Subsystem(PRUSS) SoC library interface
  header linux/pruss_driver.h

----------------------------------------------------------------
MD Danish Anwar (1):
      MAINTAINERS: Add entry for linux/pruss_driver.h

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

