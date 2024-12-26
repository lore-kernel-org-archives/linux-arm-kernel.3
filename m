Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DF8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raQfA3pPirSU1q019TeBHo53NFrJian0RAtgq7ilfGM=; b=1AFRfB8XfKqWAnOvU3jdWDU5k0
	aOHFP9DsJOo7sjpyxLF1NY/crdw5X21ZxZ0j2zy5VMnu3bOvUMNXsdCm5eQ+YtXnicZis9EBoQy2J
	gD+JwxVDGzWLodhNYLUuvnZ09F/Q0oGi/6rdswrdiiaEPg8lcjSsqfjXbC+R9obvcUFTfiEhLN9Qg
	VdWfpcdwdokxUUubq+X5iFXnDDZvz7O6DcZ52KU3O99fhzxlb2kaiUoX0EXdgTga5cLAlaqaVJn64
	n0Fyqt8yJALfS43X6dDU608hjuDsrLSaNx9kTf4S+thZfQOwHvh5AZ8UE9qGLFQNKSXAG0MBia9z9
	cfL9CcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuUl-0000000GNHJ-0McY;
	Thu, 26 Dec 2024 20:30:11 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuTY-0000000GN96-34cJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 20:28:58 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQKSlw31300706
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 14:28:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735244927;
	bh=raQfA3pPirSU1q019TeBHo53NFrJian0RAtgq7ilfGM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YNnmlQn4s/DCUmSTpBLq6bBhTSfg3HfAUuCBEbYg73OVBylyNWhYUVrWJCNN73hAB
	 PLwvipur65Um7/wKxCVTdJBFpdBaMfnydqKu8j1AjRFwXpS6/svkUZ5B4YW4E8ylZV
	 b5K57ptdX9t3kJNe2daQcylfnE3zvDnoqE6PJpKk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQKSlpH032426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 14:28:47 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 14:28:47 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 14:28:47 -0600
Received: from localhost ([10.249.33.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQKSlbc104472;
	Thu, 26 Dec 2024 14:28:47 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <j-keerthy@ti.com>, Anurag Dutta <a-dutta@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances
Date: Thu, 26 Dec 2024 14:28:45 -0600
Message-ID: <173524490004.82164.13189977088839437371.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104121241.102027-1-a-dutta@ti.com>
References: <20241104121241.102027-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_122856_912749_83C90D0C 
X-CRM114-Status: GOOD (  12.21  )
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

Hi Anurag Dutta,

On Mon, 04 Nov 2024 17:42:41 +0530, Anurag Dutta wrote:
> The clock IDs for multiple MCSPI instances across wakeup domain
> in J784s4 are incorrect when compared with documentation [1]. Fix
> the clock IDs to their appropriate values.
> 
> [1]https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html
> 
> Fixes: e23d5a3d116d ("arm64: dts: ti: k3-j784s4: Add MCSPI nodes")
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances
      commit: 94a7666e3eb9f52f0097c0ca6fb093f5f20d4462

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


