Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81241C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ohhDmYgT4iRXwmxU5hvtsiljsDCgkDmDEH4pQmV+YA=; b=STo/V0eDAjCQrbuaw4az+y7R0s
	U4AIS4e4zC5StE+kkUr5XBeAnS6PRAPxTSrhKv8rSDVuRYuKxPz5ZjKsLAMwSCSrARHlS08/050wh
	ZzlDZxjdGdbSo155yYx7IxzoPbn3vPEBQ42KlxfMKdO8HirQ+JiyMJ/q6VDZGSiCwCnmqXsjOagk3
	Jp4gj3TRUef7YcWMg/o/3b7+PqDnQ7Tf0o9faR3+/qmM8BblFNcQUUCzdQo/T5AcJkWn99ViMdfct
	OOlNqqKP8c0VVqeKf5TrAtPeD/t1INeHPLmXHHIi8IrBM5IxgyWxr4ryDnpQUSRjy/DsS3oasqPqK
	HfqtjdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tip6j-0000000DoKG-221V;
	Fri, 14 Feb 2025 06:23:25 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tip5H-0000000Do9c-3F7P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:21:57 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51E6LgKK795495
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 00:21:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739514102;
	bh=8ohhDmYgT4iRXwmxU5hvtsiljsDCgkDmDEH4pQmV+YA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CQNrKKdK0J55rF7Yz/91T70Rsnl1AHvipTeT3OaZ4GThpta5XOaGRTP2LFP5KPqHF
	 /78No/Q1Q3KBj3qcKD7w/5h6c5PPCvJr8gKpKK/dsSCti1kuQsl2MlT+ziT1nxji3X
	 1wvJMEAIvRhGfrI78g1RS2MGHFRMLlmrM+IUoyOk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51E6Lg99012724
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Feb 2025 00:21:42 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 00:21:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 00:21:42 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51E6Lf8n123354;
	Fri, 14 Feb 2025 00:21:42 -0600
Date: Fri, 14 Feb 2025 11:51:41 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <msp@baylibre.com>,
        <khilman@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add alias for RTC
Message-ID: <20250214062141.gdmkepuuyqb22xuh@lcpd911>
References: <20250212210604.745175-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250212210604.745175-1-k-willis@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_222155_902927_A7C1BA39 
X-CRM114-Status: GOOD (  19.85  )
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

On Feb 12, 2025 at 15:06:04 -0600, Kendall Willis wrote:
> From: Vibhore Vardhan <vibhore@ti.com>
> 
> Adds alias for SoC RTC so that it gets assigned rtc0. PMIC node is
> assisgned rtc1 so that PMIC RTC gets probed as rtc1. This makes it

Nit: Fix the spelling of assigned please.

> consistent for testing rtcwake with other AM62 devices where rtc0
> is SoC RTC.
> 
> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
> [k-willis@ti.com: Reworded commit message]
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> Tested with rtcwake on AM62A.

Any test logs you can provide would be great!

> 
> Original patch for AM62A existed in the TI Vendor tree with Vibhore's
> authorship:
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.6.y&id=f745d9063212d1088dcfb068ecb4b16648b96487
> ---
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index a6f0d87a50d8..51ea961f166e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -22,6 +22,8 @@ aliases {
>  		serial3 = &main_uart1;
>  		mmc0 = &sdhci0;
>  		mmc1 = &sdhci1;
> +		rtc0 = &wkup_rtc0;
> +		rtc1 = &tps659312;
>  	};
>  
>  	chosen {
> 
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b

It's nice that you've mentioned this, but it seems to be from Feb2.
Can you please base it on latest linux-next when you send in future?
This will avoid any merge conflicts in advance.

For this though, you may get away with it because nobody else may have
touched this file so far...

If you do send a v2, feel free to pick:
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

