Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1FDD68B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxKuovhL+u1OFBpfTXmEVoSjj1ikzv01SBbPzszYYgc=; b=L1k3X62WZzOhZogsYZ/yDhtsXH
	rzBwXagl3TF3h2WrpAAR8Q+99zTWnbmAKnBV63kZAGHeTQpSk1Qgdyk6Mb0gfJd+3uW+yBWyZYwtV
	LXiNgvI7Hle6kMO/hdOHkAA1WFMs7L3ruzIL25cYA27bvrLllssAvmjCO/gQWP/MVENzE84AxcmUL
	XbSTXRFrm34l1V+6YVEzgHQ5EbTVuhKsPREbAZZppaSqaewI8r7oCjGXDH0MuWMnEfCSsLDv7z/LZ
	5ZYFffkxDB6X6kh024ecH6w3SDEFpSVO6z67MjbU/lhsnriWOzj1MyeDGr+3Z01JinuRSFhK7WjIO
	I0AZWGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcvv-00000000B1t-3woS;
	Thu, 14 Nov 2024 16:43:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcr3-00000000A60-0Yza
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:CC:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QxKuovhL+u1OFBpfTXmEVoSjj1ikzv01SBbPzszYYgc=; b=i7I8dX3ii7Rhnrn4ZR+XsQPWVD
	i5RytYkBV9RUTpwlusGzGFHsdTsgvMF3rRYevJYzfl6H1LayHyZrzvwaS3yXGHCz7ImmdwJIFCpsf
	uOnaLi+ycM8VhSpWtJL+CjLjGYIAaXJQxSARrwVVe3eDU07H7weJOo6wwiFBaXJ4eCBicDsAABKsC
	TyZEW0R9emldAFubMe3m1Wyafr/9PltHNg4XrBrn9ujnxw3x6aumCHGnxgozuAtlrPfVTUY7J7WNL
	vBrcMS1SV1X2MQKjl/j47S0r6NX3+WvON3V/dDwBfojhgegs+3mT7kWJulQPaEkqjavlDI/6apYQn
	GZIi6xWQ==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbGG-000000002b1-0Ca6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 14:55:58 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xq36N6rHXz10R0K;
	Thu, 14 Nov 2024 22:52:44 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id DA8D218009E;
	Thu, 14 Nov 2024 22:55:15 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 14 Nov 2024 22:55:15 +0800
CC: <yangyicong@hisilicon.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <fanghao11@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH] ACPI/IORT: Add PMCG platform information for HiSilicon
 HIP09A
To: Qinxin Xia <xiaqinxin@huawei.com>, <lpieralisi@kernel.org>,
	<guohanjun@huawei.com>, <sudeep.holla@arm.com>
References: <20241107094036.2398983-1-xiaqinxin@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <4ac9e057-725c-a0ae-e2db-612ea359bec1@huawei.com>
Date: Thu, 14 Nov 2024 22:55:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20241107094036.2398983-1-xiaqinxin@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_145557_145565_F50707F2 
X-CRM114-Status: GOOD (  13.65  )
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

On 2024/11/7 17:40, Qinxin Xia wrote:
> HiSilicon HIP09A platforms using the same SMMU PMCG with HIP09
> and thus suffers the same erratum. List them in the PMCG platform
> information list without introducing a new SMMU PMCG Model.
> 
> Update the silicon-errata.rst as well.
> 
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  Documentation/arch/arm64/silicon-errata.rst | 4 ++--
>  drivers/acpi/arm64/iort.c                   | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 65bfab1b1861..b21c0b1ed567 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -255,8 +255,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Hisilicon      | Hip08 SMMU PMCG | #162001800      | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
> -| Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
> -|                | ,11} SMMU PMCG  |                 |                             |
> +| Hisilicon      | Hip{08,09x,10x, | #162001900      | N/A                         |
> +|                | 11} SMMU PMCG   |                 |                             |
>  +----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 4c745a26226b..bf3be532e089 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1703,6 +1703,8 @@ static struct acpi_platform_list pmcg_plat_info[] __initdata = {
>  	/* HiSilicon Hip09 Platform */
>  	{"HISI  ", "HIP09   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
>  	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
> +	{"HISI  ", "HIP09A  ", 0, ACPI_SIG_IORT, greater_than_or_equal,
> +	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
>  	/* HiSilicon Hip10/11 Platform uses the same SMMU IP with Hip09 */
>  	{"HISI  ", "HIP10   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
>  	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
> 

