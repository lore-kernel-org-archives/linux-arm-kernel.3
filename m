Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC239C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 03:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=; b=Xi7naYoZsyzrT1JEi3clDeRCeN
	kVJbeTyuSMurgC9NPxWnpCpKb2ODIv/1OVavzjitqzuBqBC+/t3N2YraX/ArgmUmpqhnVpWLROG2A
	KMMRmVhe1roBJBRrN3YXy2QiJrzGDkLGzPT3Adq4ivzxCbDqZc6hLuHKxwbDAtuLfJcoXSY4qR8Il
	zrxOE/ktsNEnFj4X8mL54RSf85Uwo9qYCiwdEZwaE21iTxo69zNg1sQKunEhpALD/0t61+aryUwuP
	NdwqqOQVGALruzGYxGTOuIKUeFMVg7TSmkHCwTqPaHb66S1Wvn0J+RDpu1tLaBDxOH2DFO1bpK9I7
	Wo9DVASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KLK-00000000uMj-1BZL;
	Fri, 04 Sep 2026 03:11:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KLG-00000000uMM-432N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 03:11:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d01663d816so4041995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 20:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788491510; cv=none;
        d=google.com; s=arc-20260327;
        b=SfC2PlERtYjlTROgXuvZ0b6sSej3bOYQ0cmv+cr9E+9uuGKOrg0x9MeqDoYaoXnkB7
         gaxS9/K+fmQVdOEZPROz/qfThjCDqzRgK5fldYnml+GonOWSBL4QIBJ4QyJwVZHyH3sg
         IjwNry7mKeJOs9cifFRsZOYKjQngIKUvpq8wlhCkoiZxWwL1uysDVulDtGsmHYDQhNmf
         tJHJcFVdiXRWvQJYahbYBUmjx0x4GvtpAkEWlKRzy6EEgBAlg+rZPd5Q7XIIpw9PIRtw
         tADU9lcizBQSgmTntTM9JVbfKkDXbxm6jQ+RHo9/6+UYnhQ+lITKw2yYfSkX2N2tkOKU
         fiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        fh=ev4zJhFDPlBQjsGSTwFPMiPVG+d4An3UImedFB9pdPY=;
        b=b2b/dyC6o9vjYCYqqwSYGV53aZktYKAC2PCgOabEvVFktOqvIhg6IgZs1eKLigcv/D
         zegxCqzA9INMLrBShVtW2XoQIbMqMhTdtM7M0Ozl5lzYJkdyS78LUiD2mgAift5q9Vbk
         KP8TcknvLrJJv611iUyKJr9xydEmF4/mjHr/yJXBEI8E8Q59RurzKxSOyvBKy5khz1Kq
         zX/ed4OZCZLq6C7kaBXjwVOmjlj9s6sSVEUa8u5jlwbOfGFCI1DgOwQhV525JORw5ZLR
         usvdMntDpeUOZyB/RVIoPH2WN89clhZbGuCHYZeD6iI8tdQB7Fng2cW/e0/+hunjKH0A
         1cOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788491510; x=1789096310; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=pUg6YwSkVyhkpr8W/ol9F74ai+0b3suaF1kPH5aHqMzFSSxF0YcfE6eidvn5FLtTkk
         j14c4IZQJPYmdkdsexvxJuULSuXCI4mmuUiVN/GJ3ORpekowQnCUir/ronouPnHBUa0M
         HgxoJHJH9ZHNhpB9Ps9uyx8C3BGa/2oB3nYDftfEM6Sqwyd2pR+Ut4wZOQT//FTpIz0G
         /Eo4dSmu6Er4Kaxe+f5UZdLAlxTtNncSBGBj4L3K3OKNOSTBofEr9zy2hJ7zYLM7WYjl
         6JAW+Igt4pKKwaTqnRk84XD0hz0hxBVMIYCGYr0ofjhBVGNBnG5bYBeO6XvX2hrrimrT
         JKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491510; x=1789096310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=MQ/zb8QbhQgqYPGT/UVc8gXZGn6TYYFOewM2nQuVZlBrnozjwasbuh6anulmDimE+A
         pXtJ2g0MBA8Kmn+kPdPRAUiYryLqiWylO098w9YqHFd/fNuOSzLIdE+MpEqvEm5XVifE
         CfQokKq3RyEtL3gpFNyUZKmEE24ekcoXyEELOdh7wobpofaWMPil5QIFluCeu+UIdbA1
         XYxkqCPbaLg4liSirzis9jhImC6QeRh0TNDw7aW4f6RH6MxlAY8kLx8AF9XbKkN7CDRQ
         b8/cIudVl02OKJPXy/NLNcZXlRQUMtY+vbwj/S/KibDGW/CNlx00QD+/VtVg/EjzM+93
         d8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxsglUK43dSFnGCLzxp09xHyQ5DrWV514pypCzxj+hw/a+eifO6iBCaXcXMNmzIB15lRwwe4QSOdMIzrZzGkrnc@lists.infradead.org
X-Gm-Message-State: AFuF++m93gmnpb7UFSRJjTmLC4NDAHQsC4ppd0HYka+NZnV5jtTGWG85
	5l6+lst1QRKsHV8sAdTZ6udYKqHhlsM7Y1l8gmy/V7pyLjDw/qtaIpgjxlB3Os+zJnWosQyigkU
	9uTHbOPbBtpjpjqt0AM9eMJSPRS7pYjo=
X-Gm-Gg: AYBFou1Dg1JVK3A8FwIXAKC0BA4AyTz6ujR1DsCUfPW6wmczXgtLtyr1/GOgLj4avPN
	oNbhfYA47dhs+hUw2zkOTblKp1eAGFt9wzhrpBcVUc0GIaCO3ZChnni5ESCPdvRhSgXNgX45td1
	xqs4oscgZvkCAOgRqJIZCB9KIJ9ygITQsAOsfN3bLscpnCrdkF8B5Jr04wvGwuPDobYCIEfsFzo
	oCD7g7PoMxFjtHkPg8RxrYMWG+lRIj58c6MaKmGOu8qorWPNyUUd3iythmA1Dc3fv9t1oNwTLCL
	0ep8PA4kCFg4ZKfbOWWB52xEZ0XIM1+Okhv4YNGDe4kS
X-Received: by 2002:a17:903:1acf:b0:2d8:da29:da41 with SMTP id
 d9443c01a7336-2db127509bemr55944165ad.15.1788491509602; Thu, 03 Sep 2026
 20:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
 <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
In-Reply-To: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 4 Sep 2026 11:11:35 +0800
X-Gm-Features: AcwNN1VSQJhguJNnq06i_90XVuMC-oTCxeandMzLTYM0L_HXyiYFRb-mCLJw1rE
Message-ID: <CAA+D8AN=ZSPDK0HahaD_Ki9=RSfofpTbphFz_eestpZvmFpYfA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_201151_009032_7E59149F 
X-CRM114-Status: GOOD (  12.17  )
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

On Fri, Aug 14, 2026 at 3:41=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wro=
te:
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >
> > Each one or only the newest? You will be getting the same questions.
>
> Each one.
>
Should I refine the commit message with a new version?

Best regards
Shengjiu Wang

