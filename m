Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5F3C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 00:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Kih/5Gb3n2KEUdLXQmm7RKtUqyE/igDwwvcsn9JuyU=; b=lRWr6yqK5E7lWczoaYuhJ3y2jU
	NBf5llwQ6GhS0VzV9aGGGu98MnDsavv9TcZARQO7yEJejjOeoNTLQbiHAz4QYS+L2agoOvhIZgw+x
	RrqHF9i/ZMZvDobjpofOXE9XWhcniHKsord7vLXbElfiKEYmvsRHsccXWfe4w7eYP/pxBKhLvxQTz
	O+lejw3hqB9vaWxnJPfD++4lTdulBoZ9Yfgog6Gc05fcr4Lthh35CGx3Wae885TJ7A5s+BpuTa/Ew
	p07+jukNZa0kfy47/qvajeE1AOEurcn/Dtg4Lgd/j1L2WmiPC27GA/s8gGCrJ9VCkjVW3i32WcgMe
	8PT59YbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwR4-0000000F7iY-32WG;
	Wed, 12 Aug 2026 00:03:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwQy-0000000F7hx-3ckm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 00:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21E7A60A91
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F301F0155C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492983;
	bh=5Kih/5Gb3n2KEUdLXQmm7RKtUqyE/igDwwvcsn9JuyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hrIORbIq/rgGgPoVBZEkFCNjKZCBXeeWCVnQqG+xPs4CXt2w/Ck1EjSYrmESXEbaV
	 C1CGl4XrK8IxZeP+6xRfJdg8PQaDCtQ1+I8eHyC7PsDU10dcueZv9e2LVH/Vh71Otw
	 YW06oAKIWIYHw0CuYdzRNZ5qAVSJ0HimNOkn3ia6MBD0WylewrkSdrTULF5Fkpt5PK
	 B61VI43+3EATMXnqdTb9JsXZdWNLPEyQXiLEoFMnNHbM9YDqWyQIdF8UR8TPxEs7b7
	 KZBTK9JMRTBzloKxYFlAQrpNoJVA9jMpoAdbp1UXQ4L1BNuNarTR449317aBdUTIHZ
	 RqBRD5br6tXuQ==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e67555e24so27498585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 17:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoCphcRsIn55pLYXWNW8Y5nSSc8RprheUJ8d5NQaLCXktVVOVUJD5n5veApIln8S5u++Phr/7u2V6kQzrBNp7yb@lists.infradead.org
X-Gm-Message-State: AOJu0YwhAQ2/IdeXUknyqbgSrAhJ1dhu3DZJW8BuAIEihdIFC1VPPw2p
	dA5lVSx5livE9GNTfYXr+9TpFSZLzAk8nWEFe7Pjqoif7nsL4RfxoqICz4EWEtRhlUHFlLgs8Fm
	fisFmOLdkVO9x4qQ6XQihCOfZ5O49uto=
X-Received: by 2002:a05:620a:3728:b0:915:b852:4361 with SMTP id
 af79cd13be357-936b3a7e00cmr113938785a.20.1786492982920; Tue, 11 Aug 2026
 17:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <56e974b384ffbb3f8b424e7c69da3f702f87f2f8.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <56e974b384ffbb3f8b424e7c69da3f702f87f2f8.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 17:02:51 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6EHzoqmHExDiUXSm0MmFH-PLdV8GNYCUNJA9xfj=hkkA@mail.gmail.com>
X-Gm-Features: AUfX_myU79kwtA8KLOeDN0dTNn1aonfc4LkMsrlHzwmFWelV0XLc1lXPl_idklo
Message-ID: <CAPhsuW6EHzoqmHExDiUXSm0MmFH-PLdV8GNYCUNJA9xfj=hkkA@mail.gmail.com>
Subject: Re: [PATCH v4 22/22] klp-build: Add arm64 syscall patching macro
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
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

On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> Add arm64 support for KLP_SYSCALL_DEFINEx(), mirroring the arm64
> __SYSCALL_DEFINEx() pattern from arch/arm64/include/asm/syscall_wrapper.h=
.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

