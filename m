Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E36CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6i1w8FUVeMItLfoBEsQ1m6McI0ZsDh5XdVy3i6eNKsY=; b=VfgMbeZHQ7UQjxiV5AFH/FfVSl
	Ykgu4HI90zfEam78STc9Dxki41s6D+3E6ttY6eE2BYmiFQep5cLIduN5/6nJ3c48kHUBa4x9eOyHP
	k2WX1gH5VcIGYpd7selF9dq6IYvqOYTHqy8NFS7OTrOb9x77yoMgLt6qVkdcc+7hVs17bsMb5IAZ9
	TIIpj884V5w4ugof78NgXbg+VVBVbV/kp0/Enk6Kp1TQyTM2fLJHMWAqTD0VN39+5qlazZgEyHRgS
	fjTYukq6CNGobMcKeXKdwerR4I/CSQhiyA9L7Q9MjzlIbGzb9GQTpjg6QZgw9VzgvO7JxrmWUP+WU
	Nei7sXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgDZ-00000001g9h-0DdS;
	Wed, 06 May 2026 17:39:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgDT-00000001g8g-0KzQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 17:39:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso57833975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778089160; x=1778693960; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6i1w8FUVeMItLfoBEsQ1m6McI0ZsDh5XdVy3i6eNKsY=;
        b=DVMr+L9OC1KLO5AGfoLBuAydxMANEHaTT2oWX+oiYxxDWZPazjNg/dZf7At7pelvWS
         rqmhIx8Ejvv740kwXQsp1V9D38xwJcN8hzCVzjsEyfyfh3S3o+Q4tx8TVLV7eAX9JCs0
         PbmZ4zgStFXwgiw7bM3d4QddqNW+i4irnte6j+DV1/FrwquyvFRdEsD+pOGpq98UiVAo
         p97qpZajls4igWeqX88Bgd6p5DB8rOlUan+zD8YhWxbN6Iqn0srlxyY/GvMp4vcnjbBT
         4gTeAPCNnvnxaQ1fmz9MEWQQcauSR6Rr843MTjITRP+iPG4WAVhg08Y0r8809FzrzHd9
         CZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778089160; x=1778693960;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6i1w8FUVeMItLfoBEsQ1m6McI0ZsDh5XdVy3i6eNKsY=;
        b=dDHUtpe6szyOcjEWJSel30U2umOQgl83fKquXMwIfPZZ/rUxFZKQGEFIJQOViuca2I
         MhJuUBMqTWcjnsIRcB8pjfzM2mStFyw2DWEaXFSIOKty/NjBX9OzGnFJEfgSvLRKlRp/
         6q6UzDwE2iYlJby41VH52C7Ikyj9o8lh2UZzV1GGWfIFqDOMqlfoF4bRqqCd50gRv9pj
         xJhuAmGP8ycldm4Rs7d3BwdnjXDWEkF5Ez1KIzi6V3TY1P7t5+IL/JVkBI3wa297nogT
         r5sGRygwx07GmMyeiDVRYJ68r9jAOevhXn2Mtw7RBfiEi/5UfXAuPKyTfcZJLNa7qm0f
         6jug==
X-Forwarded-Encrypted: i=1; AFNElJ8cVxa9M7C3Q+eS5JqWRyha3IBa3TmvpMdq3qVEGIj4qFmpPifv8g2NYHCd7CGeM2FIpSVczBZYckYpv6aBk9pK@lists.infradead.org
X-Gm-Message-State: AOJu0YxiacAu8SHYJmDsdb6ItSZwEMrzHi7rZxufPfNR2G2P/iUG7egJ
	+tc6scQ0K/QUHEFIkb3excSmtM5KfxfEvMNO2kRTMJm+BsMDY6Qwxqji
X-Gm-Gg: AeBDievszeh1ih8b/BSm5LJuE2Pazt7g47cMxJaOe2fgoJ4fGMR568W9gozf4ExcP2X
	fBgQFm4vgooaeVsvDunQG2qOClTEHvylIwlqZ71tye6DhrxrNlaq5mFi8UMOF4MfyOIHU4hQd8Z
	gb6MBz8kj12GNkZ42bBVRpCKRIjAc5XoeiZyuqZGovO1LxCMJqXjljCH4GPZ8dAw5sJ5YKzj0At
	51rouyRw2EduLjgTAEbetPIuRTN+ZdXDCGyCTIOWVocv3TfqOh5WxaFw8LmHLG15c0OIwUsEGMZ
	Kup2E03LbdiCvwTzrXun0UCSRhlSrxiw9BRCWUAb/DEgcPGiecMPvqzselmCcmDG5NoLt5g8VSQ
	HbQW9qPOD/I/WyOaAUIxECKKwu3clkpuizxSV9xhKxfYZdIjK0TvBhh7K8f9X41gzkALW516dQH
	nv4KmA0My295FphVNVnWyAm9svb901w94zpetZ9RrUf0F9eo2s+9GU
X-Received: by 2002:a05:600c:2e0c:b0:48e:526e:1011 with SMTP id 5b1f17b1804b1-48e526e106bmr38312325e9.25.1778089160201;
        Wed, 06 May 2026 10:39:20 -0700 (PDT)
Received: from strix.localnet ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53116a9fsm31957135e9.8.2026.05.06.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:39:19 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
Date: Wed, 06 May 2026 20:39:02 +0300
Message-ID: <5379905.31r3eYUQgx@strix>
In-Reply-To: <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
 <20260429-send-v7-6-b432e00d2db8@gmail.com>
 <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5014054.LvFx2qVVIh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_103923_172834_7657CE9F 
X-CRM114-Status: GOOD (  14.59  )
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

--nextPart5014054.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Date: Wed, 06 May 2026 20:39:02 +0300
Message-ID: <5379905.31r3eYUQgx@strix>
MIME-Version: 1.0

Hi,

Am Dienstag, 5. Mai 2026, 12:54:29 Ostafrikanische Zeit schrieb Linus Walle=
ij:
> On Wed, Apr 29, 2026 at 9:14=E2=80=AFPM Stefan D=C3=B6singer
> I'm in favor of this, mainly because multi_v7 is pretty useless
> for this board, it is absolutely too big to boot on the machine,
> the board is odd and need some ARM64 stuff.

I added it more out of cluenessness, thought that every board should have a=
=20
defconfig and Sashiko let me know that multi_v7 is the preferred. But I lik=
e=20
your reasoning. I'll send a v8 with some of Sashiko's (very impressive)=20
findings but keep the defconfig.

> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for the reviews as always, and thanks to Krzysztof for the yeoman's=
=20
work of guiding noobs over and over again!

--nextPart5014054.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmn7fLYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiGRcP/ihTsoTIIoe31SesPPm7
q97WA2l0QuRdt6uaaVSwsjuCxhCKwuVvPOYPsy5+/F0BG9UxylI20cKySsfndZyc
kMG7hIOD2GgP2oFpXvD9Rm6mABU/01SRMgYxJ8BERldruK2XBi/tTl5z9mLCU9Gv
6hHKRVkiS28GG08oKXywoEXba+Dt5a4HLk6oVy1UgP9OlImj1Bm+KPD3wvWmlRsL
fYr2suEdrJ76ox0Mx0kHIrwqhGpDEOAwm3g5pjmNOEcXS1eVXW1QLSg83wN2KOty
3NWXcwr0KxZjxMc6zkq2jqMZmx/4d7Mdijbs/TInuprU1G9mUcyVvi6BHFYS5Hpz
2ezEEESl6nIbaMpA9zFZWHkhouqr2bOVH12W0Exkml/rhwIQBRv3S53wAeYeR3Mv
H1LNEaKdJgZWKKL5f9WC9q4QFQ7CKJQZc+jnArsKp9GkdC1uRLWzLP3eriuRsgbf
zAOrJSziqrze8Dq2VNH9OpqyNk0W92TO4mmUMNrsqpTMh3dDMM8MiM4VJcLIhb/J
xUUZ4kRf2lHfx/KAJnn9munL1lsJa/k1zBVxarYe1ASh9ivRxqyojTcy0AIPklbQ
eaQp/Vj1+rGq43J9RuCxFzqT22DpbK9xsmEcxNaCzW+ECpBXRqhclbKHHYESo/aF
+r9T9FDiyUEQwbmVCzN6OIBc
=eicH
-----END PGP SIGNATURE-----

--nextPart5014054.LvFx2qVVIh--




