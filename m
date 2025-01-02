Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2815EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KRzsbvMENsTrlg9Ztig2dM8K4zAJ1LMlRz3b5yPmqc=; b=SsemtzKkk54mWIXjsGetUs9LK3
	y0Tmzf5LMc2BosO31NmivjqBqO5nAudTCVaJbEtpkcgcZ5ThwhOeSh8Noq44UPTbgPKDSSnvy/yBp
	H4W1aJ1hV+5evPha6PhCbHtO1WF0W4vraQbDg5y+CpkLKXY5KbI1M0CdWlbH/nszdsvb/HxkUGmHx
	w+9mlIA/z1rnkjqTjNocD8gI5oiRYAlnq7OJrEzSS6taC2ly8HJxaRvT4ilvwwEWTLftSrHcHKJy+
	4181ajYkUW0DEic0n8i57oSRSx7YxlLu7VPb1QKCD8nJT9WmT5z9+sRmbP7qMmz0SfjjYM4TNw+i1
	poHwboVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO5B-0000000Apes-11eK;
	Thu, 02 Jan 2025 16:30:01 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO3y-0000000ApYW-2pZT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:28:48 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GSb8l2271675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:28:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835317;
	bh=+KRzsbvMENsTrlg9Ztig2dM8K4zAJ1LMlRz3b5yPmqc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WMXYCqc2XX9guT9++m1IdKsjwXai3TAwC8m28OD9YZyNgT064ePdGVbK+XU9UiJAZ
	 0p0mRvWJQXweorXPOrBtBeCJ3B8014wNZg5VDnQCDhdGzpmOtP5TyE28aCGSjR9aZ0
	 2jUWi8QJiKsh3d/g1nAkn/J8Tdl15EhAILW1xuss=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502GSbiE003999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:28:37 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:28:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:28:36 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GSadW071103;
	Thu, 2 Jan 2025 10:28:36 -0600
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <s-vadapalli@ti.com>,
        <danishanwar@ti.com>, <srk@ti.com>, Chintan Vankar
	<c-vankar@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] arm64: dts: ti: k3-am62x-sk-common: Add bootph-all property in cpsw_mac_syscon node
Date: Thu, 2 Jan 2025 10:28:34 -0600
Message-ID: <173583529248.267284.3372351110403886202.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114165331.1279065-1-c-vankar@ti.com>
References: <20241114165331.1279065-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_082846_806681_ED1FE6FE 
X-CRM114-Status: GOOD (  12.92  )
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

Hi Chintan Vankar,

On Thu, 14 Nov 2024 22:23:31 +0530, Chintan Vankar wrote:
> Ethernet boot requires CPSW node to be present starting from R5 SPL stage.
> Add bootph-all property in CPSW MAC's eFuse node cpsw_mac_syscon to enable
> this node during SPL stage along with later boot stages so that CPSW port
> will get static MAC address.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62x-sk-common: Add bootph-all property in cpsw_mac_syscon node
      commit: 28596f0dbf2452a6629026cf4bd9763f2456be64

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


