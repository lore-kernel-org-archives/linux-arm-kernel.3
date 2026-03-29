Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6D8F3D5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=; b=UmslQbYfaN8YrkaYJ8RVnzm0GU
	LAuHCcFlxRxIbIPvfSHXjD99L62XIDSmx51fGci+L/RX1hptN5Quy9WG5nHb6Ke0a99KGPNdU3ThM
	QInsnqsC1nhdegFpzdLEmxgsMd/t1h5+UnmnBucZoGznyqF3ZYf4Js1FLWLwBQBgBd8x48/pKEN3r
	yxZL7qT25An4H4AsZsbdc92FvhSPAWqSccnfir5Q8Zqg2jVj1vVP+bczawQXRk99DIf/RA+dMiTUQ
	k0QZG8XjnesBTOSB0CNoP32uFz3hVT/Je0vY+2tPk39J355E4S8nlqC6h6yAMDAZiHPizs1c49Nst
	atTuS7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kEM-00000009fof-2gZw;
	Sun, 29 Mar 2026 07:06:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kEJ-00000009fnp-2qbH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:06:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-66a5d76d9e2so5578772a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774767998; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNR3/y33vGUDTJzIPR4ouQ674zkvMfOUQNjxCSh4JbfdyN9DgJe8HbBqphSg8Fldfg
         SeEzXvWPlBaqqtk/k47hSgDW7eoB9yrX9UhPwgXnvvJezG9aFIws4fgybLcBffnr3ZMp
         LFON2fdbm28LJv/quucN1q8r/DOseX/8YbnCXd3EkjqVY7dvXU/mcLT0l1WDLOJ4KT+k
         CV6OLN7kcbM6C8bJz6LQZF57uzlH9wUG/E70Aui8NMCsATwdlxSaDLjh5FwTSHT4wktO
         yxNrC2b+oZFt+FX6nyXFCB6pim80R4WUJAaAIwdPUCaYLr5PEFX17IbWWhS/G+AskhHy
         95JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        fh=hDSc6F2eCk96Qew/fDLIVd/p4P7Hs/8BLU7XvSZilfk=;
        b=Q3FNsKzgfKYfkQpP1MPyB0V8eU7+TyZm6xo3G7AzhjBGzTg5V6ys2ytiLBNozZghHO
         Jlm8kiW9fAJfDTG0edIH25sxF8eGlsmN0zsSWD5qIbotnwXiVranD3uI9EXIy21vFHvF
         /nDN3AyqEmkke2nqBR1jeBxJVYzHST2wofr5sXjYgiarByvDoRWSr6g0a1cIsYj1EeuJ
         f7nSYib9jcRLnk21aDMzfYzmXyNxbdDGRragRn6x3eZnmeXssrYp8RqqRuD9yeRYGOwk
         Tig/jvuRwZcjvT+OWGsKgltdWwuOPCzCqFn64ti/HzRprjMibVFUot80yfPgv7GoK/UV
         TUqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774767998; x=1775372798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        b=CCnqnNH/MQI6K2JbAUi+5mGvC1s/whEiW7fT59kCZQNE//2lAs22cylQIr+o0N4VGM
         YyxHhurGyhsBtD1FGL6dDxbX/Vjj+sRvByyPBUHNcm/UihvubxUraTySybu/daDVHCEM
         0TlHScqrBf8GyD6SQdiJfkuIpb9nJh+5o1VE+wRDiuiVJf/UnnsRDHaPOzthZPke9vVu
         YRNlDfiPW2dnTatRlqVjyU9afMquCxMExiDv8ePS4danEuDjTOXTj1iTS1CWyo1sEbYs
         htGa4C3HQ+1OluOCqFkLIwjzLGpoZPMttXe4b/WilDbCDvMT90GJxyZzZTeS4JnY/1m9
         xu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774767998; x=1775372798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        b=J/2oWNYnii4Btd9rZ4EuNF1+XybJbso3JusMoUXH1Okc/vrbItpHjGmJgp1mugYJXr
         644W7eVGx++ROQqPXgEVX72zem7GrzTxr5xTAkLVMdlF4n8NW5SwzZzYP9N2G5k4SxDV
         arwoAJ2l1zLXmpC2H/WujUAYW3iqeS4Wqt01oxHVIPgREcd/S/zBoPdahugTmDQRFhr3
         G9XsoqZZicqbS8NqkjrnG/IlHAoKmc0NeTBo5qA/2Ac9HZsrQFAZvVPg4v3mpkbtMX9+
         QjtecXI17D6f1ctLgCbXnvyHO4cxXBOlAi0FwPdwyJ5dG9SoouzJK98zfXldGYPk6g7o
         h3DA==
X-Forwarded-Encrypted: i=1; AJvYcCUK5im5TcVDLPstLRskPytWnsDOgRZ4LDiJW7OEF11H40tIxRadakPQUZ0Te/m2F+IkWf/bT2CpfnVa9THExQ2G@lists.infradead.org
X-Gm-Message-State: AOJu0YyuPSKmeqEh62ro/Rz76MRwGntuWKoDkLmc2T0zYmHGyBhiv8Qx
	+SEI1zJbu6WqeO/P7aAY0ousukzOpeSsM4OqKxrN0nHY45D7Cxu+eYbu9cuJNvpNpJaAQPMg7LZ
	eHY8wGJvtXPxw1WN0Pe1avETXtxPVJyqkD/yGNTuwDA==
X-Gm-Gg: ATEYQzxzZFRlYApvox7kEJd6k2JJ5in2oNRBgfnaPc+RXvLodSPfUg+iexUuRiGv+Pi
	QkzE97BiCIKrol4MdNO+Y0asWuaKeBwjMy1p4B+yfzT8HMwlCJtlzI/e++WRSxJxNMwH1kwKuiP
	jFMu3pqF61T9NvZZt5uMZIpFPvvKIQJOibedaKPaldbyy7/ohj9qEPVNoebsoCcMmDSP8OG+wQO
	lBpyREgtPvTFFNozDsr5xBbVSClumtLXYJGdJ0/gwC8PIKSWbpm3Edy0lpOFVn2BkEmb9Jb6LAX
	6Z6XS02U
X-Received: by 2002:a17:907:1b17:b0:b93:9ac0:7913 with SMTP id
 a640c23a62f3a-b9b50569823mr591319666b.35.1774767997433; Sun, 29 Mar 2026
 00:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329062229.493430-2-sebasjosue84@gmail.com> <2026032936-deniable-visa-2459@gregkh>
In-Reply-To: <2026032936-deniable-visa-2459@gregkh>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Sun, 29 Mar 2026 01:06:24 -0600
X-Gm-Features: AQROBzAihjIwpcTjap3p5TjClCHzZ37PiL7DJ6OWobwHSfMj9QJhipEKcBxE3f0
Message-ID: <CAJD=UNcZXXV+iQrGCeUUBdq-NzKOy8ZTGT=72mgkCVEyCrkiHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array
 access in event_to_host_cb()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_000639_744113_E5AE187F 
X-CRM114-Status: GOOD (  29.60  )
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

Hi Greg,

> The kernel trusts the hardware the driver is bound to, so this
> shouldn't be happening ever, right?

You're right that the kernel generally trusts hardware it's bound to.
This is a defensive hardening patch - a malformed index from buggy
firmware would currently cause an uncontrolled OOB access, while with
the check we get a clean error return. Happy to reframe the commit
message as hardening rather than a security fix if you prefer.

> No cc: stable?

Will add Cc: stable@vger.kernel.org in v2.

> dev_err() is best, right?

Agreed, will switch to dev_err() in v2. I'll need to thread the
struct device through - will check how other functions in this
file handle it.

> And are you going to allow a malicious hardware device to spam
> the kernel log?  :)

Good point, will switch to dev_err_ratelimited() in v2.

I'll send a v2 addressing all of these. Thanks for the review.

Sebasti=C3=A1n


El dom, 29 mar 2026 a las 0:35, Greg Kroah-Hartman
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Sun, Mar 29, 2026 at 12:21:11AM -0600, Sebastian Josue Alba Vives wrot=
e:
> > From: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
> >
> > event_to_host_cb() uses msg->u.event_to_host.client_component as an
> > index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONE=
NTS
> > =3D 64) without any bounds validation. The client_component value comes
> > from the VideoCore GPU firmware via VCHIQ message passing.
> >
> > A malicious or buggy GPU firmware could send a crafted
> > MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >=3D 64 (or
> > negative), causing an out-of-bounds array access in kernel memory. This
> > results in reading/dereferencing a bogus vchiq_mmal_component structure
> > from memory beyond the array, which can lead to kernel crashes or
> > potentially arbitrary kernel memory access.
>
> The kernel trusts the hardware the driver is bound to, so this shouldn't
> be happening ever, right?
>
> >
> > Add a bounds check on comp_idx before using it as an array index.
> > Move the component pointer assignment after the validation.
> >
> > Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from cam=
era")
> > Signed-off-by: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
>
> No cc: stable?
>
> > ---
> >  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/dr=
ivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > index d36ad71cc..4772126d7 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > @@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_in=
stance *instance,
> >                            struct mmal_msg *msg, u32 msg_len)
> >  {
> >       int comp_idx =3D msg->u.event_to_host.client_component;
> > -     struct vchiq_mmal_component *component =3D
> > -                                     &instance->component[comp_idx];
> > +     struct vchiq_mmal_component *component;
> >       struct vchiq_mmal_port *port =3D NULL;
> >       struct mmal_msg_context *msg_context;
> >       u32 port_num =3D msg->u.event_to_host.port_num;
> >
> > +     if (comp_idx < 0 || comp_idx >=3D VCHIQ_MMAL_MAX_COMPONENTS) {
> > +             pr_err("%s: component index %d out of range\n",
> > +                    __func__, comp_idx);
>
> dev_err() is best, right?
>
> And are you going to allow a malicious hardware device to spam the
> kernel log?  :)
>
> thanks,
>
> greg k-h



--=20
Sebasti=C3=A1n Alba

