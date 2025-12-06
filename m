Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7408BD3ABE0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 02:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUQybTF2z+MPRFgkFkdOwliSQw/1N7rvnbrbXmVsRSE=; b=ygqHIcP4NaLRLuCu6IIHqEJ9lj
	QqFNolB9A/iy89jNAsDYyd6q+Q2rIaa65FWR4HDiiafg1JcdQf7KtwAdlteBJVtiU/fYnQXWXmCcT
	hIIHcK7z9q3XFGfZOLs49KUpzZ96stepyWFHG+AyGA8+3bpLjkb//Fa8RWetjPqyFjXlF61/gR5Rl
	6DtjyJwBgvFTs3N7EKAvsNel1zyKdguyAEwtCG7yX986YulV+B33aNDPGCbD0+Jljl5fD3/Gtv6LG
	iiNwmh2dDk9+L1MnnWFsu1yetSowRPjSuiXwId8ajRqfvOjBzSkWqxpsYGG/B9iWzUFHeOAiRCztU
	H0PbN64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRiIS-0000000AVMN-2Z5T;
	Sat, 06 Dec 2025 02:45:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRiIQ-0000000AVMC-42gc
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 02:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RUQybTF2z+MPRFgkFkdOwliSQw/1N7rvnbrbXmVsRSE=; b=ZmPU0qUjHcoZQRjKCtAlWdhBrK
	wuHFfPjpKytQDMiSFZv946DNVKiGiX8YZqVi83VEL8c6iydrB5jwjwulDt/WrvwRRHJEfxLK6hz7I
	AjkgaDNeRygfI3zYvoGu8VttyqCluk5jvVjZyklXVTQj9UCLSEtCx86WyZpPKNNm/17ERfS0hYQ8l
	UqKTqXtOdiJNX0gsKcEv7uOIJc372YTp9kVkGtUyTd2GGl5DNLq+ttBA1tqmUc6L4+PpCOhyRCy9n
	mu6Y+tkVar+uHVeqvdrFHmI91TjZ9pnZ/Tl0rUhGG0ZjfefJFFGfwUmciEQj/GuqjezR7uRhoY6lx
	RLhEiUjg==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhQl-00000007FnB-3yt8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 01:49:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2981f9ce15cso36898715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 18:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764989109; x=1765593909; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUQybTF2z+MPRFgkFkdOwliSQw/1N7rvnbrbXmVsRSE=;
        b=muaxVTNWh2PvvcaBHYwm9iX944bUm9mf/j8dGLyBMuEufsDRIVurYRVigDBOHS0amo
         45HMJDMuU+tk8GLTS3lXxX6YscpceWoEh9Fs8ocOHCdThJWrqHVTiFmWcXobPTaXeRdm
         AOM57vjOzXz2jjC9YghjucrBLiPy4TPyt7Bf6pEMFK1ONUclrjRGLVdQh/PjlC1h9pr8
         +4V8EXz3frUzkgtVB3dhnCnPRWleVyaMHMrzANKpySv0HyeDkGUU3odwsJEhYzuZEm1E
         yhX9mZ3VIpWNvn5sA/ICk/tjF3XdapsJm7Fql7DkD7aAOCMOX5u8yHygsx+doTHm6FrO
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764989109; x=1765593909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUQybTF2z+MPRFgkFkdOwliSQw/1N7rvnbrbXmVsRSE=;
        b=gmxlwxtmjwlFHhwE/IexR+DX4eUHTfT1p0osqcBGv8GjRO14bBRGQOPJr7WiMdUR35
         wWPWiG26wD78tt1p3FSQZQIiC1C0iK3XUWuMB2yq6RLHC/xTwEDQVKN8/baIZs0hwgE+
         WD+aThwyWAq2hi3Yx2fCTOlOAwBN68gOQ7jhMUwhctsi5FqCJXwwKn8k/IiAQVUWWD5P
         GV26yXlCEKAXdsK2QX82JILK2x47jpXj9qMowKlb7nLIRqKarsFEYU92kEv9fU+2o1w8
         gJEzg062rF+RH21fOGdjPky7vDZObEoD41DjaN4AsFZgs/zQ60XkMMv5ig+w1bbBtc84
         MMjA==
X-Forwarded-Encrypted: i=1; AJvYcCV4gyrp/ibQkS6GigJpBOpW97NNvKfY/Pb1fkvL09f3F6hZPDb8bFKBD/AMIy57t1NhhC5Jaljf9v3Ruq7reqpt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4vI+AWnHwenyrzkxzGqBoHEoAM7Hs07vz14rU2OFALGQt+hG/
	MFB919mdrTJj6lE3alPR2mzQpapbgAFoKVsLLwBTqQieQN8+SCJ5rvsw1VYz5bUFTj3CKYJ2Wnk
	RNIlfLEJ0/PGsU48lopV5MsbDFo3DnXuyHps8Qcie
X-Gm-Gg: ASbGncvzjSqJ5UsXcF6Kk28qIzw9ro6GDmoSn2XwL+HoR2fSKv9jnSwectOcyRhDPUU
	p2jFZPTL9n4H5hiKwa+csw+36fH3Rt5xnlkMr88guB/3YWe0K0RIEDF00eNU9ITqstk6kzbCkHd
	I6XiOSgJa+pa1ikE+aQlMdDrvMPq7rKK1D3EWwejC4HZS8tfo22QRt+RFUObXeuDIgduV5CfcsH
	Sjre8t4UogIoDvJJOwyLSNLVIGVVPwaF9JwSd5Rx8407Q93vht3ZdJMson2F184a1Ro0z6PBa3h
	iPArsqjEc4c2rDG6uT8GkUY3Ji4=
X-Google-Smtp-Source: AGHT+IFU1KYTSeq6FW6nQIMrzlj0NO5UvinjpD1M87pOOtWRqM4PAgvMxx7JqBY6yKTUwKBkDJhMObt3hsS9FZVHukg=
X-Received: by 2002:a05:7022:f415:b0:11b:9386:a3cd with SMTP id
 a92af1059eb24-11e032ed8fcmr1007941c88.46.1764989108309; Fri, 05 Dec 2025
 18:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org> <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
 <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org> <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
 <988b3fcb-44db-45ca-823b-5ab13206bd04@kernel.org> <CA+zupgzi55svWK4gHsFtdQSD9jFKbxHx_0GE2R1R5DafmYyGNA@mail.gmail.com>
In-Reply-To: <CA+zupgzi55svWK4gHsFtdQSD9jFKbxHx_0GE2R1R5DafmYyGNA@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 18:44:31 -0800
X-Gm-Features: AWmQ_bmtS6VqNvSPWWqMA48yCBiebLPdL-OG-iJ2CapE017dl4OEKL60P358vSw
Message-ID: <CA+zupgy5TKWiVGwt5dFye7ztk7O_n7JQm4j7H8BCC2gzjfkgqw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_014956_683777_B133359C 
X-CRM114-Status: GOOD (  16.85  )
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

On Fri, Dec 5, 2025 at 12:18=E2=80=AFPM Roy Luo <royluo@google.com> wrote:
>
> On Fri, Dec 5, 2025 at 11:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > I assume you understood what should be done instead in this patchset.
> > Anyway, my previous tag applies if there were no bindings changes, but =
I
> > wasted too much time here to care anymore. The expectation from big
> > companies is they do not ask community to coach on basic submission
> > process. It's quite unfair to my spare, personal time after work,
> > considering how much big company is making. Big company should invest i=
n
> > this coaching.
> >
> >
> > Best regards,
> > Krzysztof
>
> Thank you for the feedback. I understand your frustration, and I
> apologize for taking up your time. I will be sure to be more thorough
> in the future.
>
> Thanks,
> Roy Luo

To confirm my takeaway: for this patch, the changes I introduced
were not significant enough to remove your 'Reviewed-by' tag,
and I should have kept it. Moving forward, I will calibrate my
criteria for what changes are considered 'significant' (essentially
any changes to binding), and more importantly, always document
the rationale for dropping or keeping tags in the changelog when
I make non-trivial changes to patches.

I plan to send a new version for this patchset and the controller
patchset [1] next week with your tag re-added, please let me
know if you disagree.

[1] https://lore.kernel.org/linux-usb/20251205-controller-v9-0-9f158b18f979=
@google.com

Thanks,
Roy Luo

