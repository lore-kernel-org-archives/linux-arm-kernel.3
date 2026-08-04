Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231DCC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAirPRCGf/1333dctez2qffStYzY2tiwhsh+TDxtvKs=; b=WaCYAIw9gvTblujDzDYlbXU8Wu
	B/6Cl2vBFfJEfxxPkjQQdqipMgoe/9UNkfHYvOu61R8ED7eGJoHU4Fp7xO+nNDXodtDI4Buvm3UuA
	DmGrfz75WZpnPZ6IS5TIVoarCO56e/QCDcG9ZXFZ/I+0XyjK1wX20InknmW0pRKO7RoUJw4uz8LUq
	6fep7l2lpcbUj8FEowGe1xSOsBqtk3JI9eToOTsMoD+GQGchYHbfQy7IzepFU8xEx06S0hyB53taH
	V/HoWwyacswknuj5iCGx3qvaPKHbXKUevWhMEhQFTIuASjl56DjmZC2AX+NbqTfqLqI6a9f3cgD3L
	5EaA3aSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrI9w-00000002Lvd-29P3;
	Tue, 04 Aug 2026 16:38:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrI9v-00000002LvS-0hUX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:38:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B46760A75;
	Tue,  4 Aug 2026 16:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D7F1F00A3D;
	Tue,  4 Aug 2026 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861509;
	bh=WAirPRCGf/1333dctez2qffStYzY2tiwhsh+TDxtvKs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VAI6WW+g6cDtS1SN5tLQMCg5XXuWh0DAcwEMi1QHNxKVtdmi9/gFDjJTUuBW3K/xE
	 7Y3lf5FI4mFz9oV953Nt4RnlSn1ZJjEGNdDF72EICw0Qs8mXGaj7M0onM2NPE+W0IT
	 gWtOE3KOwRXn5rUwPyD9LwsVSiSIzhwEsHWKCGZ9OtJSAn4iGBZHgNuthNBYCYR8tm
	 3bskM+qBKsYRaZzIkDPzrsu1RH5tTBJco1cAHhFfVk+YxyvI+iN3loqGZIcfxXBv+P
	 CoAk4wF/TcJW/2DrJFEHZ6P5txsBmsjxkBDjXooyumsrjHlMw8rCt/MrjdFX9r5QG/
	 l1E8Uxa8erT1w==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A9069198005A;
	Tue,  4 Aug 2026 12:38:27 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 04 Aug 2026 12:38:27 -0400
X-ME-Sender: <xms:gBVyatsLyObw_5ZlvbAIqScCRGlvJE6T8kMW2MLHexuZXWuoeOmlQw>
    <xme:gBVyahSiRrHG9d883qoL2dn_VR9NLoZUBZyDi5ORySuZ6Dw3a4ts5jBC1fpEwxMSv
    k6bIC78TFVSBHBpwKFZHjhFqnLMxpZxaKyLyR0ByoVmy6sqtc1guQ>
X-ME-Proxy-Cause: dmFkZTGB3CS03rqKc7WCu64gQ4WNNHMbSAX+8m1ERq9yoVsAbDitg8JQ5br4u19YNws+Cy
    GftgXYMCqWxlgPiuNr4qdcdAQ98RCN6/z2+oHeAGQ5c5nONgeSmtKqg3onWQ6Pn+GjQDIp
    fGzQESziDY0NAZv6EgXftw8HLcBhBPFmwj49C0JdodcxwM/7mOrGS3nrPUkR08UH8JPp4S
    HWdthsYMNcXgYWjTohVP3/e1ljHBCyjT3NNOdHmRcv1s1P+y8Jt3FgOkpAAhrTdUMv+ECy
    uo2Sf4asMnP512M0QtjhXayaTWzylOPydXWpFIwViawS46ZILI4KIkRdbxOx54wQVos9An
    LTruL03Z88xemcYm1is0/WAnKKLDav1MEgilpg9C01hinUdiO2CLDjdHp4uOD1+M7Ka5J5
    UJhuEU7mZgnRKShU7z6Ap1/gC9N4BsWx/Ju8grhv6lm6eB4O28VUigjgYXYsxpPd1XS6op
    IMLFbj9hafpgfZTReuU+1oyJnRS+AbJoj/uhIkfUWlP2ppfOhSKNZ9hiTspfbaS/5QV7Qy
    EI5sgmlJ7mXedH55U2lS7cM3EpAJAa5GVeUcFMCc/FtJw0Dx41X2ekzDSFsowfLewcRpPx
    lxIzHt+/F5M9OsRaSMExFHKrWBQPqQzkR1tVgWZ13RzyGKpjcS9FnlkPKM+w
X-ME-Proxy: <xmx:gxVyamcR9XnqETPn33SZiB_HAGg0xW6Z4MqyEBwk4dZ6Ym3kiFFaAw>
    <xmx:gxVyamuSXN2qtJoBsn57zvvV-PbfwP8a-O0lsymKiS5BDR1suSh-dw>
    <xmx:gxVyaliEhMkmJefpc4uaN6pxRErnLV9oOdwXaNsssb-37nIdKnwWVg>
    <xmx:gxVyamu1HTsCzF3dtbAkkktq9b1I4eSIH_64EXZ1QHHplJIRGgXh5g>
    <xmx:gxVyao9DNl87C4cYlcRXrCuDw3K1XC0h8lmPRuUhD8e_8JU-hr8VAT5E>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A5F20F80064; Tue,  4 Aug 2026 12:38:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 19:38:04 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Maninder Singh" <maninder1.s@samsung.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 Onkarnath <onkarnath.1@samsung.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "Rohit Thapliyal" <r.thapliyal@samsung.com>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Message-Id: <07e390cf-05ac-479e-9c34-d02b9897104c@app.fastmail.com>
In-Reply-To: <20260803182255.GC1067866@ax162>
References: <CGME20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
 <20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
 <20260803182255.GC1067866@ax162>
Subject: Re: [PATCH 1/1] arm: backtrace-clang: fix wrong sp usage for unwinding
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

Hello all,

On Mon, 3 Aug 2026, at 21:22, Nathan Chancellor wrote:
> Hi Maninder,
>
> On Wed, Jul 29, 2026 at 09:11:01AM +0530, Maninder Singh wrote:
>> Ping! Any comments?
>
> I am not that familiar with this code but maybe Nick (whose address I
> have now updated to point to a better one) or Ard could help take a
> look? Original patch is at
>
>   https://lore.kernel.org/20260624054916.1571701-1-maninder1.s@samsung=
.com/
>
> but I have left it inline as well.
>
>> > show_stack() can be called for any task, however c_backtrace always=
 unwinds
>> > frames based on the "sp" register. This results in printing the bac=
ktrace of
>> > the current task instead of the target task.
>> >=20
>> > Try with normal TC:
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > =C2=A0 =C2=A0 =C2=A0  for_each_process(p) {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  sched_show_task(p=
);
>> > =C2=A0 =C2=A0 =C2=A0  }
>> >=20
>> > [7.433271] task:kthreadd=C2=A0 =C2=A0 =C2=A0 =C2=A0 state:S stack:0=
=C2=A0 =C2=A0  pid:2=C2=A0 =C2=A0  tgid:2=C2=A0 =C2=A0  ppid:0=C2=A0 =C2=
=A0 =C2=A0 task_flags:0x208040 flags:0x00000000
>> > [7.433633] Call trace:
>> > [7.433640] [<80113418>] (dump_backtrace) from [<80113510>] (show_st=
ack+0x14/0x18)
>> > ..
>> > [7.433676] [<8016749c>] (sched_show_task) from [<803cb324>] (meminf=
o_proc_show+0x6c/0x930)
>> > [7.434019]=C2=A0 r5:8158e300 r4:8b4882d0
>> > [7.434024] [<803cb324>] (meminfo_proc_show) from [<80365788>] (seq_=
read_iter+0x148/0x4bc)
>> > [7.434045] [<80365788>] (seq_read_iter) from [<803c044c>] (proc_reg=
_read_iter+0xb8/0xc4)
>> > [7.434060] [<803c044c>] (proc_reg_read_iter) from [<80377104>] (cop=
y_splice_read+0x228/0x308)
>> >=20
>> > It should unwind frame based on passed "fp".
>> > (CONFIG_UNWINDER_FRAME_POINTER=3Dy)
>> >=20
>> > With fix:
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > [13.933732] task:kthreadd=C2=A0 =C2=A0 =C2=A0 =C2=A0 state:S stack:=
0=C2=A0 =C2=A0  pid:2=C2=A0 =C2=A0  tgid:2=C2=A0 =C2=A0  ppid:0=C2=A0 =C2=
=A0 =C2=A0 task_flags:0x208040 flags:0x00000000
>> > [13.934165] Call trace:
>> > [13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x1=
24/0x208)
>> > [13.934654]=C2=A0 r10:8100bbf0 r4:8116f440
>> > [13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_for=
k+0x14/0x28)
>> > [13.934691] Exception stack(0xf081df9c to 0xf081dfe4)
>> >=20
>> > Additionally, the extra manipulation of "sp" register appears unnec=
essary in the "current"
>> > task also since the "fp" register is already provided.
>> >=20
>> > Signed-off-by: Onkarnath=20
>> > Signed-off-by: Maninder Singh=20
>> > ---
>> >  arch/arm/lib/backtrace-clang.S | 4 ----
>> >  1 file changed, 4 deletions(-)
>> >=20
>> > diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrac=
e-clang.S
>> > index 290c52a60fc6..993410a6afd1 100644
>> > --- a/arch/arm/lib/backtrace-clang.S
>> > +++ b/arch/arm/lib/backtrace-clang.S
>> > @@ -105,10 +105,6 @@ ENDPROC(c_backtrace)
>> >  		moveq	mask, #0xfc000003
>> >  		movne	mask, #0		@ mask for 32-bit
>> > =20
>> > -/*
>> > - * Switches the current frame to be the frame for dump_stack.
>> > - */
>> > -		add	frame, sp, #24		@ switch to false frame
>> >  for_each_frame:	tst	frame, mask		@ Check for address exceptions
>> >  		bne	no_frame
>> > =20

The existing code does seem to be broken, as the provided frame pointer
value is ignored entirely.

However, by removing this add, you are skipping the false frame, which
was added to ensure that calling c_backtrace() from dump_backtrace()
does not miss any frames when regs =3D=3D NULL.

So I think the correct approach here is to make the add conditional
on whether frame =3D=3D fp, which will be the case when c_backtrace()
is called from dump_backtrace() with a NULL regs argument.

I.e.,

  cmp    frame, fp
  addeq  frame, sp, #24


