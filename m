Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071BAC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TB0TPC4ZNqf5UK3o3lD2f+f8D+/BHzV1McX5c9FGRoQ=; b=edM1bUGDb+EFDG8tVV/WGVR0hb
	sAw4UMqm8KKhPG2vGwyqCwNDyJvUZqb+nEnpysAo1Gvkc89zp7TbMprgNxe9M+kj2rq2rb5pXbwbl
	e5SqnHwjHalYyjErY+3EVWYn98ReRDdFahVgCsIvcKzup84FKLBNCF7u4eDKdaOLFLcT0Wb0GPQUd
	f03goov4s3IRekReKC4wn2kQi7sd2yetK7zmWmXSxJ/KmTuJUP1nJQXRxq4iJNXkhIA02UkuR5aTB
	m9cqN2unHcJWBDGNNyNJwcb2ehUj9W8LhAd6TyV8WBcDkevqCP8fJBHIkpMlUuO8RZNeb6pFsF0/j
	Q5qCevlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxu6-0000000HCmB-4245;
	Mon, 03 Mar 2025 04:59:46 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxpk-0000000HBxI-3o1c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:55:18 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5234tDVf2669155
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 22:55:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740977713;
	bh=TB0TPC4ZNqf5UK3o3lD2f+f8D+/BHzV1McX5c9FGRoQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R306jY5z1XEukGO7gznMymOdUtvtV2r0v7QBtKlsPIgSkOeZfoBD1XH1xJ6nj0VPL
	 Jl9vVYm4iJWgzV/ML/TQY66xnk/1MNEiyVOLBlGuTX0Lfeuy1j/UmAI7dyhHx+aexj
	 hYpWrjFYG+9oBXCcXsc3S9JE9r50RLKhunDabFwc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5234tDbF070489
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 22:55:13 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 22:55:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 22:55:13 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234t9eo114408;
	Sun, 2 Mar 2025 22:55:10 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/2] Add bootph-all to SERDES3 for USB DFU Boot on J721E
Date: Mon, 3 Mar 2025 10:24:51 +0530
Message-ID: <174092143357.3272913.15267994610926405442.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209081738.1874749-1-s-vadapalli@ti.com>
References: <20250209081738.1874749-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_205517_043679_C95FDAC0 
X-CRM114-Status: GOOD (  14.47  )
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

On Sun, 09 Feb 2025 13:47:31 +0530, Siddharth Vadapalli wrote:
> This series is based on linux-next tagged next-20250207.
> 
> J721E SoC supports USB DFU Boot via USB0 instance of USB. On both
> J721E-EVM - (J721E SoM + J7 Common Processor Board) and
> J721E-SK, the USB Type-C interface which is connected to USB0 via
> SERDES3 is used for USB DFU boot.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-j721e-common-proc-board: Add boot phase tag to SERDES3
      commit: 59ac3f9f54db76f676ac5db05054586956c57e39
[2/2] arm64: dts: ti: k3-j721e-sk: Add boot phase tag to SERDES3
      commit: 871c73229bd276fbdb43c42fb3f5a25bcd8a9c85

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


