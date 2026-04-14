Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB3EF9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=; b=nqVIs236Zwdk9hc72GVivvFvF2
	YNDN2vyeRrWYJqznp1BSJLluApTY4hc1v1WkVHdvdU7pXy0RSAVHGTP9IViAXHqlmNEkEPgo5h3Vf
	DfFs4+AZLUKJWVnephQHiG83a6KIeXgc/rSKrOOw7lz+2R1y9fo1x40J+K26nufy/XxHMGKOFSz9x
	STJ2WZ2VcXPjDBSDHfOSvSz5BEIqV2x8DNc4ImiBLWHW8DILX05+DeQqY8yL0VVQtWK4504pmcHqc
	8cNPr/kPqE/XWsFcjLlCuDDdsEurpx/ryLemiu9XfCSuDhhYCyAcuUQpI6+NoT0qoItbBCYjTgWnU
	/5wk5YKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe38-0000000HOSs-2Aia;
	Tue, 14 Apr 2026 13:43:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe36-0000000HOSN-0cF5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:43:29 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so5722734e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 06:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776174206; cv=none;
        d=google.com; s=arc-20240605;
        b=kD6+LrG6pbfdHRi+80xu9NExv52nc8Wzxkey0V/dWV6KB1BVgvKJZnYbXmKxJCaDA6
         vr4rFjHPlpBYBwYFzROF+5+qSnr4VwltTMjdL1dAbdsjn7/qZVGtquD+FDPs2QN9kzoK
         OVNluLRTbP9NdHkcEAApRQ1y1EuH90axmDGfGjaPUIkpFKjjMzRf2JUFMOer4xehBqWS
         aGZXsxf9VyrZ+CBHpjes/NNFIKRB3/7FC3/m7dKfj8U3IYm5uDLVwpw/ceflomEcEx3q
         FfeS2cp3AwGoD0Qpc9+fo5one41TTD5V3EXhGnuF+ppmLiEAdIl8/HI0ZS1I6GQzb0tZ
         YjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        fh=C4HJpYti/lS2/p1WA190S6ZZZ5YfbmxaHzmDj/pjBhM=;
        b=WOxEq81sKkrxv8N8JIs6R5y4ZA5vGEC5yDL5/qfkVbYYleA8goLQqWY3ykGdcRnZyF
         LxIclN8MSYuckRuM0FMakADazbeyKUX64Hibtog8+nNTT8ONDqvF2vPt3r3qUZd1Z2X8
         NnIXoZs5Ov2rVoMAnGVkdmc9qcbtAzpGIjfdd1XxykRIvs9LJh+XWZhGrNRN613wM2+a
         YzSJy/toSU0mGUn69x3SXAA3rzbjGAJS5tzebY9xEdffdAdudk4+ss4C3RyP/XxGJgQ6
         vHl9Bsei3peE9fSJdXrI/Xciqt01g6x4zweSEZXo0qVHNwaM6XdN1QHAY00ewoh8humX
         ynEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776174206; x=1776779006; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        b=z6pHfrUsdRWh6wPrzAxDRDvzGDqq9blBWqcLQdYcGnZ/uJMEmtc0gtsT9cyvHMdze6
         rTGciA3GtF9/n/LMF98DOeFJ56/1EidcCjHF8whP7mL7nklNgTjbWj0y68sPO5BFk3cw
         dj8p5M7ziP3zYH9Bb8QlnHruZoUS9wUpA6i9O3YjdzYLlOJ49z4POqIw7GtC+koW5YJD
         nfxlsjh8IBarPkv+KvSDKNr2xocjHw8gwrQjilzO015vFZui+CfwD/LSw71Esa0jFwQu
         Ch5i4ZoverNIJWQTPhijK9SBCaRXldiGsr/fuSgeZ1RPELOAL7fDBP3Bfc+/+Ftr3hDf
         D5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776174206; x=1776779006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy/0PzEut0PvWHR237jELAY9rSr5MyVNvmg6pBAc6Og=;
        b=jp9kknL/Jl5ZmEOwnUXR7mk+g457HjG6xI1MAQIgKaQ5s4EqCjNhp4Fc72wbVkH5zO
         XRQNF5qXRyKJVaB5lZYA+mnTGHR3+3C7QYXM/BTVY/EE3FWE58JSqx1tq7Nh/x2PdSjO
         vy+MGwe4ERPCTqk1mV9TVTxZWkEVZIXW+sCGWoOj05s7RS7WouVWz4cYe9ahr54NQXED
         7PjAvOMtCkwgO8xtsRJAfTcoegfGfo1bshLLhHM9fTYJIL+Pjk1Hyd74/HCLsXutZA0D
         WpM1NNIcEKBuN4wDKOlC3CudOc1s0IcaMyKfGZfeJXp7HBYqzm0v+cByxl6F/aj8laXZ
         aVnw==
X-Forwarded-Encrypted: i=1; AFNElJ/amWnK2iM11Si0o884rA1C2HSmO2wi7SGhEEPjECctgn9ge8Xgpziy9pIMym5YnyA1ljrBYplT60a3bUEQPqWp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Itq+uc2guclKJLirdoxvf+KTgRFlJhXp6w8x15TPLy6MrKAW
	mDvV8YtAbDJlwKAP+kc3vfpn33k06dmwQOIILw2ITZsBc+WC6XF5UbPsBcmF7frdWkoUI0C2ci9
	+mLdOrYMRxRSuMF0X4jBLPw2iAm+Cze0MUPcLQO0D6Q==
X-Gm-Gg: AeBDievadBMLXHHFyk3zpZsC+l0eYQQU0FIOZrcwZLdZ2vqvL5krrF8TuIWhraLZgjU
	97lbFT7FhUT8U1jnu0XU6Gh7cs25Ii+Txk+kY9RQ16iX4fiBb/dtBmqdPIcc3FRoy7S9pLwDQyt
	w8nmWzZ9JOztru1NgOqnI242Mzveuek6PU74i+guKSWcbFukjS4m1LDGH1WVZJbqDwPtgDHITNg
	6M3Miqd8M8nFwxq36IZW9T2Bm5L4JJGCxb+3+DuODighbLtdshAJ4dC3iCd6HifZE4sTN+BUdel
	JlNd99kRWrmv083Qukw=
X-Received: by 2002:a05:6512:692:b0:5a3:d3ac:505e with SMTP id
 2adb3069b0e04-5a3efb62ae8mr5639501e87.44.1776174205307; Tue, 14 Apr 2026
 06:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
 <7h4iljskvz.fsf@baylibre.com> <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
 <7hqzomqwpv.fsf@baylibre.com>
In-Reply-To: <7hqzomqwpv.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Apr 2026 15:42:47 +0200
X-Gm-Features: AQROBzD-JbDP-fgOPRrseyRbXAcHRr7LSIAAw6wp14sGFXLCR1gaiFIhrIczbGk
Message-ID: <CAPDyKFpWwwuxdU63Kuq_zoKkrFhkSjN6RrxdOCoL2u7JuH9B2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: core: add support for power-domains-child-ids
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_064328_235729_8289CD25 
X-CRM114-Status: GOOD (  46.37  )
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

On Sat, 11 Apr 2026 at 00:25, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Ulf Hansson <ulf.hansson@linaro.org> writes:
> >>
> >> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
> >> >>
> >> >> Currently, PM domains can only support hierarchy for simple
> >> >> providers (e.g. ones with #power-domain-cells = 0).
> >> >>
> >> >> Add support for oncell providers as well by adding a new property
> >> >> `power-domains-child-ids` to describe the parent/child relationship.
> >> >>
> >> >> For example, an SCMI PM domain provider has multiple domains, each of
> >> >> which might be a child of diffeent parent domains. In this example,
> >> >> the parent domains are MAIN_PD and WKUP_PD:
> >> >>
> >> >>     scmi_pds: protocol@11 {
> >> >>         reg = <0x11>;
> >> >>         #power-domain-cells = <1>;
> >> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
> >> >>         power-domains-child-ids = <15>, <19>;
> >> >>     };
> >> >>
> >> >> With this example using the new property, SCMI PM domain 15 becomes a
> >> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
> >> >> WKUP_PD.
> >> >>
> >> >> To support this feature, add two new core functions
> >> >>
> >> >> - of_genpd_add_child_ids()
> >> >> - of_genpd_remove_child_ids()
> >> >>
> >> >> which can be called by pmdomain providers to add/remove child domains
> >> >> if they support the new property power-domains-child-ids.
> >> >>
> >> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> >> >
> >> > Thanks for working on this! It certainly is a missing feature!
> >>
> >> You're welcome, thanks for the detailed review.
> >>
> >> >> ---
> >> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
> >> >>  2 files changed, 185 insertions(+)
> >> >>
> >> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> >> index 61c2277c9ce3..acb45dd540b7 100644
> >> >> --- a/drivers/pmdomain/core.c
> >> >> +++ b/drivers/pmdomain/core.c
> >> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >> >>         return genpd;
> >> >>  }
> >> >>
> >> >> +/**
> >> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> >> >> + * @np: Device node pointer associated with the PM domain provider.
> >> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
> >> >> + *
> >> >> + * Parse the power-domains and power-domains-child-ids properties to establish
> >> >> + * parent-child relationships for PM domains. The power-domains property lists
> >> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
> >> >> + * should be associated with each parent.
> >> >> + *
> >> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
> >> >
> >> > I think we should avoid returning specific error codes for specific
> >> > errors, simply because it usually becomes messy.
> >> >
> >> > If I understand correctly the intent here is to allow the caller to
> >> > check for -ENOENT and potentially avoid bailing out as it may not
> >> > really be an error, right?
> >>
> >> Right, -ENOENT is not an error of parsing, it's to indicate that there
> >> are no child-ids to be parsed.
> >>
> >> > Perhaps a better option is to return the number of children for whom
> >> > we successfully assigned parents. Hence 0 or a positive value allows
> >> > the caller to understand what happened. More importantly, a negative
> >> > error code then really becomes an error for the caller to consider.
> >>
> >> I explored this a bit, but it gets messy quick.  It means we have to
> >> track cases where only some of the children were added as well as when
> >> all children were added.   Personally, I think this should be an "all or
> >> nothing" thing.  If all the children cannot be parsed/added, then none
> >> of them should be added.
> >>
> >> This also allows the remove to not have to care about how many were
> >> added, and just remove them all, with the additional benefit of not
> >> having to track the state of how many children were successfully added.
> >>
> >
> > I fully agree, it should be all or nothing. Failing with one
> > child/parent should end up with an error code being returned.
> >
> > That said, it still seems to make perfect sense to return the number
> > of children for whom we assigned parents for, no?
>
> No, because what will the caller use that number for?  If we are
> assuming "all or nothing", what would we use it for (other than a debug print?)
>
> It also makes it a bit confusing what a zero return value means.  Does
> that mean success?  Or that zero children were added (which would be
> fail.)
>
> I prefer to keep it as is.

In that case, how should we treat the scenario where the device node
lacks a "power-domains-child-ids" property? In some cases it is
probably fine, while in others it may not be.

I guess the caller of of_genpd_add_child_ids(), would then need to
pre-parse for the "power-domains-child-ids" property before deciding
to call of_genpd_add_child_ids().

At least, we don't of_genpd_add_child_ids() to return an error code if
there is no "power-domains-child-ids" in the device node, as that
would just confuse the caller.

Kind regards
Uffe

