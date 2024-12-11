Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0CFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5/pBdgJ0WtdygNIfcUkdF80xl9r4Rk30sip5q/77pY=; b=btBd4FlN90+pU5++sI1538Jl2e
	UDciIbF+3ZPKJ39pidD69ZYrW8avXmhzZPl9x9ZmRzTvBtvnzmKDaxISA4aKOHf5UFWFTQQ5fB0LF
	95itKN+rj8arpSjaUFHMhIY3p/XMpBlvNsgINWL9kXTX4hvONJ77Y5IN8jSPuBL6Z5Bnv4Kk/UdZJ
	yPujW0TK68ySid0Jv4SqCIScjcM/9h4NDlcRnBeBmwyzdoV0Xz0MmiCV9pJDZl+p1Z3k3cfZkVZG1
	GVRu5+Eos+WuVQrZjPF7usGL0ublmdSqiT3of5r2STi1j9La0K2UKzdcLuwppF3HhAChXXWH/bCJj
	aZYOA4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJiH-0000000EXJu-1PCR;
	Wed, 11 Dec 2024 10:13:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJhD-0000000EXCg-3791
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:11:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434f150e9b5so28795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733911914; x=1734516714; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k5/pBdgJ0WtdygNIfcUkdF80xl9r4Rk30sip5q/77pY=;
        b=MzL2l6PSSyMTl3uld+9N0YCdhSAXGrdWYaKkPiK7QzBTCJs2Pkq3bQpChBhKBUoNrJ
         /HMzagVmM1yiEjahjFobcn8CQcTgIBdqs16pS75mMTxOoFW7dJS3REpijEBHa0dDGK4H
         iuObzeDau5r3SbYNpStFWoEROOaGITX1Xpc3mBhmpZATpyqZ5F4CJhQz3nH4F7UbgxH8
         pyzzhzpxtQy9465yfW+c6fUHpeInPNp00Prd5KdP4ZYAU0cYav69Z5Bl1LUeIAoSxhmd
         WMpazkPgG7wBQiXe/BoYyZb0NPxeLnAh9+dxqKu5kz448ZQGMvFwwkDeGW1o2yOtjuYC
         riRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911914; x=1734516714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5/pBdgJ0WtdygNIfcUkdF80xl9r4Rk30sip5q/77pY=;
        b=Sgp8S+Sz5jqekFayePfIhjLFQO68ep8sT3v/4kjz1broMvoEls5oj+slnwhe5NdTPO
         +ZZ0WaQtOExHqhcA8QSrl5B73l9ET6MRXiJvhrx2iwlPRveAh1gfOJh/4h7voDKHXQRx
         NmhSW5aQxu+Ub/ZTHVaEJ3jdtYQrK2y2rDATAK3PD2XOenD4CX+R4v48u/qyU2C54cKk
         0xAvP8MGn1iC9NR+J4hgQwpsP2r5FsFaWzpkFwMTUc2DRSfLLOkoyZMED2BEuXFMFmjZ
         a+E7Gs7EjR2Z8QsS+1pprxOc+zXX3fZeCXaBQbxvXfZpTdKKgDTJwQ7QqyElt1UW3cE1
         GnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9a1jbYVNdfauvAH6H76QwH/FlstEbgem4m60uanTdTgKxdMc81J9wvI0r/3b01krrQgEDPxip0u1FiGkJOTDA@lists.infradead.org
X-Gm-Message-State: AOJu0YyFvSskwVSwOqRT4VVgK+qFQT4LnsF6U1VBKQ/5IwJp4l88QcHQ
	Yuw91g9Lqn25wivZS7LZEYZYFm5ye66LlhDKagcWRqRYPQXQBh7Z7Pdm3QbtOm0aJc6VuYuMEp0
	TPwAMHbPM+2gipJWQeUTUbiRYW6gJBS+x5xrR
X-Gm-Gg: ASbGnctqLcwatAUBO5eTQVZszwk1n5G76zTtN3w4ww8ABrDeyw4ytrQ3hdfqUEjWeRd
	WcLJUXll4c/0COWBG2IKKRVPSnb1mBs+pMcoZfX9HS9cHALXD2IkUnPZDR+g0W1hm
X-Google-Smtp-Source: AGHT+IHKlxzo1xy4xRwvjpYoXuxiOd/XjNGW14dtMQxwLOZNl9tNvycqqdCoKpeiFlUtFyA39Sdg5yzXDCdFY1hYk7g=
X-Received: by 2002:a05:600c:490a:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-4361c0e320bmr987705e9.2.1733911913821; Wed, 11 Dec 2024
 02:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-16-qperret@google.com>
 <CA+EHjTzOjwNyUkS5_zSUiAbiCauLKKgkKU6TM_-+Wsh9A0FdRQ@mail.gmail.com> <Z1iaof2DgZfZxc4l@google.com>
In-Reply-To: <Z1iaof2DgZfZxc4l@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 10:11:17 +0000
Message-ID: <CA+EHjTyzh_tqH-M4zSDEQ9meK_W_c-sQDvJ6H4kBd4e_MCmLfA@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_021155_778086_6487E747 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Quentin,

On Tue, 10 Dec 2024 at 19:46, Quentin Perret <qperret@google.com> wrote:
>
> On Tuesday 10 Dec 2024 at 15:14:03 (+0000), Fuad Tabba wrote:
> > > +int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
> > > +{
> > > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > > +       u64 ipa = hyp_pfn_to_phys(gfn);
> > > +       u64 phys;
> > > +       int ret;
> > > +
> > > +       host_lock_component();
> > > +       guest_lock_component(vm);
> > > +
> > > +       ret = __check_host_unshare_guest(vm, &phys, ipa);
> >
> > While I'm bikeshedding some more, does the name
> > __check_host_unshare_guest() make sense? Should it be something like
> > __check_host_changeperm_guest(), or something along those lines? (feel
> > free to ignore this :) )
>
> I understand the comment, but not a huge fan of 'changeperm' as that
> sounds like we're only allowing permission changes while we use this
> all over the place. Maybe __check_host_is_shared_guest()? Naming is
> hard, so happy to take suggestions :-)

I've gone and done it now :) I almost like that, it's the *is* part I
don't like since it implied a boolean return. Maybe just
__check_host_shared_guest(), no is?

Cheers,
/fuad

