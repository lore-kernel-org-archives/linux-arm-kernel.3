Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4381CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 20:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlB21iHn0zF4Zu4uoulXyPPg+YVQpux/QZ5SdMlaSJE=; b=rH9sT1vQ/GI4fz
	66TdcohWraIaT4uh+T/Nf3BDOafB5Gdh6+AjKsgWWwQo+2dwjWrpcxvzSiPmKY4QXm+qcU10INwbq
	gZo4GUK2VAfyd1xRuVZOXS1z2csCW+Ux9ufHKeS+VSA0kjfTpPOgfvJ4nzAg/V7bQ8tfUYNw7B5Vn
	3u8Mqml970Jo5hTXWHkmdFKik63f6otWqCs6kGdTq+U+nsgl9Y/+cE8oUspcttUwB/iIxmRMacTlK
	F74hS0JiEwrTLR+fuW82izURKZxsbQdezkOP1b2o79Ru2EPDR5nuJ8DvaX1OZCrdOmbyfLEHvbbVo
	j2BD20A7d4ta/Q+Eyfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuYJ-0000000GNxR-1Cu9;
	Thu, 26 Dec 2024 20:33:51 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuWC-0000000GNec-3GAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 20:31:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BQKVbcS048587;
	Thu, 26 Dec 2024 14:31:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735245097;
	bh=LlB21iHn0zF4Zu4uoulXyPPg+YVQpux/QZ5SdMlaSJE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bS5KcFZC8fza5kNkkEA6Ms/kwuFjALDfRC0VaCkUDsZ14zIb8mm4NWCoObuGmRIyf
	 omT4A2qJL5H31/pqY/RHh5K7JvQqIdQBivSn6oAfMmeo5BQ4CrJHCyGsUuK1xVTCO7
	 +0h9ac9aTR9ko8QcEKrDNE1hhUl+0w8Ixi/FlZsc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQKVb1P002706
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 14:31:37 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 14:31:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 14:31:37 -0600
Received: from localhost ([10.249.33.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQKVbSs108557;
	Thu, 26 Dec 2024 14:31:37 -0600
From: Nishanth Menon <nm@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        MD Danish Anwar
	<danishanwar@ti.com>
Subject: Re: [PATCH v3 0/2] Add Clocks for ICSSG
Date: Thu, 26 Dec 2024 14:31:34 -0600
Message-ID: <173524505989.82795.5328795902477533290.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113110955.3876045-1-danishanwar@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_123140_915481_51FEC06B 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, srk@ti.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi MD Danish Anwar,

On Wed, 13 Nov 2024 16:39:53 +0530, MD Danish Anwar wrote:
> This series adds clocks for ICSSG for AM64x.
> 
> PATCH 1/2 Adds the dt binding necessary to add clocks to the device tree.
> It adds the `clocks` in the dt binding of ICSSG node. Each ICSSG instance
> has 7 clocks available to them as per AM64x TRM [1] Section 6.4.3 Table
> 6-398. They are not added in the dt bindings yet. This patch adds all
> available clocks to ICSSG bindings.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
      commit: f7ed5ae30cf395d92a3e1e3c843fa86ce96167b8
[2/2] arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock
      commit: 25aadf5039fe8920835fb1452db08afa27a0edd9

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


