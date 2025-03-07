Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445D1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gv5g3lJSEQAWXZM3XwaU06yz84+apKewnJfFnIBLU0s=; b=jNcKMf32asz2Hh3GA887gBKe+B
	i4szFHArgTQdsClE7x3iEEHy+CLSw9Aq0sY5+tjjyohfyHCRf5gdc+GO2TUM78F85cwSw7ljRIH5b
	t2aLf7KXr1gMAJSqe8Ie0jVEnCQYuvLDpsR8vcWOI9MZhTo/x4avRVSeWHNcCi08luvlEQVKCokQJ
	A6Icg3do/3+LJ+YIJw0XFMjl+aQNhSpme52xmP0iwXwyyyVoWcs3blL/Dm0RT8QyeUvnQOhDjrHW5
	9khV1f2NrH3buZK3nyzaeVJHyJQW0UQSERP0UML910OFvTmFOyMkWSDudxLoEAP5lTSih6J/H+gEu
	HcbGZ6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVJc-0000000DwA1-3ahK;
	Fri, 07 Mar 2025 10:52:28 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV4A-0000000DttU-3OK3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:36:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527AaLnA344561
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Mar 2025 04:36:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741343781;
	bh=Gv5g3lJSEQAWXZM3XwaU06yz84+apKewnJfFnIBLU0s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XT4wEqAvYJ83Njy8ZFvObjrXbTRKqkZcg9fsmzPXtw9k9ZGe2iayo+Tv9VDDtajmK
	 u4udPtHZP0dCjwMdsksZLqgE+kOJLhgYNQyWjgJFk1c19VisxZpnMykEVmRYJG/oI4
	 pCWzcH2EU8DXFXneMjK4bTYMjU9PxugKErgok/YA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527AaLNs029394;
	Fri, 7 Mar 2025 04:36:21 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 04:36:21 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 04:36:21 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527AaH3S021509;
	Fri, 7 Mar 2025 04:36:18 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vaishnav Achath <vaishnav.a@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <jai.luthra@linux.dev>, <y-abhilashchandra@ti.com>
Subject: Re: [PATCH 0/5] Add J722S CSI support
Date: Fri, 7 Mar 2025 16:06:15 +0530
Message-ID: <174133309362.1072814.5440404016847301624.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218185452.600797-1-vaishnav.a@ti.com>
References: <20250218185452.600797-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_023630_952174_DC09EB73 
X-CRM114-Status: GOOD (  14.44  )
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

Hi Vaishnav Achath,

On Wed, 19 Feb 2025 00:24:47 +0530, Vaishnav Achath wrote:
> This series adds support for CSI2RX capture on J722S EVM
> and enables IMX219 and OV5640 overlays to enables
> 4 sensors on EVM, this provides a reference for a user to
> enable a different sensor on any of the ports.
> 
> Test logs:
> IMX219: https://gist.github.com/vaishnavachath/60cc2ef257601f27f28a315f8cf669c4
> OV5640: https://gist.github.com/vaishnavachath/648202286d4d34d4d25f7c8c9db8b8bd
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: k3-j722s-main: Add BCDMA CSI overrides
      commit: fb1b230bf9c45f5d6579dc329c2aafcd1263b70a
[2/5] arm64: dts: ti: k3-j722s-main: Add CSI2RX nodes
      commit: 8fea4519f625e6c1b05078f2ecea252b7b28b06e
[3/5] arm64: dts: ti: k3-j722s-evm: Add camera peripherals
      commit: ce553288ad2368f0d27e47b39a23121a825a2b33
[4/5] arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
      commit: c24ccb1cd77fb44087b2f7008d99626796b33ca4
[5/5] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
      commit: 938806652b0a3c90d67e7137c91708d06940b03d

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


