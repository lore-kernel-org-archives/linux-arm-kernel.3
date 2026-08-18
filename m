Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C87CC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GGCDtHoSJ0Nxzd5K3g4Rn7pndoxkDIAt/HAFcA8P/4=; b=qizPZMVGqlPwj/uECjPo5Um8cF
	cRJNmLbUnJQsdDcivFFI8uzLdGc7Hm2P0zmBn5UdxdFrBlk8kMm+RO620fKJ1i+1ubN5q9RZcJ96N
	4xhF8e9D0vkDpNlagKQztU5W73mi2Ay8ErEqqU7lwDvg1St7x9d8kMc38Y/0U9/P61qNgoZ6+Oup1
	rju/3oKbZHav2Dyx9dD5wpvZ0RrLeFR8rl6hgmKTvBR3kP2qmCFAS5+V21m3XzDCfbSl7044vUMM6
	nt/oaiVWYBTVbfY30l4d6QJY2H1mXPfra+F8EotNlADqGqipbE+16hNZGciLC8T8i7ZDIaUH/sxNX
	iU/fphzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKbF-0000000899M-0oAJ;
	Tue, 18 Aug 2026 14:15:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKbE-0000000899G-1qM8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:15:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D071343432
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 14:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA111F00A3D;
	Tue, 18 Aug 2026 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787062531;
	bh=3GGCDtHoSJ0Nxzd5K3g4Rn7pndoxkDIAt/HAFcA8P/4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=H11o3exY/Ure3sH3nSTP1cOb+RRVfnSqa8lNJeRJuO5METKFHInDlT2vwERlIrZ9l
	 ah6+/rHC3cmAqUl6u/94tMfuEZ09OSih+jT1gcMb9gHy2YNYzEskZ0hZn1NWiRYmSB
	 Jsk7es96Gotr5C3p9EvKb9csv+X5Qks/EJRUcQKcL22bgte5mZr5KCEuBTzKcjgbtx
	 crGz3zahOcClOeTOvbc+Ag3c30nuMIa5sw3YGBdRCQzmpNmIY92toYuzVuFaHBiw/c
	 MXgKNnt0IVFCvN0ihG6cyDZ3dTOeQoO7sEqlcf4pC+zHUp+Ynu0bk1LCngXZhkmz0p
	 A6bE8RkuvCKLw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D88FF1980083;
	Tue, 18 Aug 2026 10:15:29 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 10:15:29 -0400
X-ME-Sender: <xms:_2iEaj0o6mlBiAjvLk8xn0dOP9a5sTc5VUO7iKj54BqtU17AKBl8Hg>
    <xme:_2iEas7DpFLD1KqCOSKVYa_nzljAo67zJCIOnXeo2koSVfPEoPVvoTDTUcqbiKNu-
    fc3L5xo8bfk8-aDnFhVRyT2tKymbDBYk3cbn59-DNuAj1Ze_chEkVE>
X-ME-Proxy-Cause: dmFkZTE5+Ljdf8AEVfTUNzLW1bowQTEYVKKlh2mBbWP+x+yNcPAoPfael8/iK7utKXPRjy
    Eq2IR27RmW3cu0Zc9yh/F2marlrsiMXG+KRcczqZPtS4kysaID2bPckkrmQo5wNsQMrFtA
    RjGFJIlHiHiNFSWAA056rvjLUdIU4h3xqdUCZ6fOUX86Y4ILsghXZRe9ZIxQDeWn/dalnH
    GA6nhom5QLsw/DqtdF9LKn0aFwLGBoUoBP+2ce9dgC0h1x2iVTMKbv558EznxZ7LPzFxOa
    HGdguMqXuJdCUkw/b5hwRpwizzBgFT/w5hWWJXoxOWnQajiI+XOEfcU+3N+oKNpwBjAiXr
    BlMyCf+RzZEtZifz5rb7e9jGmEEnC+6EkV/d8iBqUTOkTTGolREX7G1kMBFb1cMgiMmpgn
    HJwdffy28ZBaKIBstNCyrdNc7JsZEZruXZ2NVrY6T/p6Wx/TR6zKbrdjY1zejchvbq5QH8
    2fwVGumWt201CyiEW6RXNPnpM9egiSufIbn/q2YQLt1/p+PvQ8VvKtdj+cmCAs0wi4BX+g
    jIcZV5YzFVjFqnF0aKCaRDj4OOmv6frXJvLKKBP19IE0sytLN6MTM4LSYbI1n24vKoB1P+
    fsBwSazdfQoR5eBB+TKKqI11JCWIvY9PlGpcT9I2bul2kgJHJRQxSsdkAhjA
X-ME-Proxy: <xmx:AWmEap4BBIRi-rCyVjk5J33JNnDLYuCGpJhsRkhD_hlIfToSeX8Oyw>
    <xmx:AWmEagTwNiJhaGS_XNvhhnMqYFJRAprUp1nfOi0PA5V5am0Hw2lDBg>
    <xmx:AWmEao8Ht3ha4T3nlYR7phgdHq7N2DJxOY6W8_Ovck4-yr79EsJdAQ>
    <xmx:AWmEahowxQwD0FuKdb7G2P2okHDL91aC9cw80fE3bqLuIFNvBWm60g>
    <xmx:AWmEauXc0Vt9tffceu_kyzuJLUP1yBaolLYsfXP4MQ9ZoJz1WhOIIbxz>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E0D83F80070; Tue, 18 Aug 2026 10:15:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 18 Aug 2026 17:15:06 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
 "Song Liu" <song@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>,
 "Petr Mladek" <pmladek@suse.com>, "Joe Lawrence" <joe.lawrence@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Kees Cook" <kees@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 linux-toolchains@vger.kernel.org
Message-Id: <efe4a3b6-6511-4c05-825d-d25de72839ed@app.fastmail.com>
In-Reply-To: <CAKwvOd=Vn4L1sJ=8zVk9qcDLtaDYxfxn+0aG4tMrbETsqY5_PQ@mail.gmail.com>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <e5c957d816240e749a92588d4a9bb44da791f8e3.1786768375.git.jpoimboe@kernel.org>
 <CAKwvOd=Vn4L1sJ=8zVk9qcDLtaDYxfxn+0aG4tMrbETsqY5_PQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] efi/libstub: Remove obsolete .note.gnu.property workaround
Content-Type: text/plain; charset=utf-8
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



On Mon, 17 Aug 2026, at 22:54, Nick Desaulniers wrote:
> On Fri, Aug 14, 2026 at 9:45=E2=80=AFPM Josh Poimboeuf <jpoimboe@kerne=
l.org> wrote:
>>
>> Commit e2179a09ab08 ("efi/libstub: Disable -mbranch-protection") added
>> --remove-section=3D.note.gnu.property to the stub objcopy invocation =
to
>> work around a Clang bug where the note was emitted for code-less obje=
ct
>> files even with -mbranch-protection=3Dnone.
>>
>> That was fixed by LLVM commit a48f6079f288 ("[AArch64] Generate
>> .note.gnu.property based on module flags") which was released with
>> Clang 12.  The minimum Clang version is now Clang 17, so this workaro=
und
>> is no longer needed.
>>
>> On arm64, the stub also no longer builds with -mbranch-protection=3Dn=
one,
>> as it has inherited the kernel's flags since commit 8358098b9787
>> ("arm64: efi: Enable BTI codegen and add PE/COFF annotation").
>>
>> Remove the workaround.  This fixes BTI on arm64, and is a no-op on
>> RISC-V and LoongArch where the vmlinux generic NOTES macro discards i=
t,
>> and the x86 and ARM decompressors discard .note.* explicitly.
>>
>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>> ---
>>  drivers/firmware/efi/libstub/Makefile | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>
> I verified the above all looks correct.  Thanks for the cleanup.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>

Thanks. I've cherry-picked just this patch for v7.3


