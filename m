Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E062CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=; b=0GkxnTu+kmuHq7fnD5Znv+l0t0
	0YU04AWkDbgNyy9i8BIJESs5DgwmpUyb51XjozAF7t6fgQUqSyywnQA4gzYnZ/3ZuHKe+z0Ybk/BO
	Wq8th9XqfUR12MUGQUhDBHxeF9Xksqz2OTwowGeVCBWj6eau6BeSAzje+ahKw9B/KOo1KesQhnCt5
	rE8YnP3ckL6a1lpBqUXG1Srt7xz7jn6QjWHxYEhjo/+vJeFT8MPR8UHJ9DFxBDgfq1uD75mi37rAL
	QCbyAFfM+hgWADFhq9iEXTECjk4Qu4HhDws7NYTc4E0CBxCFChi5bBfOwquA+fvzBN5zCHxAQe9T0
	h42kEkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDkb-0000000AIaC-1SAb;
	Mon, 12 Oct 2026 10:59:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDkY-0000000AIZE-1pc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:59:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48b042c0728so320087f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791802760; x=1792407560; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
        b=olU5Uyo0w+TFVPh9iV3UlQ1xUcVmHjCVB5L1xxxkuJxsihUnMYRhq2vYXnQjOR0wir
         8PQZfiPA1ko7nhh5OJ5RIbqgBsf0DpH3BjPldrHp7useXZjjfa5GJURizgRvbk9qyyRL
         ksAM/kNEBLdbxPQ+DUapsXIfLh7dpTDPSezfm9qQGEJvKh+pWWtT7X54mJdP+ar/a3n9
         qTIggEZ3ava9rKjSYKJ1cqj9Dl7vwG2e+d0Xx5Q0AR0+mXELYBpi1kqU523r+CzIWTLL
         30sjyojIfBnL99RUDBj7qoA2pWwquMtyoQfTLvSR1PhvZ6R6L/It3n2fEdbFtiRAiscz
         8xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802760; x=1792407560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
        b=PxVOkXt0tHH1QVZIBiqaRkSst0E3zfWz8IO2ouRxNTCFx9ajAX6uuBfUWcMA/XGpqo
         FEfKw+1Vke1QBAArAqgKA4JBdEZU3TkBwE79w8Mi4JFO1knpQYwkJC2YLMhzVeIerlBU
         e61ypBIde/Goh/VnoPpZRS0wzmVX+7Qoa5zzPa7Tza/iWZ2oQaV0E80Mi56lrHJe12h6
         GKiQQ86K1HtOmPx7f91TnCE3G4HiX9REv3KAJaXd4DfnSfZua2tB0wqBTfwM4iYQ2Ast
         BEAbg5QHUlUU2QyWKWtQehkYtTOa0App037gRIcqaqjVSBUcP7PgdpF52myX8um6TxRB
         /GjA==
X-Gm-Message-State: AFq9FYL+Z1/3FeoRnLHmjstol7xs17j4OtLtvrbq1fiPyeH+1hnHMhRo
	OU8ZuRp5L37SfYGl91ocsu4EJHBngfCKrndmCPzBbWbgmqPJy9u6QwgJhgVWlY7akH8=
X-Gm-Gg: AYBFou14B/YTGz769nCiPSKz87VZGPvISmURGS0UCAMZUAMqaSZjnQDfRq9IokjVfyF
	596AM0uooI8YlInhKRgEQdzXwH7PNNuwmODrJYOo5c9b6A8khi5qVtReVquYnd2a5HD0SvZnCTu
	9KsICD8J8s/GJIbGACl2n5K6QKwoB+0BFBLGrhXMEC1ImQ/50zyRWpYMscb56POULyQsyUxhlFz
	QQqqA0pAT/zkSML7VMxWpibEAp8mdbNvlaxxWRcDXp66aTmC6y7oJo3joAB7XiyxAu5u41/+kEN
	SdmpiFgUPjlXU2LOYmr97zbUKeQW/76i4AnXX/bFzu8sj8z1LCT1HXdCMH2Lmcr2uA+/ohc1imk
	vEps1uFaygXLaMhTpk2GgOPgxu9lkYsRBcVQeW7kP/OjKkfUK1EDjzjhS2AgpyJHxGBytorgkeo
	vIzDmxIWa3NGvnr01TQO9Eg6RL5//jBsdvwvBqnEoROLH2NoIRAN7nI4126n0VgCa8kF4D70DDe
	+GltscCrnq6halTnbccrBH2538g0gss65zoW6Uxe/ZBAbKYmerkfpdhMO4HPyTAkbtO1nSL
X-Received: by 2002:adf:e001:0:20b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48dba7b405bmr11892966f8f.6.1791802760381;
        Mon, 12 Oct 2026 03:59:20 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db9463a9dsm19504613f8f.6.2026.10.12.03.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:59:19 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:59:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, stefandoesinger@gmail.com, 
	robh@kernel.org, krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Message-ID: <asy9K6Gqygrl492D@monoceros>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q2hmm3keht6hv76x"
Content-Disposition: inline
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_035922_488625_7190C6D9 
X-CRM114-Status: UNSURE (   9.70  )
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


--q2hmm3keht6hv76x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
MIME-Version: 1.0

Hello,

On Sat, Oct 10, 2026 at 01:59:47PM +0100, Navid Ghahremani wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. That header creates a lot of
useless build dependencies. Either rely on <linux/platform_device.h> to
provide of_device_id (preferred), or use <linux/device-id/of.h> if you
want to go full iwyu.

Best regards
Uwe

--q2hmm3keht6hv76x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMvYQACgkQj4D7WH0S
/k5D5gf8CiIw5ZmHa/4qhjWhI9bOHEYttUfLI5E9sTpo3TR8gSP3wq21tpb9ywRb
nvEYlAntKnE5j1YV7okO47JWOPy2FlFSIYfB+bl+MBanR4v7h5vaVIzlFDQvZI3x
4/s9TDLNdORgidiC3wYjnlvk/BYGYeV3Xcz3Edd10vTvXY1nkcWX047ClGlweYLQ
0KRRSVKza1fIczofidCe4h3TDpDFsG65SOK/OfVjl7Ao2wOK/RPk2P++gNgzstkq
7FBEgasH+SDPqmohBCxOC5y+hbfVkRO9TtxPaTtCyPXjy7bo3RVXFSBI/NrgNEoX
lBI6nUELanucYbUs3YpLmyfwX2p/fA==
=QMtx
-----END PGP SIGNATURE-----

--q2hmm3keht6hv76x--

