Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04A5D116E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 01:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fIuq3Wp4BeebjpNpG0wUv9Qzy/8IqNgZEzWKyUeiT4=; b=r+oOpBubeRPyovPx5Ord9mEBEH
	qazTT2dHCLSXKKfS34H1p3pQdTwItsdfhBODFqdrK4j7/g9hSarWgwvCnjNgz1/8kOz+fiSrmGBDh
	U7+Zq6C8lAIQ0EQ6cITYocfpSCpkPUNJ4kBBS+6R2YARk79tHLAIW8CRiKlHhAIzKeMuxCfiPn9IM
	qSl5ZBq4IPjyE58+S/1tHnTwQze42shLuNFh81u7EzeluHF+1jSa8/STH9SC3dtu3eR71Xj4pmsRa
	CycpGX9kApaBmaTCxceKkby73yqOfrhLGnQFju/M5dTeclPOKi3JO6kNwmn7P6gLb8sS+D8ebnzpY
	MCYIbfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQWM-0000000FpYT-1iXD;
	Thu, 27 Nov 2025 01:10:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQWL-0000000FpYA-1cJS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Nov 2025 01:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+fIuq3Wp4BeebjpNpG0wUv9Qzy/8IqNgZEzWKyUeiT4=; b=HSChXyeEfeMPjlC8tX2QL25tqe
	MGTjYjtZw5yAQb6UtZxbETBitN96W/0HuNH7RGC+kbCv3Kjo5um/hskMUQVIQVKHA8KaPGF/F3yqR
	/a3jUC2PvSs9yzKftisNLHYvBkhzEFnlGRLzKBY5Qe0v5wDCYmXoon6jDTFr5CBf1ywEM2OzmRkMw
	sqySTv6y9hW6cxBadyI0Rj++n5wv6HyQqp0tjJDynOIDmQPFG7DpW2EwHrOD4048UWSDXutA7F1NO
	D4i2qiNCO99238024i8XUss1s6hBTQtDY5rH/T4/EYiXF7zBH3FT+Z1UABK3y7LzwK/FCtI8Lvb83
	j7puWpaw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPe1-00000009B2D-1NJc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 00:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764205750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fIuq3Wp4BeebjpNpG0wUv9Qzy/8IqNgZEzWKyUeiT4=;
	b=DyoDdnzW96YubCc78Yve1dXFf9jaHix1qvgwrtzmWYhoklg5J0Uj00n44RFDxpO1GDJ7do
	kXJC48q/9HknFeUs/vBSrizdfphUrh41xWg8Vg0eXrLhbkwXb3DxzWj5SASs1T2sFp1yXT
	tlt0D0l4cEIazyim6vNPQ+xN6KRpj1U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764205758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fIuq3Wp4BeebjpNpG0wUv9Qzy/8IqNgZEzWKyUeiT4=;
	b=Go3PfORlKiOon5n8TQ0mxu6wrRZldXFiipZCEmFwPJ6K+o3KWWTORm9Rhe6hvgDcxvRT9H
	E9ldoBG6uuo00KyWYi6F2fZ95qGSQMkFtYYwJTKZRrAQ7HqQCauZHxAsSac9d93WNYvCrz
	fMncO+FfCEqbpF0zXrOmjLpuDBVrbAM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-ffY1Bl8GNI216XkKTJYMeA-1; Wed, 26 Nov 2025 20:09:08 -0500
X-MC-Unique: ffY1Bl8GNI216XkKTJYMeA-1
X-Mimecast-MFC-AGG-ID: ffY1Bl8GNI216XkKTJYMeA_1764205747
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956f09f382so1917305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764205747; x=1764810547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+fIuq3Wp4BeebjpNpG0wUv9Qzy/8IqNgZEzWKyUeiT4=;
        b=MLW+/aAvTMh320STNx+POGeddYNDkWWw1VA126elydABV3xL0/xKW8sQOGuIm7gOkq
         wH3vliQPpDxzA1HUwUd4/EKCPPqHOv0oj9ItnTz3mG6nobfAV9dVa1Ps/uCDkveJOu3+
         fAlbI9McJmghJq+3Wu0JoDlpzXVHobzpn0IwOJrvZOpeBsgeqwcNhxrEvS33g98JNolG
         GCpHHG4y1TEFL0eXzYR+MlnfJ0rEcVbq3f7cDwzrhhDuP6Q7jH7QKxhqMNf0uIdYc2YT
         zHd4ufSW1302++Gy1TbhPBYAz2htQgokZL5B7uT/6CVXfTkXmOuBHTKUlWL4L5C1hnh4
         vP8w==
X-Forwarded-Encrypted: i=1; AJvYcCVmUhvYfd9g8xDcJBiJCEUgLHh/LDP1IZBVM/4FXrspqsEhmIqtD6ns6lTewwU5hvfBh0zLmnC0Z0LB5JtIDAsD@lists.infradead.org
X-Gm-Message-State: AOJu0YygHM4XcshwNmUBQU3Jox/vvEk8vdnGiarAkrYTPES6lQ0/eptK
	mu5kvqFF58JklPc+kXAajb5q8XLPt84POhVsv6r4ZXvKuDeIXm5FibnOoUZBzOWJg4GMTkI8zvA
	LxpcQ2ZEkOt1FG0vKWdpXwKka77ArFpTbVDqxg01dMuJaErx31I9Tve5IVx4SE/QVBB+A8qgiU9
	8Dz4EjEKP1EalToA1BGa/RWFS1lscZ8OUssQUuqZO8LdZ/R007Dzg=
X-Gm-Gg: ASbGnctf91OFImPCRPMFhA8bKtOXJn6IIRVNpdqFQA1bGmuejoDW7jUQ3vEg4fpSrtH
	WHDlggf/yUZHUfBnG9GFagyRYtJqWviYFJhBdxJ1LcJT5auCpP/6LuottxkQJN4sfvKq4GorbvC
	1hz9YNp7dPA+YltKUvLa4VQNRqQWis7nBeIxXAr4J7D1PXRIa/01o+fWPe1fyzpdUF
X-Received: by 2002:a17:902:dacb:b0:269:b2e5:900d with SMTP id d9443c01a7336-29b6beebec7mr257542015ad.5.1764205747432;
        Wed, 26 Nov 2025 17:09:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPDNamYNduzNpXyT/xW1ZQEyOB0Lis20nwGLU/hQvR/oP+MQrKzzm7g4m+9/51XsOAa525fC5RiOVpei7R5uk=
X-Received: by 2002:a17:902:dacb:b0:269:b2e5:900d with SMTP id
 d9443c01a7336-29b6beebec7mr257541495ad.5.1764205746933; Wed, 26 Nov 2025
 17:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20251113005529.2494066-1-jon@nutanix.com> <CACGkMEtQZ3M-sERT2P8WV=82BuXCbBHeJX+zgxx+9X7OUTqi4g@mail.gmail.com>
 <E1226897-C6D1-439C-AB3B-012F8C4A72DF@nutanix.com> <CACGkMEuPK4=Tf3x-k0ZHY1rqL=2rg60-qdON8UJmQZTqpUryTQ@mail.gmail.com>
 <A0AFD371-1FA3-48F7-A259-6503A6F052E5@nutanix.com> <CACGkMEvD16y2rt+cXupZ-aEcPZ=nvU7+xYSYBkUj7tH=ER3f-A@mail.gmail.com>
 <121ABD73-9400-4657-997C-6AEA578864C5@nutanix.com> <CACGkMEtk7veKToaJO9rwo7UeJkN+reaoG9_XcPG-dKAho1dV+A@mail.gmail.com>
 <61102cff-bb35-4fe4-af61-9fc31e3c65e0@app.fastmail.com> <02B0FDF1-41D4-4A7D-A57E-089D2B69CEF2@nutanix.com>
In-Reply-To: <02B0FDF1-41D4-4A7D-A57E-089D2B69CEF2@nutanix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 27 Nov 2025 09:08:55 +0800
X-Gm-Features: AWmQ_bnsXM38rarXUDstecHvEAw99LfY0bJMCpF_57ywtegttUxJS9KRjDg4vNQ
Message-ID: <CACGkMEshKS84YBuqyEzYuuWJqUwGML4N+5Ev6owbiPHvogO=3Q@mail.gmail.com>
Subject: Re: [PATCH net-next] vhost: use "checked" versions of get_user() and put_user()
To: Jon Kohler <jon@nutanix.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, Netdev <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Drew Fustini <fustini@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uJ8MHgnxu_aAtyrlWpScRZdm71G65ONZ237reCbm0-8_1764205747
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_001359_495145_15F46612 
X-CRM114-Status: GOOD (  34.37  )
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

On Thu, Nov 27, 2025 at 3:48=E2=80=AFAM Jon Kohler <jon@nutanix.com> wrote:
>
>
>
> > On Nov 26, 2025, at 5:25=E2=80=AFAM, Arnd Bergmann <arnd@arndb.de> wrot=
e:
> >
> > On Wed, Nov 26, 2025, at 07:04, Jason Wang wrote:
> >> On Wed, Nov 26, 2025 at 3:45=E2=80=AFAM Jon Kohler <jon@nutanix.com> w=
rote:
> >>>> On Nov 19, 2025, at 8:57=E2=80=AFPM, Jason Wang <jasowang@redhat.com=
> wrote:
> >>>> On Tue, Nov 18, 2025 at 1:35=E2=80=AFAM Jon Kohler <jon@nutanix.com>=
 wrote:
> >>> Same deal goes for __put_user() vs put_user by way of commit
> >>> e3aa6243434f ("ARM: 8795/1: spectre-v1.1: use put_user() for __put_us=
er()=E2=80=9D)
> >>>
> >>> Looking at arch/arm/mm/Kconfig, there are a variety of scenarios
> >>> where CONFIG_CPU_SPECTRE will be enabled automagically. Looking at
> >>> commit 252309adc81f ("ARM: Make CONFIG_CPU_V7 valid for 32bit ARMv8 i=
mplementations")
> >>> it says that "ARMv8 is a superset of ARMv7", so I=E2=80=99d guess tha=
t just
> >>> about everything ARM would include this by default?
> >
> > I think the more relevant commit is for 64-bit Arm here, but this does
> > the same thing, see 84624087dd7e ("arm64: uaccess: Don't bother
> > eliding access_ok checks in __{get, put}_user").
>
> Ah! Right, this is definitely the important bit, as it makes it
> crystal clear that these are exactly the same thing. The current
> code is:
> #define get_user        __get_user
> #define put_user        __put_user
>
> So, this patch changing from __* to regular versions is a no-op
> on arm side of the house, yea?
>
> > I would think that if we change the __get_user() to get_user()
> > in this driver, the same should be done for the
> > __copy_{from,to}_user(), which similarly skips the access_ok()
> > check but not the PAN/SMAP handling.
>
> Perhaps, thats a good call out. I=E2=80=99d file that under one battle
> at a time. Let=E2=80=99s get get/put user dusted first, then go down
> that road?
>
> > In general, the access_ok()/__get_user()/__copy_from_user()
> > pattern isn't really helpful any more, as Linus already
> > explained. I can't tell from the vhost driver code whether
> > we can just drop the access_ok() here and use the plain
> > get_user()/copy_from_user(), or if it makes sense to move
> > to the newer user_access_begin()/unsafe_get_user()/
> > unsafe_copy_from_user()/user_access_end() and try optimize
> > out a few PAN/SMAP flips in the process.

Right, according to my testing in the past, PAN/SMAP is a killer for
small packet performance (PPS).

>
> In general, I think there are a few spots where we might be
> able to optimize (vhost_get_vq_desc perhaps?) as that gets
> called quite a bit and IIRC there are at least two flips
> in there that perhaps we could elide to one? An investigation
> for another day I think.

Did you mean trying to read descriptors in a batch, that would be
better and with IN_ORDER it would be even faster as a single (at most
two) copy_from_user() might work (without the need to use
user_access_begin()/user_access_end().

>
> Anyhow, with this info - Jason - is there anything else you
> can think of that we want to double click on?

Nope.

Thanks

>
> Jon


