Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD685C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4n+Ms5pL1bQf2A43JK9AnzZQ4jrDTIzztujw/nMLhY=; b=UEfDJPNQygCXud/h/tMQd/XC1e
	8CuoQG+Kus4saTRU9wjg/3GwSWeibPivdQfMmXX0w/PGenXkcgxH+9HaKZm3b3qvj5NFUszkAQgUc
	EBb9A2t640cc/XWES4dQAru2fNAxgJlulR3VUgrIAeRR84mfNEBz0e8WZ4JZxzMe1xk57mGE01LXM
	7hz/ty6U8TfUV7M6UBZPEHHG1ZZSIzsn+7ZNsDoACBJDw69EB0WlI3+kJcA+iVkqagYc8noApD0ty
	0CSb9+9YV95LeFLkV2zU4oAeMs3dYlojZeYwr6VRF5fhpYRvyIrgnDfdDWWNf3K2YKf9RyIB4E5H+
	ZVgJMYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCy4-00000002vmy-0Iuw;
	Wed, 26 Feb 2025 08:40:36 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCra-00000002u6g-3Ckv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83ABC61295
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AD5C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740558833;
	bh=h4n+Ms5pL1bQf2A43JK9AnzZQ4jrDTIzztujw/nMLhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fF7Nkb6EFcuQ2nWpn6NflNcAIyCSopyGB/ujzXI044JXfu4BnqLWzNubAe+Cb33pc
	 QG2mmc4mqOTvDXR3wcjG0qPUonAST0mVOMTr9lMePVzgmTUOtnoZU0AnAa9Z74VaGr
	 e4ygJuCHnFVma1bXj/yU13S6bfSrRSKn0vL9CxIC7YAnxujdRKI2SHzQyCng6c6ZDv
	 cdNN5lNObsL930f0yNVkam1Duxxh6GzXE2pzNEPEi2b1GRXZa+hKSbEdZHKRJQNI+J
	 22596hgvl+v3/IkOocxH+vYFBtCn37e6xfSxWwSWCuoZGIszMQemuR6jOD+Qh3fF+Z
	 9JXFA9u+ROFzQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so6516845e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 00:33:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKeNSCa4npaMArINNKPGCui6Yke+/zuuujE0HBpH1LL6k2F1C7aF42ApC62s4oJxHr5dA12k08voqgNCUdToHe@lists.infradead.org
X-Gm-Message-State: AOJu0YwwN96c0DRHVaoIrYY5sjFYg7cXQU14ftfZQYmVh3XSymhS7U2s
	BXzKWS3sYAaN4nnLMwqsrM2+yrWkmCFFfUPAdfhUfw1iP2yTaaIicmObYu4BMBdqarKGa3T6lmt
	8nhjPuZPwSC/DTRYtvRPw44xDHxI=
X-Google-Smtp-Source: AGHT+IF/9KPwCKz/aTELvY1XPdqB6cBdhDW+Aul55vhx/tWDsKal1Jxjza19tj1JccT2kVzCsDOzqsJlMlUX/R+oPRs=
X-Received: by 2002:a05:6512:39c6:b0:545:2871:7cd5 with SMTP id
 2adb3069b0e04-548510cf95amr4870815e87.15.1740558832065; Wed, 26 Feb 2025
 00:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
 <20250226001047.GA24197@willie-the-truck> <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
 <b0578d21-95cd-4d8a-add1-87299f36b491@arm.com>
In-Reply-To: <b0578d21-95cd-4d8a-add1-87299f36b491@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Feb 2025 09:33:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHJGC9aYCwwb2XTWfhAjH6GDKQptNdLwO+hfv6hazivHQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrfVJEmlrpBhoXqMjR9dAVnG364eO1ZQeuCfzmi2NJ8RHVsmdaWEeUcBJg
Message-ID: <CAMj1kXHJGC9aYCwwb2XTWfhAjH6GDKQptNdLwO+hfv6hazivHQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Luiz Capitulino <luizcap@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 26 Feb 2025 at 09:07, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 26/02/2025 06:59, Ard Biesheuvel wrote:
> > On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
> >>
> >> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
> >>> Apologies for the breakage, and thanks for the fix.
> >>>
> >>> I have to admit that I was a bit overzealous here: there is no point
> >>> yet in using the sanitised value, given that we don't actually
> >>> override the PA range in the first place.
>
> But unless I've misunderstood something, parange is overridden; Commit
> 62cffa496aac (the same one we are fixing) adds an override to force parange to
> 48 bits when arm64.nolva is specified for LPA2 systems (see mmfr2_varange_filter()).
>
> I thought it would be preferable to honour that override, hence my use of
> arm64_apply_feature_override() in the fix. Are you saying we don't need to worry
> about that case?
>

I wouldn't think so (but I'm glad you brought it up because this
didn't occur to me at all tbh)

With arm64.nolva, both the VA and PA ranges will be reduced, and so
the range of the linear map will be 47 bits. So if the PA range is
being reduced from 52 to 48, it will still exceed the size of the
linear map, and so it should make no difference in this particular
case.

The use case I had in mind was to allow the PA range to be reduced to
a value that is substantially less than the range of the linear map,
e.g, 40 bits on a 48-bit VA kernel. On the Android side, the issue of
the missing linear map randomization has come up a couple of times,
but there is no clear direction at this point, so adding this feature
here was premature (mea culpa)

