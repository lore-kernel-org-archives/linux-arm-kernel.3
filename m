Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D72FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q/4BzWAkO+zh9PIsVSkrHOjIySSifAyOimM8ksoJNM=; b=j2OWF6Jh5pxn1jjp9Qyc6uBSRB
	RAQOpFqCxdimBVSp3GNbuJNPnCkJfTdfgtuDV8ztzdOJ3KZnwOOuL6Ve6R8bcnynJKVGTcvkrOrDU
	N4wXFCuOCmZasFNXnQRjilUEjwM7/nSlzOw8E6VvX4X+frFQMS9+AriFisx/K6yL5jS2RyjIwx+ri
	FubpfPGo0WtA7MmCFoBlvdksyGX2ZICSxNyI/MZ2nAw7AM3jV8cYT1D5aS2ZRZCV6CySF0hyE3GNZ
	WK13eZXr/0rv25UiC8Jq0L8UcgR2MnUyeNu/y4rtDscjv6fej2Ow4WzE9hMia8fQFU1UxSh7s2BGB
	SloeLoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVLD-0000000DwYI-2WLf;
	Fri, 07 Mar 2025 10:54:07 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV4T-0000000Dtyl-0nSn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:36:50 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527AakJR3942632
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Mar 2025 04:36:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741343806;
	bh=/q/4BzWAkO+zh9PIsVSkrHOjIySSifAyOimM8ksoJNM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RgBVVqVgcvK/Nii3mcdbyFJ86WQJZs6WZZYiHykmh9RuaLfH5KWoOJfnclNADCM1N
	 U9OsSZbW6sHY3XqqpmKmsjpg3atje4+Of5hv3/XPAi8VbMpVv0bKHRkJz6pFP7PE4B
	 awZQ4hsP7p6RCupDTlppHCeKxmsoN2NexubF5v68=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527AakT9029556;
	Fri, 7 Mar 2025 04:36:46 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 04:36:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 04:36:45 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527Aaf28021789;
	Fri, 7 Mar 2025 04:36:42 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Wadim Egorov <w.egorov@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am62x-phyboard-lyra: Add boot phase tags
Date: Fri, 7 Mar 2025 16:06:36 +0530
Message-ID: <174133309362.1072814.1438889304366712802.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305085537.3976579-1-w.egorov@phytec.de>
References: <20250305085537.3976579-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_023649_320095_81E3A784 
X-CRM114-Status: GOOD (  12.40  )
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

Hi Wadim Egorov,

On Wed, 05 Mar 2025 09:55:33 +0100, Wadim Egorov wrote:
> The bootph-all and bootph-pre-ram tags were introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across different
> boot phases.
> 
> Add boot phase tags to all required nodes to ensure boot support from
> all sources, including UART, USB (DFU), Ethernet, uSD card, eMMC, and
> OSPI NOR Flash.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: k3-am62x-phyboard-lyra: Add boot phase tags
      commit: c2d18ec0ea4ce9d6d8be5a1a9b266f57a40b5e24
[2/5] arm64: dts: ti: k3-am62a-phycore-som: Add boot phase tags
      commit: a5965ee0107a37ca4c73f05f06f55dad759572d2
[3/5] arm64: dts: ti: k3-am642-phyboard-electra: Add boot phase tags
      commit: a9c8485cd13cdffee5bdcda6b625f678900994c4
[4/5] arm64: dts: ti: k3-am642-phyboard-electra: Reorder properties per DTS coding style
      commit: 61a12b5a9923e4beec5595fed3b9c3d5c0c25c32
[5/5] arm64: dts: ti: k3-am62a-phycore-som: Reorder properties per DTS coding style
      commit: a89d3f47b09c793d0454350739ee8695ff30fb5c

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


