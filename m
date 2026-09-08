Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6744C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=; b=imuHdWTQj83EodYb27QB1qUfcp
	BcrrZ/R7mg2VxQte7ACwq3cIqFGc42IO/ASqg9qu3GfEG/Rt17g7P1rnIVnQNG/kNSAl5PniYCfHZ
	mkpeMq4Fnd/MGI+ocw66ZHTYrgnwEpN6vetOQzAKfjwLkbe+Q9DTMs9x5ksDgVGAGlbKl6PoH54t4
	X3bXHAe7gzzW+2QmHhCWQA4JWx8x5YYYkbIT/8xYcgIiSiJrPl3UG4Sns3p87WoZKd3jZk6Q0vu5/
	Dhw600XEUqwiNra9QrL3wKUSvbieH+gSH4Jmrs7YQQx0dImDI3fgKzikSTMCjY/GAd/W/qGMUip8m
	9ZoftIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xjM-00000009U4T-1E24;
	Tue, 08 Sep 2026 15:27:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xjL-00000009U42-1FBH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=; b=ZBK0mfhvbBmYpqT6gMmzGdqZy9
	xFqTw0W7AvDH8fM73tTbsW7ul2OIMxK1KkB5l8p51zdKUo8iuwFzZ4YK9ecwruNyBtN2cwqQxU7hm
	Y4BG1x1W8HNCdLqSBDra0y8wzgocqAR1B+xnrAoFe3nyG8rhbC/hdhue0LLnWNMUJ0eb60sa492Sy
	zwgC9Vjt/z216Abgnro/jzVTfWNL01kSECWKZCAyRNFgSRqX5ocIXsTQcLuPIYMvqgHajKFjjAxd9
	zS8jPVBPA1wd5B2yOZZrDoIsxR54lsq4TwR8zvejRuheEvVIPCKvJGe25L/quWtCM6GBqHKDKGUnk
	iuwfQHwg==;
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xjI-000000001I0-0h5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:27:26 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso1317438241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788881240; cv=none;
        d=google.com; s=arc-20260327;
        b=IM69dWVaVs3bzHeo1+l7tIX4C6xCy1bJ7SLVinJdfBXT1lkx0NsRnISmV7MWaoH38a
         8isgsPQ/engfV8qhzqBJTItuIM6atLWOXI9aCrJzRlotJh6cQwCGmNM/C5hdbSEDEQSU
         nEVFjq6r3JdnecWJHe59eALYNam7KPZFzlaRGZC0auFlhYCCRqjmbR4QNNdrUF9b2KHi
         tdL8SpwuX9ES420X5nelxefwO24xIeTqybseOMK8PyjpFMs+0s9XuN4QJudB3qQ19Oj/
         tMxQ4QU2k741ouIfc4CtMb6uVaAvdsgYjeK92ac9P/iCc6RO8om0folymLFqK8mV2yT2
         +T/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        fh=4bJeDERPbBn0xnoDv7gDBQ+062IbEzDc3NoFVjs6XjA=;
        b=TYoCQw0bKyuAKMAXoVvVpbuVh7z40NI4Bd7AmNj23unXDtdgYNOUy+u3VwtQcWm4VT
         deZIypbWbfwEfI2YQixbCnYLqvCsa9U7am91bAEHVpiwbFqtmguo9f5aw+XqihuPRobu
         HYrS05EtesEE9YziYblO73/Ylu0bSzh4lA3wbR9UBAO0H+0p1Tz0zYmWGlOs2FY4pIDO
         IeGzEAdM03mzFEvCUBrTS6Dq8GykX68QSpZMbv+qyAaoKq9l7vHhH7DdBPUjrLQi/Ngc
         JrkfWSY70oBgbpXa00Q+cVWVd3tQQir7FnE9YKbbKxoMK2otKezmpYyDTAgCmA/EVYMP
         Po1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788881240; x=1789486040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=V3hk1/xfFffS1kE+Gj2RpW8+9QmkQHWFGGagqBqV3LPnufUj+mtqZaT1kH4sZOOnbs
         RV3oVlPVNV/haHBBwPhlC/W8t2lP+EEgag2i/Hvm0+Jsf/kx4VA0mxqkD7kq2bej1UJM
         G2ui8UmQ5C0CMo5iVVQsyY1jxK1X6dJIdO6/ZyhuoYQAqBeNpSQrsim8eRL2jEuL7349
         EsXUj+AHTjYcdKT163lW9o4iQxC0tMGjIZJ/de/3bCTf5m/McO8myPkTJWKSB8aSEU/q
         Pr31N9n5fmvlK9IpggX7sM7oaaufDrykOvRXLBr43HD7yLBrJWjc91i2ul7Mlj7tPjxU
         q3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881240; x=1789486040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=Z7a7mvFSPcU8h2H5vRthPWMKXennLSPucKn7kU7WdwiAtCAyUhg5fORY6Bnq39JANr
         VEMO915vggZUjnPAlfCavuNo7M+7l+pVO40+DzqlcJt9MB2P7HbkzupOJyAomyCDyRl0
         OGWlbRwupBjQLFTXnaph5yrX+5w/ZHy8vazqh4IyY8RX9yRzUM+bcG8xKGFSwQSmHXaC
         M1niAaOEPsGUhGlVTud8A6ni5iJ0bfYFgsDg/xEENRjI7nf2jqs0AxXsfP+UOKhNDRUZ
         qMAKfX6+B3iB9FtwccYBI9bDYO7BeX2erIUOr0kh5iDFf2DC0zZJV11QVrGQ4DxmZBo9
         SX2A==
X-Forwarded-Encrypted: i=1; AKwUvBwli/tFNSWFX9fVoPrvSxYWHRHE/V2IS286wR0Nj7eex55MMr1dEjfqdZ0N/eRHbPKKCylW22ypABt7HhJWwKyR@lists.infradead.org
X-Gm-Message-State: AFuF++kCpqMl6LVz4PtQx3Uc+jQqpnzfeUmILNWcMbuhQmzaL1R+1UJ0
	gDauxoW9I+wj/AHzfMyQ4H4Y+ugaJG1g6DEhowuYimBlO/Po/IXDdYsjiPss2vkyGw3pi7n4re4
	GK08ZM81V6+dEeQKLflr7ufdWJgdNMFA=
X-Gm-Gg: AYBFou0t2S28XDYibrt+IHdWFgL4koD0zL6IEDSgWe+uPAqPVFV/6k0UE7Mk6QB92b1
	N/94R3cvQRiy8odiJhaV/4Zs4et8X8fIywHIDyuLCwzsPGtgPkNXNUxn/oUeGzxbr3JfipMFZsH
	p9jTnZPW7qZn/ExvOXnMqm7EZb02V8bKriqngliplP0CuE1kub+Z+0SgDYiJyfDe0Adsm3JhNsZ
	gsA+KVyloilxLcFQHCl2eAnWcrNRG/aalaJhJaH0syRMvkvZ931z59OZFE+a1dXhy4WsO40lRIL
	Uv9xQPbLaaZIk4a1EhzAAFVmJyeFuaZjjcQ5WT6ME7C6SD6HePdrHxnpYlnhGxRPY93Zol1gH4E
	LCTum/TtbYQae0ABGLUBHuzJIcnPpJtvPf9CUVHbVt9k4aWZmWi8zC1azc8RrJRCV0iR8sgVm+L
	JVtCSMMi7InNNEdpntW2GmEGi/kDyh6aj3+K7kqQ==
X-Received: by 2002:a05:6102:3b05:b0:78f:7135:b4ff with SMTP id
 ada2fe7eead31-78f7135b567mr108498137.2.1788881240558; Tue, 08 Sep 2026
 08:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
 <87zexst5ze.fsf@bootlin.com>
In-Reply-To: <87zexst5ze.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 8 Sep 2026 09:27:08 -0600
X-Gm-Features: AcwNN1XTfSZyHBIe8pqnaVApbMCPBzAi1LuuzXv-U_kf3BpB2aghA9-Ue90Qud8
Message-ID: <CADvTj4rFxwgYZgKzcHZG738UV0_94gxG1Dhy--ET9jC=E1dgoA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page size
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_162724_416058_B9A19B75 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, Sep 8, 2026 at 4:03=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hello James,
>
> On 04/09/2026 at 16:39:27 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > When nand-ecc-maximize is set, the driver unconditionally selects a
> > 1024-byte ECC step. A NAND with a 512-byte page consequently produces
> > zero ECC steps before the available OOB bytes are divided by the step
> > count.
> >
> > The older sunxi NAND controllers support 512-byte ECC blocks. Select th=
e
> > smaller of the page size and the preferred 1024-byte step, using a
> > 512-byte step for a 512-byte page while retaining 1024-byte steps for
> > larger pages. Unsupported smaller steps and controllers without
> > 512-byte support continue to be rejected by the existing checks.
> >
> > Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> As reported by Sashiko, there is another use of 1024 down the road which
> must be modified accordingly. Although, in practice, 512-byte page NANDs
> have disappeared for quite some time, so this is a theoretical fix more
> than a real problem.

Does the v3 I sent look like it should work?:
https://lore.kernel.org/all/20260904-submit-sunxi-nand-ecc-step-validation-=
v3-1-931cec317c10@gmail.com/

>
> Thanks,
> Miqu=C3=A8l

