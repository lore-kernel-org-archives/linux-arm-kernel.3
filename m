Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA17ECA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtcin0LGddrGq1z73zXhBfHbevxSulJDQC2ODA9S4LA=; b=Q2PSXsx9DWHghIdV/q7tCIG9FP
	ePXFEx88fmrEqnMQ4BpK5A+yYyWLd7cD4hCv3i+9SpFe2GDfe/dpfFf/3x5e7HnzalK++TNBy4Hqd
	psI7CiGosp7JYpDKOjHW8X5sWD2Np/84vB1MKVSkMMc8u8zou7DLq6D5WwNoBrGmDz7H/uFvtr4AM
	GMa8+xNyX+eNOL8HMe6QLNcYSJ0QCcPW8HGKHY7pLCkof4ApL1KFDBRsDV1RHL9ny6uSrYNy++/2H
	XEkC8sLmiM6nYYmFMG4aQBbjA2jc7T8tyaGAhJtBYCWVdRRVkCl0eFhlE9oiZLTC15w/ivzusJ0o8
	OKU2nbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZYn-0000000B8vt-0DCG;
	Fri, 02 Oct 2026 09:28:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZYl-0000000B8va-2sOT;
	Fri, 02 Oct 2026 09:28:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C3DF60A70;
	Fri,  2 Oct 2026 09:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424F21F000FF;
	Fri,  2 Oct 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JXF9aYC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790933279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtcin0LGddrGq1z73zXhBfHbevxSulJDQC2ODA9S4LA=;
	b=JXF9aYC9WwUSK4dqsSbWZahQOF5tPs+qWfT6am7iM2kEiqJtJzCVxFzDeTv/m/a4MQVUpO
	GLRdB7QsZbpopzZdWvYR/SsEQbyfmCcXe2exUQZ5/eF4uZWlcciUWsy7qUj8Yd99apyea/
	uqdi3Lw+wZdB/dnq0RpegAZySOW8XXE=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 0f473697 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 2 Oct 2026 09:27:58 +0000 (UTC)
Date: Fri, 2 Oct 2026 11:27:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <ar95GsA9liO5Avn1@zx2c4.com>
References: <20260930133813.GA3142230@ax162>
 <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com>
 <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
 <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
 <ar4nD8aRH7wEvTMt@zx2c4.com>
 <20261001102059.GA4176271@ax162>
 <ar46ap4jzLWyP92C@zx2c4.com>
 <83a874fb-db66-4dc2-8e14-68c7e28ae27c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83a874fb-db66-4dc2-8e14-68c7e28ae27c@kernel.org>
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

On Fri, Oct 02, 2026 at 11:18:51AM +0200, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 01/10/2026 à 12:48, Jason A. Donenfeld a écrit :
> > On Thu, Oct 01, 2026 at 12:20:59PM +0200, Nathan Chancellor wrote:
> >> control. The change that introduced -max-store-memset only did it to
> >> "allow fine-tuning of the inlining threshold for performance analysis
> >> and optimization". If they decide to remove it for whatever reason,
> >> we're back to square one.
> > 
> > I suppose all the more reason to get -finline-stringops=memset added to
> > clang. Then the dual-default thing you came up with below will naturally
> > start choosing the first option when it becomes available.
> > 
> >> I know something like below would be uglier due to the ifdef but it
> >> would avoid changing anything for GCC while clearing up the issue at
> >> hand for clang in a guaranteed stable and succinct manner.
> > 
> > But then we're back to the byte-by-byte codegen that Christophe pointed
> > out.
> >   
> >> If that is not acceptable, something like the following does appear to
> >> work for me.
> > 
> > Okay, great, let's do that.
> > 
> > Does this commit seem okay with you? I used the diff you sent below and
> > adjusted the commit message: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.zx2c4.com%2Flinux-rng%2Fcommit%2F%3Fid%3D56ff95ee85715047eb5b5220243778af657778c8&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cd89b4de22ff94b6be71208df1fa9839a%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639264485055490029%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Vxf8xRCdLavtw4Dmi%2B49FY1lJDWtm%2BjKv7f8BxKTGq4%3D&reserved=0
> > 
> 
> The commit message says: Similarly, GCC has -finline-stringops=memset to 
> do the same [4], should this issue ever hit future version of GCC.
> 
> Why default "-finline-stringops=memset" if 
> $(cc-option,-finline-stringops=memset), have we identified cases where 
> build fail without that or is it just for future provision ?
> 
> As shown in my previous email, with GCC 16 on powerpc32 we get a 
> slightly better code without this option.
 
No, that patch tested this option + actually calling builtin_memset.
This new patch has the original code of zeroing a long at a time, but
has the inline memset option to prevent future GCC from recognizing that
pattern and making it outline. Codegen should be the same.

Jason

