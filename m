Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27C0C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MeCrGZ4jM/mwWrVgLXe9zoaYmXCEGbQlg3VQ9zWfSU=; b=hXXtnI9n5zc3Ui4wsOzZuNOwzB
	KRVh1jeGvwBur+t1gI9VdKtEloR9XoV1ANEsk/8fNntqPzyBt80JPnlx9xxTrCEpnQCi9uHES9abe
	bJkD8w76FB18IOu6N2vghLjBC9bloUK8emrpbjX92Zm++AyRNybRvjtnUd/FqwmiO5gyfSLlLuEAa
	WAO+0on6JCKDQIA7KCCZjIjiVDwVc3muDpFtoA+B/HqMmSqwB2SxEs64JRCTpX+uTqKYkU5DgR3fq
	2Ew0LvXTmnMpsGqopW95qetlcQnRNZWlqPAQNee5HcH8FnCW1TcLh0itF+1eEd8InJNw38H6YHLha
	6JkulEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKlG-0000000EBeo-3n2E;
	Mon, 28 Jul 2025 10:07:14 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKik-0000000EBTr-1EV3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 10:04:39 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SA4Poj2280777;
	Mon, 28 Jul 2025 05:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753697065;
	bh=4MeCrGZ4jM/mwWrVgLXe9zoaYmXCEGbQlg3VQ9zWfSU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YHE4xx0Kc2dPbn0pH/EfQnaq8+UU4zfyDALAB0pIR8bJOnLZBfsHAS3XwxKGzUcRs
	 O2OnFBhkyL73APrxAKYDoCoDhwd1Ks99RWiQjmDemWqfZxOlOXtyAovG+YVUwFaq7q
	 BbwCTbSoqY2AMK8lQ8XmM5Ub1B9pIFvNW9W8pZ5w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SA4Pn3212206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 05:04:25 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 05:04:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 05:04:25 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SA4LtQ1566557;
	Mon, 28 Jul 2025 05:04:21 -0500
Message-ID: <b9ae56bf-dd61-414d-9d52-30cd6e4642db@ti.com>
Date: Mon, 28 Jul 2025 15:34:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add DSI display support for TI's Jacinto platforms
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <devarsht@ti.com>
References: <20250716060114.52122-1-j-choudhary@ti.com>
Content-Language: en-US
From: Harikrishna Shenoy <a0512644@ti.com>
In-Reply-To: <20250716060114.52122-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_030438_473574_0458C4EE 
X-CRM114-Status: GOOD (  16.08  )
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


On 7/16/25 11:31, Jayesh Choudhary wrote:
> Hello All,
>
> This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
> - J784S4-EVM
> - J721S2-EVM
> - AM68-SK
>
> SN65DSI86 driver fix that was essential for display is now merged.
>
> There is one more series relevant for driver that makes CDNS-DSI driver
> work better:
> https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/
>
> I have locally tested using kmstest utility on all 3 platforms.
>
> Changelog v2->v3:
> - Cosmetic changes like adding padding and new line before child nodes
> - Using standard node name for regulator and bridge
> - Remove "regulator-always-on" for dp-regulator in am68 and j721s2 board
> - Remove interrupt-parent from dsi nodes
>
> v2 patch link:
> https://lore.kernel.org/all/20250624082619.324851-1-j-choudhary@ti.com/

Reviewed-by: Harikrishna Shenoy <h-shenoy@ti.com>

Tested-by: Harikrishna Shenoy <h-shenoy@ti.com>

>
> Changelog v1->v2:
> - [4/7]: Add gpio-line-names
> - [6/7]: Remove unnecessary clocks from TIDSS
>
> v1 patch link:
> https://lore.kernel.org/all/02f1912f-0a05-4446-923a-7935ed305cb3@ti.com/
>
> Jayesh Choudhary (5):
>    arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
>    arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
>    arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
>    arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
>
> Rahul T R (2):
>    arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
>    arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP
>
>   .../boot/dts/ti/k3-am68-sk-base-board.dts     |  97 ++++++++++++++
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 117 +++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  39 ++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  51 ++++++++
>   .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 121 +++++++++++++++++-
>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  39 ++++++
>   6 files changed, 463 insertions(+), 1 deletion(-)
>

