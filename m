Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3511CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itfQeuJgZ6yMyr17lXJ1F1UsA0C2s68L7ZMyeo8E+LE=; b=gNRtSXvNPr7+nX+giCZXZSPC4C
	bkasJB5/nmsgomBdYwjPRzG2Lz5UCWOu991qDDli1VZVqlIXN8+5mUe19pAbdpkvL0KD8HEQXmD3R
	RDhgN0F24a3mu9h/kvc7u0gLdAzy/1ZTOP4svyXQns1v/E2sHepk2Q0sIfs8tFaVPn/bV6U1VTyiV
	55whlzttaM08zoh/vZzuDmYVKbPOw5bsSIZlaxUtuaLymwfswzl27ioXu3xQ3iCIpIHeDD0mXcX9Z
	4C4dhqEmBdRvy3cyT0D3h9zKCPS1oV56e9fRLqY38UXZOFntiWsMDmX6Idm8JOdUBywdhzynYzI/6
	KUqraALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCo7-0000000Dy5e-3u6H;
	Wed, 13 Aug 2025 14:50:27 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCZh-0000000DvfB-21aX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:35:35 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DEZULa2093635;
	Wed, 13 Aug 2025 09:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755095730;
	bh=itfQeuJgZ6yMyr17lXJ1F1UsA0C2s68L7ZMyeo8E+LE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H56pN8DacZuRV0udq5J4QuMR/9tF4DDPtpsxxag/DFNfwpF6XldLasLNPdyNCHPDQ
	 5zuVCjjeBE3vDT5UFsALLlnItp/SflOKshQEx2bTVFDqMT/ClOJvS+pHt8j7w1InAZ
	 YTIc9Ufe6hJhby7RLG7tXnpbAh/Xq9CIklcMcZlw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DEZU5o125880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 09:35:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 09:35:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 09:35:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DEZUrA2137696;
	Wed, 13 Aug 2025 09:35:30 -0500
From: Nishanth Menon <nm@ti.com>
To: <linux-kernel@vger.kernel.org>, Brandon Brnich <b-brnich@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Devarsh
 Thakkar <devarsht@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH v3] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
Date: Wed, 13 Aug 2025 09:35:28 -0500
Message-ID: <175509562183.158870.18075844501777832548.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250808155555.2632451-1-b-brnich@ti.com>
References: <20250808155555.2632451-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_073533_609261_AB6BF7BB 
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

Hi Brandon Brnich,

On Fri, 08 Aug 2025 10:55:55 -0500, Brandon Brnich wrote:
> This adds node for E5010 JPEG Encoder which is a stateful JPEG Encoder
> present in J722s SoC, supporting baseline encoding of semiplanar based
> YUV420 and YUV422 raw video formats to JPEG encoding, with resolutions
> supported from 64x64 to 8kx8k.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].

NOTE: I looked at the comment from Krzysztof[2] about the generic node name, and
I am assuming that jpeg-encoder is generic enough here.

Thank you!

[1/1] arm64: dts: ti: k3-j722s-main: Add E5010 JPEG Encoder
      commit: 47a32605c6e7f283f373b56e9caf97c56b7e5634

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
[2] https://lore.kernel.org/all/b5ba5a22-dc0a-423b-963f-5db6c7e04665@kernel.org/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


