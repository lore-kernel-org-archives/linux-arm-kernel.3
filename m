Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467B2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGl6wj1twMafrqAJ2Ap7n/PE7X+QSY313AzQP/HONtY=; b=lQV1xA61dEzutBpYNyaYyW1z2X
	8WiIUBO62wi3MwZTzAZc47YB8nGyx/fbrDi+s5QJlH2Gf2MlQMjIkJJppCPMUe5IUPBD4MfDM/mq2
	uRTAqiWB/4fMxsd6JfvqECkLh9IvhiqGaz4onmegmQJBd5/ymFDStcCWkVhdADnIPK/KaPyhgbKAK
	VJesMeWKT5uesudlIFK+MICUFIFYLihv/GsmbLLV7LIJ5zxjwxW0RVjsY9T7LUJ5MAAVkuyAKjf0m
	Gr/LkZaa/TCNovA5v9ln7LdSuXh+sjiHA49tpQPs57R48OYZ6jBSvWIKS46/9CQbYhFEkCcbaDNH5
	FuamgJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6qlt-00000004IwC-1Idb;
	Mon, 21 Apr 2025 13:01:13 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6qiz-00000004Ic8-0L0W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 12:58:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCw9RD919322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745240289;
	bh=MGl6wj1twMafrqAJ2Ap7n/PE7X+QSY313AzQP/HONtY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F0+d1xv58ycA9lNCvOmeLd8kmTng4Jk9EMYvwDXZGiq1Y6+dRa/CaR7IGCmiS7GFB
	 qS60ZHPAo6VLRX9nByzeT9H9vfJ5BEqF7vqPhro2PHQzhXfsua59XisHBupH45i6PA
	 AgPMdoifeiDSn3VgpSRLdc/AYFJ7C5rJ81sDUWWM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCw9XL083520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:58:09 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:58:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:58:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LCw9bV083581;
	Mon, 21 Apr 2025 07:58:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Jared McArthur <j-mcarthur@ti.com>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1
Date: Mon, 21 Apr 2025 07:58:07 -0500
Message-ID: <174524025290.1975926.6373479464630602638.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411203950.2859356-1-nm@ti.com>
References: <20250411203950.2859356-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_055813_210569_62ED8FB5 
X-CRM114-Status: GOOD (  14.95  )
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

On Fri, 11 Apr 2025 15:39:50 -0500, Nishanth Menon wrote:
> main_gpio1 controls the voltage for the SDcard from 3.3v to 1.8v.
> This is required for proper operation of SDcard through various boot
> stages.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
I have dropped the Fixes tag as it is not impacting the linux kernel.

Thank you!

[1/1] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1
      commit: 6a7023118fd7901d8b7967388923604d5d646cca

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


