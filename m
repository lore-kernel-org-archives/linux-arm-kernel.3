Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBA9FC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+rlFlf82tJSA5RGkL3NrpaTjpsrsH5TKbIor2Iko0U=; b=ZdcEAncFld33TV
	HG1/sGNH2PUT1KWI8Xa13PwBqj0JGiX4vCrko/N+/g794N65Rbnq6FY6uZu3bn6q9vOsKtdeGhLF2
	vJ9pb+rryTc80Kvo5lGbQUthcpwaQhctojFIAYLZf9mXn53IP08H6hsi07IUwzwPnA62ymkKWnOU0
	tUmJOTvRuQNKU1NLYp7pxzBa8tpZzrOnyxheXeiDCqCNNAyyik7wtgKK9ALp3DYOQcTHKVTJIjqlI
	ToZUZQj+2qoLmP72JqIvIa/zHjd/cswxcP/Tg2HRz/767FaSTv++KmDpKYzd72y5w/M4KZlOLNl+N
	wAZhRsR9j3tC0hw/s07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXWK-00000005lpt-3LMA;
	Thu, 26 Feb 2026 09:18:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXWJ-00000005lpg-3mHB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 299AD60054
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4984C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772097534;
	bh=Z+rlFlf82tJSA5RGkL3NrpaTjpsrsH5TKbIor2Iko0U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=daGGBv51ajs81ihoMwHF2nl4DCUfFvWVpFDtsJp9zKdgz7btf62kmnJBtFgDv+m2j
	 KRZsrEXamIiJR6cqYKkUdSpmjQps/aRdXKW0pwzjMSn3gb6N4ndBrYIsF0g/9vqtjh
	 P0wqgyXm/b/8LM9XrzXG6P7+B31XgqNHMdV6JBDb1sVvpd3Gh+1GuoXvwsE7FtZ118
	 5ei9GW4vt9/znNlpJhmDbudDNPK5aAOHmxaaupYxOjs6GhKgrTZ5e6y9ubXgMQpCgk
	 UE6Pv4czH/kDn5ozjH++gM/jS8U82NH4tN7zX4Dhx8BGVmv97aduw6N7knz9a0ZgDR
	 DLvrNfdn4w/5w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-389e2950f54so5529891fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 01:18:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVEmlGLztBgsPQNWZpOCFdGWcv0zaNgt5k48n5RDg4YaJgkYo33oPX82NUKzIhcqQ/Ziko+odN486KOC5Q/dpg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx80VEHzjwTS2meMaQzFl9LHJfimVqTF9v+kHz0IuoDWRLvr0w
	28rEzukP2IJ4+8IzmZWU23OVSN43kiRQrkw0o4Ni6BPWLtAnPuKkkXI4CZYxZEhwznCDUlaDQRX
	vLoG9STX1yUDOMtJwgjMlmGEWLeCfxhc=
X-Received: by 2002:a05:651c:154e:b0:385:c15f:6bd with SMTP id
 38308e7fff4ca-389f1db1be7mr6846191fa.10.1772097533253; Thu, 26 Feb 2026
 01:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20260225170045.1707778-1-wens@kernel.org> <5050123.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <5050123.GXAFRqVoOG@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Feb 2026 17:18:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ixefsSDR1bJb7uYjPWOz-7yJ=+27apx4kb+aH4ET9rA@mail.gmail.com>
X-Gm-Features: AaiRm530ZuEda_MZygW0LXGcfkJ34WBOn92bG3Hhz3-OuGkIcoYFg-ebkdtXFC8
Message-ID: <CAGb2v64ixefsSDR1bJb7uYjPWOz-7yJ=+27apx4kb+aH4ET9rA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pine-h64: Enable USB 3.0 host
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 26, 2026 at 1:09=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sreda, 25. februar 2026 ob 18:00:44 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> > On both Pine H64 models, there is one USB 3.0 host port directly
> > connected to the SoC. The VBUS is shared with the other USB 2.0 ports.
> > Unfortunately the DWC controller binding does not have a VBUS supply.
>
> IIRC this is exactly the reason why it was never added. Adding it without
> vbus property is not a good strategy.

Or we could describe a full usb-a-connector with vbus-supply, which still
doesn't do anything ATM. I plan on working on that in the future.


ChenYu

