Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C18FD61020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKKA1nQHqCw0k0MhBE7VTAQT2s0IHwNBxOs15aoD4n4=; b=b1BxzFS6/sa4jHFk9yZIZLd7VE
	6AjlDDPpJsmrUl0anf3qV7Lbxuo2Uay8hQ5Uxr5/YoM6DMysgSlQWkF4LHCEqfv8mxCC+eMEsBPlo
	sNxJbuaJfsP/eGVYHDhD/5GPVzGJXM9BXV0DIaWt0gGemGZvl5TTLroLDIr3WlsmuLkitWuZsYhye
	u7mVqkCfE5GO63pME7sPr5MexCPH1MUYz7ayq68sp2UcE/a6RotlB3O37TIK8PB6xxIafhfh6jhhE
	SiGsOGEp74SowGaizx9CA61/4LIgrUa3jjnLZB22wYMvZF0apC2JWiGxoPgoffGJg6WnujzqVEiVI
	X0LkrrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTjS-00000000GAH-06eK;
	Thu, 29 Jan 2026 15:14:54 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTjO-00000000G9S-0LQ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:14:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vKKA1nQHqCw0k0MhBE7VTAQT2s0IHwNBxOs15aoD4n4=;
	b=6qNLvXTYjyl47cF1R/5H2TLWRv0Z8sR5zm/KHiGow+URG36WTvWhdRntE0X439BnK4f/QiDAf
	65NZhudQ2WfQMX3pUFZRxdfrTyy+hWG6zKwgoOHlOZPv7xYjNgNCJHEt4JkLYY5qt1g0Om1Iwa3
	WwuT76od4SeV6A0RkOa1o3Q=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f22dz5fk8zLlXt;
	Thu, 29 Jan 2026 23:11:03 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id D83F840565;
	Thu, 29 Jan 2026 23:14:31 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Jan 2026 23:14:31 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 29 Jan 2026 23:14:30 +0800
Message-ID: <b62090ee-1761-4cbb-8d7d-1a91169d187f@huawei.com>
Date: Thu, 29 Jan 2026 23:14:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 5/7] perf-iostat: Support wilder wildcard-match for
 pmus
To: Ian Rogers <irogers@google.com>
CC: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<adrian.hunter@intel.com>, <peterz@infradead.org>, <john.g.garry@oracle.com>,
	<Jonathan.Cameron@huawei.com>, <shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
 <20260126123514.3238425-6-wangyushan12@huawei.com>
 <CAP-5=fXJSPbZkSvcLMEM7rdaGqYJGzrh+8qmZodrWy=ZGVRp_Q@mail.gmail.com>
Content-Language: en-US
From: wangyushan <wangyushan12@huawei.com>
In-Reply-To: <CAP-5=fXJSPbZkSvcLMEM7rdaGqYJGzrh+8qmZodrWy=ZGVRp_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_071451_610892_36CBB067 
X-CRM114-Status: GOOD (  18.52  )
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



On 1/27/2026 12:44 AM, Ian Rogers wrote:
> On Mon, Jan 26, 2026 at 4:35 AM Yushan Wang <wangyushan12@huawei.com> wrote:
>> Current wildcard matching of pmu names only support the form of
>> "<pmu_name>%d", which may not be sufficient for pmus with other forms of
>> name (e.g. HiSilicon PCIe PMU has the name of "hisi_pcie%d_pmu%d").
>>
>> To address that, change the wildcard matching function into a callback,
>> and add a new version of wildcard-matching function using the callback
>> to support more flexible pmu names.
> There's some discussion around PMU name matching here (and the replies):
> https://lore.kernel.org/lkml/20251231224233.113839-12-zide.chen@intel.com/
> that I think is relevant.
The complexity of name matching is sad. Do you think it's a good idea to add a callback for specific use? Maybe the wildcard matching needs more complete split, that extracts the match logic of core and uncore pmus into individual functions?
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>  tools/perf/util/pmus.c | 12 +++++++++---
>>  tools/perf/util/pmus.h |  3 +++
>>  2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
>> index 98be2eb8f1f0..35184d477d07 100644
>> --- a/tools/perf/util/pmus.c
>> +++ b/tools/perf/util/pmus.c
>> @@ -402,7 +402,8 @@ struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *eve
>>         return NULL;
>>  }
>>
>> -struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard)
>> +struct perf_pmu *perf_pmus__scan_matching(struct perf_pmu *pmu, const char *wildcard,
>> +                                         perf_pmus_match_t match)
>>  {
>>         bool use_core_pmus = !pmu || pmu->is_core;
>>
>> @@ -436,19 +437,24 @@ struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const c
>>         }
>>         if (use_core_pmus) {
>>                 list_for_each_entry_continue(pmu, &core_pmus, list) {
>> -                       if (perf_pmu__wildcard_match(pmu, wildcard))
>> +                       if (match(pmu, wildcard))
>>                                 return pmu;
>>                 }
>>                 pmu = NULL;
>>                 pmu = list_prepare_entry(pmu, &other_pmus, list);
>>         }
>>         list_for_each_entry_continue(pmu, &other_pmus, list) {
>> -               if (perf_pmu__wildcard_match(pmu, wildcard))
>> +               if (match(pmu, wildcard))
>>                         return pmu;
>>         }
>>         return NULL;
>>  }
>>
>> +struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard)
>> +{
>> +       return perf_pmus__scan_matching(pmu, wildcard, perf_pmu__wildcard_match);
>> +}
>> +
>>  static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
>>  {
>>         bool use_core_pmus = !pmu || pmu->is_core;
>> diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
>> index 7cb36863711a..9308afb5a7b8 100644
>> --- a/tools/perf/util/pmus.h
>> +++ b/tools/perf/util/pmus.h
>> @@ -9,6 +9,8 @@ struct perf_event_attr;
>>  struct perf_pmu;
>>  struct print_callbacks;
>>
>> +typedef _Bool (*perf_pmus_match_t)(const struct perf_pmu *, const char *);
> nit: can we use stdbool.h and make this return a bool?
> nit: in general Linux style is to avoid typedefs:
> https://www.kernel.org/doc/html/v4.10/process/coding-style.html#typedefs

Yes, thanks for pointing out, I will fix them.

>
> Thanks,
> Ian

Thanks, 
Yushan
>
>> +
>>  size_t pmu_name_len_no_suffix(const char *str);
>>  /* Exposed for testing only. */
>>  int pmu_name_cmp(const char *lhs_pmu_name, const char *rhs_pmu_name);
>> @@ -22,6 +24,7 @@ struct perf_pmu *perf_pmus__find_by_attr(const struct perf_event_attr *attr);
>>  struct perf_pmu *perf_pmus__scan(struct perf_pmu *pmu);
>>  struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu);
>>  struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *event);
>> +struct perf_pmu *perf_pmus__scan_matching(struct perf_pmu *pmu, const char *wildcard, perf_pmus_match_t match);
>>  struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard);
>>
>>  const struct perf_pmu *perf_pmus__pmu_for_pmu_filter(const char *str);
>> --
>> 2.33.0
>>


