Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A184F5A8C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 22:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxzSQy02s9Bj8FdW0h2jty6fTQ6PSdmvvyWsuKJqNZM=; b=u/r+933y/ydoi5kkdN1Ge8vq31
	s4G8wLs0zRZKIXHjRYreUqeFozC1r9RuACuAeOWhZdMIbD+Ev8thujzG04r+b7BGVEk6P/AtsDUPE
	if/WheOzoIcmulIEjjya3ziZ036xt66FGs91E1cdBlqvGTkCLdA3hgIxxCJFK8lDnL9B7LvnJ6u5z
	SK43a1h9q/HPTrUfsLkLu+SDmMWSHL+vLLCHL/d/bo9GBf/1XZ+7owPChs1xapBgTclgAN8A8UUTn
	Ls36XOlLZ1kCjiB/v12pblU9zX1AeCZ2CYncHLLZFBzurYHR/+Vyoa40Puc3VIhJ26WGOJrE0YVnx
	QlkQX7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEws1-00000007m6j-2me3;
	Mon, 20 Apr 2026 22:13:33 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwry-00000007m6B-3PVE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 22:13:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2719460a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 15:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776723209; x=1777328009; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxzSQy02s9Bj8FdW0h2jty6fTQ6PSdmvvyWsuKJqNZM=;
        b=ru9QEyOkF2PqfHbKXEHcVJBkmyARbcHoLX/MRppJIQVgPOVLxbjlBwDI70b/gDb9Rd
         jzdqa6AruxWBUEygxk74Lgej5pC9LLIhJMawZNMigNsTFA9wtDJmFX6zoAh5qDDOcfGV
         QZ0g2jAe+jxA8MFMEOLhA8iPm6wMqykgWxbGiNlL9EgI3E7kaLPjqGnEjHq3XwwYrVm9
         9NiIgGVaa3s3O2scgdUhLGKERmKojl+FUwhFjeoHtApmqb1lpnkxBHeeoBNkMTFfl2em
         NwRMMgtEDqLJFSOswKiO7puTAM2ZECG2Phu3gDPjJnlEGPUhqEFw6tK4Rt9krLYDbyyz
         0HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776723209; x=1777328009;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxzSQy02s9Bj8FdW0h2jty6fTQ6PSdmvvyWsuKJqNZM=;
        b=Z6r5Mggfc4gVQ1Ono71qmfKqpILuF/F8OPpHZBATFKsSH1g93mDQrEYmqcsmpi9IFw
         Cdcz5hZjLQ013bj11WWb+84nA4kYVAivR/O9RsKzruLWNtI1idseSj+4nFVgNJN4FTn9
         PhUw2GjqbivnbQ9SOycCtTu1eEk7+wPkgdGRPBKtvJnLt5d0NxD/mphQIedFhJvdkQA4
         WMMZwA68pxBxWcdM+DdV7Mbd5FtMxXmxHy15BVcRhi3LO6qryK0MiR+y7v8EAXeXTRNs
         Rze1e+Ch2bBCHxFh4J7QY+terxUfI1kdbhZH3hu2avNhtdM3utxnZpUKgZ7QZ290UlIB
         yCWg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZHG7S7OHxNIfDYog/qOYh6uVX6hiyQq/cl9F2LlKoksXfJX6xZ0i9Kdz+d0/mUHNZxWP+iKp/5+OSPsFrpsH1@lists.infradead.org
X-Gm-Message-State: AOJu0YxwZdxOGmagS5QMDo97JIvw/q2zgcSwEj3nYPr7+Ws0k8m7vnsv
	WhZvBlCDEfTnEyOYPMHZMmxJ5+dAPQfOjnHh5ebuRj4eSWdtQw+FT/yN2CB/GDlEHdydO5gt2Mv
	+vQQUfMgd9w==
X-Gm-Gg: AeBDievtLCm0Uoio8DR+uMsgJ2ywsa4eNCusEgSGAZHKHYUboAu01j+rsxzLeZeNz4w
	iDZZivNY8dVT8AkxnGxU/6ZP6D5eZb9XaUtcH+Cd0RYOsPz/5YA7mAy++muTGm2wQPFgL5mWXBs
	PefPGu86aQc/yIxWqdzY7BXP2JwRZnV3WOLCS38cCrwT48yWEHCeCBVpK3rJWqhTXqVfUyD5i4v
	QC4pQ1HMFKPwaW/lRMuTS3s5+7WbI1+wysx1oiGA1RUvGy8V1IeWyBcgrfAUIXrPRFH39JQCzhX
	VDv8mFdbgrs6LuvOh5leXTT8gyRyP1US1Fw1ETBxEpsJaShEpdx0lwC+aJr7HsdrYs7rJqrz5Hr
	JLlPuWF1kWKkafjmYD/NKh0W1ik9KS+XN3dmwEYYnjM6B42bxHmjZ+e98BBiuT4Uf85LbYsOERT
	603xXjf9ynr4vnmU2WJJ2w+FYqVJgmHla5gRIInvE7
X-Received: by 2002:a17:90a:d0f:b0:361:45df:114 with SMTP id 98e67ed59e1d1-36145df0462mr8669670a91.19.1776723209365;
        Mon, 20 Apr 2026 15:13:29 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140edb04dsm11668100a91.0.2026.04.20.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:13:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] pmdomain: core: add support for
 power-domains-child-ids
In-Reply-To: <CAPDyKFrbk8SZs+-WMkbKnh12+OTBtoZ2bwtuASGvAsZwJEd4vQ@mail.gmail.com>
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
 <20260410-topic-lpm-pmdomain-child-ids-v2-2-83396e4b5f8b@baylibre.com>
 <CAPDyKFrbk8SZs+-WMkbKnh12+OTBtoZ2bwtuASGvAsZwJEd4vQ@mail.gmail.com>
Date: Mon, 20 Apr 2026 15:13:28 -0700
Message-ID: <7hldehqnzr.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_151331_135087_6EF5AF38 
X-CRM114-Status: GOOD (  28.66  )
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

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Sat, 11 Apr 2026 at 01:44, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>>
>> Currently, PM domains can only support hierarchy for simple
>> providers (e.g. ones with #power-domain-cells = 0).
>>
>> Add support for oncell providers as well by adding a new property
>> `power-domains-child-ids` to describe the parent/child relationship.
>>
>> For example, an SCMI PM domain provider has multiple domains, each of
>> which might be a child of diffeent parent domains. In this example,
>> the parent domains are MAIN_PD and WKUP_PD:
>>
>>     scmi_pds: protocol@11 {
>>         reg = <0x11>;
>>         #power-domain-cells = <1>;
>>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
>>         power-domains-child-ids = <15>, <19>;
>>     };
>>
>> With this example using the new property, SCMI PM domain 15 becomes a
>> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
>> WKUP_PD.
>>
>> To support this feature, add two new core functions
>>
>> - of_genpd_add_child_ids()
>> - of_genpd_remove_child_ids()
>>
>> which can be called by pmdomain providers to add/remove child domains
>> if they support the new property power-domains-child-ids.
>>
>> The add function is "all or nothing".  If it cannot add all of the
>> child domains in the list, it will unwind any additions already made
>> and report a failure.
>>
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> ---
>>  drivers/pmdomain/core.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/pm_domain.h |  16 ++++++++++++++++
>>  2 files changed, 182 insertions(+)
>>
>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> index 61c2277c9ce3..f978477dd546 100644
>> --- a/drivers/pmdomain/core.c
>> +++ b/drivers/pmdomain/core.c
>> @@ -2909,6 +2909,172 @@ static struct generic_pm_domain *genpd_get_from_provider(
>>         return genpd;
>>  }
>>
>> +/**
>> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
>> + * @np: Device node pointer associated with the PM domain provider.
>> + * @data: Pointer to the onecell data associated with the PM domain provider.
>> + *
>> + * Parse the power-domains and power-domains-child-ids properties to establish
>> + * parent-child relationships for PM domains. The power-domains property lists
>> + * parent domains, and power-domains-child-ids lists which child domain IDs
>> + * should be associated with each parent.
>> + *
>> + * Uses "all or nothing" semantics: either all relationships are established
>> + * successfully, or none are (any partially-added relationships are unwound
>> + * on error).
>> + *
>> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
>> + */
>
> As I mentioned in my earlier reply for the previous version, returning
> a specific error code when the property doesn't exist will complicate
> handling for the caller. Moreover, we also need to make sure we don't
> returning the same error code (-ENOENT) for a different error further
> down the execution path in of_genpd_add_child_ids(). Otherwise it
> would the caller treat the error code in the wrong way.
>
> To me, there are two better ways to address this. For both options,
> of_genpd_add_child_ids() should return 0 when
> "power-domains-child-ids" is missing.
>
> 1) Add another helper function that checks if
> "power-domains-child-ids" exists. The caller can then use this to
> pre-parse the property and decide whether to treat it as an error.
>
> 2) As I suggested earlier, let of_genpd_add_child_ids() return the
> number of assigned parents/children, while still using the all or
> nothing approach, of course.

OK, I like (2) better.  I'll respin with that approach.

Kevin

