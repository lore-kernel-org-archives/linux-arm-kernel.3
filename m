Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61681F53D9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 21:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5Hw/tiP+uEy4lhG2UbjPwgevHAkzzW4NHLESS72tuk=; b=O3B2+SgscduAZTs0KP6wvybOfh
	gf9x1pSg+U4wXGcSIpSQcA5/obtEP8ECkLyR38KgaqUyxWxLQIS21AjS6N5L89wrXIZLMc+dOJFNR
	ERImHfc0VPSw21TnMlYJ9t5aFu0UNbqAfLlEFZtpbq9EnOc+h3FqFGYWn7NJHFgk7cFCNQOemtzw5
	MttO+rUW0CjE8Gx0f2EvZEni8NVyM/e/0bJb2ASkNrZAJGRipeGzXSK902y3LV0p3G0YceNnGnWcC
	RqZNm9krzjfOcoFipaBmx2OxGrup5m6Nt3yVHwL9tK8yZnwuIQfTnTV+6+Pak3WRWGLjeE/Dgo5V4
	TY3iTJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FFZ-00000004sDu-2GLt;
	Mon, 16 Mar 2026 21:13:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FFX-00000004sDW-1Gmq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 21:13:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso422407266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773695597; cv=none;
        d=google.com; s=arc-20240605;
        b=D8+TbL1poyUjldIW+So2MRONxrWexogHVLazuHeMu2MGK+aOh+MAUKGKzhCTSG7e1i
         AN8YwBHkRHJ4wp8k0glEWY6hFys6z1Vzi9YQAsofG9KBCBreCi6P/rInm5g3ilJ3CouC
         qyqAx0p6Sod7hbAnZSIhkEWN4JXCjF9uWqM1oI8YGV/QPwJIsNAH9LRWYWhiWCNjrssC
         BYiQc7zxwQPxe5iQYqSERK84KluFtWX5R2bjRtFo9N6Cs43UPDkRH0d0Ikp4pGD/zAm9
         zVbkaR53Yh7MICVgqyOI/MWvdNljODLVEvyH+I2HuUJSj8gwZKgKNjH6l/fS5cFNTKyI
         zUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5Hw/tiP+uEy4lhG2UbjPwgevHAkzzW4NHLESS72tuk=;
        fh=HNQVzhAYUGzjFmQQu/7a+CmZWTkmnu7GOzEoMtQzszQ=;
        b=Heqt6Ojym1k4gfN4jxO2LOXxrTXwcKUIoL78RKuIs0fcVVvQx1IEYVdMM3HoroUh2o
         PEgrW6gVxVtty7iEIeE540Mthmc4WCclFCg/HA0OXsrt0R4wGQ2loB1LW1MYBAhgKXGx
         cFFX35EEtXlgXHkQr+NEs53cl+47cX102Q1sqGgrGFJFt5cDR8NjCjc5o59F8oPCCsg2
         jMqKyWh1Vmm/RvXcqVyQKYiNyP39t+uYeUwCRWQPm4lABmmKE5DIfkH4aPDPDqcaPRv4
         S2eFuGCgFV7ytfuTqM1qP2vCKfsaX7okUBWdghhTJe/+jQDxikq/kpSENMNkKRP06NUW
         350Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773695597; x=1774300397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5Hw/tiP+uEy4lhG2UbjPwgevHAkzzW4NHLESS72tuk=;
        b=m2oyKfIBvYWOp8hDGwqKfq2b7kute4wOTxQHxLWQImE1x/PhojgHrS/lSgJshO2cF0
         UaGsCpw4tvErNpro1Vj9HxhSBs8jxJF30GfjzMp3sOlWY8PudXBwrC+wMOSkkELhZJGN
         o6FdCt/onQYnn9g8aB7uoJ43wl7zF+63buazzcxtt/QutYvkT3Ic42hrrOOmieEgHpEo
         +YHimgzDFRty65ulxWgUjLxGXb1WF+Taj3uzWipq4L7GYsgSmXoaPDFKbJUkUjZ7Y1yJ
         DlOmoRzNsYgjB8CrMtk7mkOr8xst1wq1hqrMBUU6HiVu7dv1MHQbSyQMOoiKRqEfFgFd
         e7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695597; x=1774300397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5Hw/tiP+uEy4lhG2UbjPwgevHAkzzW4NHLESS72tuk=;
        b=RUu0MWIZMQWazXspxGJn4GqsB8j4HEeJa+wHqmqqd9E+xI3rnen0JjFWOj26I5CJp2
         NN4VVpPe8xd1zMIwjyL2yaLFs7o/rdM2nUSk9RYpgxSjB/1yo3uSghRlaKpCvLo9mwKs
         QuYkerogOpzfgteVlyjVzDF49suaL3EnC+KoRfiscVyAuisCkhAZluSUZ9+Bek8mGE23
         Vgrk2SxkMM4kph9JU9rC3FrLzsztJbWDAJFotazzCJBYZFxXs1hoykUD3gONc4mG0Sph
         V7QdQQA7m7Zi7earQG3hQ2Pp9cLy2ZPjziakGIzdk+6dUjWnInFRoBd7jhcXLH5OLDlZ
         NqFg==
X-Forwarded-Encrypted: i=1; AJvYcCVoUJmm7j5Bih3U7uEpHe1qfJxoezIukA7W7fDeIvh56NA9Wk1vVmgFuJqUTgZyKEsado6W9nTpHAlWj4UsITmj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrn+W1y3igraOU1iOV2xWDR0G3ZVjrLijEEc1bQa+zqjKucste
	PbxV53jleCkyNWnzqwQPVj2IdoDH/qYgaTqVqXlaSTG328LEuo48Cf7pCcdUDOFC82S2McQczV0
	4Z0NPR2k2l+QrKXFbuFaxaiukAKIOGyw=
X-Gm-Gg: ATEYQzwdXKljWBIgp2uiIP0MTfr5MK5kNnPVEEIaGJP1xGQAK03Ds2limoAz4gIfMju
	yYyY249FSUYBxuIMtMiprZE2Rto3W2JG35HlA4ovGl7xGck/PC9upAJOsJflDGoHpUZON8/kuyx
	wx8L//h8dUwz4TuUyiz/2I9dPKpiYNkICr9pwYwCDABIa3jisI+KCCnaDuZBZE0EZUKlcIpC5Nm
	ZP8VZXQMcskP2IzMO+RUdgJEqtqYTuQbuahg09s1yGbwdV/v9YsoddUA08g8GhLzktLjKncxeur
	h6gH71vNsfZxYfJ5Ousa2BSw3uXSMrjhYAA/qlocSCkSSO/x3NeHUXAwz2uqnSx8ZiDxYxL3vF8
	0jCoVMVZt8sG8FWyW
X-Received: by 2002:a17:906:26d8:b0:b87:1eaf:377c with SMTP id
 a640c23a62f3a-b9765100eb2mr612118766b.38.1773695596720; Mon, 16 Mar 2026
 14:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260225230827.21715-1-rosenp@gmail.com> <20260225230827.21715-5-rosenp@gmail.com>
 <20260316204422.2145317-1-florian.fainelli@broadcom.com> <CAKxU2N8bNdUC9eS_qgqsJ3o=scmGnYoWh32AMQCpL2DDmdt52w@mail.gmail.com>
 <052e82fc-cb53-482f-ad6e-95a48b2c7029@broadcom.com>
In-Reply-To: <052e82fc-cb53-482f-ad6e-95a48b2c7029@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 16 Mar 2026 14:13:05 -0700
X-Gm-Features: AaiRm53bg82t0Gd812Z8wPDeIUe-VFphhM14f_CY1WlTx7qn1REsheQOw3Nj99M
Message-ID: <CAKxU2N_w0KRfQ-UX4T9pMaWhjt2JVgH6h=rGBhkA+Fk-eQfm6g@mail.gmail.com>
Subject: Re: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_141319_366949_F4F2D76F 
X-CRM114-Status: GOOD (  13.29  )
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

On Mon, Mar 16, 2026 at 2:11=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 3/16/26 14:09, Rosen Penev wrote:
> > On Mon, Mar 16, 2026 at 1:44=E2=80=AFPM Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:
> >>
> >> From: Florian Fainelli <f.fainelli@gmail.com>
> >>
> >> On Wed, 25 Feb 2026 15:08:27 -0800, Rosen Penev <rosenp@gmail.com> wro=
te:
> >>> The WAN MAC is offset by 1. Set in dts to avoid having to handle this=
 in
> >>> userspace.
> >>>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>
> >> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/nex=
t, thanks!
> > There was a copy/paste error here. et0macaddr should be et1macaddr.
> > Should I resend?
>
> Fixed it in place for
> arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts only, right?
I believe so, yes.
> --
> Florian

