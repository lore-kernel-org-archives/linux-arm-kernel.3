Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C1103E2F4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBhhGMjdEf/AAt0r3NS/ftcYplPTotkFnhvNtKj38Dc=; b=jzvn93weL4dmLVYK1BU8v2nkD6
	j4zeR9e9xycPZ4PZmYH9VPDJfvlMmm+nHarv6pcrT9fAzOg57qb6YhsvzFBpOCTZBGIib0VTUg01M
	d3isexhi8ZuAEvosSqlrbuRjgIFlSQ+cmxPwaMg/26ep8gD7uZ4k4zjZrlnxFiInIefIeec2QBhJU
	4KIPlkEwjDbC9DJi8Qq2LySaBHpv4V4tNcV8O/anPBRlIkmY5hde2kKDP4GbFHQMe85G9q3fcAp5U
	DNB2ybV3QF9/kJw+G8f31DoSwKUrHt+2mpqvHGIsJ4BTFdNSBlN6Euu25j4R0axtmN1Pevt/ig78u
	pnuIt/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SjB-0000000Clc0-1iQv;
	Wed, 11 Mar 2026 23:12:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Sj8-0000000ClbZ-0QDS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2983A60137
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED8EC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270748;
	bh=xBhhGMjdEf/AAt0r3NS/ftcYplPTotkFnhvNtKj38Dc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SDlYxToegILB0SYrOCc9jqf/1RSBM4kCZYiywc+yvo0PxI9+RoNVAj4DlNa1M9zdB
	 JbiAisvkKUu68Ptozo7g6RizpbFSvjrmMFpld5ALPXF7+yyyIDX2bUTprJt4loOx7+
	 u3G0/XvR9BIBs9Fk2Ushkpq6aiaE2LdV5eKw/8SWlwEFZngnNOBFpob3QlRRb/Ugnn
	 Djq8L3fVTWRa/Nk63f0GEHpyX0H322Wc4iQn3RS7lOcxLv6Cf4IkppS38WcrUmiyaS
	 LktWjYOxwGRLPUXVkm2vT7D9l1/GGrQtV8gLLsgmjOgJyvbR5tFCMTHxvPFBvqG4QU
	 be8ruiHRA6iVw==
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-509134ab2d2so3730721cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxiQwVWM1a6GeKK3Xi88z7ajmASSIvZ3KSYUUlyPIvkz4WIdf5vK7yL+66FnUA6FQCtMVtUfV2i6bluBBmqhsd@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZEzhtEiXSlCVefXev+M/0An2B3vdt3KmeMts7SUeGEaG7sVP
	GE2KJL7+ly3aRUwwYlAAsA94g6Lof+oOp4fn6TcVN1/SBAqmoIGRZEslWHTCb39sRDOrnZNH0SY
	/vhyzSdd1Va2TloWpOTVXi08jwQW/je0=
X-Received: by 2002:ac8:508:0:b0:509:456b:52e7 with SMTP id
 d75a77b69052e-509456b85c9mr21498081cf.16.1773270747795; Wed, 11 Mar 2026
 16:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <2fa6fbde8c6bbd91df0e2bf48b9c9370047dc61e.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <2fa6fbde8c6bbd91df0e2bf48b9c9370047dc61e.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:12:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6-Jeppuw-3dCnS=a31p6uwdQfvW-CDURXh9eyEwHPBUg@mail.gmail.com>
X-Gm-Features: AaiRm52rdNhb-OMPbVu7A6BSy4A_BsoV676rdnM-RkVREh6ybLEJlmVinm4_0hk
Message-ID: <CAPhsuW6-Jeppuw-3dCnS=a31p6uwdQfvW-CDURXh9eyEwHPBUg@mail.gmail.com>
Subject: Re: [PATCH 03/14] arm64: Annotate intra-function calls
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
> In preparation for enabling objtool on arm64, annotate intra-function
> calls.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

