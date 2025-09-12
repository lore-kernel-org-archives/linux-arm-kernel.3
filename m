Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B175BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGxK3+nUDShNX5RD0otP1DIRgNRelbVrozYCdzGyYLs=; b=0TkrGOVTkceEb1l/FZcwxxFW20
	F8Vu6tsKtNvGGylaOQrmxDItucXMkeh6c7/fcRqebTDWx5cfgqTY5BeGhuX5YrKFsnJw+Y/3VKzGL
	O98aUERUnvX45ZrNYiA40i6OzsjV/6b2Mu86ebQTnz4uad2PVxqp3Ulr9ayUjUfkzK0ZuYO6/NFPl
	9cGSI5yxuDSlpdCRNVVSYaY5ypMkuaKLHwBmQB9bP6t+8nC58kke/0WAfCGc5zNoVueF2vKY/Kmdp
	8uAsaRxrKTrYNq7/RBiE3XzaR0rDINr5CV/6Dr3WEiQAcgR6ohxWfyEV2f9T4y6tSkCMeIamkuVeN
	qCODtfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Op-00000008Nct-3ase;
	Fri, 12 Sep 2025 09:48:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Op-00000008NcC-0GRz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EGxK3+nUDShNX5RD0otP1DIRgNRelbVrozYCdzGyYLs=; b=moh9w2o9v8mUj3mS2tTF4R9GlY
	JvTA9vuR8FU/RfaPU3ZQPDE94YDum9k5NWibBK2OjUAjXymIPOXzkjWtdXSktetIYET9E+293w1ui
	7wgOsxiz/G7q8VLaZlYhpo+X7eV0w24Z55igJFdUUVUTJBttv2NAYS3OeELTXCm+w9g/lhqfh5wXS
	jBl7ieA9BC+emuboi+hcR6G/sT1yWR83fQ4xt7u/vr3H14xNW+64pBdq7FfJ4BOK2HZeXTe3Iu5YC
	I3FOk/FbcSAlWDatDj7UzdLSqrQhjY7d3UXonZdC+srOXYKk7qlzh2Ol22wsjZpyfLyJtEArcvl2d
	E7+MVdGQ==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Ol-00000006JNf-2gqE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:48:57 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9mm5q579991;
	Fri, 12 Sep 2025 04:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670528;
	bh=EGxK3+nUDShNX5RD0otP1DIRgNRelbVrozYCdzGyYLs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uTR3NtC/bik/LQGWHimx0CEUt1VZWX+hgHdaZo5SGlyfX6ViPXZEToSQYNNbTGH83
	 rSh9C1Ll4fUmsjunFdfBKPRT8XrqW7kKQDdFROpXuv7aKEWgj/JCzBzzq3X5WE/GUO
	 xrpMCQBZj0+ZnhYMG2oOn54UQw31c2pWXYEi1DuQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9mmTu1774944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:48:48 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:48:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:48:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9mlLS3715784;
	Fri, 12 Sep 2025 04:48:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>, Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: k3-socinfo: add information for AM62L SR1.1
Date: Fri, 12 Sep 2025 04:48:44 -0500
Message-ID: <175766773687.25324.14122074690665057486.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250908-62l-chipid-v1-1-9c7194148140@ti.com>
References: <20250908-62l-chipid-v1-1-9c7194148140@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_104855_891692_1BBC6D99 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Bryan Brattlof,

On Mon, 08 Sep 2025 14:15:28 -0500, Bryan Brattlof wrote:
> The second silicon revision for the AM62L was mainly a ROM revision
> and therefore this silicon revision is labeled SR1.1
> 
> Add a new decode array to properly identify this revision as SR1.1
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: k3-socinfo: add information for AM62L SR1.1
      commit: 037e496038f6e4cfb3642a0ffc2db19838d564dd

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
Nishanth Menon <nm@ti.com>

