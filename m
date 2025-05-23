Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FCEC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWCE6jqKFyONnv3rqRo5aIekZYBw6AYzIcZy4RKLG3w=; b=3dN3BuwcBiZapx5eCTKQxpZsnO
	EGRrwdPwxNZ4QXXKq56qpX5U9AasRyfECcBVNqGDZeiuD9d7nnqOuYjEaqUISN4xgCNVu11iXFRXD
	Sj6sIpTDDvMsJJCuDhYiW348S0i/YzC3QH6r+qonYqZaShkJUUu9muAC6BDyxe7iSr78MJXzyFXzf
	NutQg5nqn3etnadG/om4/5PCEh/5Z+Fwsw0f0Iz1WXyZDbLPSGZnHJF+dzSMSuRF+BM9Gl5GEA2wZ
	6bG+d/YKcjuayG5rqJDcjoun3C/auVqrTRTr1Fd98p3zqAea7eq1V46uGSJW/mADbSbUutNe4MJcX
	33a3kPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUPh-00000004GN3-07sP;
	Fri, 23 May 2025 15:34:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU7n-00000004DpY-0u0i;
	Fri, 23 May 2025 15:15:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B52E5C5DCC;
	Fri, 23 May 2025 15:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C994AC4CEE9;
	Fri, 23 May 2025 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748013353;
	bh=XWCE6jqKFyONnv3rqRo5aIekZYBw6AYzIcZy4RKLG3w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=HX8ckC8AMTt3FFPZ5hRUKl69FZBqaXO6fLB2Y7SpVFP65PAO1kjsi8SJWon7Y8VAL
	 5AlZGipDmdwo6ASrUJHjlZWt23IWVhtZ8w28sd2J+3k/5KL0Ds5/1Kd8fX92L9NeSK
	 djeiHI1ul7E3zdbl/W4YgmZQN1kHFHTDKeqsu/HEEZ+Cnkla1/YwztmITvG8ynuDgE
	 JgYg8/t8HUSDfYIDhxSbHCCufsrGiAF7Z4dT97PjU3++rt/osFUnAzdC53SPsceP8v
	 LTwB//5TEGvRiD/yhKtzXkNNBxvtdGzOsRy/8HOt85jlnfIqIfWPNhzlqEZfOF+w9l
	 PDqA51dZv9e7g==
Date: Fri, 23 May 2025 08:15:49 -0700
From: Kees Cook <kees@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline mismatches
User-Agent: K-9 Mail for Android
In-Reply-To: <e50abba6c962772c73342bacf20fb87dc99dd542.camel@linux.ibm.com>
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-8-kees@kernel.org> <e50abba6c962772c73342bacf20fb87dc99dd542.camel@linux.ibm.com>
Message-ID: <6E407BC0-4D84-4420-AE07-EF85EBA1AB1C@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_081555_295151_6E567CBC 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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



On May 22, 2025 10:24:30 PM PDT, Andrew Donnellan <ajd@linux=2Eibm=2Ecom> =
wrote:
>On Thu, 2025-05-22 at 21:39 -0700, Kees Cook wrote:
>> When KCOV is enabled all functions get instrumented, unless
>> the __no_sanitize_coverage attribute is used=2E To prepare for
>> __no_sanitize_coverage being applied to __init functions, we have to
>> handle differences in how GCC's inline optimizations get resolved=2E
>> For
>> s390 this requires forcing a couple functions to be inline with
>
>I assume you mean powerpc here, though I'm sure my employer is happy
>that you're at least confusing us with IBM's other architecture :)

Whoops! Yes=2E Paste-o on my part=2E The rest of the sentence was updated =
correctly though=2E :)

--=20
Kees Cook

