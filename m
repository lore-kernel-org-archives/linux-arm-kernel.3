Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D336ED34095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=; b=znbDintXyXhMOD7S4N/jRQTw7n
	WN4Ydgk2sqO//xCfCegFOCI2Shp3BFEgj0lHgAc1xeDKkvRopl5S623R/1lCWA3gFaJbcnPkRmslL
	WrB2iUPZBSWp8AfcFU8FjxcJt5SnifPoQ4R8OUjzvbxvucGEQC00N0xwk6tjGgZ+7KsLsGHY6PBgJ
	xz+f2TuQhQN/+B/DjYmkAYgE6x+um8UvB1GJkNn6UnL1mSCpREpnJpajHPHTgq7Yyx6i+aP38qPxT
	APeRJHV8QwDTTXonSQKDSoYjDwb5BOFqDWB8J9+Q0EYVjbmmyznup+5DTgfuVbImf6O6Bas9jx3lC
	HB2TOY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklPh-0000000EaM9-3J4E;
	Tue, 27 Jan 2026 15:55:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklPb-0000000EaLC-0tz5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:55:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48069a48629so8282985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 07:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769529325; cv=none;
        d=google.com; s=arc-20240605;
        b=DzXFkCn97FmXjglhwzYbGgPEKC1zA+s6FRRNN2Lkdiw1Hv1f7f3pbpq//QE1IdYjZb
         lexhlVxZ+7no1RvXFtQmBPkkEMjOU+FGhQPEN7kdN1gXV3N1SjrJVy2OEFpojiH8uNSG
         qH9DdjpfGKMP2h5mGXzY/D8pcAH0U2oyarRWXyrEWwiJ+rX1M5CxJQMxbmhAeIXWFb2o
         BNdMZ0AVw2fnrkN0LJ+EfouSVdExHP6rm3btb2pLBJbiv2DZKwtkowezGRKM5jyjgWXy
         qlsuiiun4maMtUhFAW8uOFDCzMP8/fjdgkrn4kIjkBSpnfx2SA/xQW5IId9yTYu2wG3c
         adAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
        fh=YdybkmQMSGSZfa9mwqiIGHXmao6DdMhYf2TF4tYea8U=;
        b=KlsYTvfzGKg818VDa8dsR3uug4qR6LzHDa121oHlHfOJxLIWJFb5FJiSaUsU7YaXUF
         +h6UyCcCJkdf3/d7wlaGGwVNYK1iGRpQDcitQRo89vDUo2PFe1XQsuSbtdS8Qxa6n/yp
         /ncMX7uPJ62aYzBzpVu15PhB8vjd3zX31M8WtUgm5FVxbVGUxvqk+uzYTIITCPQmTLOQ
         HhdeS72djaqxUj4gUrBvMCNUw6biu1ziEeWHyP1A1aTTh8+wCa4atLTI05t4rLtDSR/v
         OZFhjsw6xw3X3CW4Z9NiGs9dZNw3WC1LX3j0QeNVFHQ7wnbcUkeC+aGVx4ERIpFrZ8q9
         35Pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769529325; x=1770134125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
        b=nc4FKliAvYuLi8daqtDUOeZGCLO6lwK+vqW33hEJ9FHHIotjMGimt0IQ8fE/lxJhZw
         4mqFbrPcey9zY7/DDFe84syAUUqm/brv6pvW1fzoM9PveqyaRVn2dYUHRbwv9bSKylFF
         MSaecS4YOcYh0PGXjpbLx0AsBpTiu1hTvvlxpO2aTHzX/yMZOafgQ4IxWbEGaLelt8D5
         ZTQeO9om3c3O7zLz2fTi8yB7F/cfAr6oMsiKxsN9iELCQoIakCQ4oM+26v8AnA8GXypj
         t3hUe+R1Yj93jQFbF7ozmHCitAtcjl3yP6IWvmKgkxQ2AuR4G5SP+UHc40gHyCCVH1AV
         QvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529325; x=1770134125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
        b=UT0lORjZlVGE5IUBeAkc3AEgKCZ1hEgmiJnUDtSP0Senhfodn/E26pOVpWKkKZt5sJ
         NQWQM7RF3ZXK8s4OjLCAzgOiAY5EtHDLIw7OF9R9XTK+LDOY6jb/7ROsbXILRRnrrNOp
         i4pnxsOuVGYSgEvn0JIiqewA8BY1hWAlrZyS1zlEYNOblMUTNTVcQXqoBfCkqS82Lfzp
         zf2YqCjDTd49+qFSwlGzzKrfz1BTvVyJlJTcAORz7aOhr9X3hfakRcSLFHLNEfO3UIpe
         qAl0f+T0UWzGlZVgJmiTUEUymDtmhFlxIVTrtxYbdx6HpP2qZilFI+neeE6KEbfXdY0m
         EA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5AQmrR2yPpRbXNiZF5ttwrk6MrAy2Zfjg68B9DkcyfuKOhz1fFKKD2ValFrdL7144HcSiR/JPbRwLaP8a041T@lists.infradead.org
X-Gm-Message-State: AOJu0YxZWGIi5PeximfRfJEGe8PUFZSlYyFDJsoKxXEoKQ2LIZca8QzP
	Er5oj0XxZEdY+vMw9kWg2QkAzbH1rOcgW6h7HhDJMtG+7tHvfALPmuuZDnE872XXKYRDy+HcFMF
	BCl9Y7x/2wzEV65YmniMQ+FfugjIToaA=
X-Gm-Gg: AZuq6aKsXs9GqqrsQEEZJyIWipCWA70OE6AkBrXd1sO0n5Z2W3pMNH9EWoTAKQnUHhp
	K3os2kyO4/yfHuxDOuegR15XqF2YmHzu6LcqnDORrSkKxYKGLBu3vXYKPVu2Tj/JLQ9r46HLaKj
	HHI3kLJoL9O2kebde1ZqR2I527U/mAeuEsJBziyx+WzWRQuij35ZxZI3Ad5PaaEH+jIXfKrJxGW
	KwjV1zRv7Vh3BLa1hEimlxqjSKYOSxoFKKKaLLKJiJFUHGsljtwCc5cGiU8fkczcnWIkpa3lD7j
	7wEvxxt4f4ozkjcFWu47Md8i2WiW2x33rMoKSuF/DV1eiWv+SukIgSJiwQ==
X-Received: by 2002:a05:6000:186e:b0:42b:55a1:2158 with SMTP id
 ffacd0b85a97d-435dd0304a0mr3286115f8f.17.1769529324882; Tue, 27 Jan 2026
 07:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk> <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
 <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
In-Reply-To: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Jan 2026 15:54:57 +0000
X-Gm-Features: AZwV_QiFFOxc86MsSOA1lIfzqIqjtoa3ZePZV2eq56xOKDzBCZT0iVVI9LGkicc
Message-ID: <CA+V-a8sQTRZOFk=KASum4Gi4cKK7NdLZu1W0n4ZyWPuKGSc9uQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address
 across unconditional reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_075529_192253_F338CB3B 
X-CRM114-Status: GOOD (  18.40  )
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

Hi Geert,

On Tue, Jan 27, 2026 at 1:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 27 Jan 2026 at 14:39, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> > > where "local-mac-address" states the MAC address to be used for eth0,
> > > as specified by the boot loader.
> > >
> > Thanks for the pointer, I will use the above-mentioned method with
> > which we won't be needing this patch on the RZ/T2H platform.
>
> This should already work out-of-the-box, as
> arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi already has:
>
>     aliases {
>             ethernet3 =3D &gmac1;
>             ethernet2 =3D &gmac2;
>
> So just make sure to set the "eth2addr" and "eth3addr" environment
> variables in U-Boot.
>
Agreed, it was just that the aliases in Linux and u-boot didn't match
up (Ive notified the BSP team to update it accordingly).

Cheers,
Prabhakar

