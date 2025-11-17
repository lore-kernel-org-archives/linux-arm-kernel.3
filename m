Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F27CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEwk1n7HJMIPgi6npAFHQjw+pRgC1LxSMSwJ1GkriZc=; b=jTsvKgKhA2tCz6+0Xk9dlWTSkv
	8i/z0/j+lDCZBDMM1Kdl94/C7D7AEsHuuiRgAT3LGM/1vgVaeGXl2rBQqK3xWVb5XK78z53LdX6Qs
	OeIoQooPnz/ILM69CzNyLYzZAa9WVPOajRAnz3EX/CtUXMem9b2a1Zb5jM4N1KnxMqp4ow6hhKAHJ
	cIwS2QIO28V7VhsFPtJ1HYmgwed/dZjkuR5mxsBqKWLEsquj7PnAdRanE1ZGQJdsGg2jH7tf5h5no
	vDABjFUFeGbd2F+Ns/gIFArHFXKpAghIfj/dPRdhrg5bgDwiGhoTvlyyzI3Wc3bCJobnrhEZHzPdT
	xSbkECcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxTq-0000000FylX-48XV;
	Mon, 17 Nov 2025 11:33:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxTo-0000000FykV-1th2;
	Mon, 17 Nov 2025 11:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B2734326E;
	Mon, 17 Nov 2025 11:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FFEC4CEFB;
	Mon, 17 Nov 2025 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763379187;
	bh=7c7c0+Y2B/04JUOEwi1O55W3Y0JytX6yoqbHe2m//uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0iH7zKi3zR5ITzvZgCo9KeJonwjYrYbonjxhYepOF3+xHZpaS3i9D0kEds9bBtBm
	 tJVhUeo2NjA866SWv2uwt3B84zpsGt+rFkub8wba2n8v951OWWCU4Ddn/CRqhFholS
	 t3JB2pOs8OAnnfo4XkYh5ksbvyG8Z2wOlp8SyxiDt8FhWpp/46kJIUxDt07hIkoRYi
	 XHgQ9t+WpdVXZLdyBUt/JFVk0g3dfRlmreSb7STQNAVkigTmeYh/PoCPatGNe790Wb
	 Fc0XZYMC40b+xXj9qVj/Dhc27kCOKFThiDS6ouhgXyf3oZzLgiJvVxpO1KCY61s7In
	 tDypGsaVFETGQ==
Date: Mon, 17 Nov 2025 11:33:01 +0000
From: Will Deacon <will@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <aRsH7RTpAah4g5Xr@willie-the-truck>
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
 <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
 <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_033308_541770_A3495D8D 
X-CRM114-Status: GOOD (  24.27  )
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

On Sat, Nov 15, 2025 at 11:16:42AM +0800, Huacai Chen wrote:
> On Wed, Nov 12, 2025 at 2:00 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Mon, Nov 10, 2025 at 03:00:00PM +0800, Huacai Chen wrote:
> > > On Mon, Nov 10, 2025 at 9:19 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> > > > If I understand correctly, I should modify this patch to remove the
> > > > changes of arm and riscv for now, do the changes only when there is
> > > > a real problem or requirement some day, right? If no more comments,
> > > > I will send v3 later.
> > >
> > > Now everyone involved agrees that the efistub code is correct, so the
> > > proper solution is to fix the compiler.
> >
> > Hm?  I don't see how it's a compiler bug.  It's really just an objtool
> > limitation.
> >
> > > Changing efistub code and changing objtool (ignore __efistub prefix)
> > > are both workarounds, but I think changing objtool is a little more
> > > reasonable. Maybe Josh has different ideas?
> >
> > I thought the conversation had converged on what Tiezhu mentioned above,
> > which is to skip objtool on libstub for loongarch, but leave the other
> > arches alone.  That way objtool behavior is consistent between loongarch
> > and x86, and objtool doesn't need to ignore any prefixes.
> >
> > So basically, the v2 patch minus the arm64/riscv changes.
> 
> Hi, ARM64 and RISC-V maintainers,
> 
> Would you mind that this patch modifies the three architectures
> together (they are exactly the same style now)?
> 
> Madhavan is the author of ARM64's objtool, I think your opinion is
> also very important.

arm64 doesn't (yet) use objtool.

I defer to Ard on anything relating to the arm64 efistub. Reading the
start of this thread, it doesn't look like he's convinced and I'm not
surprised if it's purely an issue with objtool.

Will

