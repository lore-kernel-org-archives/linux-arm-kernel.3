Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A08CC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gwfcLNFYkPRO9tV7WcTDZSJlvkg+gjxEny4VFBgD4Y=; b=FkjeJ1n7qoQanJa2Pn+RMFa7+n
	ZICYFBTxFYOWjNYpDJiS6q18EAv+ncfZKSJwYspkFPznCbL9mrlwSKVciOWq/pByCG2Kha9LOm7mT
	X3LIOz468aAGt9PEKvPOokl+epda08q2DDFLYW8+SuiN1WioGV8BAxhFS4T85iGSa46fdD8mFztqe
	/fL46sTin95glO3VdcY0tShr/Yi5+UzN7ucWPyljqEZG3OfV44gbVrB+zZ5gP1FiZHRO5aAKW/gK+
	bAffAGLsDTpwBFVpBem8dknbn4KLNhqpXG8M2FGs6WCTFvX7/wyaPAjb0GEQIHjHLHlQV30C9y7p5
	lkgEPV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxve-0000000HCwg-2SAg;
	Mon, 03 Mar 2025 05:01:22 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxq3-0000000HC7A-0TOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:55:36 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5234tWAe2669163
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 22:55:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740977732;
	bh=0gwfcLNFYkPRO9tV7WcTDZSJlvkg+gjxEny4VFBgD4Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jgHXzBJKmr4qTo30v7HPt+0fJMg9adTzQVIVgtGVyCwALwcF7/gOzH/j8jURr5XxS
	 N29bZSqWTKyKsBXkpgQk8mgtq3R7H6hAl08ba+UiwQJgPpXe2Qpx/ZRBQhNodjP27E
	 bq689XgrrWU2cqGjAgc+9sHr88HAUC8RJZXcGzlE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5234tWgd070617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 22:55:32 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 22:55:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 22:55:32 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234tSoS063226;
	Sun, 2 Mar 2025 22:55:29 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/2] Add boot phase tag to USB0 on AM62A7-SK and AM62P5-SK
Date: Mon, 3 Mar 2025 10:25:21 +0530
Message-ID: <174092143354.3272913.1834909531649290105.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250122124223.1118789-1-s-vadapalli@ti.com>
References: <20250122124223.1118789-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_205535_238611_FA98396B 
X-CRM114-Status: GOOD (  15.78  )
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

Hi Siddharth Vadapalli,

On Wed, 22 Jan 2025 18:11:47 +0530, Siddharth Vadapalli wrote:
> This series adds the boot phase tag "bootph-all" to the device-tree node
> for USB0 on AM62A7-SK and AM62P5-SK boards. USB0 instance of USB on the
> AM62Ax and AM62Px SoCs which the aforementioned boards are based on, can
> be used for USB DFU boot. Since USB0 has to be enabled at all stages of
> the boot process when booting via USB DFU, the "bootph-all" tag is added
> in the USB0 node of the respective board files.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62a7-sk: Add boot phase tag for USB0
      commit: e7ee00e314da736b00ebb26405f8e2cab84cfa22
[2/2] arm64: dts: ti: k3-am62p5-sk: Add boot phase tag for USB0
      commit: 732c4cffe463f222f7f694d469d1f730f4a3adab

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


