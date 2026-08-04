Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA240C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENsMvggV2Q8yXoGG3t1auWAuDSKTrv1vgz6xhtW3m5Y=; b=3DyZPfMTokxqjmt2sEVcGxPp49
	pTII6DKyLhBbieyEA5PFRR5W8ocp5Rl1/P8IE8/oNenYtxS2RO0+iKWoCuigxYYoG91iqUngA1xtP
	1FcJxNlBH8eUbCyqU+Q1L4xNzz6Z51zgME1qiuVKU+9HFYss27QACtca1kyDm5A7jRhpb8L0UHWY7
	XTQ4XB2Jy27ONuxNLZhWaCy+yYYfWkSaccrZTfyA/my6AvesY+9UHiobVjkq/5fSnGAdaTDQnWHJc
	i2C33rPSo1+nWoyXNTqYxqAmhpuyKtMK/v+qFlqeAsc2xjz2eq+1EEfVJEqqSyLlVOvv8xVdAKhsr
	yAnxAyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Fv-00000001BiR-0pqy;
	Tue, 04 Aug 2026 07:08:07 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Fr-00000001Bhq-0kfB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:08:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ENsMvggV2Q8yXoGG3t1auWAuDSKTrv1vgz6xhtW3m5Y=;
	b=zkn8NCj++2NT+8UQTq8SWgCbJOMuPrlEhxNcAIYMj0Y2kX20v+zpvK8wvjOoDf/xg05ycxtp0
	h6IerXhbBN9SUvpNX9rC1z1ii7/A6x36+O8loBZpl0gOqATDbK8kGA2hxIXyoKNms2xvxOqA/k6
	8c7pkMSpxGn22pmcxkx6Uf4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hDks82G8HzmVXM;
	Tue,  4 Aug 2026 14:58:20 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 33BBA40565;
	Tue,  4 Aug 2026 15:07:51 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Aug 2026 15:07:50 +0800
Subject: Re: [PATCH] ACPI: IORT: validate RMR node array bounds
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>
CC: Sudeep Holla <sudeep.holla@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <7b7d6409-4e84-cd35-645a-9be393c132d0@huawei.com>
Date: Tue, 4 Aug 2026 15:07:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_000803_829781_43210ABA 
X-CRM114-Status: GOOD (  20.95  )
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

On 2026/7/6 17:43, Pengpeng Hou wrote:
> IORT RMR nodes describe reserved-memory ranges through firmware
> offset and count fields inside the current IORT node.
> 
> Validate the generic IORT node length before dispatching it, and
> check both the RMR descriptor array and the ID mapping array before
> walking them.  This binds each array walk to the current node length
> instead of only trusting the firmware-provided count.

Would you mind split this into two patches? one for iort_node_valid(),
the other is valid the IORT RMR nodes.

> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/acpi/arm64/iort.c | 83 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 79 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index af7a9b2fd5bc..55373246bdd4 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -15,6 +15,7 @@
>   #include <linux/iommu.h>
>   #include <linux/kernel.h>
>   #include <linux/list.h>
> +#include <linux/overflow.h>
>   #include <linux/pci.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> @@ -148,6 +149,69 @@ typedef acpi_status (*iort_find_node_callback)
>   /* Root pointer to the mapped IORT table */
>   static struct acpi_table_header *iort_table;
>   
> +static bool iort_node_valid(struct acpi_iort_node *node,
> +			    struct acpi_iort_node *end)
> +{
> +	size_t remaining;
> +
> +	if (WARN_TAINT(node >= end, TAINT_FIRMWARE_WORKAROUND,
> +		       "IORT node pointer overflows, bad table!\n"))
> +		return false;
> +
> +	remaining = (char *)end - (char *)node;
> +	if (WARN_TAINT(remaining < sizeof(*node), TAINT_FIRMWARE_WORKAROUND,
> +		       "IORT node header is truncated, bad table!\n"))
> +		return false;
> +
> +	if (WARN_TAINT(node->length < sizeof(*node) || node->length > remaining,

Check the node length as well.

> +		       TAINT_FIRMWARE_WORKAROUND,
> +		       "IORT node length overflows, bad table!\n"))
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool iort_node_array_valid(struct acpi_iort_node *node, u32 offset,
> +				  u32 count, size_t elem_size,
> +				  size_t min_offset, const char *name)
> +{
> +	size_t bytes;
> +
> +	if (!count)
> +		return true;

Please add a comment here why count = 0 is valid.

> +
> +	if (!offset || offset < min_offset || offset > node->length) {
> +		pr_err(FW_BUG "Invalid %s offset in IORT node %p\n", name,
> +		       node);
> +		return false;
> +	}
> +
> +	if (check_mul_overflow(count, elem_size, &bytes) ||
> +	    bytes > node->length - offset) {
> +		pr_err(FW_BUG "Invalid %s array in IORT node %p\n", name,
> +		       node);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool iort_rmr_node_valid(struct acpi_iort_node *node)
> +{
> +	struct acpi_iort_rmr *rmr;
> +
> +	if (node->length < sizeof(*node) + sizeof(*rmr)) {
> +		pr_err(FW_BUG "Truncated RMR node in IORT table\n");
> +		return false;
> +	}
> +
> +	rmr = (struct acpi_iort_rmr *)node->node_data;
> +	return iort_node_array_valid(node, rmr->rmr_offset, rmr->rmr_count,
> +				     sizeof(struct acpi_iort_rmr_desc),
> +				     sizeof(*node) + sizeof(*rmr),
> +				     "RMR descriptor");
> +}
> +
>   static LIST_HEAD(iort_msi_chip_list);
>   static DEFINE_SPINLOCK(iort_msi_chip_lock);
>   
> @@ -243,8 +307,7 @@ static struct acpi_iort_node *iort_scan_node(enum acpi_iort_node_type type,
>   				iort_table->length);
>   
>   	for (i = 0; i < iort->node_count; i++) {
> -		if (WARN_TAINT(iort_node >= iort_end, TAINT_FIRMWARE_WORKAROUND,
> -			       "IORT node pointer overflows, bad table!\n"))
> +		if (!iort_node_valid(iort_node, iort_end))
>   			return NULL;
>   
>   		if (iort_node->type == type &&
> @@ -1014,6 +1077,9 @@ static void iort_get_rmrs(struct acpi_iort_node *node,
>   	struct acpi_iort_rmr_desc *rmr_desc;
>   	int i;
>   
> +	if (!iort_rmr_node_valid(node))
> +		return;
> +
>   	rmr_desc = ACPI_ADD_PTR(struct acpi_iort_rmr_desc, node,
>   				rmr->rmr_offset);
>   
> @@ -1114,6 +1180,16 @@ static void iort_node_get_rmr_info(struct acpi_iort_node *node,
>   		return;
>   	}
>   
> +	if (!iort_node_array_valid(node, node->mapping_offset,
> +				   node->mapping_count,
> +				   sizeof(struct acpi_iort_id_mapping),
> +				   sizeof(*node),
> +				   "ID mapping"))
> +		return;
> +
> +	if (!iort_rmr_node_valid(node))
> +		return;
> +
>   	rmr = (struct acpi_iort_rmr *)node->node_data;
>   	if (!rmr->rmr_offset || !rmr->rmr_count)
>   		return;
> @@ -1175,8 +1251,7 @@ static void iort_find_rmrs(struct acpi_iort_node *iommu, struct device *dev,
>   				iort_table->length);
>   
>   	for (i = 0; i < iort->node_count; i++) {
> -		if (WARN_TAINT(iort_node >= iort_end, TAINT_FIRMWARE_WORKAROUND,
> -			       "IORT node pointer overflows, bad table!\n"))
> +		if (!iort_node_valid(iort_node, iort_end))
>   			return;
>   
>   		if (iort_node->type == ACPI_IORT_NODE_RMR)

Thanks
Hanjun

