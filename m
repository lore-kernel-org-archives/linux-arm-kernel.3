Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA39C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azlnxXtB5Jsuh9COWfMgAvblkqVwEyVB60V5P6SvQDE=; b=ecHc8DohQO4N6pFcWuhUSGiJhH
	ATkucjlqJ7OznfMOA1FloIrLjaCLj7XH/6mn0OGlJadsJvUepPItoesL/VEzrbycF/SJKpgUvQOFM
	NsZAUvKSpDLPt7hX+GfTz7h15rmsWrs8oxc4os6H14NYVPf6yyTvWlApIN/hzj5zpwpwL6bvzYC1o
	rimZMsGvV7YdnV3d9NHu7g7dRO+OSuZqqsrSqx5eqxn5+Z0ZPIgLtAjKdFtCKbiqL5g4olUjQQ3Px
	Vp5nYHUhcMVTToj0KTrQCS0CLOtsUWsBlgWiT1w8kns+yvssSlqj57lkV/nJo2k19o52D+UZc7WTA
	Q491KF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhT6J-00000003fZU-1IDx;
	Thu, 31 Jul 2025 13:13:39 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSyj-00000003eoA-1pk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:05:50 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso373561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753967148; x=1754571948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azlnxXtB5Jsuh9COWfMgAvblkqVwEyVB60V5P6SvQDE=;
        b=vGkMs5Ddzcnv+kNDQ6QkyIX3CVrKsJCKbaTLgfLjWCx8LZMV+XT5taAY+gyBUZqugw
         y/zfnL65EiGjlY+/zG1ftfeZeXmMFSfoz7k0G+qytkjO5bA9m7AEZFqB2KCC+UNM3wCg
         v5oynrIXqxh/LLoDgepXn8+vq/OXu+SDpkXIGxFgOlkYjIkUDFt5k/MFj9OXCkxVakYX
         IZBa/Lm87eCoqEs2gcXbO/3q0KUPUWUoJUJZKKrKcfmNSQG3ZpXutBDKxxOcTDF+c7o/
         vZ+Qs3An81DS+P2NF/DO92p5xYUp/zWZgicwyrgCPspwW4ugL2eFOf3gzB3gyJGhBdvW
         H3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753967148; x=1754571948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azlnxXtB5Jsuh9COWfMgAvblkqVwEyVB60V5P6SvQDE=;
        b=peTcns4OZFLTVawyGtxRfbuTyIH4E/RFYWJ4KzZN2P6pBMDiq/tEpylnA/zPWdJdu+
         wqb9CCfw0RJYy5mKhElJ3R4tF3TIi3/H4O7D+Gf4YXqILbmNiDVazoYbHQPH/HwuA6tf
         dTSwD/1dgPk7lMeB62/G2kaaptOny0Z+uWmloY6c2TzcNN1Gmrv83cMmgTZUDHfYbFWP
         XgcT/chxBE/C9q4xlbHfyUKwLq/1WcVBu35mWWYt/1wD+AQVYrdz+8Kuvx28cwlLxSU5
         QFIJwug6M4oanSYo8rfq0GCfMsoe75elkbjthii/yUWXysQwdB3StXAhMy+mT1fzOnH4
         z4oA==
X-Gm-Message-State: AOJu0Yz3h/VHeZ0JN6p2FrU/XyXpL4tlASrhEXDsMTC22IDVDWk/bdeg
	f0sBw8vKVIHUrkmsDVSyoJL+whji2RcL9d1y/ql3hXpA18e5eHZWhuYHvoejZWbuptWQh9qV1cn
	Tmwu9ioFRsLRLyF6jYlxf7RHSwRHmolrFtRuFA5pZ
X-Gm-Gg: ASbGncu3yD6slfG3MffZYcTQRBKjdBhZ2rO8yi2gWyDhowkuVEA9lUdVQOa1gKC9En0
	hELXilYhrAgXkHYAylOTXUx88Q8Yebuln9QYgK7fHKovGaWupAKuwzqT9+QY5kKJIPdi6W+KPwb
	5sbEi1C1mprK5GAqH5SnKNESuqxOFDybu0s+ZkoUKS5mTEurQJfUhsHmqiKI1+SdjJCguBd6IrM
	pqMDQztV3gUgFaoKG91YgCNfCF7qjU3uB7qFFUdhfp49Q==
X-Google-Smtp-Source: AGHT+IG+Ybn0Vf9a5KS/oI2MPqQgq+Aie0mL4apPe+UjdVmKjQHShnqct+PxWzBC5y1VuCqHEe7C17wcsdo2FMSH3+o=
X-Received: by 2002:a05:622a:180e:b0:4a5:9b0f:a150 with SMTP id
 d75a77b69052e-4aeeff4aa90mr3279921cf.16.1753967147797; Thu, 31 Jul 2025
 06:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250717234744.2254371-1-smostafa@google.com> <20250717234744.2254371-2-smostafa@google.com>
 <4a807c89-d57b-463a-9166-836301ee9947@linux.dev>
In-Reply-To: <4a807c89-d57b-463a-9166-836301ee9947@linux.dev>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 31 Jul 2025 14:05:36 +0100
X-Gm-Features: Ac12FXwWogNP-7wQS8mC6AnYZpyiOY3JJZqjWXTPFb2lLRrEX9SL9P6DuXwNkow
Message-ID: <CAFgf54q3KVOZ0Tji+dpnvnPCbvpN4z1Yhm5jfpEmDPhndo6bXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Dump instruction on hyp panic
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_060549_484039_4A64EE90 
X-CRM114-Status: GOOD (  19.60  )
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

Hi Kunwu,

On Thu, Jul 31, 2025 at 1:59=E2=80=AFPM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> Hi Mostafa,
> On 2025/7/18 07:47, Mostafa Saleh wrote:
>
> ... ....
>
> > +     /* Dump the faulting instruction */
> > +     if (!is_protected_kvm_enabled() ||
> > +         IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
> > +             dump_instr(panic_addr + kaslr_offset());
> > +
> This part seem like unnecessary, cause it'll be remove in patch 2(Only
> the comment left).
>

Yes, the idea is that the first patch adds that only for CONFIG_NVHE_EL2_DE=
BUG
while the second does that for all configs, I split it this way as
doing that with stage-2
requires intrusive changes, so at least this patch can be picked
separately if needed.

> >       /*
> >        * Hyp has panicked and we're going to handle that by panicking t=
he
> >        * kernel. The kernel offset will be revealed in the panic so we'=
re
> Another confusion is that no similar wording to what you mentioned in
> the cover=E2=80=94specifically "Cannot dump pKVM nVHE stacktrace:
> !CONFIG_PROTECTED_NVHE_STACKTRACE"=E2=80=94has been found in the code.
>
I am not sure I follow, this has nothing to do with
"CONFIG_PROTECTED_NVHE_STACKTRACE"
This series added the print for for instructions as:
[   12.016044] Code: a8c17bfd d50323bf d65f03c0 d503245f (d4210000)

All other prints are from already existing code.

Thanks,
Mostafa


>
> --
> Thanks,
>         Kunwu Chan.
>

