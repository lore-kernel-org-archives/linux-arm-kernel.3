Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DDCCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nildDfl0lwt1rEp0UvoHwGy0UqbjD9j3If0RBiN1My8=; b=26GzCUXA37XXuouwG0+fYwakSA
	VxTPJbLbbSHGMDfQ2mhyEYirwt9/CAWXVUMylUoe3Zw4DQhv0VuyTroaRyCWNxToBmdHBleOyjEFA
	j1+DIpnbxeIo/lrjJ/WCX0rprT2XbEhcsdOLSAXIqQdYJEt6XZ2LkAOwT09EqcOOvjwihXUyE1bj3
	0cKLRo7RSxO0No6Ft2Mf1QXI7vEKS0NpLbaSly+Eko8CIVxMT7cYx2akAiVl0Vv7/kjg/nwR9LZzn
	JzrRC4TTyC8m/DkhX8hbVnB1UJwzPtHeGlaHAdcMg8nA42gepKa/Tl6uT0KrX6VPCOAIvnL4oy22B
	Z2wYNoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTb66-00000009M9z-0Hjd;
	Sun, 31 May 2026 08:00:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTb63-00000009M9Z-1Irz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 08:00:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso15016396a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 01:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780214433; cv=none;
        d=google.com; s=arc-20240605;
        b=UrsoUgiv+ipRABnzIk9XfHQDoq9OiUlHfdoKGpyisUdZDJpW9N6Sc7hyhfl5JbpKFM
         3ZoA9zLsk7lhxqGMFg8kvPW/pVVxx5kxjka1/dLPdk6IRXYiIsjnslE6RjX+qIXlkcbv
         m/ZgzGp0tG+IipCFga4T+KGwASlj/4/NB/jw8pQ7dSoUKC+NC4OmKC4srxwmhE3Kos0R
         3CXfF5bQH3AKDIy97bJpAlujd8eyYvXtjRGBcoE80Z6dRVusbH9QeRuKTrUGtCiSqNdn
         893vUb5j1+wwVLRx5dNzElYxTlh/QlRlDYl4DmODLh/Kfg/+o5dMZT5MClozbHEPJ55z
         hBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nildDfl0lwt1rEp0UvoHwGy0UqbjD9j3If0RBiN1My8=;
        fh=jV4nMbhOy5s6pd6wJgJVGa9Nu+sN0s7k5firBR4pRlI=;
        b=HNjGU1IE2Sg6RuDmPaEyr9uccpvfctAsSOR+UQfxboFUKtozztYMIPl5+G/1CbFsrx
         I4BdzbMGdNrqHgVFhKoRiYiNTxdpCMZ45qLhk+pUQgTkHmIFxXu3AARlEP1xtzr9rcDA
         PGr/u7CLiW5/OP1nEsm5t6KHA+QLhiDatGtmPjrA29S5P4q9RoCL/Z8pBANbI1baH6A7
         sSnD7QHcn26at4lNnj7ukqiwHG0YIRHQGNkxHbgjz9eiYVksarasQWinlqWdWh+WHWb5
         NvrYBDRqLEczmOQSmpiSB3dQ+lVt+K6XWQkQArRNpfpQSdruDkUbeFwqMhs/Ar4s5onI
         RZcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780214433; x=1780819233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nildDfl0lwt1rEp0UvoHwGy0UqbjD9j3If0RBiN1My8=;
        b=jbXy4OyH40qrs9TpkwaIpJ+Qzzjjz19IEdbsYN/1+k9BDzc1QhdC/eWZqkextczgTk
         eIgYsrEYos4iB5NjajFUpXt7Yq6LPHW9JQjQK86UQCfiXhG62JSkhTM6XBsu20/v5Tav
         gq0q7xOhC5Tg2CciQyyToGabeDHT5Vkyw3JhszG9yKAXF2QFcu+NlFGMrGKu1p3mNMRK
         dXY/tUAva5ZTR6z4zeLNdD1dVqWirmFdheWwxrKsBYSx058xmi7ULWKYxid6CooydUyR
         Miery/su66t37349w+PhTV/p75k7Hd8E6/3lsIrALQKuig45kH3ebF5hgn3jOagvOf5U
         Tcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780214433; x=1780819233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nildDfl0lwt1rEp0UvoHwGy0UqbjD9j3If0RBiN1My8=;
        b=A4dt9wS1wTAXTk7O7svs+U246Ob8it6Cge5+lpCd44JjRuVcF2hSAVPFHQ4KKqnTo3
         qlxMkgHv2ePErA/V5z8gifVbOfjZbpsLBNxgEmImzwfUJW8dWWjII/WQjXoCTB4HG52g
         uuDtxeqfFw+x7LGpE/zqssTcU8p9PXTGdDKjXNf8RojzI8nsi3MmjKNJdlkSdHZoj3zx
         6p9vtz+M8bb39gWee9FlwRNYEPUHxo2o8yWYAi+/7nz4oGS0DPF3F1Sw8heYbvBC87xR
         k2rQEXJoXJW08p1PdHcoS0TINP93PN7tMuQxA+JLV5AM5QhtqCN1gVREAUPog3XN2spA
         NtQw==
X-Forwarded-Encrypted: i=1; AFNElJ+VavY7PmWaIuNl+C54P9LqYZfu+SIEeIxvBCePtZsqQkn6hix5lsZr34Vjr10HX9asSUArRnjnLhwftjGe90G9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5/xDgP0nSHzNPb1QyyilbOvAgVzmeX8MJl0Qv6BzrzRS7WiO0
	7xAKxKjC9KHED5Bbte+OhwtK4FbGJmhM5GjdXnIsYOHgd1qLsUBjgdKfWrWANGrREfQ3sCJ/0VP
	TeYCNa2xfxv2d76A3ClUPq7fSV/F/qlM=
X-Gm-Gg: Acq92OHbxK2p8E/19cR2XU6XGfc4rHFv65PGlT4xf3flZW56tnoa9CEGh4AO6QeI8MS
	bAg0qJjnPd9/YTMJhz+Pjdi+2Eh0q2RdmTcogD+j5i/qYKvdFDa5F2BQchnkE+c3S/3+FbYXEuN
	Tk4JZaNS+kJbcsAScxmBD+sUqujLnX26kJ6nRrkxXts3Vhe1dvmAZM/afDNJivZpDlN4aCh6Ti5
	BLNoZyCVWJoFTaqIZEHp41UnH/FD4s8EW956wWIJ9TKmjqfmX/6ccNeXOrHysxJi3gg1PdegbSR
	jaPLSHHkqUO8uhfdHIXYLM7w74u9At+109pxLjR8B9j0V2Q8r8cHwcfd0WwM0Gj5+lFUIRNvPwd
	nMJkr1WLGxVqPoxaO5V314MeYRx3eAuo8hr1x1YldiOmfnunKt4zP0NqoV98oe8SG/5Z5
X-Received: by 2002:a17:907:c07:b0:bd5:1576:dc7d with SMTP id
 a640c23a62f3a-beab3452ff3mr329934466b.36.1780214432977; Sun, 31 May 2026
 01:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260530195525.5059-1-rosenp@gmail.com> <2026053127-nastily-fool-88eb@gregkh>
In-Reply-To: <2026053127-nastily-fool-88eb@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 31 May 2026 01:00:21 -0700
X-Gm-Features: AVHnY4LlC_u5ovIg85l_0nDDUJ11KqTPCviOKI2YGvc9iXS0Genvxl2UzGnGAVE
Message-ID: <CAKxU2N8bNT+irM-gOk9SM5DHPbcbh7zvNM7n4wF5+q4TSEMkSA@mail.gmail.com>
Subject: Re: [PATCHv2] serial: mxs-auart: fix probe error paths and clock handling
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_010035_368611_396A9005 
X-CRM114-Status: GOOD (  16.29  )
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

On Sun, May 31, 2026 at 12:52=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, May 30, 2026 at 12:55:03PM -0700, Rosen Penev wrote:
> > Sashiko reported three pre-existing bugs in the mxs-auart driver:
> >
> > - For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
> >   prepared/enabled it, leaving register accesses in probe at risk of
> >   faulting if the bootloader had gated the clock.
> > - The error path and remove function used pdev->id instead of
> >   s->port.line to clear the auart_port[] slot.  For DT-probed devices
> >   pdev->id is -1, causing an out-of-bounds write and leaving a dangling
> >   pointer in the array.
> > - The probe error path called iounmap() while the IRQ was still
> >   registered. An interrupt during that window would dereference the
> >   unmapped membase.
>
> This should still be broken up into smaller pieces, don't you think?
>
> Whenever you have to list the different things you do in a patch, that's
> a huge hint to do so.
I'll do so. Although I doubt the bot will be happy either way.
>
> thanks,
>
> greg k-h

