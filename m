Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F9FD0078
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 21:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylRWWUwK5o3MfEB7pGrnKLZH79m/zlgSbzMzkIBZ2EE=; b=QDrZlzcT+Lkc+vYj4aZGli+mM4
	Kk05F+pdaFeBhzk41B1NCkLyw/TfGBoSfC/DY0UIonuE/MwC6XTEewWEvb+BvePmmKdZ38LeHpg5e
	r/TlU0zYgJtCycvFOKH4wLIrfQfHlwWoACK/d3j/oZI8FxXklzRfiXlD2qViq+OmTv3BpK+Cwe8Gg
	mhjg78OmyDlzJqyDe3ihepSJ+uBhSrr9kObO/on5Ks+ux5p6w2NeF9KRW0NeqQ2l16obxJGXS4RW/
	5Wu92XiAFoV9iyemkZGU0in4cyO3U8TMAVbG/yA3VtzebQRdxRn6N/r7J94sT5lOCYz0SmuFRj51Y
	rVNWJVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwoin-0000000Bv3p-1SER;
	Sun, 01 Mar 2026 21:53:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwoij-0000000Bv2J-49PS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 21:53:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso940837f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 13:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401979; x=1773006779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylRWWUwK5o3MfEB7pGrnKLZH79m/zlgSbzMzkIBZ2EE=;
        b=Mf7GEGpl2sJ/aJ/tW/rsyiwz3fYxiYDl4oU/INxImjoMqoRSJAjfPMHvU5fPg7Y39g
         Rjedm7e4L64zUPINM5pzlxCjdu6hypUThV1d7sHMxj+i3w6wts0rRCUj7cij+x9UNO58
         i5RQ1nfs3XnYxcrF0a8Ze2nVZUHkNchLQtzGfjm1sqS+uwuL/57rpzef/NO3SYdaOQEp
         hZRi4XqcypMBUKeSUm4/3qcgVSn7+2c5sIiR/TMGssPEosV18bEQCVvkvMl1upExh2UA
         Vjs4sU465bMrl4GK+O6OBAEeDrP24+6aDGOhzzrxDbiMXJ7RNZhryehPVNwVI3ewFQDs
         WzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401979; x=1773006779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ylRWWUwK5o3MfEB7pGrnKLZH79m/zlgSbzMzkIBZ2EE=;
        b=ZkFwnM/RazyFXRrJxi4PgTx4y/QhKjEIkVrAjNo0pwMUVLmYJZLqFjj1bYE6v1aE/o
         waHA+GfdeljEJqDFaFAgPMPVqnbCY2FQWrHFoOOXMUT22uJA0ZZaHTRlDHGpvPzvvXW5
         auMq6We3E3nNyNurSWiudca+tOt8e7EH1i/+z5l3ruN0d5EZj/UucGxxh1fbqjboizu/
         jDHtRHAzxXwbTJIrCZMDFZQE5wDkZeDmmeINx4S4b7lsTKuFkB6bLcCFbET4mtvPuFM+
         JjqkSynDVDNOnBEZVYZQOpHv4nsr6xTNC3BqGRVleqi19rLM2PdESAmlNQJyEuF34C7R
         vHXA==
X-Forwarded-Encrypted: i=1; AJvYcCUyrg5T0nGFnVFmeTytO6taAd2Psg4nmCbp+0xN9q2yI0HM5SyvfVDabAdDPExMhMpiOzxkXoBCnRxWnUEV30g0@lists.infradead.org
X-Gm-Message-State: AOJu0YwNHQ3XndBza6V0bkiDXvkE/s8i3RQrCh2IAptNeX3ehPTBe/P3
	mUaIjMeBOas+BYZGAL1zPFi08cQswrg1DiyDjDPtSDGAK1kwhyxc4QuP
X-Gm-Gg: ATEYQzwE2pAEe0O2lxyTg1EXmLbcM2wjKaiopUSghVgQ6ONSSgEvmSVCsDGgcqfvMLT
	wiNLsPsNiLhSGPwvCOzcXTwGNOJUUrC6LyfXqhz8mX3it8lMezpk2/bUvDWHQcCaUn/oWlXVmbk
	7AAaYQ3tDlcjnOWlTkxUslO0FtDs4Wwh4DC+vMfjmb0vobmtquU1HXR0Vs78qAtHWMfMC2N+TB6
	kyTybz4wYDHBZxJBKnf30864zyClVjk+psMOfxeyx0Tpk6ilXgUKlTh//s0gYQ8EtgPzztoQXrC
	W1FaprhJY7c0sYLfvx/x/CxfX6t1rgQcj8Gq4Eq8Ks0sDfe4iaWdKR5OUPzRIF70lhKB4eIylsk
	kLl0mWzDKp4E2QRduSH0ApTgUWZjiD35wxz8Oe+w7rChheoKtUWvlnsI5ByqtPpzhV1455G+oSJ
	veSvxOHQVWR3vbfe10R6k7xokYQdrP0bPjTyevPB5LPW/hd+vdzso4UWT+XpW1Snm3BPN+wjZk1
	28=
X-Received: by 2002:a5d:588f:0:b0:439:afd8:6235 with SMTP id ffacd0b85a97d-439afd86565mr5809623f8f.18.1772401979049;
        Sun, 01 Mar 2026 13:52:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm61132f8f.27.2026.03.01.13.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:52:58 -0800 (PST)
Date: Sun, 1 Mar 2026 21:52:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML
 <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Andre Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] uaccess: Fix build of scoped user access with const
 pointer
Message-ID: <20260301215257.7bdad5f1@pumpkin>
In-Reply-To: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_135302_066059_B6FE507C 
X-CRM114-Status: GOOD (  23.20  )
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

On Sun,  1 Mar 2026 20:33:58 +0100
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> After converting powerpc checksum wrappers to scoped user access,
> following build failure happens:
> 
> 	  CC      arch/powerpc/lib/checksum_wrappers.o
> 	In file included from arch/powerpc/lib/checksum_wrappers.c:12:
> 	arch/powerpc/lib/checksum_wrappers.c: In function 'csum_and_copy_from_user':
> 	./include/linux/uaccess.h:691:1: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
> 	  691 | ({                                                                      \
> 	      | ^
> 	./include/linux/uaccess.h:755:37: note: in expansion of macro '__scoped_user_access_begin'
> 	  755 |         for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
> 	      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 	./include/linux/uaccess.h:770:9: note: in expansion of macro '__scoped_user_access'
> 	  770 |         __scoped_user_access(read, usrc, size, elbl)
> 	      |         ^~~~~~~~~~~~~~~~~~~~
> 	arch/powerpc/lib/checksum_wrappers.c:17:9: note: in expansion of macro 'scoped_user_read_access_size'
> 	   17 |         scoped_user_read_access_size(src, len, efault)
> 	      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Cast __scoped_user_access_begin() to (void __user *) to fix it.

I posted a patch to fix this in december, I'll find it and resend it.

	David

> 
> Fixes: e497310b4ffb ("uaccess: Provide scoped user access regions")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
> Thomas, I encountered this problem while preparing some patches to start using
> scope user access widely on powerpc in order to benefit more from masked user
> access. Can you make this patch go into 7.0 as a fix in order avoid dependency
> on this change when we start using scoped user access ?
> 
>  include/linux/uaccess.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 1f3804245c06..5d9f6d45d301 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -752,7 +752,8 @@ USER_ACCESS_GUARD(rw)
>   */
>  #define __scoped_user_access(mode, uptr, size, elbl)					\
>  for (bool done = false; !done; done = true)						\
> -	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
> +	for (void __user *_tmpptr = (void __user *)					\
> +				    __scoped_user_access_begin(mode, uptr, size, elbl); \
>  	     !done; done = true)							\
>  		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
>  			/* Force modified pointer usage within the scope */		\


