Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD927CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 18:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=; b=MnAs3HGaJ4fDtdFfTb7OrN20sN
	pKlMIe6tP+cNqtdFbaTL3MK+3714O4D2I91/nR6iGxNCUQzAEhdbhpamimRpz/NtyXQXrkpoMNZBI
	d9S91UT0bGnxvd8Alx/CjroxsH4HbAzy6vxR9exWcfjjweQrJlsFpN4vHkOM8dFiIC/4ctEhyLnj0
	TeZDasbpbFmmIfLHi6Bc9PlgwWp6SQgS5Snh7yMqelrj0Ks5l7Uj+26DD+i8xYUEVNgz4fVMFq40T
	dR2IMlvw8I1EYxRjv4SJ3nKFIHjlnOO34TrUP/LZUoxzk2C1FpTJz+08a13+bJUKwjFcNT4FGXpu1
	4fKXweCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFydi-00000009JqS-0YJD;
	Sun, 11 Oct 2026 18:51:18 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFydf-00000009Jph-0SQO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 18:51:16 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6de2f213b7aso479706eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 11:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791744674; cv=none;
        d=google.com; s=arc-20260327;
        b=A8LNKkDfw5POd1HGSAf7KIDh4889Of1hr7lbH+HkmCeCcuY9ULLB8lsQT+d0qfjcRP
         HrTbmFAj/6Wjr/7IXiaLfYiKSWdcSQ7ve9zpX5wNx26sgL8LFgBDI9MPlk+lMdJfw+R2
         /b/zPrjd3QHiUB1Ybh2vbUSzKumziKpzjMpVEHNV4dZGYBHULXO8SltufnZF9NSXrdgB
         sozs1bbtXokvRNn/RI8Ve81GcioxxgyOriez28dGd5txvBP/bQwFTDg50kq5zhT+UuQt
         KVrWH1nDFxA+AJ0tgqIt606TSZNj2qn5WYNRQZB2BT2lwWjCIwsW74BmiApL37vOI65Z
         zTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        fh=yGtBuq4aAM/Sqix+FH5jaEoSxo9Fx109ATGQXAn9PaE=;
        b=FrJqfDEJdOvahjkcBH0DPdiXE2JwA+1pyOVcgZ7He23fe0tsRdku7K77xJIgYcykdy
         BWTLR5SAYth7QlahnYxYumL+fwqQw91lA3eVWYSjz2TGgDFrTnudtj4eshPiRm7Gcd6w
         BrKQNYDYF+xpghvK2+CzFoGMCfnT2bpY/IwmnLclEYrpUWd7qQ6qMaefAykzPpNwv/Tc
         ehdqRkgst7QtRa9ITXXh0gLIZqGnagv8lek94n+luJqJy196bkFu22kf+2Wg037Gx39S
         /E0SytDee29BVadBqxCj7blMYUQXOxmunWP8I9wS8gLHlkZPmApCQolgyW4xlrTe0Uu7
         EHWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744673; x=1792349473; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=a7XkSvdAXLwvhpizlk39f7MIPy4TSoDtAoJPpYvXSQXiQNp4JCainv1HlduWnN/Hy0
         xCsPzAMtsnk9nn1sK9r+aXfKMi2zgoz2TGl4R8e/4MAuGOjgJ7uwNhUWfV/zxTlARqaf
         mPLsfHmUHvkcxa5oDTcaDn+7QPaLAdY4kgqh1zZs3qEcXb9/TTD0nsT1RSUgoiFWOHpH
         1M681I3u4sZT5nL17PiODTtHMRSpfLK51e3rI3233yWj8/pYPtLUuT1N6Q5adTLbXS5t
         Tij/IzcT5bASmaKZalWizwm7IG2Pi0JkI1yDSL8TEuxM1DecNg1Zkx21ODi0RPbEK7jX
         x3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744673; x=1792349473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KIupU1PlUnI74kbeA9rKFTjXf0bMD2fNsbxeKLKsfA=;
        b=UaolaZkSX9+fH2NYC/LlQqilYIn2S86TKGGkm3CUEG2sE1J7rH0ulgjNXpFuHF50tI
         wvQ/IVDhvmxNkFFE6r44HwmO3cNfVwarSen6AZqrYhdnQt7svWF4DFxlHt7ETJtpmECC
         evvVZRHB6R2M2bLoVRszqOf5Ahgnx8cF6lS6N8VBALZB6k0F/sgLm7bnpsbtPqj0ATq0
         Vbnr4W6oVwzmYtFg37O/TaAorvB/eLtp00qdYB5VxmdL3PCxjvtJzVoGhyUAKPt+40ji
         ArXcnQ1J9EDkk23kLwrLjGcVFNuFW9AckLDrEqDCJj2iKJ2J2vCYTgfkpx/6KBP/fxEv
         Dd5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwU+CMe54jRwMXJPGxYhmHqViP24CT1Q6nHFjW/dRSqkrP1kYEQR64Bb/lU7bOnpLz7g07DACUkxt1K4QrAsjHX@lists.infradead.org
X-Gm-Message-State: AFq9FYIlCjounA9caWpyFufTbZsJUwoF8hRASfd4+9ERFTA84bzu/aBg
	CGWqp1U1WcuX+AEvrpr+nK+mked+boKA9+kny61nAa72kR89omDJklrXHpaG2LCgd6skGTY1rLv
	aN8MfOo08NIZnUJH4pHlRABXjBiU0ywU=
X-Gm-Gg: AYBFou2jiC9wdwoZUtX+ig4HYH47iXyjd4v5g/RTfWslYsLw1xhjh96vyaohnfq3z5Y
	xf9q5ppphCcsyvtzHt5pv6cp2mDYgRTeOlC+vZ5lNW4DKIKoLZeQ0hn6EBevkWxRW/Mh9gGtIzJ
	cfsgc4PKM8SqGYz/Pei62LXE2cqXGBjOW8Z1T1yb4NM86Go3+pZkvBfKdpN3Yh1Sp4HuqmnZlB4
	raCTS22HtTVxodQdrZvbxw7RZgQ0aEklYsPMDwJ+rriEo3dKv2M7vQZv966hgIysO5zuN2nW8BW
	ukPO99bxUPZPZyM+hIf5ssga4zent6k5/HQtUYMJ3MhW67hyVnWbcns=
X-Received: by 2002:a05:6870:e311:b0:47d:a12f:3951 with SMTP id
 586e51a60fabf-4a2a89f425bmr6103374fac.39.1791744673650; Sun, 11 Oct 2026
 11:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
 <20260907-6572-gce-v2-2-412a5b037290@protonmail.com> <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
In-Reply-To: <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 13:51:01 -0500
X-Gm-Features: AclHuK96ynSq9uLesTtRAZnhZ7wj24Xtpvp969Wwe99Ul08jW1tzra27V2b0o08
Message-ID: <CABb+yY3oEfZrx+=igTVUOSGB1+J-pa6=k=+DGOxWozJnK_sJgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rva333@protonmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_115115_164197_0C7972E6 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, Sep 9, 2026 at 4:57=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 9/7/26 20:03, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Some SoCs, such as mt6572, have different WRITE and POLL instruction
> > encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs hav=
e
> > 22-bit offset and 2-bit subsystem ID.
> >
> > Extend cmdq_instruction struct with additional union and struct to hold
> > the legacy format of instruction encoding. Add legacy_isa to select
> > legacy GCE ISA when writing instruction. Finally, add special handing
> > for legacy_isa cases.
> >
> > Also correct comment about PA writes, because it's incorrect for legacy
> > ISA. Only v2 (mt8167, 8173) and v3 (mt8168, 6768, 6779, 6785, etc) have
> > GPRs and SPRs for PA writes.
> >
> > While mt6572 GCE supports 22-bit offsets, the parameter type for offset
> > remains 16 bit, because all mt6572 GCE mmsys consumers are in the 0xfff=
f
> > range.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>
> Verified in the lab on multiple MediaTek boards.
>
> ... but I either need an ack on patch 3/3 from mailbox maintainers, or th=
ey need
> an ack from me on this patch to pick everything.
>
> I'm fine with anyone picking this, so...
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
>
I realize the patch order is messed up - it should have been 1-3-2
instead. So maybe for this time...

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Thanks
Jassi

