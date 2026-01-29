Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B2D46C15
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Hgi6zFxVInQ39JD7veTiZ//fyXHLUf6S1+mSwmi3eA=; b=SJ65P+Jp3Mqmp2TpTEc31lCEx8
	tpmDoazU64gqQpq1zbAXx9drQF7DQWRUoKNvW6QC7A2W2oPVMbABuZ5MYO9Hln881RJsmEp6tSMOl
	H5fLT8OwbqXwVjvHG7EUFU/yGlHv1okek8wHFtE/t8/L5/ytnKDFzPLdJdkfdRzsDewcsum3FQ8Ha
	YZ+cKXoYkaubwyPHBvdnc5yiOa+m74k6Zh+9mJVen6Vla9g11iR8kuQMnyaZLZIfybNctCWLeel9o
	acJJu8V3p5sl9nf6v4K8UkWig/oxNekvIiVZShoH4gAjQpVdm4t935OP/NzrgVJx6cQhs9A+RYM1+
	jN4N7oGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGBE-0000000GztL-1hXU;
	Thu, 29 Jan 2026 00:46:40 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGBC-0000000Gzsb-19Kz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:46:39 +0000
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 372E7BA563;
	Thu, 29 Jan 2026 00:46:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 23DA12000D;
	Thu, 29 Jan 2026 00:46:34 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:46:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, Joerg
 Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2] iommu: Fix NULL pointer deref when io_page_fault
 tracepoint fires
Message-ID: <20260128194644.0c76eeb3@gandalf.local.home>
In-Reply-To: <20260128-iommu-io_page_fault_null_fix-v2-1-de047be6dd3a@riscstar.com>
References: <20260128-iommu-io_page_fault_null_fix-v2-1-de047be6dd3a@riscstar.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: zbnrqykkbsctq1xypty1uxryh3hi8pak
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 23DA12000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19mNQtqSQkXD3+IliWA9iQPxr0OnT5GTl8=
X-HE-Tag: 1769647594-734317
X-HE-Meta: U2FsdGVkX18MOrD3v8VfqWZtxIFDGANwb1LiocAuKBOLEhLP+uqW9c6+dxvNIFq+OEEPdjNlAHmX5fwOoUtV4xD0aXUWrxY5XwNRVli6aznBP9SD2jLx1Z0qHupPrFT2dTPJJ/bHAzElKVWmxv47VqQKG3qyI4PLR9abAohEDCXA3XFkv2sE3RQOVCLkEqKY6Dh2MQEVoo/7nydrv8m6s5ucbEWbvxJFmVU80f1x/PwJARS9FMEXlmBxs6T65y6h33QJYSJvbPLdcPFuaOOO4yHiAqi+05Ckbkb5YVIsGy5BHM67DPr4BgzMRgbG26xbopW6W979+xdtLz+pAgO/Dgz0ZLsy45Vc2k0LIGGBtTtOANTEqIwjvDhUPfOvHuGT8dxOP7YO/thpp/7ZXnGWV17GtGb8VlDxbPoR8TSc7B1lU7bL/XYow29uGStBEyrnCAmfv0kwzXKDPcqeATABVA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_164638_428232_FE4ED44D 
X-CRM114-Status: GOOD (  23.24  )
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


Note, event changes go through the maintainer's tree where the events are
used.

But from a tracing POV:

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve


On Wed, 28 Jan 2026 15:48:01 +0000
Daniel Thompson <daniel@riscstar.com> wrote:

> The arm-smmu driver is unable to allocate the blame for a page fault to
> a specific device so it calls report_iommu_fault() with the dev argument
> set to NULL. Normally this doesn't cause anything catastrophic but on a
> system with the io_page_fault tracepoint enabled this results in a NULL
> pointer deref (resulting in a fairly spectacular crash on the hardware
> I'm currently working on).
> 
> Fix this by adding logic to the tracepoint to safely propagate NULL.
> 
> Fixes: f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> ---
> Changes in v2:
> - Add a Fixes:. It points to the earliest point I can find where it becomes
>   possible for the tracepoint to be triggered with dev set to NULL.
> - Link to v1: https://lore.kernel.org/r/20260116-iommu-io_page_fault_null_fix-v1-1-6c20c2e62987@riscstar.com
> ---
>  include/trace/events/iommu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/trace/events/iommu.h b/include/trace/events/iommu.h
> index 373007e567cb827458a729b8200bbcc1b7d76912..1315193f13b8812ad4e29e6b0c0c66ca806ce08d 100644
> --- a/include/trace/events/iommu.h
> +++ b/include/trace/events/iommu.h
> @@ -131,8 +131,8 @@ DECLARE_EVENT_CLASS(iommu_error,
>  	TP_ARGS(dev, iova, flags),
>  
>  	TP_STRUCT__entry(
> -		__string(device, dev_name(dev))
> -		__string(driver, dev_driver_string(dev))
> +		__string(device, dev ? dev_name(dev) : NULL)
> +		__string(driver, dev ? dev_driver_string(dev) : NULL)
>  		__field(u64, iova)
>  		__field(int, flags)
>  	),
> 
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260116-iommu-io_page_fault_null_fix-f81b4e8b5423
> 
> Best regards,


