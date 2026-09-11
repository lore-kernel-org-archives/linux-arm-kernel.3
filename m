Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBF1C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUm6FsdO55jOVY3JrBx1R4mKoNfkbT3ZZvod1aeZi4M=; b=sX/VMAB/RvX6iuUQ/mMvRg7d10
	TiPgwo6NkbMioPhtdy+c9MJIGKcI77JHK0unXJnmg8BomMO5O/Sj9n1+WG3DP1Ror+h15luPC3Ssr
	XmRlqvOALfHZrmJW/yYiTbZDLYiPMpFDjJ3YfwlTn5s1lI7ZdUFQfnWvkGaAlMbit2z0G0gGrsG7w
	cLxfUao3uD9IIkMvvJwR7QStg6HS/WRvVh5IWz8N7BmjyQ/w36WuTNOI0+PldgDChqHiQ6hOI9bJX
	rjgU7UauLHqW1490/BeJcvHZkbcB+oZzj5gqlVGYuO3TDFJKpqxpWFmF+B+YWjLUVAwQLVpKLdN7d
	K4hmBdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Fj-0000000H44W-45ag;
	Fri, 11 Sep 2026 15:33:24 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Fh-0000000H43S-0Vc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:33:22 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-5309a20a55bso11021141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789140800; x=1789745600; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUm6FsdO55jOVY3JrBx1R4mKoNfkbT3ZZvod1aeZi4M=;
        b=d3LAfTuhmyJr328mFV4Fhe3Bo4Rg1OnzJq55gSSSyYaEj/t03QzENQ5eA/jfopjgp5
         18uHAvR9xIfUmgPAGUqT0XSTYUTMUIXRwMlzLHuU0XceuwgIBRWgow5WM5LN75FDlkMG
         vnPkzi/CGybUqdnBn5eG/voeDi2gvFyyjUbW4VSpVDlUeDAdSDi3felP4dM6FeXzKKqB
         b1QGnjnesxxCFQJlo6EU8s+BMzXU7G4/SQhR+bglcMiC+JCrbMMa9rEAqBPrbyzCLldu
         7wo3U69nLQH34pMqadQ5fkS60YdPwUjMIe6hDw+C5JMK7i+g36CZLyNnr3PgksG4CoV5
         kIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140800; x=1789745600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUm6FsdO55jOVY3JrBx1R4mKoNfkbT3ZZvod1aeZi4M=;
        b=YHOkXntzJ58+pItMLHFsBT1ajUxL96L9bSCqJigDFaVf3AwhQULUNH3QwBzy7DPA60
         6DYfdZszKz+hM/BAFV61DnEki4dokQcO6+LVneNGLuBxOWIMCkkuF9K7ovp7zl4k2ihq
         aNtl/wBzYDuOd7MV4wfBgw/wVpyMBf98OV7gF3mEq75byiBOechyfZWlxHZ5OJHmUlpu
         PtWllR3Rkvd0m0TF4Ollp0Prboo6bslaurg8skxHXAyr6CLKZ3iUKboBC3dZBZA+F0YA
         2HwWjP+GFivdb0rHXETUQEgOuG36hqGyMPX5ztKBj7dhrYDvkGgy03u1s7Gef5DmpjC9
         T69w==
X-Forwarded-Encrypted: i=1; AKwUvBw0XcIumKQQxtOvrcBdR56xQ6xGVSWeUPVBldU4BphhpfI4bhKupaqphr6aa6vf5fHTowUW47tWy6ZBYqpp3vCz@lists.infradead.org
X-Gm-Message-State: AFuF++mEYc/ejbKr2vX4Lea5pbL3H7ZXn6+1kWa5F0GXYU18S5mtM5gP
	bAjvGCkCcKpUIrbhjIF7WLANxS8J2eQRF6kt1d0Yy3rhaO6OwFZVly7L
X-Gm-Gg: AYBFou2X5KsR3nPInYV64AW2dGIFeZmkaQ/WyJtL8CZYeZ7aTb/CuBFZJV2i+8zSJ4A
	DJL848y0Wrgt7AowY/fZfEpu/J29Hq9VUUdunrQh62k/9gPaohi09DUH2Q4qcLd9i47HHHMGdLP
	Gt3pgeeRg12FmjhZlLTFeU4yLCW23jXarS54GkYUn/KcH5bWIZFKD8B1Wf/bIkpCcmWbIrsYq7k
	ipisSPtusAUBIWoJdb2ZoS644y5TtehMU/YohgzBuQNvRASucdbdJlZdqvTdr/SJJ/mlcCWuP8X
	JStvF6cdRhyAuR7Dd714fMI9EVYMjm0c+XYiNezimIZGvKiOlL1AIVQKp8yNoxhnu9e49UBFOTW
	3f6h+JevJU4pFkKhSYtHWSZG7o12OpPt1jv2JAwgvRQzEFHbMi7TaF1fxyfnFVedU/cRwa1wSMO
	Cc6O2YSGkuF6gG0Qc6nHeGc7VaskQgoOu/2D8zWVCdDea8rinVWUoSiDWgeZz6xwJo5wN+hrTkx
	BTP8eXVFXD9rxTZDAOaVIgVtYg1ipe+hEi0ICwjTVd8fUKWdZFvimXHzbsK
X-Received: by 2002:a05:622a:4019:b0:530:198c:12dc with SMTP id d75a77b69052e-530c850fdd0mr92777781cf.12.1789140798640;
        Fri, 11 Sep 2026 08:33:18 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4b9a97sm23226571cf.18.2026.09.11.08.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:33:18 -0700 (PDT)
Message-ID: <56587aea-443e-4aec-81f6-e5fde844afc4@gmail.com>
Date: Fri, 11 Sep 2026 21:03:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com>
 <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
 <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
 <CAPx+jO-ZP_09poe0rHm+h4QQZBbHJisCdQGa6kA67sQAkU-BfA@mail.gmail.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <CAPx+jO-ZP_09poe0rHm+h4QQZBbHJisCdQGa6kA67sQAkU-BfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_083321_209544_E7E645C1 
X-CRM114-Status: GOOD (  28.79  )
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

On 11-09-2026 15:46, Ulf Hansson wrote:
> On Fri, Sep 11, 2026 at 11:06 AM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
>>
>> On Thu, Sep 10, 2026 at 8:31 PM Dhruva G <goledhruva@gmail.com> wrote:
>>>
>>> On 07-09-2026 16:46, Ulf Hansson wrote:
>>>> A driver for a non-CPU device that is attached to a CPU PM domain (the
>>>> genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
>>>> able to power on the PM domain. More precisely, to power on a CPU PM domain
>>>> one of its corresponding CPUs needs to be woken up if they are idle.
>>>>
>>>> The current support for a non-CPU device is that its driver can only
>>>> prevent an already powered on CPU PM domain from being powered off. This
>>>> leads to problems for a driver while probing its device or when it needs to
>>>> call pm_runtime_get_sync() to turn on the power for it. From the driver
>>>> point of view it looks like it all works fine, but when accessing the
>>>> device it may end up with various errors as the device may not be fully
>>>> powered on.
>>>>
>>>> To fix the behavior for these types of devices, let's adjust the behaviour
>>>> in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
>>>> when it's needed.
>>>>
>>>> Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>>>> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>>       - Moved to atomic polling, pointed out by Dhruva.
>>>
>>> Thanks, but even in v3 we still have potential issues.
>>> It does not fully address the consequences of polling for five seconds in that context,
>>> nor the parent-lock nesting issue.
>>
>> Well, I assume we will not be polling for 5s, as it would be an error
>> and it means that we fail to wake up the CPU. But, I get your point,
>> 5s is really an unnecessary long timeout.
>>
>> Ideally the timeout should map towards the deepest domain idle state's
>> entry+exit-latency-us, but rather than looking at what is actually
>> available for the PM domain(s) in question, I think it's easier (and
>> good enough) if we just pick a common value. Usually these values are
>> in the range of a couple milliseconds and in some cases up to
>> ~15-20ms. I suggest we decrease the timeout to 300ms and see how that
>> plays out.
>>
>> Also note that, at this point I don't know of any use cases similar to
>> what you describe, where the device in question is in an irqsafe child
>> domain. Hence the polling would not be done in an atomic context at
>> all, so we should be safe. Anyway, if this doesn't work we would
>> simply have to limit the support to non irqsafe child domains.
>>
>> In regards to the parent-lock nesting issue. I don't think it's a
>> problem as genpd_wakeup_cpu() is not being called recursively, but let
>> me double check this to be sure.
> 
> Confirmed, I could not trigger any lockdep problems with my tests.

thanks!

> 
> If you are fine with the above suggestion for the timeout, I am
> thinking of amending the patch when applying to avoid posting a new
> version of the series. Please let me know.

Yeah I am fine with this, will monitor in future if I suspect anything arising.

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>


> 
> [...]
> 
> Kind regards
> Uffe


