Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8670C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Q6Q8jost6RR+L6/1WQaoG8urBg7K9/rNabjNfsQh20=; b=Qmvot/1DH9yiZqG2682htzKLuK
	RYzQs5Q9B71tdiwQXHF8FrLJKpvIw+/hhIFdz2tifn7juDwN5iVrp6hhEX0wtCokZ2z+COWfAa/ny
	d3648wsNBHRxHD3HxlBGnar7R2b2JXAsyoiI1ssgrcTUAZrWSB5tt4vBLTY6lUFuncSTJvNo+ecC/
	NBMwDj7Ylwv1lKgh/ipN2f7Xjhgwnsbcxy0QiHVYChOowu3138osh05oNhuZ8/UL3N/f1MCIe+Gqf
	fzRKaZv3zj5ALjTiJ8yqzNiZ1G0OtwxJkHaqcnUUTcavwhySwFxzPBj2IrU4afxhem1Q6deyAxs+c
	m7cRv7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3vz-00000005xZQ-49hy;
	Tue, 25 Mar 2025 13:03:11 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Gx-00000005n3D-17Wt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:20:48 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so67310286d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742905245; x=1743510045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q6Q8jost6RR+L6/1WQaoG8urBg7K9/rNabjNfsQh20=;
        b=QWr1S6d1v1dnBOzl3GMM8b83BBQjiEl7Uf6+RjwbxRqWv8JVVf9C/dls1RsD4zmS2B
         8ZsPSQfexYJ7X4k7se+I0GPQH4z5ckgM7m5qTCD+AcF/7CzNdmZpCcbDIXhowJavN38w
         0DX/+sprPhZyeutUvL4nqjzwpf8PIAIPohnJT1APh0saK0uc/amj9vxzM3JUMtJD+M3Y
         Br0VzUKlZI6arMAAKmHwTZEWm2ZDIEvqBkzp0Yksa8LGGGoH+mmGXzESLRsUauHwuSxM
         idGfm0B9+dliqT709a0738MGOTLCDfw7bvBMqTv3gH8nH5TwNByn2uCk4zh6i11vUzo4
         uD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905245; x=1743510045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Q6Q8jost6RR+L6/1WQaoG8urBg7K9/rNabjNfsQh20=;
        b=WyS/7xKk2S6zWa/Bk/YUNn7tIJuWO2MWvl6mexQ7dpP6YV/eLa2yzJwpGYmO4XW1u9
         Li5IFWlKXvzPiZ58C2gntLGxIzqt72lk4AbLSUh+uYE+r9TH2/CzOuEbU99rCGpZa8ub
         gDyDGStk7PJ7E1aL44qHBxVlehZVK7MfuS3Kj88nplq05+XVmBct/3b7RyS9VOYybu86
         9nM6qYNcmo1pj/N6av+QPB/5S4eyjSjUUn75XheWSlUz3H3VyWuykex/0gcywlMIDadp
         LrMDoY4I3FCKq7B+3ECaPl0eh0eo4S28UZFzoBMYJvO2DvDaEwXvCVZsvU+tJHidVB7P
         9NuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRVuoJTEjUQKKEijHKcXXoqjxrdpxiIB6F/nxceHf2IMybx4399ft697QnrSQx4Q5ZxtUKgN7MGdUX6G40nYbi@lists.infradead.org
X-Gm-Message-State: AOJu0YyoWFMIiz7JeBP/9tsOTXiL3P3N6DdDrm8/MyHMJrXLGz53YTKt
	QxdfxAjUBBwhibfU8JuVpiShWdDIbeI9sl6cflHsI2YbYCHzo+Q+jusZzps6a8W7E3F4dr5YMqu
	wvjxf8nBplF0Y8yZBdflWcsO04l0=
X-Gm-Gg: ASbGncvlsyoQkPnQ4xcTBK3+EpdXgdf1sNLgNMGW0cEWTmGuI3ACfEomeUFbhOwZ9tQ
	HtTyROAdWn6gvW9oGrVBuERr874V5NN51wf/NfHcy9OuU/8Uq87U5gVxHtLG5mlgFFm9/2OseJT
	PbqF/mmpreSWuvgCbbZTKSrMtAF577O9bEx0ZpMxBeuA==
X-Google-Smtp-Source: AGHT+IHzPCRF5SOBl5uX+I45ItuIcu7yYqv1UpwkBeNgwvJPwNXZIu0GAxVrZtFs9aKbKMtvCsG5QpWp0f/ADoOZEd0=
X-Received: by 2002:a05:6214:c64:b0:6e8:f17e:e00d with SMTP id
 6a1803df08f44-6eb3f2b884amr196473756d6.14.1742905245447; Tue, 25 Mar 2025
 05:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de> <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
 <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de> <7afcbbee-6261-4b2f-be14-a3076746d53c@prolan.hu>
 <26e36378-d393-4fe1-938a-be8c3db94ede@web.de>
In-Reply-To: <26e36378-d393-4fe1-938a-be8c3db94ede@web.de>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 25 Mar 2025 23:20:34 +1100
X-Gm-Features: AQ5f1JqJR8vf390EC146ON7d6-teBUeT_TrrTXamjUUZoP5Hfz81vyeOiEOgepg
Message-ID: <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>, 
	dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052047_303650_FB9A6405 
X-CRM114-Status: GOOD (  21.46  )
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

Hi Markus,

I really wanted to keep out of this, but...

On Tue, Mar 25, 2025 at 8:14=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> Implementation details are probably worth for another look.
> >
> > What don't you like in the implementation? Let's discuss that then.
>
> I dare to point concerns out also for the development process.

You're "concerned" about patch granularity, but this is not the sort
of thing that some random person would raise, this is the sort of
thing a maintainer asks for when patches are doing too many things or
are unreviewable. This is neither. It is a very simple cleanup of a
probe function as it says in the patch subject.

Futhermore, this already has an ack from the maintainer of this file.
This indicates that they're happy with it and no significant changes
are required. This is also version 6 of the patch, if the maintainer
was concerned about this, they'd have already provided some clear
guidance on this. If you check previous versions of this patch, no
such requests have been made.

Your only other "concern" had already been addressed as has already
been pointed out to you.

> >> Please distinguish better between information from the =E2=80=9Cchange=
log=E2=80=9D
> >> and items in a message subject.
> >
> > What do you mean? The email body will be the commit message.
> See also:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.14#n623

The email and patch structure are following the format outlined in the
document you link to _exactly_.


Once again your comments are just noise, and your insistence on
repeating them over and over and over and over and over again is
borderline harassment.

You have been told to stop this nonsense many many times, here's a
link to the most recent one:

https://lore.kernel.org/all/92d1a410788c54facedec033474046dda6a1a2cc.camel@=
sipsolutions.net/

Please stop sending these emails and go do something constructive with
your life.

* * * * *

Bence Cs=C3=B3k=C3=A1s, (I hope I've got the order of your names correct)

Please block or ignore Markus, at best he's a nuisance and at worst a troll=
.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

