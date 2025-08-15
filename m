Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4728BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWGL4u/kcTveHuURjeDACjEqFr+2GJVpCI+77YRy1YQ=; b=fZtkUypRB5GsJrjbn8+8RQRY9D
	oH2XK5eosOYQxXiCWUY3khKWDw+OiV4c/YzbExGtuNaCrMch5Z2cvPifjqyNXgJwHKBBBDsG4AEue
	K76HM/bK9dqeHjr2PWJaXZGLM6HK7eRI4FSmk7laDgiBtjG7c3g7UNItDJ2WIsshmk2MLzGwQCjLz
	8gcARM88sFhGdpLMsLCsBP6L/JFki0qg3I83ID+Z9CPfjuqazuFkLAWc9aSSILFajgmBLZv1h8Emd
	j0b+xtBWVi/lobrcIJdcjjI3+Y8fgBgeah+dxuGAfydSLQB1OQlKTF8nwE1IiVaN8/c9SwfdCRJea
	68tWoUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umu0i-00000002VT3-0ETM;
	Fri, 15 Aug 2025 12:58:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqp4-000000024f6-1bJ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:34:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E49631655;
	Fri, 15 Aug 2025 02:33:54 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C071A3F63F;
	Fri, 15 Aug 2025 02:33:58 -0700 (PDT)
Message-ID: <cf186a17-fea3-48bb-92ee-7187d910d5ac@arm.com>
Date: Fri, 15 Aug 2025 10:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] ACPI / MPAM: Parse the MPAM table
To: James Morse <james.morse@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-11-james.morse@arm.com>
 <20250716180725.0000452d@huawei.com>
 <84e52287-e46a-40c3-90b7-ab7e9f2c7431@arm.com>
 <cd5c9b88-2864-4253-8a32-b7f3ac85e9d4@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <cd5c9b88-2864-4253-8a32-b7f3ac85e9d4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_023406_506030_22A662E0 
X-CRM114-Status: GOOD (  21.64  )
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

Hi James,

On 8/5/25 18:07, James Morse wrote:
> Hi Ben,
> 
> On 23/07/2025 17:39, Ben Horgan wrote:
>> On 7/16/25 18:07, Jonathan Cameron wrote:
>>> On Fri, 11 Jul 2025 18:36:22 +0000
>>> James Morse <james.morse@arm.com> wrote:
>>>
>>>> Add code to parse the arm64 specific MPAM table, looking up the cache
>>>> level from the PPTT and feeding the end result into the MPAM driver.
>>>
>>> Throw in a link to the spec perhaps?  Particularly useful to know which
>>> version this was written against when reviewing it.
> 
>> As I comment below this code checks the table revision is 1 and so we can assume it was
>> written against version 2 of the spec. As of Monday, there is a new version hot off the
>> press,
>> https://developer.arm.com/documentation/den0065/3-0bet/?lang=en which introduces an "MMIO
>> size" field to allow for disabled nodes. This should be considered here to avoid
>> advertising msc that aren't present.
> 
> Sure. Bit of an unfortunate race with the spec people there!
> 
> Added as:
> --------------------%<--------------------
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> index 9ff5a6df9f1b..d8c6224a76f8 100644
> --- a/drivers/acpi/arm64/mpam.c
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -202,6 +202,9 @@ static int __init _parse_table(struct acpi_table_header *table)
>                  if (tbl_msc->reserved || tbl_msc->reserved1 || tbl_msc->reserved2)
>                          continue;
> 
> +               if (!tbl_msc->mmio_size)
> +                       continue;
> +
>                  if (decode_interface_type(tbl_msc, &iface))
>                          continue;
> 
> @@ -290,7 +293,7 @@ static struct acpi_table_header *get_table(void)
>          if (ACPI_FAILURE(status))
>                  return NULL;
> 
> -       if (table->revision != 1)
> +       if (table->revision < 1)
>                  return NULL;
> 
>          return table;
> @@ -321,6 +324,9 @@ static int _count_msc(struct acpi_table_header *table)
>          table_end = (char *)table + table->length;
> 
>          while (table_offset < table_end) {
> +               if (!tbl_msc->mmio_size)
> +                       continue;
> +
>                  if (tbl_msc->length < sizeof(*tbl_msc))
>                          return -EINVAL;
> --------------------%<--------------------
This seems fine as long as any later table revisions are guaranteed to 
be  backwards compatible.

> 
> Amusingly, PCC also defines mmio_size==0 as disabled, so _count_msc() doesn't need to know
> what kind of thing this is. In principle they could change this as its beta, but a zero
> sized MSC should probably be treated as an error anyway.
> 
> 
> Thanks,
> 
> James

Thanks,

Ben


