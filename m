Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F09BD0C61A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRcCTdSejW8+iOS93KvoPizMVm8TpiE5IkMaGG4/+o8=; b=tl70ZWpevggOhNdE+5geUVrKtV
	TWkrpqxi+X4GwIiC/tx5/bP8TDOlKLXMMZ/23+Bgk0AIG8TRxuub5+5QJ0jyVecsXRthUsUJbcWcL
	Ftl3GAmjh0O0gDGDazCgadxLrXN9qRgx2ryQ0+mTMigQ3YDeO5/EoXTQnGww6BiDWfzCIvehYBEio
	vKMDRLhJTRl5DP8mjMbFMTIJst1k3zjNmKnYb6N/FCXunzhovfijPCxOGC2IyCUBYNNazhVRTyNzI
	6rOKAeafDduS+eb6cezrUdjhFVXrlPGIFssu38eV4/H1mQ4erT8ui1XHGRauzf6B4AtqESs/4Yd4N
	RJYrn77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LMM-000000041ur-104e;
	Fri, 25 Oct 2024 14:32:14 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KtC-00000003v2p-1gK7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:02:08 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49PE1kpx086025;
	Fri, 25 Oct 2024 09:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729864907;
	bh=lRcCTdSejW8+iOS93KvoPizMVm8TpiE5IkMaGG4/+o8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vgqx8AoMN7sIfG3zQKGxLA2V1LWuEyzkZdVanEYVkqKLfVjX0uqLRn3XyULMEhfcQ
	 YZvCJP/p7bc79bELEsyeKrwzZiG0UYlYvU6F3Y/xlViPAtomkjzvWc308cyw0wEGnm
	 Zyd69ZFLuoUymP8HMmxn3lXT/5hztDbNvsBaELBI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49PE1kHN032231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Oct 2024 09:01:46 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Oct 2024 09:01:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Oct 2024 09:01:46 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49PE1kJR100803;
	Fri, 25 Oct 2024 09:01:46 -0500
From: Nishanth Menon <nm@ti.com>
To: <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Jinjie Ruan
	<ruanjinjie@huawei.com>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH -next RESEND] soc: ti: knav_qmss_queue: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Fri, 25 Oct 2024 09:01:45 -0500
Message-ID: <172986489161.176473.17779530320555555541.b4-ty@ti.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914082532.344456-1-ruanjinjie@huawei.com>
References: <20240914082532.344456-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070206_594650_DA3AE2EB 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Jinjie Ruan,

On Sat, 14 Sep 2024 16:25:32 +0800, Jinjie Ruan wrote:
> As commit cbe16f35bee6 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
> said, reqeust_irq() and then disable_irq() is unsafe. In the small time gap
> between request_irq() and disable_irq(), interrupts can still come.
> 
> IRQF_NO_AUTOEN flag can be used by drivers to request_irq(). It prevents
> the automatic enabling of the requested interrupt in the same
> safe way. With that the usage can be simplified and corrected.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: knav_qmss_queue: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 10b8a0cc84d28decb75bfc91f4395e176228a4ff

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


