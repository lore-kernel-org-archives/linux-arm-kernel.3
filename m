Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FA8CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dl5RLVgDUnKMmfwkyYpV+I64OLaYgtn2GgeN1aSXzxk=; b=wMlDKDaTUTisu03Y1prm4mY2Dh
	okcof4WRrZqgCiDevamd3cp34f++cNN0dda252PW0kATYQ7gaxHgcyhjEuBBjmJUb2n1oYJZK87V6
	eYmMSBwWEJbBAby8YK7Mngy6DECmHUeE7aflw3wyDHv1o8t/kyYfkXuYm9O8JWDZdweTy2WnbxVMP
	+ndbhSlaUt8eHnf8wNALw2zlCzDBWzzBxWzCZZzwxpa0JzvwcpTAvlAvCCfyaBz6ujmpGoqQEaPwx
	BMXGH2pcctf7pXwPDVZDMGIuoDVe+62NZsh4rqCjx6T6j1F9ZcGiPhdltxHN1xCLRR7xx1Wm2QNBu
	tmjVnTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhwp-00000006m5D-0Ftw;
	Mon, 19 Oct 2026 07:38:19 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhwm-00000006m4Z-29Jt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 07:38:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dl5RLVgDUnKMmfwkyYpV+I64OLaYgtn2GgeN1aSXzxk=;
	b=oUtFqMPX256inh7nC7a+6PjRlRe1sqcp+mWOt6JQZCRkpGSMf5H8qLiMbX8sCSKJoI+nPSTnr
	fPGZUtnBPFPu/404GHMvOpJF0YS9cvIRkEaXNv/uKSuyEpoWhXRD+/9jcT1PqkfkYXW7vduDrv4
	rtVICoS3BdIIXxZ0JSxO/D0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j7S7s1VHnz1prRJ;
	Mon, 19 Oct 2026 15:38:01 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id D70DB40575;
	Mon, 19 Oct 2026 15:38:03 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 kwepemk300013.china.huawei.com (7.202.194.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 19 Oct 2026 15:38:02 +0800
Message-ID: <49e48aac-8d84-4786-9e3e-04e1c2fef020@huawei.com>
Date: Mon, 19 Oct 2026 15:38:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/12] ACPI: TLBI: Parse domains from table
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
 <20261001110655.461473-7-kristina.martsenko@arm.com>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <20261001110655.461473-7-kristina.martsenko@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_003816_867732_7B759710 
X-CRM114-Status: GOOD (  10.18  )
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
> +static int __init parse_tlbi_table(void)
> +{
> +	struct acpi_table_header *table __free(acpi_put_table) =
> +		acpi_get_table_pointer(ACPI_SIG_TLBI, 0);
> +	u32 offset;
> +	int ret;
> +
> +	if (IS_ERR(table))
> +		return PTR_ERR(table);
> +
> +	tlbi = (struct acpi_table_tlbi *)table;
> +	if (tlbi->header.length < sizeof(*tlbi) ||
> +	    tlbi->domain_count > MAX_TLBI_DOMAINS)
> +		return -EINVAL;
> +	if (!tlbi->domain_count)
> +		return -ENOENT;
> +
> +	domain_count = tlbi->domain_count;
> +	domains = kcalloc(domain_count, sizeof(*domains), GFP_KERNEL);
> +	if (!domains)
> +		return -ENOMEM;
> +
> +	offset = tlbi->domains_offset;
> +
> +	for (int i = 0; i < domain_count; i++) {
> +		struct acpi_tlbi_domain *domain = tlbi_get_domain(offset);
> +
> +		if (!domain || domain->id > U16_MAX)
> +			return -EINVAL;
> +
> +		domains[i].id = domain->id;
> +		if (!zalloc_cpumask_var(&domains[i].cpus, GFP_KERNEL))
> +			return -ENOMEM;
> +
> +		ret = parse_tlbi_domain(domain, domains[i].cpus, 0);
> +		if (ret)
> +			return ret;
> +
> +		offset += domain->length;
> +	}
> +
> +	ret = validate_tlbi_domains();
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +void __init acpi_tlbi_init(void)
> +{
> +	int ret;
> +
> +	if (!cpus_have_final_cap(ARM64_HAS_TLBID))
> +		return;
> +
> +	ret = parse_tlbi_table();
> +	if (ret) {
> +		if (ret != -ENOENT)
> +			pr_err("Failed to parse ACPI table\n");
> +		return;
> +	}
> +}

The error paths in parse_tlbi_table() return without freeing
"domains" or the cpumask already allocated.

Thanks,
Jinqian


