Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05506D4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=; b=F0zpbBqMhYeGyhNiU6ceIf0Mqe
	3nsjiQneVkIqlCXnrhjLjhEty3RymekI5Gz9n/WErVVKn33VxI1OIqWhzwZZhYiEoxVxbRkXSMckz
	YXnlpVMVjbwxNmslT9KsHbahJxjoYx/zB6ezChaYBGgawIWsdTlHDq0VTUSZfz6A8Zlz1Glm0E6MB
	XGZ7+zZWkqOUA1gdKvfbSxJB1FlcidQWsN0H4od6flUVbw6hUje42StldKo6QCyCFjVYENcB8Cxmx
	mCPhg+zwDa4FL046xOBzS9lZWLiZWbvUDH5oB57ynz2iIOaLfxeFUyadgUyZujsnQKzNOXiTyxcpk
	zB98WbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjIC-0000000E7u7-133Q;
	Fri, 16 Jan 2026 12:51:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjI8-0000000E7t2-2HOE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:51:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1589907f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567862; x=1769172662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=KHUOJVnx8NXpaXrSaiVCh0/adK7NWqeBT930k7Th+h1y4pinjZwoQ/+jWlZs0iTzZZ
         O1wR8KRTQIujuAN2lhFodXquYTlIXyzVmpodxpu1rq6ojya54EgXwzuplxYRBZZEDJV5
         WrzvUqXtwGy8H9oUTXye/XlxOgcekd56ZypqgPlm/c42DSnoHT2rYgyHM7AdWeFPdjFF
         iW+//LSOxE+yoLFlcjGfHwUFL9u+ppkBv5eSOviMxaA55JG7wwe9o9euArq8nUrtnGTk
         aBqMvqDYBXXtqiJOcZVHCFItdjFcEQXz61Yh6vGnOk7YIh1lYKpLNxAiPAZEv91mucRR
         DZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567862; x=1769172662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=Ge1dqnSKxl2D+lAd6pxaL6MJMH/f3hvLWqFIHIO8vH0tfhTsfADwUuqX78Sa50XJIq
         gH7/k99g2YNsVoAcmRYK9ClaAsvO1Mz63DG9QDjKkLb7DOzrnZCd0chrbg2ndYoPCWh8
         zBtZ3oK9zNSQBZ1jP6qUxj/5bUBjjxEloOrVn3no59YcNo04IOhzGWRjQGwqoDQAl7aF
         3u1dwFyCf2Qy1oHJOU5e8SgP2k45VtXI/WAAfkQQrWLHTxbpk5Gz07RVTJFtdsKTis3f
         vTkfaCpOo7HIqL4msFOxjYv/OxTzxsAdWRnINaH+zolJH7p0+MCofpioJFC5uyKaBGaT
         E5MA==
X-Forwarded-Encrypted: i=1; AJvYcCVdjzKqJt335vK1n2OVkS2S58CsBk4hML2gId1769ooiE9A7fQ87QHDq5Z2rSGZtZgIsIMwAWq565b/hkWoWTN3@lists.infradead.org
X-Gm-Message-State: AOJu0YwPhZVTNrzv1b4i42+9zwS4bZAdL3czud7gdE3YT+yFxE4Ien7+
	RzV9EVVqf6jzgW486+WuwghbvOqcIA4BfP80HcbujmOpOj8Nb/Zjnrsn
X-Gm-Gg: AY/fxX42IMjlJkMsKgfDzLVze+ZKLSWmfzF81yhtDYqLB4WBJ/pROC42OCxLAzl8pcB
	GFlWuxolC+oGZeD7bYI1nifdnR3JycK9pV1PLqFFaIGwJIcH7GLHzv93x6gIAj6XgGZGqHYa4R6
	cXRyJMoJn/GKdyS3IVeM/+oLYx7H2W6NR0bnFTBrC/qAyJtuvNnETwwSpVpLiecap2pDij5879U
	N4I+eXiuvFXzDL3Qn1xrkNADiFC1NpLVNhpV5l3o3YVHqe68VOafQb9jHdwmhy3Pq7o8x5s0l4Q
	jUgh6D/eUwuVLgFYC+67aqdv0uhcJLxYhBydEa2Ylv1pw3jCaciZkQKAdM5gdKt2xTpeFa2DDCD
	NnpftCXBe270hLoahJ6idWtznBIGPuumzlMJoASdjFHJoSFiInsHbUZhQZGQDIlpsLYtdd/wfgh
	oERmpdaFkmqyjRfjbkg8XNSvM5aSGGh9nv0cC1tzzWl+7A1tJIxg6D8CKM1GVFTbqUMvfKrHDKJ
	w==
X-Received: by 2002:a05:6000:2004:b0:433:2f55:7cab with SMTP id ffacd0b85a97d-43569bbafd6mr3570766f8f.37.1768567861918;
        Fri, 16 Jan 2026 04:51:01 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb0bsm5012584f8f.34.2026.01.16.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:51:00 -0800 (PST)
Date: Fri, 16 Jan 2026 13:50:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Message-ID: <aWo0LESc5bIs1kHi@orome>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhhiv6s43avuu3l7"
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_045104_624699_90118893 
X-CRM114-Status: GOOD (  13.48  )
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


--bhhiv6s43avuu3l7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 04:30:09PM +0100, Krzysztof Kozlowski wrote:
> Make the padctl functions a bit simpler by returning void instead of
> always '0'.  The callers - phy init/exit - still need to return 0, but
> these are smaller function without if/branching.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bhhiv6s43avuu3l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqNDIACgkQ3SOs138+
s6HKVA//WbWB3AVvEbOYpT8fr129RiWvQ5lRtQceA8fb/1Ep4k0qX0M5cVujq72g
OFie2IcJyCzuci1ZmKEf7fTaR/cjlzExIrXvmox2TLmtKm5kBAFTu2UcHzvAbRcs
VbasfUeQ/Wi7dlT6+I6JeNLYaXbstuH2RQV3NQ2BC3zPUsJk27p7DARdqBLUSNTJ
7jX2sBu0xKu5n0hrBhesTMi/zBLMI3pZvqmMlhGzTU01GSlmPz72GMI5J6YmeeF0
Midhy4ZCbs40l7nJPghjxdtQoKLhUPG6z+NzTyp9Hfelr7q/cYZ1avlAGkJ/39fI
ugJEOfjl0ed/HMarlvwrRPSTjF6f2BUKH1Ub2xGxErbhGaGvOsKGJizbjsK0CGzl
jdVsdFUF/wmzPeX27RIel8DxTdTYnhpUyZoylg7l9thjdhYGceKGJHeHb1DaOOZ+
OhsSUZlejccTbalvk7OeBxtnujGfE56nEXsSByA0C6kaDRxPZmsH9WWtp4mwIzXg
rvw2hOERLedWoFTjFynl0+3hazgw2hh21iH/uE+uOEiVwHNhPiEXeb+lJMGQbH/9
Bm2mL/1gvDYA3KxeFZbTTyNwEiGkZyPFLvwZ4hpapk8AvhFdEu/60sMZWsTRlSgx
H7CJIWp6MSs4e2ErCXbhjjucu3eJo1lFTm/bGVBosixPjjSZ720=
=VB+5
-----END PGP SIGNATURE-----

--bhhiv6s43avuu3l7--

