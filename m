Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A521D46BF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWXVTrWWSL0uRDUDAgPurGbnp5Ffp2t05SD0ZhbJZ+8=; b=1yhT41AAFBdAYvqqBh2QUCaviY
	T7+wlewBr+n1vm+5SDoDINrWMwDqxKgkI37kluMvrfLR1fBEcCvzT5f4hFDw2Qt8Y/hHOSxgmbFdl
	xLAUR1TSo5+fetIdJeovf9GldgyHxzec/vMK8gKi8Y63ImF+X3vWmwxHtEPuZfQJuWXJB58Zuxxu8
	hZtH/79yKPMFB4Z9ka3Oi7jG8jzn6tuM3yPA7+6qSnHo7zoiQOEDMLlFoT5kOJzq73eQlq1NzBNZv
	snvU6heYiAFgTZGcbBw1gD9zsrbd8Tqh7eoTuznIZrrIRvypNrC9hfScA5vTugbvVtvan7Dyb+aHO
	Qoh0mW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBfC-0000000Ghca-0cMH;
	Wed, 28 Jan 2026 19:57:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBf9-0000000Ghbr-00eP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 19:57:16 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-435a517be33so207533f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769630233; x=1770235033; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QWXVTrWWSL0uRDUDAgPurGbnp5Ffp2t05SD0ZhbJZ+8=;
        b=OmzgUNspL0u2SCevreJhOrrP3vmDPkyOFisBLDVSE3+DDj5A/K3NoJIw2qhfjAeoye
         lt01VKcq1HD9LNUxBd6AlyIjSFxmj5gnP71C5Q/riwXzGZdjjvM7efamkHx5Kz+DUyfC
         lPF5AN7zNZKYwgIQ6pDjDVJ01xE4ezmYlOJguMcDN5EbnNNdQP5CsMsdPuOcuPniBJHv
         rHBfSo2chHemW6Ua12Vc4fN507RVzSoGu2vo7mod9eTebYj9Wr3M0X0ITB2cWOD6a3bz
         84Cpv9quaxWJph0JP9IY09MDbBNZ71p1+X3rbaeYDhgZq1AAGoH/G2k9XOP7Dusc95EE
         YsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769630233; x=1770235033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWXVTrWWSL0uRDUDAgPurGbnp5Ffp2t05SD0ZhbJZ+8=;
        b=i3bU9r9+QKYaACq4r0qQrK7pazAMJ90NMeXqw00BolTK6oGKk9+LwIR4D74GGHLuRg
         c9tKWOEURhaZUn2hh963GZqmzdH/HOHhtA9eZ6FMeUhBVWcgBlM/kcH7roogu4eRmSQN
         Qyl9hweCOgCjwzIAblQoWcZbM8UxPM3JhG3tWaYtz+VfpX+6KJMVOGbq2whQ9LI0cvJT
         qgc4KubkK/PQZIexu42yswRKE1rdJ1xXfB7iMtpRaShGW5GUoqZKrp9QhhQN0Iq2VOGl
         lYByklCfaZEZV7JlJsSw/Fi0npq0kdNBPUgYbFuia02oUv6vV9sKey5WNbQBuUrb8Rde
         +gEg==
X-Forwarded-Encrypted: i=1; AJvYcCUh6N8t6dWor50Gb1lqutHOOSC4BSnZX7LUVxaflvrpLet0rnYlGWVxYXtUFKj6BcUgyihdn1v6ea7dSAR/NX+x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5mrauTRDlSkGZznD6+xgkrw9EcciGnKIpeL/sNjK5rLWlevUe
	JwyUQ5XEv3Yuenu+LHtbOi20ydxJNtjz70xrtol9LUrDiMga8B6HOt+oD6QdxKM/b/g=
X-Gm-Gg: AZuq6aJJkTYAhsbyr8T8QS6173IS7xo0P+SkJihIiIguImCD1QxeBUs1+lae0QCitNR
	HrsJdZllUdWDx1Fs3dT59lDK9Yaq96lYCn70GGNn686Bdn52o+stEeTefiQO57tGb/tS2G5bn2W
	XldkqaYC8LtQqTz6ztgN2pt7BfWDmATOf12HauKYRm2zRwVtROE/ZABA6nVAfCtCRFapazwA/cS
	/5joiWRld3c1mYJOE2SsQHw5WwpaVAgc4da9H/lxVqMl5gwOrPv95RZ199vvpAqHTZl930i4fRy
	STK2wKLXNjyimid8fGV2bfpeqXVD4bse8Q6JWWIhJ5O4L0uYgUFALbxFS6H9fts4vFGCNKbMzVP
	EGOHjxFurkridP2Xmuw7ni3FfaUnq+lbEwnhAI0GmQBDdWCCuxjKSy7XXzZYv/eWGKKAys+K40X
	f2df4Pn5RjN0qk/3emlSRCBYI=
X-Received: by 2002:a05:600c:6995:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-48069c92c03mr92248975e9.31.1769630233039;
        Wed, 28 Jan 2026 11:57:13 -0800 (PST)
Received: from [192.168.235.30] ([80.233.74.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm149805675e9.13.2026.01.28.11.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 11:57:12 -0800 (PST)
Message-ID: <f13cf27da2d1d7d8a54448391c16a8eae349e8a5.camel@linaro.org>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty	
 <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot	 <lkp@intel.com>
Date: Wed, 28 Jan 2026 19:57:09 +0000
In-Reply-To: <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
	 <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
	 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
	 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
	 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
	 <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
	 <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_115715_081944_EDBADA00 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

Hi Roy,

On Mon, 2026-01-26 at 18:34 -0800, Roy Luo wrote:
> the wrong example. Let's look at this build error scenario with
> "depends on TYPEC || COMPILE_TEST":
> Given COMPILE_TEST=3Dy and CONFIG_TYPEC=3Dm, the
> "depends on" would be evaluated as max(y,m) =3D y.
> Hence, CONFIG_PHY_GOOGLE_USB is allowed to be
> set to y, m or n. When it's set to y, the exact build error
> would be introduced. I also tested this locally and saw
> the build error.

Thanks for trying Roy. In that case, it should be written as

depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)


Cheers,
Andre'

