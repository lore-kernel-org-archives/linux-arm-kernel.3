Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F1D6E2D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=; b=Mh5tunt/+msYvaU16akgw8ZC/R
	OnZ/CCPj1Cfg/2ZmPEALf2bzMOTMngG1IOgD7504nEPLXJJtbZ9KF4/YCmP9Wcf92e88TrGWD0M7I
	/UGoTMUlJ9lryI5UmhnnM0eWzegps/d8mb7zxDwKJGj9RNDCZ/mre13tlLaYc1QmdFJVNt9QqSVBp
	j3MkViZB4EO8uRkTCDyqoHY2vgBISL6BVgKjjuFCnVdO192VhbdK8S7KstohrOw2nkfklXw1RpU8W
	7g8i1ytwKL6c/FCGD8fxxnJNMAwq6l05faMIkGdJHs2iETe8nWIfDX3elP1Iy2JnzYf7hma/XXRVI
	6bHXU+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIEl-00000008xVL-0XrB;
	Thu, 18 Dec 2025 17:56:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIEi-00000008xUP-0jPG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 17:56:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so1723663a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080582; x=1766685382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=;
        b=OAMNaSR5+fXiVt3rQ/qEmP4SqerCNxvRKoeA1cqLpdLZAoRxxi8/7GtSYYuJQmDfBM
         xmx/ODJRD2xUIxsP7JioIK3C2dx4OnDPhh2d71Oiyj9QMv2bIcknlMoInr9awrtXGYU0
         3YDldOpZZGbB8DOtSFolwxWIHmtd8HARV9cxrKyaC9odrCf+DoeZ2j3eyiXsfn1GlBkD
         4erHuQJvEjZmjNz1Ya/eWP3o7KUoJQ9+mm2kCGM6vWyPLttoAtjUk+jtRR/NRXVkoA9R
         6Ui5SWuWuEzGAB81stVVVVL7mJslqWjaAk5lvA7q7UQEdbv6jjGjiFJ7U86G7HUP8qQ9
         AiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080582; x=1766685382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=;
        b=YsKH9son/CmMIiAzZZFyifDcz3twpYQIQQ9NA9IDday3HcvPEQa/WLGPxZ23Gjih04
         zeKklkvY2A15UPWobpVhHGryMRcuIgQ+ECJAyXM0ZcYmRS8300raJSPheNVZhNPiM7eX
         4OoIp8uDwaUQwiQ+BAdi3aQpQihh6j/BFTtfCKZ6Sk34p3j410xwW0e6/PPr6SOTZjbN
         9hcWYHwvmlx5LGoBi1BotWd21HGmh3HsqeFWbZK3Y9ICnBRm/77LieDyTnA+OWIXt1P5
         T+iKmifq5J7SIH88Wn7av8RkgxiMUkSroGaY51oWWlS5z8pSZVNqHSnu4vl+WC7uz6KJ
         YXfg==
X-Forwarded-Encrypted: i=1; AJvYcCVrm9BJeASbxTwkCeRaeh+3Tdr744a1/3j/3cR8QsBcl4Euof0ImbyOhJNDWKmt2bFK/UP1uLm1Gr3W+OseFztV@lists.infradead.org
X-Gm-Message-State: AOJu0YyU5YiLkPI7Kai9JC3Bnv1x0O4Q9gEIOU6hzQotXw9fzUxUdhFk
	SflkIM3kR9BLfD3sLvl55jiwQfoFN5NlOEv+M8Qtix3eBlLwpAoe5KRxW1v3Zis1DCjYPMyZllJ
	ikt83scWi6oWx4LU5oASa2i0KDIPodDm8OEaOUPTRVQ==
X-Gm-Gg: AY/fxX69/1F20zOyDRuvGjagrwkMdGxa+O6kI0nslkkm5xV5FH/qfDb6KCRddLf3TKj
	AO3uELTiWD9vEKjRuSL1Im+7dcJlZgBddzmUgZ8cehFhgo7fUePhwqw0ovJdtO6uEr2K8OMyqnd
	nK+5QlTejcvUQLojpM+HHkBPFZH6f6Z2KtE8MSQ3+fLvAKEUPJkWyhBfa2TBXF0bZHClGxrCLgN
	l4Bz49+Qdg0w4oSnhp5C5RFaKN8iz7LyIFFAgG7mmCT+cXZttQ3iEaaJ1vxsKsulUWk1RJ1hes5
	CFYCosiuFKH/iYpJhAYQsnVd
X-Google-Smtp-Source: AGHT+IFq7ELTQKzF/TRk0SfbylhiIq5ob7abkvIiaiZCwA97lZgHawIVNTbXj5kEfVQ3oQIcBivxjmxKv95IDYu+mh0=
X-Received: by 2002:a05:6402:35c1:b0:649:e5be:1b4e with SMTP id
 4fb4d7f45d1cf-64b8e94d187mr222712a12.9.1766080582211; Thu, 18 Dec 2025
 09:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:55:45 -0500
X-Gm-Features: AQt7F2qjqHZAYpNwxuF-SUIUKVwppChumOkUsgRootjGM8dZ2yshNK1pTfmluNo
Message-ID: <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_095624_228968_BB32C45C 
X-CRM114-Status: GOOD (  21.88  )
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

On Thu, Dec 18, 2025 at 12:10=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.co=
m> wrote:
>
> [I will be leaving IBM in about a month from now, and will also be on lea=
ve
> for most of that time starting tomorrow. I've cc'd my personal email, whi=
ch
> I am going to use for any kernel development I do after I leave, and also
> Srish Srinivasan, who will be taking over some of my work.]
>
> Support page table check on PowerPC. Page table check tracks the usage of
> of page table entries at each level to ensure that anonymous mappings hav=
e
> at most one writable consumer, and likewise that file-backed mappings are
> not simultaneously also anonymous mappings.
>
> In order to support this infrastructure, a number of helpers or stubs mus=
t be
> defined or updated for all powerpc platforms. Additionally, we separate
> set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrum=
ented
> mappings.
>
> On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_pag=
e()
> requires the address. We revert previous changes that removed the address
> parameter from various interfaces, and add it to some other interfaces,
> in order to allow this.
>
> For now, we don't allow page table check alongside HUGETLB_PAGE, due to t=
he
> arch-specific complexity of set_huge_page_at(). (I'm sure I could figure
> this out, but I have to get this version on this list before I leave my j=
ob.)
>
> This series was initially written by Rohan McLure, who has left IBM and
> is no longer working on powerpc.
>
> v18:
>  * Rebase on mm-new
>  * Add instrumentation for pudp_invalidate()
>  * Add cleanup patch to use pte_advance_pfn()
>  * Move p{m,u}d_user_accessible_page() to a more sensible place in the co=
de
>  * Disable when HUGETLB_PAGE is enabled

Thank you. This series looks good to me.

Pasha

