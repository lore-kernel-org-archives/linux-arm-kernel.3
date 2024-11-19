Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54FBD6207F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwPBMZwWY6jHnSKaBzPlAhC7dfxBZhFkz57ZZP2TaXA=; b=skRl/kZueSsdqHVnapno9fMD0T
	ACRTgiuPY04SRk9nOmmAD+FOAz0k5Wvn+fwpOuTkGvMCsu8TtGyFLq7yiDE/r9au8EEERMiQuMMwN
	8tj1H6omde7E56TuFrMe8Zo8LG9qdyDW5ZZs3DwVaB+w1ss/CKM7NezJaxioIuFGbG54FXW31zNCj
	GXEj0L/dMCeFnYDDn7XRzbi30fZTO/Se9W26oziJA+VdcMg+oKBgYlMgWAKjaj22n86mNIZAx+yVS
	EmXl1tUqg/wzHl+XciwRYEPNV1DrYmI3Mag3HAxMHkGmkpzIjRDGNUR8fD/Ix3LVYNRxTRYX1WDeV
	GK9FFLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSKH-0000000DGRS-3qbs;
	Tue, 19 Nov 2024 17:47:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSJM-0000000DGEn-0kUl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 17:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4256C5C4B4D;
	Tue, 19 Nov 2024 17:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF441C4CECF;
	Tue, 19 Nov 2024 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732038407;
	bh=cGtCgxtTHF3Jbl8CduYT2IKTHC6lkZmDimREyxkO6Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2UCjFOf9RDujcsGXFkSgILPdDp2C8acwBMEtyau482WWnyiXTsgmeQk5nVGwjo1i
	 610w9HbKzBJMpKfxwrf/myk3hq5iWjkdG2poBltU2rXucE7Xkk3rR59lH3G60wwYVt
	 DoeV5kC3wKpi1dEUEWjZcuPKznWSEVjOlOyuVVQ43WKHAEaB8Qn4idItnNDyvR38YN
	 XUlL2+henqEhFtNCJSmOZuhsMzCztdQLbZyaHXZFYBVc2I3L2Y/19wCfOFzdzAxiKD
	 4kr/eGdcGRTVfAdDdOFDy7Fk89GN7FgH35PyStCaqETmgVhl0qGiTnX5ZP8h4g1uTi
	 x2rH1JZld25Qw==
Date: Tue, 19 Nov 2024 17:46:45 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
Message-ID: <20241119174645.GA3833976@google.com>
References: <20241117002244.105200-1-ebiggers@kernel.org>
 <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_094648_256428_2867C234 
X-CRM114-Status: GOOD (  11.04  )
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

On Tue, Nov 19, 2024 at 09:59:53AM +0100, Ard Biesheuvel wrote:
> > Eric Biggers (11):
> >   lib/crc-t10dif: stop wrapping the crypto API
> >   lib/crc-t10dif: add support for arch overrides
> >   crypto: crct10dif - expose arch-optimized lib function
> >   x86/crc-t10dif: expose CRC-T10DIF function through lib
> >   arm/crc-t10dif: expose CRC-T10DIF function through lib
> >   arm64/crc-t10dif: expose CRC-T10DIF function through lib
> >   powerpc/crc-t10dif: expose CRC-T10DIF function through lib
> >   lib/crc_kunit.c: add KUnit test suite for CRC library functions
> >   lib/crc32test: delete obsolete crc32test.c
> >   powerpc/crc: delete obsolete crc-vpmsum_test.c
> >   MAINTAINERS: add entry for CRC library
> >
> 
> Nice work. The shash API glue was particularly nasty, so good riddance.
> 
> For the series,
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> 
> Happy to take a R: or M: as well, if you need the help.

Thanks Ard.  I will add an R: entry for you in MAINTAINERS.

- Eric

