Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CD9F3D5FF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=; b=dhB2m/hAiu3gXiBB77M8ouFzrf
	I7gwi7r0ceJwOiazFW6n+i+4RtrLcUhYAd5l3R+vLKWZRAJTpoH6s7MirAXD5h3Q2+prnwPyPzgtq
	063R1h7/WCWsb1zK+ahKMq5m5PNacKl1J7jVnIeDf2JIRoOqa+jICnwCHNf9dNYnvKhsSsCIgdrdW
	WaX3b7G1bQQ9QV8inANYT+PAL0DRMgJLnx07wsho3aAGkn5h7jtm8WC4pT0nJ7p+rS8S69aCwdTu8
	AvOoJrY429ZYflUjheDB79ckUpnDDi4OZosUGhXcJ+LvvKTyllKXVL6XomnJesOmuOsIzrwX5OVgM
	O2EBB1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pMP-00000009v0g-3DDa;
	Sun, 29 Mar 2026 12:35:21 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pMN-00000009uzI-0h4P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 12:35:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-66a851e62c6so3735675a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 05:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774787717; cv=none;
        d=google.com; s=arc-20240605;
        b=S9BoZCyPTllGbZbyDlaAds7rIGKLllnlyW82hIk6xZm3iz/RubMe7pxTamAo9QhIYf
         KnRmLybapcZxcmT4Vg9HcyeuCtXsqBcGxw9y3RBoFpo5m9A0SrmEfJwblyRxExhDz+Of
         XS6hrD3F8iFm8SVUMC+ihwWY93Gs79R4hXAJCbNcjQwfzsG23mg75VaqIjQ3m1GNk9Y/
         7P4IDzG3Av+KwLcu0Z6HOvZmM65AAkIDB5bAg3GiJUaQllWdrUmBAd2Ttk9g3VDDXxwF
         P5+c9XR/+K+uIMjTdXBVK2PIRlezSmmnYzAvaEZWxFj8/AEVCRFDw63iJwWcBvIcnoQ1
         Q/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=;
        fh=3AQiOC9kiZOION5xtGbpD0MLnrMu5wSMZicyPd8DzBs=;
        b=SKj7MYlvgp2+Iq+InsN7vFgN7qFK1bF/Jf0CznAGsvX6U/Tr+YP6S6heC3BI0xWjFV
         oDRmWYiJokTAUhofLhPHgU7pYugxyn+0gQhgtdstjGW4Lic0wr1u4FRQCCYcDkKs4kqZ
         eqJVNDdaFIlWajVpr8qqXxHJkXxgV2QH6R2R+lLiZ0vSBv731fWxQEDvYUm04KB1P2To
         jtvfvIFECajUNB8/+rQ7VyqtpHk0yoY2Dn0FCgzYjDKeUeK+92e0o0Z30QmbhgPCJ+0c
         ylhfxXUtIa/0utsxbqNlTmboZsTbOHwnEAQECCVlS/nUtknHMe91+jXsbrWhJR/RUmAW
         1GnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787717; x=1775392517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=;
        b=grJ4tC4aSbYnmoS/N/N3VBMeGnm5c+dZjyTDs4vxeykkdRmURVA6MCSGop48LyhSc/
         4W5Tkag9RTOj6FvW0XZRuzpDAU1Wy437HF6Brr8V75cPeXvIcMVhLya07EgNHFUmQdGZ
         BPR/vW7T+upq1fjmnMEaCuS4CEJejWyi8Pt31LmpV9wzhgOUFHLfAKjnbFa1yjskcEfq
         WsepaVqGT89bgv3OvdeQm2ufm+nKSO5LYu+8pKGC1DYP15zPu5476qBLnYKSpN13UkR5
         OL4A34paBpPqGRyWPt9Ipkc44K4VHiUDXD+hcxvEiINuzEkzCfN5OABc8ZPKFi0W0Vjt
         zDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787717; x=1775392517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=;
        b=Rao9BIMNYzizbqXTO8N5UkTdD7gQsfu8KlEgC2Y5P94wgFSjdpWmHGiKN5rBiZUuYv
         gwzoogcvw3ybBRZCd1o4OhYL9PWOPRUTMxFEQe2OACQRFl7/qS+qMuuypksa+mKFWtHE
         ZECHj8ZR41bjhxcQ1ulzM4/DJgCEq6XvQ/wAvdD7EBQM2aihYndpX8fJRX/M+AK2VOpJ
         fB20ewf/Mkbr3YR1GuAn8dJu2GFuuAdUVhhHGogdCrOncwWII+atPLkdtjnN4lu5rswt
         f7ExL8MGiSWQNgoLKB5DkqD3oEpFhwqjntEYAJW6WpLRucBwc7CSrLc2yU0/PoPR/G/v
         SCCA==
X-Forwarded-Encrypted: i=1; AJvYcCVV4wgpb7J8OGzgEskV7Ll4WXHdm90E9V0o+dRPphtSVSSFVjg/QvZxaEX1kTHbD9mcrZ7nsbfmZYlcNdS8XA3u@lists.infradead.org
X-Gm-Message-State: AOJu0YyU6KWR5y96Vmq09j8xySkndmXmZHe6E7B9YrlEK7oQ8BihS3Fm
	aN8zrsUcIRJBJ5AF0cjF8UxTEi+oJgs/FukeHXmmMdh+KqpR+DsuPs7JTtU4plqNAYSZXL6H/aH
	ZwflFjjv61xTcC5VjpKKxrBw/wFU47fs=
X-Gm-Gg: ATEYQzzPpIiOwTEGJhL98zDz2aUy41rDKT5rhBdH1bz/5ojhTSIHoq+r5P5W+7O4H1R
	0XTg/KzgHAuVvWcecPh0qyDG3zPkl3lO+QTT4J01g1GfFwwpeeKEzd+7T265rpFUprBet58HOjK
	1CsnEmpWyVMSbGaVNPm+7ykLTS9FLegTEIuL8dpdCc4HZ9tKSwGCh0dd3x2i1s0G3xgSUqvLVrB
	0n7248aXtBP7vQ7rstEFQF/7ZMrCgZu/aXEJCOBbJRJ7cdtCEscEO/U9JxPEoA4TjpQ2V1I0olC
	q3ki5gDM
X-Received: by 2002:a05:6402:5386:b0:66a:27ae:114f with SMTP id
 4fb4d7f45d1cf-66b28266438mr4329883a12.6.1774787716954; Sun, 29 Mar 2026
 05:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com> <2026032956-railroad-renewable-3328@gregkh>
 <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com> <CAMEGJJ0zgab3WN=rb2o+UgEq_coX5LnkyPj3UNrBSMQbTGU7Zw@mail.gmail.com>
In-Reply-To: <CAMEGJJ0zgab3WN=rb2o+UgEq_coX5LnkyPj3UNrBSMQbTGU7Zw@mail.gmail.com>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Sun, 29 Mar 2026 06:35:04 -0600
X-Gm-Features: AQROBzAKKVwQdtdUih-AH2iidcNJRTvmk1rpyf99lT2fFxFMoEb2HB3wguQOMzU
Message-ID: <CAJD=UNdoyWg62YwA+m3Ku2OVQ9JMLdVbiBuJ5vu7-ahQ-0+DkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
To: Phil Elwell <phil@raspberrypi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_053519_231863_A80E67C5 
X-CRM114-Status: GOOD (  26.26  )
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

Hi Phil,

Thanks for the pointer. I've opened PR #7294 against rpi-6.6.y:
https://github.com/raspberrypi/linux/pull/7294

Sebasti=C3=A1n

El dom, 29 mar 2026 a las 2:51, Phil Elwell (<phil@raspberrypi.com>) escrib=
i=C3=B3:
>
>
>
> On Sun, 29 Mar 2026, 08:05 Sebasti=C3=A1n Alba, <sebasjosue84@gmail.com> =
wrote:
>>
>> Hi Greg, Thanks for the quick review.
>>
>> Regarding kmalloc_array(): the patch does replace kmalloc() with
>> kmalloc_array() - perhaps the question is about the remaining
>> ioparam.op_count * sizeof(*block) in the copy_from_user() call below?
>> That multiplication is now safe because kmalloc_array() already
>> verified that op_count * sizeof(*block) does not overflow(if it did,
>> kmalloc_array would have returned NULL and we'd have exited). Happy to
>> add a comment clarifying this if you prefer.
>>
>> Regarding the Fixes tag: the commit dfdc7a773374 is from the
>> raspberrypi/linux tree (branch rpi-6.6.y). This driver (vc-sm-cma)
>> appears to only exist in the Raspberry Pi kernel fork and has not been
>> merged into mainline staging.
>>
>> I apologize for sending this to the wrong tree. Should these patches
>> go directly to the Raspberry Pi kernel maintainers
>> (kernel-list@raspberrypi.com) instead?
>
>
> Open a Pull Request at our Linux repo:
>
> https://github com/raspberrypi/linux/
>
> Phil
>
>> El dom, 29 mar 2026 a las 0:33, Greg Kroah-Hartman
>> (<gregkh@linuxfoundation.org>) escribi=C3=B3:
>> >
>> > On Sun, Mar 29, 2026 at 12:18:45AM -0600, Sebastian Josue Alba Vives w=
rote:
>> > > From: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
>> > >
>> > > vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' =
to
>> > > compute the allocation size passed to kmalloc(). Since ioparam.op_co=
unt
>> > > is a __u32 supplied directly by userspace via ioctl, an attacker can
>> > > choose a value that causes the multiplication to overflow on 32-bit
>> > > platforms, resulting in a small allocation followed by a large
>> > > copy_from_user() and out-of-bounds heap reads in the subsequent loop=
.
>> > >
>> > > Replace kmalloc() with kmalloc_array(), which returns NULL on overfl=
ow.
>> > > Also add an early return for op_count =3D=3D 0 to avoid a zero-size
>> > > allocation, and return -ENOMEM (not -EFAULT) on allocation failure t=
o
>> > > correctly indicate out of memory.
>> >
>> > Why not use kmalloc_array() instead?
>> >
>> > >
>> > > The /dev/vc-sm-cma device is world-accessible (mode 0666), so this i=
s
>> > > reachable by any unprivileged local user.
>> > >
>> > > Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driv=
er")
>> >
>> > I do not see that git id anywhere, what tree is it in?
>> >
>> > thanks,
>> >
>> > greg k-h
>>
>>
>>
>> --
>> Sebasti=C3=A1n Alba



--=20
Sebasti=C3=A1n Alba

