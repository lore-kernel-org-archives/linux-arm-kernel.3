Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F0CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKhJLqhiY4BgfFZaSnPfgvPlSceMNAzM9xufB5Fw2XA=; b=boNZn4X6OAItahPQ6ZGu4rfYiS
	GGZLhhFMo53zE8Y+XjDyALfuwTe6Rs1Hak1FfoIQn9BxuuJ5iddjGGHHoZbdscZPWmii5oemS6Uud
	CPYnR0uwA8K4wOztK9loR+08YSTs2N//adRLgHIj4FdaK3JzUvCkArtLSolQ58ZIjuK8QJgJaae8T
	p4Q2Xd6wsOnjeVhSZWiPv0tcWfbgRkmnzcHRaBzMQvWdp/wLnksvCUm6mlUwMnUkjrJ3EyB2qU//R
	H6ZTsk0EQT2FSbUbrjc3jppM5hyHgczGUQclQwusoaKuIjCCajlPGP7xcHfijMsRTjOuUOhiZAmQ3
	0ChTdbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOCN-0000000Ar8f-2FSM;
	Thu, 02 Jan 2025 16:37:27 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO8w-0000000AqJK-0Gkb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:33:55 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GXml12199349
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:33:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835628;
	bh=ZKhJLqhiY4BgfFZaSnPfgvPlSceMNAzM9xufB5Fw2XA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Blt9QAcTLzOwGohu8BxNU1qxLuwxP5iOkZXszB+nuqa02Rr4HQ4xzT43eqzNw2gfa
	 xB4T2XRPZLxmShEgHQsvNTFBUksj0h78ZhrS6xIl+m5ffUYm0Eij0edLCDHnswrN9n
	 47s9ll8hhqG8v80VYlz0tIpWOikcU1gASQstmsyo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502GXmN9036461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:33:48 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:33:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:33:48 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GXmkv060747;
	Thu, 2 Jan 2025 10:33:48 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Richard
	<thomas.richard@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <gregory.clement@bootlin.com>, <thomas.petazzoni@bootlin.com>,
        <richard.genoud@bootlin.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf compatible
Date: Thu, 2 Jan 2025 10:33:45 -0600
Message-ID: <173583562065.269347.5876221700425554154.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241230-j784s4-s2r-pinctrl-v2-1-35039fafe2ca@bootlin.com>
References: <20241230-j784s4-s2r-pinctrl-v2-1-35039fafe2ca@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_083354_196074_8FE47BC4 
X-CRM114-Status: GOOD (  13.20  )
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

Hi Thomas Richard,

On Mon, 30 Dec 2024 10:49:00 +0100, Thomas Richard wrote:
> Like on j7200, pinctrl contexts shall be saved and restored during
> suspend-to-ram.
> 
> So use ti,j7200-padconf compatible.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf compatible
      commit: b48888c9c4af15fcaa57076aeff6c48c90809bc5

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


