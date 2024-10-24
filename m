Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF13CE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaHpkghq9cuCMb2HJRZAym0CXgOFGdaTduY6J1n9ZMw=; b=vh8BNonmDvYyj/M809gh1xceyV
	pyZCG4qplc/yp/iobwbRZeIISVB6tOF8cYE9jYw6YqDnaKy+WqP7ao+ukOqsSaYitwBgh8rOc8MYi
	TOSSRo+v40GYBKJUy3tbTIxHUnNHb4Pn8IpCG9wCmYyH1ON1s2W0L0a2kGw+vcw9tkkLc1ti4VjUL
	IQvtOy5AKR95F44MsFJfs/hw5R53VgnoUiBeDFf6hy0duMwCKZMZck64OszEsrGZnmTK8R4BHhC/8
	Zutx1Ywy/LTcjKThPYlCKNFw5/CmR6XRh/GSqUpAbr2ukBgF1AS0vDYHo60TBdMM593r+0fZkrb6+
	5tiBrHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t420V-00000001MP5-0vj6;
	Thu, 24 Oct 2024 17:52:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41cO-00000001Hiu-0W6g;
	Thu, 24 Oct 2024 17:27:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso12652135e9.0;
        Thu, 24 Oct 2024 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790846; x=1730395646; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UaHpkghq9cuCMb2HJRZAym0CXgOFGdaTduY6J1n9ZMw=;
        b=no0kT5/oUlzOqrUQBfYUsTq4IfCzYRzFWCjHP91hVom7XX6pwX0xaS2BBW6N8BxSFE
         gSybF+c1UPCFdlwySx5a7CfUhLTwW8tlq3cp4fFsGFeiUl+II5UEm14mp7/h6RU24Upg
         A0eIqPVlFgH+hXmgNf9Y0r7tVs/v9MYjBCNy4NlkPUOkol/OH4LTPHRGGbjHHQlsxpeB
         mPBigw3hNg6v9ArbO0+p4C9r3wzOIM0+BOtb3vcG/4o7lrFSttspy1L6DtxoaZuPMNrL
         vxx4/nbwPcj4kumvDkrfaIgNy/y5Fsq7O/NFxI5qQKQBSuNHETOQVKC6FtNgjqZuga+i
         ttmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790846; x=1730395646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaHpkghq9cuCMb2HJRZAym0CXgOFGdaTduY6J1n9ZMw=;
        b=wY8Xoh8Q8JYYD65YxrAlm7mhztaD8elVvEWqzcI6kXUSSHAWEO3/8Znvgo4XJZyh6G
         yqL2SXYpCq/OeUvsyVEGQJWMEwtPqJKbvDrCpkwDusnVHqaEWSe8KteSpxj0Bv+mFOxv
         ktYOZ8KFh8RTy71ot3a5yA2i52wJaFgSSQAUoxFLYR3cTowfyrqy3xTYfSsS+XSr7gLm
         4iEzKSVqc0lwjq83HEr1lBc1nwLLiMWuI7H7NRQxWQQlBlT6xi78CIEmqBperZBWEkPY
         F4wnGooW7epgk5xZXsCxUi0SaSZ2721dzu1rHZoY072tz8Q9tUfN27BvN/p4s/a8fBX5
         no0A==
X-Forwarded-Encrypted: i=1; AJvYcCWeTDs1wwi+DJ+rMR7ydjcwLgqAureEeiUd6vhi5K7c1ZKyi6hJGp4pdjCPsT6X/j3BffDMxxSm16a43YMORYfX@lists.infradead.org, AJvYcCXOAFJvGxm8wrfxwDhtTPvvEfFK1ZmHn4HJ5JgCYxhsB173sEzKZQuOsSq3hAFgb83Q3egG1fGnvJ66xFn78ts=@lists.infradead.org, AJvYcCXaqMzRxHMKFcIW2k0aSRc1vRFjnu/s8ohT3dJ8NuprDsyjvKtPjTB7IwP751mXWTgwW2ZLdxAdfuh6@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQY/UXV7/MizY/5lHrF3d1TGEIhCX876hkSbfopn33YXri7W2
	rudclw0LAqOPU2KAXUuWI/XGUefdE1UDpTsjWjr4SUUT3w/8AS1j
X-Google-Smtp-Source: AGHT+IH9aeFR7EI/JBQU2YhJkoiZcmX9vYZf/rP1GuS53R5NLbNpUfaTaV9YEHJNgi6VOgAWwW1HsQ==
X-Received: by 2002:a05:6000:1faa:b0:37d:53dd:4dec with SMTP id ffacd0b85a97d-3803ac9725fmr2225519f8f.15.1729790844879;
        Thu, 24 Oct 2024 10:27:24 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9413fsm11839544f8f.74.2024.10.24.10.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:27:24 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:27:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, JC Kuo <jckuo@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
Message-ID: <h7lfhtsb4qmrtmcgkeykfwdqzwmby6jfspd6hguxyx3huilu3o@sfl5dqcsc45d>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-3-saravanak@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="twcjumikk4cgqnzo"
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-3-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102728_193831_869951FC 
X-CRM114-Status: GOOD (  15.16  )
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


--twcjumikk4cgqnzo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 11:13:43PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>=20
> tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) wi=
th 1-0008
>=20
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvid=
ia.com/
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Suggested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/phy/tegra/xusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--twcjumikk4cgqnzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcag3oACgkQ3SOs138+
s6E0jA/9Hrx9YAv2LNCLCxeOKL/DQUk66osQ3tcAQYkyXH1Lf8zsvymHrcUdbWBM
95AoBk6VHHrDM/3mW1riHBZy7wiSLA7ZH+nXiFscRZcisWchkrcSFd1Oy1LgRj2Y
N268oEbko8jjmyKx0yTojbbilbsZtXZkKsaVhxkBgAchQ8lYuAQg4nPRABMJB6F3
eZKMHGXBm6YQFOvV+Ahasj88hN+0WceHJNvzIQPXyWY2U6ixPpsup5J/uikzHqpI
rmlb5zqPUHtHtG/U/ku39cIgiiOBE73/OW1r0qM5ez+UiTYWukXAQyBSCjtoWBrm
JguDu8m/fS1Iqn+NmxlOBto5gRRABLwBb3PHWfW7XEuVk8ZdGpycBxQ0+ZOglfSC
PUn/XxgW99w/KbP6401Bomy+Qj9MXJap2cytyVNrMGda1xlwnAPFVPDZ6qNCxZRc
Bw1dD6hZeWOsKlFZcY9mBhn4D7nAalV/t+zKe9YdEe7zdkTv6CL4o79JjjIACdsh
GJjfZOlG7FsLE2D5KscHSf7vxRKG2xOcpQyc892MLa2tm4MngYKUGsIEPZJOsnHF
vkw+QmOdblNPJSILIH9uyAwwb3YDkivpKILxPTgMB2eywmWnxQaMh96hc97eipNh
H0hKPDvcuendN6+xsu5VM4VQSp5VdAbX+YumtsJ06Dhdqt4kdoY=
=GeOf
-----END PGP SIGNATURE-----

--twcjumikk4cgqnzo--

