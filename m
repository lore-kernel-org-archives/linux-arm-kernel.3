Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62F8D3A66F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFCEJ4g+q7FVoJLDbzrDAqZ6+sS4Dyw5icfXHcV/0Cw=; b=H4XrJjsMHAhh8SfVxCp/RhDXHs
	beaFvS5VmvwEvdNFtwwGxYxR8mdRBFhKCeMDsN7vlFX/HXtcB007wWrU8zCN2UzUUoUejyr3aFSyA
	o1K5nYM91140bnYcjNGbTq0Gitk8A5x9qFeDAyjbkYs9Av8KumK2zVbEaGoGStbCwcwP2DVdFthUN
	nGkUVJ/RGH1XRYRTTHwok9wH6UrfmSdjo/BMwCgqg7d0xZlrPZ/sM0bULSMAqtekF+l4yDUr2Agbt
	+ynDGIxSK6Kjq/bvfosr17c9LGvLPepQnz99GSn9zBFeimWxf86VRoJ3nus+e3dOHGzV9IrGTFTv+
	Ltz8d6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ou6-0000000F5f8-1zcR;
	Tue, 29 Oct 2024 16:17:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oRm-0000000F070-3JcM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 15:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZFCEJ4g+q7FVoJLDbzrDAqZ6+sS4Dyw5icfXHcV/0Cw=; b=kzcz+mjnevvOjfTqAQ7GyarJ9v
	lzfz57FbgVo0x6eY+VYGZcFyROcwwhyQRtQYsk5QLOa0LnR+T9dqthfEt/ChcohUGVbHqwwxYRCj/
	bEbsEFBxVRziOUSdrumZBzJZCq9A550Jp1TKKZaUsCVv18G7XLRdRZ/M6dmAYZH8U+f0PD86im6jW
	jy8mEPITJD+99mewBn+DAKVFQkXhPrefNPtSVos7HIEN7+H0yhtH4PpoRhtC6AsNU8/Ne/fBdauYE
	727/z7KAzdYNfGmnzUvruBAvHnrtIje67IiMC0jC3XZVcA/8BjJTqMWcPBqF9mnpcUd9mmVhPCRMu
	/RmP1yQA==;
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oRj-00000009vyi-0XkZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:47:53 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TFlkPw017478;
	Tue, 29 Oct 2024 10:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730216867;
	bh=ZFCEJ4g+q7FVoJLDbzrDAqZ6+sS4Dyw5icfXHcV/0Cw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eW8/+zltOf6AUZmJdCcZcmXWRgxGDmUcS07w1c8oOMjOmA8xuJWYFNWv3SIfu1pK0
	 bZy9J39TEUw16AfvV4XhGyhqet27z2cq8GPmO6LI+SEdD310qssMnmamFaNMYL2IJL
	 PJ8UF71jEHBEYSaK892yvzUDQsKLHgrORGFMN1c0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFlkLX007276;
	Tue, 29 Oct 2024 10:47:46 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 10:47:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 10:47:46 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFlgsq083593;
	Tue, 29 Oct 2024 10:47:43 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <d.schultz@phytec.de>, <w.egorov@phytec.de>,
        John Ma
	<jma@phytec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62x-phyboard-lyra: Fix indentation in audio-card
Date: Tue, 29 Oct 2024 21:17:40 +0530
Message-ID: <173021674668.3859929.14447889402443380777.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240926184849.3341986-1-jma@phytec.com>
References: <20240926184849.3341986-1-jma@phytec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_154751_664276_D256FA2C 
X-CRM114-Status: GOOD (  12.43  )
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

Hi John Ma,

On Thu, 26 Sep 2024 11:48:49 -0700, John Ma wrote:
> Corrected the indentation for the audio card node in the phyBOARD-Lyra.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62x-phyboard-lyra: Fix indentation in audio-card
      commit: 9130fc1b124cbcebeb11e3f7cf420a30fe545d26

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


