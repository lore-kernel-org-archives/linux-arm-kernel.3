Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D2ACD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 02:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKNaIvCnm8qUnyfYhGibyJaJtEQHAb1VhcqtfRguFO4=; b=KEJDqE224i0CE9Y+h5TFtLxRFS
	FCxkeHeewTRxlhXzAtXsexNjrHP/s0kiT6GfZT3vaBWq+Gkv0pRYUMRGsVskeNCflIDW+/nTaGvW6
	Ebx4JHyAVlpHgJFxWfeNcD9SCjgD+v1dfC7ueLA+rYdbmpOpTCwOAlO2Wpltd7Kslo8ethxZsLlDi
	MagBa0EC2G+K6gPBM1jkt9Pfl6awQv+kmJlSEpPBBEwzdEZlYz5NHcTgJYZSR7b2EPBWO6UwrzH+W
	cPWGwLZAlcXRBclfJSSd6pRkbWweCoCP43UZW/Iy/myJqsRefEA0D05WegCyexRiIJwmcN/it3gQZ
	BE0BeBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRh8P-00000000pMG-154P;
	Tue, 26 May 2026 02:03:09 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRh8L-00000000pLD-3pWz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 02:03:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MKNaIvCnm8qUnyfYhGibyJaJtEQHAb1VhcqtfRguFO4=;
	b=vnQ8zd26ObL6sz8BBQYf50Rk1KQLIazS4QZSDd4yDPU6l90+E+HaAIdGb5Q0I45iYYIMToehV
	ENPARSZ4+iuNRTJzjJYVycsMhn/yY4VXCOlaeOWbFUe8MGPg2vWLHngy8ZCDG3pORrmQUxsWXQm
	WMjSlPKyK4XdFv+cSAxX+nY=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gPbRd2grYz1K9ZR;
	Tue, 26 May 2026 09:55:09 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id DD2EA40539;
	Tue, 26 May 2026 10:02:52 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 26 May 2026 10:02:50 +0800
Subject: Re: [PATCH v3 01/17] ACPI: GTDT: Account for GTDTv3 size when walking
 the platform timer descriptors
To: Marc Zyngier <maz@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ge Gordon
	<gordon.ge@bst.ai>, BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson
	<lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov
	<ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	=?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>, Heiko
 Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, Orson Zhai
	<orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Michal
 Simek <michal.simek@amd.com>
References: <20260523140242.586031-1-maz@kernel.org>
 <20260523140242.586031-2-maz@kernel.org>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <4d583ddf-13c0-104b-78c4-3f8d89307e72@huawei.com>
Date: Tue, 26 May 2026 10:02:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20260523140242.586031-2-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_190306_603207_63D428D5 
X-CRM114-Status: GOOD (  22.98  )
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

On 2026/5/23 22:02, Marc Zyngier wrote:
> Since ARMv8.1, the architecture has grown an EL2-private virtual
> timer. This has been described in ACPI since ACPI v6.3 and revision
> 3 of the GTDT table.
> 
> An aditional structure was added in ACPICA, though in a rather
> bizarre way, and merged in v5.1 as 8f5a14d053100 ("ACPICA: ACPI 6.3:
> add GTDT Revision 3 support").
> 
> Finally plug the table parsing in GTDT, and correct the parsing of
> the platform timer subtables to account for the expanded size of
> the base table. This also comes with some extra sanitisation of
> the table, in the unlikely case someone got it wrong...
> 
> Suggested-by: Sudeep Holla <sudeep.holla@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   drivers/acpi/arm64/gtdt.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> index ffc867bac2d60..950d5efdf85ea 100644
> --- a/drivers/acpi/arm64/gtdt.c
> +++ b/drivers/acpi/arm64/gtdt.c
> @@ -34,14 +34,25 @@ struct acpi_gtdt_descriptor {
>   	void *platform_timer;
>   };
>   
> +struct gtdt_v3 {
> +	struct acpi_table_gtdt	gtdt_v2;
> +	struct acpi_gtdt_el2	el2_vtimer;
> +};
> +
>   static struct acpi_gtdt_descriptor acpi_gtdt_desc __initdata;
>   
>   static __init bool platform_timer_valid(void *platform_timer)
>   {
>   	struct acpi_gtdt_header *gh = platform_timer;
> +	void *platform_timer_begin;
>   
> -	return (platform_timer >= (void *)(acpi_gtdt_desc.gtdt + 1) &&
> -		platform_timer < acpi_gtdt_desc.gtdt_end &&
> +	if (acpi_gtdt_desc.gtdt->header.revision >= 3)
> +		platform_timer_begin = container_of(acpi_gtdt_desc.gtdt, struct gtdt_v3, gtdt_v2) + 1;
> +	else
> +		platform_timer_begin = acpi_gtdt_desc.gtdt + 1;
> +
> +	return (platform_timer >= platform_timer_begin &&
> +		platform_timer + sizeof(*gh) <= acpi_gtdt_desc.gtdt_end &&
>   		gh->length != 0 &&
>   		platform_timer + gh->length <= acpi_gtdt_desc.gtdt_end);
>   }
> @@ -166,6 +177,13 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
>   	u32 cnt = 0;
>   
>   	gtdt = container_of(table, struct acpi_table_gtdt, header);
> +
> +	if ((gtdt->header.revision >= 3 && gtdt->header.length < sizeof(struct gtdt_v3)) ||
> +	    (gtdt->header.revision == 2 && gtdt->header.length < sizeof(*gtdt))) {
> +		pr_err(FW_BUG "GTDT with invalid size %d\n", gtdt->header.length);
> +		return -EINVAL;
> +	}
> +
>   	acpi_gtdt_desc.gtdt = gtdt;
>   	acpi_gtdt_desc.gtdt_end = (void *)table + table->length;
>   	acpi_gtdt_desc.platform_timer = NULL;

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

