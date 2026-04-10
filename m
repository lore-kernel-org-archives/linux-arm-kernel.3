Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D2F36B97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 01:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDukKgIxUDFhviJEhQQl8OKCJeL8VtYjziTmoESltr0=; b=lEsosMGtLJytAD4tBhQDGirkr5
	bElkdQPp/ei/CrdNcW0Z4eMykohmg+opemCCVT3fpR4vWdPVj5de8XRNztK8YcdzFqZCQLgqlBMJp
	xcbRRkUzYMSOZU9QOif8aWond5avm5Nx62TFFlTEqINh8BasZZTxfnfkDMYfu66j8KLyONzXc2nb/
	NroyfskHNmeTerZTo97T6OeP5wX1oO3MfUhliJO7QDLtIadGwZibeFNMU4MdU8Rp9F7aj1VJ/FIHu
	0wwABIhjivoyH4h4E7roT878SwDvrueCD7JHmtQMKAGXDVFQcaxIjvnmX/U24oIkyABfI7fyErVmf
	qYGIijWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB0Fl-0000000BOJJ-0ch3;
	Fri, 10 Apr 2026 01:01:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB0Fh-0000000BOIw-48MT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 01:01:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82ce09b61beso733992b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775782901; x=1776387701; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDukKgIxUDFhviJEhQQl8OKCJeL8VtYjziTmoESltr0=;
        b=vLkOJ92Yoys2obxJNfMgI/tVr3YiNKNIC/QOXxXjtj4tAqjzxPyp+lHeQSM0g9PIBm
         daZ/YPJA2wVrl/TwQFmLQuCark8G1Jo7F76BzHJI9ICpWgvOYcRbmhvhOrv9vpQochYe
         hWLQBBsR5puiLdO0/9SKXND8iwDbb7Ca5aaTAZKGhRI7jHMf6x7yW10w4o52WYUVGOOm
         j5E/5N08l9pdHGIdQ2YdeaKJxPTbtxuQLg+QyxfK0d1YU5jc6838aGYgBaY7x24q5S/3
         hd63KP8eytRAuicTkH+Blc12XjruxktKYh/1FsnFd9lTMAKpufDopXdLy3sDUpBLai5w
         aoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775782901; x=1776387701;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDukKgIxUDFhviJEhQQl8OKCJeL8VtYjziTmoESltr0=;
        b=cU1aD15zUtgkVCTT57Z5FBVgl7Gv9ik2BXu/ceuTSYOHAsnJxEpCa2axFBxORx4lKU
         rI7qg3oQHOyxSwWglaU5fIPy/1mTzK3v5uXR1//vpluENuMXJcmfD45jMl4VyQjhKkic
         U8TknYi/+1NJ1SSgq7zGMyApGhyJlJBoH3RKLIx3ca7OTJNvHU6dZuAmSCY/h1s5mnyq
         kpHZ2+2msUrvxIG0SzjwZEUGzcNXkmu/b4E0MeqEYRnHdthblwqVX0ziQmJL5d06qyH6
         ZonuGI7JKZwuH0yQxT2Uk1Vdhd+u9eJ2YOP2USGd9VSO6jUFueYBrILAU+7OrFKgL1x0
         Z9gw==
X-Forwarded-Encrypted: i=1; AJvYcCWXBV9ZJ5QnYKge+ZOkXFPqYqhoKbHnKmh/dp5LbQ6+JXX3A2b5KDi+UwjbQq532L8c7Q3nuwLhqWTQGlYtL/Rg@lists.infradead.org
X-Gm-Message-State: AOJu0YycYVUDFEpaLXLa/5oUDQ8Ge6a9/Wy9kmutS7wFqEsreB5MqkLq
	aDYPesIX9cWsHsWqkeoomiurTnoxSb2Fa65VXc6+Lvhoxvw+qZ3U4Xn9Tc8JZ7J4TJU=
X-Gm-Gg: AeBDiesT1Po+RIUG8mgY4yuP5OXZaGQT8fam1avXo4z2Ffr9MzODKguB3OqibnTNanf
	40DcHeWCVvnZxjgMq3Um+WAG6yGGDUMIxStmj+UFkGgUg5Q1i8lBfZPRxjN334u9NA9g/cSIUDU
	uKFh2puqfH3nNahmImq+qjKlPHFrU8n1ZUaZ8GGFHlVE97FXTDfijwQMTr7CIlNH0UqtjgqwV/3
	tdp7cPW2DDSSGOO8aLT517+gsSL1ayZd5Xwf0qpm5cD94mXpkAKxnU5LEGiU3vWYsYqxGx3QEa8
	0uK8Dmwa2faWoRnTGzm2yOc1tlJIniW2PRk5jSe8IkRgQP1PAOwa91KbfBaFEPNBl2Ss67+NVkH
	atuUK2Qwmg/eqFDYbVhBd0JbCohFRmvuPFuvc6S4/xtUUr/EmILoWmyhr5Ki8OV44QrhhzbNYWu
	wQZP9y9Bu2WWoGDh914IY=
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82f0c169049mr1259317b3a.15.1775782900710;
        Thu, 09 Apr 2026 18:01:40 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30f5c3sm731115b3a.3.2026.04.09.18.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 18:01:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] pmdomain: arm_scmi: add support for domain hierarchies
In-Reply-To: <20260313120707.jhkyd772wzuwmlhd@lcpd911>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-3-5361687a18ff@baylibre.com>
 <20260313120707.jhkyd772wzuwmlhd@lcpd911>
Date: Thu, 09 Apr 2026 18:01:39 -0700
Message-ID: <7hwlyfr5l8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_180142_030687_B84A2C1D 
X-CRM114-Status: GOOD (  24.27  )
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

Dhruva Gole <d-gole@ti.com> writes:

> On Mar 10, 2026 at 17:19:25 -0700, Kevin Hilman (TI) wrote:
>> After primary SCMI pmdomain is created, use new of_genpd helper which
>> checks for child domain mappings defined in power-domains-child-ids.
>> 
>> Also remove any child domain mappings when SCMI domain is removed.
>> 
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> ---
>
> Again, since it worked fine on my AM62L,
> Tested-by: Dhruva Gole <d-gole@ti.com>

Thanks for testing & reviewing!

> But I had some thoughts further down...
>
>>  drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
>> index b5e2ffd5ea64..9d8faef44aa9 100644
>> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
>> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
>> @@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>>  
>>  	dev_set_drvdata(dev, scmi_pd_data);
>>  
>> +	/*
>> +	 * Parse (optional) power-domains-child-ids property to
>> +	 * establish parent-child relationships
>> +	 */
>> +	ret = of_genpd_add_child_ids(np, scmi_pd_data);
>> +	if (ret < 0 && ret != -ENOENT)
>> +		pr_err("Failed to parse power-domains-child-ids for %pOF: %d\n", np, ret);
>
> Nit: I think the style of this driver is to use dev_err than pr_err

Agreed.

> Also, maybe a dev_warn makes more sense since we're not even returning
> the error or doing anything different if we get certain error path.

OK.

> I am wondering if it makes sense to just abort the whole idea of
> creating power-domain child ids if anything goes wrong?
>
> Basically just of_genpd_remove_child_ids if we face a condition where we
> have different number of parents/ children or id > num etc...
>
> All are error cases where the system behaviour can go on to become very
> unpredictable if we end up making a false/ incomplete parent-child ID
> map.
>
> Thoughts?

I agree.  After thinking through some of Ulf's suggestions on the
different error handling ideas, I think this should really be "all or
nothing".  If we we cannot parse & add all the children in the list, we
should add none of them.  I think partial additions will be come
unwieldy to manage rather quickly, and require the pmdomain core to keep
state.

Kevin

