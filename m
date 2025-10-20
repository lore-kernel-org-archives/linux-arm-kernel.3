Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B943ACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYAhLfde2fTQofUJEtvljXHl8cCWkM/Q8gMdfaVKp5g=; b=ekg8H+ovpwvKPnh6YdJYIaeRby
	eR8IIn7Tx41DXtYRd3C1ZqkpndDh0/NpoZflUKJbU4Z41IGSMg/Yj71Q3tP8pvqO5HhcnQVxvjjUN
	8Iv9phdut+fNfyp5MYyDnsIidRI9KvITWT7YXNPHoCEH1RddhTpQePI46swdL+UFcIDRnbiXfQSML
	z920j62LEXy6lf0ksvDB0yajl4yKkRcI0DVDEoWHGxbPKstMunSiPiF+gvfsTOXoTx9NHjhjrVjhM
	6vr/ID69wQ9KvZGYQ5Ex2i45xITjMDn7wb31gdfRC+xXgTKcFbw+EL/l7QoFs3MBOBceS7e+Rfpl7
	gL3jWD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtpJ-0000000EVeJ-02ph;
	Mon, 20 Oct 2025 17:37:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtpH-0000000EVe2-3fF8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lYAhLfde2fTQofUJEtvljXHl8cCWkM/Q8gMdfaVKp5g=; b=mz4Fr0LAzvBrsU/eoQjkr1BxCd
	RK25KjWfol+Za4Hnsct3zVQeB30WiwNLU920a65Re3aaVFAzJOka+WtW8WhayWj04G6F19jGe3Hfb
	OYnlNbGL4MuCEZ6qvELBaktPsNVHjYaVQU+Cd+4ZxMCZfvfIoLCuhs4ZsqRh/50Ni0/S6p9WcoGtr
	Z9cFjxtY8UFezLuW9kPevA1oU3igROg+p8FJoDJ2qJPBYDFWwBzp/Sz+zqcprFX99oLFaMwagcpfJ
	nEummr2gfHSd/CZrYQPTtACc9QGfpzx20QW87C0DrGu7STt9ed1RjY30cQFi79JNdm+N2YvCPUaFx
	cZ9qPQ9w==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsxY-000000003L6-2ySc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:42:14 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr2bS1Kn9z6M4GQ;
	Tue, 21 Oct 2025 01:33:56 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 735F3140275;
	Tue, 21 Oct 2025 01:37:33 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 18:37:32 +0100
Date: Mon, 20 Oct 2025 18:37:31 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC
 transport
Message-ID: <20251020183731.000023fa@huawei.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.75]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_174212_981595_EB1D511D 
X-CRM114-Status: GOOD (  20.62  )
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

On Fri, 17 Oct 2025 14:23:50 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

> Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> the Linux PCC mailbox layer. The driver parses ACPI _DSD data to map
> protocols to PCC subspace UIDs, supports shared TX/RX channels, and
> optionally sets up a P2A channel for notifications.
> 
> Key points:
> - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> - integration with SCMI core via scmi_desc and transport ops
> - response/notification fetch from PCC shared memory header/payload
> - ACPI device matching and registration via the ACPI transport macro
> 
> This enables SCMI to be exercised over PCC on ACPI platforms.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Hi Sudeep,

Just a very quick look in what is definitely a drive by style review
A few things below.

> diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
> new file mode 100644
> index 000000000000..39ef83e2dfd4
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/transports/pcc.c
> @@ -0,0 +1,390 @@

> +
> +/**
> + * struct scmi_pcc - Structure representing a SCMI mailbox transport
> + *
> + * @cl: Mailbox Client
> + * @pchan: Transmit/Receive PCC/mailbox channel
> + * @cinfo: SCMI channel info
> + * @shmem: Transmit/Receive shared memory area
run kernel-doc over the file (shmem doesn't exist).

> + */
> +struct scmi_pcc {
> +	struct mbox_client cl;
> +	struct pcc_mbox_chan *pchan;
> +	struct scmi_chan_info *cinfo;
> +};

> +
> +static int acpi_scmi_dsd_parse_protocol_subpackage(const union acpi_object *obj,
> +						   int prot_id)
> +{
> +	u32 uid;
> +	int idx, ret = 0;
> +	struct pcc_transport *p;
> +	unsigned int pkg_cnt = obj->package.count;
> +
> +	if (pkg_cnt > 2) {
> +		pr_warn("Only 2 channels: one Tx and one Rx needed\n");
> +		return -EINVAL;
> +	}
> +
> +	for (idx = 0; idx < pkg_cnt; idx++) {
> +		union acpi_object *pack = &obj->package.elements[idx];
> +
> +		/* Flags(pack->package.elements[1]) must be always 0 for now */
> +		uid = pack->package.elements[0].integer.value;
> +		hash_for_each_possible(pcc_id_hash, p, hnode, uid) {
> +			if (p->flags & SCMI_TRANSPORT_SHARED_CHANNEL) {
> +				pr_info("Invalid! %d channel is shared\n",
> +					p->pcc_ss_id);
> +				ret = -EINVAL;

This breaks out of the hash_for_each_... but the outer loop might continue
and it's just possible pass.  however we leave ret set.  Why not bail out
on first error?  E.g. return -EINVAL; here.

> +				break;
> +			}
> +			p->protocol_id = prot_id;
> +		}
> +	}
> +
> +	return ret;
> +}

> +#ifdef CONFIG_ACPI

This is the bit I'd avoid by not use ACPI_PTR() in the earlier patch.

> +static const struct acpi_device_id scmi_acpi_ids[] = {
> +	{"ARML0001", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, scmi_acpi_ids);
> +#endif
> +
> +DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(scmi_pcc, scmi_pcc_driver,
> +				  scmi_pcc_desc, scmi_acpi_ids, core);
> +module_platform_driver(scmi_pcc_driver);
> +
> +MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> +MODULE_DESCRIPTION("SCMI ACPI PCC Transport driver");
> +MODULE_LICENSE("GPL");
> 


