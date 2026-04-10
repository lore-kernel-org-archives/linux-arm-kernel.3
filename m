Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4EDE99057
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1vmmkZcYrQbBuSPIBwVZCij2+2X5p9lbMUk5Tsb6wM=; b=KNyXDyoTAlYX6Z3SvHshndPpYc
	oGmcQq/4n9Gr46lSMReTCTxQZNdNQKQ44S5lSbMfsPgIvwYTVEi7Hu9c6ZDqFBjPezqz9s2jNaoAo
	SYZMgivuVLLR5P1RcJReJ7FUAu3oymoVTrL5bLfE7uX7H0A0mKPOYHUbYx9UbQxHmidbE6jUiMyOO
	ymIrOZ0H+8VaF48lck2itAxiBkxU9V2BSmxnWScYXtZV0UxNSdkiUxazQ2NMh9XSax9BCa8bWzmyt
	2hcgeBd8/Xj2aK01PQMjTdLPLTk3GoWcTIU3lUfbPM7yNX8GqD3YiQTOufLbadiLSAR6S6Kcts8B8
	fC3tDnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7gk-0000000Bs9E-1NWm;
	Fri, 10 Apr 2026 08:58:06 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7gi-0000000Bs8q-2fYY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 08:58:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59dea72099eso1792356e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 01:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775811482; cv=none;
        d=google.com; s=arc-20240605;
        b=bOc52l6VHVP1UCWDQ66oqKTQOEdFmk69nmZt2j6ooJgxU8Mlowefgxi1in0oDPVRd4
         D9uK3MQWU3byJrxjgVbvNZueB0NOxDl4QxP/7VWbKevUF4wVH+vYG4RKRX3G6eVO965b
         86PeXiBdz3b8Ex1corNVQ12gYpZ6+3PLioXqrKRekKb/to6XfAEf6kLH3Y6/vpxDG4Fk
         wmBEuHmAVaxg8dnke0+j2j3HmvZ86amrhMXTzJBP0R7yVpZ5Y5PZZe6yXJKotJKmrgKk
         CwCjtDETy+xOMDFVprlJg0Y4DD7zwC94xSdDUbYDlGjx5TtVz9CP6I6l3hOnvLMxq8/P
         N1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z1vmmkZcYrQbBuSPIBwVZCij2+2X5p9lbMUk5Tsb6wM=;
        fh=2a42exe5H+c4z1F+3MWv5gZ2Tt6bbMKoW5ha5MslC0w=;
        b=NUpKt2gSQ/UWxf3rUcN/1ext4KkNvfRjoRT7gxQCYC24mndV89eZ7W+xzqPckqLLKF
         QiZdXIp+Q0T7l1nVxgSc1JpmYetbyYGDVuJ6fW+gt5VMc3i+urd/XyvkbVC05AHrjQ2a
         la15uulbKXlW+3yZnt1EQCU0iytR6Zhbe284rf9z6q72/1tXZZx9UefPYRRN4u3iNXkg
         7rVFP05LUla9eOHlKTgS8Zl+IjPHXVV3oxnMhuqkMAJKaCiJZWnIfXCg1lqLenNGM07F
         hPjDVxv99I5b8uKgwLhJQjGqwlIQvI6QwjyNgM7esu1gfpbTYxlBIxRimIdK+L4RJFwr
         O91w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775811482; x=1776416282; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1vmmkZcYrQbBuSPIBwVZCij2+2X5p9lbMUk5Tsb6wM=;
        b=tmDEZWoPN0S7RL3rlqPNJAguJCVw45whbBi+d4eBueHMEiMxoa1mGQKnJTR1EXNGk9
         t4UuJXVDLmLo8ABg2meZJlwmRNnx6lqO+w1nVgapfYiU4e4QUHNE/NqkKOmZNVr2qGsA
         I+qOW048lHRfMUHEywZY2xI66TLHbLY++GEzdpNLAR5nyLgIj7jRiqnUw2rsB53mXM5A
         GBzIWWpD7808U5ujypIaXvS3aACIb48o6ZSD02Nz+GdmwIIWBUoqKMv3ovtHX3fL6VoS
         yc9MHwmwfJu1Yas2eGUQqgTS02TBj/i/jFTZld+YKsqoPEj9BKxWbQTbacAjbCLdZoVn
         v4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811482; x=1776416282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1vmmkZcYrQbBuSPIBwVZCij2+2X5p9lbMUk5Tsb6wM=;
        b=sAj194YHWOvYxooJbCOpkavRWDf9ColPfP9aeckFftwZJDyQcTe/gDC9lGVQEiMbci
         X1uxf8kVuOkAPmC+bmFq+oU9DkyGrJlu196SDAiwSCEGoEhRRhb5SIYTcHfYrQ7SbAkM
         uBGis7Xf+bEytuFDlrqZq+iZtod7KKE8S6kOWoAgtK6GyKEbczNmhjFo4Uv1Pb634AP1
         8K+dCtWgIYEBJ5CZI3vj1LCCQy35laODq83tBLemzq0I++w6uHjA4oic0JlRk3Xv6krk
         0EEc3q6V4CNrzwbNRxgYE8gFM8brOCCP33fadCygkRr19OzQHQ9NpIFMy518Rvb802Dg
         WQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmltCX3GWlYZInjraHR24/a4OuZfIIGZhb1aW/ItsUfQzeMfaEMSdgaNZkRgZt6nklgXlQob3yuj+p1+F9YaIz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk2RfgJAzV2uB+6ySKVWw01Bsh8+fICnMRs5qDM5R3EFQ1naR6
	HlA26m+DDgdW0Bxry/2NNyjIOZhQojzawNysNt/s1AlK73je8hXBChT/SMcdHY0/dPAx4/oKF8m
	vFrk8GvNHVlFIdC0PQghHljrp09YGR47R1+MxwRPirA==
X-Gm-Gg: AeBDieupBdj8qQLrGb5qe4JtAbq/3XgGeuqOVDs6jCIgu6yLFk4kJW3zLsTP0Jr/ZLS
	h5/nylqPxZSWBDxd5MNj1ZcuGsp+jcNkDGMX0rNCicIpbH3lCbGuaJb1dXOMcc93Pp7+h3fvZQ3
	IzSw85cJdwOE5nDM8I4N2LUV9vI5AvNqooXTBrFmSer4s2/G1cyAjbHLAr+lqsCc2XVOLHSNQIY
	eLmvtM+uoRMWr+K/bxuViGcbzsD5BM0n/uhTwt3Zzugfj1NLCvKhHDlcRU/lVb14aPK/U+HjYVZ
	a0kRHztO
X-Received: by 2002:a05:6512:1396:b0:5a2:c8d9:ec4a with SMTP id
 2adb3069b0e04-5a3ef9127demr836109e87.19.1775811482189; Fri, 10 Apr 2026
 01:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com> <7h4iljskvz.fsf@baylibre.com>
In-Reply-To: <7h4iljskvz.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Apr 2026 10:57:24 +0200
X-Gm-Features: AQROBzDhT0oW3z8LEIG1Euo0M3-dmugaTMajHzsT9TLnPM4O-8m4J3dOe0QMXE4
Message-ID: <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: core: add support for power-domains-child-ids
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_015804_723280_17B261D0 
X-CRM114-Status: GOOD (  49.20  )
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

On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
> >>
> >> Currently, PM domains can only support hierarchy for simple
> >> providers (e.g. ones with #power-domain-cells = 0).
> >>
> >> Add support for oncell providers as well by adding a new property
> >> `power-domains-child-ids` to describe the parent/child relationship.
> >>
> >> For example, an SCMI PM domain provider has multiple domains, each of
> >> which might be a child of diffeent parent domains. In this example,
> >> the parent domains are MAIN_PD and WKUP_PD:
> >>
> >>     scmi_pds: protocol@11 {
> >>         reg = <0x11>;
> >>         #power-domain-cells = <1>;
> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
> >>         power-domains-child-ids = <15>, <19>;
> >>     };
> >>
> >> With this example using the new property, SCMI PM domain 15 becomes a
> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
> >> WKUP_PD.
> >>
> >> To support this feature, add two new core functions
> >>
> >> - of_genpd_add_child_ids()
> >> - of_genpd_remove_child_ids()
> >>
> >> which can be called by pmdomain providers to add/remove child domains
> >> if they support the new property power-domains-child-ids.
> >>
> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> >
> > Thanks for working on this! It certainly is a missing feature!
>
> You're welcome, thanks for the detailed review.
>
> >> ---
> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
> >>  2 files changed, 185 insertions(+)
> >>
> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> index 61c2277c9ce3..acb45dd540b7 100644
> >> --- a/drivers/pmdomain/core.c
> >> +++ b/drivers/pmdomain/core.c
> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >>         return genpd;
> >>  }
> >>
> >> +/**
> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> >> + * @np: Device node pointer associated with the PM domain provider.
> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
> >> + *
> >> + * Parse the power-domains and power-domains-child-ids properties to establish
> >> + * parent-child relationships for PM domains. The power-domains property lists
> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
> >> + * should be associated with each parent.
> >> + *
> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
> >
> > I think we should avoid returning specific error codes for specific
> > errors, simply because it usually becomes messy.
> >
> > If I understand correctly the intent here is to allow the caller to
> > check for -ENOENT and potentially avoid bailing out as it may not
> > really be an error, right?
>
> Right, -ENOENT is not an error of parsing, it's to indicate that there
> are no child-ids to be parsed.
>
> > Perhaps a better option is to return the number of children for whom
> > we successfully assigned parents. Hence 0 or a positive value allows
> > the caller to understand what happened. More importantly, a negative
> > error code then really becomes an error for the caller to consider.
>
> I explored this a bit, but it gets messy quick.  It means we have to
> track cases where only some of the children were added as well as when
> all children were added.   Personally, I think this should be an "all or
> nothing" thing.  If all the children cannot be parsed/added, then none
> of them should be added.
>
> This also allows the remove to not have to care about how many were
> added, and just remove them all, with the additional benefit of not
> having to track the state of how many children were successfully added.
>

I fully agree, it should be all or nothing. Failing with one
child/parent should end up with an error code being returned.

That said, it still seems to make perfect sense to return the number
of children for whom we assigned parents for, no?

[...]

> >> +int of_genpd_remove_child_ids(struct device_node *np,
> >> +                          struct genpd_onecell_data *data)
> >> +{
> >> +       struct of_phandle_args parent_args;
> >> +       struct generic_pm_domain *parent_genpd, *child_genpd;
> >> +       struct of_phandle_iterator it;
> >> +       const struct property *prop;
> >> +       const __be32 *item;
> >> +       u32 child_id;
> >> +       int ret;
> >> +
> >> +       /* Check if both properties exist */
> >> +       if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
> >> +               return -ENOENT;
> >> +
> >> +       prop = of_find_property(np, "power-domains-child-ids", NULL);
> >> +       if (!prop)
> >> +               return -ENOENT;
> >> +
> >> +       item = of_prop_next_u32(prop, NULL, &child_id);
> >
> > Similar comments as for of_genpd_add_child_ids().
> >
> > Moreover, I think we should remove the children in the reverse order
> > of how we added them.
>
> I'm curious why does the order matter?  The children are all siblings
> (no hierarchy), so why would the order be important?

It might not be that important, but generally, it seems like a good
idea to me to reverse the order when undoing things.

>
> I'm not ware of a phandle iterator/helper to parse in the reverse, so
> that would mean iterating once to create a list, and then walking it in
> reverse.  Seems unnecessary.

Sure, I leave the call to you, to see what fits best.

Kind regards
Uffe

