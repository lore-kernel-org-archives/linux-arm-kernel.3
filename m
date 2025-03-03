Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B6FC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCkRH65NwGl00HMiThTUBsiZpkAdvh3DpvpaROVnq2g=; b=hib1hPAVMdA4wf44iuhmjWs8uU
	tne5sYCEv2eTRQy9FDeg4qq9cKQmbz+o7kjGDqKM1Jtonfda9LTamlBm4OL7Slh6gmLNlVatE+O3h
	G+5MWJYZAqsgc4PSuPrR/RodMZAGpcOYNsWYuN/6h3f+mHT7fFF86Ux0Mbc7QIONZtp8ot9STzk6V
	TSbN4QgmHY92lK/5dJ6eiTFnuLVt27drInKRISiwWCqsX6muJC6A6BGvk7HBaqN5bmb3tqThBDMV9
	DAMi3Dslov+RNjcgYwGt7osVsH7rm1I0Iil5OA7h8ujneilwHAvcn/I1t+EMa8iPoqQfderbAXcdu
	1W+okdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxnx-0000000HBl6-0xXb;
	Mon, 03 Mar 2025 04:53:25 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxjh-0000000HBDs-2hYB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:49:03 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5234mllH2589775
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 22:48:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740977328;
	bh=FCkRH65NwGl00HMiThTUBsiZpkAdvh3DpvpaROVnq2g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eyehp6S3CddB2RtUJznYJjMIrii+52wavayNT87k8K3Yb4Cij990S0w1duZ8uKqt2
	 yhkz3r2Sv65T6EqIjVXVUVVDkpkan+qEJp+SEgwMm+WXzEI1UUUCGxQqu9UpPYMDZR
	 OwouZ42seINIEgJ4co6r0jGnP60HlHDmBvjivncI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5234mlFO067333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 22:48:47 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 22:48:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 22:48:47 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234mgG2056332;
	Sun, 2 Mar 2025 22:48:43 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <kees@kernel.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, Wadim Egorov <w.egorov@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am64-phycore-som: Reserve RTOS IPC memory
Date: Mon, 3 Mar 2025 10:18:41 +0530
Message-ID: <174092143359.3272913.1513661794535250352.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131093531.1054924-1-w.egorov@phytec.de>
References: <20250131093531.1054924-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_204901_769511_C95F9884 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, 31 Jan 2025 10:35:30 +0100, Wadim Egorov wrote:
> Reserve a portion of memory for inter-processor communication between
> all remote processors running RTOS or baremetal firmware.
> 
> 

I have applied the following to branch ti-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am64-phycore-som: Reserve RTOS IPC memory
      commit: eeab4a777eb490b9eca670379720b938226b1c79
[2/2] arm64: dts: ti: k3-am62-phycore-som: Reserve RTOS IPC memory
      commit: 4ad59ca98c2764ee2a58e48c96338b6fb88ce85a

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


