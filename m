Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685D1CE7AFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eqlDC7X0gqJRAqiJRcCl4GBOektXaeza2XTrHJXL7I=; b=khuIuNBaSFjUA8TZIuxMNtRoF7
	eATZWXzktGUXwsyd68kmrfKuf/zmfoVQZUnhSbEAI8wJgPj9smDn9YUBCNmHeeA4cyOYBxI4vgUHE
	zxLmbuEhANISdjokTMU09xUKJn9zhull35qFp2iG/KAlcO1zrfvt+/9PAuohOwSePXiZMH+iAOfB+
	UyvC+08NCkLyY/cYyEWQ66+KFkYrS2YhiS/zceRJwYR+/kdu2Hh6GB5ZNNqvoJXSiZc+KnEiIsWtt
	wdcUevxs7NXtAOrVWbFiMHYxBYNBssE+ihjADk5DutduJopXM3ByaXYI3B8ws2ufr9rM6uScf78Ws
	kydL92sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy9x-0000000CvLl-1qaI;
	Fri, 14 Nov 2025 18:04:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy9v-0000000CvLO-1e7J
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 18:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6eqlDC7X0gqJRAqiJRcCl4GBOektXaeza2XTrHJXL7I=; b=judnO6MOd9IMnzzgIjKAo+cffS
	ksfY4m+pKrhaXyGzzqsxclzjY01lQd5AJDRT2iwPE8nNg+N4CRlGUYUK1XIZJK8xGlOHddIjC/wIy
	+YYQfOzAGEwlFrESdFM2wgPSoOXkN3I09OD42bRk4rGYRi6RHmQ4ciEqMyN9LuQgx+psvljCQYBhH
	VXbajt6BqjajhCp8X4zEC8POF96836qDb30R6BJD1CHTkcw8iCpb62VHc7dbVRwfwehtnyjD1BWkp
	1XZMnziTk2uYnsMqCslDQXW4nbp/qhC/KpEtZqTrHDTY/vpk6Adl+h8FkUChVPXY9rmW/9+1npMCw
	PypC2ryQ==;
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy94-00000009j8o-3kFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 18:03:40 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-88044caaa3eso20350166d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 10:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763143416; x=1763748216; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6eqlDC7X0gqJRAqiJRcCl4GBOektXaeza2XTrHJXL7I=;
        b=fw7UHe094v7IPoxA7Mi2lKIvGKSHxGuNTG2Ubo98wTO72bI3i3rgrqsDuOze9iueJv
         Fmoun6NNQkPZqKxHOtqNGaL0L0WJJ2o3jlqhkgdTlXHPPLIFvGM2xFEMt17w+cw9ymzS
         Tv+XTtuV+aRbQeJyk8ToOz1xBKwxLZqUnjAJxjfvYpvMkXLbW3q+pn7yzUoNp321FYfS
         vdXcokJS6FQDkaqAGClFfcG9qEae4iwWzhUCKotn5RRgTKaXTw3FbN/zPEMu3OiNSyvM
         u3dXU0w0ifxtrJ5+KHYYRKzHldgmJzkaYZ75raw7B1P1EqDqI9Ur1CF11Lr2yfftaPUJ
         bTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763143416; x=1763748216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eqlDC7X0gqJRAqiJRcCl4GBOektXaeza2XTrHJXL7I=;
        b=bHwN2g6mYIFLOnYA3p3kcJNJGTjeFyJQiiGnZ0tte6hEjqZMTL9DLbQoO5p9LdYu6p
         jJK2PTtm3VvcmqJzB0pyyrqYJoRKmNhWYGPIgzjIzVOM3ukQfg9U/GfOjOT1epmxO2aZ
         n3qTqb8G9qjIkIx4ikidUK6fE7DaGhOqOgUEOGFLTqObtPVI2TCKUwwYLuNrl+hsKwS0
         Wuvrzu63dHl8myEc/oL9pbrgzYpJdlXR0a4MdKalcXdqVHFFT2KXcUZLmBzkwlpqKFx6
         0/ceX3InHXwRKE/NOPC6+/S7Nrv5inbtV80AWY5o1lFlo4oD1Q7CTVrBJ9l4eUZDB2/L
         MibA==
X-Forwarded-Encrypted: i=1; AJvYcCW+BVOm9/tyBEZaojsb5U+mHyNejfR/rhcagJqfjPKHE7NTZ1v+oTMEiHQjf117AS3921RB9vS5BKLAvgicYVUy@lists.infradead.org
X-Gm-Message-State: AOJu0YzGg8dTssCl+mJPFd+O5MhXhqFsqiFxlumpIeVs17op3y2Wgh0c
	c6neCNvs23FFlYN6HCEhbSkRe0Mosw1uWNMpzYPU9Fo0uDAWHlubpfFO744q4wMVnNeo98P8IiV
	Wi44i6qOXOWawAWKRoIXV/4Rn54CQmgtjRUojROLcvw==
X-Gm-Gg: ASbGncu/F1c6HyUT8rJH+oEUtKr8Ke0xiTuQH08HrnTbLJhpHjimY9AYTqCS2Mj6inu
	eUM8lLgBeiakd3Zn7jUmPkTj2Kqoo3UHMAstba3H16ivMyb7JqIHSe+GMJ10aestUmaWNnrIyDd
	2XqqPn2Nn6NJZ6bv34725yoaZmMTj4xYe/LYNtSm4e/L/lsR9dxP6Eg4IEf6Jkeij6Kr7+ujJV6
	uYOUPbls4AraQctE+owpK6TURl6rTr1UF96RpLiBDXpjAqs/rWFwn55bUWdPdYCCmTJnUUb9nj8
	pWtSJLg5PrrJyVj/f8z8HmISYagxFqZeR3smUW1OxjjOej3+KA==
X-Google-Smtp-Source: AGHT+IF8q10bECTFJX0AJCPmlxe/M9pvE6fQzwsvfVV0/Nm/Ugn0ObCr3Yv5vgdgZmSsF3tqp0JusLq+2msJSOTOBlM=
X-Received: by 2002:a05:6214:5010:b0:882:3b63:f7fc with SMTP id
 6a1803df08f44-8829263b9d2mr58692806d6.36.1763143415911; Fri, 14 Nov 2025
 10:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20251027223545.2801-1-mike.leach@linaro.org> <20251027223545.2801-2-mike.leach@linaro.org>
 <20251113173617.GA3568724@e132581.arm.com>
In-Reply-To: <20251113173617.GA3568724@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 14 Nov 2025 18:03:25 +0000
X-Gm-Features: AWmQ_blXQazAF2sfLlgqDUKfafUp4PN-4iuL-37LBJsWh5mJD4stLr2aBON4v3g
Message-ID: <CAJ9a7VhVb6a=Q_oZ=0FcrY-EKDNtZPjHbJ=rqaUQ0cardqrSdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] coresight: fix issue where coresight component has
 no claimtags
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, james.clark@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_180338_953220_0E748CF7 
X-CRM114-Status: GOOD (  49.46  )
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

Hi Leo

On Thu, 13 Nov 2025 at 17:36, Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Oct 27, 2025 at 10:35:45PM +0000, Mike Leach wrote:
> > Coresight components have 0 to 8 claim tag bits. ARM recommends 4 and
> > the implemented claim tag protocol uses two of these.
> >
> > If a component has insufficient claim tags then the protocol incorrectly
> > returns an error when attempting to claim a component.
> >
> > Fix by reading CLAIMSET to establish then actual number of claim tags
> > and return success when attempting to claim a component were there are
> > insufficient tags to implement the protocol.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++--
> >  drivers/hwtracing/coresight/coresight-priv.h | 10 +++++
> >  include/linux/coresight.h                    | 15 +++++++
> >  3 files changed, 68 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index 3267192f0c1c..61b4902b0ead 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -131,6 +131,39 @@ coresight_find_out_connection(struct coresight_device *csdev,
> >       return ERR_PTR(-ENODEV);
> >  }
> >
> > +/*
> > + * Reading CLAiMSET returns  a bitfield representing the number of claim tags
>
> s/CLAiMSET/CLAIMSET
>
> > + * implemented from bit 0 to bit nTag-1, valid bits set to 1.
> > + *
> > + * Claim protocol requires 2 bits so test for MS bit required,
> > + * bit 1 -  CORESIGHT_CLAIM_BIT_PROTOCOL_HI
> > + *
> > + * return true if sufficient claim tags implemented for protocol
> > + */
> > +static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
> > +{
> > +     u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
> > +                      csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
> > +     return ((claim_bits_impl & CORESIGHT_CLAIM_BIT_PROTOCOL_HI) != 0);
>
> How about a simple one?
>
>         return !!FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
>                            csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));

Cannot use this as it is valid, if unlikely, to have 1 claim bit which
would give a false positive as we need 2 bits for the existing
protocol.

> > +}
> > +
> > +/*
> > + * check if we can use the claim tag protocol.
> > + *
> > + * If currently unknown - read register to determine if sufficient tags and
> > + * save value, otherwise return current value.
> > + */
> > +static bool coresight_check_use_claim_tag_unlocked(struct coresight_device *csdev)
> > +{
> > +     if (csdev->claim_tag_info == CS_CLAIM_TAG_UNKNOWN) {
> > +             if (coresight_claim_tags_implemented_unlocked(&csdev->access))
> > +                     csdev->claim_tag_info = CS_CLAIM_TAG_STD_PROTOCOL;
> > +             else
> > +                     csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
> > +     }
> > +     return (csdev->claim_tag_info == CS_CLAIM_TAG_STD_PROTOCOL);
> > +}
> > +
> >  static u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
> >  {
> >       return FIELD_GET(CORESIGHT_CLAIM_MASK,
>
> Why do not apply claim tag implemented check in
> coresight_read_claim_tags_unlocked() ?

This is a static local only called from either
coresight_claim_device_unlocked or coresight_disclaim_device_unlocked,
both of which check for claim tag implemented before calling this
function.

>
> > @@ -156,6 +189,9 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
> >
> >  void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
> >  {
> > +     if (!coresight_claim_tags_implemented_unlocked(csa))
> > +             return;
>
> Here it does not call coresight_check_use_claim_tag_unlocked(), which
> means the cached flag is not used. I think we should be consistent
> across all claim tag functions.

the relevant csdev may not yet exist, and is only used once in init -
see below for further explanation

>
> This is why I suggested to put the flag into csdev_access rather than
> in csdev. Seems to me, it is nature to use csdev_access to store this
> flag, as it presents a attribute for register access (we can consider
> csdev presents a device on bus).

Not used here as these claim tag functions are not consistent
themselves - some use a csdev, some use a csa.

The ones that use csa are exclusively used in clearing down a stale
claim tag during initialization of a device in a probe function or sub
function and called only once per device - sometimes  before a csdev
is in existence. This is safe in cases where claim tags do not exist
or are not operating correctly as writes will be ignored. This
therefore only represents a single write per device, and not something
that occurs multiple times and might benefit from caching the claim
tag usage status.

All other uses of claim tags in the drivers use the claim/disclaim
functions using the csdev as a parameter, after probing and when the
claim infrastructure is being used.

Having the claimtag information in the csdev is natural as this has
all the other general cs information - such as cs type, subtype etc -
describing the coresight features of the hardware.

The csa is a structure describing only how the registers are accessed.
with no register or device specifics. This should remain device/
register agnostic and avoid coupling in device/register specific
parameters.

An additional use of the flag for claimtag usage state (beyond the
slight gain in avoiding a read per call to the claim tag API), is to
allows customers whose claim tags are non-operative, or as in an
actual case - also give a false positive of
operationally sufficient claim tags - to set the test to "no claim
tags" during the probe sequence, so as to ensure the test is skipped
and claim tags are never attempted to be used during enable / disable
device

The clearing down of the self claim tag on probe is to remove stale
self claim tags when a kernel is restarted without disclaiming
hardware (e.g. debugging/crash etc) and without repowering the device.
From a kernel perspective, this does not have to happen until the
first claim attempt is made for the device. Given that on the first
claim call we now do a one time check, this one time clearing of
lingering claim tags could be done here, and remove the clear tag apis
completely simplifying the code  - though this would leave the devices
apparently claimed until that first use.

>
> If agree with above, then we can create a new function:
>
>   void coresight_init_self_claim_tag(struct csdev_access *csa)
>   {
>       csa->claim_tag_implemented = !!FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
>                            csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));

This fails in the case where a system reports an incorrect number of
claim bits. (existing customer use case)


>
>       if (csa->claim_tag_implemented)
>           coresight_clear_self_claim_tag(csa);
>   }
>
> This function is called by probe()s in CoreSight drivers, afterwards,
> simply check the flag "csa->claim_tag_implemented".
>
> A minor benefit is we can drop coresight_check_use_claim_tag_unlocked()
> and the enum coresight_claim_tag_info, as we just need to initialize
> csa->claim_tag_implemented at the init phase.
>
> > +
> >       csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
> >                                    CORESIGHT_CLAIMCLR);
> >       isb();
> > @@ -175,12 +211,13 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
> >  int coresight_claim_device_unlocked(struct coresight_device *csdev)
> >  {
> >       int tag;
> > -     struct csdev_access *csa;
> >
> >       if (WARN_ON(!csdev))
> >               return -EINVAL;
> >
> > -     csa = &csdev->access;
> > +     if (!coresight_check_use_claim_tag_unlocked(csdev))
> > +             return 0;
>
> > +
> >       tag = coresight_read_claim_tags_unlocked(csdev);
> >
> >       switch (tag) {
> > @@ -190,7 +227,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
> >                       return 0;
> >
> >               /* There was a race setting the tag, clean up and fail */
> > -             coresight_clear_self_claim_tag_unlocked(csa);
> > +             coresight_clear_self_claim_tag_unlocked(&csdev->access);
> >               dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
> >               return -EBUSY;
> >
> > @@ -237,6 +274,9 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
> >       if (WARN_ON(!csdev))
> >               return;
> >
> > +     if (!coresight_check_use_claim_tag_unlocked(csdev))
> > +             return;
>
> If use the method mentioned, no need to spread
> coresight_check_use_claim_tag_unlocked() in claim and disclaim functions.
>
> Thanks,
> Leo
>
> > +
> >       if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
> >               coresight_clear_self_claim_tag_unlocked(&csdev->access);
> >       else
> > diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> > index 33e22b1ba043..270f179c8535 100644
> > --- a/drivers/hwtracing/coresight/coresight-priv.h
> > +++ b/drivers/hwtracing/coresight/coresight-priv.h
> > @@ -41,6 +41,16 @@ extern const struct device_type coresight_dev_type[];
> >  #define CORESIGHT_CLAIM_SELF_HOSTED  2
> >  #define CORESIGHT_CLAIM_INVALID              3
> >
> > +/*
> > + * Coresight specification defines a maximum of 8 claim tag bits.
> > + * The precise number is implementation defined, and may be obtained by
> > + * reading the CLAIMSET register.
> > + */
> > +#define CORESIGHT_CLAIM_BITS_MAX_MASK        GENMASK(7, 0)
> > +
> > +/* MS Bit required by the protocol */
> > +#define CORESIGHT_CLAIM_BIT_PROTOCOL_HI      BIT(1)
> > +
> >  #define TIMEOUT_US           100
> >  #define BMVAL(val, lsb, msb) ((val & GENMASK(msb, lsb)) >> lsb)
> >
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index 6de59ce8ef8c..fefe4317a793 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -242,6 +242,19 @@ struct coresight_trace_id_map {
> >       raw_spinlock_t lock;
> >  };
> >
> > +/*
> > + * Coresight claim tag info:
> > + * CS_CLAIM_TAG_UNKNOWN      - not yet checked.
> > + * CS_CLAIM_TAG_STD_PROTOCOL - using standard claim/release protocol.
> > + * CS_CLAIM_TAG_NOT_IMPL     - no claim tags available.
> > + */
> > +enum coresight_claim_tag_info {
> > +     CS_CLAIM_TAG_UNKNOWN,
> > +     CS_CLAIM_TAG_STD_PROTOCOL,
> > +     CS_CLAIM_TAG_NOT_IMPL,
> > +};
> > +
> > +
> >  /**
> >   * struct coresight_device - representation of a device as used by the framework
> >   * @pdata:   Platform data with device connections associated to this device.
> > @@ -265,6 +278,7 @@ struct coresight_trace_id_map {
> >   *           CS_MODE_SYSFS. Otherwise it must be accessed from inside the
> >   *           spinlock.
> >   * @orphan:  true if the component has connections that haven't been linked.
> > + * @claim_tag_info: how the device is using claim tags.
> >   * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
> >   *           by writing a 1 to the 'enable_sink' file.  A sink can be
> >   *           activated but not yet enabled.  Enabling for a _sink_ happens
> > @@ -291,6 +305,7 @@ struct coresight_device {
> >       local_t mode;
> >       int refcnt;
> >       bool orphan;
> > +     enum coresight_claim_tag_info claim_tag_info;
> >       /* sink specific fields */
> >       bool sysfs_sink_activated;
> >       struct dev_ext_attribute *ea;
> > --
> > 2.32.0
> >

Regards


Mike




--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

