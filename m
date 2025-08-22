Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF88DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koQegF4UW9iKzxQUE2TMKsD0Dt3GZxMJZZ6wyyEEhGc=; b=KTdgKoQbkdFwB4j2hw7JvFMeL3
	aNl+56CW37tDwirQHuGLUaZ45vltZDLOzPqdrFRNO2WuqHNGN0o4Tk4iTOMFJOSa0LQ1jr5Zigctf
	h9KziD0cnbmyFQjfcLPKcX1qEzNX/WA+AOsEZCQRwJKqrSuzRoQ0wqrzPgSQMV/89D2p2UG6YIDtt
	8GG9RFd1/cUwcUm/CHdHBclIbOjpNi53lw6ZtRaaUZDO1xtftCZlGSD4h9azOuRDNqpgVYdIRO+hn
	cqQyxWzGkW+Sjhpt5bT2GFUSos0w+XXWIoGCtvRWvH73O3wCUDOkhzEhOynaq6W0ayuwwdAvcuuR2
	ympqckoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTS-00000004Kie-1QRg;
	Sat, 23 Aug 2025 08:19:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXhl-00000003On4-23Pv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:45:42 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MJjcpj319191;
	Fri, 22 Aug 2025 14:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755891938;
	bh=koQegF4UW9iKzxQUE2TMKsD0Dt3GZxMJZZ6wyyEEhGc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XEJRFaL+NiFqNf5LwYG/ZDzlzvAozDmTRwwO+34DcAEtNfyH4cYg2HQj1ydPoXMLY
	 jcyCge7Yh9GNz7Qx/3gqp2/qwdfxXwLZi2TCXDFVn7Uey1py+M1T2ISd3WS0g8BKRH
	 uTWwhDAUfsa6k1a8gFJGExpedLXxh+6goXMuLg0Y=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MJjcqL3503101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 14:45:38 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 14:45:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 14:45:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MJjcPP4032874;
	Fri, 22 Aug 2025 14:45:38 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Switch to PCIe Multilink + USB configuration
Date: Fri, 22 Aug 2025 14:45:36 -0500
Message-ID: <175589190685.650517.15346755331299004953.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250819105717.372893-1-s-vadapalli@ti.com>
References: <20250819105717.372893-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_124541_628041_4AFF3948 
X-CRM114-Status: GOOD (  16.62  )
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

On Tue, 19 Aug 2025 16:27:00 +0530, Siddharth Vadapalli wrote:
> The SERDES0 instance of SERDES on the AM69 SoC is a Cadence Torrent SERDES
> and it has 4 lanes which are allocated in the following manner:
> Lane0 and Lane1 to PCIe1
> Lane2 to PCIe3
> Lane3 to USB0
> 
> Until [0], the Cadence Torrent SERDES driver only supported configuring
> the SERDES for a PCIe + USB configuration whereby all lanes of the
> SERDES configured for PCIe will operate at the same speed. As a result,
> PCIe1 and PCIe3 instances of PCIe will either fall down to a common
> speed based on the PCIe peers that they are each connected to, or, the
> PCIe link could fail to be setup.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am69-sk: Switch to PCIe Multilink + USB configuration
      commit: 76397d42e248335aa41acbf0af6d096220605202

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


