Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804B4C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hzsi9R5SdyeZEbtSlNgVuCa4Zbe40AjNavhwDq4fcj4=; b=Lwx29nvRJj6awOcjdez8O1NeSk
	Tz0JhurcZU4L32BSMZrLnEW5ZeMDCxzFet/zrcD07ISmcXCUkqj/aLOPxfWi1B1em9sWPyc7kd/v5
	KR6+uzdgE19gGMoripv1P7J/P2/Eu0jNfBrBFWpDaDW74My0P5Qp0PjKrs30LejovERGpREsKhxFu
	m8fiBibM9DaB6QFDimVYPHz6cbOHj7hBobwY73xC93BeMLFq347H/QmL7TJjafir0e/Yecsmxx8H/
	Hd7gV2LSqQh4jeRssCKPwMLCY9NZBvAZypkXzudR2teLdjG4Af/FcZmDKKx2mmceVGMlpSmLpRETT
	nKli6vvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxpU-0000000HBvO-3aqX;
	Mon, 03 Mar 2025 04:55:00 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxk1-0000000HBGr-00Ni
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:49:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5234nDee3208569
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 22:49:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740977353;
	bh=Hzsi9R5SdyeZEbtSlNgVuCa4Zbe40AjNavhwDq4fcj4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oBZN9xmusTyC23NSTUkrLStCt8moBIk/T5k+HZFE3mVi8b54Gmn/TJ3cZUUhWYi7v
	 bFSBKh2Z50IPypJe+DgAFKkm7JFw7BV8VqlE3baSMLiQ930B36to83KIB5KA+GXcR/
	 1SS1w1YPp69MA5sep5Btb0zIBClL4arYuZ8n8/o4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5234nDDk019246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 22:49:13 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 22:49:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 22:49:13 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234n8ao108410;
	Sun, 2 Mar 2025 22:49:09 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Kendall Willis <k-willis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <d-gole@ti.com>, <tony@atomide.com>,
        <msp@baylibre.com>, <khilman@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Configure ti-sysc for wkup_uart0
Date: Mon, 3 Mar 2025 10:19:05 +0530
Message-ID: <174092143357.3272913.5649051492068672148.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212215248.746838-1-k-willis@ti.com>
References: <20250212215248.746838-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_204921_132041_580237AA 
X-CRM114-Status: GOOD (  14.06  )
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

Hi Kendall Willis,

On Wed, 12 Feb 2025 15:52:48 -0600, Kendall Willis wrote:
> Similar to the TI K3-AM62x Soc commit ce27f7f9e328c8582a169f97f1466976561f1
> ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for wkup_uart0")
> The devices in the wkup domain are capable of waking up the system from
> suspend. We can configure the wkup domain devices in a generic way using
> the ti-sysc interconnect target module driver like we have done with the
> earlier TI SoCs.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Configure ti-sysc for wkup_uart0
      commit: b0de0b2de409d99408c0f3a38af841ae3bcaa225

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


