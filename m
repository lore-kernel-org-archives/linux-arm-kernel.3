Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4361ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oik2LsJqVBPuGcGjV5Ma+3vEUKfmkhyynM2jzK69ui0=; b=XWMhArOSqAhOMg7nPwsrqzEhKC
	0qxqJBVLHrnlFYd+DQg98KYlGWU0FbxbT2JwPzB3tWZU5KHjqcF6ZK2SZ0EJ3NCFTir443ZLsTOPj
	B2+9u+QExZyojm8rzRZ9DPoexwiiBAttiZo1b1z2EmVcVSr/ysqWxQEMPfddDMjiRLqr4TR/elO2W
	IHqhCW9eiFsg8aNNbbjBZ07qn9bFn5OnufVh4xR4hny40FXKP2POZ8nafPiRntYmRvgvnEDH26IM+
	H4G3FxtmuIoofH0Rtj2kYAtVTSIb/FF4wNOuRTIebv47HZQdYRCfgSC8O2mjb4EEVag9GILXoPSYz
	QFWgDggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnci-00000001Rdh-3uql;
	Tue, 26 May 2026 08:58:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRncg-00000001Rd8-0lHx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:58:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4905529b933so19949395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779785928; x=1780390728; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oik2LsJqVBPuGcGjV5Ma+3vEUKfmkhyynM2jzK69ui0=;
        b=plDQVGHI+5KBKifOnLSsUzU70ZuD7/zeCOUqhc70sJO8lZTFd2dxNXmsi3T9tg8t5q
         KeTP7pkvQSGNo9Cmcy06B6EG/HppMOvQ0TRudXpK8W5jBSbx/lHtlTPKME63LxaDLBd3
         /RVub4g8F/YkRCP50sHBqTKVkdgWoIu0+DgslWJJxsUPqMsyvHxP0GGzF0wAK70daLj2
         1r8kYaKYR3ppWcVhiD3mwpyVQ7RIy7HzEUzxgoXd0Z5IItprxZ9PLto5LgCSMA+/rHKJ
         vfBV8ODoSaURK04vqVfcr3DGkvJ+EmXcdQWf4TZnkBYkkKf/I3SPDEm3NL8fVwQpkNU+
         FC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785928; x=1780390728;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oik2LsJqVBPuGcGjV5Ma+3vEUKfmkhyynM2jzK69ui0=;
        b=cL2YofdSK9S/eMXb9hUPp73IMBLZNmF4mLB+GE+/ryRtPuBquOqojwdHMVjARdrNLg
         hgFWbU5YleAKnMpZ624ZiQPo+XikeaLezHf27wPdVsVkYRyFJj/cq5iVXozmfp/19Tb0
         oTNq80OclXsXVCXXW/Yw36kGEuQFpD7q5WoZLNiL6zqVdIgKGhv9m4lboIPdknADJd2x
         8py0Gm9Ue8btPEpcAi/yVBjnGkfntXId/Qd83DhqB9r1Zol5cRrqAiqZvkRdsWslFCPq
         leggd251bTh6eCfiP4YLb2Db+QDoJAE0EIXBX8/lUN5xMvf8FdvPTvRWCh0zIvC4aydG
         WMSQ==
X-Gm-Message-State: AOJu0Ywg5fGrTY6UQzChUiiwUpI/SZ4XXJAca3yzr42PGAhEy9blYYaH
	xm2xdHvKnOcEQi3H3xWWfMREovrn28EGDyOoOZK3Ql6CYBSLoRAX1Y3h7zChPeJ9
X-Gm-Gg: Acq92OE+kcAoWpVdGTmHCda2hnGciPik+VQOFvyOystE9Z5X0UUHG/jMB43RPvWna5E
	W3GtitXUcosN0qH5ZSs0eK6GpFKzs6BndChoGqomBhf4eGINiXvopQx5TtKCZpHvZsnMfNqOaaz
	+93Axw2+7lGMl5QbiTCYHSSM+3UZqzKaRivbv1mL94eEYafOTTjd476irvck3GFAUUzTchWAaKM
	eVLB6NJhfG8JbiUMyFuRfFgxfMVh3zE+Bh0RIotNaiSlhxLmLwb/Z5RVdIiq/wZXhNeQvUxcK9e
	5ROlNspFhfQVd3M1ZCgADfZjh+Qnfgf74yGa5LtZYUdy82e6iUuIZgCt7/TU5M3J1YQE/7yuIho
	WVcoidDCTKjdBEgslIgOrUhIuUsyXFeDV8NoDrRwlPsFWvX6QtISpoNbEKwes2O/OFzvVM18O67
	TFRV91hOmWTitrcciHXI0fikW/JQ+fJcn8PVQ=
X-Received: by 2002:a05:600c:5254:b0:490:484b:bf41 with SMTP id 5b1f17b1804b1-490484bbf7amr281384845e9.6.1779785927558;
        Tue, 26 May 2026 01:58:47 -0700 (PDT)
Received: from strix.localnet ([197.250.51.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm160876075e9.1.2026.05.26.01.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:58:46 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Tue, 26 May 2026 11:58:35 +0300
Message-ID: <12903636.O9o76ZdvQC@strix>
In-Reply-To: <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
References: <20260521191458.177046-1-rdunlap@infradead.org> <6270885.lOV4Wx5bFT@strix>
 <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5999182.DvuYhMxLoT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_015850_265061_246ED609 
X-CRM114-Status: GOOD (  11.17  )
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

--nextPart5999182.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Tue, 26 May 2026 11:58:35 +0300
Message-ID: <12903636.O9o76ZdvQC@strix>
In-Reply-To: <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
MIME-Version: 1.0

Am Samstag, 23. Mai 2026, 00:20:35 Ostafrikanische Zeit schrieb Randy Dunla=
p:

> The same way that this commit was merged:
> commit 220ae5d36dba
> Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> Date:   Tue Jan 27 20:52:08 2026 +0300
>     ARM: zte: Add zx297520v3 platform support
>=20
> I guess to the soc list.

I sent it to the SoC list with my SoB: https://lore.kernel.org/soc/
1991560.tdWV9SEqCh@strix/T/#u . I hope that's what you had in mind.

Cheers,
Stefan

--nextPart5999182.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoVYLsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiW5wQALE6jwe7vYvUC+gtdqXV
k7xUCRl0FvEBUWoV+SL78Qil7kXSzKQXJEiX+Riu03dVbr0t74HRLZyhFxHalg7T
kRyBtwAeQb7S/RJJo78U4y/qmmaKHx5meRgI/skxVie8JC/rzsW1VbmB/59ziB8c
pXm9jwwGF61sm5ZZS3FafG/RXJWIdpDXd9qk/ZUBGOv3XcYcU07Jc/DGku4Q/o4g
bQGpgxq4plYK4RB7JE15jrNBUr7UUKAQilCG7WScXReDku4HApsF5NY2riEW/5PK
OnIhZXc4HT3xl6V2zOAxOhyB3AGACNH9yeottg4xQrW3f4jUsQjtz/1o2hRmCOGS
0QOqcN/vZVhJOANDNb7OAJGd0aK5XC74Rz591jx3ohzlRmDy/h6Pv7NiOlumzEyG
+cjwHdKD1qvSipO5x34gqClfvWUTHX5v/kgxHhRaSKAq8y8+FKUb4AlrIzPG8JAf
n248mSk5JxB4zG46yqlYB0E18bPI+0Sc71c4hsQYQUC+7PExJ8MEs6pgQlGZBAyU
aEw2m3S9MH2QW6fqVHijWiBtC4xdEpvvGAy/uaSQ6Oh07Ov0zUubAS/ATAuORWaD
ewlBYuLMOfZsg+sQD+Hga31dwXQ2wGRdRupCcl4OuF5BmdtXbx98cgJ8MadSPf2F
Kblk2tTWqqVq1SMhZc6MF3fv
=9qjW
-----END PGP SIGNATURE-----

--nextPart5999182.DvuYhMxLoT--




