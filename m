Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17E3CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ou3qQEcrPp+2Q8qjelUZkf9KXg2pIjNHfnd3X0XTk9E=; b=1TCvOqJLvB8rO0T4Q4IvySW/oD
	Uav7Bag8fH1hs+JHo8KayqKUogh7Ta2o6bEG727qP6zozGjo0RoqxLlwOvTsQeQ+fGJV8ZlcIslGV
	HzT11sh6ZzkNvwbeU2tDWBwRMs6e51xMLEMeNx9OE9SjKPhLqrBP1C3bRCtE7WeJcO1XG5D0qaLNk
	3NyUgSxOrsx96pzuuNme24A8WSnwboRhFzs1pknEP4wV5S1OXUW/YkHG6PH7TeVB2nI03+PsNvBPi
	YoKfidRb/dUNGL9X8+ZLNO27vM5T+mhVgrpx/80UyFJVITXD+6jzAf+xg2ZZf73E6KFvnZ0HsAUse
	2aftCLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0RN-00000008OnC-21BS;
	Fri, 12 Sep 2025 09:51:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0RM-00000008Omp-3rc3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ou3qQEcrPp+2Q8qjelUZkf9KXg2pIjNHfnd3X0XTk9E=; b=bmaMGHM7S+JvZsZIIHkws162dq
	q46y2WojvrsNwLrr2/fA87t4jZvaHMB3UsxDpM3dxVEmZDx6OZX2njaEUq9bGEhgzqbwb9b8g+e5m
	hPyct5xpcxiKgV1FQByH9qrq6MjM9gopugo09AfASuNg5HvLKtZlDdzNW18If8tBfnIvCGg6Ms1J+
	cbP+VhsrWZLvsyxm6eqhLw3h8GcFargllA3Zx6HzcrmerQfeP7k0MZrFFctNyFLfA6Etn0Q5j0Tee
	cBV8nNSXfhKF7JYVnWIYgo4AlLJpImVzMQ1fIIwtzCxtqLkBgAcCC3SLrgQPfTUDEys0IQmK8vmRo
	Je+hk9fg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0RJ-00000006JZB-2WHs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:51:35 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9pT3v1008552;
	Fri, 12 Sep 2025 04:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670689;
	bh=ou3qQEcrPp+2Q8qjelUZkf9KXg2pIjNHfnd3X0XTk9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L7uEpNWMItSPR45olK4zoI584nUOd27rkIYGWQkP4XSvI3+v1fReweWX5s8cRk1dn
	 ZqhSZaSzvsFxBWbUuN+d7zEIioY7tNZ/rMCWe3+uIHkcN1SEpn2ErFDvofwKYDPjvl
	 Ig1S2Zpsb/Q17C4jrHzR7uyhODOfLIk1zN1OChLk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9pT5O1219985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:51:29 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:51:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:51:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9pTAS3719374;
	Fri, 12 Sep 2025 04:51:29 -0500
From: Nishanth Menon <nm@ti.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Stefano
 Radaelli <stefano.radaelli21@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Fri, 12 Sep 2025 04:51:25 -0500
Message-ID: <175766787211.26844.14791319461065184194.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250909213749.28098-1-stefano.radaelli21@gmail.com>
References: <20250909213749.28098-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_105133_989258_3FBB07F3 
X-CRM114-Status: GOOD (  17.51  )
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

Hi Stefano Radaelli,

On Tue, 09 Sep 2025 23:37:38 +0200, Stefano Radaelli wrote:
> This patch series adds support for the Variscite VAR-SOM-AM62P system on module
> and the Symphony carrier board.
> 
> The VAR-SOM-AM62P is a compact SOM based on the TI AM62P Sitara processor,
> featuring up to 8GB DDR4 memory, eMMC storage, Gigabit Ethernet, and various
> peripheral interfaces. The Symphony board is a feature-rich carrier board that
> showcases the SOM capabilities.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
      commit: 03c7b1f0ee9f7c8d047a6ea5767ac96490d1385c
[2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
      commit: 571562e76458682231453a561d5df0c8e91c461d
[3/3] arm64: dts: ti: var-som-am62p: Add support for Variscite Symphony Board
      commit: e402a3f1d9681d4b0be4568b5f318b3c3bc804bf

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


