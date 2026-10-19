Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65018CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfWxx76uGZPAx8muZb+AM8rdjUCDSsgdX5aqqxf1ygs=; b=FzBZKaK6M3XHGXwMIpNPIR2keB
	l2Sjweyqr7+jrEOoSnmRvUVTivX9uipSHLVXuRWHRO6EsVvzQWnQEHfARqwJuP5V3x4lWunyfBcA2
	1KzY1tGxvqlxrC4l2/9z1Aj072Bc5WAw2MpWQVTFr18e4tKsqqjQiVqkr739xpl/CbiBkBcJFZqHj
	oGhANMGkgTjSpK1vZCLyALO/G7yJAhp27xdOLt0uXYvwCSSEjU4RQaql2CcsMFjFSh9OYampGVSI1
	iyrBJ0/mlyDntd0ARgAtT9JlowO8AJQ1DSrgCSBTUaAzAJytjoKt9efhRebExyk4GyaGDbvMPG65z
	eX0+IrZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIi8Z-00000006mzu-2WbY;
	Mon, 19 Oct 2026 07:50:27 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIi8U-00000006myw-1l2s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 07:50:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TfWxx76uGZPAx8muZb+AM8rdjUCDSsgdX5aqqxf1ygs=;
	b=YNnmNWHzcUWkPqEB70mQCx/3LrJHVntKBiorFx2yuGzGuXBMZGsS5m3s7i+MVMPpNingdYxcJ
	dSbPfSOOUuGelLhPxFklSehjTiMP5AdXzNPG+Hp4MHTlEUgBwjYePfzuEIXikra/ulYGXw+c2vS
	vv3T+GOGL/E/c4JyJugKQ2g=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j7SPl1wLvzcb4D;
	Mon, 19 Oct 2026 15:50:03 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 66CFB4057F;
	Mon, 19 Oct 2026 15:50:09 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 kwepemk300013.china.huawei.com (7.202.194.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 19 Oct 2026 15:50:08 +0800
Message-ID: <2c90472e-b178-4d11-9e55-5faf4fc579c8@huawei.com>
Date: Mon, 19 Oct 2026 15:50:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/12] arm64: tlbid: Set up CPU domain bitmaps
To: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <linux-efi@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Linu
 Cherian <linu.cherian@arm.com>, Anshuman Khandual
	<anshuman.khandual@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba
	<fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden
	<seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
	<yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
	<ilias.apalodimas@linaro.org>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <20261001110655.461473-8-kristina.martsenko@arm.com>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <20261001110655.461473-8-kristina.martsenko@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_005022_956836_323ABB82 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Hi,

On 2026/10/1 19:06, Kristina Martšenko wrote:
> +static int __init init_cpu_domain_bitmaps(struct tlbi_domain *domains)
> +{
> +	int cpu;
> +
> +	cpu_domains = kcalloc(nr_cpu_ids, sizeof(*cpu_domains), GFP_KERNEL);
> +	if (!cpu_domains)
> +		return -ENOMEM;
> +
> +	for_each_possible_cpu(cpu) {
> +		cpu_domains[cpu] = bitmap_zalloc(domain_count, GFP_KERNEL);
> +		if (!cpu_domains[cpu])
> +			return -ENOMEM;
> +
> +		for (int i = 0; i < domain_count; i++) {
> +			if (cpumask_test_cpu(cpu, domains[i].cpus))
> +				set_bit(i, cpu_domains[cpu]);
> +		}
> +	}
> +
> +	return 0;
> +}
The same minor issue: init_cpu_domain_bitmaps has a memory leak per CPU
if bitmap_zalloc() fails during execution, the allocated bitmap will be
leaked.

Thanks,
Jinqian

