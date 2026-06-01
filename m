Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623ACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ANhlLkwHvRoelO6mK6br0cQySzE0loZY7WZgKnNoyg=; b=Y3CxqI5WaaMI6d+a3jDZnng1I/
	7WCLkOcILDe303gv1kvv+iTqaaMtcMGvwK4jND1LM59WRNPjU18Ii1QbmY8nduUVB7y1hjr6bA8+u
	3jHY189itC5wGxBZeaAkoGMtjawt6tYAaAMdf+gUPGxJCZ3rD6zf3MCr7bHAIfGoJZwZfMTtXCjli
	FXEGtxtOmx/Sr3D7MB6FyXJVDF2aUbdBmo59c6nm8KI+D0nS58mCtdks0Y1u1fP0yYCt6HH6En4qV
	ap8Y/3Mj8vEXml6VYZnAraNmG8Zug+2AYERPWypoSBFixM6sN+yme8769MBuEGOnjLvcCFj3k5voe
	szE7UmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5mA-0000000BVeS-2ltV;
	Mon, 01 Jun 2026 16:46:06 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5m6-0000000BVdw-27rA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:46:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so1981232a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780332361; cv=none;
        d=google.com; s=arc-20240605;
        b=KUIZIEwNWdgRgp7oI1uT3W0bSUUgzC10O0z1w1RkM8c3zu6fIA5Tt0+apqN0+YwIQo
         u02VLOF7MVsM8/yc1woBgVJN1ns7ywSAKJCiaLhZKoex73vjKvce4ukFEwWZ1OU95MUf
         twJKNq2Gw1aBMWieQQ8wwwL85C7+fE375XXE1ID1Fh5S4oPitxgEFabGPzNq0rcqgmJQ
         R02dMDNkl22jfSbZ9TwlyY/+O6/7sEjuPJq2gzkwtcdLWKKbmkAAJLigEm5JPViDVLyF
         nd3kiBUA8kUKMRlCceaP6873lCEGohGt/sYaXnGYkxDEA+eWxk6YUBldCQyu9xnejn5X
         WVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ANhlLkwHvRoelO6mK6br0cQySzE0loZY7WZgKnNoyg=;
        fh=FbYg2HRsAwvZHK28ncbuVv1jVMRQKb0Y30/wj4ckWIo=;
        b=RkupbJuqAdPIScYhn33Cx1/f99kxr+lgjwSAuLbfEelf3Mv9NMYzFxWIlol6k9VNtD
         TDAPxL6BdH12xZzC/a+4L6LSnQt7L09MhMcSPG1X30ys36yoPZTNHfvIgXpeik7yDuv4
         cnO+eRQYEoZmVZlJ/LZHHkJIvWBQf6PolUtQuUYDkf7E4ANJMo1Kz4OB5QL5zhWREZP9
         9sZVCZ+dagSts3mDn9goFJYpSZRDiAGD9CcqXJNI9QBIerl/1RmPpUcR9tdZoLGiUoaJ
         C6h0Rj2paIGYXoqXAhDCD7cp1zPAmWXoUPtM2sYC+36BrGTCd1zsIxiXu/GJeqUDvA2y
         3yTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780332361; x=1780937161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ANhlLkwHvRoelO6mK6br0cQySzE0loZY7WZgKnNoyg=;
        b=iEjv6k7+td94AfpFGnuRTSoIt0XQtJ0kfqSUTvH4AppRBZ4OvONWXsM851zAgBQ6gM
         w06k3sMs2D+iO1qaohC18IFs0EInR4SWPS5ZD6umkTRKrI9qI8+vea5GtxdyeInVIG4H
         GHQjOgXbXAj8gEt8ea40l/jHS/YNIEEI7HXazidA6DcajUAHKHaqPtNh7q0i+GnT6VLB
         RQI83Szk0U64nlOTqhYMbFwren4IvKFdYWZ1wM/Jhp1DrovC9PFXLqLkIEqD9pWl3sku
         J7J+D5Qcet6e29CbJDHx+gZti28zwz09GfijBkD6FgopeUhZbGeo5521/GH81POQcqSj
         Iuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780332361; x=1780937161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ANhlLkwHvRoelO6mK6br0cQySzE0loZY7WZgKnNoyg=;
        b=rUcvWQyrFrOmFjTNrbB9qQP3uhBXaERpT5HRXRaueAGdEPr7TSpwalyoo2o35w9Qzr
         ZNIDRsDEJ1mK/WkVWGywIOo3Pvtrdbzbmf6RxKNCiO7pyAWHrovGUYO7r4MFU5/lL2ok
         gpugFLaNqbOmoJjUeC0gFGX2I+oPaDKKmzI6dhDeNFIfR4E5DHyIDZF87QX9u/oKMKVe
         JWGXbvR5cYDDg0Rzq0Jp8u21jN9+r6exKWO6ftdZ4h64A5oz1244+mHzwfGwNB3mKrNZ
         by/0xnWqxGJxtYAogDU9+m7H5Rm20gRBeN1NfW/8ukOu86q8RNtpXGgTswCbaSPyJ2R0
         RZxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/5LF1sz/3zAFGISuFuiER7Vv5QSmHiI+vGJsy5F7JKyAC+iUN+6KFK95IVo2HTSTA8lzkTdf47hQon2j1/hmO@lists.infradead.org
X-Gm-Message-State: AOJu0Yymmg4DcAPbhxl09oEYtnZyPBhDMqLbfDvqV3yPdC3k16gyf+h5
	4PTGu2N8raDDFjiqlXl1pv+9bstCh6Nfk+e+dkAfBNxbVXsdwV0B2tA7gQo686RMp++vGup8kfZ
	XD/VKwsujAiEHVn1f0j47N3+QKJV/4L4=
X-Gm-Gg: Acq92OG2h+nCCplbOspKFWz58MKy633onQ4LqPdGXjffZDyxEP24TpcDmG+IBuIActV
	v5ArvdSf3f7VejVxCuRV+PDXOutc/cau3Y3TzDcAV0JLUQ2iT2ZUbK42chX98nH8A1AHwY9Q/3G
	jAzZq2OmicEBojF1FZ84wFlD5EfISG3cZmmVte3OGAL3HIxyBmf3QmRPQOmvkPvQ5GbuRNO4znl
	L+B84FY7dpjcllYR9CDzlUu2Wq49ouBImUgkmQqQZREvYM6X3Y9ECY8q0VSy08fJ7aKKc3R6bRG
	7mugOwX2pw+EQlMUBHk=
X-Received: by 2002:a17:90b:3a4e:b0:36b:ba9b:7efb with SMTP id
 98e67ed59e1d1-36c4fef39c9mr11682696a91.5.1780332361350; Mon, 01 Jun 2026
 09:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch> <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
 <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch>
In-Reply-To: <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch>
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 22:15:49 +0530
X-Gm-Features: AVHnY4KRCdi0h0Pqu6KDLr2ceAipTIZUEfDFKMo7TgmBS2phs0b3-uUhiqQc9gQ
Message-ID: <CAD03fja5oG3-BrQoy4+LEmCWPYGW_JWDEkaPndjSVz=PbRj4wg@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Andrew Lunn <andrew@lunn.ch>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, jacobsfeder@gmail.com, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094602_572138_5CB0C6D4 
X-CRM114-Status: GOOD (  23.79  )
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

Thanks. My research shows that no user-space application depends on
this driver. As you said, we cannot determine the subsystem without
knowing the actual end users.

Thanks,
Arihan Bhor

On Mon, Jun 1, 2026 at 5:59=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Jun 01, 2026 at 11:35:14AM +0530, Grewstad wrote:
> > On Mon, Jun 1, 2026 at 1:22=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > >
> > > In addition to what GregKH said, look at the vendor information:
> > >
> > > https://docs.amd.com/r/en-US/pg080-axi-fifo-mm-s/Core-Overview
> > >
> > >   The AXI4-Stream FIFO core was designed to provide memory-mapped
> > >   access to an AXI4-Stream interface connected to other IP (such as
> > >   the AXI Ethernet core). Systems must be built through the AMD
> > >   Vivado=E2=84=A2 Design Suite to attach the AXI4-Stream FIFO core, A=
XI
> > >   Ethernet core ...
> > >
> > > when used for Ethernet, a uAPI is not needed. The FIFO driver would
> > > just expose an kernel internal API the Ethernet driver would use. Are
> > > there any Ethernet devices using it? Is there a driver for the AXI
> > > Ethernet core?
> >
> > As I said to Greg K-H, it's 'chameleon' hardware because we don't know
> > what it'll be used for. It could be SDR or Ethernet or whatever it is
> > programmed for. The main thing is that it is a streaming interface.
> > But we cannot assume the use case.
>
> Flip that around. What is it actually used for today? Make sure it has
> the correct APIs needed for what it does now. New APIs can always be
> added latter, especially if they are in-kernel, code to glue it to an
> Ethernet driver for example.
>
> However, a grep for XIL_AXIS_FIFO suggests nothing in-kernel actually
> uses it.
>
> Are there any real users from user space? You talk about SDR, does GNU
> Radio use it? Using what hardware?
>
> If you have no idea how the code is used, you cannot say what the
> correct interface is....
>
>         Andrew

