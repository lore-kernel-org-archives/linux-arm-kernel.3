Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA26CF2582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 05:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCKYYk/nJB19P+gNWH8tuQy1gyvupyswist/AiEgNgQ=; b=U/zTYUoLsFlZash1ciYONdZzBu
	asqqNEcJNdBHn0Kk224H2cE7ZiH6tvm6Ptt5t89OekQL8/8x50yLQcRgOkSPXVOxvXflDhRWWcay8
	ZSiz0AhffNSqEn1ooe9PIsbudH4Y/g5rRH2MOoHQoRuvsKEKP42VIh7AbPwr5oikT/ELN/H636m7S
	lpFWVwY6lBvE1g91MspLR2YIOfdj4mpsWvKL++XM9aVArAy3qazSeV4qqtytC4SOGZMUkj5HcIKRp
	n3RITijqjqFZfuWt6sXkEYI+FSrcicwiyhuExekXjHhjaKQ6JZM7W/e7fQwA4Rv2dqhWV6VhN7OzQ
	V+Y1Qfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLaVW-000000025pz-2rIP;
	Wed, 19 Nov 2025 05:13:30 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLaVT-000000025lS-1GBc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 05:13:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QCKYYk/nJB19P+gNWH8tuQy1gyvupyswist/AiEgNgQ=;
	b=kcHYALnVFMqTqvDB0wrOTz6XWMyevtGJc9y8Y7K6eDWC8uEBd+zOktjuW532AFAGpl3iOQEDN
	5gHgabDCIpGeqsk8W3b1xI76aspLJfeFuoCEa7L9VA57i070mDw8TgPT4EMCAaQ3STrU+rA+qIQ
	PYMGpKDhupqE+joNPZMqnwI=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dB8hd1y4SzcZy1;
	Wed, 19 Nov 2025 13:11:13 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 370E6180BD0;
	Wed, 19 Nov 2025 13:13:15 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Nov 2025 13:13:12 +0800
Subject: Re: [PATCH v5 03/34] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <bobo.shaobowang@huawei.com>,
	<carl@os.amperecomputing.com>, <catalin.marinas@arm.com>, <dakr@kernel.org>,
	<dave.martin@arm.com>, <david@redhat.com>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gregkh@linuxfoundation.org>, <gshan@redhat.com>,
	<jeremy.linton@arm.com>, <jonathan.cameron@huawei.com>, <kobak@nvidia.com>,
	<lcherian@marvell.com>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-4-ben.horgan@arm.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <73c55f0e-6c0c-63ec-d2d0-d60b28f8aff7@huawei.com>
Date: Wed, 19 Nov 2025 13:13:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20251117170014.4113754-4-ben.horgan@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_211327_998738_F06E34CE 
X-CRM114-Status: GOOD (  21.54  )
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

On 2025/11/18 0:59, Ben Horgan wrote:
> In actbl2.h, acpi_pptt_cache describes the fields in the original
> Cache Type Structure. In PPTT table version 3 a new field was added at the
> end, cache_id. This is described in acpi_pptt_cache_v1 but rather than
> including all v1 fields it just includes this one.
> 
> In lieu of this being fixed in acpica, introduce acpi_pptt_cache_v1_full to
> contain all the fields of the Cache Type Structure . Update the existing
> code to use this new struct. This simplifies the code and removes a
> non-standard use of ACPI_ADD_PTR.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> I have opened a pull request to acpica to update acpi_pptt_cache_v1 to
> include all fields. https://github.com/acpica/acpica/pull/1059
> 
> Change since v4:
> Use fields directly in acpi_pptt_cache_v1_full
> Delay the casting
> 
> Changes since v3:
> New patch
> ---
>   drivers/acpi/pptt.c | 47 +++++++++++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 2856254e29d7..53fde9bd8140 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -21,6 +21,25 @@
>   #include <linux/cacheinfo.h>
>   #include <acpi/processor.h>
>   
> +/*
> + * The acpi_pptt_cache_v1 in actbl2.h, which is imported from acpica,
> + * only contains the cache_id field rather than all the fields of the
> + * Cache Type Structure. Use this alternative structure until it is
> + * resolved in acpica.
> + */
> +struct acpi_pptt_cache_v1_full {
> +	struct acpi_subtable_header header;
> +	u16 reserved;
> +	u32 flags;
> +	u32 next_level_of_cache;
> +	u32 size;
> +	u32 number_of_sets;
> +	u8 associativity;
> +	u8 attributes;
> +	u16 line_size;
> +	u32 cache_id;
> +};

I'm fine with removing this after acpica changes being accepted.

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

