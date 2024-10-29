Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C9AD3A66F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLjfUODQODOaRX/d1s4wSCIi5iG+h1DU0f5TSsQNgoo=; b=RgE1a1VST5YIFUqak84LJX6W5c
	9WY6ugXNshg1t/8o+uQA2njEsgPs0JywwUtm5petoDy6N03WI3Hawt5OS0qkjCTjn0CAyZZLU2Fox
	q2mzJpbZZB/v0hmiZUP3Ml7EjVwUC/sm7ot1RaLic46X+JWM4M6TrVj+S0J/+lzdguV30Y3ueRzcf
	B4f+F0VaCXfLtn9mhcpIaipslnb3lZjl+5M73uX3LJslpF9EPcV6HvUyexVcFRI+yJ0Vi6k+QLDOG
	xJAflC+/OEKRKIj4Vq+4+RPMzYwz4bGUE/rpGjUb8mO8kn/5KQBv8Wo9CrNiG5zOyGIlooYaNOmia
	yYlOIHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osT-0000000F5CB-07B9;
	Tue, 29 Oct 2024 16:15:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oRV-0000000Ezy1-1zti
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 15:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GLjfUODQODOaRX/d1s4wSCIi5iG+h1DU0f5TSsQNgoo=; b=mhtk71SiWTXqEXx1xHNpLc562K
	4vRbSIflbWE4gTu2tzXVOpbStUamVkLGg3kzfvTOxbDlMU0OXbHCRHgOimwwv1HX2OXe02sZyH5tj
	nToE0r1hOBs3nph5ezeVZMY30vYNoyKlWcOX3c1ZiqUM0Z26ZbQep/fvnP0yBQSZG5w0Wn15nI8Wc
	iu8yygWwmmVcqRP0RLWVWQBC6Re2C1QHJLASOtZ1aCjAecrIElZNlAYw1fX9oCoVptIjjceB9f313
	ZtJO/Qq3n8t2tnT3AKTOP9RgQvVKFaAYJ6fc2HhwCTyhXxIpib44UrfADAffzaUa1pRQ3I26dzpe2
	plwOQzEQ==;
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oRR-00000009vul-3ci6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:47:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TFlSn3017443;
	Tue, 29 Oct 2024 10:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730216848;
	bh=GLjfUODQODOaRX/d1s4wSCIi5iG+h1DU0f5TSsQNgoo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AEFOVmUcKQGazhaNrxs1IP+Dp4izBj4Ac0XDnDHza307aHm2DrLVssyk0b5K1SvQv
	 MbvnpQhoYdcSC4s3I9NmfZfEGqFbB40zAJMV4hCHPtz2+VmfPB5zuSJFVt5KZXUOCm
	 moeTiOrKVgl6W7n40r9epXgrqmJ+4Pjla4iPIl3U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TFlSbg010235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 10:47:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 10:47:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 10:47:28 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFlNKE083333;
	Tue, 29 Oct 2024 10:47:24 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manorit Chawdhry <m-chawdhry@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Aniket Limaye <a-limaye@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis
	<afd@ti.com>
Subject: Re: [PATCH v6 00/12] Add bootph-all property for J7 boards
Date: Tue, 29 Oct 2024 21:17:21 +0530
Message-ID: <173021674661.3859929.13298221281337904627.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
References: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_154734_268637_6182D67A 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Manorit Chawdhry,

On Thu, 24 Oct 2024 10:50:57 +0530, Manorit Chawdhry wrote:
> The idea of this series is to add bootph-all and bootph-pre-ram property
> in all the leaf nodes wherever required and cleanup any other places where
> bootph-all/bootph-pre-ram exist in the parent nodes as well since now
> the bootloaders can handle it.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[01/12] arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup: Move bootph from mcu_timer1 to mcu_timer0
        commit: 1d381865ad86b05328a3c4d841d2f0d2c07a8b6b
[02/12] arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup: Remove parent nodes bootph-*
        commit: c4fbee5eb6fa5212e9e6285b9116e0e2fae42c52
[03/12] arm64: dts: ti: k3-j784s4: Add bootph-* properties
        commit: f54d577df4a06c8e075ba9c1bd8fd6c18167d47e
[04/12] arm64: dts: ti: k3-j721s2: Add bootph-* properties
        commit: 83ab86a4412f6143acdf75fd315c196d255a0089
[05/12] arm64: dts: ti: k3-j721e: Add bootph-* properties
        commit: dd2c7aeca3ece4ab78a9d87fe2dcce365b5ce87d
[06/12] arm64: dts: ti: k3-j7200: Add bootph-* properties
        commit: b903ab269e67ce5788b0b2a39db4bd11fd19359b
[07/12] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Remove parent nodes bootph-*
        commit: 49b0b706af963424decf4b6c67b09a83af91a067
[08/12] arm64: dts: ti: k3-j721s2-evm*: Add bootph-* properties
        commit: 15a432a4a0d2a6b79fdb798539e6fdbc87ed526c
[09/12] arm64: dts: ti: k3-am68-sk*: Add bootph-* properties
        commit: 781cb8f1ad769c7999ef3b35f216ff150130f3ee
[10/12] arm64: dts: ti: k3-j721e-evm*: Add bootph-* properties
        commit: fbdb8aa4eab8405c8709aab9e3bba48b5a955cbc
[11/12] arm64: dts: ti: k3-j721e-sk*: Add bootph-* properties
        commit: e45355835c40eb96fe92ec98cc9a9e9e60df0845
[12/12] arm64: dts: ti: k3-j7200-evm*: Add bootph-* properties
        commit: bdb543b1664bb4a54edf6ab651a36915d037220b

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


