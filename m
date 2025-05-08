Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3AAC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcGj8gNNSMQUWiWl/+PK8QIb2S0v9+n3c03DjBprxJU=; b=ul4w7nAXp8/P2Vs5Fa8Qja9aHp
	C+r6Ujhtyd6w0dS9QaV2oxBIjcNMZoHws5Kgc0pnLEtvylAGc3Da7tbkrqjEgNrEwZIXsLaUxzlof
	Du/jMloxPX8R6P951zhKLEmGAB4dBFIOpUFeGWhY8aIbX93gbAIqzIxNL1t7MmFjTZc9VMvz1lZF8
	Z7Pko/eLfWMZbZ3/H1hidWrA+YpEIdvik4u7oChTg3Odb90ca47ibnqoh+Jw+iVTA//3dR021XwZZ
	MmxZQhKJMXSjAw9+4qD0IiH87AsGe91xhfxuvCCJA9ca7C5W8F7thkJz2LAhOcg32t/Z0iljUbiKQ
	y2lF0Z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCw2D-000000002bn-2Xdt;
	Thu, 08 May 2025 07:51:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvxO-000000002Ha-0pmk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:46:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so521032f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746690372; x=1747295172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcGj8gNNSMQUWiWl/+PK8QIb2S0v9+n3c03DjBprxJU=;
        b=GRaNyoEY85YFaZ7VsClgvwHRjWk6UJHdhZ5AeyCi1yUR2mIhumSHc7ZTt5GnrIsiNs
         +xG/2WlQcx03pfPWbRopZRPHQudiyzKn2CU7Q5xqP7gari1z/0xcLpduXe5N9pRrYozH
         fzE0giuc0+UjG/QtBq+j2jkAtXstx1X74HfvwbUZOek0gze6JaRDEGVL+fbDBjn3KzT9
         2tzGBC1yHyFkvqONzmDYldgNSo0CKJK8WWZ4OC/l+TYQe/5EAcK3rXg2+scVlk3uRPqN
         MdDZN7RdB8RVNGmOX4vdU8+zrL+Rqd1DTWuoQVzMY7AvF6zPif9XwcH0pIGyIUoV7PR1
         BpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690372; x=1747295172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcGj8gNNSMQUWiWl/+PK8QIb2S0v9+n3c03DjBprxJU=;
        b=BezTgT4obr0CB5vVBwKessDCMJ20eODMVBPNNKXWrFOOwP7p4ahwQf0v9mUeMM835y
         Kq7WW/CMLoYUC40693j/vB+z9DF1HE1tkYJvoz9426pI6up7dNYA0PsjmsRwjlx6p80G
         gcDDvMkdLF+76RTCmw1oxCQxkUbQx2D317jEs5RCwxY5eGnBYzIiUdZz/ySwWB30dxZG
         IfoZAsfXQ3iSop/CDAkDRmBETbmtq6BeGkCs0C7JSZW/P0Od7ElYKrrV1eTCbIo45eI0
         cpCIqmnodkom9pd1tR7U/HG3Ml2THTy2SzhEYb/76HfoSAJan1G6s9E2ubaRtGHvvKBi
         HyiA==
X-Forwarded-Encrypted: i=1; AJvYcCXp4srNgPvBtDaiNVjUIRcqvBAY9EheMnP2Z6tT8q1SVHmCN6jjxxVABrIrTpJ6mIqOBFV+Ao3HZTq06NWmpnPo@lists.infradead.org
X-Gm-Message-State: AOJu0YwOlMjsqOEorwhjPI3rtQupBTn7vzs0gbgM17PleR/hRehWwHKr
	uLf10YDSYq/gaNXfU8ydMmHncUIJm0fYCDTFCwej0GLTKS1f5Ew3
X-Gm-Gg: ASbGncuY++kef0ho8sv1QaDYOu0eYzCCqI4kEMecwUoFKwu6OlP7lt+nC2GYDPVONNE
	9Wo/c/7YdsKMNG8M9FamBHIYGNHHIaE2LFMxEtDc3FO5zUSwVFEwrdXHbnCQMng8FrWgjGNXXvy
	8nb28GPsbJTFfoxpAtNru+duLr/RVItMaQMXESLthb7xY8j/9PEUAZ8rSc+LMsUh04pczlkY18V
	tUPuTYoigNSBPmvO8fK2kxa1TU4opbZ0U2oT/8+p+GdASZVI2wdORuiP5qB/sGVAus6HzYSUezd
	FeSDnURGA0lri3GvkDIQPzWs9Gm8TS/G6PJ6e7vM+wcA0di7y0yD2N8wA1XLJC0PXxE4+MG/Jxz
	b/j2g5B/uuG6SLwpegCQ5eDMAyglZeW+JjuZqGg==
X-Google-Smtp-Source: AGHT+IFdyeJe84Wyi4RMrSVkwqucIXatp7L18urG3uLyyl5lLKVHxvrvvTbBMleanppBjUD7/EDlxQ==
X-Received: by 2002:a5d:5902:0:b0:3a0:b4f1:8bd0 with SMTP id ffacd0b85a97d-3a0b4f18d16mr4855536f8f.56.1746690372370;
        Thu, 08 May 2025 00:46:12 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3b57sm19779911f8f.36.2025.05.08.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:46:11 -0700 (PDT)
Date: Thu, 8 May 2025 09:46:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <8a26a37a-26ce-41ef-96e4-10ee09ebe704@kernel.org>
 <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vaok7jgys4nt5wy"
Content-Disposition: inline
In-Reply-To: <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_004614_239524_E8FAB886 
X-CRM114-Status: GOOD (  18.59  )
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


--5vaok7jgys4nt5wy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
> > On 07/05/2025 16:37, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > Missing commit msg
> >=20
> >> ---
> >>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
> >>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
> >>  2 files changed, 16 insertions(+)
> >>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
> >>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
> >=20
> >=20
> > Filename equal to the compatible. That's the standard convention for all
> > the headers since some years.
>=20
> Huh, I cannot find the binding in this patchset. Where is the actual
> binding added?

The bindings for this are in

  Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml

There's no 1:1 mapping to a compatible for this because BPMP is many
things. It's a clock provider, a reset provider, a power domain
provider. These definitions reflect the IDs assigned by the BPMP ABI
and we've used this structure ever since this was introduced back in
2016.

I don't think changing the convention for this is a net advantage.

Thierry

--5vaok7jgys4nt5wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcYUEACgkQ3SOs138+
s6HvTQ//ZQLVjZ7S3522hBbALgUTR6I1RG0mLLqvMt7kOfD4yY1bDY3xu+aUgPKB
sx+YS69VUkz85gnidIk4gJNPYpp/fURfcU4w/1aOsEp+oAhdehrWCjr1MF68aIyS
xhkHGKa/qvgbPGp2IO0WLu+w850bjxHB7/XOmq/k4NiEDv+PWTTFsj5of9TqvfKY
1yEjmsFZKlWZm5/lHUuCNpY4MSOl9sGJ+x76sP3bGtanAkQLMKSdQSDc2fck3/ob
Txjs/5ZFfhdaGIHjHkbEByKFQ0Wp+2tCWJJJ+KvRCoeM11OGbID3BtNL8eHqj7P8
hOnpkJBKErl9zb7ShNg+Ek39T2zB5+xVvZZsbLM2EFVcuuwa0/8azgOYL+luZqR5
poMKQ1dnU4UPuwM6/R5iWc0/TpGgxWW4k48U98rSkt1lH3mlHbAurksY6af6+ybM
p5NZBKct7B9a+7uun8MYHRwvbAN95ecAP5tp0sQeqAx/0dnAfR+7xErMWLJJD9wd
myS9uZsm9wYhPLlgxr0ED2gBIuZ97Vv14gsDsE0glp4W838odiFOR+V6NsHsOOOM
++caibn32AVf5WjKCuc1aGNC7wT0Ln02YHDvcGQ4EJr/aMvZxC2ogUN3B7/z32r8
hjq5nP3ZI/RHGP13bBSEr75Etf/PrCgxQ4dycTyXMAfhZ/H/vqE=
=/6JI
-----END PGP SIGNATURE-----

--5vaok7jgys4nt5wy--

