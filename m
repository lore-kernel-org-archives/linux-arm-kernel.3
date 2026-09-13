Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4268C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxeU5Su/M8erJsaUWOmS2EmM0zS643DtJmSk63z/Z00=; b=03sLVtKJjBSFHZELfCk8WAxrHS
	5HhYjWANo5mPdPL2S5eP73gFMSkrjAIX8ZN+L+xSbAmd3AZC6tHLS9rtgBjLvXNMoLO+emEeJoZbO
	jP4KemD9gUcLf3fmukDGWIXJTFrfLmz2t9l2jpadbvfIIcJ4WtwylHHXqdewDHNv+wtNNMpJ+0P9H
	BbH0i4fbxXO7jVf/6GBtkMVYKfu7igX+OI4pcwMxoWUs4AmVpsJoNOmh9ImCzXi0xjuDxNHj6I4HM
	/j3H2pfnEQlNC4dbJjfCt+oZ8esnpVBDdf8+UQMrQlzgubnwGxhNKrnDDP/TLEbjS26r4efF4y+VK
	9T8RZZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qGc-000000020X6-0rT3;
	Sun, 13 Sep 2026 19:53:34 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qGa-000000020WM-0yzs;
	Sun, 13 Sep 2026 19:53:33 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B5817CD5BC;
	Sun, 13 Sep 2026 22:53:23 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B5817CD5BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789329207;
	bh=OxeU5Su/M8erJsaUWOmS2EmM0zS643DtJmSk63z/Z00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bPrxv5ZxzllOQiy2krKFOjC+n45BHyruI8wXJWW2dWXRr4DcLu0qSRf6d6pHLDx2g
	 jWcfuKvfm4R5fkihNP2bYAGlMPiEKu2EReiVm/sDrL/7gpXNRKBB7aWno9BxyE0PIx
	 eJ2WBtrgtJF/6pZnjqFQwwsDO/KmzOaIx0fkVSU/CK9rK96UEIEpRCrZ3RBw/9RO7M
	 dIG3X6gzczLJWO2ggvEASF+KnDy8M/wU/ZXNb4/e4nVlCj9JFDbH5mUjxdeheYhNPH
	 IQWdrYEJBtqEOV1SW3KVrCuI7RGRLTeehLAl+p9Cvbyg6Rh5mmTzHhmbRZNO4iAJKh
	 MCi83qnwm1Cog==
Message-ID: <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it
 consistently
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas
 Gleixner	 <tglx@kernel.org>, Anup Patel <anup@brainfault.org>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai
 <minghsiu.tsai@mediatek.com>, Houlong Wei	 <houlong.wei@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, "tip-bot2 for GUO Ren (XuanTie)"
	 <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Date: Sun, 13 Sep 2026 15:53:22 -0400
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_125332_454579_DD9480F6 
X-CRM114-Status: GOOD (  17.84  )
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

On Fri, 2026-09-11 at 03:27 +0000, Guo Ren wrote:
> This series removes the implicit assumption that RISC-V supports exactly
> eight IPI message types.
>=20
> Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
> BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
> separate IMSIC_NR_IPI definition set to 8. These values happen to match
> IPI_MAX today, but neither is the proper source of truth for the number
> of RISC-V IPI message types.
>=20
> Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_MAX
> directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
> IPI_MAX.
>=20
> This also makes adding future RISC-V IPI message types independent of
> the current eight-entry assumption.
>=20
> A follow-up patch renames the MediaTek VPU mailbox terminator from
> IPI_MAX to IPI_VPU_MAX. That token belongs to the VPU firmware IPI id
> enum and should follow the same prefixed convention as IPI_VPU_INIT
> (and SCP_IPI_MAX on the SCP side), instead of reusing the generic
> IPI_MAX name.
>=20
> ---
> GUO Ren (XuanTie) (4):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocksource: clint: Use IPI_MAX for IPI mu=
xing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqchip/aclint-sswi: Use IPI_MAX for IPI m=
uxing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqchip/imsic: Use IPI_MAX instead of IMSI=
C_NR_IPI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mtk-vpu: rename IPI_MAX to IPI_VPU_=
MAX
>=20
> tip-bot2 for GUO Ren (XuanTie) (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv: smp: Move enum ipi_message_type to =
asm/smp.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv: sbi: Use IPI_MAX for SBI IPI muxing

I am confused. Thomas merged your entire v1 series a week before (see
the individual replies from=C2=A0tip-bot2@linutronix.de). Why are you
sending v2?

Patch 6 was not included in v1 (but it's clearly related), so perhaps
you meant to send only this one as a separate patch?

Also:
 * The cover letter should include a changelog, indicating what changes
   were made in each version compared to the previous one.
 * Patches 1 and 2 carry a "From:" tag that attributes authorship to
   tip-bot2, which is wrong (if these patches were to be applied).

>=20
> =C2=A0arch/riscv/include/asm/smp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++=
++++++
> =C2=A0arch/riscv/kernel/sbi-ipi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++--
> =C2=A0arch/riscv/kernel/smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 12 ------------
> =C2=A0drivers/clocksource/timer-clint.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/irqchip/irq-aclint-sswi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/irqchip/irq-riscv-imsic-early.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/irqchip/irq-riscv-imsic-state.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h |=C2=A0 4 ++--
> =C2=A09 files changed, 28 insertions(+), 29 deletions(-)
> ---
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
> change-id: 20260911-ipi_max-ff71eeadf6fd
>=20
> Best regards,
> --=C2=A0=20
> GUO Ren (XuanTie) <guoren@kernel.org>

