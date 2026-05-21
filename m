Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E85CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01uiUNMkWOnOyoQp4EjW7o/7679tfblvQE/eVZhbN1U=; b=dGJaS7H15GjXdZVwMgJTqwsAQw
	/xijXhmV7gc2jr4KzqyuiuJI19IfFM33fK1rLRxF/UV3S7+fOuPT4SvmYrnSqTTBYRMzLRsA7582W
	UPEWkAs71ob+2x99IkErUdZnVgNi6P0JvbQ1EpYrqbqLII/pBHcr/LCOnC//yIfUNvvyHQ4PorZOH
	KMibwdJ86tF9VnUXa1IUy88VWaRLhu2NRZ+UU9dipTn4d5YSrNPcUnZrRm7Ltmb0wKB1YikhiPjA+
	Oc43CxVXeLBlu/d+O++u+DIoTERY0XubAo+0QtG+c+LrWjGDqKYm1OqFw6SfufRik6NLNtYC+m2hM
	J3NmITkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0sw-00000007VnX-1Dvi;
	Thu, 21 May 2026 10:44:14 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0st-00000007Vml-3ZSo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:44:13 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-515548f390fso2841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 03:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779360250; cv=none;
        d=google.com; s=arc-20240605;
        b=I88hF1r02+ZI9txRsXu/aov/D5qX/veuAGAtFkuwfswgsdHNPhPXkkY/rrR3XFGAAw
         x3VloMkDoJLVG+8uRHu+jkBGlP2jVix+Hv2I0XmAkGwh5l71kb/p3gwmbA0KXmrl/jq7
         sRY2RTgZfeTA1fHQqGP3+I9sTEgBu1Fa9uODUf+eLSGxoMKxecuw+Uj92mSxqgscXVmn
         qz8PBBXGTaqDLhIB/lCH7v6Mp6e9FUehf0nTRpkZHyla6M3pYPY5bEoSvr2qqDAep2FF
         97kMLOVRQUWE5YMx7RA0fBptAma87TIdh8nLo+8pY3JENuTJ2N5j8ryg0pMFTLZZbX7k
         0Cmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=01uiUNMkWOnOyoQp4EjW7o/7679tfblvQE/eVZhbN1U=;
        fh=qVXiLemq1KZrEk9hCGH8w39G8D6nWgp4OQeIjo1czJA=;
        b=KRuq/ikk1zmXyF/lVmTZiWMuIafBByJexMQCe2mwjdB/MlnLdBvzUiXRiaWo3fmdl6
         BxyolAzuq9O7ZcjDelCp0/w2EFNL9KsWIWYRNQJ+0L6iEGbeHb2iGgv1o2LC8aHQAvka
         eXub3oMQDnVh7QS4g60fi0BZTPTxh7/X3ebh8NKaY8o86LJZwCKX63me1GBsnnMKQ5tr
         gF5YEj3f0oNiPmFzzr+yuQDBXr9oKYx5swoX+i1ZVXDzD1t2f1X8lMCpAzk5yQlWVe1e
         WWNbafZV7NEvWQzJ+ZDOW4fqtVOaBvVmlh8Nw3gQPUTUZrnXQv7QZIzI4GcXKSNiMbm+
         aAnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779360250; x=1779965050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01uiUNMkWOnOyoQp4EjW7o/7679tfblvQE/eVZhbN1U=;
        b=YE0AO3qCA/QvH2IS3uBa12LxsRVGPpbWoDrb04H57Sv1cbiZYiH3q9rXGIZpS94EbO
         YQEqXGlmAJoWgN4XWq5Tc2gkeuO9/TU4T84ftnb3UbpsfklCzs3+enCt8296zmb7sNow
         egVn+rv56hnnqgRrqCaQHUwvFe7q1qcC69G8nSFxNlv0GAiBoKKKahHqNqMIKZxyLonG
         Ih8iyS4P0JQHCgld5CSvw41axjwEbdcGxM6LxHrpMxPBNFsEBiM6XSrqqln3wxyZmmM9
         noaU0mVI5/JrXzk2fzj0kHNuu3hYTDRJQRw9OzEdk9GNwNUe1S8bKVvxq8YvnM/MhOy7
         4PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360250; x=1779965050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=01uiUNMkWOnOyoQp4EjW7o/7679tfblvQE/eVZhbN1U=;
        b=mY85nl744oei5BhLeXIeMmJx0tZAepTrgxBCgXmNyitDnfbQ8/7G9nyy71Sb7zrYRA
         CVpRMzvP2cpRFSsh1B9QUIVVayrEN+scVqxnzekhi+Iw5nHmcqwIJoB6CQ8qvygo1fIA
         lhs61SjBCDsqbw/vBc43uL4872bdJZPnkgzOl0hj3XDQQSu4Hs+MTggQKzsnOwGFU2nw
         B+352wAZv+OSxBudDpQL5HJ7MtDl6rcdfzrTKL8EbwSamWPVqi1jYyQS8pFUJFFZal98
         Lpegc2Opnj2SWTZ41MsZUmPTmjxkOrrcArPhTvnKOJhdIWknwLuuTtMjmzAJ5Yi0XdCM
         VTiA==
X-Forwarded-Encrypted: i=1; AFNElJ90pOg7Zd/UNhC19uizi9aIgTyzdxKTzuzHBth0rs/6caKb+uGJJkNVU9ZtJMhDfoL7zDQ7D+qPUCuJHXL0Wk1N@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0cj1pG3m84qjPZ0DMEnJTe7QLgkY6UxCrkmp0Ro1J8H2gI345
	gqNuzpb640v5P5SBGkw2KNhytVZlOh4okudaJ0xEj7ojMzym3WvEWp86WwYCA/x9SSMM7UZd7Xv
	dYvYKznezmVFCJIVga6NJrxhR6ZrNhAcw02bzpq3F
X-Gm-Gg: Acq92OFxyxvG6si5dxfQSTgvckQlHRiTYY/W0SklV0MGtlgkjFcgW9lH9OGyxTtp703
	B+ewsLM8icK6bjS2iIT84QbNPcR4PD9l5dy9uadty77oYg7cAgQ5/mqc+gDWYkdUFzUyGFizuEx
	MvgIj8VW8oDTlKIGcKyvuKZycOgx02F6279IFeqKjBli1qSPfzQEx+XUxNLVLfo/NvZM586YBAL
	2CQZSo2jKSIBMfOckrbRkO10Nd+gyQibm5N/C6l96OnCGW7nMqjK34b97/HfUcX6h9EsSAr7J/W
	r+PAkBt5WCNfdzYot9pAOdKKPFoWfkRv6BfDwGaU1vkQn066lvVH
X-Received: by 2002:a05:622a:1909:b0:516:4f62:85ee with SMTP id
 d75a77b69052e-516c54daacemr7650001cf.19.1779360249995; Thu, 21 May 2026
 03:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260520204948.2440882-1-smostafa@google.com> <20260520204948.2440882-5-smostafa@google.com>
 <86ldddw4ht.wl-maz@kernel.org> <ag7eq3bfBOxfaZ59@google.com>
In-Reply-To: <ag7eq3bfBOxfaZ59@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 21 May 2026 11:43:58 +0100
X-Gm-Features: AVHnY4LZQTvaETc0PFZc4ErDn0OiwyQemmgBHI89H_ICLndAOva3c3G1YM9luGk
Message-ID: <CAFgf54qpNVvzSiV89g12-4jWeacm=06LMjCooeU1Mt+3sqWDLQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
To: Marc Zyngier <maz@kernel.org>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	catalin.marinas@arm.com, jens.wiklander@linaro.org, sumit.garg@kernel.org, 
	sebastianene@google.com, vdonnefort@google.com, sudeep.holla@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_034411_896195_D196DF23 
X-CRM114-Status: GOOD (  32.50  )
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

On Thu, May 21, 2026 at 11:30=E2=80=AFAM Mostafa Saleh <smostafa@google.com=
> wrote:
>
> Hi Marc,
>
> On Thu, May 21, 2026 at 09:28:46AM +0100, Marc Zyngier wrote:
> > On Wed, 20 May 2026 21:49:47 +0100,
> > Mostafa Saleh <smostafa@google.com> wrote:
> > >
> > > Sashiko (locally) reports out of bound write possiblity if SPMD
> > > returns an invalid data.
> > >
> > > While SPMD is considered trusted, pKVM does some basic checks,
> > > for offset to be less than or equal len.
> > >
> > > However, that is incorrect as even if the offset is smaller than
> > > len pKVM can still access out of bound memory in the next
> > > ffa_host_unshare_ranges().
> > >
> > > Split this check into 2:
> > > 1- Check that the fixed portion of the descriptor fits.
> > > 2- After getting reg, check the variable array size addr_range_cnt
> > >    fits.
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/=
ffa.c
> > > index 1af722771178..e6aa2bfa63b1 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > @@ -607,7 +607,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1=
_2_regs *res,
> > >      * check that we end up with something that doesn't look _complet=
ely_
> > >      * bogus.
> > >      */
> > > -   if (WARN_ON(offset > len ||
> > > +   if (WARN_ON(offset + CONSTITUENTS_OFFSET(0) > len ||
> > >                 fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
> >
> > Do you really want to keep this a WARN_ON(), given that this results
> > in a panic in most pKVM configurations?
>
> Which kind of configuration will that check fail on?
> Does that mean at the moment pKVM does out-of-bound access for
> the header?
>
I might have misunderstood the point. I thought you meant the new
change would cause a panic on most configurations, or were you
suggesting just removing the WARN_ON?
I can do that, I just updated the current faulty check and left the
WARN_ON as is.

Thanks,
Mostafa

> Thanks,
> Mostafa
>
> >
> > Thanks,
> >
> >       M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

