Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51C2CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 22:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igXYnTt1y5W94mwyAvmuGSDvQ0T1atQGMaOaIv56W9Q=; b=namYUnrCbXs8XlMFvJ8iGz9R27
	TXQJfSA0w4V6MELdv/YJK74QQYvZSYUuf3MFeclrkRSm4mT2BmxV8tggVm8dGb9BjMOb4u+Xxez3v
	QTJOdwVOqwNCI5EIhgZmGDnclH6nA14hzEg1/eaILezRVuhdkp7TdACzHv2nR08Zp2btwywHdI+GM
	0bXrkYg7MnJyjtsYfkKLv2+wEEEgkVQQBx41I5UosdcPontMeJsDQRhLTZsICHGJv0v69nl0HMuGO
	j6OIIQVkKw8DGw+6lHMX17GE3eUfgwWQ8vmvtUGn6X2hAVOT9t2Crb1Pl2bd8js1MzogRtkOiviSJ
	4bcPlg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOgN-000000005po-49Bi;
	Tue, 05 May 2026 22:56:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOgK-000000005pA-1rqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 22:56:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so572333a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 15:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778021757; cv=none;
        d=google.com; s=arc-20240605;
        b=eNthyKdpgg0LbAAam6Ag8vytjQ+xEKd1HGPECwcjXTseLymiSc9UDKCr1bp/w9No+5
         Gtvi0YvBM0NVeTTOKY0tFLZJFy3ocy6ODJN0uJzWl+m2TLL+dDsd3vddYaVAXORYSqTo
         P2EglhywmwRQ2k+TXaWsN0oW+km8HImXinKt/TpdZgQ2v0kw7FD281mQdA13dN0J1HSg
         vmd50UHk0/UE9aoz6P5zHojs96dOzwdLs/0C2WlgtcBNJkkxZCOSNqXhsLg2CTzEgNuM
         ON++wNK1XKcdk0yEevvKaP19UG9mlnGcIu1064INr09CKNGdCcg40EYLGQTihVAkjbgC
         S0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=igXYnTt1y5W94mwyAvmuGSDvQ0T1atQGMaOaIv56W9Q=;
        fh=DEgbla50Fm2zH+pOK9Og79WtDBcPhCzT3V/q9+3Av/k=;
        b=OKTbzwh9CjHh0MRSY+RrvY3SNI248nvdmO6ZUdH5qrv81eGHMqFNVgmNKIOGBN3Fwg
         NU07nOboPHb4LBtbLWtiP5or5Tq5vcUUmY4wxemAWBsGsl/E2mR+Rau6PaIN3Xnu0p2L
         Myqc87LhMd6BUTN8/YrwiZ1A/90QKa3xqlJS8PqzK7WwsvCI85WLtI0P30cB13UbgzyC
         jm8m2/nIN9aSfxwya0iLqwZjemC/dsK3qKmPBYmK9e1ybx3GoBi64vNB6gdUbXcK5xPN
         AHhBp4c1PDkWcDRWzAJRO5QGHGnQZAyiB3jylfnOkXj+Qm6Ws3bYLdmQ1Z/+Q4TVZyXV
         EAGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778021757; x=1778626557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igXYnTt1y5W94mwyAvmuGSDvQ0T1atQGMaOaIv56W9Q=;
        b=ZhgDtaIW3zc8AEHDHIpeMM6EYyCf4ebyQKrV+PZ5pWVEkFFYndFJxiAjN6rl4B9dRa
         ClAy0h1SM3z+Zak/h8BnsOuNscwc8+cwncYD8Wp75ZZUJr6K9K1FhTvnTWyoIjQPzncX
         /pkbzYbL+z2/1/pLZlPCduLfxlqxhv/XSNotEzjtYNmzgwMZF50FWt0sBxJqN/cFme0E
         0SH+j6wmyS4Y8ev7G9iDjdSdp9WX6EUF54arQfvi7BuFXfBcGAQPUsexou82VR9bG5ys
         lbSB+11k201iJWZh7jCdq4Ywtyt+46nY8JPdPeNfYBNroxbVvKf8JnZwtfBMpQh6TrFJ
         SXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778021757; x=1778626557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=igXYnTt1y5W94mwyAvmuGSDvQ0T1atQGMaOaIv56W9Q=;
        b=cGGYx27xF1DPn8Fd8fxM4qDqveoigmP/WCndHR/swkBWBLMB5EeB280+feoavjY41R
         ndeUorD1cMLQTYCBA5mUvOmn5hsu0ox8hbInlzSZY7OFyJtY5CQWCMakP6xyLPDjqTkY
         TxPpjxh/DQ6tstc7Pv4KPuh9yAvnEnKkHIGu3EfaQfwrJr0z/Rhs1m9jUqJvpd6D3xG5
         FkOOP6EYlLpFByJolSqULkFTIM3SLOIDzlyZivhqcC5iHxMDmxJto/WTBNW0ckaCRPby
         nxT7P4N4h+jukhCCQVpOmOr2c6EdUTh8QWldAS0Y18CapEzd0HzmYZt8pftHN0Ht0nNN
         k86Q==
X-Forwarded-Encrypted: i=1; AFNElJ9h5Ml+7hwerhJ9BqVbztwW+fKIVe0FvWlmzZcSNY91fjUnLHiwmXtJqyCOKjtuT3VsXLq2Xv8SD6JWssY7ooeL@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ2kfM/TgtkmMGh5yYpuaTnLAR7Zi9GgorN8ASx34ZQUa0s/yW
	XR/h6M6khQ6Jjy6wEXlE2RQaN2pIXLztmUG8eOXJNu7j9s5Mpd/00swg4uENdOU7qw8ZSTvs9FR
	5qMVwDrgoB/Tv7pNKTqaOBJbFyNPB+eKRJynCYtZo
X-Gm-Gg: AeBDiesR0RiQfyvx1GKsWA+rL6y6E3ScU6RFbautLzzz0ZVWk965Bxj8up+mphDhBKP
	XvhMlPIfF++Gw/ig3bj77L/BZF0zDmfkOkjOlod0szXptNYk9eG12bamhgSF9HIy1i6ds/VG5jU
	GpSEuISirDhFhvXRAvUVeXhpFm5XKaffh3q1yNQ4UN4J673fAQq2+LMci/c7de5GQu0urON/hPi
	lxQoA4r8MIFhs06QIaVUpoAP+TEAWF6laqDd1DvXtGrzPFD+dcWxM42gyTuMKIplR/CIb/MbnWb
	L0SNxG+7NlGTG0nbEzqrGlEmKKtp
X-Received: by 2002:a50:8d89:0:b0:67c:a9cb:d85 with SMTP id
 4fb4d7f45d1cf-67cc392dbd1mr2021608a12.11.1778021756772; Tue, 05 May 2026
 15:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777036497.git.noodles@meta.com> <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com> <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
 <CAHC9VhRsnmPp2KmQAns5uq5qXX5EF2xQQzyfTgrPi4O9AXyPpg@mail.gmail.com>
 <ba4bf28314b679474a6a8da6298e548e54b3754c.camel@linux.ibm.com>
 <CAHC9VhRE2kRr1fdDf6xgQgpSrtvqtP8Vy9LVGJhDZFUbzLKGmQ@mail.gmail.com>
 <ff28c6dcb60c357c752724927addaa8c4fd3bf2c.camel@linux.ibm.com>
 <CAHC9VhQY2TMkTvQq9P8oZteQWQSr7qq2utOuH+pdVx+8jWLBCw@mail.gmail.com> <a9412fe10e70ce95dd70556ace19368bec5c188c.camel@linux.ibm.com>
In-Reply-To: <a9412fe10e70ce95dd70556ace19368bec5c188c.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 5 May 2026 18:55:43 -0400
X-Gm-Features: AVHnY4LjwHbGYu80nNIZo2bt6oowEdScIKVunh9rMqRrLydWrBO3U9oWRNn2sww
Message-ID: <CAHC9VhRUgNA=Sj=jhD=zOt8R80Q+FQj+H0nYSy-FAujTL3EKPA@mail.gmail.com>
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell <noodles@earth.li>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, jmorris@namei.org, serge@hallyn.com, 
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	jarkko@kernel.org, jgg@ziepe.ca, sudeep.holla@kernel.org, maz@kernel.org, 
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	noodles@meta.com, sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_155600_993252_D4125A3A 
X-CRM114-Status: GOOD (  19.60  )
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

On Tue, May 5, 2026 at 5:05=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wro=
te:
> On Mon, 2026-05-04 at 16:51 -0400, Paul Moore wrote:
> > On Mon, May 4, 2026 at 8:03=E2=80=AFAM Mimi Zohar <zohar@linux.ibm.com>=
 wrote:
> > > On Sun, 2026-05-03 at 12:46 -0400, Paul Moore wrote:
> > > > Regardless, assuming you always want IMA to leverage a TPMs when th=
ey
> > > > exist, your reply suggests that using an initcall based IMA init
> > > > scheme, even a late-sync initcall, may not be sufficient because
> > > > deferred TPM initialization could happen later, yes?
> > >
> > > Well yeah.  The TPM could be configured as a module, but that scenari=
o is not of
> > > interest.  That's way too late.  The case being addressed in this pat=
ch set is
> > > when the TPM driver tries to initialize at device_initcall, returns
> > > EPROBE_DEFER, and is retried at deferred_probe_initcall (late_initcal=
l).  Since
> > > ordering within an initcall is not supported, this patch attempts to =
initialize
> > > IMA at late_initcall and similarly retries, in this case, at late_ini=
tcall_sync.
> >
> > Okay, so from a TPM initialization perspective you are satisfied with
> > a late-sync IMA initialization, yes?
>
> No. On some architectures moving IMA initialization from the late_initcal=
l to
> late_initcall_sync does not miss any measurement records. However, as pre=
viously
> mentioned, Linux running in a PowerVM LPAR the move would drop ~30 measur=
ement
> records[1].  So no, only if the TPM is not initialized by late_initcall, =
should
> IMA retry at late_initcall_sync.

What do you do in the PowerVM LPAR when the TPM is not avaiable at
late initcall and you have to defer IMA initialization until
late-sync?

--=20
paul-moore.com

