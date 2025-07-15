Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9983C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 05:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6AUnD9ldoupswdNyYd5yQBpwXm4lWNRcfH02OFGIUw=; b=lqL2fiXnUe3GFD3oKYkO9LbpHg
	MrfDQlq3UcNLiL52dld1/aW0SI+IUdUjLEsuKR4d0UJMQAKg1napCeO6BvsTquzrYxXLzdHs/mHUo
	GNJtb/I986MsXxJmH01MZg7tXLNXXi7kyvywlZAxlGaVtwyodHMlA0hE0FSX6zyOBKqM/kKDe/KM1
	hfYtKBpQ96FdTCnaD2BylQR3y/TRdN59E4SLSXKEhKEX6JPB0huV8JefFnvd2RQR2aYpYpH9Klb7r
	AY8VAVGJI84ij/jIU0/H6Ns1yx13OzFTNUBzlD0CuS5fivfb8s5HS184rip7E8W12McDjK7/fGCtj
	RO/x4KHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYIt-000000047Er-2W35;
	Tue, 15 Jul 2025 05:34:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYDZ-000000046Yb-3UXN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:28:43 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F5SbfV2816878;
	Tue, 15 Jul 2025 00:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752557317;
	bh=Y6AUnD9ldoupswdNyYd5yQBpwXm4lWNRcfH02OFGIUw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JA8YKoe/7l0GGcUete/ZFMMBunpjDfgH6Gb5caMwDwCvs4dds8Qoxnr6zuo0QouCn
	 Jp41skGTlgFocXdwX6uBEemRbO/dL3Sb4qRT75mqdgxl0rd47XXQiBj7WH9saczdV9
	 yppZ/TItlrO6N1Pqr6JMdowWu/DUeRyhoCmAumLc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F5SbIN1036826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 00:28:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 00:28:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 00:28:36 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F5SWFb2336977;
	Tue, 15 Jul 2025 00:28:33 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Hrushikesh Salunke <h-salunke@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-sk: Add idle-states for remaining SERDES instances
Date: Tue, 15 Jul 2025 10:58:19 +0530
Message-ID: <175240652599.4073742.16760471366856167468.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708113942.4137917-1-h-salunke@ti.com>
References: <20250708113942.4137917-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_222842_115098_8E80C9E2 
X-CRM114-Status: GOOD (  13.06  )
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

Hi Hrushikesh Salunke,

On Tue, 08 Jul 2025 17:09:42 +0530, Hrushikesh Salunke wrote:
> In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
> "serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
> property. But "idle-states" is defined only for the lanes of first two
> SERDES instances. SERDES lane mapping is left at its reset state of
> "zero" for all four lanes of SERDES2 and SERDES4. The reset state of
> "zero" corresponds to the following configuration:
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am69-sk: Add idle-states for remaining SERDES instances
      commit: 974e6cfd8d7b61c3fa27a9dd6ed452b7e7a06de9

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


