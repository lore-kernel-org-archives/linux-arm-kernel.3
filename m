Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E190BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pr/6oSAqPnzYKPrrPRbVgCiKh0qVmQrFdTLVSe8INZs=; b=IoAIDZIN2du+ASZM6KpF70PeRv
	FIHEvQhNheJ2441Ru07o0VlhLFzb2YmsONZIrlMO8jvw9DpsrzDbrnjMYs143bIdiyIFDJiLzqOqF
	C4uO0ak/9wPElY5hpNshh+dsCqx6nLpKrl8J1rWLqLjgVWH08cIkusyrpx3vKlaJ/yg8y5qyFTssR
	KFS7SrBIPhSayV5wsq+ZiErTsEuoEaFDYqTV3ycaq6LJpxfd7M6eGBZcUPAr6SxcJzCJu+qto1DTH
	bK/lGAkAp5Dq7pwlJziXyJfcxWe7opFOo57BFyY8pzdgdVdtCv7Y1Vi43T1QrPsxvZDKsjQEVr5JQ
	IpRtXonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGYD-00000009hku-2TWv;
	Fri, 25 Jul 2025 11:25:21 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFzW-00000009dLQ-1gRj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:49:31 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56PAnQGY2164129;
	Fri, 25 Jul 2025 05:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753440566;
	bh=Pr/6oSAqPnzYKPrrPRbVgCiKh0qVmQrFdTLVSe8INZs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GszfsmcvHy6Xqg10sI/4FGHa6nXKEGw5pili1Qh/XAtrjH9hain81E9XdqUW+GLBf
	 InMiSh5ZC88O+NIS1bYV87nN7Xx22IOrI5W4AmZv91r/5GJhSZdBKkv+ZY0JDyQWva
	 N/0YzhPjf1m2t3TzI9qyOALO0ATfdhGMAUbamBpo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56PAnQvY3172460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 25 Jul 2025 05:49:26 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 25
 Jul 2025 05:49:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 25 Jul 2025 05:49:25 -0500
Received: from [172.24.18.25] (lt5cd2489kgj.dhcp.ti.com [172.24.18.25])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56PAnL3J1927218;
	Fri, 25 Jul 2025 05:49:22 -0500
Message-ID: <6a8545a6-14f0-4da9-a15f-504f0f3791be@ti.com>
Date: Fri, 25 Jul 2025 16:19:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add DSI display support for TI's Jacinto platforms
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250716060114.52122-1-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250716060114.52122-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_034930_529679_97C08BDB 
X-CRM114-Status: GOOD (  16.60  )
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


On 7/16/2025 11:31 AM, Jayesh Choudhary wrote:
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

For series

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
> Changelog v2->v3:
> - Cosmetic changes like adding padding and new line before child nodes
> - Using standard node name for regulator and bridge
> - Remove "regulator-always-on" for dp-regulator in am68 and j721s2 board
> - Remove interrupt-parent from dsi nodes
>
> v2 patch link:
> https://lore.kernel.org/all/20250624082619.324851-1-j-choudhary@ti.com/
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

