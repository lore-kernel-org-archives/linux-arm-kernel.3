Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890321125857
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=; b=e3oOTznrEjbCYEgwrUTvIuwKXR
	pyGHvHO4byqlEDWq1TWn1rWUUPNKIX4Tu775p0v3P+Uqc5RgtuZ70OShyw0i/yw2la0XIy9+z/L/N
	CQY16xWDAq/4V74EcIYZz1W7fXVqXIcBI9MmSxU3ewoD9daI+wpFl5gDeV0+VHxHUJYQwNe9BGf+s
	6AM4n1EsZm1AJMm4QKStJovvK/kFcXi4a1jKqbLViQvjPjkgCIsEX9uuC4PoybsYW/pGGvo1lii3/
	9W2vsuuB1eQTIA/rxVr6Bwcqo3ijnYafkXHWpF3WbOVI96oEKMrQazpV8pn9EadhhjQ6z9wWkbEGQ
	H3/RLiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NCS-0000000C1JP-2Jp7;
	Wed, 11 Mar 2026 17:18:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NCQ-0000000C1Im-3Yns
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 17:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=; b=NOTx0hwPgonEZ8e2XN9HSkI1kd
	FNrJjq5jG88yytV4RlkX64d02XoZT0i/XFrtZzGCd9bgbKfh3UYZfeajkA9ahSCndnxp3AFtOoUsg
	XSIslY2HzBaSnbwe8rP2UaCLt5gXvWBJwhBpWonZV1D3UDkibVEh+dEu9hYegWirSiNIrbbuKqm2b
	KpFLRSPXnIw2s+Yh0YfaTjGfBuwrVccl7N9I/Lr4F2q39PnvMJLam8DgSU5lhvOcId0XTCtfANKHo
	RhPyhpoVsFREj/0t8XGfwMDMRMf0Qf52Ozc4PPMhq70aU9bYDCb1ga7qN2gru6VU5Dekr9JX1Id/4
	g2s3rXXQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NCN-0000000HOuS-2gvx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33F9D446AF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E7DC19421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773249496;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iI3/lJ1AQxBpOoKbjorbok0yM+cC5+ZfVtlCq8Wa75WAnPRUVxfTomE36pME1zAr7
	 r052TY9iZh0GoCqL2pamDmeFQJSjB2pwhuZY0PdNBAx3SrN2Wzw/lL0dQWtWJkjI9c
	 M2uaUbhYwnyiniJnKGa4WDW3lXldtWVxL5/qkk8VN9fA1kKRfUP3DZW7t+N4XIiPnr
	 r+c7hYYO3vf6H9EdlqOFqxu0kMl7CUhnoIKMWJ8pNfGLzvitoFUbQoAlOBtjzCJgAc
	 xmifdmJI6zK+T5101InfsaE8XXb3060UDCourC3gX1PEgUOWCxj+zVEN5sdEnAnJs9
	 zz0luOwBU3p3w==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so1477091fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:18:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEuO39Q3FDfstVXeUDaf3IAw0Dcb8EOz6lJj5rdDTPkMtLHf4fl0wtJPIqP8B7RqsnyT3i9Yfg1HVqRn4UfRh9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh/C1HErdC3I/cz2NYTh1EeV2igDOnwPX3X37QylptmxuVaZyv
	UIeiNpluOli+HqJpwfeJGpJuGzTL5PqAJl3cLwoW+EdKCPJVPbZcH24N5dQ09YevuxDgnuUGAdu
	pTanw31zLPeu69sagyPQaeed6OAU0NAQVxXJhxW3a/w==
X-Received: by 2002:a05:651c:1604:b0:38a:957:a125 with SMTP id
 38308e7fff4ca-38a67e1ba60mr11617111fa.18.1773249494042; Wed, 11 Mar 2026
 10:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com> <abGizL-uYnahlcEt@shell.armlinux.org.uk>
In-Reply-To: <abGizL-uYnahlcEt@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 18:18:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
X-Gm-Features: AaiRm52Tw2Qo9qa62t56mCoewk4vwmQ4zN4g67WY5ySxyBb-ueDnRqCKEIOABSM
Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_171819_990726_A069764A 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed, Mar 11, 2026 at 6:14=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Mar 11, 2026 at 06:03:37PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to drop the dependency on CONFIG_OF, convert all device proper=
ty
> > getters from OF-specific to generic device properties and stop pulling
> > in any linux/of.h symbols.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Please postpone this for the time being - I'm trying to get stmmac's
> pain-in-the-arse PCS support sorted, and I've patch series out there
> and pending that make a large number of changes to this driver. This
> is likely to conflict with my work.
>
> I'm limited by the rate at which patches can be applied to net-next
> and the rate at which Mohd can provide me feedback. On that, I notice
> you haven't Cc'd Mohd who is now in MAINTAINERS for qcom-ethqos.
>

Do these two changesets interact with each other a lot? Do you have a
WIP branch I could take a look at? This has been post-poned several
times already, there always seem to be some new changes coming in. :/

Bart

