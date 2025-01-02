Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AF8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E00Qza5CkvXW5/CnbnU2/WLzw/Wp+QPWyLFHz/ijnEk=; b=ZaECn+HXI8YB2W7qYqJVUD+bsb
	TUb8tD0Mu7S5G+qKF1uGb/DLvODw8pWgityt5REpG+Cgqr0463gbie/SSpGgg63q+Hl/I7/mfYpmo
	znfAUH3IA3TMD7X6gG76VUO+Oq2cjlZtHLyyDxFStwq6kypqSMHTBYkegs0ouSN0x5OFeJeCGt1fe
	Zvh0RCsCSjYuy69iyvZf/FSYmi8dttfhaJarubPpfx9o+ImiH0q2U8G51gffG5xSa+ZJql7/4/It4
	TW14mhaydmKkFihf16XaWiQE/Xy51hGoFYHCxGnfD2qA/hQmUq/JHBUOQMkEVAi0o4nRJl21qz6ey
	Vcm6zIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOHM-0000000AsT5-3hWb;
	Thu, 02 Jan 2025 16:42:36 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOG7-0000000AsIa-02Fn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:41:20 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502Gf85m2272880
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:41:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735836068;
	bh=E00Qza5CkvXW5/CnbnU2/WLzw/Wp+QPWyLFHz/ijnEk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rqbRlcPCYUCtxf3vUBZ0sVdF7pvTzwvCmuemSf3K1A6rkQFc2cAIQV5l7LfForUAo
	 8K/iRDBSwUCs73iOcHxnPcQBmkqTKcCt9GgvCXVMh9dda5ekwT9doPKtkNUSJxl29d
	 JWhQHhjPCOHL00zaInHY/utqAQoFRlQ0ACJvq/og=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502Gf8on011657
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:41:08 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:41:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:41:08 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502Gf8nr085583;
	Thu, 2 Jan 2025 10:41:08 -0600
From: Nishanth Menon <nm@ti.com>
To: <tony@atomide.com>, <s-anna@ti.com>, <horms@kernel.org>,
        <ssantosh@kernel.org>, MD Danish Anwar <danishanwar@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH v2 0/2] Fix compilation errors with pruss APIs
Date: Thu, 2 Jan 2025 10:41:06 -0600
Message-ID: <173583593915.271394.6644650788389470248.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241220100508.1554309-1-danishanwar@ti.com>
References: <20241220100508.1554309-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_084119_144441_3BC43CB5 
X-CRM114-Status: GOOD (  14.02  )
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

Hi MD Danish Anwar,

On Fri, 20 Dec 2024 15:35:06 +0530, MD Danish Anwar wrote:
> The APIs in 'include/linux/pruss_driver.h' produce compilation errors and
> warnings when config symbol CONFIG_TI_PRUSS is not enabled.
> 
> This series fixes those errors / warnings.
> 
> Also the header file 'include/linux/pruss_driver.h' is orphan and has no
> entry in MAINTAINERS file.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].

[1/2] soc: ti: pruss: Fix pruss APIs
      commit: 202580b60229345dc2637099f10c8a8857c1fdc2

I have applied the following to branch ti-k3-maintainer-next on [1].

[2/2] MAINTAINERS: Add entry for linux/pruss_driver.h
      commit: 31bd1f4517b651e132fae7cbb5f63b190015da94

Thank you!

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


