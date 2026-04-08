Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3C61073C85
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcyUmIQWBRIN2bVxClZ8Li2ITCNwZ/GpA68S4b0OhXA=; b=1uOcLecTLM2/l/a6kULwhcg7Um
	DHKLaJVZ54+Ghr0eK36NUEmqG/3Tyw31Non+Xc+vuDWsorPMfK0pbEhkQHzpeRkA9JHc0KFNFvLaP
	0pjN1PnHBoDyDFJGHA7RN4a6SHvvr9wGNuNHuW6gKF+SDFJhKqjGde8ZD5p24CrK7BDD4rHCz2xsy
	uAT5tNmIicis3XnmN4Ytz5WnQ06Dm0UzGz/JL5NHhX+Fb+DlSDZYt6tINN8EukeucCYKKRouwx1gc
	dgx564wajVW32qwi4MPh5doUnRaNVwYn05OHxPfyAmyeiNoY472xeSe/zF8S6NB6T4D+QYZGCpVjU
	4LsxK27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPni-00000008ewv-2Poi;
	Wed, 08 Apr 2026 10:06:22 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPng-00000008ew2-1p64
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:06:21 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-66f747175d8so3044809eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 03:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642778; cv=none;
        d=google.com; s=arc-20240605;
        b=ffqm9Ol4ITq53ItzMQB6ETrsTCKmcy1p5La0kZ2IMWO3FK0wAW/cAPX0wnJR/6g/iU
         MpSnqYFIfeOKMqfQQbOxB59pPlE7Ts4b7d/D40pkKxdrPEhWPkq9puROmeTyd7pMHSQ/
         KQL0ku3TEaIvRCipNMjD+AQpBuODYm8xI2s9tEFki2P3noaWil0QwwgGaRrqWkZ4yjDJ
         Le7SOOevUdHLEnBm4/cNXESGtc+7nIpDyU/YzkXjCT1gcXOaxgcEJFDiMy1EqDQK0y61
         vC/tHl7utVpay8AipJtL92zM5PMmf5kUafkiQv+1tbD4bAF44BU1MueQkGI/FpDBNbUp
         ygKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vcyUmIQWBRIN2bVxClZ8Li2ITCNwZ/GpA68S4b0OhXA=;
        fh=XHhhuIoZld9+/XN3ahc1mo3RWBThgD99KLQzIan0OqY=;
        b=JET1JV5oSxEN+wL8h1RdrdcKV2HW8ajvqlrKb6Td7VQT8o2i31ixMzHvJA/zBmRoCO
         nWJyzNJaMQssf+FECzxsF2mj0KJaV9Pwjif0n/akNXlHFtL/35LcKmnxpIHx7z0vVto6
         +CVK59CKWxg+IWPaNU98U3H/FpNP7B/9lfRqIHeq97rYRzrxzQLiPhVm6kSkh/k/GiD/
         lLUf2OQht4jrh5S1ml1x7NAEimudFHUsBXyhsbxS8BekXaReLuCFXdLQT+oP3235RgBS
         oPLc5pDiNJMIP0Xlz7c1Qd7FHWuBiha2GAU4NWmx21yeUZg9wjKKvr3SVywpTlspBl++
         /zvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775642778; x=1776247578; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vcyUmIQWBRIN2bVxClZ8Li2ITCNwZ/GpA68S4b0OhXA=;
        b=s3Y8tuxaBHLOZzE1bBeNTd3MR+McWoNVjS1C1L488qFKEQrU/DMqppldajx3Wr10j+
         ZgH/S3HPczGCy/6jFhyjFPEFDcABzXz3VNGq0hICIapzbAhY5fEjiM/0cm8Nprm932v6
         7PwPo932+uELsw5aMYYY8sKY6kuxWSKRbVZPLcEpr1TpRbDd5+C0W0zVCt3Frh2Vbc7S
         xlaYPlfwrnYgrPUsbReYEwm+cmw5LTwSnJ/SpVuzJAVImh1rsVXB4zmLrxa9nvYuvVfV
         b38XPXMzP9uVHi6ikR5l2uf8FMigeBzK882Ejow46SFHzC2LNJd9VL5ldwb2cPH3Iw6x
         /c8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642778; x=1776247578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcyUmIQWBRIN2bVxClZ8Li2ITCNwZ/GpA68S4b0OhXA=;
        b=hDd9HBKLFnXkUFwkv34b1/IYB2hbwxAEMqwaAJvpaPQZAtGIf4VI6yhsknfj/M5mRL
         kmLGHLx/eivgQ4sshIuxai8OSBIOQ5wI73DY7+ud73VDBu64NYIsU9BwenVtGrCaJ3D1
         W0IaZOfqWsQ0bngckHzjFhb22/lOsXIgn8njWtw8SBJ8FTRgK0U9xRrnsrbgZJ0jIE8y
         yMnaalZiEglOmh8NFkeDF2Lxntfr9yVoz+7CVfojvlGbpWkXRtcu2Z4d1WUuSt1+hYa9
         tC/CtCJuGuCgQPYAmWqs6KqLCaMaRzDcWJYLg5p7CK+lWLrysvwSVvhoPw0onVL3io2t
         p8+w==
X-Forwarded-Encrypted: i=1; AJvYcCW9AKLu0JwnNKdYSMskbhx8l3L+7Fh43fljSRKggKRt7JhUbSG4uOutHuKzSvLwj2s16LjRjmC/1/nADTnwwsZZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyhBnN9D80QGPAYR0hDzEIbrtJ344iWje/DtwyPHXIrfp0RfTe7
	i31f9pcVJdzcMswoxPb/e3qHtjDtl/vhTakTUyNzGcP/tJ07CWgGB/E7IN/4aEHWwCqAT05sckB
	23TZ14fjKPu1W3GfIUE1u7DnSUbpME98=
X-Gm-Gg: AeBDietua7Zx2GSC3gAqRNj3B+krRx04l0LVIe0LDf1P3KS45R0a46Gz0Coxz1P/3Qf
	Pbzl8H9hx8Rsa3If7LgZbZx+7kIiNhcr8/TBkvyrEo9AncfYNFP8vjDhPiK8XvstAHjh5RSpcQE
	J4P0jP3KoR+4OI7QzaBMyPC3B5LDXwx2zdKe36cJZHuPVz3bhWg7byqa7LTDbBzfCVPFyg6AAI4
	vT8zm38BAm0wt49QkvKh1A0EjqM7L48qxSgTIVB4G1M2Iee8AJO+WjQ6aSbLPnc63UUL4hHQGsj
	/kYO+zMChfV/0B6MlCo=
X-Received: by 2002:a05:6820:4c81:b0:689:dfc8:5e39 with SMTP id
 006d021491bc7-689dfd7aa8emr204810eaf.43.1775642778479; Wed, 08 Apr 2026
 03:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com> <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com> <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
In-Reply-To: <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
From: "P.K. Lee" <pkleequanta@gmail.com>
Date: Wed, 8 Apr 2026 18:06:07 +0800
X-Gm-Features: AQROBzCq50vj9APjUGuuVNzjUTGEAXBg2-1gD7Ml450ww7_QTh7MwqGYJLjBzS8
Message-ID: <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_030620_479031_F10D179C 
X-CRM114-Status: GOOD (  23.06  )
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

> > > > +&mac3 {
> > > > +     status = "okay";
> > > > +     phy-mode = "rmii";
> > > > +     pinctrl-names = "default";
> > > > +     pinctrl-0 = <&pinctrl_rmii4_default>;
> > > > +     fixed-link {
> > > > +             speed = <100>;
> > > > +             full-duplex;
> > > > +     };
> > >
> > > What is on the other end of this fixed link?
> >
> > The other end of this fixed link is the CPU port of a Marvell 88E6393X
> > switch. We are using this switch in unmanaged mode rather than using
> > the DSA subsystem. Therefore, we use a fixed-link to force the mac3 to
> > 100Mbps full-duplex RMII to match the CPU port configuration.
>
> You are mixing up terms. The 88E6393X does not have a dedicated port
> for connecting to the host CPU. Any port can be connected to the host,
> using DSA tags. And all the ports are 1G or faster, so it seems odd to
> limit it to 100Mbps. There is something consider a CPU port, but that
> connects the internal Z80 CPU to the switch fabric.
>

I apologize for the confusing terminology. I meant the port 0 of the
88E6393X is connected to the AST2600 mac3. Regarding the 100Mbps RMII
limitation, this is a strict hardware design constraint on our
specific board.

> > > > +};
> > > > +
> > > > +&mdio0 {
> > > > +     status = "okay";
> > > > +};
> > >
> > > If there are no devices on the bus, why enable it?
> >
> > We intentionally enable it so user-space tools can access the switch
> > registers. I have added a comment in v13 to clarify this.
>
> Why would user space want to access the switch registers for an
> unmanaged switch? It sounds like you are using Marvells SDK in
> userspace to manage the switch, rather than using DSA.
>

We do have a custom user-space daemon that configures the switch
registers for our specific use case. Should I remove the &mdio0 node
if it is only enabled and has no other configuration in the upstream
device tree?

P.K. Lee

