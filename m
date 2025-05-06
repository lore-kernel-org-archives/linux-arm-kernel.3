Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3107EC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaF4HJ/DNDxWc7mYVleeWmEFWB04gncRwOOvOd0VtyU=; b=RI8DjdszFG0tILHTZnMCQ3EPX4
	LKu6c+J2k81BmVeshkNUrxcb2SgpaiYzwsfAr9ecReTHhdC9AwaSLszK/aesPQpKomsEJYsRDTfkW
	44ennSV2wSdBOfGp1p/JoDJ6LFUv8xK652lebzlyMEOsbmbZ5Bl/RX20EkixNIWCh3L2rlil8r6kZ
	1twbE4A7g6Z/9iUxyd8A1yCrYcYCu8jKAe4yG7hN7mNG/S0CKiV/aydEqeC/X52Bm/TS5vC5cX659
	DV0fCQfyX849VfPAxTu9negQc8cy+Gcmj1YHcdpGzbaSErHVAQfq3lGJepwmvLi3D4fQI7GV+i5J5
	dynsxfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEkG-0000000BPeS-0ZoE;
	Tue, 06 May 2025 09:37:48 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDwu-0000000BDG0-29oq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:46:50 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-47686580529so63151241cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746521207; x=1747126007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaF4HJ/DNDxWc7mYVleeWmEFWB04gncRwOOvOd0VtyU=;
        b=kzLSMqlJrYa2sgtD3LyawJifp83dq/w6CxLFMC0d2wkvdP277j0hUa/dDIzWQUvolJ
         H2mcH3FeFtIP3KUFUn+VZ4EjysjvEifytqMxoUwYDjfgbf9OcSB0tiaE9O4pA7XknR75
         JncJYjDUQAFc4wXW5SvMxMROx3Xeng1ImYOMT2YECH7yIJhdHnvbbY9eMXUR9BlzGNCx
         3F7VK0GZYhSq+1JwJaVheSWqP+IliSLyG5IT66vpgImzZ2kap9c8wnH66RyRJkwlpBB8
         PIMFTodm9ZC0k8vllDHRSWka4n6v6V/3c0uUZ9o5Ytkniw+OII6WvN6DEmBx8P+hKL/w
         m+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521207; x=1747126007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaF4HJ/DNDxWc7mYVleeWmEFWB04gncRwOOvOd0VtyU=;
        b=T/s3byFlTkgGgksHWNd58AFHsyoIclbnqRSBb3EqOpNgYd0ycsy6IrYQUpbyGyFA+7
         WERM+Eb6mzEVEz51cm2JBPq2Q5Kj5qTYSynlyWeZzL2z4+F5KrnGVl8pGhJSH89RXZED
         X80WM+Qgc8hFqzP/OnXQrlA31EuSyK7ywi6nXziD7AhlN4c7wsjxaIgAnUtuXrlu8UoN
         ZRCrN1eEhUCAlUmi4MshJwtBWv2xKWmcKTTZOLIGf8bWeqWQsaTu1V/6LRV2tQ+SQjkm
         QYldrJ3/CUWrhkYclBIWsuiXW9EROzUh1vjIKVZwpwW62LX3y9U2xLecamPB6R9CFmx0
         WzcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4Thd5zob+D8PHYvGQ2v8YrEJKoi7X6gGRJe8SY83at0Y1f0ORqpL15GPPnmXmGu2zuzyGuuvPpm8m5M+FMHao@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgbw5XG4RXagfef1Y26EYQRzdIqJK8geDDXRIiHp4iNbMNEk60
	HbPxcYFPsQ5PrA3PA6yBhzWtnr16qyRkyuKdLnmgZiKNzhJcy+HkSOXtUER3WXA7wCK4rkXwfC9
	H6XEGO3Ch2psFgRJCwimCjBNhIL0=
X-Gm-Gg: ASbGncu1McDjrL+om7fIj3L6iRtLOr6iJRubyLJsrH2ieDNWT+7B9qlRkCrOuyvrwx4
	RdEA/RZHHYsoRtfLOclffEUL+Wx813c1UzNo/u9nJutclhXddaZ6rvL6Hpz5CNmYcFWUopO38/o
	fCYH/DxVEcCMq9K99fzfj+
X-Google-Smtp-Source: AGHT+IGlEuItqzObUKcbXYxxDqx46QQtqpueW7Pn73XKkWFGhrY8Qavv/aSA1QhLFO/Kf1hJqBGFC2xioJ+yt8j06DE=
X-Received: by 2002:a05:622a:14f:b0:48d:4887:982f with SMTP id
 d75a77b69052e-48dff3e0ac5mr130626621cf.8.1746521206742; Tue, 06 May 2025
 01:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
 <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com> <87ldranq87.ffs@tglx>
In-Reply-To: <87ldranq87.ffs@tglx>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 6 May 2025 12:46:35 +0400
X-Gm-Features: ATxdqUGKBoSj_e6rwt1rEvtM0FWrRpwvATKmpnJREd3tdfy5PfkFv7VRK23vf54
Message-ID: <CABjd4Yx5O-ivpyZ3ewx5dfLPR2q7N9HU5t9-uOoEDZa3y2woFQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_014648_549634_9E9FBE78 
X-CRM114-Status: GOOD (  10.91  )
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

On Tue, May 6, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Apr 24 2025 at 22:35, Alexey Charkov wrote:
>
> Please do not make up subject prefixes. See
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-=
submission-notes

Thanks for the pointer Thomas. Will change the prefix to
"irqchip/irq-vt8500:" in v2.

Looks like the older commits I was relying on for the preferred prefix
didn't follow the prescribed format themselves - oh well :)

Ref:
0953fb263714 ("irq: remove handle_domain_{irq,nmi}()")
1a59d1b8e05e ("treewide: Replace GPLv2 boilerplate/reference with SPDX
- rule 156")
d17cab4451df ("irqchip: Kill off set_irq_flags usage")
d2aa914d27f1 ("irqchip/vt8500: Use irq_set_handler_locked()")
41a83e06e2bb ("irqchip: Prepare for local stub header removal")
9600973656c6 ("irqchip: Constify irq_domain_ops")
0beb65041e86 ("irqchip: vt8500: Convert to handle_domain_irq")
8783dd3a37a5 ("irqchip: Remove asmlinkage from static functions")
e658718e478f ("irqchip: vt8500: Staticize local symbols")
06ff14c05426 ("irqchip: vt8500: Convert arch-vt8500 to new irqchip
infrastructure")

Best regards,
Alexey

