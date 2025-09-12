Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36429CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAXPAL7KIyBetGmDpXTI7beb5COSZjfnpSZdKsPIchg=; b=tLhlX3BWgj/rv7CFxHxlpVa0ya
	RaOunzZYi/AiVM95k/izrAqeAR3f/8Vou6+e2ss9N0MmuvZrsZ3+4piuHJCfSUwJDpctebLfb8x+3
	rJ2GURKHJ838XB9Bkwt/E7p1pq9kdLs3yFxgfpLBYyT3KTLw002MSpkN8fAf3Jhz5ZZ3qUXkUkDK5
	s2Hqu+BRFloNvKYk0HQB0izVvfpexZ4LpE0YfGDPgqz5BKXc2oYrlHmG8jYu8gCWjkeReAKGRd+zH
	RCWRGJxGAhfeoHsy8Vsom4bhiyOFuGjMrTtOzwE95/LcXmqcZyw8rLE2RDxbvCQWSdHgV/vUWPHdR
	YyM+tf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0QX-00000008OPl-32sa;
	Fri, 12 Sep 2025 09:50:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0QX-00000008OPN-0YVO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 09:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nAXPAL7KIyBetGmDpXTI7beb5COSZjfnpSZdKsPIchg=; b=Ghjycm0Otj6SxgTj2zlgWUBG7N
	PHpfPIT8g+OF+/KIp0S4FBCwdtlzt+eZ1vZyJoscnXhJ1VELozmdTWN6ex0gGx5L7YOLlFh46BxSq
	r+Y6psp/6NLIDPI9jowPDbGz6IYNUswLxnnuLTUXZ6smQhNU4VLESGm4s4KTdp7NRT6LvckGPzuv3
	yp0cY/ApFK4Pf2iOUF9ce4RpV6h3/fjTVVqm2134o1yOa3SCmpI2tsHfYXcQzQBgSCQkp0l1+Y6VM
	GAEG12vsuBtBOYFU2wu1iyC8QVh9B6Wn6gmQDqDF0mXrj1GiDLMHH+909Z4DL9QaCjdhP39J2kByc
	niPTBw0g==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0QS-00000006JSL-1OxP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:50:44 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9oUCE947168;
	Fri, 12 Sep 2025 04:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670630;
	bh=nAXPAL7KIyBetGmDpXTI7beb5COSZjfnpSZdKsPIchg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r+em9jbsy13iy8J9YDMLS/5ubjoP4nEau7BVCcwivqN11QNQKQIhXSNnQCLkwC6xB
	 1FPAKrjis2VniBv6Njmr83vlTvZ8S7fAVltXDiyyH4edGy6UfQtb7w1FuhNxz2zBZh
	 GKEPOWgnNxYGexNPFtd0KDxh/h+okCjlSb++5mcY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9oUmP1219561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:50:30 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:50:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:50:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9oUup3718217;
	Fri, 12 Sep 2025 04:50:30 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <s-jain1@ti.com>, Harikrishna Shenoy <h-shenoy@ti.com>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v3] arm64: dts: ti: k3-j721e-main: Add DSI and DPHY-TX
Date: Fri, 12 Sep 2025 04:50:27 -0500
Message-ID: <175766787107.26567.5274629136577295894.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250905094325.472473-1-h-shenoy@ti.com>
References: <20250905094325.472473-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_105040_735741_6A440C8D 
X-CRM114-Status: GOOD (  14.63  )
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

Hi Harikrishna Shenoy,

On Fri, 05 Sep 2025 15:13:25 +0530, Harikrishna Shenoy wrote:
> TI's J721E SoC supports a DPI to DSI video signal conversion bridge on
> it's platform bus. The IP is from Cadence, and it has a custom TI
> wrapper around it to facilitate integration.
> 
> This IP takes the DPI video signals from DSS and alongwith the DPHY IP,
> it transmits DSI video signals out of the SoC.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j721e-main: Add DSI and DPHY-TX
      commit: 6fdcb1013f13f87cdebd94ab8aa2f8ea2c644a33

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


