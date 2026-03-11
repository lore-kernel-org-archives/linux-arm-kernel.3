Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FAE103E2F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVRZT73DzW3h/nfd2QjnKlzGuYI8a36udbVNYek+AXk=; b=VUkkhnkERglgWG/xUOW+0MuxQb
	nlxEdT2rYYOGxBL/657JOQ4QKQ0JziKaqznu/dpLXRJMsYY93RqygK57saKzdcXcr5Vg3zImhVuvB
	JLSFxsnn7Bojq5uHyaDfqNCF6wgr1ggUrSugOgFP8SZi6svHdM6vetKvlGmIWCz9MY3Arz5bhlzkr
	YGKj7PljtcbEadxKd4Ju71e1DOLikeJptcLdrPe3e5DKrhmnXs08N0rszgn57Bvt/zZxzm3Z0IjpF
	92x/nXTxxQJiml9jAENMKwIh41E3LXKI8L1MnCiTB5VZtNEIcHJb9CBOE0neqBsDPyDka1Q7EygEU
	OrD3a99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Sl1-0000000CmDk-0HuU;
	Wed, 11 Mar 2026 23:14:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Skw-0000000CmBl-3V06
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 465AD60145
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D4EC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270861;
	bh=xjrAc3qmId1a2v9e00uKv43/2Twl2eGTpfjvSlvf8go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XwKwXLr+68Bkt2J0nDWHpAD2Gm506XyOlKJEfbrXqs6AlhVJ+M+6Cz2VT9fd/Wq/X
	 03t9uYksFdQZyAqVdyJRx2aDhpL2gzEckiPeQyHT6nbOb5UySp0Ee1c6zuOoe5HMYd
	 Ni1xjaQ1Xe2cOjhsOhHtsxr94dste5XooGrGykMKARPCvwaD/UVWzNuzZhwkyt2pbu
	 FdW0N0oPPpCntzY9cJuIcBXEOiza7f+OWV/kHxMy6d3118PQ6S5EVhyQV/SFBZXj2k
	 ABif4Xrc2ktcZ4lXDqjyQuxkuI0JS/u8ZIbkV39ojxyRo36br2FlBW7T9U+gJFj77V
	 dcFBWZ5bBGp+Q==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89a6e6225e4so4928146d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:14:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVY2MB8xZVn0DqPvYCUYFRzNVZf3PCMdUaBSuaJXlqTOsAsWD/asbU6/SpfxwILKp2cYsEcE6WxrYNn7tpQ4yNZ@lists.infradead.org
X-Gm-Message-State: AOJu0YykbEMztnDzZYWxHXAaVcfuA4nH2IJ8fZnkkVq4t3oUoHeuvRCK
	4CbzdHRD2pEWKlDJeJtsv0RU8uFV+mLW/SBZ27qiaEIkMMQ6RGSXaIymWzgTmnnuTcUMtIQZlR+
	HiEglrXi9qQHB99HchchO4rdWg+wAOc8=
X-Received: by 2002:a05:6214:d8c:b0:89a:4e3:aa3a with SMTP id
 6a1803df08f44-89a66a14d4cmr62957826d6.28.1773270861124; Wed, 11 Mar 2026
 16:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <1af3deb308fd59086b63690c1e7b53586ba3c5e7.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <1af3deb308fd59086b63690c1e7b53586ba3c5e7.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:14:09 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Rkfj8XGZJnDb38sLaAMv=+dEjXaEm1oGG8OiZe8U96w@mail.gmail.com>
X-Gm-Features: AaiRm52SG38bxq2YdjNi5QYWzZEPiXxfjKoBoY-Ep8HQxEshw-prsY3revpgMhk
Message-ID: <CAPhsuW5Rkfj8XGZJnDb38sLaAMv=+dEjXaEm1oGG8OiZe8U96w@mail.gmail.com>
Subject: Re: [PATCH 11/14] objtool: Allow empty alternatives
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
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

On Wed, Mar 4, 2026 at 7:31=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> arm64 can have empty alternatives, which are effectively no-ops.  Ignore
> them.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

