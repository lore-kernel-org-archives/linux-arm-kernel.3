Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCDEC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzPtW7lwZVrBQV2l7Q5OjCWqTLssSpFx4FWMfablxBU=; b=xQwH2FrKGRLhVnPJGpwBBgOfIw
	VYSpuUrfmT5xIknnkQpuMLToAQL0Vsnf1+EbfKvKyvyuXso+NFHQvyuwfCnTwPzqKf+SyTccRw3o8
	AJh07mGvsPe+RDPwyl+qee7HjC7IJU63g9qgiB378yopniyWzdx4Zd00GYN9ZO3i4RDrhRo7tBxIk
	Zg1cVfwdgSuYVRneteK7DTcleQcBkr6dCFhSkBZJicg9Op4I0I1EoeROkQjYWK5Oalg3HrWGc2TEc
	AChzgbWZnasVc7X8tx0Rpf8TdSYECJPzuQzIOJ4eizPleycf3dEl8yiQ6kaDdVYicfAVAns2NWMH7
	L0Jya3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSied-0000000GZYm-2xzZ;
	Fri, 20 Jun 2025 20:48:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSicJ-0000000GZ51-2haS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 20:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3B226155F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 20:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A526C4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 20:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750452342;
	bh=jT4pwqZu770AfPs28HMcGmVZzo3HY+8w0IIFr8RfnEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Km9WlWZ8piXCl6DiJrKe7nSuIAVy89OBxZ/F2yC6z2uFmzzZ0HJ50o24DIxhecwRg
	 LEbWwl5ANkRf5ZnwY7jbgn4QmCmhxu2vf3UNuye+ZfgJKq9GNCHfNisBbkvjrEdNe4
	 +VZmjs0UCagKjevJsfNO7Qg0yi0yvBaKUOv8aaLjeHp7usDux70Avhkrca3Dhw2ziM
	 u+FrFalwlzkurJEJ8TW7RkbMjWusXZ/ANfQ2Z24rDFQkNap8ugwZRx9DINsx7gQQhT
	 Y9+IiaDf3A3dkbA5KoTMI2Ut0Pn8aB1hQmyUueSptzNdimRfFp2o7CcpyDs3wAMTyf
	 s7BMKQfxWpHWg==
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a745fc9bafso23438941cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 13:45:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YyCk2BNyDFrIFB434Si8SEvFHtsZJTt5Hu+P7miJz9YMNV9GAwK
	49fpbFwSuPdJgXfyXjs9OTufeJCIfNv00nDXhxJAIeNGKWr4MkgmvwWHr955eRMjOzKuzX/OYla
	viBoPcvhYE/oD8wkWzB4ubJWY1JGubjc=
X-Google-Smtp-Source: AGHT+IEqMF68Qb4iQprw6czg61CaUToifU0J6UPsPV9YLZ7gihEJwGZpOcdvBvogvqyX3ZOWruWS8i5+uiniaUPHRRo=
X-Received: by 2002:a05:622a:488a:b0:494:731c:8746 with SMTP id
 d75a77b69052e-4a77c382e85mr53421641cf.23.1750452341633; Fri, 20 Jun 2025
 13:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250521111000.2237470-1-mark.rutland@arm.com> <175042293850.3925078.16138215907121902894.b4-ty@arm.com>
In-Reply-To: <175042293850.3925078.16138215907121902894.b4-ty@arm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 20 Jun 2025 13:45:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4s+vGdMqJiGSvacUtq_-JQeRyk2jqBRPiB=7WBXvpj3A@mail.gmail.com>
X-Gm-Features: AX0GCFvCWPmDIR1-1Yb6I0cEDSp7hG_-dHzlYvPC7MjDarzq5GtcXfASg7KKw8s
Message-ID: <CAPhsuW4s+vGdMqJiGSvacUtq_-JQeRyk2jqBRPiB=7WBXvpj3A@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: stacktrace: Enable reliable stacktrace
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, andrea.porta@suse.com, jpoimboe@kernel.org, 
	leitao@debian.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Catalin,

Thanks for landing these patches!

On Fri, Jun 20, 2025 at 5:36=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, 21 May 2025 12:09:58 +0100, Mark Rutland wrote:
> > These patches enable (basic) reliable stacktracing for arm64,
> > terminating at exception boundaries as we do not yet have data necessar=
y
> > to determine whether or not the LR is live.
> >
> > The key changes are in patch 2, which is derived from Song Liu's earlie=
r
> > patch:
> >
> > [...]
>
> Applied to arm64 (for-next/livepatch), thanks!
>
> [1/2] arm64: stacktrace: Check kretprobe_find_ret_addr() return value
>       https://git.kernel.org/arm64/c/beecfd6a88a6
> [2/2] arm64: stacktrace: Implement arch_stack_walk_reliable()
>       https://git.kernel.org/arm64/c/805f13e403cd


At the moment, we still need [1] to enable livepatch for arm64.
Would you mind landing it soon?

Thanks,
Song


[1] https://lore.kernel.org/live-patching/20250617173734.651611-1-song@kern=
el.org/

