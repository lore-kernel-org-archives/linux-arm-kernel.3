Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E43C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byHNTAzoVmJ12jHVr8chWlceaJLIIt4EKT+rNT09G+c=; b=OLIsTERndGmsEYxpcZt6InRYXH
	wuhfV5obwEUjAIP93DccxMQ3/SSFjfyHJhwLhqd4w/F8o1LkDsBJPgxnVUGgB95EcpCxpz7aFvDRz
	kzLtsvefXtCVjE3URQuA8PRzUo2tZvDXKICOWPkmSAOadi9WMNFBvsrN0xXoPQhKAonHZhtNwQibM
	McfkMJvldHuX/CSSDrGIIpBGCReLnFTRosAwkGpsbUsKJRnJYogtTmBWmd1kAImIx8PNvLwYL7785
	SwtAA9lk5E8rmiuMsyBJUMlsG9XdQ9I9qglna1PY6x2NR2wKB2ckVLQIZMXmBVOEHenX1bRM/i71P
	1bWekrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWc-0000000GHyr-2eBK;
	Wed, 07 May 2025 17:25:42 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgxB-0000000G1VX-0z0p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:45:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so29153f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746632698; x=1747237498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byHNTAzoVmJ12jHVr8chWlceaJLIIt4EKT+rNT09G+c=;
        b=mfvZeV0gbd39FrAXKj0Xg+VnP+GVj2XfP+Nco8UbmqrfMlHd9PVaXb4xLwwBIIhW4h
         NErdnmfMXVPrXyMYChq2E66PbmZI7tZYwQ/jLQHZthgTiMHFLzsmAcZuyZZqbqBhxz2v
         QZOxJ37+jOJiBtpZpPN2H91CwBE3O6Jvrz+QYwBy7KnzaUfU6Hd/EQ+QUAyEtJFAsk4u
         JPYE3CTV6lZac4TTgfBnpYsBnbDvvJVbyZhMO2AzK3EaBQn8FpoemUuW7RSymNJ6WBut
         jTzbvA3teVWGiq8zjlBKLx3ivaKylPNPkazjAGUMO17icCrtQg3860znqYa6TX1Gd63R
         qy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632698; x=1747237498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byHNTAzoVmJ12jHVr8chWlceaJLIIt4EKT+rNT09G+c=;
        b=TOkTLc2MXimHvzxlEWeZsUjlwj/8akSvk8g11J3WEaQ4kPNiO0bbs3Jp7O9yO3Dr43
         EbusL7Yis5rlHX4URRn4pjf9q5QsHBkiMTuBgadjjjroUnvFnbTv9+WORHbM7owDUmk0
         jtChEkQfVY87HcL7aedskVnFp27V7NTNw1p02MqWlSpALbKqf30w/p/UHWfsjDVYmoCH
         MtFiCacqqRMFiHYzJnBAM1LzBMcRGcm7VtomXv6ZPcyu0ej8sJxPpw5Xs/6XwSHJPO7n
         tuwMOBf1b51+DCxAk2j1DV2zCvnBNj6fw2xXLUzPI2p2FHUBWHbTU6UWQ4+ZW4YNXjAu
         tMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp/eaTl9jPd2n3HjswYFmC3scHHbc+wZ0gHrIPNilxTQ6tdYdACV2yR+a4GzUaFG/wExrTwNs7DzkVE+3yPnsp@lists.infradead.org
X-Gm-Message-State: AOJu0YySJd1+LPyG3oBf2KTFBqfIYoxuLFEvQwbtzKsL/LIndY661Jfr
	fL9ZgOLbZqtNdft+BjnM6/u3b+qzD+jIqiqULECRwTlJ4xwcY6zX
X-Gm-Gg: ASbGncteGwckXTf0J5yIuuwfspR3HefUulQx7HkBEzSGjfLvMc2+Qon/NUojO380c7I
	WEJNFoZaa9RnjwhJtkg6L8MMbIQlQOZzhY+HkQzMIu2w9PiE8A13p/UNsLb8HuTWVA0mQBKVsXW
	hcP3ghLop9Kx1SZWy671NfehGn1fxdPajmvLqNtbT3ihIC3zFCxaWDHTkZC1FDXvVngeCSndFM4
	v4u9PMUBofIczlQL+7TWImQ9i/QqCU+KIy0rLSUFK16jcJcu8hLV8gP0mjRpjKEkwvU8Yr9B4VD
	uJnHzcCuBezd4tByrIJKPn2SQxVP4GcKBriKYVvEyGVmypXFOZzFw4B97YbHwEKYpiXX7irFKUG
	85BdEABPG7jPQNcFpZBtphh/epWo=
X-Google-Smtp-Source: AGHT+IHfJJG0cs4abjEiWvnxwVTISrHAZEF9OSHQcqWVHkiT4B5VkyD3vvSWb6GVCRi9QWsDxzrI4Q==
X-Received: by 2002:a05:6000:420a:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-3a0b49bee22mr2812986f8f.21.1746632698276;
        Wed, 07 May 2025 08:44:58 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ad54f105sm5672659f8f.85.2025.05.07.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:44:57 -0700 (PDT)
Date: Wed, 7 May 2025 17:44:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: laurent.pinchart@ideasonboard.com, mperttunen@nvidia.com, 
	airlied@gmail.com, simona@ffwll.ch, jonathanh@nvidia.com, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
	zhang.enpei@zte.com.cn
Subject: Re: [PATCH linux-next 1/2] gpu: drm: tegra: dpaux: Use
 dev_err_probe()
Message-ID: <lihaxdejm7rvuurpoj43hf5zcvrfqlztdwxqs6p443jt73noqt@iipbc2udbgo5>
References: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
 <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rt7ige55tnphtzlx"
Content-Disposition: inline
In-Reply-To: <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_084501_271612_873EC798 
X-CRM114-Status: GOOD (  12.82  )
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


--rt7ige55tnphtzlx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH linux-next 1/2] gpu: drm: tegra: dpaux: Use
 dev_err_probe()
MIME-Version: 1.0

On Wed, Apr 02, 2025 at 07:37:58PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.
>=20
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--rt7ige55tnphtzlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbf/YACgkQ3SOs138+
s6H2ZBAArFAuCN0WTxbq9wpDNT3hPLUMpHA6Sdh2TFEGIklk5Hj+oHTcSPS5AV9q
uvfJynPiWqjRY4dTAs0J+6IH1R7eo/Qm71jvnoPS37oAteCO3hQqHeRVGgWN8PoH
vWwKaO4T/ipB8rcUfqv8TH/b74FIchpMB3/K5oaalRKjPlYEs7rahimhPq0utf7u
GELGnbPiXftDKLXxXkeQ+sXdVcvIINIikGobmY2khF9oxb43kN0JlRqxnnNF0lHh
0+j2q2TMEGQRr/V8+avobslZXYkqyuBOa/RaWNN7W3Y4kBOEXNxOn3GoN3hkaaol
WrXzjMX2k6OVU+MLYxR5+G+OWNRVXg/GK6KbzE4O1zJcJ5zhWssqThv61Nt3cqgz
nby8EIlFfV+/Yjus8iTVKE2HcntU2vbi0PCB2HHdzkVGwyha9nx9lprcq83N4HJ5
rKg3m+FP2tnrT5/JBg39FN5OftZgjN7q63WZwaly3P90pP9OhGKKDGE8+HGpzOea
mxVEb+8MwHag8/vNh8LHLxMLTTvNb4mn/pbmTmtFU4v/sDnsFtS0zcTAcDiY7tsL
0n/8gjh/ELimcnCQMWe4v4RGb2bCxSIFupwn2o01Shq3RgppcL+yEng2D9cJ+NVV
TdDxber+/HIqgTWDWoMkq0D2FUZG0pN3DPMF0FXUIQDGQAy17Qs=
=2Zbo
-----END PGP SIGNATURE-----

--rt7ige55tnphtzlx--

