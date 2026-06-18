Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD5ACD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 23:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=; b=rcmM2rtaLOPLM3XyI/QXiUkvK+
	UcQQyNil/9bZ49iL7ighG5HiBkWsJ4IMO+SrkfQQKkdjJJ1bSVFF9cZ7zsHggZ+LicZAihD6YjN7t
	udKGN8ta8Nx88WZ5ft+RgdjTooYAxT4ipwRXZxWROu3sxes80/y4aEX0P14F5Ua5IMbXLFdkJo1OT
	CvB2q+F6nHAGytBc4aX03oxf1hvIwZ9LkLd4jq4HBkGERr2VwWrJ2Ggbz897ytnUtkv1oItSjCBgG
	jqB+mtmjAE9gfDivoxMpePJnshUXSKgJFraci825C6DEQvrgJ6+XPIsnvFjH4BtIJjEyOAO2O4Eyb
	s7tUB7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waLkI-00000001qz1-0o1R;
	Thu, 18 Jun 2026 23:02:02 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waLkF-00000001qyH-27dg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 23:02:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6958372b199so2545701a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 16:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781823717; cv=none;
        d=google.com; s=arc-20240605;
        b=U2puDvlkIGLjqkC7Oxzp1pAo/XaPkdkP85eqRsv/BYhRv0wFcgnb5evRPRsVbNfCv0
         WH4I+hAVPUSUdvvXr0xiBP6KfUKX2knioQY9ASwafYHPgek61ZMEPXxC+NUXkcnrxgvz
         BiWbs9dr5oYMwQbGvyFhSEszSmVcSASo6e5F43PpiKwh+xh0BeGlJZLMohp9Wx0T9DJp
         qDAhnvUyOQwi6UwS9MOtf7YafuxcWqxq9N3gP4M88D3bKMGBY3HgSgjkrLwZSiUH9Twt
         U8E86V7nxxeKtRbaf4EsvDrdlZXpN+5Nc4kQCQMnCWoIQOW6YalbmpcEoeVqpdrDyfGy
         rd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=;
        fh=nm+AhSCa45feEBB81AN9b4UQ4FXRjI2JOIgJJdRKPxA=;
        b=aY8AHPI818yUZo2lq8QQmezqSTjaGhC2oH/C917+DDQ6+jvVve3eWsXDk1spR1tFzr
         GS2+z5FpDXWhQWMhnzrM2w0II24w1NO/tXql4oY90mAi+7i8OGHnaxz7w1HtYmyyXPGD
         h9PlpURtlFy+ThV8/xRjSiaJTa4/vfppWzXyONw8G6raS70uxx2vvjEiiJJqtrI81G84
         RvLkqRznXUqqetuKwhb17dwo9gPickVH0AXQTduXXzN8eYMcQeJM7MuJ1r+kLgqfWo8O
         9pGNa1oJDl0ndSESZpNTQi6xe8uh0SGx/aiS1s2g2d9rDJI1IBvFSlYUIfals59Ydo/j
         XuAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781823717; x=1782428517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=;
        b=WF6CAr9XxUuMOdzwGVikwh2f2IbzNn438leuIKQaDxHMSk4uusEIEf4F3shMSEuiI4
         LMLWDfMsbkCOjMgke2PyqLvsQf2OycG9P6hHVUmDuPRc0zk9+RZaxQyJhqwLSSIVFoFM
         1RdrwZff5wG+HJ60QE+dV7jQxqbUJU9MjuJp9bAuMRpIV4vVEwAU8THmUA3y6DB7Ml2h
         4rgkO4FMpno2I2gLC0WEQLiF6pD5xw34Lk32vDvqle9UgEidTDeCbvQ3uPdNAOY4lacX
         5ImRc5E3ly3QMKIavlmiQOrvKVsasLtYb3KeqpDBt1xOiNeEvXIqqKY833EUsmLETvqD
         BiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781823717; x=1782428517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=;
        b=lT8v31aB7eWjQ7u4najQ8j4vfiWIp3TOUEIIflm+FQO47tTtQxGWsnhUGuPU2PiYZG
         ApceIb4C2WLE/7Ko2Gnqwj4In9bpLNth5aJYcpZ9RmmhXPdym2dtOgBpsmBBFVatwU9j
         aVZi4+9pq7POfUiMokqfKKTRnEwaR+4rdTAmOx3a86TEqElub2iIWr/BIy2bLdXGZO8X
         bFqqWhKa9mIXqLojo6QyPHxYhpjuUdzxFUx0sXcNukLqQYXO2kQ3+AXiwrShAvN+V76W
         TwfUaJkD3HaKu+eXECY7XfFmEr7pbvf0s6ixoPaGStLRlEWADgcePhNMZYt56dt26Nj3
         Hmlw==
X-Forwarded-Encrypted: i=1; AFNElJ90b7R7YYG/CoIlK/fYV0CM+MGJDCqsOOtHTLLrZEAUxRq2cSoy1fyVmhLnwVW60GAIM96qp3Onz93mSzaDnQRH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz53uCBytMR1oRQbroDD8hkKumKkj3e860MjDW++e6C24Wr3bEM
	Jds5yy/1j12v5plP1INiTTm9XCOO75IAzblYZxAkhoufbvHaQUNeGGFNEnOl2hZG0FWcHiH4+ic
	rHE4wJvClcXkWd9aVW47wjpxkS6+Wx70=
X-Gm-Gg: AfdE7ckVHuSM/r5w5mStPYL//wTetp+dWtnh5rA20ivvd1k3/gvYPyYHiIWpLeBswSP
	W/Fzh6WNzu5u5jhjApfQCRbcjblfxAcI6KwIbvYQzHCubuce6YiNnWDga23BzRTUe/ZV9XgPnbG
	LzVRyJys/RY9L832Tkcg01mQxyZy3RXloEFw8wJWWJm/s5tN8OxaA2XeqlV9+1r1ux0umpM956m
	RT25vYheNSm9DLyqJcDQPVeQNKWwcwXBlh4XYIFR1fUCAfIDJa9SMq+p60PlJVHAAp2MEYfN+k7
	XQAxX7Dg0zzoBAH9wtvveDViwbYCxRg1Yk2vV4dW55fRW132DfR1ZNAqnWoqbCYaoUZP+6CG8IZ
	yzsDuVAgNeteH0upuogWgpTfTH7sfECOOUUcCvYqC/4kbiCus5KoQNqi+Yg==
X-Received: by 2002:a50:ed15:0:b0:695:dcb2:7438 with SMTP id
 4fb4d7f45d1cf-696e52647bdmr431695a12.28.1781823716380; Thu, 18 Jun 2026
 16:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260427051746.954704-1-rosenp@gmail.com> <ajRmlyx_AEGybykL@soda.int.kasm.eu>
In-Reply-To: <ajRmlyx_AEGybykL@soda.int.kasm.eu>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 18 Jun 2026 16:01:45 -0700
X-Gm-Features: AVVi8Cd8pKJV8TDSQqNM8KIOqfYt7FlEl94-2dFF7xSm3zDLY3ekIKFMu3kD-wY
Message-ID: <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error handling
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_160159_571077_5832BB69 
X-CRM114-Status: GOOD (  28.49  )
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

On Thu, Jun 18, 2026 at 2:47=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> > Check return value instead of is_valid_ether_addr. The latter is handle=
d
> > by the former.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/=
wireless/mediatek/mt76/eeprom.c
> > index 93d91264687f..0f6ccf6ed53d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > @@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
> >       if (err =3D=3D -EPROBE_DEFER)
> >               return err;
> >
> > -     if (!is_valid_ether_addr(phy->macaddr)) {
> > +     if (err) {
> >               eth_random_addr(phy->macaddr);
> >               dev_info(dev->dev,
> >                        "Invalid MAC address, using random address %pM\n=
",
> > --
> > 2.54.0
> >
>
> Recently I have started to see randomized MAC-addresses on my x86 laptop
> with a MT7922 and the above message printed in the kernel log. I have
> CONFIG_OF turned on, but since this is an ACPI system the device is not
> described by any device tree and the earlier of_get_mac_address() likely
> fails with -ENODEV. Looking at the !CONFIG_OF stub for
> of_get_mac_address it always returns -ENODEV, meaning this will always
> randomize the mac in that case too.
IIRC, the normal device_get_mac_address supports nvmem now. Does that
fix your use case?
>
> Reverting this patch fixes the issue and the correct MAC address is
> used. I'm not sure if there is any case where of_get_mac_addres() could
> fail in a way that results in a valid MAC address but it seems unlikely
> to me.
>
> Regards,
> Klara Modin

