Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C869CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzRMAuJOXVTxhce0Yc4MGKlUon63tvYdJK66DMNKHrM=; b=FNJWJYdIJK9YgwtuBdJdORJJdb
	uT3yDaQ0KM1GqeeoM33FLgXer+GOc639i7dm8d4C6ZiqNlev1eYdwypu1SPz95+KUK3XRi04h2i7N
	SstN+0QO5jq4GpWVakcYnGBq+RoWMkfH3Phc5b2Fyyfa+TGH07OekNgwSIjtISgSAm+Di3Pk9nDpS
	Aj9SNw30hat5sAwRrOA3367r8Qx1wthJlxqtmeVWGFTmzbk44/VgF/HyiSzIBSiKIkg5CsUkJKj7a
	vFpg4D7vEokLUdUFu8A9zQacVf5uib6wsk7BvrAXz/hZNt87x+S+vNIGCibJjA7HGrXW109RQyn51
	/GkgbPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Qq-00000008OYq-3Vly;
	Fri, 12 Sep 2025 09:51:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Qp-00000008OXi-1ty2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CzRMAuJOXVTxhce0Yc4MGKlUon63tvYdJK66DMNKHrM=; b=OAZsMBj8IwVrbkKbNtKH3sEUXf
	QLLnyjfSs46tiYmRy3qhccyoEx2rDak6tEvwuFr0EKSkRQD2p8WTASbs+Y4yki/ZX7Jc/npi9ngTw
	L1QJrhHUPLuXbNj7xMIJpREQHNDeEkCf+1LBCEroxeiPKqbxTn6HkAjA63oeIUXdt2GTCqPm8Re0c
	BFgHPymrunuGAm4zA0zuWxhBaO9PHu5tF/qVuDMtRjffOnPk8+NW/yLSjQjOzsnzKKt08d67GHmxg
	loJsoq4qCiLNt5uISXYlqkDwHNJurlW1uQKMc6N/5YD/yH9yZJSfA6n2ov4FaU1FO7u9+4BO7ojMT
	0xn2+39g==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Qm-00000006JV5-0ScA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:51:02 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9ouLT495897;
	Fri, 12 Sep 2025 04:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670656;
	bh=CzRMAuJOXVTxhce0Yc4MGKlUon63tvYdJK66DMNKHrM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K6KcnFM4lkgAwuBBNwCOo+92tBqr09gOT7Xn35MVRKScCODwqvEjtfmyWNEwuI8ts
	 l7UkHfEsPr7dggZk54wCBR89qAD4shirsNNM77/S/pEk1T6+HMk5ENE2NYfbdg55KB
	 OoILfiuxpm4z57ZeZQ1sCproiWGGHYdSvWi6w6vc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9ouvu1776454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:50:56 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:50:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:50:56 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9ouqf3718647;
	Fri, 12 Sep 2025 04:50:56 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <praneeth@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <s-k6@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Add support for OSPI flash
Date: Fri, 12 Sep 2025 04:50:52 -0500
Message-ID: <175766786947.26144.12602123819286079278.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250813090300.733295-1-p-bhagat@ti.com>
References: <20250813090300.733295-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_105100_504173_A40B27B3 
X-CRM114-Status: GOOD (  14.43  )
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

Hi Paresh Bhagat,

On Wed, 13 Aug 2025 14:33:00 +0530, Paresh Bhagat wrote:
> AM62D2 EVM has S28HS512T 64 MiB Octal SPI NOR flash connected to the
> OSPI interface. Add support for the flash and describe the partition
> information as per bootloader.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62d2-evm: Add support for OSPI flash
      commit: 1a1066f553df1777ffa5ede050457e41972f34f4

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
https://ti.com/opensource


