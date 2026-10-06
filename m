Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1A5CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 23:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=; b=lgCIqYWzpM1+KZKcjePdHQeLxL
	E+SvQMkb8p70hJ6g44w3eUL+u9QpLtYkAuMfhc6NjCSDDkoKUOm+DX/1S+MdNJLYWiKpNP/TSLGj9
	M9dUOdCFBvnaw6E43KRnLaVzvIF9BXMOQnvOYNHUZz3iMXe/r+38U1tvj70SSHiuOzz1e8tl85ijY
	dXb8mTetWgouB0KLlO0T0DAwSQReI2UvwcePMkv6dsr4e97xffwDnU89FtDWT2gOFrvzYY/G6V0Sd
	1bI/IVaJhyhCwZLan7LXaWCcT1WrZb0lHUVHWI5pMHqf2syxJIDnaroiyIBe2KwqxImBX2y99Ekut
	cgT3M01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEPg-00000001U4s-2aSK;
	Tue, 06 Oct 2026 23:17:36 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEPd-00000001U4T-11QJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 23:17:34 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-98076bb236eso597683241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 16:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791328652; cv=none;
        d=google.com; s=arc-20260327;
        b=kViCH1inStxVWOmlIJ7UZ8AZVKArzMEwmjMnsXVq0qFqhtQF/U2CGb2qF2rWpaJBkd
         UrGzq2KwiT51wRTSMe/wM+wOlT0Gelr1/rAWHTsu2A6/nNYCF1euxjGXo/uLm1YmY/+s
         N5O7/Wrd892jdmjk59vK0c9rl7kbTjUOtDuy2J/VL9ua7U1wAsipdBGyQKMmGdcmlYab
         Mi4td7fPYUXUaC6QGa2dm926q5iIUYCdBbUzfmuCvE6uxE3LbQSgdChk17r1Pe/08iu2
         6iyt13mmS6WfVJZNoqEivR9uAVfGblNmA8Qmn17aptsm6MEOXNxpS+zBCJ1VNKYdAqee
         jFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=;
        fh=To3m5mfj6Y6ZXYyM54NAtBNo8skPXqCRu1ePF5LwC+E=;
        b=qCsfS5Ym347x6Jy+Gms3ZSeUaMvsof0ZR13aVQ5qRp5CxVttayXqH+pPhEjyQYcjGH
         2ggKV0+UBECrvV0PrcSYLWn6EHHcYCZnZf9V7L45R6eGdsB5nCHMgvsqchd+rVD/hq6W
         urLgclIqg6maCKHjsOjxqDfyFBligKtu6c0wE4EQdQtz5D5w8lKfGsfoMQxturYjjxfe
         fnA2kpg1f45Wue0LAkN5M2IearBd3GwgkFJMbwXL4hbCvvpWLXJyMUn+6SSiJpW8H7Rb
         4/yX8fdbO7HWR2aHoCBi4gm/XgMfX8siUmiESRJ9TqY720jTQCZpTEmv1+yn4wlMVIc4
         qiBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791328652; x=1791933452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=;
        b=G0x3pNlbf+tsOc5/5K5Z2gFpOOxhWLv3Df5lxj0hEkV7uVIfhpNkzJLkM3oTWOhlXt
         oWbGElrWDStqaThizjx+0XI10f4OK1Y1Nzrqh9rhu7u3BuCln9bhnzxPqoiYh3DKMljB
         H5uXp6Nzh+PztOYfu+glAhkH86JWVOCHUmarohGAJxqZjpfBJ2mjPUnbVgmjzNpSUnGK
         3qLWbYGeWN0Vboga17PUxlKsXF147wVqaKl4TXf2iL1xFAmtY479/gUXn6gH2ZzE8dP6
         NmoR/GFZXaqDW3sAwozVkh6oiX58M6CeJHAjBvbQab/XWMo1tIXi29UjGpoH3AHz+pYp
         kFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328652; x=1791933452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=;
        b=brxeypgVxBN6VkzOJan3RbN7PDYHF8Xl7sT5zwMnyJkOYuUWuB+zHxpDALzm8xwcVQ
         WD6Kl4bNZ81Ud2mBQ5ITnp1bVsYbe4DtpVJftpXol9towRYVbSHVIPB4Bw7X2shBhSON
         I1QvqlD3NCYs/UYsxCxvcQHy2wMYwRUExWAF94J0yCuGO9x8VolZDShCnwI2Plhkwqvh
         x4EgA2VMHST96ONOm+HA6girIWalLvMOgPOzdqMRaM+zGvwjYqj0CvHr9t2h3S920UeY
         QHwfuZTmjs+6AISgSo+KZNd5KzruLwZh89lddyVX8YsfA74Mae39GIw7L/r2697pYCVm
         30GQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2L2GLMfh5Z1qJoP1V0BFeEYC0cj7SPzbeUkjskPHmtC81lpyZU4brLmQ6XV89Aoor8B4zufMXb2M+Tp5Ml+bA@lists.infradead.org
X-Gm-Message-State: AFq9FYKBVFoV6iOGH+wozQEDRISh7U6W7Ge5Cb1KPmGk8z7nBU59UyR+
	USPqHLaaPZ8KdphtxdouxtZMJxNwBj1gVVKj+Yf44gegzSjui+S1P2OZFnjq4/sge+fPIAKWr0e
	kQGTZ0vfklB99nvXgK/5Cl/fnLkAif/M=
X-Gm-Gg: AYBFou0DB7YE0FHSyymiUoUjimLqZY11n/M3ETerPGhSK2pmsOLIVDdkwPPAgqgP1ZL
	jXgH5tFXKK0hFMoGcQMg8up7gI64418ExESKZXMd5AYiG/mJsYQ/4VHNO4UZTRoij3JCRhvG0LH
	nGr+ev5LNcd13goFJOH+77ZvVZIfvUJMUyKfcLmgJ16uFqYTY4AndcQKUOsu7rfzRxA2r4Jx0/j
	mnzQzLBUEFnbimLZmMGjZKYiG1b5TMbbp/VslNFVByVoY3mjwVU/pu3GmOtsZ9kk2kdb8y7zjc6
	ErGWDfjuXFAH9lNqHzoyR/QcqkvRCvlP9Zf0TPsHzcttqFMqBmuFh/wRKv3RiKchcamu/+1dNhT
	2DUhiDbGzm9uSzbIIS/cOkY7KjOrReFlkBs39LGEzkk7iVVjyIIaBelHuUyR4fl4fBOwwLyvpy5
	S8TDzB2eyAkX+0NCchqN1LMjKuRA7f1aMIByRCR4v+YDdn7Eh05xBVJuLX
X-Received: by 2002:a05:6102:2924:b0:7ad:3ad3:997a with SMTP id
 ada2fe7eead31-7ca36e443a7mr124714137.5.1791328651645; Tue, 06 Oct 2026
 16:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org>
In-Reply-To: <20261006155214.63c5cb5b@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Oct 2026 17:17:20 -0600
X-Gm-Features: AclHuK95whFkQF1vfwc0DrtRzHj7zemriMM1hLHVnrlFjQ1KlVVaQcu7yNMv7bU
Message-ID: <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_161733_299775_55D26492 
X-CRM114-Status: GOOD (  15.48  )
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

On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > Please do not repost the series just to address the above. Instead,
> > > reply to this email with the missing information, so that reviewers
> > > can take it into account. If the series needs another revision for
> > > other reasons, please include the information in the commit messages
> > > then.
>
> Please make sure you read this paragraph, to the end.

How much detail should I be including? I had previously been told to try
and keep commit message more terse[0] and this info didn't seem particularl=
y
useful.

Should I put this info below the --- separator so it doesn't end up in the
final commit or something like that?

[0] https://lore.kernel.org/all/CAD++jL=3D6Ov5BPK1naX6orzMsrJPm_g6SkdRaU6Ji=
+okXMFaZdQ@mail.gmail.com/

