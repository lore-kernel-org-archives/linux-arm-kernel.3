Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB820CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOx0S0cPl7YwQEQRZw2PeSlHMO6bmrzRxYRUwYisekU=; b=LcsP0cre6fXnIJ9hVx3pbtLoY/
	ugwyWdi28+DMkKZkiZ2pmg+1QJFzi9dd7VNRqVJYiVsH38wt6TTWCyVHqDVqiOAmwXgaV0YTc1C1g
	iCbt0jEyGRK3AWHWkMWyajCoAQ+Q/KldPffgcIFUeA6MUT0JBOJrQGpDRaHgpVEGoWhG5YfCCOiU+
	K6V8NrNiKbnCCAEcKefKLOmRFfy08moFG58E5K7nOTle/2+Cp2U1tIKK29ggSdmVkzwvD+4HkctqY
	40YxL/3TviXNsmqvFHLwu4KK/HZot2R+4mK2k6KkV2gyXssX+65FzErfusdtF2dar64o/5TN3PhIh
	Te83+xsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJW9O-0000000AQuU-36KA;
	Thu, 13 Nov 2025 12:10:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJW9M-0000000AQu7-1arC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 12:10:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5889512FC;
	Thu, 13 Nov 2025 04:09:55 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3115F3F5A1;
	Thu, 13 Nov 2025 04:09:58 -0800 (PST)
Message-ID: <d9694bdf-ab58-4706-8e1e-8266d7ac2ecd@arm.com>
Date: Thu, 13 Nov 2025 12:09:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/33] ACPI / MPAM: Parse the MPAM table
To: Fenghua Yu <fenghuay@nvidia.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-10-ben.horgan@arm.com>
 <26396142-4f14-4175-85ba-2e8d780abbd9@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <26396142-4f14-4175-85ba-2e8d780abbd9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_041004_507657_0171FBA0 
X-CRM114-Status: GOOD (  36.48  )
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

Hi Fenghua,

On 11/13/25 02:16, Fenghua Yu wrote:
> Hi, Ben and James,
> 
> On 11/7/25 04:34, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> Add code to parse the arm64 specific MPAM table, looking up the cache
>> level from the PPTT and feeding the end result into the MPAM driver.
>>
>> This happens in two stages. Platform devices are created first for the
>> MSC devices. Once the driver probes it calls acpi_mpam_parse_resources()
>> to discover the RIS entries the MSC contains.
>>
>> For now the MPAM hook mpam_ris_create() is stubbed out, but will update
>> the MPAM driver with optional discovered data about the RIS entries.
>>
>> CC: Carl Worth <carl@os.amperecomputing.com>
>> Link: https://developer.arm.com/documentation/den0065/3-0bet/?lang=en
>> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
[...]

>> +        if (nid == NUMA_NO_NODE) {
>> +            pr_debug("Bad proxmity domain %lld, using node 0 instead\n",
> 
> Typo.
> s/proxmity/proximity/

Done.

> 
>> +                 res->locator.memory_locator.proximity_domain);
>> +            nid = 0;
>> +        }
>> +        return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_MEMORY,
>> +                       255, nid);
>> +    default:
>> +        /* These get discovered later and are treated as unknown */
>> +        return 0;
>> +    }
>> +}
>> +
>> +int acpi_mpam_parse_resources(struct mpam_msc *msc,
>> +                  struct acpi_mpam_msc_node *tbl_msc)
>> +{
>> +    int i, err;
>> +    char *ptr, *table_end;
>> +    struct acpi_mpam_resource_node *resource;
>> +
>> +    ptr = (char *)(tbl_msc + 1);
>> +    table_end = ptr + tbl_msc->length;
> 
> tbl_msc->length equals size of the ENTIRE msc node. ptr points to the
> end of tbl_msc. ptr + tbl_msc->length is past the end of the msc node.
> This will access data outside of this MSC node.
> 
> Better to change to:
> +    table_end = (char *)tbl_msc + tbl_msc->length;

Yes, makes sense.

> 
>> +    for (i = 0; i < tbl_msc->num_resource_nodes; i++) {
>> +        u64 max_deps, remaining_table;
>> +
>> +        if (ptr + sizeof(*resource) > table_end)
>> +            return -EINVAL;
>> +
>> +        resource = (struct acpi_mpam_resource_node *)ptr;
>> +
>> +        remaining_table = table_end - ptr;
>> +        max_deps = remaining_table / sizeof(struct acpi_mpam_func_deps);
>> +        if (resource->num_functional_deps > max_deps) {
>> +            pr_debug("MSC has impossible number of functional
>> dependencies\n");
>> +            return -EINVAL;
>> +        }
>> +
>> +        err = acpi_mpam_parse_resource(msc, resource);
>> +        if (err)
>> +            return err;
>> +
>> +        ptr += sizeof(*resource);
>> +        ptr += resource->num_functional_deps * sizeof(struct
>> acpi_mpam_func_deps);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Creates the device power management link and returns true if the
>> + * acpi id is valid and usable for cpu affinity.  This is the case
>> + * when the linked device is a processor or a processor container.
>> + */
>> +static bool __init parse_msc_pm_link(struct acpi_mpam_msc_node *tbl_msc,
>> +                     struct platform_device *pdev,
>> +                     u32 *acpi_id)
>> +{
>> +    char hid[sizeof(tbl_msc->hardware_id_linked_device) + 1] = { 0 };
>> +    bool acpi_id_valid = false;
>> +    struct acpi_device *buddy;
>> +    char uid[11];
>> +    int len;
>> +
>> +    memcpy(hid, &tbl_msc->hardware_id_linked_device,
>> +           sizeof(tbl_msc->hardware_id_linked_device));
>> +
>> +    if (!strcmp(hid, ACPI_PROCESSOR_CONTAINER_HID)) {
>> +        *acpi_id = tbl_msc->instance_id_linked_device;
>> +        acpi_id_valid = true;
>> +    }
>> +
>> +    len = snprintf(uid, sizeof(uid), "%u",
>> +               tbl_msc->instance_id_linked_device);
>> +    if (len >= sizeof(uid)) {
>> +        pr_debug("Failed to convert uid of device for power
>> management.");
>> +        return acpi_id_valid;
>> +    }
>> +
>> +    buddy = acpi_dev_get_first_match_dev(hid, uid, -1);
>> +    if (buddy)
>> +        device_link_add(&pdev->dev, &buddy->dev, DL_FLAG_STATELESS);
> 
> Refcount leak here?
> 
> Refcount of the device object pointed by buddy is not released and
> refcount leaks.
> > Better to change to:
> +    if (buddy) {
> +        device_link_add(...);
> +        acpi_dev_put(buddy);  <====== release refcount here
> +    }


Yes, device_link_add() calls get_device() to increment the refcount and
so the acpi_dev_put() is required.

> 
> or free refcount automatically:
> +DEFINE_FREE(acpi_dev_put, struct acpi_device *, if (_T) acpi_dev_put(_T))
> ...
> +    struct acpi_device *buddy __free(acpi_dev_put);
> ...
> 
>> +
>> +    return acpi_id_valid;
>> +}
>> +
>> +static int decode_interface_type(struct acpi_mpam_msc_node *tbl_msc,
>> +                 enum mpam_msc_iface *iface)
>> +{
>> +    switch (tbl_msc->interface_type) {
>> +    case ACPI_MPAM_MSC_IFACE_MMIO:
>> +        *iface = MPAM_IFACE_MMIO;
>> +        return 0;
>> +    case ACPI_MPAM_MSC_IFACE_PCC:
>> +        *iface = MPAM_IFACE_PCC;
>> +        return 0;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +}
>> +
>> +static struct platform_device * __init acpi_mpam_parse_msc(struct
>> acpi_mpam_msc_node *tbl_msc)
>> +{
>> +    struct platform_device *pdev __free(platform_device_put) =
>> +        platform_device_alloc("mpam_msc", tbl_msc->identifier);
>> +    int next_res = 0, next_prop = 0, err;
>> +    /* pcc, nrdy, affinity and a sentinel */
>> +    struct property_entry props[4] = { 0 };
>> +    /* mmio, 2xirq, no sentinel. */
>> +    struct resource res[3] = { 0 };
>> +    struct acpi_device *companion;
>> +    enum mpam_msc_iface iface;
>> +    char uid[16];
>> +    u32 acpi_id;
>> +
>> +    if (!pdev)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    /* Some power management is described in the namespace: */
>> +    err = snprintf(uid, sizeof(uid), "%u", tbl_msc->identifier);
>> +    if (err > 0 && err < sizeof(uid)) {
>> +        companion = acpi_dev_get_first_match_dev("ARMHAA5C", uid, -1);
>> +        if (companion)
>> +            ACPI_COMPANION_SET(&pdev->dev, companion);
> 
> Ditto. companion's refcount leak here as well?

Looks like it. Added a acpi_dev_put().

> 
>> +        else
>> +            pr_debug("MSC.%u: missing namespace entry\n",
>> +                 tbl_msc->identifier);
>> +    }
>> +
>> +    if (decode_interface_type(tbl_msc, &iface)) {
>> +        pr_debug("MSC.%u: unknown interface type\n", tbl_msc-
>> >identifier);
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    if (iface == MPAM_IFACE_MMIO)
>> +        res[next_res++] = DEFINE_RES_MEM_NAMED(tbl_msc->base_address,
>> +                               tbl_msc->mmio_size,
>> +                               "MPAM:MSC");
>> +    else if (iface == MPAM_IFACE_PCC)
>> +        props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>> +                            tbl_msc->base_address);
>> +
>> +    acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
>> +
>> +    WARN_ON_ONCE(next_res > ARRAY_SIZE(res));
> 
> Not sure if this WARN_ON_ONCE() is really helpful.
> 
> Even before this WARN happens, previously res[next_res] accesseing
> outside of res[] may hit panic or data corruption already.
> 
> Maybe it's better to add a helper to access res[] and report error when
> accessing out of res[] scope. A few places can call the helper to access
> res[]:

This warning looks to be there just to catch programming errors. There
are 3 places next_res could be incremented and res[] has 3 entries so I
don't see how an out of bounds access could occur without code changes
and as accesses are made using res[next_res++], or equivalent, it is
likely this warning would be hit if a new res is added without
remembering to increase the size of the array. Given this, I'll keep
this code as it is.

> 
> +static int add_resource(struct resource *res, int *idx, int max,
> +            struct resource new_res)
> +{
> +    if (*idx >= max) {
> +        pr_err("Too many resources (max %d)\n", max);
> +        return -ENOSPC;
> +    }
> +    res[(*idx)++] = new_res;
> +    return 0;
> +}
> 
> Then can call the helper to replace res[next_res++]:
> +    if (iface == MPAM_IFACE_MMIO) {
> +        err = add_resource(res, &next_res, ARRAY_SIZE(res),
> +                 DEFINE_RES_MEM_NAMED(tbl_msc->base_address,
> +                               tbl_msc, +                           
> mmio_size,
> +                               "MPAM:MSC"));
> +        if (err)
> +            return ERR_PTR(-ENOSPC);
> +    }
> 
>> +    err = platform_device_add_resources(pdev, res, next_res);
>> +    if (err)
>> +        return ERR_PTR(err);
>> +
>> +    props[next_prop++] = PROPERTY_ENTRY_U32("arm,not-ready-us",
>> +                        tbl_msc->max_nrdy_usec);
>> +
>> +    /*
>> +     * The MSC's CPU affinity is described via its linked power
>> +     * management device, but only if it points at a Processor or
>> +     * Processor Container.
>> +     */
>> +    if (parse_msc_pm_link(tbl_msc, pdev, &acpi_id))
>> +        props[next_prop++] = PROPERTY_ENTRY_U32("cpu_affinity",
>> acpi_id);
>> +
>> +    WARN_ON_ONCE(next_prop > ARRAY_SIZE(props));
> 
> Ditto for this WARN here?

Similarly to above, this is just guarding against later adding more
properties. This one can be tightened though as
device_create_managed_software_node() expects a zero terminated array.
Changing to:

WARN_ON_ONCE(next_prop > ARRAY_SIZE(props) - 1);

> 
> [SNIP]
> 
> Thanks.
> 
> -Fenghua
Thanks,

Ben


