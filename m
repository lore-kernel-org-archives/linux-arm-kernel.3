Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324A2D37E51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ0OFnIX7hUMbsNflNAslWyTKRUhy/o2U+HmtUmHfGI=; b=1RLH3xpG0r3MaXto9CmeyJ7Kzq
	zKyuriZAkIzfcAi/CRGBNumTYPbn/YpMGibZiodITW8gLlQprnx2aICZ4+3K/L8dFLoR3qV11KVfE
	0BbQztstDs2n0UdRQloMxwLDRgodkxrtPJkegWUXN5HEIVwl9EDNag0YLMK8JWh64NQ1kvc8rVJ8U
	ejkmRhfDOsfohkMPEnjhv1MDNxtVaitsQtz9Iha7u5EqxtIXkRGqgwkHnI9L5zftWvUHANrgHAOGC
	CAebH1TwfidrQMjz5RA76pzLf4Jr4CL7JAD5ARIYzYCVEbQ7EsPrr1Wjuh38Mm/mQ/VarGM7UO0kk
	gycNn+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Jn-00000009qdz-1qJK;
	Wed, 14 Jan 2026 16:01:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Jl-00000009qcd-1Y76
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:01:58 +0000
Date: Wed, 14 Jan 2026 17:01:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768406513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZ0OFnIX7hUMbsNflNAslWyTKRUhy/o2U+HmtUmHfGI=;
	b=rfd7vHBz1WLpBHPczQ9hBag1uDo0KrUEd8bXS0fbsoVEZPkBXa29t6yJQcrbonhGArJmYS
	DjKDiUNu936WcaJhnoLGjVVHSIQWrcuecyATrfQ5RgEVjT8W7kf7hGFlhI0XgdN5v9eaHQ
	OESy5zqu76PVbymLrsjJJMCVM+PjjbmLNI6mGL22NjNHVdYu0EA2O+xlLplv+MlsZWjQSq
	qNo4feUlMl1XxxXsOsucxoYEeHlNwhsZuQNevxPeuB0gnzH7KZKUPYTq/P5PE149JPciIj
	+hrkg6762jROj9jkM/49OZQZOr61ANEPIrDI7CICW9L8yvuABiq/ekJ5Ba3qfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768406513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZ0OFnIX7hUMbsNflNAslWyTKRUhy/o2U+HmtUmHfGI=;
	b=3DxY1P3GNYDLGzssQhKPKAP4fVb2O4OwkDPQU++qPNhVw73yzXipwIyScTrN8CYLMVDwjv
	SEaCksFXfofKgJBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Waiman Long <llong@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-rt-devel@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
Message-ID: <20260114160151.a6y9OxQW@linutronix.de>
References: <864iowmrx6.wl-maz@kernel.org>
 <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org>
 <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
 <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com>
 <87cy3eg94y.ffs@tglx>
 <5f4bfd8b-8699-4bef-bf49-f29965e95ca4@redhat.com>
 <20260113115515.98Mc29Nm@linutronix.de>
 <CAADnVQ+eQU+isNBXOJwQ=RYZUyO00e48ESHUhh8Kp7pgRgQu0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAADnVQ+eQU+isNBXOJwQ=RYZUyO00e48ESHUhh8Kp7pgRgQu0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_080157_546356_E4839FED 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

On 2026-01-13 15:25:26 [-0800], Alexei Starovoitov wrote:
> On Tue, Jan 13, 2026 at 3:55=E2=80=AFAM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> > The last one does local_lock_irqsave() on PREEMPT_RT which does a
> > spin_lock(). That means atomic context is not possible. Where did I make
> > a wrong turn? Or did this change recently? I do remember that Alexei
> > reworked parts of the allocator to make the local_lock based trylock
> > allocation work.
>=20
> Are you forgetting about local_lock_is_locked() in __slab_alloc() ?

Yeah but this just checks it. Further down the road there is
local_lock_cpu_slab() for the allocation and there is no try-lock on RT.

> With sheaves the whole thing will be very different.
Yes.

Sebastian

