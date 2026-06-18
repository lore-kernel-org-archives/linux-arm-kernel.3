Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B02CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t5FMbUYJIDiySOu7zf/8rQwx2qflh/CaAEYYcLPs/o=; b=oXKcwxc5XeBQom+HFweFGN47N9
	XE0Y/JZ448eDxpL36/QwDzLKDe2seLipveiQy2TSiltcJgwNBLOfyxgK90psgbjJHhZ7oYBnmo+Js
	6VosWA5clj41ZiIb5rP5tz0qjuJjNKeXuurksYSLlzaw7K++ggDmyNRs/gGUJ9j850z7bdxlm4pZz
	vmO9b/wBhdT/PJtLUuoTwyexCjUs4PRL7v264LkIF3hJMJb2yhaW68KLRE4i7QJlbpRnwmxXMT0vB
	2vqGNhQyYackLubYG4PsfY7teXvVjBKWPgs+7ilQEen7PcnB/PiahmQoH7kW7O7cBcYPAitmIL5ev
	T9TdfElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa0sY-00000000SRE-1eKk;
	Thu, 18 Jun 2026 00:45:10 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa0sW-00000000SQf-0QM1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 00:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781743496;
	bh=5t5FMbUYJIDiySOu7zf/8rQwx2qflh/CaAEYYcLPs/o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FRpQmA/QQnrRUAzfk5ZLkhb0CGT2jrsnPpajrhMmvLbSXcjAJoHy5ncQEt8bZWB1Q
	 PyTO1BQvMuwrP5s16Ooea0VgWwB4x+jqWELveLKqUBDkKxovSDrVTtajYnrYKZT98t
	 jySm2+qczVvYRVAbhjocS3PEQdsy3A0Dl/SViq9bpJ+5UGCha9A8YKkp3FDGaPWBuC
	 iDArM/vYQLmyAV/fEm/UgAgDJ1QhgDbYKTA4KYbgp8LdYRqafwYMTriJP3AcdroFAL
	 TQQRcyR1Jmkj1mOHmHOL3kzbdJj+MMmnSYr6AHP+07sTlMjM0npWp7F90Rt9xt4pgK
	 PNF4KP61IsQew==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DC29C605A0;
	Thu, 18 Jun 2026 08:44:54 +0800 (AWST)
Message-ID: <63ec2546de213ab24be06024ac67e98854fce446.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Date: Thu, 18 Jun 2026 10:14:54 +0930
In-Reply-To: <20260617131013.64188-1-karthiproffesional@gmail.com>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260617131013.64188-1-karthiproffesional@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_174508_347210_35E406CE 
X-CRM114-Status: GOOD (  26.61  )
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

On Wed, 2026-06-17 at 13:10 +0000, Karthikeyan KS wrote:
> This looks like a lot of heavily LLM-assisted effort. Please review the
> relevant documentation, starting here:
> =C2=A0=C2=A0 https://docs.kernel.org/process/submitting-patches.html#usin=
g-assisted-by
>=20
> =3D=3D> I partly agree. The code and bug analysis are done manually.
> LLM use was the out of tree test harness and lightly polishing
> the commit message. None of the submitted code is generated.
> If you'd prefer, I can reword the changelog in my own words or
> add an Assisted-by tag ?
>=20

Thanks for the clarification. It's probably okay as-is in that case,
but that was unclear previously.

> I feel the testing strategy is pretty questionable. Any invariant
> violation is possible with that type of meddling.
>=20
> =3D=3D> The underlying bug is a kfifo SPSC contract violation. My intent =
with the
> test wasn't to simulate the race itself, but to reconstruct the post race=
 state
> specifically where (in - out) exceeds the buffer size and show it causes =
a
> usercopy overflow in the unpatched code, handled safely after the fix.
>=20
> =3D=3D> I take your point that forcing that state can itself produce viol=
ations that
> wouldn't occur naturally. Since the bug is provable from the source but h=
ard to
> trigger on demand, I'd rather ask what validation you'd accept here?

I'm aiming to build confidence that the change has been tested in
practice beyond spherical-cow circumstances. Isolating the conditions
this way seems okay, but I'd class the testing approach as necessary-
but-not-sufficient. It's important that the change is tested under
typical conditions to build confidence against regressions, as well as
atypical conditions.

>=20
> I was interested in whether you drove the interrupt sequence via
> emulated hardware. I asked because upstream qemu doesn't currently
> support the snoop device.
>=20
> =3D=3D> My apologies for the confusion, I mixed up things. I have not dri=
ven the
> interrupt sequence in emulation; as you noted, upstream QEMU doesn't mode=
l the
> snoop device. I've described the actual hardware context below.
>=20
> In v3 you said:
> =C2=A0=C2=A0 The issue was observed on physical AST2600 (dual-core Cortex=
-A7)
> =C2=A0=C2=A0 in production under heavy POST code traffic during concurren=
t
> =C2=A0=C2=A0 userspace reads.
> =C2=A0=C2=A0 https://lore.kernel.org/all/20260527175939.2939714-1-karthip=
roffesional@gmail.com/
> Is this true? What platform did you test with?
>=20
> =3D=3D> Yes, the underlying failure is real. It was observed on an AST260=
0-based
> production BMC running a vendor BSP kernel under continuous host reboot
> cycles. Because that platform can't currently be brought up on pure
> mainline without substantial out-of-tree board support, I have not run
> this exact mainline patch on the physical silicon, observed under the
> BSP kernel, not yet verified as the mainline patch. I should have made
> that distinction clear earlier in the thread.

Can you confirm you you have tested on hardware a backport of this
patch to your BSP kernel?

>=20
> =3D=3D> If there's a way you'd consider valid for validating a fix like t=
his
> without a full mainline bring up on the SoC, such as a targeted kfifo uni=
t
> test, or something else you'd accept.I'd appreciate the pointer and I'll
> do that.

No, I believe the change is fine, but the claim of testing under qemu
when qemu doesn't model the necessary hardware was a red flag that
needed to be addressed, doubly so in the absence of your track record
of upstream work.

Thanks,

Andrew

