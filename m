Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A814EE7E366
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=; b=neu5DCPdOWnBtCJjGa/wQsOQJd
	1sXrqhLPMomLow5PIQ6lT1wnmtvGwxt7Gnh3lIDM9eyfmkOvWg4EGkDDrxr48Zgo5XYwmN5UuwOYz
	BDmJfIqKUn0cV4xPn2GReAIpNltyocC6gLiORKsUAk8Gb7GLlOqTpBa/2lLUYHj4NjQJgSMLqvYRS
	KP46kN30qysXShYhOmV+TuMKwKqNzB2Wf9xBEi22s4/T55IJNogaDiskbEKGm2zS7S3vEookNIqlI
	s0z7Cmkri2ux4E8AmwWZjEF6xvWfXRS0V3gBI8cXiMHSu0kuFsilhkiwXLxEAURzPeQdCMvf1MHM6
	HzjJpsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bdT-00000001sjC-3gCf;
	Fri, 03 Apr 2026 10:20:19 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bdR-00000001siY-2nKr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 10:20:18 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38a3be8a59dso2173981fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 03:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775211615; cv=none;
        d=google.com; s=arc-20240605;
        b=czspxLUelXKE2xLUjntPESvQFlGrDOKI39Gw9XEjAD/pwPQ//zR1/gaavd2tcicHpe
         bqKp23LI1RKgL7ndJ36JHfDGjAGLgEEnifLFR1x82pFS9iLGa4UZM9Kv0hVupXFeyOYH
         I3Q55sodufXtPlcG2JaTb2bTmReHIk4WDV2/X9ZB21N7t8fN+h7FBbfS8xJTZYx7GI/0
         uhNpGtdxDZeJwrzZ+0d0VCqzDPWDHvHTeCaeaGqpn5xAKz93WstHPrHsQu1tRgw34/Kq
         NHzKY29xh9o8wAvLG2F7uq2Bc/wpAsmgVDc8u956fHeDI8NNA5UfLosADcip6x6OoAvv
         zD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=;
        fh=+5t8FAP2aEwATfdJHJ0rEE8YrCHRcpL4wGKmCoLOaSs=;
        b=l1eCFQGO0JKVWpIC2L0A/KldSLpfY5fjujg7qsxXP++taLHfnkaaS6w0x3SPUGPjP0
         pKZcIKm0LWWvMViU14ziSjQt/y7zPGaqMupFqUCfWsIdyDj43HkIiFmUe3t/0iej29mK
         5d+lxl5BC/gXtcpBv7swq207pKlPuhOxBoU4e0aTSMO5USS4s8tyTd4SfSDyr7lVPu6G
         SjNGth8k4jOrazm6+jdGGIqQwF5qT/jvwGmZ45yZiVkieHG4nZCa0FJ9OZzNQnU8pdVG
         +Bap3TCOeF544XKIf0UkG/cX1HqzqgRHrle7V+kyxbqaRieYziff1wq6SoeBWNhrMm14
         xXgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211615; x=1775816415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=;
        b=p8tpNqSwE4B/xvtdJn7GIAwmWTiU/oxD3h3oH0jRYjLUUU7ZHtqMMJ2FBcgATIdzdd
         58GgU14TGmMAO1oUz1ZoHtHqAhMkkJXBI2A9HvlAQpeGWyvlUrjqnjCggCWG9M8xM2rp
         jz4lbV2qiHp+F2ce0u9Grd0pHNTIokHDhAiMjiijeGKeinIhvYfIBJ9schsQQIQspCLZ
         /uKPXrPyNnQm1Ll9GQH8lXP6JMIPX+0L8Sb5YKn/AtXqypkhezOQyhAUODTFI6yWEu0X
         7ZMNOPf88/ZW5XFMq5+MNkV2DiKbMTXYOmtip0nLGkugWp0lLznARh63e6K3g2Eqq8e4
         zepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211615; x=1775816415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=;
        b=AnT0dVtm0i7AgqG1wl52uYNC/z2eW36sflQM1h4UTKBZmfRRGa/xrUoX9WOoVPVVBm
         imdjHxzD5RMvQa+z+R4PVE0/7vgwF7w0iP965/Jze+WlDzy4E9ev6U7N6+wanA2as4KK
         ETYtlmN7RWSv/Z4HHRlH8bPt0WAnfmz/ViN0AFXelOz7xj/a1U5l1FHq0lgTol86Is5z
         t6zKzv07BigZpSp7402vhzSiimUEiU1SN50Z7nZQkBtGneid9tVkY0RHTiyXdXQhM370
         CAxgtL26VpQSiPc+4OMxl/tyinsAQNVg8Ae+8hy5u4LcHrLzTgQ8HsICJOmOE8tQZhQX
         ycuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcJWUL0bZe4MFDlXH3QC/CU7JL+XNOXzLGxMlNRmQzv4/dFDk377Hrt3Rq9trBhfZuFId5yEdm+nelkH0QToDA@lists.infradead.org
X-Gm-Message-State: AOJu0YxhTNee1mQxCg1YPcAVtNkN4IzPdc3FKWvDj+0kEvKswDDP/Qyg
	LwfNezchhZfJCNE1a2hd5rpZ10nS+3Wx9Pm7ZLB0xh77Ohrj8brS1ZWP4D7ezQIsP+2HTYR0Tel
	70PTodJwMBFKRkliBR47iKsz5zvHDGgo=
X-Gm-Gg: AeBDietamD4ysmBIk2+HY+PY516Urml44Vs/CKDr4AljCg9wAq76nqOOKwZFOxnajKA
	Q7Bs1RdKB2uGRWvYxZ11gfyA91QrIzgy/fD9SpUmRMi1FduGoELyLj8Z9Jjr0xE/igIPOcbRnsa
	NztIamVNQhOQgNn/T+N5H3BCGcSjTJc1QVDPbLhMNVBZmsJ0tEEVc7FBrQRa8w7RWouuxgmdR9n
	d9T/F3CWYEjFZDz3TtIUog4GMfrNwxxwChIdFbiuqTo5BmmwndairytVRdmLu4hXoWAtT1vUTej
	LZUeZ97gpQCIwC8i4RbZVI8baPRfFDbqLmpPa14z4wUUvqmQfU18DDdG+SWaN2qzKqirpRLTLj1
	ZkRExPRKvQOVgsfCy85EqU5SjQVVK95WQCQ==
X-Received: by 2002:a05:6512:689:b0:5a1:30ec:427c with SMTP id
 2adb3069b0e04-5a33758f654mr429274e87.6.1775211614577; Fri, 03 Apr 2026
 03:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260331190053.482607-1-ojeda@kernel.org> <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
In-Reply-To: <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:19:56 +0200
X-Gm-Features: AQROBzDpnQ318ituSaZKPFVAKDCpHFAe85mKUJ0mJsPsR1hEGjv_SNjArBSCgIk
Message-ID: <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
To: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_032017_745335_20155EFD 
X-CRM114-Status: GOOD (  11.58  )
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

On Fri, Apr 3, 2026 at 10:12=E2=80=AFAM Fabian Gr=C3=BCnbichler
<debian@fabian.gruenbichler.email> wrote:
>
> I will check how the full diff for 1.85.1 looks like compared to just pic=
king
> the rustdoc fix referenced above, and then file a stable update request. =
AFAIU
> either option works for you?

Thanks for the reply and the details! Yeah, the timing was unfortunate :)

Either works for us, in the sense that it is not a critical issue
(i.e. it is just for generating the docs and just for arm32).

Having said that, having the actual .1 release there is nicer in that
we could consider raising the minimum version to that one (or perhaps
at least print a warning if using .0).

It also means we may get more focused testing and one less version
around (e.g. currently I found this because I test our minimum, but
generally I test the latest point versions).

Cheers,
Miguel

