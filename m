Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD81CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 03:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EphNanKEklSwEE1VhqqyX+HCT+YW7iMdu0JPdDWbOKo=; b=HDx5qVoHEPp6+9V8zDY2yt1HfG
	e6gtIuhCO0UksoxWtfNV3/JHwrTry5yXGdzadu54t7qzGComxiZJLvnc1Xa/959iTAdIU1w3747ef
	Y4tUGN4pQqDTWRsFqMkdafVrAs2DS8oX7e3I/LpuQvJqvOg2FbNduHmW3RfWL6r3K98qR+D1vXoHn
	W0kHrTvv3GUfcxo2bj2FQ4PkEVVr2SXq3hZyTkhS6MU3k5qQUzBTnPpOD8+jsJU3LzY52OcxQGSoP
	ixocKGDF3nYCxi/0xq8NIqvr80abmJAlCY6plNvO3k52te9bnnCpPKwDg/+NUnv9vu9ladZO0JQnC
	iM9iRU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6mZ-0000000DP6i-1dkj;
	Sat, 15 Nov 2025 03:16:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6mY-0000000DP6T-02hY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 03:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 665C86014B
	for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 03:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E076C19425
	for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 03:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763176615;
	bh=1dM7txdnL3WwXxhzg0NfITbWJawqUJn8AxOVuQOmSOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gzM3zeP5FIrXkPRuKUDq0lbVTzb3+XfJowk7C28SobZejzXWN83pXJEcyP4cRgB1f
	 dLzKFoPZ3octPecz1SMSWDH8nHJvzNfXENC3F1yAnCMPP2+Lu33dSvEADZWHigo6HP
	 FX7gf5H3uVur7vI7YK+rnT8AS0H8jzebkxI8WAXvIeSvK8Uyre4RTbMs/fCCMPSk6t
	 WTgALwDvLQ9dDGeEnhR6p6ypXYVRAF3bL9syz5UR4w25zcc99yA0hbY6o+xRCTEfXV
	 QEntL7cSSUzWtdBy9PUvqkczBTDH9p2f37yXcVSi0eqcSYlqWObC3hRGvFbzTybSaN
	 pM6myGQs8xcpQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso5825807a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 19:16:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWR/QdePlWWIQKyUlngF6qgRHVGgDud3Ctc+uKWKTSoZIbjQX6RCg4wuECBhIN9W7BcvyiMhR+FpPWwruR+T2+V@lists.infradead.org
X-Gm-Message-State: AOJu0YwgsTbqgkyjS8ChzmOepBHlolOrqHdksE9jek1iTqiVWKLNBIRL
	FiBXtvB/AeMA358KrbNAUEfUErJZ3B9wObON1C3Xu8l6uMSIT4WUnDVm1zi9/eiTlzXHcJEXABX
	NKloroHNvSeX0qJ8321WqoVf1IzlDgNU=
X-Google-Smtp-Source: AGHT+IEhCFcB8Sc5IPBxNenAIJu3Cub21VKbayDOKy8qEqMDOguZ4v0qRe+zt91ixvviR/N5Gw9ABrYXgf7ej1GR6n4=
X-Received: by 2002:a17:907:94cb:b0:b72:84bd:88f3 with SMTP id
 a640c23a62f3a-b73658ae241mr667286066b.11.1763176613598; Fri, 14 Nov 2025
 19:16:53 -0800 (PST)
MIME-Version: 1.0
References: <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
In-Reply-To: <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Nov 2025 11:16:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
X-Gm-Features: AWmQ_bk1bIi26jaM84_oT28vQ-tc26Bh0XF8H8WDo5TPEOpn0O8V--WlioeejxY
Message-ID: <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Wed, Nov 12, 2025 at 2:00=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Mon, Nov 10, 2025 at 03:00:00PM +0800, Huacai Chen wrote:
> > On Mon, Nov 10, 2025 at 9:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> > > If I understand correctly, I should modify this patch to remove the
> > > changes of arm and riscv for now, do the changes only when there is
> > > a real problem or requirement some day, right? If no more comments,
> > > I will send v3 later.
> >
> > Now everyone involved agrees that the efistub code is correct, so the
> > proper solution is to fix the compiler.
>
> Hm?  I don't see how it's a compiler bug.  It's really just an objtool
> limitation.
>
> > Changing efistub code and changing objtool (ignore __efistub prefix)
> > are both workarounds, but I think changing objtool is a little more
> > reasonable. Maybe Josh has different ideas?
>
> I thought the conversation had converged on what Tiezhu mentioned above,
> which is to skip objtool on libstub for loongarch, but leave the other
> arches alone.  That way objtool behavior is consistent between loongarch
> and x86, and objtool doesn't need to ignore any prefixes.
>
> So basically, the v2 patch minus the arm64/riscv changes.

Hi, ARM64 and RISC-V maintainers,

Would you mind that this patch modifies the three architectures
together (they are exactly the same style now)?

Madhavan is the author of ARM64's objtool, I think your opinion is
also very important.


Huacai

>
> --
> Josh

