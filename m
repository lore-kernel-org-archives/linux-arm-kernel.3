Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B5EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=; b=UH/vrwWUIzBLNIuFctiQ2sH663
	Y4MYxhOx71Imv6BkInl/vSW2ykmuYHBYt/zlX3GT8IwkJlbyoueDcsHZYK1NjHHGuA196dnv/PmAl
	QePowfMMlMnYgmB0udChHYLV53Q6jrVwrJmthwhjW53b2w2b5FUAZkKftMHGBML0UptY2l9Osyls/
	vS+ofpDATqyScKLsTz0fS06r7Uwvif5TmxMjQknYO0zkyJxh0SUNAMgaTjxTVxbGyeUXZxMI2Su5c
	f6M/xUyuwtxtWY6gYg1IHHgJ6JbO+0rzGhS8NHKCsoKJzmbd9Wq/Bk+6d4ZBqwpxdzCWDGVYLtJb1
	TlCLGxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3REL-00000005s2A-39Pi;
	Mon, 07 Sep 2026 04:45:17 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3REJ-00000005s08-10uo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:45:16 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7eb61bbeb25so2948552a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788756313; cv=none;
        d=google.com; s=arc-20260327;
        b=O4a/rUttgdTb9QnzCim9FYpWHhjTGb+d/pafhD+uDySYRByx1RYIpZjgIS6SFVdwAx
         zWW/wHgPQf0OCl8O72fv7bMVyv2zofKhB6F5CABU1MVwUk7N+D1c95Gs+Fnxv+s5wCbp
         tReDncPnVwQ+Xcoi+0qS/BA6ce+RM/vTKpF9/uOipC94LFNf9zf8Ox6LlrHW3yrD7bmk
         VBCgOrV6jZq9M91Nnb2LB2wvcoVp4UN0Phj/EhslpLtOzF2LmUcpLpUeTGD7jXCbFOon
         ZjMNJmSoCN0cGI5ICSlRR1e2YVNO/M3+qqgRTqqkH4a43An53R2yxL2bOkXGAF37Uxdi
         fTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        fh=azEDNGNEzJYugnY9/pxcPkYCDRmfWtad/7OL9hkojko=;
        b=pwmpS3nTF/GcdijpeRPeBdAVzx2ZdmIBiaLT4EkXZDslgD8UYOFKHra7F5EUor6pdl
         JnoAGSaVpS4Tc8V5KfBiteEh11mLYW5/+iWDK3oHTJucMYyPNgjxb1uZSihkzq3C5o0W
         SpTKDw/C/tjRmRq4AkXd+RjWbywFJbEwJ722YsndllHGexH9NaaLv2aLhs9dG9cJHJwU
         ehbTs0IpMI0flP4stUaeNGY9MNpPEuv2yOyEu2IPJvWiysly9rafmo5CAWgceiJSg0If
         1mVrfMcrufaO7CZIFwyWdhA8bOQqNPHEEXxpjOf9CcwYI3jze7VUfjG8bCsx/I3QOno1
         yWeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756313; x=1789361113; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        b=TVBYJrpxHfXkqImpPyRVT3QUsLsJbQDZNQGmRjLNsbpr7uApfb9iFwMnykkR+JiOEP
         INubTyt6WWQytXMXGd2G/fD19vbxqb2+bgTxGKkVZRfGyU9bGrOoWiYgHuiLuBTJyUm0
         niZfF3Ii18NNBu/jP4HQ3yvhe8vZOztS1GN/VRXL67YU9OilmwGhdYNFOel4PplThfLS
         s8y9hz6vSs+xdi9dD/toNUAI/zYZeXdrMQP+nWP0vJEJ9J/3shL4E4acRYHjQbPIuV6T
         blSSdY0xJ7wCQgpgmObDSESFXcvJDs6uI+df2HWEDD0fTXhQDWZwwQpDnTIVUuYvz80R
         SNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756313; x=1789361113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        b=b3W594bCaDRg+aC5Sfq87d4QKg1Gr01EtiCkNASbKNXoSOTGJQGvBsmJ1PBgPHPfzM
         ACv2+qy/ifqJ5xr2nSUXOXByT5LMKddA2bmaDB/lpVwGBxd+5LN2Y/8+MKZn0C7WZTZt
         bUKdN7+NFMlaEPtBgZ082XIAAqyDynLvwnYzEFdetw2plZ/IjrjDsGVDZFOixx7a44JR
         QBNTxeXd8jobqe30Xvf0gzaRKCJ6Df3tp81HI6J7ATZzkOzflFTeoE+36HX1tmaxfzCG
         jIMqapmApSpl9wVrshYkE5e5Us0ChMFIlvsFhLdtRqouZanURsk3q/aC++7KWXCUaPEP
         ynnA==
X-Forwarded-Encrypted: i=1; AKwUvBwQU22QtOJXKlvTW53XT4P9DjYmw92yJBq7VfbIKfOyoNWk/N7v2h1n7q+nNW6G7oHgP/PMC5CSq8oe2n6NP9zW@lists.infradead.org
X-Gm-Message-State: AFuF++mLPdqnflHWT0TuG9IcoJGL2gQBsBJdor8+xVx2RNjhPolyft7f
	B9Olc+UVdhw/IJ1Y5vqwKyOnc+nYIug7r9OdxJVvesOwHgdIgFMH6YaeQVNxODuhEcpUhzxfOHc
	V/hD00IV94IUqN5xZEDIxwsrLmEctT8Q=
X-Gm-Gg: AYBFou3tjnMG7iO+50UnUOqs9G9JJcoCcpK5Q8tSrxWF9wowkq3x2IuSf+4/Fc1u+eg
	A1H4bHza3N/o9AnQAmmq/Cl/DP4wVikrHOi0qSV8mFyuPzQ8nTAhkAaanmez2on8NDo6xAJeOLG
	uEfy4wEv6rp7c9nesTAus0NUBKmYXaLJD/wR5G9QoUb8ZfOOjxSVWlPGEtvkT0C3G6IQs+hwgnI
	UyaE/RbnWb4in1mFoBqMDKjGH/VllHs0CDbptFRCKslvlL2kERcDS/Glzk3gCZK5eFsl6tLcD4y
	7GppXW6+fWnLJ0s6GDNMRBjmPZx0O6EdvMyfBKQOUA7gN6Ik/SDA1/fkHOwePZQPdA17llHcr0u
	pMdW93/cDfo4T/H5EGVcOFLOMtlo=
X-Received: by 2002:a05:6820:1889:b0:6b1:afc8:3162 with SMTP id
 006d021491bc7-6b6fa4d5f8amr11758130eaf.7.1788756313416; Sun, 06 Sep 2026
 21:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com> <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
In-Reply-To: <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 7 Sep 2026 08:15:02 +0330
X-Gm-Features: AcwNN1XGwRoDkNehPDVqSJPI2X738z011aMfgwn8IosFsynC5ZFf-DlnIt-yf84
Message-ID: <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_214515_362159_1D126475 
X-CRM114-Status: GOOD (  23.24  )
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

Hi Hans,

On Wed, Aug 12, 2026 at 9:50=E2=80=AFAM arash golgol <arash.golgol@gmail.co=
m> wrote:
>
> Hi Hans,
>
> On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol <arash.golgol@gmail.=
com> wrote:
> >
> > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> > and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
> >
> > Each patch has already received review and testing individually in
> > previous postings (see the changelog and links within each patch for
> > that history), but none have been picked up and none currently have
> > a delegate on patchwork. Resending together to make it easier to
> > review and apply as a group.
> >
> > No code changes since the last posted version of each patch.
> >
> > Arash Golgol (3):
> >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> >
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> >  7 files changed, 194 insertions(+), 220 deletions(-)
> >
> > --
> > 2.34.1
>
> I've been trying to get these patches merged for a while.
> Multiple pings and followups have been sent, but they haven't
> been applied yet. This series is just a collection of my
> individual patches.
>
> All patches have full Reviewed-by/Tested-by coverage from
> Laurent Pinchart and Paul Kocialkowski. Current status of all
> patches are still New in patchwork, without a delegate.
>
> Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28=
738
>
> Given the review is complete, would you be able to pick these
> up, or let me know if something else is blocking them?

Just following up on this series.
Link to series:
https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28738

--=20
Regards,
Arash Golgol

