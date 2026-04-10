Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00973F36B97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 00:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqN2cIzftfYEekrpgNPDXUdrBnoMgDEUwL6BuRfPeX8=; b=jFHxFJwQsl33KtTk+5xi9RDW3x
	qxuVeEij3CEGbNKuX2CCVFXtfL8x38cxe/8BgjJTgiJErbuh6uqYm2qi6imQ56o2oNoEyqDUcyXaA
	KcsZTamhtqrhMS7fB5Kcrpk7Qgm2R4VAhUgUD4Xyq8VrGjNpjoSocWokG62VcT6oYqwQYOJtPxioX
	BglnbE/M4u94+p2KKYVAgaT3UEQjLfvG4D1jLPvjKixKx9qA+AnsFsjfSYgY5LIamnuQMgQgu8CUX
	uCdD002mRpJznYLADKtBL2U+rRXtH5HDDwvL3Q94s3c2zK0JagnKza0UpqLFjHd4RE1/ElOHzs5LL
	EH1HLc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB00U-0000000BNaA-2ctm;
	Fri, 10 Apr 2026 00:45:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB00R-0000000BNZp-0jJ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 00:45:57 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso10894245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 17:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775781954; x=1776386754; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqN2cIzftfYEekrpgNPDXUdrBnoMgDEUwL6BuRfPeX8=;
        b=J7kvhO04Z3rd2ejb2y8NyiXpcxvJL/S8bpcO7XeWUvw8O00bRYnta+xVG0Y5XI7W4s
         +24EjiHEu9P08/OzFSiaYXyrrsOFDfY0oggCNDkli1JgJEedY+Xxzdc4+7095oWK7ip7
         szsrZPi/1dPw83ndT+uFFI+8zzCPG5zRCD7SMdNJ0TiADm0iBPR0V5Quq1RFaDiu66VR
         IWQ0/Gr3MH3kOCgKpEblBmw6OKbJq6jLUA2ozVh7pRvFb9IS21VrxS6BK4FyEMji1qlJ
         VYzf6290zI8Hi8aI/23DX3Yc8A2fHYyqyPGdgf8hvtZ6uHb3xNrwWgjhebhAf0fXbVar
         FfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775781954; x=1776386754;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqN2cIzftfYEekrpgNPDXUdrBnoMgDEUwL6BuRfPeX8=;
        b=PNorqMIMFMFqhJRSJa3QV7AA6bMOlMXsUBgEvMioXIKvrIt71CStSt+b+d2cGBJAqD
         0683AmftC+RShg3bG0DtWyCHAZE5gqNCbX/tyNLYp7eLk4WTjQiWiAXr8A80pkW5tXmK
         qALgd/oape7pYS8wx4DqiXYS0QzTjVEcPL2ICRZfEyJLr+ajK7Ad9gInm8vAv8+KtyWt
         x/d9hfb87YtjJMRu34VWYO8fmxXsdMJkaiuXUTYeBvvCEGb8Ujoux9DimLKJLhfCS5ph
         IxRI4dwl3s98zrM8tX8OvqkXAtTTwB678uWS/P4m6222RoCwZ3UdrzBynki8P8YkbeCX
         chCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCXnvzIHCqyQqu0V7LkTH7qVwVuat6KcaRKpk66SfbJRy54w0oieEG0eCyuYK+nZhBbPe3YTCg9l5llL4Yhn+7@lists.infradead.org
X-Gm-Message-State: AOJu0YyA/02Zbqd5OuKBelRQNMImOf+w+BmLHUe2MCxRjgWjRGRZSS6n
	vJSIo+S1sd4pMztBtWhR9Xon4tIjF6/4+I4UKAajAAdgqIEH4x8cEgMpaHALOdEfJ8c=
X-Gm-Gg: AeBDiesjj7u19XBAwcEBLN22UcPtE9FMS5gnlrk/zWZ5pmgHy8oJw6emxLKVLOdIDtC
	wIhz81UDF9JaHEqkMg1EXCcuASbLvyNVyzYLg5nNzYs7yMU9nf0UD6vL0ba1JBSxKw31ugEaST+
	eL8s3dd+MGhEMES465zwO6uk6Apm+SwR3avbSsw7g5wBWbAL6AZSE0K0j6n9fOamy0M5Ocdx7CR
	4CU0/M8tf5lCKV6e2Vz/JwUuLnFDW87mffmMFFO3IJMROVS84a24xvgRKS1JUOytArS32lQliBj
	wmzA8rBRdH49S+R2urn7RwtocX1bgYwZPRhSahwmE0yT9J8Xv+AVSS4c0ubs2GfkAnq+Yakc/cF
	ZtloicC8yBTsL4Egdcs0741ia1s+/9X3k3Tzo6PqEJTwNXZNSVzOj/1E5OMl/hdO4lnL+G9q+Qa
	tOtAaEKiVANuGi0kS3Prw=
X-Received: by 2002:a17:903:1b6e:b0:2ae:3b9b:db34 with SMTP id d9443c01a7336-2b2d5aa0becmr10846795ad.42.1775781953566;
        Thu, 09 Apr 2026 17:45:53 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f469casm7488445ad.81.2026.04.09.17.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 17:45:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] pmdomain: core: add support for
 power-domains-child-ids
In-Reply-To: <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
Date: Thu, 09 Apr 2026 17:45:52 -0700
Message-ID: <7h4iljskvz.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_174555_479395_7DB3E339 
X-CRM114-Status: GOOD (  49.49  )
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

> On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
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
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>
> Thanks for working on this! It certainly is a missing feature!

You're welcome, thanks for the detailed review.

>> ---
>>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/pm_domain.h |  16 ++++++++++++++++
>>  2 files changed, 185 insertions(+)
>>
>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> index 61c2277c9ce3..acb45dd540b7 100644
>> --- a/drivers/pmdomain/core.c
>> +++ b/drivers/pmdomain/core.c
>> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
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
>> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
>
> I think we should avoid returning specific error codes for specific
> errors, simply because it usually becomes messy.
>
> If I understand correctly the intent here is to allow the caller to
> check for -ENOENT and potentially avoid bailing out as it may not
> really be an error, right?

Right, -ENOENT is not an error of parsing, it's to indicate that there
are no child-ids to be parsed.

> Perhaps a better option is to return the number of children for whom
> we successfully assigned parents. Hence 0 or a positive value allows
> the caller to understand what happened. More importantly, a negative
> error code then really becomes an error for the caller to consider.

I explored this a bit, but it gets messy quick.  It means we have to
track cases where only some of the children were added as well as when
all children were added.   Personally, I think this should be an "all or
nothing" thing.  If all the children cannot be parsed/added, then none
of them should be added.

This also allows the remove to not have to care about how many were
added, and just remove them all, with the additional benefit of not
having to track the state of how many children were successfully added.

>> + */
>> +int of_genpd_add_child_ids(struct device_node *np,
>> +                          struct genpd_onecell_data *data)
>> +{
>> +       struct of_phandle_args parent_args;
>> +       struct generic_pm_domain *parent_genpd, *child_genpd;
>> +       struct of_phandle_iterator it;
>> +       const struct property *prop;
>> +       const __be32 *item;
>> +       u32 child_id;
>> +       int ret;
>> +
>> +       /* Check if both properties exist */
>> +       if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
>> +               return -ENOENT;
>> +
>> +       prop = of_find_property(np, "power-domains-child-ids", NULL);
>> +       if (!prop)
>> +               return -ENOENT;
>> +
>> +       item = of_prop_next_u32(prop, NULL, &child_id);
>
> Perhaps it's easier to check if of_property_count_u32_elems() returns
> the same number as of_count_phandle_with_args() above? If it doesn't,
> something is wrong, and there is no need to continue.

Agreed. Will add.

> This way you also know the number of loops upfront that must iterate
> through all indexes. This should allow us to use a simpler for-loop
> below, I think. In this case you can also use
> of_property_read_u32_index() instead.

OK.

>> +
>> +       /* Iterate over power-domains phandles and power-domains-child-ids in lockstep */
>> +       of_for_each_phandle(&it, ret, np, "power-domains", "#power-domain-cells", 0) {
>> +               if (!item) {
>> +                       pr_err("power-domains-child-ids shorter than power-domains for %pOF\n", np);
>> +                       ret = -EINVAL;
>> +                       goto err_put_node;
>> +               }
>> +
>> +               /*
>> +                * Fill parent_args from the iterator. it.node is released by
>> +                * the next of_phandle_iterator_next() call at the top of the
>> +                * loop, or by the of_node_put() on the error path below.
>> +                */
>> +               parent_args.np = it.node;
>> +               parent_args.args_count = of_phandle_iterator_args(&it, parent_args.args,
>> +                                                                 MAX_PHANDLE_ARGS);
>> +
>> +               /* Get the parent domain */
>> +               parent_genpd = genpd_get_from_provider(&parent_args);
>
> Before getting the parent_genpd like this, we need to take the
> gpd_list_lock. The lock must be held when genpd_add_subdomain() is
> being called.

Good catch, thanks.

>> +               if (IS_ERR(parent_genpd)) {
>> +                       pr_err("Failed to get parent domain for %pOF: %ld\n",
>> +                              np, PTR_ERR(parent_genpd));
>> +                       ret = PTR_ERR(parent_genpd);
>> +                       goto err_put_node;
>> +               }
>> +
>> +               /* Validate child ID is within bounds */
>> +               if (child_id >= data->num_domains) {
>> +                       pr_err("Child ID %u out of bounds (max %u) for %pOF\n",
>> +                              child_id, data->num_domains - 1, np);
>> +                       ret = -EINVAL;
>> +                       goto err_put_node;
>> +               }
>> +
>> +               /* Get the child domain */
>> +               child_genpd = data->domains[child_id];
>> +               if (!child_genpd) {
>> +                       pr_err("Child domain %u is NULL for %pOF\n", child_id, np);
>> +                       ret = -EINVAL;
>> +                       goto err_put_node;
>> +               }
>> +
>> +               /* Establish parent-child relationship */
>> +               ret = genpd_add_subdomain(parent_genpd, child_genpd);
>> +               if (ret) {
>> +                       pr_err("Failed to add child domain %u to parent in %pOF: %d\n",
>> +                              child_id, np, ret);
>> +                       goto err_put_node;
>> +               }
>> +
>> +               pr_debug("Added child domain %u (%s) to parent %s for %pOF\n",
>> +                        child_id, child_genpd->name, parent_genpd->name, np);
>> +
>> +               item = of_prop_next_u32(prop, item, &child_id);
>> +       }
>> +
>> +       /* of_for_each_phandle returns -ENOENT at natural end-of-list */
>> +       if (ret && ret != -ENOENT)
>> +               return ret;
>> +
>> +       /* All power-domains phandles were consumed; check for trailing child IDs */
>> +       if (item) {
>> +               pr_err("power-domains-child-ids longer than power-domains for %pOF\n", np);
>> +               return -EINVAL;
>> +       }
>> +
>> +       return 0;
>> +
>> +err_put_node:
>
> This isn't a suffient error handling.
>
> If we successfully added child domains using genpd_add_subdomain(), we
> must remove them here, by calling pm_genpd_remove_subdomain() in the
> reverse order as we just added them.

OK, I was relying on the remove function to cleanup, but you're right,
if there's a falure during the add, it should be unwound before
returning.

>> +       of_node_put(it.node);
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(of_genpd_add_child_ids);
>> +
>> +/**
>> + * of_genpd_remove_child_ids() - Remove parent-child PM domain relationships
>> + * @np: Device node pointer associated with the PM domain provider.
>> + * @data: Pointer to the onecell data associated with the PM domain provider.
>> + *
>> + * Reverses the effect of of_genpd_add_child_ids() by parsing the same
>> + * power-domains and power-domains-child-ids properties and calling
>> + * pm_genpd_remove_subdomain() for each established relationship.
>> + *
>> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error
>> + * code on failure.
>> + */
>> +int of_genpd_remove_child_ids(struct device_node *np,
>> +                          struct genpd_onecell_data *data)
>> +{
>> +       struct of_phandle_args parent_args;
>> +       struct generic_pm_domain *parent_genpd, *child_genpd;
>> +       struct of_phandle_iterator it;
>> +       const struct property *prop;
>> +       const __be32 *item;
>> +       u32 child_id;
>> +       int ret;
>> +
>> +       /* Check if both properties exist */
>> +       if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
>> +               return -ENOENT;
>> +
>> +       prop = of_find_property(np, "power-domains-child-ids", NULL);
>> +       if (!prop)
>> +               return -ENOENT;
>> +
>> +       item = of_prop_next_u32(prop, NULL, &child_id);
>
> Similar comments as for of_genpd_add_child_ids().
>
> Moreover, I think we should remove the children in the reverse order
> of how we added them.

I'm curious why does the order matter?  The children are all siblings
(no hierarchy), so why would the order be important?

I'm not ware of a phandle iterator/helper to parse in the reverse, so
that would mean iterating once to create a list, and then walking it in
reverse.  Seems unnecessary.

Thanks again for the detailed review,

Kevin

