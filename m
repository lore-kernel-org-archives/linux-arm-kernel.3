Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262D9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8TuloVcDoxRcDVBKwXj6LZhpioTi4Wo9bQZpOdphDk=; b=dSkrrbLhcEYigALIF54KCE9Gms
	wic1FMKxe72+rSXphS0AF1gMonBfozesxeRNfXgSxty3jbQAq6O/wQtjpTREWUg+2SoZ4NMP6Toht
	iBMSfg2snTblWl07fD4unE+XPrj97UmYbFjoRfsUh5SdSMB4133BDPVlY1YGEGylicAAUVYyfJrwg
	6Wnll2Uj1CDbtYaeFz0hDLJelTFJmYX6XtqU7w7k6hZKAHEIYrc+zTnioReD9B+2IdaV7byYjXQCR
	kPsp+jmROtqj6h9Waqbt0Jr+tXuSIYqCKkw5blqT46CcT0zoqz8GrF/0N/SghXVC9CrG2sqVe0qVr
	/1uMA5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAlz-00000002W74-2XII;
	Wed, 26 Feb 2025 06:19:59 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAkR-00000002VpF-2I5n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:18:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51Q6IEE71383194
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 00:18:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740550694;
	bh=G8TuloVcDoxRcDVBKwXj6LZhpioTi4Wo9bQZpOdphDk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sxP3HswGCwWbrDxJsI19Ccv5P4GIoMX95NtmgkUrHnoFZOTNpJdgfgTLnnfzvrxnC
	 maKAzLi1q3d75Ox6loFNLYDCIW/RiTxt2zF+TfCdZbIYG6FnbQAnqvuV41afz1h24Y
	 Zm2Gv1EU3ZAYMXUYdxPMDCndXtqO6Zl/by3W3lsI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51Q6IEwS125352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 00:18:14 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 00:18:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 00:18:14 -0600
Received: from [172.24.18.117] (lt9560gk3.dhcp.ti.com [172.24.18.117])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51Q6IBcG068437;
	Wed, 26 Feb 2025 00:18:12 -0600
Message-ID: <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
Date: Wed, 26 Feb 2025 11:48:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable HSR driver
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <quic_bjorande@quicinc.com>, <krzysztof.kozlowski@linaro.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        "Anwar, Md Danish"
	<danishanwar@ti.com>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20240419060013.14909-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_221823_636952_44881316 
X-CRM114-Status: GOOD (  15.43  )
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

Hi all,

Apologies in case you are receiving this email for the second time.
Any reason why this patch hasn't been merged yet. Other than re-basing 
this to the tip, anything else which needs to be addressed to get this 
merged?

Thanks & Regards,
Meghana Malladi.

On 4/19/2024 11:30 AM, Ravi Gunasekaran wrote:
> HSR is a redundancy protocol that can be realized with any
> two port ethernet controller.
> 
> Many of TI's K3 SoCs support multi port ethernet controller.
> So enable HSR driver inorder to support this protocol on
> such SoCs.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 11fa4aa40094..750343564f41 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -176,6 +176,7 @@ CONFIG_NET_CLS_FLOWER=m
>   CONFIG_NET_CLS_ACT=y
>   CONFIG_NET_ACT_GACT=m
>   CONFIG_NET_ACT_MIRRED=m
> +CONFIG_HSR=m
>   CONFIG_NET_ACT_GATE=m
>   CONFIG_QRTR_SMD=m
>   CONFIG_QRTR_TUN=m


