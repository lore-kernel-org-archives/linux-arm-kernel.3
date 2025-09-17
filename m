Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3373DCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DeNgzPX6ggMfk3MAISgLOKpvtvUWXdjB1QYEHlkKms=; b=wf2/6gC/olDcE2clINrhw5v/HY
	RdKr+lVTYF2vEnzGoT1zbBMIqhrzXTNxovuGgiO48TufXw3XI13ZQY88464rCN7jWfHu8gFn80jR+
	n+/19dFZemxEGhwWJdu/T25bSciHIUi1X1HY24r5Cuc+LzHp3HJW7w4ylhECdkYuzC2ilFhiinhCl
	YKwbcnBs0IX1Lua+xGdDEwMZZHNmf/7bwG9dKe423PCBODh24ktmOz9fp5OXXiNUBVd6yx+9DU4Nr
	gq5mWk5UhIzXxgksvbTm8gY2aH5aEnz0RjgoC2ovNZuo+00T16XliXMB/eJzMVrACQ92qvKSHH1No
	tpHdguMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv5f-0000000DCYq-3aGx;
	Wed, 17 Sep 2025 16:33:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv5f-0000000DCYe-1t6v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84FE16023D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 16:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F180C4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758126786;
	bh=kKL/L+I3zsHPh3CySBs0NwNoG6xv18j00aP3GrBEXns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=byficK7SMdbNqCt8qDue6jkVGfFA0zVMGLz2oN3p5iX8uF2YDd0q1otjKJ3U6DuUF
	 Q1EqSfdTH4wxw/rize5/jH+qnxrqDt/2s0uFKKbeMo+P1qdN779Dk65VMBLwpDWU1y
	 8nl7Fr5JUF16RyRALwfBhoXD7ZVQDLUpkXSzPn7T672mmBwbhpyXIV/phkiiVdCR5m
	 NVg2liqXJqIButavkSTYgzr1iKgQKMvoGjnIhQ2NFo0yFidl6Sw7spTXQLGTSyVDAM
	 qCBBVv0k0dAu33msshV4jLPy87V7RDYFc/vXZ2z9636k4fU9ojG392koy51HWdxk+D
	 mVxqp5LbWSEog==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-56088927dcbso12162e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 09:33:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdMrcqbvrfu4Z0xfWAH+7faOFKSZjm403heneDtzv36d0DIY7vD8Qgd+TJS2aV34lmW8QfAfL50mql08dTP/HH@lists.infradead.org
X-Gm-Message-State: AOJu0YzDByvATAUUGls0HuR/Ps8ume/v5PQTm6BXayzFsyFfVOTpa2Sj
	5v7YEOHfSC1kyV/4JKsCKjvkxTEQsFrgosXyUyq/23cJtw04w4tZ0LHNI+X6im/qe3ek0rSUrJx
	K1UZrENOF4wpEsvFijHhqbU0bIf3x9h4=
X-Google-Smtp-Source: AGHT+IGkxd8CfmvOgxOlzUd2WBWMRN3KAVklJLyRUEqXRjAdq6Oylda7wBiSlm11ND9H/fuMGe8uQFz5PDqzdmmiqH8=
X-Received: by 2002:a05:6512:4601:b0:569:a257:acca with SMTP id
 2adb3069b0e04-5779b9bec2emr837666e87.32.1758126784374; Wed, 17 Sep 2025
 09:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250915160819.140019-1-ebiggers@kernel.org> <20250917153529.GA45754@quark>
In-Reply-To: <20250917153529.GA45754@quark>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Sep 2025 18:32:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGWZ5iVjOq_wPihCvSrPzg84up2uc85b04-kogr06zr-g@mail.gmail.com>
X-Gm-Features: AS18NWDKkMpHMPVrfCSxPSR1GAt9QZdsUGm2zA3q8XBTy6lhROgcqYD7BkYXAg4
Message-ID: <CAMj1kXGWZ5iVjOq_wPihCvSrPzg84up2uc85b04-kogr06zr-g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Optimize fsverity using 2-way interleaved SHA-256 hashing
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Mikulas Patocka <mpatocka@redhat.com>, 
	linux-arm-kernel@lists.infradead.org
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

On Wed, 17 Sept 2025 at 17:35, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Sep 15, 2025 at 11:08:13AM -0500, Eric Biggers wrote:
> > This series is targeting libcrypto-next.  It can also be retrieved from:
> >
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256_finup_2x-v2
> >
> > This series adds support for 2-way interleaved SHA-256 hashing to
> > lib/crypto/, implements it for arm64 and x86_64, and makes fsverity use
> > it.  This significantly improves fsverity performance on many CPUs.
> >
> > Later patches will make dm-verity use this optimization as well.
> >
> > Changed in v2:
> > - Made the new arm64 assembly compatible with CONFIG_CPU_BIG_ENDIAN=y.
> > - Omitted sha256_finup_2x() from pre-boot environments.
> > - Made alloc_guarded_buf() assert that the allocation succeeded.
> > - Minor tweaks to comments and whitespace.
> >
> > Eric Biggers (6):
> >   lib/crypto: sha256: Add support for 2-way interleaved hashing
> >   lib/crypto: arm64/sha256: Add support for 2-way interleaved hashing
> >   lib/crypto: x86/sha256: Add support for 2-way interleaved hashing
> >   lib/crypto: tests: Add tests and benchmark for sha256_finup_2x()
> >   fsverity: Remove inode parameter from fsverity_hash_block()
> >   fsverity: Use 2-way interleaved SHA-256 hashing when supported
> >
> >  fs/verity/enable.c              |  12 +-
> >  fs/verity/fsverity_private.h    |   2 +-
> >  fs/verity/hash_algs.c           |   3 +-
> >  fs/verity/verify.c              | 175 ++++++++++++---
> >  include/crypto/sha2.h           |  28 +++
> >  lib/crypto/arm64/sha256-ce.S    | 284 +++++++++++++++++++++++-
> >  lib/crypto/arm64/sha256.h       |  37 ++++
> >  lib/crypto/sha256.c             |  71 +++++-
> >  lib/crypto/tests/sha256_kunit.c | 184 ++++++++++++++++
> >  lib/crypto/x86/sha256-ni-asm.S  | 368 ++++++++++++++++++++++++++++++++
> >  lib/crypto/x86/sha256.h         |  39 ++++
> >  11 files changed, 1147 insertions(+), 56 deletions(-)
>
> FYI, applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
>
> I decided to use the fsverity tree instead of the libcrypto one.  There
> are no dependencies on other libcrypto changes for 6.18, and this makes
> it easier to do a separate pull request.
>
> Also, as always, reviews and acks would be appreciated!  Note that I
> dropped the reviews and acks that were on the original crypto_shash
> version from earlier this year, due to changes in the patches.  The
> high-level idea is still the same, though.  If people could
> re-review/ack this latest version, that would be great.  Thanks,
>

I looked at this the other day but forgot to reply.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

Happy to see that this finally landed!

