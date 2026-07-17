Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253D3C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVMjIqA5wERc1VK0TSVspzDmfYe5coCITH1bpAnvXTM=; b=GOfsdN+00vXIZ/du7zcVHrvob/
	f/e0C0zoGaRFCgmj3cpP+mYnmXv1GpxqyyoopBHICwEIyb2cHbSxi+Odn5kqrMWGoUSofGDv36VRR
	WUpvVTeJrKIjizWKE13RFeVuKh0z/l6DA4ZuEboEN16DPHOBeXtVinrQkJocfXDsIvQlcOCzS6ORH
	nrdEF2GeN8EGvP5T2P67r/UvmmZiUiNNq++KyQYq+3ZRgWK10ZJv5ma3C4qjz13qyGf8KzBdkdttm
	xm+CLHqKmvHsyMirQn1fQUPj/MNJTGYhohNj9MI/qsB476XuZFX1JZwWP966J0IlhrLYo22CWRL1C
	tQeko3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgRK-000000027Zk-0GeO;
	Fri, 17 Jul 2026 11:09:10 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgRG-000000027Yz-3gDL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:09:08 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aebd7da975so904342e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 04:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784286545; cv=none;
        d=google.com; s=arc-20260327;
        b=SEtm6DoEAJAuydKGeUpNo/UfmxDIl8oN4gWqILvLthH99W+rux6getbrpHnWwYfUkA
         yYxqmGFICfItADpRhgp2HUAeTVUm25ciqSCNm+y2VMS6oyhZ304LgyAJf+gbTYTFfwwc
         ScYo3FPb+z+fD+EV2nz+yY0HkHh7JQEPhmRE3IRLuaIBg1tNRRiASJKSGzmt0vDP1gLF
         t6UrmEABvfwv/iUJkwT+Qq4b8VNPdLpRprF1i485dDkEjMXtwGCu8TC6mYAW0Ceik6wc
         tWtLWC4/sJCt6t9C5uYKr4UuI98wVgrxU5scaHK93JzASA9627p2T9awHitc6RQ21pFx
         B2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IVMjIqA5wERc1VK0TSVspzDmfYe5coCITH1bpAnvXTM=;
        fh=4+DpkPoifXVUomJdSpwBxdg9pqXPJ7G3a4WCX/Q5qMM=;
        b=PyywavYuYTN9OaKSETO8k1ps4OY8eZMbafc1yiWFeQRYfrf2e5PA8scD0X8K7e0TBN
         gaKLTgEZ+q+OUyGIdz7wf+INgkRT3v08Htrm6s8x0nD7xKUqbVdjkQU7+MJewNKsoQ38
         78Oca5+nA/IyHDUvgHSw0tfYimqxc81c5/jmdXcmEkdihYSpti27cX7ZdmZU4LOW9EB9
         Hrg/nFD5LIpfDAdx0OOs1EiiaqeVxsUXjmdsSzIPcdfIP0lLibzufkd4MIk2QbqooYAI
         Pv4O/qPppaLDD5K+EGr/hXkNx7lpxRWnCm9z33RNMCumeL2jTXGJrI8f4frsSWbUnrTq
         Wk3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn.de; s=google; t=1784286545; x=1784891345; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVMjIqA5wERc1VK0TSVspzDmfYe5coCITH1bpAnvXTM=;
        b=ZCLkLBO5HAy/2RsN2GxTfonfT3ys7NQygJDybWnorK2mmxUPvpqpcAIlQtGBSLh/nd
         MzaexoZZXzz9oEYAklCV4vQH/zT3N4xY/EahF01G5DqK/kCVRaX6BKrCrxiX46qXDokB
         BrCni2OJmnZ6nyoPwdF+uhXBE21lbnVfDkqRA+8DxjC8TzetP6gIh9Sg0Fil0jBXtUYs
         DH+IkWHLafJy7bnd9NI4iwovDJBBUWbCpxZtlPLENd4NsWJCqXQwL+2ZvTr8MLuBn8RK
         Y7REopWI2oKmOrWr56EoNMXKNeFyvE+Mmoggcs93hEOGcnKMwTzQv6quAZt27/vEoc89
         SwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784286545; x=1784891345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVMjIqA5wERc1VK0TSVspzDmfYe5coCITH1bpAnvXTM=;
        b=EY99++2M/WSi0QiysxpPIW5mVfLuFsUIWM6HadTyNnE1RCCLsPQYBKAUBC7GjDAFAk
         s1oo/Bc/fSIQRD7XBM9ckX2c9E/30fbep5j8hXK0Z7QBhHvqeKyIs4B2Krz+C4jNwa6K
         9sDVzaGTQd/Wx8PEjF12cWlu3YYNE4aHJ1KREgBvBGDLHVnVlC4NW7Mhx/IQJp2JDEOG
         zf4OKsjWowVzL/Dh25gkr9L0gR2YROx5mucyF3KfTectZ0DiilolgQHZR5B2SFLK/RjF
         TiUEY9+XtKRayYziwXxHo66AOyxjqbcXf7y/EDq7A0ag7OXEEoe/n1cTW3n38nBTbpob
         HIhQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4bzJpcJziKkJep/RDz76TY81Sjzu1Bk4fTazze/TP5uVnuKmZFaVQ6UqREUwD8ajfGHylFkV73rv8BsKKlr41@lists.infradead.org
X-Gm-Message-State: AOJu0YyjzXgRmKU2hoONv3pyFqkNhKJ1vtHyerXZYUJuQFgl3q6CrwVE
	+apPpPN0xTwDHF9vk9oqVkbMwMmeirVSDGHDw3qHjS2CE6xtC2D5Y0mEWzzIHtEMpaGg3z+b1l8
	b4tkai4yulPdGaDwJpERFizFcyUOoETA7gATZAUbkAoSCUgkonviasEpWuW0XlTNSelvJo0qflC
	7nBxDxJwkBwcwKavO8gCILhOpWg/XUILCImVVB3E9U1sW0
X-Gm-Gg: AfdE7clsnZsKyY3pTihx1d25RC6zaAv89E1OgzkEQ5lTdRoLD9XGDN40L06lj6lNgcq
	Yf7yMKQ+QHvkoS/esiGOGUK2MLpgekY3wZNg0i/Sbz7XZMdqAlDi2VQa6a2DqhSUQuQmuZ6V4Rm
	SoNfaXGhbgMUkXh9wvnQLSuc6bV52R9JzLOpmWdoETxN1YVolXAZe2r2RMNMQoIqLYXtH2z8HL8
	W7ar/NTPlV/kPERaJTSNGoPa1U2qOZwE+DfnYH4x1xt+qF3LU0LRm2dwn7oMHT9tTOmexg=
X-Received: by 2002:ac2:51c6:0:b0:5b2:8d3e:723b with SMTP id
 2adb3069b0e04-5b28f87712fmr299173e87.1.1784286544689; Fri, 17 Jul 2026
 04:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260717085507.34209-1-jonas.gorski@bisdn.de> <eba6d3b3-b5ee-4543-a437-4e7c16c5653e@oss.qualcomm.com>
In-Reply-To: <eba6d3b3-b5ee-4543-a437-4e7c16c5653e@oss.qualcomm.com>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Fri, 17 Jul 2026 13:08:48 +0200
X-Gm-Features: AUfX_mw54--TNQFoTYsWHV7VstC3XqvwiGDE0dEj18UkhlySQ3jSOQB47lLuss0
Message-ID: <CAJpXRYRyTaYgKGz6_JvFFZhQD6ioe1cnRUgGuZK2TxnOB0rH_g@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: iproc: reset bus after timeout if START_BUSY is stuck
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@chromium.org>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040907_632140_0A00532F 
X-CRM114-Status: GOOD (  31.10  )
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

Hi,

On Fri, 17 Jul 2026 at 11:40, Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 7/17/2026 2:25 PM, Jonas Gorski wrote:
> > If a transaction times out, the START_BUSY signal can stay up, and
> What's exactly START_BUSY signal
> > subsequent transactaction attempts will fail as the bus is still
> transactaction =3D> transaction
> > considered busy.

aah, I was so concentrated on getting the recipients right I forgot to
spell check @_@

> >
> > I can easily trigger this by attempting to read from an address with no
> > device, e.g. when running i2cdetect. After the first read times out, al=
l
> > subsequent read attempts return busy.
> >
> > To get to a working state again, the controller needs to be reset to
> > clear the START_BUSY signal. So check for START_BUSY still asserted on =
a
> > timeout, and do reset in case it is,
> >
> what's here after it is, ? wanted to end the statement ?

I think I forgot an "it" there, "and do reset it in case it is."

> > This is also done by the original non-upstream iproc-smbus driver
> > implementation [1].
> >
> > Works around situations like:
> >
> >      bcm-iproc-2c 1803b000.i2c: transaction timed out
> >      bcm-iproc-2c 1803b000.i2c: bus is busy
> >      bcm-iproc-2c 1803b000.i2c: bus is busy
> >      bcm-iproc-2c 1803b000.i2c: bus is busy
> >      bcm-iproc-2c 1803b000.i2c: bus is busy
> >      bcm-iproc-2c 1803b000.i2c: bus is busy
> >      ...
> >
> > where the bus never recovers after a timeout.
> isn't there a max retry count ?

In this case it is an already bound driver(s) trying to do (new)
things. Each busy (likely) comes from a new request. In our case there
is an RTC and several SFPs behind an i2c-mux.

So there are two scenarios where I encountered it:

- during runtime after a few hours of uptime, a timeout occurs
accessing an existing device with a bound driver
- and recently while working on a different device I noticed that
reading from an unoccupied address triggers this also

> >
> [...]
> >       if (!time_left && !iproc_i2c->xfer_is_done) {
> > +             /*
> > +              * The controller may fail to clear START_BUSY after a ti=
meout,
> > +              * reset the controller to recover in that case.
> > +              */
> Make it simple ?
> Recover controller if START_BUSY signal is high after timeout

That's more or less what I had in the first version, but was asked to
expand it (split about two short comments)

> > +             if (!!(iproc_i2c_rd_reg(iproc_i2c, M_CMD_OFFSET) &
> > +                    BIT(M_CMD_START_BUSY_SHIFT))) {
> > +                     bcm_iproc_i2c_enable_disable(iproc_i2c, false);
> > +                     bcm_iproc_i2c_init(iproc_i2c);
> > +                     bcm_iproc_i2c_enable_disable(iproc_i2c, true);
> > +             }
> > +
> >               /* flush both TX/RX FIFOs */
> >               val =3D BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_=
SHIFT);
> >               iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
>

Best regards,
Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=C2=A0Dr.-Ing. Hagen Woesner, Andreas K=C3=B6psel


Commercial=20
register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=C2=A0
DE283257294 <http://goog_1008408251>


