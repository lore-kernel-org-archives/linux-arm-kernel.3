Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1B3C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnGgyvRRH32TeGsaIvULUqSP4Ehg3FZQTTgWXzA7RI4=; b=daKUB1yuBoee7m2a5yUK5h93Uq
	lisUJxN5OEscZf9CRPdln+lb9uRtXqk+O0lja80uzGCHOzIprS7KICC1TnT+qWn3jsqw8ulDBYsrK
	mCAXZRs/wguWxAloz4rk7Zr34HBProWbWsWacHtN3wbTSSU1bDCPETEvjcX7Nc+kEwVuT503qS3X8
	Mwn0jz75heZdBD62wx8rH2KszvKCoWYHKYmuestSj3onnJu/Wu33iUPuTVmJ1HWwpXG9uR16motD9
	R6X352s4VGM6fUlIK7yJgdN/zEO96i+VLW8W4WJl1zZ+UeKRjEDmpJvS59N5Pth7oKr4pLf/vwICT
	4NRoFFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhStT-00000003dtv-32Mx;
	Thu, 31 Jul 2025 13:00:23 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSLz-00000003Zfl-49lM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:25:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bt7VF3y20z6L4sF;
	Thu, 31 Jul 2025 20:21:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 42B651402F2;
	Thu, 31 Jul 2025 20:25:41 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 31 Jul
 2025 14:25:40 +0200
Date: Thu, 31 Jul 2025 13:25:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>
Subject: Re: [PATCH 6/8] drivers/perf: hisi: Refactor the event
 configuration of L3C PMU
Message-ID: <20250731132538.000043a3@huawei.com>
In-Reply-To: <20250729153823.2026154-7-wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
	<20250729153823.2026154-7-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_052548_182098_7A2236B6 
X-CRM114-Status: GOOD (  15.55  )
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

On Tue, 29 Jul 2025 23:38:21 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The event register is configured using hisi_pmu::base directly since
> only one address space is supported for L3C PMU. We need to extend if
> events configuration locates in different address space. In order to
> make preparation for such hardware, extract the event register
> configuration to separate function using hw_perf_event::event_base as
> each event's base address.  Implement a private
> hisi_uncore_ops::get_event_idx() callback for initialize the event_base
> besides get the hardware index.
> 
> No functional changes intended.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
One tiny thing inline.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 128 ++++++++++++-------
>  1 file changed, 83 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> index 39444f11cbad..6ac0ea74cda3 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> @@ -60,51 +60,86 @@ HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_cfg, config1, 15, 11);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_skt, config1, 16, 16);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_core, config2, 15, 0);
>  
> -static void hisi_l3c_pmu_config_req_tracetag(struct perf_event *event)
> +static int hisi_l3c_pmu_get_event_idx(struct perf_event *event)
>  {
>  	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
> +	unsigned long *used_mask = l3c_pmu->pmu_events.used_mask;
> +	u32 num_counters = l3c_pmu->num_counters;
> +	int idx;
> +
> +	idx = find_first_zero_bit(used_mask, num_counters);
> +	if (idx == num_counters)
> +		return -EAGAIN;
> +
> +	set_bit(idx, used_mask);
> +	event->hw.event_base = (unsigned long)l3c_pmu->base;

Trivial but blank line here.

> +	return idx;
> +}


