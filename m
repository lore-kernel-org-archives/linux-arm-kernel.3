Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7178F45A0F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 22:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO2Iz58ZlsFu3Y4x3hOSK/rbD3OpjMOM0bJqqqYROA0=; b=pqUJp/EV4HEQCTXqweUz0uR3dP
	MU4x6vq4Wd5Ox1bahVJOXtOK2y3oPhouwWn3IQYHIGExoIHYagE3q+Sx4bAajMHNmsehoPoC6B1mA
	NqnoJ9dr/IXgHWpR2NoMmL4KIGPfGK1cZRC09hwSn+LqAkXhrJpOq1A6IJCntMb+oAiY/5v7OklSm
	YDnk4qc5IikFIx3EUkS/+wEUZQJv+5wQQMTywtlZjuViZ5rWTMn4lkV2O9doO9JvtdCsTVtS9aGQe
	QlocrUTEt1fhf1Jygf65ThVEnuhPUUSf7I2ImfQWDdtpN2F0Rfj0S+l6SY9zEEv9YEh4uYizplCgd
	Iw343v9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKID-0000000CsYk-0MTV;
	Fri, 10 Apr 2026 22:25:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBKIA-0000000CsYL-1ARQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 22:25:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35d965648a2so2206845a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 15:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775859933; x=1776464733; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oO2Iz58ZlsFu3Y4x3hOSK/rbD3OpjMOM0bJqqqYROA0=;
        b=LeKV3Ll0s5OlnJnhfg3CYAgKR3lUHLgbP8KlmDuUlE2rWygAZN3gZPSr1iDZuLmFb2
         d8vF9kAYVlCBm2VPBaOCzsVOFa9Do/FjFtFU3M1JWm2GIGHas7lhZoSdcVGPlRo/w2i7
         Gg+cnK4FRt5RAxz7DJ8+AI/vUDGpHAB/jmPr7f9OS6yaheDaKLReqWb6IqmRCO1qMF/9
         CO2S40/nTfZdmovFCIz+yaKBScR/xnTJvdBorDGtSVnzZYjzyPi5ZeEVEfb8I9PkDEwV
         rjmB52zBYEZHg+IybS1YiEI9COEniMGf3wKlg1Wo6ZjjpkitRy9nXmP/eHKzkd2s45Ht
         UB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775859933; x=1776464733;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oO2Iz58ZlsFu3Y4x3hOSK/rbD3OpjMOM0bJqqqYROA0=;
        b=CgmPyigkfhP3fvCnjydh7dt5P5WWIFdJcoZFKy33AAHlFR9i5TQu2NZibUG/SmngGf
         djijh/j5j+cNu6S0YHFyErzSLGb+UdzcA6uM5VoMmMxxvJif7v8V26WrSgmh3imxR3av
         Fv41toB+TO1+YE1eALKC01zEybjwZ9S7wl0vWZ7Il6vtSZjJTS8osnWP4sar/5IDnTV4
         6OQxbp4s0qcJl//kfDg+AGRjsG3n3uezwezImUR97utB5PJ0WRC57MLqEo/fwVuICmW8
         W9mf6Da+L1qOvoYhPuj9Onn0svNPmh6/PNvps1SbnOwR2K9+8KzO1RTK0hSMZVcYMT3F
         1g/w==
X-Forwarded-Encrypted: i=1; AJvYcCXKvktEJ1JXGg50xHuoQx0qVzFFr8X1W/KJuOKVIpF8srCC2bMcos3IVfmHAIyCcaFEEFbN536sx9QYDtEomaf8@lists.infradead.org
X-Gm-Message-State: AOJu0YwbQApaUs38CDTbIOt0xff7NTVe+1FHyU4J/PytbK5G8VvcYCiZ
	uC0wbTyfmYkZ28rUCO3gQeFve/BkPjKCHfMsxovYIEPPyCPVw13zom0D4krEsXmXf30=
X-Gm-Gg: AeBDietJjQhvgCSc5+P5VWTH9Pv+qaWDo+EyNtWkwMimd+9yrdKRWIP+7aR+58IVykc
	rfnH92HwO6lnh+pyUauKiMot8CLEx+mkmGWs3S+nQFQzoIwZGs18CsieT4O1vS3u6dvJbqEFjcr
	tu7Nzwn1830/pPe0YFN455IBF8DiZi+UsUNH3U5SxsVy+nuCwlIXDQUFXZHwLnTunYTD9Hbs3jY
	7sdSZgWmJyJyUFO3M18dy8dFEdk39+dJoHwHHEIAMHLK4IA5qw+bKsMJQIhFbAP4T5d8nWSF5de
	oX0/YbDhQcrWKx2z9r6l7SmFQ4fiusQis3T2/TWbCD29mYBnTICP4P27LgzXNvYVkoYpdxdymAK
	4aPQ5x7M1UD8BadKckPN3KDRw/qU4WsakRZQsD6a2SY4reJPy7R2P4lwL+ki/jrkVwDxYU/DejT
	PCDEz2DtZVNiebBoQFz3A=
X-Received: by 2002:a17:90b:35cd:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35e428524cbmr5346124a91.17.1775859933169;
        Fri, 10 Apr 2026 15:25:33 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41336a20sm6073059a91.14.2026.04.10.15.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:25:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] pmdomain: core: add support for
 power-domains-child-ids
In-Reply-To: <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
 <CAPDyKFquJ7K4NcWuKMr1sjrnFVVPGAeLCiSF_FhvJf9Frbn1uA@mail.gmail.com>
 <7h4iljskvz.fsf@baylibre.com>
 <CAPDyKFrR2zyMFXTAkKs1XRgB-u5jSP256g730s=7SLuOZKsKVg@mail.gmail.com>
Date: Fri, 10 Apr 2026 15:25:32 -0700
Message-ID: <7hqzomqwpv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_152534_345343_B7C5F455 
X-CRM114-Status: GOOD (  34.06  )
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

> On Fri, 10 Apr 2026 at 02:45, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>
>> > On Wed, 11 Mar 2026 at 01:19, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>> >>
>> >> Currently, PM domains can only support hierarchy for simple
>> >> providers (e.g. ones with #power-domain-cells = 0).
>> >>
>> >> Add support for oncell providers as well by adding a new property
>> >> `power-domains-child-ids` to describe the parent/child relationship.
>> >>
>> >> For example, an SCMI PM domain provider has multiple domains, each of
>> >> which might be a child of diffeent parent domains. In this example,
>> >> the parent domains are MAIN_PD and WKUP_PD:
>> >>
>> >>     scmi_pds: protocol@11 {
>> >>         reg = <0x11>;
>> >>         #power-domain-cells = <1>;
>> >>         power-domains = <&MAIN_PD>, <&WKUP_PD>;
>> >>         power-domains-child-ids = <15>, <19>;
>> >>     };
>> >>
>> >> With this example using the new property, SCMI PM domain 15 becomes a
>> >> child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
>> >> WKUP_PD.
>> >>
>> >> To support this feature, add two new core functions
>> >>
>> >> - of_genpd_add_child_ids()
>> >> - of_genpd_remove_child_ids()
>> >>
>> >> which can be called by pmdomain providers to add/remove child domains
>> >> if they support the new property power-domains-child-ids.
>> >>
>> >> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> >
>> > Thanks for working on this! It certainly is a missing feature!
>>
>> You're welcome, thanks for the detailed review.
>>
>> >> ---
>> >>  drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >>  include/linux/pm_domain.h |  16 ++++++++++++++++
>> >>  2 files changed, 185 insertions(+)
>> >>
>> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> >> index 61c2277c9ce3..acb45dd540b7 100644
>> >> --- a/drivers/pmdomain/core.c
>> >> +++ b/drivers/pmdomain/core.c
>> >> @@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
>> >>         return genpd;
>> >>  }
>> >>
>> >> +/**
>> >> + * of_genpd_add_child_ids() - Parse power-domains-child-ids property
>> >> + * @np: Device node pointer associated with the PM domain provider.
>> >> + * @data: Pointer to the onecell data associated with the PM domain provider.
>> >> + *
>> >> + * Parse the power-domains and power-domains-child-ids properties to establish
>> >> + * parent-child relationships for PM domains. The power-domains property lists
>> >> + * parent domains, and power-domains-child-ids lists which child domain IDs
>> >> + * should be associated with each parent.
>> >> + *
>> >> + * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
>> >
>> > I think we should avoid returning specific error codes for specific
>> > errors, simply because it usually becomes messy.
>> >
>> > If I understand correctly the intent here is to allow the caller to
>> > check for -ENOENT and potentially avoid bailing out as it may not
>> > really be an error, right?
>>
>> Right, -ENOENT is not an error of parsing, it's to indicate that there
>> are no child-ids to be parsed.
>>
>> > Perhaps a better option is to return the number of children for whom
>> > we successfully assigned parents. Hence 0 or a positive value allows
>> > the caller to understand what happened. More importantly, a negative
>> > error code then really becomes an error for the caller to consider.
>>
>> I explored this a bit, but it gets messy quick.  It means we have to
>> track cases where only some of the children were added as well as when
>> all children were added.   Personally, I think this should be an "all or
>> nothing" thing.  If all the children cannot be parsed/added, then none
>> of them should be added.
>>
>> This also allows the remove to not have to care about how many were
>> added, and just remove them all, with the additional benefit of not
>> having to track the state of how many children were successfully added.
>>
>
> I fully agree, it should be all or nothing. Failing with one
> child/parent should end up with an error code being returned.
>
> That said, it still seems to make perfect sense to return the number
> of children for whom we assigned parents for, no?

No, because what will the caller use that number for?  If we are
assuming "all or nothing", what would we use it for (other than a debug print?)

It also makes it a bit confusing what a zero return value means.  Does
that mean success?  Or that zero children were added (which would be
fail.)

I prefer to keep it as is.

Kevin

