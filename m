Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F6C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANSYXhkR59VMjSJxw7ihndcWaAezvhBNEHzaW2IaT8Q=; b=efbwmnk6gNXR9hja3SIKjXgNuB
	gM+1u4MzROQDy6w5t7wEjVZSdaWUGC/V9MBHDQTcMsQwd+S4vCfB6iABNu9tb8hE36W5U/Bedgpj1
	KYbHaeauSC/35pPewKVw0xrP2rcGkDSP7nRW9jdvSdnmem7kqKYY3Y/fOLhdW/V9CYlgd6DizZImG
	aTTaqmA3NiHKlhhSROt3fnXjtWd3LBoYJruQXBEiygHoaa5mQ/roBNU2BOZeGozhviweqfM452409
	amzX0On/wi74wu906zldySilh7jRzf4IRjP9oKuBScP5y0ID8FCgq/vADyFNoxUPxWtcBERa50t7Z
	nkh442yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NYy-0000000DAwg-2lMb;
	Fri, 18 Sep 2026 01:38:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NYx-0000000DAw2-2D1F;
	Fri, 18 Sep 2026 01:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ANSYXhkR59VMjSJxw7ihndcWaAezvhBNEHzaW2IaT8Q=; b=o/q5zSt1Pk4JiweCSLOrFSHYiX
	I9VZIpxLU75lX73oDfm5vtOqjU3cXyrB9RovyV9rhdZXQhRFSoQhP4kn5LP5BVe/vVfh/2YWqwPBx
	V+U9LGSbVRXF4HkBCP9P8qAABkXD4lAPFPNtCMK3bsru4t0SdxDaIZ0zSplBVI2fRXl+u0Xhyf6cp
	8MCfLxvmVorZoEjLD6Qgow5R+/ZbIGY4BPeTHawc33oGpDin0mscK6HumBFjuoGK/hrxPRN/gE6oq
	oBoLW/mjKw7/axzLT6uSQ5ykABEcWK76wVO0uvMQ1SAI9p9awOSWt3IT/ezcz+RGpl4UHUrVG3KcL
	2R4e4Z9w==;
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7NYu-00000009U9v-20PT;
	Fri, 18 Sep 2026 01:38:50 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 7125DCFB00;
	Fri, 18 Sep 2026 04:38:41 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 7125DCFB00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789695524;
	bh=ANSYXhkR59VMjSJxw7ihndcWaAezvhBNEHzaW2IaT8Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UUFShpgXvfTYmy5brAtO+WcGmV3rDOVegPicqUL9zj5RA97uAyCc0vfhtHnzp/cQH
	 lgeeNGr8EpfgrhVgpHTSVShEQZYxefMGS8F0yRGsV0AMLZEpZTcIUiyPyt1BPurz1T
	 QeL8n0QO4KTZtuGI3Fssf17KVkFYkV94FPUlOU4J3LHfbLCcQE0NnCbtp8LMjIzRPj
	 BkZIf6EYcJINqt5ciNEZvPKrZ8FzR0I3gol01O0FC8usyqs2NjCmZJwrm+34Qg3s6k
	 CPF/2PttvoU63/4X9NEUaoDvenduK8aRmniNzluH4xUpg5/SUNz8Ohjtp4wuKWwiWI
	 1ZPjwGiDMTlLA==
Message-ID: <6a4202752078c5f55882d3a4f5113829201dfb7b.camel@rendec.net>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it
 consistently
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel
 Lezcano	 <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Tiffany Lin	 <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>,  Yunfei Dong <yunfei.dong@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei	
 <houlong.wei@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, "tip-bot2 for GUO Ren (XuanTie)"	
 <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Date: Thu, 17 Sep 2026 21:38:39 -0400
In-Reply-To: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
	 <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
	 <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_023848_647955_C7D7F035 
X-CRM114-Status: GOOD (  33.76  )
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

On Thu, 2026-09-17 at 19:22 +0800, Guo Ren wrote:
> On Mon, Sep 14, 2026 at 3:53=E2=80=AFAM Radu Rendec <radu@rendec.net> wro=
te:
> >=20
> > On Fri, 2026-09-11 at 03:27 +0000, Guo Ren wrote:
> > > This series removes the implicit assumption that RISC-V supports exac=
tly
> > > eight IPI message types.
> > >=20
> > > Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
> > > BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
> > > separate IMSIC_NR_IPI definition set to 8. These values happen to mat=
ch
> > > IPI_MAX today, but neither is the proper source of truth for the numb=
er
> > > of RISC-V IPI message types.
> > >=20
> > > Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_=
MAX
> > > directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
> > > IPI_MAX.
> > >=20
> > > This also makes adding future RISC-V IPI message types independent of
> > > the current eight-entry assumption.
> > >=20
> > > A follow-up patch renames the MediaTek VPU mailbox terminator from
> > > IPI_MAX to IPI_VPU_MAX. That token belongs to the VPU firmware IPI id
> > > enum and should follow the same prefixed convention as IPI_VPU_INIT
> > > (and SCP_IPI_MAX on the SCP side), instead of reusing the generic
> > > IPI_MAX name.
> > >=20
> > > ---
> > > GUO Ren (XuanTie) (4):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocksource: clint: Use IPI_MAX for IP=
I muxing
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqchip/aclint-sswi: Use IPI_MAX for I=
PI muxing
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqchip/imsic: Use IPI_MAX instead of =
IMSIC_NR_IPI
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mtk-vpu: rename IPI_MAX to IPI_=
VPU_MAX
> > >=20
> > > tip-bot2 for GUO Ren (XuanTie) (2):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv: smp: Move enum ipi_message_type=
 to asm/smp.h
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv: sbi: Use IPI_MAX for SBI IPI mu=
xing
> >=20
> > I am confused. Thomas merged your entire v1 series a week before (see
> > the individual replies from tip-bot2@linutronix.de). Why are you
> > sending v2?
> >=20
> > Patch 6 was not included in v1 (but it's clearly related), so perhaps
> > you meant to send only this one as a separate patch?
> >=20
> > Also:
> > =C2=A0* The cover letter should include a changelog, indicating what ch=
anges
> > =C2=A0=C2=A0 were made in each version compared to the previous one.
> > =C2=A0* Patches 1 and 2 carry a "From:" tag that attributes authorship =
to
> > =C2=A0=C2=A0 tip-bot2, which is wrong (if these patches were to be appl=
ied).
>=20
> Sorry for the noise, and thanks for catching these.

No worries :)

> You are right on both points. I missed the cover-letter changelog,
> and I should not have resent the already-merged patches as v2. The
> "From: tip-bot2" tags were added by b4 because those two patches had
> already landed; that is useful as a reminder to me, but it should not
> have been left in the patches themselves.
>=20
> I should have skipped the b4 v2 flow and just sent patch 6 on its
> own. The only remaining change is the mtk-vpu IPI_MAX rename, which
> is needed after IPI_MAX became visible from <asm/smp.h>.

Ugh, I missed that part. Because the IPI_MAX rename was already picked
up, it's going to break the mtk-vpu driver until patch 6 is picked up
too.

> If you are willing to pick patch 6 as-is, I would appreciate it.
> Otherwise I will resend it as a standalone patch.

I cannot pick up anything myself because I'm just a reviewer. But I
don't see any reason why patch 6 couldn't be picked up as-is, as long
as everyone is on the same page. The "[PATCH v2 6/6]" part of the
subject is dropped anyway.

I now realize that patch 1 (which introduces the conflicting change)
was picked up by Thomas via the irq/drivers tip branch, but patch 6 is
strictly a media subsystem patch, so I guess normally it should be
picked up by a different maintainer via a different tree.

Thomas, are you willing to pick this up too? I'm thinking it could
avoid some pain if irq/drivers gets merged into mainline first, before
patch 6 makes it there through the media subsystem. Also, it's a pretty
"innocent" patch, it just renames an enum value, and it's contained
within that driver.

--=20
Best regards,
Radu

