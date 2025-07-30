Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9473C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXJ73jdHr5s/O4AsJ9vHXZKR5cKPhac21dmjQ/GtsgM=; b=RM6nOXbHVZJ9G93SI8G6XB+w8P
	8ILYLS0LbSHBGP2t2UX13M54tYMzqWE8rKSxuKzRwJoCs/Cf6GHPLL54jyswRJFGHRbGS//YidaI2
	T86w89WnPb1qcJlmm0ug8gK7jEd3Rod9XRI3ePQGbrWIKd5rXMhvEELh0DLbhsrz5x7azhf4aDklJ
	J4ZuWUXGknUqU+iT9owB+KEKW1M+iZvqXTykWofnbhv0eBOADmnD9YvfJ0tMecva90NMz37StCGVv
	zxU6KOa9WwVKYMX0MsZFbgZmQGePVEKAfSaCvQ07VbLtcNm4iq7eL9syfiNfKf4i8XK8Q+A+hSBKG
	A/c+W6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh81l-00000001lWx-3D9v;
	Wed, 30 Jul 2025 14:43:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7vz-00000001l0K-2SpV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:37:36 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-33229f67729so7533811fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753886253; x=1754491053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXJ73jdHr5s/O4AsJ9vHXZKR5cKPhac21dmjQ/GtsgM=;
        b=2+mwZz5jRGMPft5osENeBhyCIWdJgw8o+jJfY9pzIgz1pX4LHhAMwiTMsszk70k6lW
         XGSyqOZocvNtDhF8GsGy3JqI/JTQJQPuqhUAGyNGlzUmuGrf/MMy+UAP87mSlrvjkO9a
         8Ibo4hYOBp64L+ekzzKJ8ZREkUkiEo3dTVRqJG8KxdxOTv6vEnskYoGwQdOg8fmw35Xs
         B7YDfJJgkd6P+jIFgBhur/qA6lzWw4ixgIa0xUyNNTmqZ1VnGIl+TTVNGubg2euIoPMA
         TG7gnScq3fecfVCPOX1x5QjUaSuN2s62F9QKzJ75A/boopJD3TlEK7U3yrxOzSfNvFeV
         A3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886253; x=1754491053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXJ73jdHr5s/O4AsJ9vHXZKR5cKPhac21dmjQ/GtsgM=;
        b=ZVRgv5ciXD+3DJjh+Uo81+HQC8mjJlQFyp5t5cufvUZyoiMLVgCiTSlUOjyA9tr/aE
         +t/5Y7bP10oAbKsFrOy6htVBMydrFBjGrwfvh15TjwFr8eRlJmE3GH+QFd6tw7UYx/Cd
         xQeE9OhoUtk42eZKYmC1Lk/DtR9sPZmUIYUNB7ahVfnXCuUfLwukjrI5XWLQnnzhbgkb
         GcSc7Gdd3+DNuOuyb2Y6mkPWhNfg4TpJPUPq9SGoX2O86T31Cqh9xAVsKUKvpGN2MomH
         OBCU7gdMjUfbh8XW7X7hgyM5aYh9S7tD8bpjw9Gl2umnCArRcDOidp6fK0rTwcUiXjKJ
         /iww==
X-Forwarded-Encrypted: i=1; AJvYcCVVgvODMGmBBUoE9UpZRnMmmrMSIVUmQQyO5g2bV0PPLtqLuE/2W+v0QZZLPmkNz/ckKQQQihWi9uUEemdlByi8@lists.infradead.org
X-Gm-Message-State: AOJu0YxI27k+H/kDINWeuHdhiVuW905XFsvh6meAmRshjhu/jKFs0DXL
	fUkuaYJGO2EcOEJCSNws8Jm82wOBiGQMNDwjOMxDVmhVW+ELAO82nVkZJoJZzUoQIN/xm9Kj8Tq
	UA/C9tsYILdhzbz9RCaduJcl9cMuoJlNTPOc59mBYrw==
X-Gm-Gg: ASbGncvU8ceby98arc/S7tBzhk9rbvCNmSgr5EZcvleqq7JegpkKlGVIhq5O+/XxTyt
	hif+3Hx72hCI+YRDBRQx0ys5PqDMPwYN0GlK33Kzdqd9TkS15x/7hYVkN7epBEenMMiQYbZiwNR
	3Rd7SuvFe2fE/WoNZSWzNAfx9x6fGECo21wP7xiQllZ+Yl+8x/Rol3Xf6hjAC1yzsBbvjXC2zTa
	40oiZs9lK0pk+kB6O3wVN+IrEFnSEIUESFzWWI=
X-Google-Smtp-Source: AGHT+IEHQwnB79u13ccn0v4jhSNP1wNv1SCqDLPqjR5PoLcasXYprdf/GeMcKzgEB2VCqotr8ZyorITapctIMNYkHD0=
X-Received: by 2002:a05:6512:39d6:b0:553:2e3a:bae with SMTP id
 2adb3069b0e04-55b7c05f18fmr984925e87.39.1753886253374; Wed, 30 Jul 2025
 07:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250723094558.5bcfca69@canb.auug.org.au> <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
 <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com> <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
In-Reply-To: <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 16:37:22 +0200
X-Gm-Features: Ac12FXyBTxA114Svy5Uj0ivWoSbrkrjvRPCa-JAMdMs5h4ChxTFMooUaMdouQsE
Message-ID: <CAMRc=Me=hNhER-EnvJarG-uig67cEPWfjuLyT1_F0WKd8jyLig@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the fsl tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_073735_865874_A6F5A683 
X-CRM114-Status: GOOD (  21.65  )
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

On Wed, Jul 30, 2025 at 4:23=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/07/2025 =C3=A0 15:55, Arnd Bergmann a =C3=A9crit :
> > On Wed, Jul 30, 2025, at 15:41, Christophe Leroy wrote:
> >>
> >> Le 23/07/2025 =C3=A0 01:45, Stephen Rothwell a =C3=A9crit :
> >>
> >> I was going to send a pull request for this fix but I see the duplicat=
e
> >> patch is already tagged in the soc tree:
> >>
> >> $ git tag --contains 12702f0c3834
> >> next-20250728
> >> next-20250730
> >> soc-drivers-6.17
> >>
> >> Shall I do anything or just ignore it and drop it from my tree ?
> >
> > Linus has already pulled the soc-drivers-6.17 tags, so I think
> > both copies of the patch ended up in mainline and there is nothing
> > left you can do to change that.
>
> The one in my tree is in Linux next, nowhere else for the time being as
> far as I know, as it was not included in the pull request I sent three
> weeks ago.
>

Arnd kindly picked it up directly into his tree when you were on
vacation in order to make sure it makes the v6.17 merge window.

Bartosz

