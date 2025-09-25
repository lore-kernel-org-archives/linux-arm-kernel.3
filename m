Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CD4CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu8BqltSe9gL8odhXEqNC/8WG84ZsggNeiUW6ouxomM=; b=e/6Uvdw2rXo2UAmtZTT74m2oJS
	6ZiDvYwXh+ZCNXjvrk3h1W/qLylZol1zIirPTNkMJPTLrmPKh8fqmyRkuLVNzF+or6e8X5WWNVQIB
	aXXgiYs6MnswWEwTFmCZ7sQm7xLaDah0NyEOugMbgSX6QjXHiGgbF/URSMc32ddi3zccY6llutIQ9
	wr75VhPjYvx9nuDz/hiBfOjfm6sqZLpGhE35pF7mzueWOkE7ltYh62VSy3zJao8Ns1vuzAAn4KwSI
	2x9seOID2hvaQnByhVnOdlZm7v/X8O37k0k61FL83nrRpZm8bB9OwU4rPm5ttCalk8j5PUJe4CYB6
	Ci2nMQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oPT-0000000AvuR-2NVU;
	Thu, 25 Sep 2025 16:01:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oPR-0000000AvrP-2Zvo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:01:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19FAD1692;
	Thu, 25 Sep 2025 09:01:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C58613F694;
	Thu, 25 Sep 2025 09:01:25 -0700 (PDT)
Date: Thu, 25 Sep 2025 17:01:23 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
Message-ID: <20250925160123.GC7985@e132581.arm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com>
 <CAJ9a7VjaUE+iy=FFwPhCdfXgoGR3rP9WSx-ZkKYeCHhqJ2yzMg@mail.gmail.com>
 <3b16607f-8995-46b1-aecf-c6aa79f66f9d@arm.com>
 <635ba698-d7a9-40d0-9285-4ec108d4a536@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <635ba698-d7a9-40d0-9285-4ec108d4a536@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_090129_785610_8E16A770 
X-CRM114-Status: GOOD (  24.98  )
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

On Thu, Sep 25, 2025 at 11:10:51AM +0100, James Clark wrote:

[...]

In short, I prefer to store perf handle in coresight path, as Jie has
done in this series.

I will give details below, sorry for a long replying.

[...]

> This one is just a pointer to the perf handle which really does belong to
> the session rather than the device. This makes it more of a path thing than
> a csdev thing. Maybe we can rename path to be more like "session", which
> also happens to contain a path. But I think path is fine for now.

Yes, renaming 'coresight_path' (to like 'coresight_runtime_ctx') better
reflects the structure’s purpose.

The point is we can take chance to separate runtime parameters from
device and driver instances.

  - 'coresight_path': runtime parameters for an active session
  - 'coresight_device': a device instance registered on the bus
  - driver data: after probe, the driver maintains driver-specific
    attributes (e.g., the ETMv4 driver keeps mode and filters in struct
    etmv4_drvdata)

These structures have different lifetimes. For example, coresight_path
is valid only during a session; otherwise, it should be cleared.

From a lifecycle perspective, storing the perf handle in coresight_path
makes sense, since both are valid only for the duration of a session
(the perf handle isn't used in sysfs mode, in which case we can simply
leave it unset).

Furthermore, the perf handle is not just a handle; it lets us easily
retrieve private event data (see perf_get_aux()).

> However in this case handle is per-cpu data that is only accessed on the
> same cpu in tmc_etr_get_buffer(). Assigning it in etm_event_start() just
> copies the same per-cpu variable into a non per-cpu place that eventually
> gets accessed on the same cpu anyway.
> 
> If we exported it then it can be used directly without worrying where to
> store it:

We need to be careful for exporting data structures across modules, as
it makes them harder to manage.

In fact, we already share 'etm_event_data' for ETR driver for the same
purpose, and seems to me, it is redendant to export another structure
'etm_ctxt' to just make it convenient for obtaining a buffer config
pointer.

> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c
> b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 17afa0f4cdee..4c33f442c80b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -42,12 +42,8 @@ static bool etm_perf_up;
>   * the ETM. Thus the event_data for the session must be part of the ETM
> context
>   * to make sure we can disable the trace path.
>   */
> -struct etm_ctxt {
> -       struct perf_output_handle handle;
> -       struct etm_event_data *event_data;
> -};
> -
> -static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
> +DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
> +EXPORT_SYMBOL_GPL(etm_ctxt);

I'd suggest a different approach: drop the etm_ctxt structure and
instead define a per-CPU pointer to etm_event_data:

  static DEFINE_PER_CPU(struct etm_event_data *, etm_ev_ctx);

As mentioned above, if perf handle is maintained in coresight_path, we
can easily retrieve the etm_event_data via the perf handle.

A more aggressive refactoring would remove etm_ctxt from
coresight-etm-perf.c entirely, relying on the perf event to manage
private context data. For now, we keep it only to validate whether
ETM is enabled (see multiple place to validate ctxt->event_data).

Thanks,
Leo

