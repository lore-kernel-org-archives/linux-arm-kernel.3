Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E18CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 02:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtXYQIYCd0esCeVGWFzBX+QPBDwNJiFP1FbIt4E6AKA=; b=3x3TrlDPhHh4n5oloC/UjWvHfE
	skSgv3Yv02v7UatHvBC712p19cYc82iZMLFLsetSTYEXDqxBHP3sk49NfRnpOXypCOl0h6DwMZU8+
	6JJzYzSHp7aDoJdq7yaOH3CV5sJ7vJJaW5iYnoA1wx8fWDTlxUDjIdTpHd3Qt4m20BmuIt/INRzGo
	zkYYmJD0S+wsBd6H008e1teILA3uth1aCYjyGzH7Nxj7ld0fqkCgKsc0V4Umz33D+VyFRuQmAkzar
	mL1zvgcDXzEgqSTYQsBWxzbwgPyQtdy99aG5RYN5etbM1g5olevdiFp1VvwQYa3qeKdQU/VXvjpxT
	UgwTcaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDUs-000000073ew-2ZbB;
	Wed, 24 Jun 2026 02:37:50 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDUp-000000073eB-1Kyu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 02:37:49 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c858961a8efso154987a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 19:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782268666; cv=none;
        d=google.com; s=arc-20240605;
        b=TBHAp8W0MsCJN3aEKa/ok4tng9WYiGkLU1C/Ak9uBbrJX+HhXqXXsuJHI0ydsGNf6T
         Yz1r+0DtUH7QJzWUlHoJJqRWSyvPnApe/9GzczUa1ZE4avrZxcfK0RtFRniNTFQHDkMl
         w57sI/F5MJPcg8Rm8hO7UKoq0DliWVcbW9Ut89ZzS46wlZNm/dVxb7q4Jc6eOBCH/nqd
         Q4Z+XMI6VnNLH+sScJhPWP7zKGvDZhZ2oa8+SalrTdgaGTgP3HSL/d/Gmq30BXtsAw4U
         D8Gu96s9y+ChyKDWPe1yNOlw3PXpdYotTo7f2SDf9DDysa6QEljkvEtweMpIVUinmcDt
         h/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtXYQIYCd0esCeVGWFzBX+QPBDwNJiFP1FbIt4E6AKA=;
        fh=yFksnVmLUOmB6E5WmSj24QYGxYb5gmgC+JKydOYMOLw=;
        b=T923i8InwZv7TfK5lXfvcPlkh5fB92r4KHAiEiRpB6yd0xgskOkk8BszoCsXpALMwd
         CZmUS6Xt1ViQM14JgosWXSmp5LGzk0wCOMvxM4UFreYH65pOz20nNSuPUqzxK2AXRybL
         hlle92ocCVhiG3IrPw8imkNBkNXYKqmd2XWoLFthKRC7h4AS/AnjfJv3m3JGsE6wu5ZB
         6xKYEfbO2pcL8o0zG18ijUy665POvs0LdLc/maxHLh26Hka8KqFT/2H++HJUttazAs2k
         sVMx2HfheulpP7o8D8n7BLHQuBNbTOVCuHNm5KmeyAa/ge0HAIQmIhcDdU4dMHqZhYKY
         H51w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782268666; x=1782873466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtXYQIYCd0esCeVGWFzBX+QPBDwNJiFP1FbIt4E6AKA=;
        b=GvSFDIMjOSHBM4c/YcUbFevgFVoRV8aojWw3BOKH1FhSpj3IiRNZmllxz0FpZuO8jl
         cx2e/hjb3iY3NML5L2ZMElH3UaY1EJ4ktr2/GVxsJXBljgJ0yR0WvlgZuqPTEbngUorI
         hXJ4hQA/JRJfNjNByMKn+dSVCautJdEUcU+vbktVkx8kPg+5suDUvmGz692H+Pwdxkhq
         44VDgamVYCsSSp+D8QnUanaeKhYtnMs1dr+YtbNt1rlz7fMbGxj5+DDEQ6SAnwmA164N
         0jqzIOSzhF0CUZ09olNzc5G/91rmrpI7jlXx1zENlLpkDdKJvj5yG+SPwKijYqFNQjIp
         rkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268666; x=1782873466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rtXYQIYCd0esCeVGWFzBX+QPBDwNJiFP1FbIt4E6AKA=;
        b=DVvwII04WvuKEabBp+IRiM8TXOljJ+60jIDVYhI6bAQBHzDV/zSruV5mu03cYU0Tzr
         qDc3HoGSmyf1sHItVbLXaQeGd5nui91zboOiTdpb+sBmOJ9SKMXy824s2Lb6cKfML5t6
         A3N1o4Kl1AyBQlMPld2ZA0eWp7PEud99OxWSMJe4LSSI+6ZJjPpAPfzudRLD0BnbJY/g
         DWRE0m2em1HC9OFNyKcY+UB5V78t8mVg7urJhbP4ojx5OcTo3ghWGMBFMbwIrqzNxB3T
         SCSq7909ezHSIyWyf4G7Jt1V3smvNNcVcPNKq3fqbdLt+WVMUb6yGijkhm2iWDGXMPk2
         GqIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VCEJncNTXfKGWGuBZ1zuu1OxGf5YOj4BRjjD/VeiydazrSYrHEYy69/XXO/GKJQf8KXtwz7oKsy9bnbeEmy2D@lists.infradead.org
X-Gm-Message-State: AOJu0YwOFuaFf6bJ/3tN5qDILzCYQJVg7tvmRZn7xFY+QVfhVPPYuvO2
	GTm/vN850L240MU4qoA6b2BZOaBlTmt9Fix5p8h7hWDXsqKBIiNQKZ+ypBTF6zjlpaDwd2f0YPU
	+9WD65BlVOHRsR5B9gwneht0yPcJaVmEHEJnR
X-Gm-Gg: AfdE7ckF1NHDzwJb1sHtcb1E7gWGo2pknrpg/G+MhDC5T4Pkp5OtEYfOg7SgVvArUdy
	pQxYDxxC4l7vym2hJX8GS3Z8z+RcyRcYG+UsJk6z+QUmDTVqN+/fy30V3ABm56ib4IxYN+ITryA
	TiZdjSpI5akWgPh5mLrJ5rBWhwn1CAlPG5beiK8OCAOx5Sa/DB/XEZzyxziafv2x3Ucfj+HwJcb
	KSRhazg38txW4/FsK3HA4uD/hUu9Gn6nggUMa+xAg58J5vadQMujtrarDfc4C5wTrf2hfnQbO35
	TMy9uT5DtSQGp7JgjmE2pyX3epg=
X-Received: by 2002:a05:6300:49:b0:3aa:f2c7:fd87 with SMTP id
 adf61e73a8af0-3bd2d23dcb9mr1656815637.31.1782268666306; Tue, 23 Jun 2026
 19:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260622005613.21870-1-phucduc.bui@gmail.com> <229ba136-66eb-4a30-a316-58377836b4dc@sirena.org.uk>
 <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
In-Reply-To: <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 24 Jun 2026 09:37:33 +0700
X-Gm-Features: AVVi8CdkK8REN-AFfjq_xzCg7k_Htq4uHz7WQJiam5YaqT9kTDS7xjGfn0ufY28
Message-ID: <CAABR9nF8GebpxX0ry-MMLCfsyPJ6EUpkEtYdASAep2jX+d5gnw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control
 exclusively to Runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_193747_396467_C939ACDD 
X-CRM114-Status: GOOD (  37.69  )
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

Hi all,

Regarding the case where PM configuration is not enabled, with the old
source code, I suspect there is an unbalanced clk_disable_unprepare()
call on hclk when the driver is unbound after a successful probe under
CONFIG_PM=3Dn.

The actual enable_count / prepare_count sequence for hclk (with values
clamped at 0) would be:

probe:

devm_clk_get_enabled           0 -> 1
runtime_resume (manual)       1 -> 2
clk_disable_unprepare            2 -> 1 (at the end of probe)

unbind:

remove -> runtime_suspend   1 -> 0 (ops->disable/unprepare executed here)
devm cleanup                          0 -> WARN "already disabled" /
"already unprepared"

This conclusion is based solely on code inspection; I do not have
hardware available to verify it.
I noticed that Nicolas tested and ACKed the use of devm_clk_get_enabled(),
so I'm not sure whether that testing included the CONFIG_PM=3Dn configurati=
on.

https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/

If it did, then I may have overlooked something.

@Nicolas (or anyone familiar with this), could you please help
double-check if my understanding is correct?

Best regards,
Phuc



On Tue, Jun 23, 2026 at 5:53=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Hi Mark,
>
> Thank you for your review.
>
> > >    1 Reverting back to devm_clk_get() to remove the implicit devres
> > >      enable/disable behavior.
> > >    2 Manually enabling and disabling hclk explicitly only around the
> > >      early register access before Runtime PM takes over.
> > >    3 Dropping the stray clk_disable_unprepare() at the end of probe()
> > >      so Runtime PM solely owns hclk afterward.
> >
> > Note that runtime PM can be disabled at build time so we might not have
> > runtime PM at all...
> >
>
> Thanks for pointing this out. You're right that with !CONFIG_PM, the
> driver only relies on the
> two manual calls to rokchip_sai_runtime_resume() / suspend(), so hclk
> stays enabled the
> whole time. I understand this is unvavoidable in that configuration,
> throgh, since there's no
> Runtime PM to re-enable the clock when it's needed.
>
> I'll update the commit message to reflect that the driver uses a
> combination of Runtime PM
> and explicit manual enable/disable, rather than relying on Runtime PM alo=
ne.
>
> > > Links:
> > > 1 This change is based on the discussion around manual hclk handing d=
uring probe(),
> > >   as raised by Krysztof:
> > >   https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@ke=
rnel.org/#t
> > > 2 Background for the earlier devm_clk_get_enbabled() conversion:
> > >   https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/
> >
> > > An alternative approach would be use devm_regmap_init_mmio_clk() and =
let regmap
> > > manage clock enablement around register accesses. If preferred, I can=
 rework the
> > > driver accordingly.
> >
> > > -     sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
> > > +     sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
> > >       if (IS_ERR(sai->hclk))
> > >               return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
> > >                                    "Failed to get hclk\n");
> > >
> > > +     ret =3D clk_prepare_enable(sai->hclk);
> > > +     if (ret)
> > > +             return dev_err_probe(&pdev->dev, ret, "Failed to enable=
 hclk\n");
> > > +
> >
> > > @@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform_d=
evice *pdev)
> > >       pm_runtime_use_autosuspend(&pdev->dev);
> > >       pm_runtime_put(&pdev->dev);
> > >
> > > -     clk_disable_unprepare(sai->hclk);
> > > -
> > >       return 0;
> >
> > Are you sure that the runtime PM state there is such that it knows a
> > reference is held?  The driver used pm_runtime_get_noresume() so the
> > device didn't have RPM_ACTIVE set I think?
>
>
> You are right, pm_runtime_get_noresume() doesn't set RPM_ACTIVE. I
> think we need to add
> pm_runtime_set_active() before pm_runtime_enable(). Otherwise, with CONFI=
G_PM,
> the pm_runtime_put() at the end of probe() might skip the suspend,
> since the core still considers
> the device suspended .
>
> >
> > The runtime PM API really is a miserable collection of landmines :(
>
> Yeah, plenty of landmines indeed :(
> I checked, and rockchip_spdif.c does use devm_regmap_init_mmio_clk() for =
hclk,
> rather than wrapping every register access in pm_runtime_get_sync() /
> pm_runtime_put()
> the way rockchip_sai does.
>
> Best regards,
> Phuc

