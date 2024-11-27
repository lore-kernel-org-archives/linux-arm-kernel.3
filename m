Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD5AD609AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5MEcsWepkzSagRcBdjCCQ9PHoHda5oErgZwMaMz09A=; b=SWkZCBTK7adGbpW9GoQgD8dUuY
	N7b8btkjT0vRBt2qwIDqlzyUQh35hiJIExrj+UdzJj5aNsbGdS4XYbwbEyiz9EDYcsmgRD/Tg7fQz
	Ckoc75ZqqWlZfTaDYn/6zgG+E2nqm0Y348jeegQwHwaHXmfizFBXcaa8b+SmNX+tGc4t1mPSqdsAR
	9+qbzpeS5gr274qnPdcNzdcTliNkiJ0EvcR5W/X8hlDp5jhqUO9jqx84nnk8mFSLH7LbLeN6byoPm
	Q3UU8lYyOrHuZ/k3JX4swK2UX2+CDo2O2/VDlxprxIyt9BgELWLFXK2s3OEcgl+e2noAYROslHqAo
	2RTitWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDOU-0000000CZPo-2UJH;
	Wed, 27 Nov 2024 08:27:30 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDNW-0000000CZJH-3tDh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 08:26:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AR8QQn0969158
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 27 Nov 2024 02:26:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732695986;
	bh=x5MEcsWepkzSagRcBdjCCQ9PHoHda5oErgZwMaMz09A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=C6qpG9NPchNMwdzzhI2F73hWyMMqNewZk+mct8g+YvmTN9L52rY4N124GsIkTAflU
	 awKz7UVYfCSUVdgxtgiQjKPt91Al5jI6Y05eIHLdAlBpb9ih1auCl7G1VTx3CBFdAB
	 ATCb9bbkCcroJtBrWm5EmjRwUjJXBNrI6wgj+Jj0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AR8QQtT121482;
	Wed, 27 Nov 2024 02:26:26 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Nov 2024 02:26:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Nov 2024 02:26:25 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AR8QON2092114;
	Wed, 27 Nov 2024 02:26:25 -0600
Date: Wed, 27 Nov 2024 13:56:23 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dasnavis Sabiya <sabiya.d@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
Message-ID: <2nuncc5rscu6h74ylaiu6yozg34aoigaj5d4uzvdtolt5q7bmv@6hacpxyb2532>
References: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_002631_063737_916CC427 
X-CRM114-Status: GOOD (  20.38  )
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

On Tue, Nov 26, 2024 at 11:08:19AM +0100, Enric Balletbo i Serra wrote:

Hello Enric,

> From: Dasnavis Sabiya <sabiya.d@ti.com>
> 
> AM69 SK board has two stacked USB3 connectors:
>    1. USB3 (Stacked TypeA + TypeC)
>    2. USB3 TypeA Hub interfaced through TUSB8041.
> 
> The board uses SERDES0 Lane 3 for USB3 IP. So update the
> SerDes lane info for PCIe and USB. Add the pin mux data
> and enable USB 3.0 support with its respective SERDES settings.
> 
> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> ---
> I've been carrying this patch for quite long time in my builds to have
> support for USB on my AM69-SK board without problems. For some reason this
> patch was never send to upstream or I couldn't find it. So I took the
> opportunity, now that I rebased my build, to send upstream.
> 
> I have maintained the original author of the downstream patch as is
> basically his work.
> ---
>  arch/arm64/boot/dts/ti/k3-am69-sk.dts | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts

[...]

> +&usb0 {
> +	status = "okay";
> +	dr_mode = "host";

Since the Type-C interface is also connected to USB0, shouldn't "dr_mode"
be "otg"? Also, has the Type-C interface been tested with this patch?
Please let me know.

[...]

Regards,
Siddharth.

