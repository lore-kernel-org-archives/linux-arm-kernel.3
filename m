Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC34C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HDzsSj8clkMH6rJzicxNla6A2ITDCMSWqNF1pdoY+s=; b=KIGea+OxInxd3Omqq30u95VeQM
	SRDatSNOxNQABUtkmqhLTzcFznl1NUC2LmuX2AnqaDtvOFeTf++nGxUHR/1jTG8Qj+b/1S3wOPP7J
	Ug/Oz2Gu0jTQGTzTkdB4xtbx0vboB8F5x8i3/UCjn26xmAnmYSGM5siThf6yUFrvCPK2hyTD7l8xM
	sd/1tLgsyu7KS98pyEvZPrrHZZ0W5aow7A00acl/neifW8N7xhEaVyY8QOH4He8DPp/3O9dZ4mBys
	I7ss34JV19lXaKptFEH28o1lohlTF9gzlNcRWsEXp+a3WeH/51PT+qxTa4pFOJM+ASPYGbkcPIqco
	EUMEN6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUA1a-00000006k1G-3e2p;
	Tue, 24 Jun 2025 20:13:46 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8by-00000006XEX-2QNt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:43:15 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIh5Yu1931905;
	Tue, 24 Jun 2025 13:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790585;
	bh=6HDzsSj8clkMH6rJzicxNla6A2ITDCMSWqNF1pdoY+s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cX+EZDo9LGanEgCMfbHE+QMXMjx5anTWXre2gynTIl3gQfYkOTpLhQAWhRYz+1cu2
	 r8gAQD5WIIZD0h3gGE5ctMcOyK5eysHOLy79kyf7Ip5Re37yUaxRlrYa3e1gdtvLrH
	 Q1evsxDl0iIM693nVvmKDLsRvRMBhcREUzUt7BWk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIh594262823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:43:05 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:43:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:43:05 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIh1YP1990105;
	Tue, 24 Jun 2025 13:43:02 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Nishanth Menon <nm@ti.com>, Guillaume La Roque <glaroque@baylibre.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        <vishalm@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for ARCH_K3
Date: Wed, 25 Jun 2025 00:12:49 +0530
Message-ID: <175079051631.1872397.9030558754679240250.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_114314_704083_88BA0204 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Guillaume La Roque,

On Mon, 19 May 2025 10:20:56 +0200, Guillaume La Roque wrote:
> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> select on ARCH_K3 are not needed anymore.
> Select MAILBOX by default is not needed anymore[3],
> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
> 
> Remove it and give possibility to enable this driver in modules.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: Kconfig.platforms: remove useless select for ARCH_K3
      commit: 631ce8f743a5c85bd7f0a5e7dcca70566d88f43f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


