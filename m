Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F05F9D0D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPnoP/VtWVc+m+Hy+JavXf/s8kHjIuaUNf4svkasJrs=; b=0yL78GJnSWJdjiWwSVVgkzXfOd
	NR5fbbzfVokz/efmQJjy4d0a/9V2fc4oodCFgJ+Cxz16NDYu0J27KmJEyMR8WXBs2wL24zHHpMW3M
	VOJ76kGP2VwDA61YjIJIR1bTzVC1gf9A+CUjQYWJkZYQYvc7mNqUizAZdA5e6if5lR2sQPD1O3gzb
	RBMJ0cnoE9mMddEinecx21eJOusMfwB05u0U9cS0/NV4Qv1e0tjaqznmReXCBB763UcxSJGERDAAM
	t/dK4HomOCmx+qgvLaRPq6yPzfgcNdyXN6yB3ex2XCQDDttSPsMS6pByynwGSAkdsihVXCu/We8ov
	O65VvshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeMv-0000000HQ3N-2eVI;
	Tue, 14 Apr 2026 14:03:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeMt-0000000HQ2w-1bDl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:03:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a337552604so4822797e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175433; cv=none;
        d=google.com; s=arc-20240605;
        b=QbrrnyCGTUxebeHvjY7Ilwd/hdusHtvLSTaW1OGS3tg6DZRohESiasI6EdRLtRztxs
         93IzE1joy4B2+YNERDR1KDEIQCeUxYSMy7wLHPhYGxYMU6yBLzQ3an8qCeeDF0tiFB+D
         tMWUrwJ+yVgoOp8mf038j3BLlMlusDKA0zEnk4nvAG+JWk32z71XOkye6hEnKYb2MiQl
         jOB9M1RUbr7TP1gCxKmUMkM8wce9XgeE9kyXNmQynnGlb8orR62XB9bI9rwhYOWvkXfP
         qdBVpxfIt3ojAxfi31zNC2x1WjSkVszKHamJbfK8JDn65rOJ4SMDYaF8uaoSeaV2ex+a
         WVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gPnoP/VtWVc+m+Hy+JavXf/s8kHjIuaUNf4svkasJrs=;
        fh=rWwmt9Bp7Ge7Xx32kNekjCHvFLY6xKDQ6xtopuT079Q=;
        b=e7ZWs1U38kHTvwE03pRInYf4CzOftlpL+mg/rZnFNBBOm2RvkHtIMzJheB3B4xW0bC
         cumHORvC7DlZVq/ykxT2iQDnmvZ5fiI42CZNwrTGrlp1hEmOeRPTQQzFc2zYnJRWpnvQ
         RA7h9gkD7ELkHwwghzXWyYI4UhZtqfY00i5oJhDHqR1BJfxL2tGmj0YEY7Usl7oyja+R
         gpG+8FI/gUppETqQwffJDLqdCjFdw/+DNKV63nur8d1z80E0XCT67gY/Uim3WBJVv2Up
         w3INtOWStV2qFmM0NZ16wvsJRfmyNmQIuTwlUrC1z020tqghAlUy60F4UukMcSo7lIfF
         Z9yA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776175433; x=1776780233; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gPnoP/VtWVc+m+Hy+JavXf/s8kHjIuaUNf4svkasJrs=;
        b=wZ5Q829eik3v9EsKTxF+PBpaVBA87o2bLG+z53aSzFCypn9JcUErzorfjOAemRySUN
         02CcGd3+j9qoekJGwxXO5Jm9wLaRcRUTTrwneKoKWPvGB6SwkKpVc3GhsiNFF+mIO07+
         fWYjSIeS4gyYF51SroAj1kFX+7OX5YVXj5gK3JEzOs08cu5rrNF/YFASAKs8wwiyth1c
         SuojEmaJuBos6boRpnf5RU2DCI8E4cYE2E9UTAkmrHqbarFz9rnlfa55DlcHbhBEw/Wq
         L8vadCz93dcAFQO3lxIQt8BiexjTDJfX8UcBfBKWh3mO4lsjOBSm0jxBORTNAEUzCbc3
         /xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175433; x=1776780233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPnoP/VtWVc+m+Hy+JavXf/s8kHjIuaUNf4svkasJrs=;
        b=oo2gZ6IMmlfhbtePk0bkeyivbqW6gZ/PL7Q88VikJi0OdgFThTRlOxP9gDEBwcluYG
         1omZSky+1qtxyhA94gK3vCSB94Z/tcTewUTzROpnwbhQInE4y4H0WFY09T4/fL94c/yO
         KGOlmBa+UlK+T6Dgr3f3IDQ0LcQruLl7dIAlKWcmFjqbqR4xLUXXaTV8Mal8tl0ssfOe
         B13FvHhSt/MrGPsauGi76qjYnCoUpAFujE7n5xIP379sHY7ODGaG8SPTIe8lUv1X7w7i
         lOYQC8CdaQKEFXbolkEOSYUXvWBswRi72VVfhrdy8Te7HBiT/ivcC+JyjeErchv0OM62
         F2vA==
X-Forwarded-Encrypted: i=1; AFNElJ92xkr/mKq1UW3ZXDrCTuS/y8lsAXuAPkPLrdwl3zcIBb9jivpS+sj4HN1cKnKqZ5IkQ7Xz9ZxxgrFrHJRxa5O1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf8LAA4UDblkGgwm5eUKY/FoiSHv2ptoOL418Pnwlwxu6Js4FJ
	9bQ5izmXxcoqAlotMu1jWm6b1PaH8pyIwix1zB4kAWNgYQTadN6s2aREa01AFaL2BGnApw9EQKm
	c5TyEB4olBJs+buNsPAF1X4PAGgai6WQUxcfeTI6mYw==
X-Gm-Gg: AeBDiett2V27vVJlSR+pCYEq4Re8583i22oaV470UvhBecXxGqWD5P+yQtTTGuZYb1e
	MJDREAVbP83tWAUrakKVopI87wGc3wlfMfnb4BJ3E3UXAm6ohxZ+ut4Y6wfk6JX05ZH/D0eViZi
	eJl+52tPQ598tN86lL/JEYXpQ8U/8E+ETvZ5pxQCOrSB6YWaYifbgfNF4yrqTKdIPRAXB4SuYID
	/Z3m3Xd/06EHNdB1o0kd8rYYVYLqmgW3OQ4CMLlf7CIccfHDM2TWGim0u77Gn2q2U/S3hayoNEF
	euNUsmKrV0ABUAEQ+XU=
X-Received: by 2002:ac2:4bc4:0:b0:5a3:fcba:559d with SMTP id
 2adb3069b0e04-5a3fcba55f9mr2772672e87.20.1776175432630; Tue, 14 Apr 2026
 07:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
 <20260410-topic-lpm-pmdomain-child-ids-v2-2-83396e4b5f8b@baylibre.com>
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-2-83396e4b5f8b@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Apr 2026 16:03:16 +0200
X-Gm-Features: AQROBzC039XjBS1eS-X-kRqOO7vWEj2nJaYb7iw3kPhkkHtYapY69V2VqSFFETc
Message-ID: <CAPDyKFrbk8SZs+-WMkbKnh12+OTBtoZ2bwtuASGvAsZwJEd4vQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pmdomain: core: add support for power-domains-child-ids
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_070355_517528_A0EFBEBD 
X-CRM114-Status: GOOD (  40.40  )
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

On Sat, 11 Apr 2026 at 01:44, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add support for oncell providers as well by adding a new property
> `power-domains-child-ids` to describe the parent/child relationship.
>
> For example, an SCMI PM domain provider has multiple domains, each of
> which might be a child of diffeent parent domains. In this example,
> the parent domains are MAIN_PD and WKUP_PD:
>
>     scmi_pds: protocol@11 {
>         reg = <0x11>;
>         #power-domain-cells = <1>;
>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
>         power-domains-child-ids = <15>, <19>;
>     };
>
> With this example using the new property, SCMI PM domain 15 becomes a
> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
> WKUP_PD.
>
> To support this feature, add two new core functions
>
> - of_genpd_add_child_ids()
> - of_genpd_remove_child_ids()
>
> which can be called by pmdomain providers to add/remove child domains
> if they support the new property power-domains-child-ids.
>
> The add function is "all or nothing".  If it cannot add all of the
> child domains in the list, it will unwind any additions already made
> and report a failure.
>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  drivers/pmdomain/core.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h |  16 ++++++++++++++++
>  2 files changed, 182 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 61c2277c9ce3..f978477dd546 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2909,6 +2909,172 @@ static struct generic_pm_domain *genpd_get_from_provider(
>         return genpd;
>  }
>
> +/**
> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> + * @np: Device node pointer associated with the PM domain provider.
> + * @data: Pointer to the onecell data associated with the PM domain provider.
> + *
> + * Parse the power-domains and power-domains-child-ids properties to establish
> + * parent-child relationships for PM domains. The power-domains property lists
> + * parent domains, and power-domains-child-ids lists which child domain IDs
> + * should be associated with each parent.
> + *
> + * Uses "all or nothing" semantics: either all relationships are established
> + * successfully, or none are (any partially-added relationships are unwound
> + * on error).
> + *
> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
> + */

As I mentioned in my earlier reply for the previous version, returning
a specific error code when the property doesn't exist will complicate
handling for the caller. Moreover, we also need to make sure we don't
returning the same error code (-ENOENT) for a different error further
down the execution path in of_genpd_add_child_ids(). Otherwise it
would the caller treat the error code in the wrong way.

To me, there are two better ways to address this. For both options,
of_genpd_add_child_ids() should return 0 when
"power-domains-child-ids" is missing.

1) Add another helper function that checks if
"power-domains-child-ids" exists. The caller can then use this to
pre-parse the property and decide whether to treat it as an error.

2) As I suggested earlier, let of_genpd_add_child_ids() return the
number of assigned parents/children, while still using the all or
nothing approach, of course.

Kind regards
Uffe

> +int of_genpd_add_child_ids(struct device_node *np,
> +                          struct genpd_onecell_data *data)
> +{
> +       struct of_phandle_args parent_args;
> +       struct generic_pm_domain *parent_genpd, *child_genpd;
> +       struct generic_pm_domain **pairs; /* pairs[2*i]=parent, pairs[2*i+1]=child */
> +       u32 child_id;
> +       int i, ret, count, child_count, added = 0;
> +
> +       /* Check if both properties exist */
> +       count = of_count_phandle_with_args(np, "power-domains", "#power-domain-cells");
> +       if (count <= 0)
> +               return -ENOENT;
> +
> +       child_count = of_property_count_u32_elems(np, "power-domains-child-ids");
> +       if (child_count < 0)
> +               return -ENOENT;
> +       if (child_count != count)
> +               return -EINVAL;
> +
> +       /* Allocate tracking array for error unwind (parent/child pairs) */
> +       pairs = kmalloc_array(count * 2, sizeof(*pairs), GFP_KERNEL);
> +       if (!pairs)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < count; i++) {
> +               ret = of_property_read_u32_index(np, "power-domains-child-ids",
> +                                                i, &child_id);
> +               if (ret)
> +                       goto err_unwind;
> +
> +               /* Validate child ID is within bounds */
> +               if (child_id >= data->num_domains) {
> +                       pr_err("Child ID %u out of bounds (max %u) for %pOF\n",
> +                              child_id, data->num_domains - 1, np);
> +                       ret = -EINVAL;
> +                       goto err_unwind;
> +               }
> +
> +               /* Get the child domain */
> +               child_genpd = data->domains[child_id];
> +               if (!child_genpd) {
> +                       pr_err("Child domain %u is NULL for %pOF\n", child_id, np);
> +                       ret = -EINVAL;
> +                       goto err_unwind;
> +               }
> +
> +               ret = of_parse_phandle_with_args(np, "power-domains",
> +                                                "#power-domain-cells", i,
> +                                                &parent_args);
> +               if (ret)
> +                       goto err_unwind;
> +
> +               /* Get the parent domain */
> +               parent_genpd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +               if (IS_ERR(parent_genpd)) {
> +                       pr_err("Failed to get parent domain for %pOF: %ld\n",
> +                              np, PTR_ERR(parent_genpd));
> +                       ret = PTR_ERR(parent_genpd);
> +                       goto err_unwind;
> +               }
> +
> +               /* Establish parent-child relationship */
> +               ret = pm_genpd_add_subdomain(parent_genpd, child_genpd);
> +               if (ret) {
> +                       pr_err("Failed to add child domain %u to parent in %pOF: %d\n",
> +                              child_id, np, ret);
> +                       goto err_unwind;
> +               }
> +
> +               /* Track for potential unwind */
> +               pairs[2 * added] = parent_genpd;
> +               pairs[2 * added + 1] = child_genpd;
> +               added++;
> +
> +               pr_debug("Added child domain %u (%s) to parent %s for %pOF\n",
> +                        child_id, child_genpd->name, parent_genpd->name, np);
> +       }
> +
> +       kfree(pairs);
> +       return 0;
> +
> +err_unwind:
> +       /* Reverse all previously established relationships */
> +       while (added-- > 0)
> +               pm_genpd_remove_subdomain(pairs[2 * added], pairs[2 * added + 1]);
> +       kfree(pairs);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(of_genpd_add_child_ids);
> +
> +/**
> + * of_genpd_remove_child_ids() - Remove parent-child PM domain relationships
> + * @np: Device node pointer associated with the PM domain provider.
> + * @data: Pointer to the onecell data associated with the PM domain provider.
> + *
> + * Reverses the effect of of_genpd_add_child_ids() by parsing the same
> + * power-domains and power-domains-child-ids properties and calling
> + * pm_genpd_remove_subdomain() for each established relationship.
> + *
> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error
> + * code on failure.
> + */
> +int of_genpd_remove_child_ids(struct device_node *np,
> +                          struct genpd_onecell_data *data)
> +{
> +       struct of_phandle_args parent_args;
> +       struct generic_pm_domain *parent_genpd, *child_genpd;
> +       u32 child_id;
> +       int i, ret, count, child_count;
> +
> +       /* Check if both properties exist */
> +       count = of_count_phandle_with_args(np, "power-domains", "#power-domain-cells");
> +       if (count <= 0)
> +               return -ENOENT;
> +
> +       child_count = of_property_count_u32_elems(np, "power-domains-child-ids");
> +       if (child_count < 0)
> +               return -ENOENT;
> +       if (child_count != count)
> +               return -EINVAL;
> +
> +       for (i = 0; i < count; i++) {
> +               if (of_property_read_u32_index(np, "power-domains-child-ids",
> +                                              i, &child_id))
> +                       continue;
> +
> +               if (child_id >= data->num_domains || !data->domains[child_id])
> +                       continue;
> +
> +               ret = of_parse_phandle_with_args(np, "power-domains",
> +                                                "#power-domain-cells", i,
> +                                                &parent_args);
> +               if (ret)
> +                       continue;
> +
> +               parent_genpd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +               if (IS_ERR(parent_genpd))
> +                       continue;
> +
> +               child_genpd = data->domains[child_id];
> +               pm_genpd_remove_subdomain(parent_genpd, child_genpd);
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_genpd_remove_child_ids);
> +
>  /**
>   * of_genpd_add_device() - Add a device to an I/O PM domain
>   * @genpdspec: OF phandle args to use for look-up PM domain
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f67a2cb7d781..b44615d79af6 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -465,6 +465,10 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
>  int of_genpd_parse_idle_states(struct device_node *dn,
>                                struct genpd_power_state **states, int *n);
>  void of_genpd_sync_state(struct device_node *np);
> +int of_genpd_add_child_ids(struct device_node *np,
> +                          struct genpd_onecell_data *data);
> +int of_genpd_remove_child_ids(struct device_node *np,
> +                             struct genpd_onecell_data *data);
>
>  int genpd_dev_pm_attach(struct device *dev);
>  struct device *genpd_dev_pm_attach_by_id(struct device *dev,
> @@ -534,6 +538,18 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
>  {
>         return ERR_PTR(-EOPNOTSUPP);
>  }
> +
> +static inline int of_genpd_add_child_ids(struct device_node *np,
> +                                        struct genpd_onecell_data *data)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static inline int of_genpd_remove_child_ids(struct device_node *np,
> +                                           struct genpd_onecell_data *data)
> +{
> +       return -EOPNOTSUPP;
> +}
>  #endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
>
>  #ifdef CONFIG_PM
>
> --
> 2.51.0
>

