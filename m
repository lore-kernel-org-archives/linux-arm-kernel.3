Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E96CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOw2qc5uTTadm+FwJMr/jc3sueTsMi+eiVewiY1neSo=; b=OExWD5mbRhXCeXlCBBT0ss+yMQ
	nzAgsmc5KLVlvloJPxdL5nGvXrtxvd45Q0qnHYyfQPqxp1jqd5cWTOoZ8rKnR9SxIQpzk8BmqDjY4
	Q+RJyragsWyGDHv0Q5j4oYY7XkgJBQjWTVLrr00c8jqSBD3i1HKT+S20/tAs/B255pGgnBKH3nXFZ
	aR+zbVYdum17MUQkE38YqW0iizchgefxgo3cqJfJQQ22qpqo2zWcog0kZV0+JGc8ZUUqy9n0rlES8
	uMUk4Yq/kbcYN/+FamYBZCKVVFlYhhPmGGf765EdlXTKuaBRZo0u3jZvO/QnolDHu/M6YAr5COP8o
	d2WYv9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umC3z-0000000DrUD-3kKr;
	Wed, 13 Aug 2025 14:02:47 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBKJ-0000000Dje0-3CSe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:15:37 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DDFWtc1705331;
	Wed, 13 Aug 2025 08:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755090932;
	bh=wOw2qc5uTTadm+FwJMr/jc3sueTsMi+eiVewiY1neSo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CbJPAx9ayLZOjdJf6yfzZo0UwzCQHJiQwhBoB8OjZtQ7JyEe55r6YOIVsjjZQcqw2
	 Uf3oZ/cxo1bxKjRgETND4Uqjr41Nc0HsYxVspcI+c+0l4bku5Ybl9NhIZhjNZ0gXvT
	 cjTXAOPlerOZxe9tr0pRXN9f7t6nwTGgthwqrs/c=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DDFWR31097033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 08:15:32 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 08:15:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 08:15:31 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DDFUfV2039114;
	Wed, 13 Aug 2025 08:15:31 -0500
Date: Wed, 13 Aug 2025 18:45:30 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62x-sk-common: Remove the
 unused config from USB1_DRVVBUS
Message-ID: <20250813131530.apibc4p6t2uo5bkr@lcpd911>
References: <20250731115631.3263798-1-a-kaur@ti.com>
 <20250731115631.3263798-3-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250731115631.3263798-3-a-kaur@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061535_894106_AA7027F8 
X-CRM114-Status: GOOD (  25.73  )
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

On Jul 31, 2025 at 17:26:30 +0530, Akashdeep Kaur wrote:
> After the SoC has entered the Deep Sleep mode, USB1 can be used to wakeup

Just leaving my comments on the commit message here since 1st patch
seems to be pretty much the same commit message.

Let's reword this as --> Deep Sleep low power mode.
Makes it a bit more clear.

> the SoC based on USB events triggered by USB devices. This requires that
> the pin corresponding to the Type-A connector remains pulled up even after
> the SoC has entered the Deep Sleep mode.
> For that, either deep Sleep pullup can be selected or the pin can have the

Nit: Be consistent with either deep sleep, or Deep Sleep, don't mix case.
Also, please can we talk here in terms of exactly which macros we're
talking about? For eg. if deep sleep pullup == PIN_DS_PULLUD_ENABLE, then
please mention that in a bracket or something for people who may not
necessarily be aware of all these terms.


> same configuration that it had when SoC was in active mode.
> In order for deep sleep configuration to take effect, the deep sleep
> control bit has to be enabled.

Please talk with some references, because not everyone will be able to
follow what we mean by deep sleep control bit/ deep sleep configuration.

> Remove the deep sleep state configuration from USB1_DRVBUS pin as it is
> anyways not taking effect (deep sleep control bit is not set).
> 
> This reverts commit 527f884d2d94981016e181dcbd4c4b5bf597c0ad.

And so are you in conclusion saying that this patch is just unnecessary/
useless? The bracket message feels to me that you are saying that if we set
the deep sleep control bit this patch will start working as expected?
Please can you clarify a bit on that end?

> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index 13e1d36123d5..d3bed23134ca 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -249,7 +249,7 @@ AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19/V15) RGMII1_TX_CTL */
>  
>  	main_usb1_pins_default: main-usb1-default-pins {
>  		pinctrl-single,pins = <
> -			AM62X_IOPAD(0x0258, PIN_OUTPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (F18/E16) USB1_DRVVBUS */
> +			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18/E16) USB1_DRVVBUS */
>  		>;
>  	};
>  

Sorry for the long review on the commit message, but context feels like
everything when it comes to small patches. Hence trying to make sure
everyone understands what's being done here... :)

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

