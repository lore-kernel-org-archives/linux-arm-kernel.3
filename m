Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBC0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5EA4gp+ZNDKprhGpH++99VsFnGY6WNQsKRBkIsPWLg=; b=E1LyinKcKASH35AGtx9wxJRV4C
	cVKWc0Q1eZXf2xm+RDmWYidP2sZHleXHwNJH1ZYuFxk0sL8icUn79cXeSZN1dx8QfecrmhuIWBYEZ
	/x/qWSAHMSJe0c9+fUHG59qfN9aqovdR+FgAM1Bva3eGaVKO36QohHPy5ogzKOm9wa150gTOd3sff
	7+dy5MCx1J4jvDJVTgG4g2KmAkP057oNwJN9qK2TYDWYo+UyrksTtr3Wa3o/cnXfFWpA+GuyQIpRe
	58uoUYdcguV1qTkjn94nXbfpM6X0kzaJWYNV2ZtXq+FZA9I5XSlEBJBAGL4GKlivn/K71ssKd5koI
	ZzQMqNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojE8-0000000G3e7-3I2l;
	Sun, 02 Mar 2025 13:19:28 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojCa-0000000G3T9-1DVs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:17:53 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522DHlu83080606
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 07:17:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740921467;
	bh=G5EA4gp+ZNDKprhGpH++99VsFnGY6WNQsKRBkIsPWLg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J19nTZ/LYPJC/UEIN/OgMtRkA0ljQxonZab+z/+PX04BgDYfKGLhVWtxioh30KBXv
	 er8cw9leyhy9wdbDsq+/zk5KcK99cinR2QlLEv6PsJFLDzOht5XW3FY7NGsWxuVQWt
	 zWg3tzX3B+88L5kKdTNH4841/DKuheT++Tzzrruk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522DHlED016487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 07:17:47 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 07:17:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 07:17:47 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522DHioo115614;
	Sun, 2 Mar 2025 07:17:44 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tero
 Kristo <kristo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Reserve 128MiB of global CMA
Date: Sun, 2 Mar 2025 18:47:41 +0530
Message-ID: <174092143357.3272913.16342762135985998493.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131173508.1338842-1-nm@ti.com>
References: <20250131173508.1338842-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_051752_466238_8BE419C1 
X-CRM114-Status: GOOD (  12.55  )
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

Hi Nishanth Menon,

On Fri, 31 Jan 2025 11:35:08 -0600, Nishanth Menon wrote:
> In the same lines of commit 9e8560556f9c ("arm64: dts: ti:
> k3-am62x-sk-common: Reserve 128MiB of global CMA"), reserve global CMA
> pool for:
> 
> LCD Display: 16MiB, HDMI (1080p): 16MiB, GPU: 16MiB, CSI2 1 1080p
> sensor: 32MiB with a 32MiB set for other peripherals and a 16MiB
> buffer.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am625-beagleplay: Reserve 128MiB of global CMA
      commit: 47ab49247b68423c399717f2c8623e7f5d70153e

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


