Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CA8C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgW5g300tmRMFjEsqTbas4ZzfRhvbkRab1mKzDMSykU=; b=QtgF59BKvWQnwA9dW0XS+tRkq3
	ha8BlsEIGrHlUsjYhlxuL/3EmHnQk2D4TE9a9qlXnSN6w966H4lkPFDXdydv9VphVc3Tz/dwL/M1S
	DyRTWkZTVOoaSLJ0plTBxYusqC1WW8+aF5ofQGRXH2smNr3OZOQXdLsQ/kcVg/SrqW7KVxMWWv6Jp
	7WNfpSN2xJMyyYBBa89UOrulM0Vrzg9umc11lTvi16EFtfno4sdBOHNO23tRwOuH/GZoRtdnkjUW1
	z1s3IuleUaXiI3AK/xAMp7ozBkJ75wN/tYhDRxZUoYwLtcJWIc51P2NasBzYWFT7BfGerLP3DMjak
	65Dx+ktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Xx-0000000BInt-1sCx;
	Fri, 28 Feb 2025 14:41:01 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Be-0000000BE7n-3mQ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:18:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51SEHex32070698
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 08:17:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740752261;
	bh=bgW5g300tmRMFjEsqTbas4ZzfRhvbkRab1mKzDMSykU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QkLfy/jBDukeSUCA17i0+sePLLz+l7falK5ners/Flz6qW8kaYsgKsZc8JcN2rQlw
	 N9YxmgjU29wdPr3DMD3Bu0k2psvdPWpqJgX7aZXHbzEr0DYIQdXCJ4NzXnWzGzDeGw
	 aLK19hPiw0q1uX4fd3sqFkTuHgitjfU0MFcp26xc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51SEHe9p002644
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Feb 2025 08:17:40 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 08:17:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 08:17:40 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SEHe4M008459;
	Fri, 28 Feb 2025 08:17:40 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Meghana Malladi <m-malladi@ti.com>
CC: Nishanth Menon <nm@ti.com>, <ebiggers@google.com>,
        <javier.carrasco@wolfvision.net>,
        <elinor.montmasson@savoirfairelinux.com>, <biju.das.jz@bp.renesas.com>,
        <quic_tdas@quicinc.com>, <nfraprado@collabora.com>, <arnd@arndb.de>,
        <dmitry.baryshkov@linaro.org>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <quic_bjorande@quicinc.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        "Ravi
 Gunasekaran" <r-gunasekaran@ti.com>
Subject: Re: [PATCH v3] arm64: defconfig: Enable HSR driver
Date: Fri, 28 Feb 2025 08:17:39 -0600
Message-ID: <174075218769.3252220.16260362657554687998.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250227111828.1963918-1-m-malladi@ti.com>
References: <20250227111828.1963918-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_061759_030383_CB34FFEE 
X-CRM114-Status: GOOD (  15.27  )
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

Hi Meghana Malladi,

On Thu, 27 Feb 2025 16:48:28 +0530, Meghana Malladi wrote:
> HSR is a redundancy protocol that can be realized with any
> two port ethernet controller.
> 
> Many of TI's K3 SoCs such as AM64x and AM65x support multi port ethernet
> controller. So enable HSR driver inorder to support this protocol for
> these SoCs.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
I have had to slightly improve the commit message (answering the
question: "what is HSR"), let me know if you dont agree with it and I
can drop the patch from the queue in favor of an update.

Thank you!

[1/1] arm64: defconfig: Enable HSR driver
      commit: 44807ecfa6394d8a4764775998f5dde18ec4377c

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


