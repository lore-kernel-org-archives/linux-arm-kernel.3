Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220AAD6AAF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl4zvQGiUZSrx3wg3ehuntk10fOXbNpq860F8ZeG11M=; b=aOEveYfzHkuK6xOTcr8PqXW5tH
	ilFbEK7SWf1YucXNJegoJjudoOW+/3MZDHWwQLWBWPU/OSYF2TSuiuZr+9J9cZG3r60yO5JvpIpEl
	8DcmNZ6xnl85fmATi7q3Zg9h/ann4j/73JOxqJa2NGVNdaRxHKHb5KDAYq4+hP2FU4tBB1rZT8h37
	dlp3UXM2RKBO5Bpd6QwlXhBqStGnceljM5yY7d69KcOFIPFeuHWPgLyK/UKpUwcOxxPuBO7DPAABm
	IoOjf8sy0INrLm/Xqse3zmRSLGZdlOW1sgTunaCmnqF/3IEhD7ZVPANBFXOaY2mkppklXWc5nhjpd
	ruuY/3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8N3l-00000000gTw-1fKX;
	Thu, 02 Apr 2026 18:46:29 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8N3i-00000000gTY-2G25
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:46:27 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5091ed02c54so57031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 11:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775155584; cv=none;
        d=google.com; s=arc-20240605;
        b=L/p5UOAYEK2kFSqaF24au5xn7YicWyWcbVwBbB0ev0qMaNJ1Zfc8OAP3rS1pPDao2T
         SHazuP6x1OdpfOagxeVEmMKzyBXxjMRNIOAg7flnCE4tVRvZ9X7gz0T+d8tV3FT9hnrx
         GEWQ/MLTJ9AZpQa187YRnBN8WFw4TWyCQUbzk5JfdyHhSYUmvwDvqZuHrcMsvd2SXkD+
         n7l5RmrhMASlB9+8E1sG2R0ZYt8B7JXIfrjm0levNmHrc3hkx3pWHheAUmfG+XikScc0
         1V4pBgMdpVwtfcmOffUmnrxoogNzi0mX+wzWd0H8X6XEBopA3ISXkIwyPmc/CImaxA/x
         gTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wl4zvQGiUZSrx3wg3ehuntk10fOXbNpq860F8ZeG11M=;
        fh=f7K9oERgym12wxzQvl/rMpqTXIpLJ/hg2qseQsuMVAo=;
        b=Ui6WmYRuCPVLlbVZ9eaVlYr5RiTiihNlFoyi7N44UfkOOyR+a0FAtxPQbRyClbjckX
         G463dyCX6kUUwB4Y1PtgnjC3CgaDdQIvj+VB6wnZELcAw6BJPO4Y2hGsCr/9OzWcXZbF
         0NXc03pnUK9xqZz4HEMsDx+5QBdsgD5gu+Wfu9PZchE/EP5SxO2CSxMuXRLPUuPtocQY
         AbNqS4jp6sjxA1D/lCMoq2hXcFGd+t3r/RTzaq6IaBrCTUeOPSlhTulFRTcSZ00uCdG7
         3ke3e/yL0LeENr8qWexH1J9Jhmc8zHRbDIBdgHZIYc1e26uNyU/bhdMXR9f/GbN1VSyz
         T81g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775155584; x=1775760384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl4zvQGiUZSrx3wg3ehuntk10fOXbNpq860F8ZeG11M=;
        b=nsuLIed+ZKWEvIDg0A0pRBB2hjpCUW8aUA7v/CjekXjXZUQhmHJ3l8dgeb3hL6nvZa
         YQQQX+Vo1SqM6wuTH9aHpgA+0+YDb66LIg7f0WXd9mYYN4Ryvigpb7IThqrcp850sWPh
         BSfNxE33sOJl3XJSwkMV1c/QKS350wbLW3og21rydmLYxwE96qoKczgE4EmGofm+X7/G
         dZmilwIfPpbnbm22jNL9hkz5jdwQAmVg+BUJ7R6RXrSBZ+hOhq4j9zCoyfVVc4jbKuxJ
         2UceclIs89WURkvCZSLuZYcSFgo1mIxOEHcru11PyqpFjwlKQXzVU6Y8MEKR0PkcXq2d
         CV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775155584; x=1775760384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wl4zvQGiUZSrx3wg3ehuntk10fOXbNpq860F8ZeG11M=;
        b=GsIjpHQSRt/wmxzm6e1zdMIzVyoUrQ2p3tdBzbIdwyQKeHyVK2U9LtQ7m2fXcVzZX+
         yRYFlaX3F19mEUyIOAwTlbV7Ocpid6fqH1THrlU/mDKYeQCnu6uLsOjcNhQriXQnRnHz
         uhbeE7Tep/4gmIZi2igr+cbhDOlc5TqC8kln4VSu214r+yUgN0hTi1i3Py1d/jH7EQ8L
         JLLHMa2T6f0p9U8CYmOPJb5zbjYk/0Cpx+g5ZybtaZsyRCbnwLuydZtTXxLz3tcAPVcf
         fz1rFyxA0XfgexzSy4Le17M7QZaALMduMWXKMGqRTUTlhcrNrr34yXHL8/I02TsNZs9j
         U1VA==
X-Forwarded-Encrypted: i=1; AJvYcCWExLxfHB2wRLv3Uv7uQ+lLi/Vhn6imlOdUi1Jfmh3lwebr/bLdFWkbzPwxe2HhKNaPHU8igP67eGDMs7iVR07e@lists.infradead.org
X-Gm-Message-State: AOJu0YxpJzuve/4YrihU6REyVSz+/0SPQC2SRt9E/mhktJZys9j5HpcA
	Sq22/FsKElkRMI4L0QxBSTIsNWlXPpL+Gg6w7yg0msEBifPsIAhYbJrxrA+NmWt1tHxxmnVr9RL
	H8Qnv5lANzC4ytZKqMCZTPfuH6xQn2xFT7GWZ/TT9
X-Gm-Gg: ATEYQzxaygoRbCQZCAhykd8p69fJBlFVUOeYRTMSL64Zsb67TcrkVaa4TDHtlz1+NqS
	/Stw4tCShz0GhMus0SnOTQXF/N8LVqoqMRtdHOUIy/sDIbZTqvY2J6hrmmdGggAfFMHS0owJkLV
	OgSmF6ZK1U0gJyZgEZ5XKwLWso8x8NYgBzulOcDvXvWtGSDHSwn4GR24NIRN6rC3o+EkkLLoHhh
	RhHjVDE7xYDLXT3h71CIEvnGL2oQfT4kcGgRe2nZ+HOA5EREzc7OPUhInN22HgKrL0DLnb5zZlJ
	rHMk
X-Received: by 2002:ac8:574f:0:b0:50b:bddf:14ee with SMTP id
 d75a77b69052e-50d5091f06emr14241431cf.16.1775155583876; Thu, 02 Apr 2026
 11:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260401123201.389906-1-sebastianene@google.com>
 <86341e4to0.wl-maz@kernel.org> <ac1UNj7Z1uVL4Nf6@google.com>
 <877bqqcz77.wl-maz@kernel.org> <875x6acyxc.wl-maz@kernel.org>
In-Reply-To: <875x6acyxc.wl-maz@kernel.org>
From: Sebastian Ene <sebastianene@google.com>
Date: Thu, 2 Apr 2026 19:46:12 +0100
X-Gm-Features: AQROBzBvFMvjURX0njbORtUtQfmHm_Ot_YasD3t7UZkZN1aUMR2GZbjvwVe8y2o
Message-ID: <CAHLR_pZ55+4cAknuuP4a1PzQjgvyegeXvpZksz=8+iy=CaSY4w@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Pass a 64bit function-id in the SMC handlers
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, joey.gouly@arm.com, korneld@google.com, 
	mrigendra.chaubey@gmail.com, oupton@kernel.org, perlarsen@google.com, 
	suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_114626_613465_8BA1AC6C 
X-CRM114-Status: GOOD (  29.06  )
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

On Wed, Apr 1, 2026 at 7:34=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 01 Apr 2026 19:28:28 +0100,
> Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Wed, 01 Apr 2026 18:21:58 +0100,
> > Sebastian Ene <sebastianene@google.com> wrote:
> > >
> > > On Wed, Apr 01, 2026 at 03:55:11PM +0100, Marc Zyngier wrote:
> > > > On Wed, 01 Apr 2026 13:32:01 +0100,
> > > > Sebastian Ene <sebastianene@google.com> wrote:
> > > > >
> > > > > Make the SMC handlers accept a 64bit value for the function-id to=
 keep
> > > > > it uniform with the rest of the code and prevent a u64 -> u32 -> =
u64
> > > > > conversion as it currently happens when we handle PSCI.
> > > >
> > > > That seems overly creative. The spec says (2.5, from ARM DEN 0028 1=
.6
> > > > G):
> > >
> > > I'm not plannig to be *overly creative*. Thanks for pointing out the =
ARM
> > > spec.
> > >
> > > >
> > > > "The Function Identifier is passed on W0 on every SMC and HVC
> > > > call. Its 32-bit integer value indicates which function is being
> > > > requested by the caller. It is always passed as the first argument =
to
> > > > every SMC or HVC call in R0 or W0."
> > > >
> > > > which indicates that it is *always* a 32bit value.
> > > >
> > > > So if you have a 64bit value somewhere, *that* should be fixed, not
> > > > propagated arbitrarily.
> > >
> > > If you have a non SMCCC call that happen to have the first 32-bits of
> > > the function-id matching either PSCI or FF-A you will end up handling
> > > them instead of forwarding it to Trustzone because func_id is declare=
d as:
> > >
> > > DECLARE_REG(u64, func_id, host_ctxt, 0);
> >
> > Again, the correct approach to prevent the propagation of something
> > that is known to be wrong. Something like this:
> >

Hello Marc,

> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index 007fc993f2319..dae993a1d081b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -694,6 +694,11 @@ static void handle_host_smc(struct kvm_cpu_context=
 *host_ctxt)
> >       DECLARE_REG(u64, func_id, host_ctxt, 0);
> >       bool handled;
> >
> > +     if (upper_32_bits(func_id)) {
> > +             cpu_reg(host_ctxt, 0) =3D SMCCC_RET_NOT_SUPPORTED;
> > +             kvm_skip_host_instr();
>
> Plus the obviously missing:
>
> +               return;
>

Thanks for the suggestion, I will do this and spin a new version.
Sebastian

> > +     }
> > +
>
>         M.
>
> --
> Jazz isn't dead. It just smells funny.

