Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4752FEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBp8RLEDVIlzkv1F9VuUM1ruuuUZPFdkClJzuEAiKOA=; b=Pj4HgZUe8Rj+2Q9n3iqUU9aXh6
	61EXI+RERncv8PDPf2l3UUKhGGVv1VdXpGFLQWyeo8FXRr2hFxGW03hHOi5VGDJeyyRrCv1R2ya2/
	sE/QXTdF2ZkDN9vwXXrRZEyols6ETPJ67Y0+mysFbgRTouh7ULcIUbq5XxRiN5hv0yJJ5TVQ/Gfqf
	xkmiKQ0W8TKWdjJSrVuFIU8yVKU2e6o35LTFeNsXzGMmjBVpKgbSGjnPBcIMMn21Spu+7DXiUmi68
	we+XathABny0l2QwuelhVDKODs49v0Hbi5QaAmPbjA2xRa6brWAhiZBiHMyOhxNf6EZo+TwJZeeMb
	nV27m9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LOW-000000038NS-1DqB;
	Wed, 25 Mar 2026 10:23:24 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LOT-000000038Mx-3zsy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:23:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a2853b1f8cso2028133e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 03:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774434200; cv=none;
        d=google.com; s=arc-20240605;
        b=aNEqxRZ0W4SjHNDBfPMwwWr5ESfqg/dbbVHWB8PMDJo41wDsJnI/JW8xyRWx5c+oCP
         f7deUvZ3hdk/ko0aPxjtco119p2GDji3x7YEn2lTuYA1pKKkH7aZehK2y1OCPXhlQugF
         34wTNa7QyxeYp3mFhFZSOAkgBZSNWx8nLUTJmcBXfxTMah3voVaxvUGb7TgDLBjIbtU5
         hwMErE8rvwz07rijLPz5EcfGOojnsPpMApDPZrWG812ZNAQ9wwNJnddeU13xK/spA1Zw
         H7KI1HUbZzQhUz+zsXJm34KJnrGKb1ixgFo6YIuTAjj34dtqNjT1zrdQN5m/IohPZodk
         1o7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mBp8RLEDVIlzkv1F9VuUM1ruuuUZPFdkClJzuEAiKOA=;
        fh=k2EyL5Q5VxA2M+6iiFK+W+y3b3A0tGj5A2zNzg9r7w4=;
        b=HNNMiw4CXrV4KDFa7uNbQYv0F8xfUTkyVXX/Xd5899zKPu9bnhg/YHpgF02D1I2xAd
         mTYsD5HSeZU2hBBllSm9bU/69rM1lTbBpmyN09oBXy71EooZqtDMCbwTNhJq23eg5N23
         eRrUJvZtCyE6Zr2yRyb7JaR1ztuPajrBxlF2sqBtMp/A039UnGQEmF6EwsIAqdG5WGwa
         DDLDKFS4nENP7XzHbrW3GuGMt2AcnIWOTbbbQ8lwcJovPcuJBNokc6LkAUvvK7v6/udq
         ITFICqtlfuJC562oDuwUcanv17G57U3jZmvWr3NPLLRwjT2Xgeh6tN6cHJeD6LedB7/U
         wmog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774434200; x=1775039000; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mBp8RLEDVIlzkv1F9VuUM1ruuuUZPFdkClJzuEAiKOA=;
        b=edXyFXEihzRjcIVSDRe/IkmE5XdXCM4xqDABkq5rTU1foiUEO5YBJUjLbLjNjT7tgG
         gkov2ep73v6+gtslgsMgOcqhW8Si1P3BthtnnfqRsagB4jHWYdR8yQtbRrQeLdScL0HT
         zTpUBf5IL13QzvihKfuXyaflMP10LOkDIiSzUQm6/AG5qybM93nNIEkfswsxGnQCNbc4
         PBta/pT9KXfkGNTioVgNn9w4XY3nFgPJMHX1/ad6tcNC6io0x/yXW09r5y2X8rAY6pkI
         gNQIIi1gcT5/LhZPuWcGDSpjmRKsfT2YZN458vbbPPCKz1Bm5I4XdY9H0J/sqFbAIr38
         FWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434200; x=1775039000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBp8RLEDVIlzkv1F9VuUM1ruuuUZPFdkClJzuEAiKOA=;
        b=ETcC2F/AwYeRYqp24El0gW6qGkq7/muUNzhQUUV2nTXyIhvoU1tOgJBeGx6C0VxPly
         sifUaDg3oXh3Xrz8+R3yWtu/ndFM9aYOv5E3aiDHdV7P9zfzQhhxvaYA1XCWVrW0s8D2
         hbw/pU+dQ+I+B3V8Og6U4i+cngX3wnL+i0qVwd6ubDW6STOmzNXLW1HooqC1KcnQAL4j
         CbVHqUfGqt/EHF8Ay5I5E18gbNx+y//Us2dl2GWdgfA8IvymE7M70+sBUy+QrIh5IkBd
         YCtSXk+LQ18j7GLiiBvVY45Pw5vQXVUvf+sTybLJdQveEE2IQ/bd8cQQG2agwz70knMH
         1Rdw==
X-Forwarded-Encrypted: i=1; AJvYcCVwOoQvMu35Riil9HVpSi9vrIdh9ok33mZKEO1panlKk/rLq2ifQRNSMhPlMxHmE1KRXyR8bSBDAt8OU+ffvwan@lists.infradead.org
X-Gm-Message-State: AOJu0YwjqR5d73cOj5SoLqJvLO+RPkW7HIrxgag/dbO7F9POCjgsJRcg
	FG+yosmYGizQiWueDGOPVYIHqm4VanjwbTQxOOcYCvR9ySi2ZvezZ/PK2cpn+UPOawgSnuK65tc
	Of3hlwEhL8IcNVc84KqbCuhFxptGx8sbZvWz/KOoyTA==
X-Gm-Gg: ATEYQzzckhQsoHwwBo6eXp42nMfev1RwcXgj9JN45Lctpw6JeMShKBjyxvVeQNJjD6t
	iU7jdwZnA66Vdr9Pl4V/4NOJ87wm7i3UV+szBJ4YYrQ3r4129HPbYuqwpTyLk0UYdSk+FFtCZhv
	/PRxr+6jjFuIghZpbnrf8EhnSKc5rChJR/qCUf15R8dDG9Sp8NdA/IOfjHdNeV/3dNgkh5MBLOb
	JXUW6bUoL9TJ5fcnZPDTmOtPLI2chuoiVQcAHozaltztdwiR/R7RDlMYENWYPY/63+GQ3WS7+Du
	/7wk1Fsg
X-Received: by 2002:a05:6512:39cc:b0:5a2:7f4b:8e87 with SMTP id
 2adb3069b0e04-5a29b97d9cfmr1256395e87.3.1774434199644; Wed, 25 Mar 2026
 03:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Mar 2026 11:22:43 +0100
X-Gm-Features: AQROBzCAhrnkHE2n7Vl-AWMRhbzCM0xZ4JtiJNaCMCH2pRumSmgZhFKQaLi64kk
Message-ID: <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: core: add support for power-domains-child-ids
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_032322_086764_A9C7FABC 
X-CRM114-Status: GOOD (  45.69  )
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

On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
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
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>

Thanks for working on this! It certainly is a missing feature!

> ---
>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h |  16 ++++++++++++++++
>  2 files changed, 185 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 61c2277c9ce3..acb45dd540b7 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
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
> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.

I think we should avoid returning specific error codes for specific
errors, simply because it usually becomes messy.

If I understand correctly the intent here is to allow the caller to
check for -ENOENT and potentially avoid bailing out as it may not
really be an error, right?

Perhaps a better option is to return the number of children for whom
we successfully assigned parents. Hence 0 or a positive value allows
the caller to understand what happened. More importantly, a negative
error code then really becomes an error for the caller to consider.

> + */
> +int of_genpd_add_child_ids(struct device_node *np,
> +                          struct genpd_onecell_data *data)
> +{
> +       struct of_phandle_args parent_args;
> +       struct generic_pm_domain *parent_genpd, *child_genpd;
> +       struct of_phandle_iterator it;
> +       const struct property *prop;
> +       const __be32 *item;
> +       u32 child_id;
> +       int ret;
> +
> +       /* Check if both properties exist */
> +       if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
> +               return -ENOENT;
> +
> +       prop = of_find_property(np, "power-domains-child-ids", NULL);
> +       if (!prop)
> +               return -ENOENT;
> +
> +       item = of_prop_next_u32(prop, NULL, &child_id);

Perhaps it's easier to check if of_property_count_u32_elems() returns
the same number as of_count_phandle_with_args() above? If it doesn't,
something is wrong, and there is no need to continue.

This way you also know the number of loops upfront that must iterate
through all indexes. This should allow us to use a simpler for-loop
below, I think. In this case you can also use
of_property_read_u32_index() instead.

> +
> +       /* Iterate over power-domains phandles and power-domains-child-ids in lockstep */
> +       of_for_each_phandle(&it, ret, np, "power-domains", "#power-domain-cells", 0) {
> +               if (!item) {
> +                       pr_err("power-domains-child-ids shorter than power-domains for %pOF\n", np);
> +                       ret = -EINVAL;
> +                       goto err_put_node;
> +               }
> +
> +               /*
> +                * Fill parent_args from the iterator. it.node is released by
> +                * the next of_phandle_iterator_next() call at the top of the
> +                * loop, or by the of_node_put() on the error path below.
> +                */
> +               parent_args.np = it.node;
> +               parent_args.args_count = of_phandle_iterator_args(&it, parent_args.args,
> +                                                                 MAX_PHANDLE_ARGS);
> +
> +               /* Get the parent domain */
> +               parent_genpd = genpd_get_from_provider(&parent_args);

Before getting the parent_genpd like this, we need to take the
gpd_list_lock. The lock must be held when genpd_add_subdomain() is
being called.

> +               if (IS_ERR(parent_genpd)) {
> +                       pr_err("Failed to get parent domain for %pOF: %ld\n",
> +                              np, PTR_ERR(parent_genpd));
> +                       ret = PTR_ERR(parent_genpd);
> +                       goto err_put_node;
> +               }
> +
> +               /* Validate child ID is within bounds */
> +               if (child_id >= data->num_domains) {
> +                       pr_err("Child ID %u out of bounds (max %u) for %pOF\n",
> +                              child_id, data->num_domains - 1, np);
> +                       ret = -EINVAL;
> +                       goto err_put_node;
> +               }
> +
> +               /* Get the child domain */
> +               child_genpd = data->domains[child_id];
> +               if (!child_genpd) {
> +                       pr_err("Child domain %u is NULL for %pOF\n", child_id, np);
> +                       ret = -EINVAL;
> +                       goto err_put_node;
> +               }
> +
> +               /* Establish parent-child relationship */
> +               ret = genpd_add_subdomain(parent_genpd, child_genpd);
> +               if (ret) {
> +                       pr_err("Failed to add child domain %u to parent in %pOF: %d\n",
> +                              child_id, np, ret);
> +                       goto err_put_node;
> +               }
> +
> +               pr_debug("Added child domain %u (%s) to parent %s for %pOF\n",
> +                        child_id, child_genpd->name, parent_genpd->name, np);
> +
> +               item = of_prop_next_u32(prop, item, &child_id);
> +       }
> +
> +       /* of_for_each_phandle returns -ENOENT at natural end-of-list */
> +       if (ret && ret != -ENOENT)
> +               return ret;
> +
> +       /* All power-domains phandles were consumed; check for trailing child IDs */
> +       if (item) {
> +               pr_err("power-domains-child-ids longer than power-domains for %pOF\n", np);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +
> +err_put_node:

This isn't a suffient error handling.

If we successfully added child domains using genpd_add_subdomain(), we
must remove them here, by calling pm_genpd_remove_subdomain() in the
reverse order as we just added them.

> +       of_node_put(it.node);
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
> +       struct of_phandle_iterator it;
> +       const struct property *prop;
> +       const __be32 *item;
> +       u32 child_id;
> +       int ret;
> +
> +       /* Check if both properties exist */
> +       if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
> +               return -ENOENT;
> +
> +       prop = of_find_property(np, "power-domains-child-ids", NULL);
> +       if (!prop)
> +               return -ENOENT;
> +
> +       item = of_prop_next_u32(prop, NULL, &child_id);

Similar comments as for of_genpd_add_child_ids().

Moreover, I think we should remove the children in the reverse order
of how we added them.

> +
> +       of_for_each_phandle(&it, ret, np, "power-domains", "#power-domain-cells", 0) {
> +               if (!item)
> +                       break;
> +
> +               parent_args.np = it.node;
> +               parent_args.args_count = of_phandle_iterator_args(&it, parent_args.args,
> +                                                                 MAX_PHANDLE_ARGS);
> +
> +               if (child_id >= data->num_domains || !data->domains[child_id]) {
> +                       item = of_prop_next_u32(prop, item, &child_id);
> +                       continue;
> +               }
> +
> +               parent_genpd = genpd_get_from_provider(&parent_args);
> +               if (IS_ERR(parent_genpd)) {
> +                       item = of_prop_next_u32(prop, item, &child_id);
> +                       continue;
> +               }
> +
> +               child_genpd = data->domains[child_id];
> +               pm_genpd_remove_subdomain(parent_genpd, child_genpd);
> +
> +               item = of_prop_next_u32(prop, item, &child_id);
> +       }
> +
> +       return (ret == -ENOENT) ? 0 : ret;
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

Kind regards
Uffe

