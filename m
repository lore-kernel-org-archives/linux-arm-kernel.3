Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEC3CFD36B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWvPRx2oMhegOeGXEQKEnQ54VQmLR/HDWxK5162UnYs=; b=COfsS2elhXctcGP4s+/2RQK+7L
	7JcIP12CN76lYo+GVhN0xsuaYikokFoThwSjKv8kQSJQTexBOpLc5LPpkF5rseFSVo2Ln6oK0URsH
	lAbhYtUIA8ynyxl0R2uZeIfMnVf9hIVit7LCNMCg9w/iQqj5EmTjCF2bepmur8kHBgbVtak5aYtZZ
	8I8LjBnVGV67asf8612dEE2R0cn58fUfARm6yg6hBipK9Xg8zhcFAOJsbiPRAtfDqCn0jfqTTFbOH
	9og37s1+O4VvFt0pJ3iqMNAihdnbvkXGlPe48nctuNSDiLUP/wtPR4GQy1VHCZ3Lv31uSn2cTQ/WM
	xL1D4gqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiBW-0000000CZyD-2Nww;
	Tue, 25 Nov 2025 01:49:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiBU-0000000CZx7-2jXs;
	Tue, 25 Nov 2025 01:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4996A401DA;
	Tue, 25 Nov 2025 01:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDEFC4CEF1;
	Tue, 25 Nov 2025 01:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764035375;
	bh=UFH2/+azJV59ltuzGJVPHH4dKdyAhCIy5D5qLcxTlMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n+XiJM7VwSKsLWHvLu1Rdz9qkvR5i2wZV7QWqXHgrLB3V9jaVw5nh8EeLnLJFzz6s
	 t4W3teADt1DPjf21Vbjj690WoOEySUaVFI4eWSwcuJBIVmIk8Owtnwx5FOxJKvN9z0
	 IVuL1BdHhysWf/tUBDL3GaWYoNOF67/5AxrRFV8g0gdUhkP5db02pfTXCzhnSUbQnR
	 ATYlERHg6Bp3GHLTJeBGvL7NA90zQ/Mjw6UlkvFNvng9k3N0aYvEN8upkusc0o7UH9
	 ypMcKtE96mAPW+H7Pr9wxtnMjY1JqtNNqjWyrCIyoaFT/Nw5eRcLm9D2UJBfwdpDsu
	 EcxAsQdEzpP5g==
Date: Mon, 24 Nov 2025 17:49:30 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <pgzg3tdudow4ww3tnqdvmppufbpbf6ws5adjjcwc7g3ou7yoih@mzk7iwh7trbe>
References: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
 <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
 <aRsH7RTpAah4g5Xr@willie-the-truck>
 <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
 <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn>
 <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
 <fc4fa66f-15a0-ebe3-0a27-f3f38b03bbdb@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc4fa66f-15a0-ebe3-0a27-f3f38b03bbdb@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_174936_714105_6B4714BE 
X-CRM114-Status: GOOD (  14.01  )
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

On Sun, Nov 23, 2025 at 11:37:14AM +0800, Tiezhu Yang wrote:
> On 11/23/25 10:29, Huacai Chen wrote:
> > Is it possible to improve objtool that can handle indirect __noreturn functions?

Someday that will be possible via a new compiler feature or plugin.  But
today it can't be done.

> > Is it possible to improve objtool that can handle
> > OBJECT_FILES_NON_STANDARD event LTO is enabled?

No, that is purely a makefile construct which should in general be
avoided anyway for a variety of reasons.

> > Is it possible to improve objtool that only ignore __efistub prefix
> > for LoongArch?
> [...]
> static int validate_branch()
> {
> ...
> 			if (arch_is_efistub(func))
> 				return 0;
> 
> 			if (file->ignore_unreachables)
> 				return 0;
> 
> 			WARN("%s() falls through to next function %s()",
> 			     func->name, insn_func(insn)->name);
> 			func->warned = 1;
> 
> 			return 1;
> ...
> }

That only silences the warning, it doesn't prevent objtool from doing
the actual stack validation or ORC generation.  Neither of which makes
sense for libstub.

And objtool has many other features beyond just stack validation and
ORC.  None of those make sense for libstub either.

To fully exclude all libstub code from objtool, these arch_is_efistub()
checks would need to be sprinkled all over the place.

That would be a lot more fragile than just excluding libstub from
vmlinux.o in the first place.

-- 
Josh

