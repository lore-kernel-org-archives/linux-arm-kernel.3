Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02414C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/t8lLUiFoXTd5zgRP+4OV8+E8OvgbBaVBJMzxkwCWI=; b=seBsq1d7LhUOC8YW7BQo3cGwEW
	/Nnt5dVQOtl66XWfPf/zyNA5PPhG4wXP1wcatJgShMf4UznpJnPKzzoVtJ0GUvds4FFllHYJkqf5l
	oiD73QRW0/XukAPyFmHq0EWlOfZDY400VOdSAKtJzvy9xaE2trg9KX+C8yldZDpt1FqSRCnxCbs4d
	I8c9iaRcgwo7EhG1l65k2r5y7dGSQU2YjyPqCP7OVAp7DYmCGlq0tehJ7ks656bjwLN4FmOc7s6sB
	5vzrEBT3G9WoHHDWpmtAyokiyoCMChwp/4JgDH1U+zR2Ld+/9skx70tFg7gvW4zImg9zHrQlanurH
	QKYk/fwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaPP-0000000CDrZ-46LW;
	Thu, 12 Jun 2025 05:23:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaLZ-0000000CDUB-0dMe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 05:19:31 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C5JM1d2777716;
	Thu, 12 Jun 2025 00:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749705562;
	bh=Z/t8lLUiFoXTd5zgRP+4OV8+E8OvgbBaVBJMzxkwCWI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PwN9NjQqcsSqDe2oXG6CwGyH1Mrjr65I8EpYBao1jJSoP+RHyQSQf+FbbH4Xra024
	 RsAk1NH0SdfifAui2hIR5DrRmPke6zP2pxI/FSwboeX9KQ9Ynv6LprE7W15aXhaUbj
	 tz4119hXwH/kIMn0EHkx9cO93VCjo7nFgL0cA/Fw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C5JM223383057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 00:19:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 00:19:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Jun 2025 00:19:22 -0500
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C5JHui1457466;
	Thu, 12 Jun 2025 00:19:18 -0500
Message-ID: <03555d09-e506-4f48-a073-b06b63e1af4a@ti.com>
Date: Thu, 12 Jun 2025 10:49:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Read firmware-names from
 device tree
To: Jakub Kicinski <kuba@kernel.org>
CC: Meghana Malladi <m-malladi@ti.com>, Paolo Abeni <pabeni@redhat.com>,
        Eric
 Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
References: <20250610052501.3444441-1-danishanwar@ti.com>
 <20250611170211.7398b083@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250611170211.7398b083@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_221929_283915_A9BBB1CD 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Jakub

On 12/06/25 5:32 am, Jakub Kicinski wrote:
> On Tue, 10 Jun 2025 10:55:01 +0530 MD Danish Anwar wrote:
>> Refactor the way firmware names are handled for the ICSSG PRUETH driver.
>> Instead of using hardcoded firmware name arrays for different modes (EMAC,
>> SWITCH, HSR), the driver now reads the firmware names from the device tree
>> property "firmware-name". Only the EMAC firmware names are specified in the
>> device tree property. The firmware names for all other supported modes are
>> generated dynamically based on the EMAC firmware names by replacing
>> substrings (e.g., "eth" with "sw" or "hsr") as appropriate.
> 
> Could you include an example?

Sure. Below are the firmwares used currently for PRU0 core

EMAC: ti-pruss/am65x-sr2-pru0-prueth-fw.elf
SW  : ti-pruss/am65x-sr2-pru0-prusw-fw.elf
HSR : ti-pruss/am65x-sr2-pru0-pruhsr-fw.elf

If you look closely you'll see the names of all three firmwares are same
except for the operating mode.

In general for PRU0 core, firmware name is,

	ti-pruss/am65x-sr2-pru0-pru<mode>-fw.elf

Since the EMAC firmware names are defined in DT, I am reading those
directly and for other modes just swapping mode name. i.e. eth -> sw or
eth -> hsr.

I will add this example in commit msg in next revision.

> 
>> This improves flexibility and allows firmware names to be customized via
>> the device tree, reducing the need for code changes when firmware names
>> change for different platforms.
> 
> You seem to be deleting the old constants. Is there no need to keep
> backward compatibility with DT blobs which don't have the firmware-name
> properties ?

ICSSG-PRUETH driver is only supported by AM65x and AM64x and both the
DTs have the firmware name property. So I don't think there is any need
to maintain the older hard coded values.

AM65x -
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/arch/arm64/boot/dts/ti/k3-am654-icssg2.dtso#n28:~:text=pru2_1%3E%2C%20%3C%26rtu2_1%3E%2C%20%3C%26tx_pru2_1%3E%3B-,firmware%2Dname,-%3D%20%22ti%2Dpruss/am65x

AM64x -
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/arch/arm64/boot/dts/ti/k3-am642-evm.dts#:~:text=tx_pru1_1%3E%3B-,firmware%2Dname,-%3D%20%22ti%2Dpruss

Let me know if this is okay.

-- 
Thanks and Regards,
Danish

