Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50101C36014
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYmC+MB3Ga1Qxmw+SnW2boDawQrt63Z6297wM2q9/LA=; b=deD08YnR0OAg2v+Cu5cLb9EBSj
	qHTsriSIUQvw4quhelP2faqQOpNpVkVf9w0AT11HulScBEsuIayoMF9aCfKkTcRNciELZ3NFJGG5A
	htUnGe4aS7DtmK7Bt5iZa9OfYbBM/L8E9WJWaUmulopNoh/xkN/MkX2cF3jmjgWQKCmEzhII1Y9vK
	2+VQh4GbaUcEAB/NpZYQ2XQmJ42x9O1qRKEoRShC30Jmylv7ZpwOoQq9qUICKmKtxfdCePf1kN5XY
	mkVqLb+IIzmrv8g6nLllEhhaGC4wFcEbW8SxPEfifRXDdqH4yMx+7lbZMCWOKQHMsdCxYzn0Jv6mm
	kGsnoeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzN1p-00000001SKx-0H1q;
	Mon, 31 Mar 2025 21:50:45 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzN01-00000001S6q-0NKH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 21:48:54 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54b10594812so3209638e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743457731; x=1744062531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYmC+MB3Ga1Qxmw+SnW2boDawQrt63Z6297wM2q9/LA=;
        b=C4R1SnCIu+3t2DH7j/tbYH137iWVAsxFFMrXhU9E8Jho67i4NeHDS+2/QwbT3Vj+sd
         U2uItN7PmGN1yOwrOTnJLeM6xAMWkFs7iKZEf9NEKFVKajNssTMkiU/BFN/iK1ZVrLTC
         ABFsuDBzfaa+BmgXuF0q71o2QgdgvY8XASIht5NL8rx3rPC9hDY/PDjNY7xcmTcq6dnF
         MYFQcS03usjPMSRWqajIdB2+KTVoeoI8vKppm6dihvVJKZt91Phliw9uYmKEe5j9y5Wy
         CNf1j4AsjodjzZDq+9i0pG5WsVr3Tyrs/dRBfE9BTFDCcNtM7Gnf+vgHHxym0gA6bFq3
         WuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457731; x=1744062531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYmC+MB3Ga1Qxmw+SnW2boDawQrt63Z6297wM2q9/LA=;
        b=ZTqPWuHK/SoarwHV+6TMLdoAkWxPG0XU5UfWVi3Fjo6yqvXaDobzzvJHABFF7oohis
         Sz1PdjC44hiSa7fwFjlLIemxLzNMXIERmGpgymML5iF3aQbDiaEHuiAn6OnEATR+UU9R
         NkX3SeicR1BixBK126K6zs/s+3asmArgzfk84XJY6JFQYBRht1DU2poO/Yu/W40HQl85
         UmCGNqDt6YDx+Vjg2Ppjv3xz9FLwR1Sdp9jfAnj1RbxB08eMUuWcAwB7Qb52wyrJwnoV
         1fR+QpR/8UzE0nivbMezQ4w+TpFL8IOJCBJlVMiJWkK/6lI1xq3dOUMt6d/kbPbOHXvE
         Ca9g==
X-Forwarded-Encrypted: i=1; AJvYcCVKLdxJagL+AmE65i4JADhFOlJJxYTfwNp+OMmYqLtgokwbVcvpi52cAeY4WPhC3vMKQD99BMZqybSD2BsURiVO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1yVfV7HKEvVXNItLs3rrXQCns8ow1hsm0O5cHrGuwUQ+jUutg
	BQFXjQJ3m5SrUxEPLuZv11Lx0sKMvmdTZkPLRFXp1ucw6KRFqGbsXsQ93+ezIO6CJ50Crkk6suc
	0DGb4monAUQ7KcfU2pmRLN98ilzfVi0KaZzASrw==
X-Gm-Gg: ASbGncvjR24NsNzdChKVPPrGcLMN5dX0907u/jrNfSxTzgTgb5RBoNIJB96R0W77QnE
	GIjbVgpf7M5Eys/HkVfDQTEpEiA/+BUUnQ+Uot2s0hR60HCCdViRk4kaDFKEBLZWBl95hQhK8T2
	TClsfJE9QH8f3SG3w2wKe0L30=
X-Google-Smtp-Source: AGHT+IFKrtOpiukzpK/NrtKRXlopAJBo1cfKVww6Xl2T8BzgUQUIQAgouqHZgZnMK2jF9lW8egUD6eakV7yGdbX7O68=
X-Received: by 2002:a2e:87d8:0:b0:30d:e104:9ad1 with SMTP id
 38308e7fff4ca-30de1049debmr24835581fa.38.1743457731171; Mon, 31 Mar 2025
 14:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
 <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
In-Reply-To: <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 31 Mar 2025 23:48:40 +0200
X-Gm-Features: AQ5f1JrgtZIoLPjqTsdbCrOeKTMwv3zR0VqKQ_FWWHTP-zQunZfEAsmN_dnyhxE
Message-ID: <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
Subject: Re: [GIT PULL] Generic entry for ARM
To: paulmck@kernel.org
Cc: Russell King <rmk+kernel@armlinux.org.uk>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_144853_132028_B153CBB5 
X-CRM114-Status: GOOD (  15.44  )
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

On Wed, Mar 12, 2025 at 7:00=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:

> Once you are confident that you have all the needed "noinstr"
> and "__always_inline" instances in place, could you please add
> ARCH_WANTS_NO_INSTR to the list of "select" clauses for "config ARM"
> in arch/arm/Kconfig?

I would love to do that, I'm just not sure what this really entails.

Surely this patchset tags a noinstr on every entry point from
exceptions and syscall software interrupts.
Documentation/core-api/entry.rst is pretty good at explaining this.

But what makes me uncertain are things that are tagged
"notrace", such as void notrace cpu_init(void) - surely we
don't trace, but should that be "noinstr"? It's even marked
"notrace" but not "noinstr" in arm64.

cpu_init() is called from e.g.:
asmlinkage void secondary_start_kernel(struct task_struct *task)
OK should this also be noinstr? Or is that just implied because
of asmlinkage?

<linux/compiler_types.h> will resolve to:

#if defined(CC_USING_HOTPATCH)
#define notrace                 __attribute__((hotpatch(0, 0)))
#elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
#define notrace                 __attribute__((patchable_function_entry(0, =
0)))
#else
#define notrace                 __attribute__((__no_instrument_function__))
#endif

which I read as three different ways of saying "don't patch here".

Which is confusingly similar or identical to what noinstr does, I do see th=
at
noinstr pushes the code to separate section but that in turn might
be what __attribute__((__no_instrument_function__)) and
friends does?

Are they equivalent?

sched_clock_noinstr() is tagged noinstr and sched_clock() is
tagged notrace, so there must be a difference here.

secondary_start_kernel() is tagged "notrace" on arm64 but
not on arm, should it be tagged "noinstr" or "notrace"?

This kind of stuff makes me uncertain about how this is to be
done. A "noinstr vs notrace" section in Documentation/core-api/entry.rst
would help a lot I think!

Yours,
Linus Walleij

