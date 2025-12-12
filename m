Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D1DD43369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=; b=y/xvZaI3yg7hv/LTWM/nXJGOcG
	dxx7snHOZdss5x+kkvxtPfVauKCsjw5tm608JeASCF0qK46Wv/vkNG1QbXxgb+34u2zXDJK89E7Vw
	z1je+MKM8ju3rLzVixESUjqwZYupO/LyM7J4CsIXea7rdog5103jz25G66p5AZi6DYyRN++cVsd6t
	HlM1vJSfP+Ty5Mrk0fMrptDssDpEeAmlLRSR0TrU0MghCs3PeR1cs9GbQ1hZkg3s1oYkMWXh2bl57
	lC8eXpiKqH0F3I/tQsUJD2goGxfv+3YR3Jc7FGGOO0Y9y/n9I9bh4v7VBYYuAG2wr7x4NEu1ofcDT
	uuszpfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtww-000000001Xy-2IU8;
	Fri, 12 Dec 2025 03:36:10 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtws-000000001X6-3fXO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 03:36:09 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7355f6ef12so140803666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 19:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1765510564; x=1766115364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=;
        b=M0FHzCa4LOY7ZaQgAv10P5bReSkWCvNX+zZdoBkpYLyEjLVxizvdyXEjM6QY7PheLZ
         B0PriJwWe+94E83Eae79lnv/a2zK2E/e6FeBfLFTtwaYOilv++rgDL6ES5bIkznhNBEg
         jkAAPDh1HMhm/DYYRUuQxXzvRB+7m/woL3uqeNYjkxnK3WXsVXFfaaZ/BuNsAH22C5SR
         95gNsOjjzUrU4Nbgfq0IvtNz35apVHnDfj1PADJ62JU/XX27CqwpLqrvp99/gJC5pMPH
         /JsZWzAXla8fzRWx7DUy/RbWI5wo15oT6/xrHU6vD46LFRBZ17xLZQdLP2pr86K4uAVf
         UGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765510564; x=1766115364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=;
        b=lMj1kZqarb1/Ob7n5BhCHjBSMrT0E93rF/HJ1GKzB8LryYvTHqDamaL65hanMov633
         6bFE3lImxPSNOuJ5uB8RY7Pc6pHVW38bmYEAeeGo2i9Xkq9y5KAVcdBpzDp4MDgI+blo
         5nhGGIoqarTL440PNx3tdS+UsVOJ09etgh0osG+vqG8FlnkMOK40alO0SnRCw5Vbx+os
         eqvST3xqq0EBI4wuyp+c/Lx5SUw9OThhve6fLoQlWup++QjGaOVtpvBXcXIey9F0fucS
         VfILodP1RV7pKtVU3jBNt6T2alC8CMG5WOBccDERK0TIBS0d6b9FYVz/5bzp7BGUGzUs
         wwlA==
X-Forwarded-Encrypted: i=1; AJvYcCXWrMb1xUMYR23PiJKjW5/FGdvPfYRzTv3jq6anSf+/RtWqTZH1O9Ppr6OEPws69hbO6jyOz3ogLHBSqwQpivss@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3/8u3Yn9Dt9H79nhKXteUVWDv+cBFDQhQDpzcgCbo140JptJy
	b727NukYOQlQrqXmr2IMrJ6dROozFOYoP83EY6zmhDQS4BiqXoTq90a3B+U3/jFm+8KGSKqus4j
	cQ602M6FZtdbxsxmVd+QsuSsLjajlVJl2thi9BSEOeiXBEB6FcaLryMk=
X-Gm-Gg: AY/fxX5LCfo3BcWLOyUcVtRXBcREHsbhjoMVO0QlMtf7EsUnaf9P//GnwO+1TCb9yvT
	aadyHbNTPJCj3dUOHyHq8izVJvkubp+UJGU8ozWmacIcwQEYXmsTwIo7bQ6B1c4QodkAnTxwP3o
	biAsyW340ArlUp4nw8Tv9key1koECX68K+6w47oKdJTK+0ykClynlOYKQpuknxITox8xVaKkek4
	V5H+0F8KHD1q6eD4bDX8uZChk1klKxQROCjNkLsVF0JsUqUXb73ksFs3w8BbG5vP/LLNB027W1H
	tQ7UGU6qYLIpUJdIadSMG6z7a22H+g==
X-Google-Smtp-Source: AGHT+IES7BBbTn7tqCPfnDPHjSNdpqaXrpbRG6DqnnJ1DEXLbtMv8wmJUtOWcZP/vd9EsPmBwealpv5uJAbWVaKwNko=
X-Received: by 2002:a17:906:794f:b0:b72:8489:7e65 with SMTP id
 a640c23a62f3a-b7d23c1e339mr40812866b.31.1765510564545; Thu, 11 Dec 2025
 19:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20250909091335.183439-1-ajd@linux.ibm.com> <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
 <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
In-Reply-To: <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 12 Dec 2025 12:35:27 +0900
X-Gm-Features: AQt7F2oPlCrCn0vgeBqPFjk6oJGdLPXS9LGfuM7Cqn1iLUHRy15krGx13xCnA8U
Message-ID: <CA+CK2bDDZi0TR9fhAuKpxz+XJU6-rOS_iM-akU=oTb5wVoVxMQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	sweettea-kernel@dorminy.me, nicholas@linux.ibm.com, 
	christophe.leroy@csgroup.eu, alexghiti@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_193606_930311_59BCE6A5 
X-CRM114-Status: GOOD (  22.43  )
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

On Fri, Sep 26, 2025 at 8:17=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 26 Sep 2025 08:42:35 +1000 Andrew Donnellan <ajd@linux.ibm.com> w=
rote:
>
> > On Tue, 2025-09-09 at 19:13 +1000, Andrew Donnellan wrote:
> > > Support page table check on all PowerPC platforms. This works by seri=
alising
> > > assignments, reassignments and clears of page table entries at each l=
evel in
> > > order to ensure that anonymous mappings have at most one writable con=
sumer,
> > > and likewise that file-backed mappings are not simultaneously also an=
onymous
> > > mappings.
> > >
> > > In order to support this infrastructure, a number of helpers or stubs=
 must be
> > > defined or updated for all powerpc platforms. Additionally, we separa=
te
> > > set_pte_at() and set_pte_at_unchecked(), to allow for internal, unins=
trumented
> > > mappings.
> > >
> > > On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible=
_page()
> > > requires the address. We revert previous changes that removed the add=
ress
> > > parameter from various interfaces, and add it to some other interface=
s,
> > > in order to allow this.
> > >
> > > Note that on 32 bit systems with CONFIG_KFENCE=3Dy, you need [0] to a=
void
> > > possible failures in init code (this is a code patching/static keys i=
ssue,
> > > which was discovered by a user testing this series but isn't a bug in=
 page
> > > table check).
> > >
> > > (This series was initially written by Rohan McLure, who has left IBM =
and
> > > is no longer working on powerpc.)
> >
> > Is this likely to make it in in time for 6.18, or should I respin it po=
st merge
> > window?
>
> The latter, please.

Andrew Donnelan, looks like the merge window missed again, could you
please re-send this series so we could get it into 6.20?

Thank you,
Pasha

