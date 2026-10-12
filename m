Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6ECCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=; b=xdKbZHDzsJ3pYs7aEdh+X/uxrI
	L8FYMoUNaQ4yK++dAH+6cEtGiM7/ltrFf7mGtgMSH+sgvERim+cT7PUjKAycJUeTywgIz6QTGn/KG
	tnlKIKfXj6uiW1YAKJ6D6m6B2SUjsGDVpRKgieuGg1tSFKmVPkEeKzt2YPfsJSpVy+lhZxIbRIp0W
	1rl1P8FpMK9ssLGsavfsXdHKzX0QR0nQoFGh5IJAvzET6NLOBc4V/nsaLlG53f9LL+TtzF4Zi4QuZ
	pKY6JVvLpqwHNgRAAEKlZyq4BtnmthHi6f+kThKXtaBZMen4pY31gBaNRv3QZ7T3VG/AAbZm0edwK
	rTQf+hnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDU5-0000000AGrq-43mo;
	Mon, 12 Oct 2026 10:42:21 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDU4-0000000AGqp-1jkc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:42:21 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3a629a806d9so14610171fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801738; cv=none;
        d=google.com; s=arc-20260327;
        b=NftWXJi21ybavsvISj+Ag2xh2ixAs0ryOObFPg8BsTcwafV0fEZkukQjt7Vvbh2God
         5C8hZ2S4bX2rgu+bOy0XaeJOiiE9xGnGesnYose8hEV0AFleyIq/KEjBFrYZYx9YMqLy
         F5Vg4A1N37XHFaULk6Oh88Cz7nonFfCg/aNf3ho8+QDruTAsuKYLSMKjVisZXeSvajCz
         aEV3PAxdklYO7/mczyVxyrOviC3UwdAva35xHgCPgPhKKTB2PSn6WsfRFdpfFFx8Qx8C
         VyMyPM+akx29MT0TkYu0JKOaHVQj8sUjNrcgaxV/wIfYLptrBAlb8fgMOtGcCZa19kDR
         p2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        fh=1yf0JXH8HYuQIEb1UC6Weezkp9UpDCAQPFpZE1i98lg=;
        b=qkiusN/V20CwpcSbJVFYQaEHZSqw4Dklaz83CXlh6PmOzozqer0Ku83U8EljfJHJsd
         1FEjSGg0W+Uu5+3sUxMZHBheIfd5h7/MSXE5MWUi79iAsas/EPPVBDx/4KEfml9QEHBN
         0T0V49sEUEPiF9gkGhyhxUlMuxORqIOCEBi19/ONjAEtXOxRRKM0AVbPvAay2m/2WCi4
         ln60FMjeJOm+qV9BsFRWztpvRmg1Kp14TlsXEnZtXRphIHJvntiiJC99xjv3PyLCjuHL
         FX3ugKCEi/z7ZjiLb2ZfrIuqnsQjFwxr0FvN5rhmIwkTMoDIpmoSkGLjLyO/I5mXoqzr
         bI0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801738; x=1792406538; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=au65UgvmTAXXrYvR/oQBcz3ITIvJgMyxFXyW1KF3lLR84H39xF+JqPbUJjsmF8SrLK
         e7VQgwppvlAY0WUpMNpV+Wjb/ymoFyWD1pWegOwDCy6HrOiYgWnh+FEZVCTwRnCSsaKR
         89rAxw4j+FBnf+RRTRssMZyICN5Yvb/ETkHEZ6XNbJKvPPKLwv+GJHbp4SmhihFue9hZ
         lL6AxUSZNcZqDqRkc7WkqSk/E/FSYBiWHO5ZPKyArqE1d9pNII1SBsq0a8zCVbANSSua
         JfFlSe3+V+R6TmB9/II04E5RE0Ml3T3STKVuhtKMYXB+vm6q6j9S5uvRsPEoC5IWNasZ
         FT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801738; x=1792406538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=MsfFNSTS0uV0KEMsi/MVJkStz9aljzJBA+4PBeCvoH+Y4av9Od8+X+T/kYxQeXo8Tp
         41aV4t4B92hn2aFlXNSdY6apbP7Go1x/5nqsYXdGjp1KGtbmRFIW7wd92bSGKh1KBlsv
         MPj4OR271ATcy0t4ljIkGIQ7uxQ+/84Ky+QliqLBupFRHmd7V+xmXQltkPEqdiqcL3da
         xtCaHxuTCJVjJ9mGcL5jB8ke4S/szcIFo0XX64Po9Ex0gyAmSF/gO0Muc2karliTG75E
         jOw94pTtqxbA3tx1XRizJ7MNSa+rxIS9w/Nzl5fIoVCbUvLgz+ZaMAG1b+WCq4loqyKQ
         Joow==
X-Forwarded-Encrypted: i=1; AKwUvBx1hOpvQe05dV15kvViDgJDAi0v+OVUuv8Xi9G2piz+/MNQOF0rnnWtbim/9srUYwNUDTrxxUPG8tMGi4ZyVZJW@lists.infradead.org
X-Gm-Message-State: AFq9FYJk3jF3BEi4BuJwzo40z8WP5FMfDdLTj6uolBf9txS7enbgKn5e
	oBype2rV9La892vcGRoCcwrH4OlzYjh6pabrc60nfN5zLAkqAWaRn+IhSWfqnvMf4Nrk9eXEGtf
	W7vZ6TqAuKao0yckeveyN1DN9/WD8M2Kvrwdw
X-Gm-Gg: AYBFou0T38G5RcbMEsbs78q0kc59iBUJqU7adrAePjpAPfJ9/20i8dY29YtWa4uZ1dQ
	Wi2fgpXYwLDWQYEhBO71VRUuqJ56vl4JdMWLgO5/qOgXvXFNKf71cg0HNeq7QcBH+OykKLvCFKJ
	L/f6nppqbe00FLWRyIXNCRTlPL3YOfamn1PKjTQFqrr1kAPKXisTbiMhvQOTECHXo/saVJhL09z
	dtbnPgaH+zhGQ8Txg9RwMWR42mXFWEOnwDYM6gLjR0hN4BgWy54K5FDH3+45UWk8EHWJmyhxFAq
	MkN8eAyJprTkgivVuyc6mdzpEs1GY0ZzJgxGeXJbsG88bZl8sxeV0Mqwm3aIxzARJeL2oCbOXCz
	z4tYw7AVk3Q1MXJTvWaqU4WnsMlxLTlWmAiZ4Q4So9IzDJgDgyeP8u1CR4Jm51I+ikh1lxUaE97
	e8NZqDGQwxpXbD3TpPM3aHKALEBm0i0zxPzlw4XY9E+Q==
X-Received: by 2002:a05:651c:b27:b0:3a9:9b67:25f7 with SMTP id
 38308e7fff4ca-3a9c53b0b19mr23170161fa.4.1791801738046; Mon, 12 Oct 2026
 03:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com> <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
 <asyyLJ3nOUxJ8TKq@shlinux89>
In-Reply-To: <asyyLJ3nOUxJ8TKq@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:41:40 +0300
X-Gm-Features: AclHuK-RRzScLhztBzLfy8Jh6NTaM_vTOn9ggo9DZdIceERnpI8cnWgRhuFuAK0
Message-ID: <CAHp75VeRG01p06vT-8-a=VsFj5PKRFH-jUNi6jeerJrHfshHjQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_034220_471699_8ACA153F 
X-CRM114-Status: GOOD (  12.49  )
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

On Mon, Oct 12, 2026 at 1:06=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:38:37PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:


...

> >> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtim=
e_put_noidle(_T))
> >
> >Please, split this to a separate patch and move it directly to pm_runtim=
e.h.
>
> Frank raised same suggestion in V5.
>
> I tend to avoid introducing cross-subsystem dependency and use a follow-u=
p
> patch to move it to pm_runtime.h

Alternatively you may not use it, just carefully put a goto:s and error lab=
els.

> But since you both vote for pm_runtime.h, let me separate it in V7.

Also think about splitting the series to three. Do not rush! It anyway
missed v7.4 (except, perhaps, the first fixes part).

--=20
With Best Regards,
Andy Shevchenko

