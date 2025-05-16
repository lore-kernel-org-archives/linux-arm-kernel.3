Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43BAC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNW+7TtMUM7lGkKFYvhyFcX7e8P3pZT4KoiVlpFjICo=; b=b4dsTOiB92JTYucbrQkbf/DuMd
	uXkZSl0aYwyW0MoZDyhibMje7a8h2RYtBg1ZdBGkaxgn+iJ1y4lHjDWmJEcWh8+12sc+zZQwMAmyo
	jH6mNHVUcyGStSi2OmBYEK2qPtVyc5T7y13e1hLhWk3zb5492UuzJzDJrI6rDTyVydqjQIzALX01l
	IiPLfDFY9yTvisBwSjFiWGH2lMppu4/Ux38QiJs+1yf7RboyTDtHAjZku7m7Cp8FLjabt0y4Ky5lr
	Tp0R5Erb269JDjE4SxxUx5SDSHHa7fAH3zUtC3lKafUyYPxkYqtIOXdBQQ5tkk2PRydJs+hmlUMl7
	5SLF0vxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyb6-000000048NO-3hRr;
	Fri, 16 May 2025 17:11:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyJh-000000044fs-1OB3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A14E4A905
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 16:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C53EC4CEF9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747414428;
	bh=gNW+7TtMUM7lGkKFYvhyFcX7e8P3pZT4KoiVlpFjICo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K0AZM/WHkIM/qkUypevLdnzzY800HqjD+DQk3EspbBN0pK+1enPyE1noNGvw2ISAv
	 sUGRiH8wlgjpHocu4xNNEmFGK920dEw58CkP7ulNE9K1WSfm9nNRleFZBked/yJ71K
	 k5HSSaToM/eFv03ACXW88lKF/+e5QLQgPB4wJjEh5MdnKNulfZLYGaPkeFhI3ChvTN
	 aQlJx2Ixr/hRimseN8QEYqtyhv04e7uwllTn6AyQgSVbUr0zk2+9uWgxBg8/okmU0R
	 S7vAyrAOLrSNFUxD/lBG+VFxmJobAYDNnNLR4zzJRvEJh3Bx7FIezs8Rj1NiDNvH8m
	 rcZA+KYgOakBw==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5e1b40f68so270392285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 09:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFt5J2XkJp5bqU3iXzb2FWon/+6oJZPvLask2Rjr1QrNfHf5TjGIhBr2h3QSspugxosxI0IIOX2hDg4/PH2Hhx@lists.infradead.org
X-Gm-Message-State: AOJu0YxWDueOJGeHrQeRvjWiugGXOQYUSwvVBE4gbXzleHkyrgi4bKf3
	/n+l4KepBqgN37jyeLLzTCPSE29PT68H7aA+ILZFCQIMbbt2WnJoKO07U/AhdodVn/joM8Q27j7
	xVVjWEdTgXaBcaC53RLLFXeygyVatf5Q=
X-Google-Smtp-Source: AGHT+IFYMPM8sSmrqIW21t3SlXlT3FCCm2dJlRMJ71bVHCSHc3IMxpcI15wCR4GKjvDMf42liz3czXx0mNeec5L+ncA=
X-Received: by 2002:a05:620a:4551:b0:7c5:5f38:b78f with SMTP id
 af79cd13be357-7cd4673b9femr581672585a.29.1747414427420; Fri, 16 May 2025
 09:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250320171559.3423224-1-song@kernel.org> <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
In-Reply-To: <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
From: Song Liu <song@kernel.org>
Date: Fri, 16 May 2025 09:53:36 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
X-Gm-Features: AX0GCFswWuh29mi00OXRAzuYoajxd21bc-p1p3_IOZYYbVK2ROe03x1xdxnX9VM
Message-ID: <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
To: Petr Mladek <pmladek@suse.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, indu.bhagat@oracle.com, puranjay@kernel.org, 
	wnliu@google.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_095349_385832_B909CB8D 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, Apr 10, 2025 at 8:17=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
[...]
> >
> > [1] https://lore.kernel.org/live-patching/20250127213310.2496133-1-wnli=
u@google.com/
> > [2] https://lore.kernel.org/live-patching/20250129232936.1795412-1-song=
@kernel.org/
> > [3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32589
> > [4] https://lore.kernel.org/linux-arm-kernel/20241017092538.1859841-1-m=
ark.rutland@arm.com/
> >
> > Changes v2 =3D> v3:
> > 1. Remove a redundant check for -ENOENT. (Josh Poimboeuf)
> > 2. Add Tested-by and Acked-by on v1. (I forgot to add them in v2.)
>
> The approach and both patches look reasonable:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Is anyone, Arm people, Mark, against pushing this into linux-next,
> please?

Ping.

ARM folks, please share your thoughts on this work. To fully support
livepatching of kernel modules, we also need [1]. We hope we can
land this in the 6.16 kernel.

Thanks,
Song

[1] https://lore.kernel.org/linux-arm-kernel/20250412010940.1686376-1-dylan=
bhatch@google.com/

