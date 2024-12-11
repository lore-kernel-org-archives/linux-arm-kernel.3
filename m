Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11510E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMRrLT8PBkUb9uwSo3UZOKSbeLIunajxVCGqM67QreU=; b=NF4VkIGfPnI8DOq93lyOxtBECA
	N3xKXNWK6OLrCJ3t+DhFPZG/0GP9LLQD0yKzZczojXQWVJpyV5K0BBkgR6kYQaewNKYfPatayQ7qX
	V9y8N9+Fd2w/QhTF138SfXizrXuDywQ5+3m4gHRFmxCXe1HOnOpCb6SxrExt0NFn+UyPTjzGVlolj
	4ElN5X+zMlv6qL7dUbQIYtXyGgk1G2LxaZTxcNJQpsmN0umYloKlHCs9LvwjHZVc2uhn3/ZXjCmk1
	v48KPe1vZB9P9/+xhIJkBue4MDF47FvXii3PVHKZvRRQIJ8ntABTsxgSdUJyNaBJbP15htfRAOkyN
	dZmv1TnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMLq-0000000Euhb-2Cvt;
	Wed, 11 Dec 2024 13:02:02 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLM6j-0000000Es2Q-2BJ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:46:26 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-300479ca5c6so37152421fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733921183; x=1734525983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMRrLT8PBkUb9uwSo3UZOKSbeLIunajxVCGqM67QreU=;
        b=dS+gsRwbge/wtGp7zAfAPtwdImjkRgAViX/CXeZMLCZ3pFxeJcvFFEqZbNx6eTZ0Yh
         BE92MnIEqcgfSgTmN5BLWYcgZZUYoV4Yhve00qq94joPxWZAUOOrKhUOClh6ONSq1RVC
         ovhPIpZGKX+VXb02Z+cTVvqYKcf7NvPy9dXjAlQztw8ddUvvZXJZNiXneXUGtSaCJHcm
         bh8spYscoxVrSldf8HME1a/nTYoEZHQWd8VyfqdrmZsgJbiYI7LvuuyOzNMmxZA/q16k
         PRlYpJ0OB8z7OYp26MmwfXwpZITAONYhFv8YLy4Bn4l+UJosqbduksD9rGLGlyrxEhHu
         yo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921183; x=1734525983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMRrLT8PBkUb9uwSo3UZOKSbeLIunajxVCGqM67QreU=;
        b=oGNwEnyHmnzLfYs5lZwCU2efn9vKGWcZcTNyXYeLE8tvsvSW61cy1bc/jYu3ia2eZ2
         vftZUNk2Gg/cNUNPu5gygFzh51Ds0Y0njMdr73PIqTEpcLP6NRo1CapbWFltl3VKgegC
         YiUmRrXDhIBSiGZdJwAX2MxWntJ78qky9RDoP4rU3IYjVCWwex6Bj5HHsyzsDEi1s65D
         1E6A4EsAzkDvojOBbMkG5vISa+sBlr0Xy+8b81VhJo8Xf4HSN7Bmv2Wvbaz/NNNafiMr
         Auvj4neCE7I9on558mQB5oM9ecK2y/sJvWlc9WoCauJ6btAb7aQdhChPXH394yxrFYfZ
         1cGw==
X-Forwarded-Encrypted: i=1; AJvYcCWrkqH48hJipdLdCLQFS5UYsm4xm7EbEMe74jt3AIGnWNIGOcO2SADF+eYAnX6VeKiPOyaDdf8R4IKprB9g7s5o@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1vE9zO0rMxqcoXVa1Ekgku9HjbwAaeTwOQltnVSrNtMXCKyZ
	JTNRo4bXBSosMPjeTR1l1vQwYx2gp5duxmCnLvUeXFV6Ex8MjNIttaNG+Gg/RG14aGuodK8L4Lr
	DX+VLdatMqzuPmSivjSFilM91LBY+ZFGkPaXkoA==
X-Gm-Gg: ASbGncudwS/60I4ZlRVCc2zU6qpPTqVIKqylsl0zw16+wgCtVMA9XSWfXcZVvcw1huH
	P7qWzQdpNKMOxcOnOFPxqEppHaWq/hYpHSGWFcSavJVfulhD1Nvtx2PyRcB0KfHdvQm91Uw==
X-Google-Smtp-Source: AGHT+IGSGpq67S3KPhxv0QaGyYpi7Ds7VIRtelTKmN8kUlCb5EZQ5DwEZ8oJuL//LObkvog2EV/g3poagrgtfeFDHng=
X-Received: by 2002:a2e:9fcb:0:b0:302:2620:ec89 with SMTP id
 38308e7fff4ca-30240cfb673mr9672121fa.19.1733921182952; Wed, 11 Dec 2024
 04:46:22 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain> <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
 <bd95d7249ff94e31beb11b3f71a64e87@AcuMS.aculab.com>
In-Reply-To: <bd95d7249ff94e31beb11b3f71a64e87@AcuMS.aculab.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 13:46:11 +0100
Message-ID: <CAMRc=Mf8CmKs-_FddnLFU7aoOAPU6Xv8MqyZo8x9Uv-Eu+hs_g@mail.gmail.com>
Subject: Re: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
To: David Laight <David.Laight@aculab.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Johannes Berg <johannes.berg@intel.com>, 
	"toke@kernel.org" <toke@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	"kernel@jfarr.cc" <kernel@jfarr.cc>, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_044625_763278_09ACBA11 
X-CRM114-Status: GOOD (  15.84  )
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

On Fri, Dec 6, 2024 at 3:20=E2=80=AFAM David Laight <David.Laight@aculab.co=
m> wrote:
>
> From: Naresh Kamboju
> > Sent: 05 December 2024 18:42
> >
> > On Thu, 5 Dec 2024 at 20:46, Dan Carpenter <dan.carpenter@linaro.org> w=
rote:
> > >
> > > Add David to the CC list.
> >
> > Anders bisected this reported issue and found the first bad commit as,
> >
> > # first bad commit:
> >   [ef32b92ac605ba1b7692827330b9c60259f0af49]
> >   minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
>
> That 'just' changed the test to use __builtin_constant_p() and
> thus gets checked after the optimiser has run.
>
> I can paraphrase the code as:
> unsigned int fn(unsigned int x)
> {
>         return clamp(10, 5, x =3D=3D 0 ? 0 : x - 1);
> }
> which is never actually called with x <=3D 5.
> The compiler converts it to:
>         return x < 0 ? clamp(10, 5, 0) : clamp(10, 5, x);
> (Probably because it can see that clamp(10, 5, 0) is constant.)
> And then the compile-time sanity check in clamp() fires.
>
> The order of the arguments to clamp is just wrong!
>
>         David
>

The build is still failing with today's next, should the offending
commit be reverted?

Bartosz

