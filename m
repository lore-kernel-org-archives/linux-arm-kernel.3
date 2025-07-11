Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A643BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Prv1+3e5hktoUSKslC/ScBA0UeUoQ2zCsspHwXxeyY=; b=Vyfl4fT29Z+u2xNydGSs3MZAHk
	hBhHdMQs9uywV+EbUfRTVic6jLACv2rYFaMSBtvGVJfDCJJ7iTEyJjfOhuH19rFB04y6DnaTFsqhB
	1GEpBvCAkwXdNUpqGp8tcj0yQGS9WeZWxP1VYxJl5t0ttH+CrJLxDI6GvPLbFo5n5vF5tXIbY93mb
	cRnvByCJnKfEf84nOpjwXT493AUmhF1bgQTJXPz/hk06gLbzF1YMly6x4ArR7A/eciel47JnyRQq0
	Y7JI4+eYPF9d8O5VIM8C4hOKPPa6xTkWgJTFPrxZcDsju1OAnklfJNYp885TB3U0n8sDYgdvRXgnD
	D0V9S9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6L9-0000000DkrL-1oJO;
	Fri, 11 Jul 2025 05:30:31 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5wO-0000000DiRc-2D1U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:04:57 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56B54sMM1345709;
	Fri, 11 Jul 2025 00:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752210294;
	bh=8Prv1+3e5hktoUSKslC/ScBA0UeUoQ2zCsspHwXxeyY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MmjP3W0v73nyLODneBFVfkseFUuwh8CH1IR8ff37iAkHOU6Wcz3upyJN3hpmDkaGS
	 UUaUgWnprpvrulmCryPwNFaVLqR0Kjukb8pP1G8N73R3r3lkkuaKtHlo04i1uG6CDd
	 h1fiZ2dFdkHoWDQvR0It+EWBd9CJ5RDcK2TbqFwg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56B54smq4178199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 00:04:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 00:04:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 00:04:53 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56B54ndi2876482;
	Fri, 11 Jul 2025 00:04:50 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Neha Malcom Francis <n-francis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH v4 0/2] Add support for K3 BIST
Date: Fri, 11 Jul 2025 10:34:35 +0530
Message-ID: <175205725858.918402.3771835070085533874.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605063506.2005637-1-n-francis@ti.com>
References: <20250605063506.2005637-1-n-francis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_220456_655936_3C4D1A8F 
X-CRM114-Status: GOOD (  16.99  )
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

Hi Neha Malcom Francis,

On Thu, 05 Jun 2025 12:05:04 +0530, Neha Malcom Francis wrote:
> BIST (Built-In Self Test) is an IP responsible for triggering hardware
> circuitry tests on both logic as well as memory blocks. This driver is
> currently being upstreamed in U-Boot [1] (on hold till the dt-binding
> is approved here) and triggers these tests on cores. This patch series
> adds the dt-binding as well as a node for BIST on J784S4 and J742S2.
> 
> Changes since v3:
> https://lore.kernel.org/all/20250514072056.639346-1-n-francis@ti.com/
> - Udit
> 	- add support for J742S2
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] dt-bindings: soc: ti: bist: Add BIST for K3 devices
      commit: 04ee170b69749851c74666079ac8f64dba52a2f1
[2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node
      commit: 387727d7e5d9c2499aafbd04e22c9d39e8eec4c5

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


