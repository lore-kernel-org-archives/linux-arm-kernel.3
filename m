Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2661C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C51Vw6EdNVniNG41V7LhTSrg7eW06Bz8eJBE8EVbadY=; b=D76zCdcaica55Wy+ES4QRgsdbl
	vlrClgPUlE3D3aOXr2oTq+uHs2RcDuqk6QJx3R7E1RuCejsZWhf6updELqT8RrXV2V5Eq6GrROPZa
	ZbLdt4+hp4YQOxnzLWq6gkgH9KjnHJwlzJK1P7Ai8cUeoa+JFgYvHkC++Mdj8N+hkbImBLzKy7ys7
	sCqK9G/JT30tyDAwJiF0ouBV5HQisEnkWfA0KYKiUkuryyicOCSo9KH6lPncOeamViUSRsh+g05Yp
	84zsEZNn85FV8nTkIUgJ1LjTuedFY6Mu1abOdQ5YG1Kh9LaBZyhbvDdN23N1b48UCjXvaGXqcjfsl
	bN5zZC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBsi-00000007M69-1wex;
	Wed, 12 Feb 2025 12:30:20 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAvY-00000007BBc-1Dth
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:29:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CBSwmb517174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Feb 2025 05:28:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739359738;
	bh=C51Vw6EdNVniNG41V7LhTSrg7eW06Bz8eJBE8EVbadY=;
	h=Date:From:To:CC:Subject;
	b=w7LeVGsSvss9bMhGYL3IUIHV1719PQQeOwqpeloNcrL7uwsXckmgLF8aRGUpIhRWm
	 vrXYAcglzmFjOcxTUtDkOQsknBJQ9HsIqobULdnbUmjBh/LNCBr1tHMWi+tH44wGeB
	 VzAqFubKIXUTlgDTb8USTDFsiWvwE6uI8T5eHnOI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CBSwsE033857;
	Wed, 12 Feb 2025 05:28:58 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 05:28:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 05:28:57 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CBSvmO075174;
	Wed, 12 Feb 2025 05:28:57 -0600
Date: Wed, 12 Feb 2025 05:28:57 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: SoC <soc@kernel.org>, <arm@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tero
 Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth
 Menon <nm@ti.com>
Subject: [GIT PULL] arm64: defconfig: Fixes for TI K3 platforms for v6.14-rc1
Message-ID: <20250212112857.pm6ptaqbx545qnv7@eternity>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032912_509748_EE276176 
X-CRM114-Status: UNSURE (   8.31  )
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

Please pull the following which is part of the fixes required to
restore the behavior of all TI K3 platforms.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-fixes-for-v6.14

for you to fetch changes up to c7691aec5e991cec9c5c5fdab08c24856a1fc56f:

  arm64: defconfig: Enable TISCI Interrupt Router and Aggregator (2025-02-06 09:10:24 +0530)

----------------------------------------------------------------
TI K3 defconfig fixes for v6.14

- Enable TISCI Interrupt Router, Interrupt Aggregator and related drivers.

----------------------------------------------------------------
Vaishnav Achath (1):
      arm64: defconfig: Enable TISCI Interrupt Router and Aggregator

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

