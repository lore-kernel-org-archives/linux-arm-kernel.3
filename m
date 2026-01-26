Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C5C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 02:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8AR0VhDV4OTwQ7mRcydNkMmnlFjeqjkMVYVyByfRmo=; b=sdaZYj/uusdN2uaizX6rvUNeru
	rR1qqNTuUXS1jBpiWjQh9iF7VPhkM6+rHzOehX8zVIzteowOix3CR4pggrScm4I5qh4pBpxBjgzpE
	X6YGSDVdO/+Uh6Trwc8GXO9tn/D8LokBPcDpf6E9zfwyB5wYAQ1gg1RCzpoaRvCdolbUm2HQ9sLxG
	V+Dr31K3IgQcSHEijQoWgw0eKkxnLbD3+pAmvRhAo3wJJSSYCK9x/d6VOYZqjFUxG3RBAgV8k7ULi
	16tnofGK4vitTOJYGhk5S8IdBciPReBHL9kj3oZSUsicvp1XrtHQLwqsIeP19qAyaN7R1UetLtpzz
	z5s5BQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCWb-0000000Bnkn-2AFx;
	Mon, 26 Jan 2026 02:40:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCWZ-0000000BnkO-19ID
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 02:40:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a12ed4d205so26160155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 18:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769395217; cv=none;
        d=google.com; s=arc-20240605;
        b=kP/+z+x27xSnDK4PWQ0DIWANqgYF1lF3M5/SIR2NlHmUqmrp+4nq8ZdXeWKeSNybh1
         aOTg9Qxfs0ne9yAXl/qH+m3p1D4hFYjYzoiD97LVT1HgUwwhT2ZbOmXA1plRjtFW2SvC
         pj47V+qj+tzKrhN2/Qj29qHI5tRQpU3hCUOD2W7fvPwf1AgeqCmWYUPsCVG2RI3wm4gH
         62pqH0RebS4SrudeMpzikqyofycuthEUFm6ujj+yRTOunkbkZ2c7nAh7w8KWwaZY7Icj
         EdIcjW5ug2xL2xth/yIjpGKc+ueGZJxSGnj++rKI3+CzTMSbJHBI7sf5osdgjQAe9qNb
         VABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8AR0VhDV4OTwQ7mRcydNkMmnlFjeqjkMVYVyByfRmo=;
        fh=PlODhq26P8kDRwZfvfauSlvRouzWMKJ26H8kHtaMoVM=;
        b=PnBtpudr1RH+usnBT3tNfo14dvIEZ36UMjfleqS1gIIA5xzcUwXg8knMQk6erHlcza
         G0U7z2vMt9HNaxZ4Iv/VoBh/plCWML0Pin/8M1+J+4+uEegItDGvWHd6ezlDRSUTCzDY
         +6tOghEEmJPqw4I+p0Hf8zLwTCiLoPBvCTaUSYaooTYLyvJGPLFkC7tD52HAip+nwL/+
         UIixpcB++1stuQzXTTREvCVQ/mv+Oi7JRphFCIGuuQTwyy1UY+2wx5KfDtwl7eonfTLD
         PZQWpuY76cT9HuzpVfG0L5zaDssHnvFtg2u0ga5QrxsswudltK3xQS6vd0c/9BnrKxBB
         yneg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769395217; x=1770000017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8AR0VhDV4OTwQ7mRcydNkMmnlFjeqjkMVYVyByfRmo=;
        b=ItekUBwrDTUiisn5nJTBkWZG60QyHNBSdn8zAGsL2wy2HDNAKv5av8gkvtMyoMHTxj
         7lzE2QD5YycAK/XmipQdbF2T2NLxuPe/02o7M69WxcXBT2oNlvAa7ZfXzfnEZtmecAGf
         N1NMxeLT1X35oQdMyEcBEzH9mXoU6PHQ4kD94QEG/7Jz9UD7MP1FhrMaqjaNqhK/zxBn
         7AGaFtU6gHKU/7cI/tnQdP/CaFaWHFmQ4Yf90vId8tUjmzjGYoTK2Bi3D5f59Famjfz+
         4pFxod+aVGkVxyhXcUXbCVNnFZJZggtLQqBiQKJvFFctXMxBV9Gfwn0AZQOqqOI9Eusd
         SEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769395217; x=1770000017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8AR0VhDV4OTwQ7mRcydNkMmnlFjeqjkMVYVyByfRmo=;
        b=MtaRlaRVbxYNAZbWBUlVgVPqA2URzVJHgDnhUm8NkQ2cNY8SmpYPcj2lWtYuYhIO2+
         9EvrCNG/edRKBqaKQIcZOStgp2R2NN9UVJAmjwITMdd5oB2frxwYWWMJJE7KdfFbpFV1
         4+xui2Im9D2EovBu83wkQ4UUqDj/yElhIPrQ1hwC2Xbr5e4q7d1QtPkN1Ya5IMx2wQb+
         QJmzzf2u9EErsfgurNT8sDf8y+FsgQUrBpSXdslELnPkSi+ci1wMyYGZiXbKQ81CDvD3
         YN0kOrypQPvv+XqnCs+30sfzb8dQFTMVHgSKm/4aJtvzbZguQeELq5VTQeu2gtNZYr4u
         l3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXTbzVUp/KIAnOxTn356XqPQnfNLKflKDaq/ILMQYz2vTeFC33dNU/X6jb74R8xdIjAkow4ItNujzfJiRtgBrcm@lists.infradead.org
X-Gm-Message-State: AOJu0YzIickl0wXrJWkgyd5eOrrmjd61WyVN36bIuDbY7uB0ghc2sL/Y
	mJYCDnZ6Cr+dhDrojcekohgfG09RJ8AbEYTBS1PYbMTvk6rWqYXE1n3gpZEOLUblUSRYHxiOB7N
	hhkeARYAxds+O1WFbc23t905GgJOnGVQ=
X-Gm-Gg: AZuq6aJNbvQ37sEbHzAT/RtLaivuKV1TCR+WHAc6TNrbtlCov25u8/a7tAG7M8mHmk9
	pJKNutEKbnZ5Pn5AvybZ6M6rAOhiAcvJ50L2ag/QID10Ef1sgn+12NZznOOhWfWUD6QQam+c3mp
	0X7UewHW0VC0UmYXU/1ZFYOqs59g1ANQW3CI7WrT8gIf40R1AN2CLNJjMpDbVlOxxQZRPs1F0Wp
	ugs0FR266KMouGqD8W4evef/ALafMzyQz2Y8ZydiG/Iv0MctkZFsy4K2GBO+67Mrw/qbRaQB03R
	OzeevA==
X-Received: by 2002:a17:902:cccd:b0:2a0:c58b:ed6 with SMTP id
 d9443c01a7336-2a8452c26famr35178965ad.29.1769395217493; Sun, 25 Jan 2026
 18:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20260123084844.4051570-1-shengjiu.wang@nxp.com> <86970fc1-c4c7-4a52-91e4-f9f93be5990b@gmail.com>
In-Reply-To: <86970fc1-c4c7-4a52-91e4-f9f93be5990b@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 26 Jan 2026 10:40:05 +0800
X-Gm-Features: AZwV_Qg2Sr0MtAYiWstgnob4vdfKrkQQaosiuPn5-BRgzvr0PJc9FXqje6OXHNQ
Message-ID: <CAA+D8AOHwNPRwdz+M_o14cBgwh1iRfJ6JA4t1yewWSbxdfJhdA@mail.gmail.com>
Subject: Re: [PATCH] bus: imx-aipstz: set default value for opacr registers
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, laurentiu.mihalcea@nxp.com, 
	daniel.baluta@nxp.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_184019_338204_D291040D 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, Jan 23, 2026 at 6:08=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
>
> On 1/23/2026 12:48 AM, Shengjiu Wang wrote:
> > The sdma script app_2_mcu needs the permission to access the peripheral
> > devices, so need to clear the Supervisor Protect bit of SPBA2, otherwis=
e
> > the sdma script can't work.
> >
> > As the imx-aipstz is a common driver for all apis bus, so set default
> > value for all opacr registers, that the peripheral does not require
> > supervisor privilege level for accesses.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
>
>
> Hey SJ,
>
>
> I'd be interested in explaining the situation a bit better in the commit =
message.
>
> The 2 most important pieces of information are, in my opinion:
>
>
> 1) SDMA2 transactions are set to user-mode in your particular case.
>
> 2) Your script doesn't use the peripheral interface (connected directly
>
> to SPBA), which is why the SDMA2-issued transactions are subjected to
>
> AIPSTZ5's security-related checks.

Thanks, will update them to commit message.

best regards
Shengjiu Wang
>
>
> Of course, please feel free to correct me if I got something wrong.
>
>
> Thanks,
>
> Laurentiu
>

