Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741B6CED60F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5gjgaGtM0KWsC2n7w7NoO0ty3nzcl8GvH8tRLEiyAg=; b=v4BRwE2tdImHEjl0/MVwh2gmZx
	r1cNRJoULve9FZX+6XLzLkCkvHMYRwgUegD7p5VTvfMXJBEH1Gd1ml+Cqkn6tkOCUw35EwpVEFOoB
	NtaajA/hOUjAqLrhQ6QY3Uzl7BzVC3MZv876wQ7C7GJhem5RMHew5B/bi1pIGhtrpiSRbKXeIqTZN
	r5XOieOzaLYQTDkOQZYG5XD3bPjjOng4Ulyb31eSQiBB18N3opanmuE5mGzhEx/DVARhcEUP5G0So
	EpdXmRKXt/BYrxj/a0TvavLapG4kZXRxCxSroAtrARzLwjBGbuFZ9dZ7kMtyB3T3JDzwyxbD+2pBy
	XPW5MHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJYk-00000000IrO-3mgz;
	Tue, 18 Nov 2025 11:07:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJYi-00000000Ir1-41c8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:07:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 872A3FEC;
	Tue, 18 Nov 2025 03:07:32 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 492833F66E;
	Tue, 18 Nov 2025 03:07:35 -0800 (PST)
Message-ID: <e217c4dc-dd66-4db0-a846-ca8ed462135e@arm.com>
Date: Tue, 18 Nov 2025 11:07:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/34] ACPI: Define acpi_put_table cleanup handler and
 acpi_get_table_ret() helper
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, peternewman@google.com,
 quic_jiles@quicinc.com, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-9-ben.horgan@arm.com>
 <CAJZ5v0hAPoE96C7=ynR=Ex4huPP3b896sBRNdBiLe=3Q9vKwHQ@mail.gmail.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <CAJZ5v0hAPoE96C7=ynR=Ex4huPP3b896sBRNdBiLe=3Q9vKwHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_030741_114252_98EA6829 
X-CRM114-Status: GOOD (  12.21  )
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

Hi Rafael,

On 11/17/25 19:46, Rafael J. Wysocki wrote:
> On Mon, Nov 17, 2025 at 6:01 PM Ben Horgan <ben.horgan@arm.com> wrote:
>>
>> Define a cleanup helper for use with __free to release the acpi table when
>> the pointer goes out of scope. Also, introduce the helper
>> acpi_get_table_ret() to simplify a commonly used pattern involving
>> acpi_get_table().
>>
>> These are first used in a subsequent commit.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Carl Worth <carl@os.amperecomputing.com>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Zeng Heng <zengheng4@huawei.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  include/linux/acpi.h | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index a9dbacabdf89..1124b7dc79fd 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -8,6 +8,7 @@
>>  #ifndef _LINUX_ACPI_H
>>  #define _LINUX_ACPI_H
>>
>> +#include <linux/cleanup.h>
>>  #include <linux/errno.h>
>>  #include <linux/ioport.h>      /* for struct resource */
>>  #include <linux/resource_ext.h>
>> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>>  void acpi_table_init_complete (void);
>>  int acpi_table_init (void);
>>
>> +static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
> 
> Maybe call this acpi_get_table_pointer() ?

Ok, can do.

> 
>> +{
>> +       struct acpi_table_header *table;
>> +       int status = acpi_get_table(signature, instance, &table);
>> +
>> +       if (ACPI_FAILURE(status))
>> +               return ERR_PTR(-ENOENT);
>> +       return table;
>> +}
>> +DEFINE_FREE(acpi_put_table, struct acpi_table_header *, if (!IS_ERR_OR_NULL(_T)) acpi_put_table(_T))
>> +
>>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
>>  int __init_or_acpilib acpi_table_parse_entries(char *id,
>>                 unsigned long table_size, int entry_id,
>> --

Thanks,

Ben


