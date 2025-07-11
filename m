Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF6EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afDXnXc6wPd7UCJYFn9Xue4JEjVIxkwuEGrES44MIP0=; b=mz97q/1HdCmukgDOS3PReBKE0h
	k661t1ioHb5ls4vNfD/WJZdSYwSddgFheqpk0jRzuS1owvdKb4H3INU3PP2Ulps2LTPNDE0EPxLkP
	LjXlkV6rRXn72TAJobBI9eJ3zpRZ1T5VUClvrb+6YoehLZFHaRPb3eL3TJoVnLIh9cnvAS3ZQZjpo
	rbx2t+VUVg5jg+gzoP9BZzvvOp5w9fB9loNjt/pMkl1DU/Bgnf+hqqa09pVLXqWh7cF+evjO/k4n/
	SpRWNK/XUP49YerJMLTXIip+JJiiFQAW64Ct1iTl4ydN2178s1zX9M6ulxC+lqZBQX+pKbJiBNJic
	b5fuF6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6ED-0000000DkDe-0Coo;
	Fri, 11 Jul 2025 05:23:21 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5v4-0000000DiCk-0suH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:03:35 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56B53UUW1963572;
	Fri, 11 Jul 2025 00:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752210210;
	bh=afDXnXc6wPd7UCJYFn9Xue4JEjVIxkwuEGrES44MIP0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rU+dHQTLkKY7DDdxF5lzfAxravsh7JtOGT0DJgAZHAWzx3p6e6cmmgzjohm7Gq/5n
	 gclBgheBo6xH+3E+tTVni7WfYtpxPCBpOcxMQWEVQUpXfyhS2fwdwZ5hYWlZ0FfsK3
	 hYbe6CbqyDsUMhxl3YHwKZtfxmfMvHxQRZJxk2ow=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56B53Ulu822551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 00:03:30 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 00:03:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 00:03:29 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56B53PxW2576359;
	Fri, 11 Jul 2025 00:03:26 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Bryan Brattlof <bb@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hong Guan <hguan@ti.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: fix pinmux for main_uart1
Date: Fri, 11 Jul 2025 10:33:11 +0530
Message-ID: <175205725857.918402.13683830653184738148.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707-uart-fixes-v1-1-8164147218b0@ti.com>
References: <20250707-uart-fixes-v1-1-8164147218b0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_220334_339394_296AC2E3 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Bryan Brattlof,

On Mon, 07 Jul 2025 11:55:13 -0500, Bryan Brattlof wrote:
> The &main_uart1, which is reserved for TIFS firmware traces, is routed
> to the onboard FT4232 via a FET swich which is connected to pin A21 and

Reword this bit locally along with s/swich/switch.

>
> B21 of the SoC and not E17 and C17. Fix it.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a7-sk: fix pinmux for main_uart1
      commit: 8e44ac61abaae56fc6eb537a04ed78b458c5b984

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


