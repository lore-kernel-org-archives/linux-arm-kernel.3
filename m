Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0697E77183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kiUVYADXZMs0PrxCadhmBZVpv0bclMEtNvJ3GEENZM=; b=JKNTYUUJqpEWgEJaHN3PHylPcC
	zsmy12mB3asV1gm/13hynJJWpcyzXM20SlsvA3rc2kMV43fzduM0vhWbtDZhbjbl301i2yYJsXJAQ
	NbcWQyMECkd6mn2OjL3KGWI0fm+8r1yF2go3DgYG6wBtk2m8PzWKe/801P4QwVC1/ErAd3dwm0bEV
	SfhEiGJcTWY4yX+iHdDn2JtIXPIg+cVOEHCKGGzUQXx0UDwpnDh4QI8ffNhAHnwQPdOXNXehUoONr
	DU/NjTyaVQxOoUcjXM49ERGglPv5rlQBdq5fIeMf8sQagq6k8rXYfF/jyJZ7+xKBm8gEP4L1P74EK
	o/qLpaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAtz-00000004jiT-3e8r;
	Fri, 13 Dec 2024 19:00:40 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAsu-00000004jbt-2l6P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 18:59:33 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-85c436db302so906074241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 10:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734116371; x=1734721171; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2kiUVYADXZMs0PrxCadhmBZVpv0bclMEtNvJ3GEENZM=;
        b=S4ui+krIUY3leOmn1lpUgCGwCYeqbCLPvagern3PMLyG8TNk3z09QTkcimniwhE9hB
         9lcSMzQg9mfj5TFGJo1/DxP5kfpxo6up6l4DUVpRWM3dY8hrHPtLya+4j50+8R9mBUcI
         SXidLjmnLjRJnQdX3UHm87U1Ibjt0ZP2ZWXFq61ezOlkJlIq0FpTbS//pAzihCBQKWlG
         o01DqWuODjtnhm8ioJB0wpLyYRkm9xdUXBPexQypRxdT8uq/nvHPJuxxjV0wA1bwHBAJ
         vUAqcRe0NobBrL2SoMFOOQ579xkl7TBPjv8HprI8ivfhzUcd/qX2BvOm3clvvT3r+/g5
         QmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734116371; x=1734721171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kiUVYADXZMs0PrxCadhmBZVpv0bclMEtNvJ3GEENZM=;
        b=ryoJnGRv3h+CxoboWrUEJrFxbtUHtzudt1UofcP84SJKsU8V7jtJ1V73EqSPoQ2H2/
         +Km5rZPLLQYW6DxPXS3s9ad0GAg40bqxCPtT1Ol+TWCpUvCfspXMF9sy8le991sM8iJU
         +M3EOviLZ7eIQu0LDhQQtOqbeAuvOV7Hs3b4sU7V2Gr9km92nXDXgCt832vsCN1FeqG7
         RKYexGKkaOeOabZBx4zwFB1usaWWtPdbailCIAbGUlU6K5ZdahbctDe0At8zIVC5BWe2
         L36qXxojMWVjZeoFg7zNSfCdxctXQFZWd5OuO2OQfZyqHu+fI7CpDkduUZ1degeS3bpF
         E+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRstxFXwT+5oFkaQYrwn3brSA2i6B8f6A7xD8vSM4EGoF/qKfwVAG9q9KUftmRhj6fzWqDOFYpQ5uRhAkxGjlz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq/+t5xmv8mhlvDL/jq9H/o+Z6HQRZjnu2ehdiQuFeIyPHcmbP
	/ziRJDR0Iz2O9YnU0+YuMiL6bUMTVRZ4jaJwM+1/gjOsPORqJ8nfzpv1KeltRd+nTfMNkoUFyQY
	4H3oN8BW2jZtZP/kpWoPLSeliTerTmlDOEwpaSeVTzPPMK8St
X-Gm-Gg: ASbGncv8rTHH7ZTq5xn7WUPOFoN98oxyG2qK4kBL3cQuWzLiqcnGiTE82rfd5nCln36
	K9M1tfGElrRmp67GzkIDMOnVtAGXgVZA8RDSUsg3+HY2vMC748YdXlrOAvi/VgGfWdjLAZw==
X-Google-Smtp-Source: AGHT+IEjufRIjhWmlJKoN0rbl+lTaPFa6fQvlWeLn9wfErBSSg2fkq4XMzoP/XHT94xjChXMjOmIRyCkVv3rseZBIIM=
X-Received: by 2002:a17:90b:1810:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-2f13ac98c80mr11963669a91.15.1734116034076; Fri, 13 Dec 2024
 10:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20241213144919.110642-1-mike.leach@linaro.org>
 <20241213144919.110642-2-mike.leach@linaro.org> <0c13fbf6-3023-4f9e-9571-a9e8ca6e3402@arm.com>
In-Reply-To: <0c13fbf6-3023-4f9e-9571-a9e8ca6e3402@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 13 Dec 2024 18:53:42 +0000
Message-ID: <CAJ9a7VjC2AioY8S6qrgDkStn4pLnUm+2QUKTppYm1XXuOVRGbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] coresight: Update timeout functions to allow
 return of test register value
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_105932_702738_A00A1E4A 
X-CRM114-Status: GOOD (  33.55  )
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

Hi Suzuki,

On Fri, 13 Dec 2024 at 16:38, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Hi Mike
>
> On 13/12/2024 14:49, Mike Leach wrote:
> > Current coresight_timeout function spins on a bit on a test register,
> > till bit value achieved or timeout hit.
> >
> > Add another function to return the full value of the register being
> > tested.
> >
>
> The patch looks good to me. However, this change doesn't bring much
> value, other than avoiding a read at the caller side. I guess it is
> simpler to leave things as is and let the caller read the register value
> while logging rather than providing another variant.
>

The reason for returning the register value is that you get the exact
read value used at the time of the test - not potentially a different
value read later.


> I am inclined to keep the interface simpler.
>
>
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   drivers/hwtracing/coresight/coresight-core.c | 50 +++++++++++++++-----
> >   include/linux/coresight.h                    |  2 +
> >   2 files changed, 41 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index ea38ecf26fcb..feb1a1db355f 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -1017,32 +1017,37 @@ static void coresight_remove_conns(struct coresight_device *csdev)
> >   }
> >
> >   /**
> > - * coresight_timeout - loop until a bit has changed to a specific register
> > - *                   state.
> > + * coresight_timeout_retval - loop until a bit has changed to a specific register
> > + *                         state. Return final register value
> >    * @csa: coresight device access for the device
> >    * @offset: Offset of the register from the base of the device.
> >    * @position: the position of the bit of interest.
> >    * @value: the value the bit should have.
> > + * @rval:  the last read value of the register being tested.
> >    *
> >    * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
> >    * TIMEOUT_US has elapsed, which ever happens first.
> >    */
> > -int coresight_timeout(struct csdev_access *csa, u32 offset,
> > -                   int position, int value)
> > +int coresight_timeout_retval(struct csdev_access *csa, u32 offset,
> > +                          int position, int value, u32 *rval)
> >   {
> > -     int i;
> > -     u32 val;
> > +     int i, rc = -EAGAIN;
> > +     u32 val = 0;
> >
> >       for (i = TIMEOUT_US; i > 0; i--) {
> >               val = csdev_access_read32(csa, offset);
> >               /* waiting on the bit to go from 0 to 1 */
> >               if (value) {
> > -                     if (val & BIT(position))
> > -                             return 0;
> > +                     if (val & BIT(position)) {
> > +                             rc = 0;
> > +                             goto return_rval;
> > +                     }
> >               /* waiting on the bit to go from 1 to 0 */
> >               } else {
> > -                     if (!(val & BIT(position)))
> > -                             return 0;
> > +                     if (!(val & BIT(position))) {
> > +                             rc = 0;
> > +                             goto return_rval;
> > +                     }
> >               }
> >
> >               /*
> > @@ -1054,7 +1059,30 @@ int coresight_timeout(struct csdev_access *csa, u32 offset,
> >                       udelay(1);
> >       }
> >
> > -     return -EAGAIN;
> > +return_rval:
> > +     *rval = val;
>
> super minor nit: we could be flexible in accepting a "NULL" rval and
> thus keep the normal variants pass the NULL straight in. i.e,
>
>         if (rval)
>                 *rval = val;
>

Sure.

Mike
> > +
> > +     return rc;
> > +}
> > +EXPORT_SYMBOL_GPL(coresight_timeout_retval);
> > +
> > +/**
> > + * coresight_timeout - loop until a bit has changed to a specific register
> > + *                  state
> > + * @csa: coresight device access for the device
> > + * @offset: Offset of the register from the base of the device.
> > + * @position: the position of the bit of interest.
> > + * @value: the value the bit should have.
> > + *
> > + * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
> > + * TIMEOUT_US has elapsed, which ever happens first.
> > + */
> > +int coresight_timeout(struct csdev_access *csa, u32 offset,
> > +                   int position, int value)
> > +{
> > +     u32 rval = 0;
> > +
> > +     return coresight_timeout_retval(csa, offset, position, value, &rval);
>
>         return core_timeout_retval(csa, offset, position, value, NULL);
>
> Suzuki
>
> >   }
> >   EXPORT_SYMBOL_GPL(coresight_timeout);
> >
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index 055ce5cd5c44..29cb71e82b0b 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -639,6 +639,8 @@ extern int coresight_enable_sysfs(struct coresight_device *csdev);
> >   extern void coresight_disable_sysfs(struct coresight_device *csdev);
> >   extern int coresight_timeout(struct csdev_access *csa, u32 offset,
> >                            int position, int value);
> > +extern int coresight_timeout_retval(struct csdev_access *csa, u32 offset,
> > +                                 int position, int value, u32 *rval);
> >
> >   extern int coresight_claim_device(struct coresight_device *csdev);
> >   extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

