Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D71BC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyZ2kwGYKW8vXpcYObz9S0LQ/VYogdmm3ExZD7idvJw=; b=Gsjnt5WNFX1H2shRg6bjXJ5uUm
	g/nR0tVQ61HCxEz2lwpPLXw/aOjz7Pi2lwmPscNiOONgRgTN19d8atIWwEdunpJEY9b7cOeyF7nkW
	d21fEIHn2cF17keZcAe+qLzR52sn3f8LfzEJiEHniiBEyxZxOwTqsb4mmPjtQNoSbFEAozCsLzl7k
	V9fHZ+HPQUNw7tP284zKe6QtPzJOeEaNws/nWHGJzxatVYIaSref1+L2F4DFFyQhVPWCTwWQAAaYK
	dfTADKQfdFb2qHLS8N/8iw+vRX7BtTPXtX/evXI9HIu//f7HQW69IMrKzoPtZaADKNEtzZWsXSNrv
	aL7FGqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLK-000000054pX-1gck;
	Mon, 16 Jun 2025 17:09:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBNl-00000004n8b-3r8e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:04:23 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bLY7t5lxnzRk3L;
	Mon, 16 Jun 2025 22:59:54 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 61F9314022F;
	Mon, 16 Jun 2025 23:04:10 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 23:04:10 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 23:04:09 +0800
CC: <yangyicong@hisilicon.com>, James Clark <james.clark@linaro.org>, "Arnaldo
 Carvalho de Melo" <acme@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Ali Saidi <alisaidi@amazon.com>, "Leo
 Yan" <leo.yan@linaro.org>, Will Deacon <will@kernel.org>, James Morse
	<james.morse@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, yangjinqian
	<yangjinqian1@huawei.com>, Douglas Anderson <dianders@chromium.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Adrian Hunter
	<adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>, Jiri Olsa
	<jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Namhyung Kim
	<namhyung@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
To: Leo Yan <leo.yan@arm.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
Date: Mon, 16 Jun 2025 23:04:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250616130736.GA788469@e132581.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_080422_272620_D880063F 
X-CRM114-Status: GOOD (  18.91  )
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

On 2025/6/16 21:07, Leo Yan wrote:
> On Mon, Jun 16, 2025 at 09:54:43AM +0000, Shameerali Kolothum Thodi wrote:
> 
> [...]
> 
>>>> -bool is_midr_in_range_list(struct midr_range const *ranges) -{
>>>> -	while (ranges->model)
>>>> -		if (is_midr_in_range(ranges++))
>>>> -			return true;
>>>>   	return false;
>>>>   }
> 
>>> Looks ok to me.
>>>
>>> You could do it with slightly less churn on the kernel side if you keep the
>>> function name and arguments the same there. There's only one usage in
>>> Perf so that one could be renamed and have the midr argument added back
>>> in.
>>
>> +1.
>>
>> Can we use a separate one for perf here, something like below(untested)?
> 
> Thanks for working on this. Agreed.
> 
>> --- a/tools/perf/util/arm-spe.c
>> +++ b/tools/perf/util/arm-spe.c
>> @@ -842,6 +842,18 @@ static void arm_spe__synth_memory_level(const
>> struct arm_spe_record *record,
>>                 data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
>>  }
>>
>> +static bool is_perf_midr_in_range_list(u32 midr, struct midr_range
>> const *ranges)
>> +{
>> +       while (ranges->model) {
>> +               if (midr_is_cpu_model_range(midr, ranges->model,
>> +                                           ranges->rv_min, ranges->rv_max)) {
>> +                       return true;
>> +               }
>> +               ranges++;
>> +       }
>> +       return false;
>> +}
> 
> Maybe we can make it more general. For example, move this function into
> a common header such as tools/perf/arch/arm64/include/cputype.h. Then,
> util/arm-spe.c can include this header.
> 

ok this sounds just like as before except rename the midr check function and modify the
users in perf. will do in below steps:
- move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
  since they're only used in the kernel with errata information
- introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
  is within the ranges. (is_perf_midr_in_range_list() only make sense in
  userspace and is a bit strange to me in a kernel header). maybe reimplement
  is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
  no users in kernel
- copy cputype.h to userspace and make users use new is_target_midr_in_range_list()

this will avoid touching the kernel too much and userspace don't need to implement
a separate function.

Thanks.



