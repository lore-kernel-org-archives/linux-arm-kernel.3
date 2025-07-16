Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB575C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WonbOpckQKSOSPhjY/shMMz4Jm338hXu3ryYqYFBrxU=; b=FHXY/IdHD6WdXUdaVNMLXHBBBP
	Yo1QnhklqqCVT+bFA37774cttNYFhJUwP3qsm+raORNrccFj66k4RzuDqXsDVNmzR2t1ebXJEFVcO
	Xo7y6ondVfwcD+hInZy0GoUoOtgueqbKvtJei7asR2SY/OImpvPLxb7zyxWGw8jyy4mFHm4we8Lpo
	gIb94x7dSGSDA4XTuCyMuuFKI6VOuRCRxeVemk1fSsNk1DlAuTUda4W8Mk4hnasAHX2LMH3XndQSV
	kFHEpk6VfHHO1nK/zXhazgPkwVOMWwwYgcMv6iLy3I5ax3PYsKopGoW7/CPFpHJ1CnobL8ZZ3MkhZ
	s3aJefOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4bN-000000088Pn-2ysf;
	Wed, 16 Jul 2025 16:03:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4QD-000000086u4-32fF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 15:51:55 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bj0rP208dz6GDPD;
	Wed, 16 Jul 2025 23:50:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DE746140276;
	Wed, 16 Jul 2025 23:51:44 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 16 Jul
 2025 17:51:43 +0200
Date: Wed, 16 Jul 2025 16:51:42 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, Rohit
 Mathew <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	"Zeng Heng" <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
	"Carl Worth" <carl@os.amperecomputing.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH 06/36] ACPI / PPTT: Stop acpi_count_levels()
 expecting callers to clear levels
Message-ID: <20250716165142.00002c46@huawei.com>
In-Reply-To: <20250711183648.30766-7-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-7-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_085154_052223_678E391C 
X-CRM114-Status: GOOD (  22.61  )
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

On Fri, 11 Jul 2025 18:36:18 +0000
James Morse <james.morse@arm.com> wrote:

> acpi_count_levels() passes the number of levels back via a pointer argument.
> It also passes this to acpi_find_cache_level() as the starting_level, and
> preserves this value as it walks up the cpu_node tree counting the levels.
> 
> The only caller acpi_get_cache_info() happens to have already initialised
> levels to zero, which acpi_count_levels() depends on to get the correct
> result.
> 
> Explicitly zero the levels variable, so the count always starts at zero.
> This saves any additional callers having to work out they need to do this.

Hi James,

This is all a bit fiddly as we now end up with that initialized in various
different places. Perhaps simpler to have acpi_count_levels() return the
number of levels rather than void. Then return number of levels rather
than 0 on success from acpi_get_cache_info(). Negative error codes used
for failure just like now.

That would leave only a local variable in acpi_count_levels being
initialized to 0 and passed to acpi_find_cache_level() before being
returned when the loop terminates.

I think that sequence then makes it such that we can't fail to
initialize it at without the compiler noticing and screaming.

Requires a few changes from if (ret) to if (ret < 0) at callers
of acpi_get_cache_info() but looks simple (says the person who
hasn't actually coded it!)

> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/acpi/pptt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 13619b1b821b..13ca2eee3b98 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -183,7 +183,7 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
>   * @cpu_node: processor node we wish to count caches for
>   * @levels: Number of levels if success.
>   * @split_levels:	Number of split cache levels (data/instruction) if
> - *			success. Can by NULL.
> + *			success. Can be NULL.

Grumpy reviewer hat.  Unrelated cleanup up - good to have but not in this patch where
it's a distraction.

>   *
>   * Given a processor node containing a processing unit, walk into it and count
>   * how many levels exist solely for it, and then walk up each level until we hit
> @@ -196,6 +196,8 @@ static void acpi_count_levels(struct acpi_table_header *table_hdr,
>  			      struct acpi_pptt_processor *cpu_node,
>  			      unsigned int *levels, unsigned int *split_levels)
>  {
> +	*levels = 0;
> +
>  	do {
>  		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0);
>  		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);


