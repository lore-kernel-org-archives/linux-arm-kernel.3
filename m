Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24C4C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pG9a6R2lI8zBUJdzvIIYffn5eO9OTw8/lShO/60FBpw=; b=Iq8AL5gC7q2balRViKEpA2vjyr
	xSSjnBplKs//MVEWmsV7AuU3A9OIT1n4/ZEFhC0R5TpwRX+AprT3eqQX6/jkDxaWpjK8Y5uOC0vjo
	2F/ZcsYV6IVc6u92AnD5xyU1hCmxOaER2A+C8Ffy91Sp37QTD8UbFILDAC3Mgl0uBuVyW7Ty6JXzh
	bM8WqsPL6nZHWDM8WuCObsOsoLYGuZngsAuXjRUXl8SuP6Pm6QhDOG3i+OfhKkI/Uks53O7ASRQ6i
	XuDxJkiz2Az7bTqUy6gPvFfPnN+pOPBEGlej86s7s02IcUcFd6Uv6kDSbWFC+WXrmTxrUbJ4o+QSA
	GoW1W2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvhQ4-000000054RG-24vD;
	Sun, 16 Aug 2026 20:25:24 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvhQ1-000000054QZ-2oO2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 20:25:22 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-669bcef451aso285693d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 13:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786911920; cv=none;
        d=google.com; s=arc-20260327;
        b=nGBAOCqRPc1AFbQiZ3/VSVT8RKfUY3FbfdrRXCCGpYYZd9+zmEHslo0CknOQfPtDSm
         u71qkl0zYGGy6bcJEeHD2C439ASJMuQHfgCPSxBiGRCDk6nb8elc4VONA95zr6yZALh0
         uI+Zg+dMRxW4hhgQg/2mCnxfNPsL6FngqkBgtTzxtqx9K4bWhoyoyHB62fM9tpkiU3Rk
         o+hl+3VZtTF6kZCjvNLOMgTovIvTaw4FZt4Nj3Ae7iRPY2c1inF99Dw2YGYUIFkc6Bjz
         yguRPIMRWC0ePsRBpB9l3k29nq+FEOa7PQCPLCHdsP/HxkzeMYYjjLG3Sp1bEilryC6B
         08Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pG9a6R2lI8zBUJdzvIIYffn5eO9OTw8/lShO/60FBpw=;
        fh=yvQPddtK8l/7LORd94l8HpbSI82q/r0+QeZw3kYXkHs=;
        b=dQAJJZTXR1OUbrklB3pVDyaz+8t8ZVZ0nCU888DR0278DOVZsihIVTcNuPVUsU6Rss
         AOO+/8YsAebsSo/V9CaQzsHR7ofV5MZNi+vP6rTZClB8qCkQWNr0pzzFMJFk+nx40FaT
         VZ102Kb1K7UVxmuNRG3jcOBv9fl3JZvfzcGj4ljeQqdn1pJEWfeCp71jvYvyn7RTWZ1+
         eh2yXv+tnvixLrY81CT/qzxGCJgMUzH7KQ7Nd6t75SjtUnZ/VyeefdEazoplMGt+cTcK
         YViSIY0Vv6lF3WA3tU9PcmoxCQ1BG401nNOdL/aRHIoFYz6zB2YZ346jYU7W6W2JeZd4
         rH6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786911920; x=1787516720; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pG9a6R2lI8zBUJdzvIIYffn5eO9OTw8/lShO/60FBpw=;
        b=h0qUwzLEGYS2NB/4zroLbzS26PtcVyIHTGWOV7fYLkrysj+D9ckk5NXXZmRfWpJ345
         LtxQag0PEue5tZjescwA3HxEOL9gzULIPsl3GrVsNr3RUuK1zY392u3m2sUpmXq8leIr
         l1AYbkBFA/o9NKlaZltXExvbqAp+2uUZf3jeejHw24agRdM2N5uBhYTfrAUqUt7XuLgB
         tk+RVG2SCpuqEnOr1mZynR6TVPVtrgyImMk2wEScaH+ft0hCYUfUN4fAscxGBC47B6Dj
         +mswPXtDAVSTaEk/QDNI9cDNRGtCnV2IWN3cpkj95SqLobRpQtQGD+DDH3DXC6tZrQjQ
         Oczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786911920; x=1787516720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pG9a6R2lI8zBUJdzvIIYffn5eO9OTw8/lShO/60FBpw=;
        b=SwAICzo+b1HOtMJ2Eh/GIqSW8enBe2frj29XGbkHNLAaAj8LirtHkCxPP01+H8bjdl
         4WlqK3uS2O5jX8N1SWwNcTZ2qBdEn+PgLHJdpYEna35wqEAMKT52eoyhslXBFKsFEnbs
         izEzzuFfXt8ztPGvc2/TjJUDt7TWOCHyuhwG1XOVg/ay7iit5WKLzKDfCg4NqFzyxYn5
         H/67e2C+xCpXFinqQyKaYFq60WprPPUIi4n8+cOHOUs9MVuIkMlTyvVQbcwjHNph7iG2
         OJUUJHVc6TbZCYQ+RyAzU2ZzcF5SZAPYtovaRrWYl+O0ENZx2xmpnek8F4qQyXiu7uMu
         0Nww==
X-Forwarded-Encrypted: i=1; AHgh+RqEeDC5Gztb9dTHsGmi6UwYM+XXNz+N+NkAWLVUNJMRXRfijHcF/2R4IoV2lDfvdI8yKmrOMgaiMpC2G9L1frVF@lists.infradead.org
X-Gm-Message-State: AOJu0YwwZVuQJ1hr/MW5q3KuQUsF6UZ1ZwKTNfgRejm5UGM2kwSOXadb
	BuAm/RdY4hbMiidoTt8YCm7Hl8J+9owFuYWvNf/c9ISn/3XY5VKCAEhC3k4yFHI4hGYUcuEHbo4
	66rhDcw7+6qLUB+F9eXkYF5Crs8ZjlBA=
X-Gm-Gg: AR+sD11AQj/1EqZ3kyOBYiVA5+1hDcMcovNxKvh+GymNVFY6LzILWDrLvrXBaU6bMYe
	ZA0UdaML8FruwV237RoKVQ1xYDUOVVq1s5KZSa6HMbmVWXYTdMG7yNpL4ubbLLaRkNxcjM7zVLc
	cZcz77T0T1D/3v7aJSvSojW3t1D2UaVvR1Fmvs3cO68g8guGg1hTvoFpkDGTPo9u/eAnv2EPX5y
	P2+r4uo7gmS29+Hx9UzntZZgsaKPqt5n5rqlat2Y0/oXSKwKVUkCzUsGL+ZFjd+sJ3eZeqDGNWY
	Lh8ueO0YUSsSFgLuoww2go0XDa9lHePAHGfnHrqaSsjodQ7a/dQgXPOI4oBJPt1BwVGgcbra6vu
	l
X-Received: by 2002:a05:690c:6d89:b0:820:100e:1abb with SMTP id
 00721157ae682-83713764b12mr81554827b3.4.1786911920200; Sun, 16 Aug 2026
 13:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEWPSH54fhzKEYR1cgTskNgKryDEMaZOY1y5aFdKQQyzfKbYfg@mail.gmail.com>
 <20260816195837.497735-1-gahing@gahingwoo.com>
In-Reply-To: <20260816195837.497735-1-gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 16 Aug 2026 22:25:07 +0200
X-Gm-Features: AcwNN1Wl390p4y87UVjUoqPILRXDJMOlLHfhAU7h4LLl0DQ3-Pk8Q_Wr5x1SlpE
Message-ID: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, chaoyi.chen@rock-chips.com, 
	alchark@flipper.net, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_132521_735106_64D0F8F6 
X-CRM114-Status: GOOD (  34.31  )
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

Hi Jiaxing,

Your conv2d-cal result made me curious whether the clamp is a property of
the RKNN output stage in general, so I built the same shape here: 1x1
conv, 64 input channels, 8x8 surface, uint8, out_zp 128, no fused
activation - and compared against both references. On RK3588 the answer
is the opposite of yours.

  output channels    vs raw CPU              vs max(cpu, out_zp)
   56                56 of 56 (47 exact)      0 of 56
  128               128 of 128 (113 exact)    6 of 128

Maxdiff against the raw reference is 1 in both cases; against the clamped
reference it is 128. Where the raw reference falls below the zero point,
the hardware output spans 0..127 rather than sitting at 128, and only
0.6-0.8% of hardware values land exactly on the zero point, which is
about what the distribution gives you by chance.

So RK3588 does not clamp at the output zero point, and the clamp you are
seeing is not something the DPU output stage does everywhere. That is one
more thing it is not, and I think it is the expensive one to rule out by
inspection.

Three controls, since a "hardware equals CPU" result is exactly what a
silent delegate fallback would also produce:

  - the per-core NPU interrupt counters advance by one per run, so the
    job did reach the hardware
  - 15 of the 128 channels differ from the CPU by one, which a CPU
    fallback could not produce - it would be bit-identical
  - 46% (oc=3D128) and 59% (oc=3D56) of the raw reference lies below the ze=
ro
    point, so there was something for a clamp to remove

One thing I cannot tell from here: whether the difference is the silicon
or the userspace path. My runs are upstream Mesa main with no RK3576
patches, and yours are your working tree, so the two differ in more than
the SoC. If you still have the RK3576 board on a stock upstream Mesa, the
same shape there would separate those two explanations - and if it turns
out to be userspace rather than silicon, that is a much easier bug to
find than a hardware one.

Yes to the 88 and 120 sweep on RK3576, and thank you for offering it. If
the toggle follows the same rule at those counts I can re-run the RK3588
side with the forced constant for symmetry, so we would have both forms
on both SoCs at four channel counts.

Best regards,
Igor


On Sun, Aug 16, 2026 at 9:58=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Hi Igor,
>
> You are right that it is fitted, and decoding it against registers.xml wa=
s
> worth more than the fit was. I had been treating those two words as opaqu=
e
> constants and comparing predicates, when the thing that varies is one bit=
.
>
> Your reading also named an experiment I had never run. Every measurement =
this
> board has produced was of the value my predicate happens to emit, so 16 a=
nd 41
> output channels had only ever run with SIZE_E_2 0, and 56, 64 and 128 onl=
y with
> 1. The cell nobody had filled in was SIZE_E_2 1 at the small counts. Forc=
ing
> the constant fills it.
>
>   output channels    predicate     forced SIZE_E_2 1
>    16                16 of 16      NPU job timed out, 0 of 16
>    41                41 of 41      0 of 41
>    56                56 of 56      56 of 56
>   128              128 of 128    128 of 128
>
> So each form fails on the shapes the other handles, which makes it a two =
sided
> measurement rather than the one sided fit it started as. Taken with your =
RK3588
> result, RK3588 does not need the toggle and RK3576 does, and what the tog=
gle
> selects is SIZE_E_2 rather than anything about the channel count as such.=
 I
> will write it that way, as the field with a reason, rather than as a modu=
lo or
> a parity of something.
>
> The other bits you flagged I cannot defend yet. RGP_CNTER 8, OW_SRC 1 and=
 the
> two in the reserved range came from vendor captures and have never been v=
aried
> one at a time. That is a sweep this board can run and I will do it before=
 the
> Mesa series goes out, since a value nobody can explain is a value nobody =
should
> be asked to review.
>
> On the unclamped reference, thank you for using it. It changed what I tho=
ught I
> had here as well. The clamp is only free where the quantised output range
> starts at zero, and on a middle zero point layer it rewrites about half t=
he
> surface. conv2d-cal is out_zp 128 with no fused activation, and against t=
he
> unclamped output it is 0 of 128 channels rather than 128 of 128, with the
> hardware equal to max(cpu, out_zp) to within one everywhere. Where that c=
lamp
> comes from is still open. It is not the output offset, not the BS block, =
not
> any register in the stream, and not the coefficient records, all four mea=
sured
> rather than argued.
>
> If you want another shape, an output channel count of 88 or 120 on RK3576=
 would
> tell us whether the toggle follows the same rule up there, and those are =
exactly
> the counts you already have on the other SoC.
>
> Jiaxing

