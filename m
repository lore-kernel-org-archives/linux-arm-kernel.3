Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBB2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7YKnxexLJ1+TaE4HafZ+vrLntQPWzQ2qCK8DJmplRQ=; b=CoAHDPCLG3bDWLXZ3G8QSNjoPw
	RM0lmUQ1RyQYdtZIcnRiJT/iTuw8Xd5GmsVFaX7tIQbwiaWSjUwAzSTjD3zhrazQSzxrI6qez4LlG
	5fnoKWycsmMGzEOjqAPYpbL4ohIJ4wPRF7l8bvp8YiBCuNoOncoZNnhnBSWxIjH/GT0iAbr9IACIZ
	MhJ1aww1E6CgMiSUMfH/i6Fap4t6CVILDqEkqi/gI0cAooDzg6rvpVvMh7bjannl2AQm+6NXkIaXL
	rXq13nCJN+Jort/LLPbbJVL6VC9WP005HdsBgXJ4RKSbWeLLtc2eO7dBPmhtS5n/Aq9nof4Ya9utH
	SYmO0shg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdoe-00000002WPx-30Eg;
	Fri, 06 Dec 2024 19:16:40 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdnc-00000002WHM-2C0s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:15:37 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3cfdc7e4fso695a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733512534; x=1734117334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7YKnxexLJ1+TaE4HafZ+vrLntQPWzQ2qCK8DJmplRQ=;
        b=O+z1eGhqY55B/Gn0QzcYToPpGlnuvh02r4wW2jpW/7Y4HSYj2gjAcOlGEEq0u+VnbE
         iyncFKSCcOlQABAMolyS9EyXAGs4uPN6tgxPBGTSl/LF+uvUHwVJ1VqTp72HafZXBSq4
         GzMy7b+UXj6GyNGqiFG5eUmSY1kVLVe4Z8lGZynBrAnKCYVo5A4EsGu3bHdHIF9gMnaI
         GfkNDTEDjeq7SaB+hMgpGVB8+0STyRP9CP7ctpg98C1kS+lZzW9wHBHJ4yctiWg1p5Li
         QQzRT01pFLe9D8jWDZVG+CRqEGqMTln4T48rJGJmR666SjEHIOr+ok1eQUvUJkzncpXU
         gK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512534; x=1734117334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7YKnxexLJ1+TaE4HafZ+vrLntQPWzQ2qCK8DJmplRQ=;
        b=LD3BoU8yIYBz4tbwOrvNQBnvYWvPy09yBTwJgwASzMpTOxWXF+Av96dw2/v8fuXzIn
         G94qxky3LmOZuTo7TleSWzlPkNkyByp+306dOxOFWdsM4inZ4TL5Q6ni2GFgx+aDIRKM
         rG7187/kE7fbb1yayQZf//ak5515RAgipGQ4hCa/QrBJanzg3OHDBmPkXpCIjHJeGh4S
         Xv1hEmW8oRUek2RMxyH12q0UXFhnf59A1FvPidHQdorQto5ZhDV/vmYJAdZmBp/Z2gbP
         +LjvexebiO/zIEVfhDJAoT1sHZQZuJZkllmceK/pXGMtoKRYj9oFSShkI0WRI3Wtus/R
         vgXg==
X-Forwarded-Encrypted: i=1; AJvYcCVq7ptknaMWXsMitQmDmEMdoUpS8A8H22btO8/77TA/huV8qeVqwXSiXjdsV6COVgse8/b/koCyk3hyZPk5Hxjp@lists.infradead.org
X-Gm-Message-State: AOJu0YyRS956tjqn4xno6piKOFraQiAe5iPBoOWFChbBaLWw1Rl+kgS2
	gpDwzRzSlv2hGfVKqK0Tsbudh0d+4n1nIMcO6py3JSMvwU4HqvTuPOQhpYHEnZp5s+db06d0CjW
	V/eykibNDiRdWA9saK3ia/FSdS7qhUgPtNU90
X-Gm-Gg: ASbGnctBP2EGitm7sq9Mmq2SGF1JkdCtiHJCo5To9cgZGBG+NGV1fAJ5pK8QPJ5DDuh
	HQQozBJrXyv6PVZCj7a9uif0YWWKTCipl5P9Xwb7mX1oJPabZA8jT5O2wYyw=
X-Google-Smtp-Source: AGHT+IElYlBNREfqiZtIPEZ0AoFhO5dJI6xcw9xcSYAg6cDhIC7rFrPCr3zdIfmomIG/xUNduJKYL+dryW/WkRiwaII=
X-Received: by 2002:aa7:d507:0:b0:5d0:eb21:264d with SMTP id
 4fb4d7f45d1cf-5d3db4b972cmr3792a12.1.1733512533171; Fri, 06 Dec 2024 11:15:33
 -0800 (PST)
MIME-Version: 1.0
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
In-Reply-To: <20241206101110.1646108-1-kevin.brodsky@arm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Dec 2024 20:14:57 +0100
Message-ID: <CAG48ez1b8BBquEB1BJEg+KsPdPyZLPuD7uToUH3ZdN8F0r+U9w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] pkeys-based page table hardening
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aruna.ramakrishna@oracle.com, broonie@kernel.org, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, jeffxu@chromium.org, joey.gouly@arm.com, 
	kees@kernel.org, maz@kernel.org, pierre.langlois@arm.com, qperret@google.com, 
	ryan.roberts@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_111536_563137_F576FFCE 
X-CRM114-Status: GOOD (  27.64  )
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

On Fri, Dec 6, 2024 at 11:13=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:
> This is a proposal to leverage protection keys (pkeys) to harden
> critical kernel data, by making it mostly read-only. The series includes
> a simple framework called "kpkeys" to manipulate pkeys for in-kernel use,
> as well as a page table hardening feature based on that framework
> (kpkeys_hardened_pgtables). Both are implemented on arm64 as a proof of
> concept, but they are designed to be compatible with any architecture
> implementing pkeys.
>
> The proposed approach is a typical use of pkeys: the data to protect is
> mapped with a given pkey P, and the pkey register is initially configured
> to grant read-only access to P. Where the protected data needs to be
> written to, the pkey register is temporarily switched to grant write
> access to P on the current CPU.
>
> The key fact this approach relies on is that the target data is
> only written to via a limited and well-defined API. This makes it
> possible to explicitly switch the pkey register where needed, without
> introducing excessively invasive changes, and only for a small amount of
> trusted code.
>
> Page tables were chosen as they are a popular (and critical) target for
> attacks, but there are of course many others - this is only a starting
> point (see section "Further use-cases"). It has become more and more
> common for accesses to such target data to be mediated by a hypervisor
> in vendor kernels; the hope is that kpkeys can provide much of that
> protection in a simpler manner. No benchmarking has been performed at
> this stage, but the runtime overhead should also be lower (though likely
> not negligible).

Yeah, it isn't great that vendor kernels contain such invasive changes...

I guess one difference between this approach and a hypervisor-based
approach is that a hypervisor that uses a second layer of page tables
can also prevent access through aliasing mappings, while pkeys only
prevent access through a specific mapping? (Like if an attacker
managed to add a page that is mapped into userspace to a page
allocator freelist, allocate this page as a page table, and use the
userspace mapping to write into this page table. But I guess whether
that is an issue depends on the threat model.)

> # kpkeys_hardened_pgtables
>
> The kpkeys_hardened_pgtables feature uses the interface above to make
> the (kernel and user) page tables read-only by default, enabling write
> access only in helpers such as set_pte(). One complication is that those
> helpers as well as page table allocators are used very early, before
> kpkeys become available. Enabling kpkeys_hardened_pgtables, if and when
> kpkeys become available, is therefore done as follows:
>
> 1. A static key is turned on. This enables a transition to
>    KPKEYS_LVL_PGTABLES in all helpers writing to page tables, and also
>    impacts page table allocators (see step 3).
>
> 2. All pages holding kernel page tables are set to KPKEYS_PKEY_PGTABLES.
>    This ensures they can only be written when runnning at
>    KPKEYS_LVL_PGTABLES.
>
> 3. Page table allocators set the returned pages to KPKEYS_PKEY_PGTABLES
>    (and the pkey is reset upon freeing). This ensures that all page
>    tables are mapped with that privileged pkey.
>
> # Threat model
>
> The proposed scheme aims at mitigating data-only attacks (e.g.
> use-after-free/cross-cache attacks). In other words, it is assumed that
> control flow is not corrupted, and that the attacker does not achieve
> arbitrary code execution. Nothing prevents the pkey register from being
> set to its most permissive state - the assumption is that the register
> is only modified on legitimate code paths.

Is the threat model that the attacker has already achieved full
read/write access to unprotected kernel data and should be stopped
from gaining write access to protected data? Or is the threat model
that the attacker has achieved some limited corruption, and this
series is intended to make it harder to either gain write access to
protected data or achieve full read/write access to unprotected data?

