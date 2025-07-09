Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3BAC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyD+T34QYJ2ioCdy+HTorp68S+Nwa6aYr4LKt9u3P4E=; b=TeZ0oGU3ryXffP6+imdiIYwPW6
	M/OGEYsMSLYqzxFkp3ZKDKpOoKtgwdauSeDnrwS5493WtMLPM0kf/LMm6aMn8ziTNH4pNpHJfPFaA
	mREooLxV5VB+igijRdTiGOqcHAzFWm2lYBnCWFnJ/UNECCl+i1b0Cx5ThSCpgvi6fI38XszqNQ9oA
	izuQG9Bhm5xgJcDG6Vnxl9MbsbOOOvPor9yaVaCqlWiGWMbZC0Vx2dDZdjTM8DTNaDlRd0+R3e2NK
	I03hATm0IIhj1KEJu+G163Zgwnt/DBoEs87m7VRJfwZtuVdGrxHTKUnwTR1tzeskmHAIBkk3jbIOp
	Min/RJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZURK-00000008ixx-483g;
	Wed, 09 Jul 2025 13:02:22 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSHA-00000008LaG-1NA3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:43:46 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569Ahfq81189600;
	Wed, 9 Jul 2025 05:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752057821;
	bh=jyD+T34QYJ2ioCdy+HTorp68S+Nwa6aYr4LKt9u3P4E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mFyCH4LgnAI4nxJDC3XkvBTR11SZSa5izNgrcW5X9b+Odg6go8vNxeK7ga7Tf/8QR
	 bjHKTi7i/8Z+MAY8mrKYtvB6OZvGhRt+g+5K/yg2sDGoFPeU7qB/ykJqRzDSt3zDUD
	 NAYowrFXcqTjTr6D7ECVKUETavG0SlESr9WgoLW8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569AhfDD3275493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:43:41 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:43:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:43:40 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569Aha4Z3797348;
	Wed, 9 Jul 2025 05:43:37 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rogerq@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <stable@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog level for Type-C
Date: Wed, 9 Jul 2025 16:13:22 +0530
Message-ID: <175205778774.925763.11396013784655604242.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623100657.4082031-1-s-vadapalli@ti.com>
References: <20250623100657.4082031-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_034344_454212_2CCBC2A2 
X-CRM114-Status: GOOD (  15.54  )
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

On Mon, 23 Jun 2025 15:36:57 +0530, Siddharth Vadapalli wrote:
> According to the "GPIO Expander Map / Table" section of the J722S EVM
> Schematic within the Evaluation Module Design Files package [0], the
> GPIO Pin P05 located on the GPIO Expander 1 (I2C0/0x23) has to be pulled
> down to select the Type-C interface. Since commit under Fixes claims to
> enable the Type-C interface, update the property within "p05-hog" from
> "output-high" to "output-low", thereby switching from the Type-A
> interface to the Type-C interface.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog level for Type-C
      commit: 65ba2a6e77e9e5c843a591055789050e77b5c65e

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


