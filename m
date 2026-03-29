Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E221F3D5F3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=; b=J1bqfQ6VPv1HyJvXCP5dYVuAKS
	TyMYUjb5GrE0Xo6DRErXzPuAC5jE0/se/Nr7XmaWjxCyTlm/s2ziJ2FsPNNplEHjQJ/6YDetUe5uA
	lgFvxCVEg0FCUVjYmhPxwSL535lnNXXEdpRIgHLIDSHqRwnPuOIXaUDkB9iuvArjiPs86NW5ebkhR
	k2cID9FTmF6BonGe26w1/41ouiCDGurYBAz1oSluTTb+0Ugq46D0lQpsbOTNhtfomhUqyHB9G+dRp
	1zxfTxqbkJbhXaxEW2bj5bVprXFx8ddgzy+ufkK9B9TVYSjuWP4SG89ceHFF9DopIYLYualjTuE1m
	a199vLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kCt-00000009fet-4BDL;
	Sun, 29 Mar 2026 07:05:11 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kCq-00000009fdt-2eqg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:05:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-66b3d06e2bbso3870483a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774767907; cv=none;
        d=google.com; s=arc-20240605;
        b=FNKLXQ6P6FF/IwUx12qrYN7s6RINxIlwBSOoFQiafkOBIaT1tKnYfYAu/tO79WSi7a
         KdJkrSXiQwK7eMkO6hb2QU6kW6nVWsHKRAXd4IvGJzecz7wRi2Y6FU9IlcYrSseUhFsy
         AZvnkA0SLPQLtg8gnWizsDA9f1seF+BBUKosCzvdBUQyIJua8dEPJ5qWei7+Es4QopVQ
         m10NuEiOZRVgBzbXQ0lIIdwDR1A+dMwFum4+rG5EjRX8TVACmeArfh1AELPiD255Q/w1
         L2LtTfCkrEAW6QZ5Y9eToAtCRu0ZtK0/523b3MgJLNUVv7T6zES7DtMC6HWyFTEUibI2
         5zyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=;
        fh=/IsWmNSArp5tCMVFaphrFNScOR4FE/w7PTr6XYgUGJM=;
        b=NeJwW2XG0QbZBGpG0EYdWPHHpAnBwD4zp8fYrqcxBnC+48aHkF53CdLUP+j05zJZp2
         z2WJGmk4j18Ml+pI2wiD9L42uBTil9BQAe1ezHdSF7PmFgyysNzQxQGiP6G3P+fdhHE+
         zT4XlOPxFI40CZSjzVfv8jQGgwUtxEL41sF6XwhMdFj8Av5BrtTBWWWi9Wa7aOclTc4/
         QjshY1fjwqcTtZG1zYs0p3PF4VqvutVSkdv/7Jgr7dOL3T3Z/m9iZ+BxR8EN6e/KZRKW
         o5rqtYDRQC7UzNgxz5sNWjn13oS5kiU9RD8IbTuxqzZm9C9nKWQ7GNHqdXUaB8Fsvc8A
         Ufog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774767907; x=1775372707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=;
        b=Z081ZC1VmXQf0bANHACi0k2kT8MISC1aW+y4+zUo5ySrwOxgqPW05D2ges6PHHN4Zg
         Vjz1hCpg0wb3cO80s9WaBl4SyjPAXxrtigY248ri4dukXf8uoE7AGQvY19jtogOvORqX
         bBcujde1xeYc+uiKaCO7LQPa9eF7bhJgajAfy6j0KncphfiRNyZTSumRduInA0wZbaK6
         dJri+jovy1qTFdpJ6wH10BAbcdPn6RUjTqC78RbrBg7pQ5pjEd3I9t3Ug6WnLQpUCGhW
         DxB6Vl3/aZMMFxk3BGi5Cy6h588W/lRO0mhqVTt7tfniRHlM5ca4qwBbC6ejJeMWTgUF
         d9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774767907; x=1775372707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=;
        b=g6Y8boMSczm+PV56MTxiW2zPtxKhP0g74qbLSrlr6KmJibm6Yk8i3WbsqV3kHBC4iB
         J1I/rPIICTX7NkKdjfS0k/ZIm39LIgt5SSvHzdpp2wRKhQnSizyM27+lWLrMmvGJ5Xix
         8oUZOK7IqTSTsrJuVz7qCp9Aul//RFK3xtVpcup1UyQxX4UnhOlVrVlqryv9MfLM9rQI
         3uXz2U08VPAsx65zneUyt95iD4NNyChtWYLjR2YoP1QdPn5r7+VrICxADGwhR1dnXtu9
         gE9fJHJIIAbGZ13Xs7XB+oO/cCxTJuUeUw6Vl0TdkDKjvZJIzhPskmt1bxPUWExa3UdP
         hUUw==
X-Forwarded-Encrypted: i=1; AJvYcCXAs7T5EsuTkjvkNRF853fhquVyRHQKba6UsJY1vCjBxYpTa+d70qVczyVplorfxRiasur0usaJlbEM6lcueE/A@lists.infradead.org
X-Gm-Message-State: AOJu0YyQucTXteUOBWgva3pA8RlsadTVQQXDIGAUzrpQIAOcSyl/43PI
	pLj+YKmvGEq9PrXeJ/YwAyx+o5OLO09h6X0DIaSbp+jqjN1Bnpzc5tZT3p8s2KBsBdc/T5VriaK
	nhLf/P7zt/skSKTtcfv3spAgjFybLVkU=
X-Gm-Gg: ATEYQzxBAJQcfZSwE22oTbpjv8x7hUw6zNrfbTWd/APEUVGcq1TMUx5RG9kCLMobc38
	SC/We3wu/WaeUJaDg77B6/Ye/Po8P6xKrN0+SWWUPkb6YHUYuzg98Qxyv42ou+2QT32ZOeAzQ+X
	2myLtSFCJ4RZsT0hgNb3FhL9Glk2jxRr7wMQxbKxmLdOstl9aO2ws3W1v7JKwWTpyY2eT6bMkaI
	8XxvLbIfAGZaBmEF19sYQPHSSRYbhJFp8rmXTvqr18kKeWOoqFdzYWin07zyZ2mgD33mlh7Erq2
	JJ66NKB/
X-Received: by 2002:a05:6402:a0cb:b0:66a:819b:e8dc with SMTP id
 4fb4d7f45d1cf-66b28465b36mr3746313a12.3.1774767906504; Sun, 29 Mar 2026
 00:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com> <2026032956-railroad-renewable-3328@gregkh>
In-Reply-To: <2026032956-railroad-renewable-3328@gregkh>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Sun, 29 Mar 2026 01:04:54 -0600
X-Gm-Features: AQROBzDDMTtjJGX-Ei2KRlMZgardjumAcGM8vxjU_47sejUGt_kSXM7RX7DEcp4
Message-ID: <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_000508_680186_DD5D4C26 
X-CRM114-Status: GOOD (  24.38  )
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

Hi Greg, Thanks for the quick review.

Regarding kmalloc_array(): the patch does replace kmalloc() with
kmalloc_array() - perhaps the question is about the remaining
ioparam.op_count * sizeof(*block) in the copy_from_user() call below?
That multiplication is now safe because kmalloc_array() already
verified that op_count * sizeof(*block) does not overflow(if it did,
kmalloc_array would have returned NULL and we'd have exited). Happy to
add a comment clarifying this if you prefer.

Regarding the Fixes tag: the commit dfdc7a773374 is from the
raspberrypi/linux tree (branch rpi-6.6.y). This driver (vc-sm-cma)
appears to only exist in the Raspberry Pi kernel fork and has not been
merged into mainline staging.

I apologize for sending this to the wrong tree. Should these patches
go directly to the Raspberry Pi kernel maintainers
(kernel-list@raspberrypi.com) instead?


El dom, 29 mar 2026 a las 0:33, Greg Kroah-Hartman
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Sun, Mar 29, 2026 at 12:18:45AM -0600, Sebastian Josue Alba Vives wrot=
e:
> > From: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
> >
> > vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' to
> > compute the allocation size passed to kmalloc(). Since ioparam.op_count
> > is a __u32 supplied directly by userspace via ioctl, an attacker can
> > choose a value that causes the multiplication to overflow on 32-bit
> > platforms, resulting in a small allocation followed by a large
> > copy_from_user() and out-of-bounds heap reads in the subsequent loop.
> >
> > Replace kmalloc() with kmalloc_array(), which returns NULL on overflow.
> > Also add an early return for op_count =3D=3D 0 to avoid a zero-size
> > allocation, and return -ENOMEM (not -EFAULT) on allocation failure to
> > correctly indicate out of memory.
>
> Why not use kmalloc_array() instead?
>
> >
> > The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
> > reachable by any unprivileged local user.
> >
> > Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver"=
)
>
> I do not see that git id anywhere, what tree is it in?
>
> thanks,
>
> greg k-h



--=20
Sebasti=C3=A1n Alba

