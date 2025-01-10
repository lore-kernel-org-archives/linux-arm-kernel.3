Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D76FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c2vzOiHUmpA75QtQSimbJ3xsOFiWjDLHRAn+S8DaIMY=; b=NQgOrhkoX/X6DdqzDZ3PPU+2Xr
	Lw0qJJ/G1d9OTeYqFYgQZ0S8FRLHH7uYYG0S7su6zRrQ7uQK04e+ICUTGMt++IH78FFazvoUU9aCr
	bX8SPQCxEG+QHawIKwLqoEQliugDWLY5TvnWbBFIObYah2pZN1sBxsRLDRij0C37YtfILRWCdlBVj
	NRfLPgjOWG0y2PRD4yNWFGjOIgBbw5JUI6FuhBEoIJjfLoWJTh7YagKg3QrUDPCYCULkLoZyp9CmV
	PCuzckx0EQEG9rB6O6hghHIRNYwHyWLfHcj/qt1+Tz41bkUsRmPxB8yH5oCvoxZOfqX05vhVWJyFY
	eT3vN06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMG2-0000000Gyyi-0Fou;
	Fri, 10 Jan 2025 21:09:30 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEn-0000000GyfC-1Oui
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 21:08:14 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50AL80RP005498;
	Fri, 10 Jan 2025 15:08:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543280;
	bh=c2vzOiHUmpA75QtQSimbJ3xsOFiWjDLHRAn+S8DaIMY=;
	h=Date:From:To:CC:Subject;
	b=GJJ5XHpyk+zbWJcZrsMrSwJ3lzf6OWRbsafgRoxid54y169EgVGUcjlfh0lqDf4Bx
	 MCFTNPAPCPGV0xaDuFIJJWBEs/i66EdpVVKdYvQy7PoXo1Ps8hrZmoOuUjXFioJnCP
	 Vk9YDLkJkOjNA41EzzoAKuF9gNdQVGrXYqgtZ6jA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL80Mh089692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 15:08:00 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:07:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:07:59 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AL7xf0033690;
	Fri, 10 Jan 2025 15:07:59 -0600
Date: Fri, 10 Jan 2025 15:07:59 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 2/4] arm64: defconfig: Driver updates for TI K3 platforms
 for v6.14
Message-ID: <20250110210759.fd6a3ed7q52zkpnw@rogue>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_130813_484894_5C0F1C40 
X-CRM114-Status: UNSURE (   7.69  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v6.14

for you to fetch changes up to 184caba444cfd4b90231de7d071b9966c115c29f:

  arm64: defconfig: Enable TI K3 M4 remoteproc driver (2025-01-08 09:46:14 -0600)

----------------------------------------------------------------
TI K3 defconfig updates for v6.14

- Enable M4F remote proc support for AM62x based platforms such as
  BeaglePlay, phyboard, verdin, SK etc.

----------------------------------------------------------------
Hari Nagalla (1):
      arm64: defconfig: Enable TI K3 M4 remoteproc driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

