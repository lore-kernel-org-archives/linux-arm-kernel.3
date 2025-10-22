Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B0ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=; b=qkbbelqweha/Be8btJ6XdV7meD
	FeyhEojjg8WoMVYMAdqwcTkLXx0/QRGeQZrojTWNzPbfWBztboqOfksnjsichgibrbLSeY0psbCTB
	2d/ANFRf2zIDJRAdGA1LBVDKeHt9TIJ9jqUTeemnlIPSuG8OWfy0cRY8Fe/rTLmGefz9+S51j0nza
	opk0wrdVpD6beOtIxY3wy0N3qV/pXfxKhUf7EGXxqR+gvmSTPg65DXEmTDHpO+irscd20N3xGdn46
	BJHJ7ya5WGDbJdhCqZrVD5ZfA2ZhpH0oXXYY55sX7btiZegCH9UZpTEnitXTiXyv7aP+XbFnXDrVg
	n6ParPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXrK-00000002mni-1s0Q;
	Wed, 22 Oct 2025 12:22:30 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXrI-00000002mnF-0ZfF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:22:29 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-592f098f7adso353443e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761135744; x=1761740544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=H89jJeTPyOYLa5ZJpqKF5WaroAs3bcWMLR7oWXu0K0N66+RGiUEI7YdoEWJPonfA1L
         QFFCQHOYqLZjG1KzS4ccoYHZGbZvl4zU1h14ryqZmI/wc+pfeAFaAQn+IWJNgrYHLl/R
         RaaygFb4EJCJhEQ3EvpAO/r5VJoUz2l0LgPYZMQ0nD0ASPi0NKCXXatjzKvbNH0NHXyx
         fTIxKFeiMdwyRl1yZgHsQPWz1IUywGZN/JUiWdGly5SNqOx2eBBk68daMyeTkHHDbMU7
         220WQarY5vbs0HFb+Fhx5mHFuCz9V78WPNNXhFThmdDSCzmBww0OkJOUqgXejUrDCA5u
         Gxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761135744; x=1761740544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=iVlbzPXemhwrviKQ/eeRADmZZGN+Vg35FmOpxBOybnuixIFSKlQ8tEobW12MbPAtg/
         0C79PBnJ0DaYt090TvI2PyZ8/ySxf4AGlzTPnUt+ewKqkXhOpMwH9X3QAuxv3I2DBcNY
         7W0kbAF2z+dVdXwIhzLoZkCe69M5O99tyOrKeNNb+HVqhOuoDhOj2QcEudnHik34JT2p
         RPeHq2Ei1rGkckz21R7bU5YRdWlzey4/K12pR7Jke4M/u3eM9i8WcF+ItNBKmcpp4Qup
         abtvqLHOLEVdnIjrnavXv8EmlqCMD5m7eA4WM+xf5AgEoQMnvO8BW0U9217Rcf7Iat/x
         kiKA==
X-Forwarded-Encrypted: i=1; AJvYcCUWYvnNedQU+Rq1q2l50mD5K2bGAfsmViMPlS4ykXhWUGpI7TamMmNkVdBI+7Psgh46G3sm35jVTku66bIw7eoD@lists.infradead.org
X-Gm-Message-State: AOJu0YxjQO0HeycRiKBh+UT8X8XyFdhj06uRHoGqTPSyEpTI9IZ2WMuN
	gNJPKEQXSzAeViCDpf+Iu1rxYCZptb7VpYugcFBSpQJv6QtnTv6jRMyqKbzH/NRKEUjI3uYGEm5
	jOTdpMFJye5+FO5sqCxiknIgIcYQb2qrvewyurEi8DQ==
X-Gm-Gg: ASbGncvc1I7X6hDfR9NYIARH5sQlxMnMT6GI4cI+4O8ZYJ5zkfjstSHiE7W/NeLH72z
	vCtTo6DeBuA8Pp/E0tlmOo7jy7JEWMqq1yXpVPVLaD4fU3BwHq8l01lR9P1rCL+ss/+tovV05ZA
	id1nKjcnXDfesL3eLpsbxm0MAm+zULroA/qDK3FOk0ANgJnSql1XGbkaspIBAAckMh+56NP8sI9
	VZ0mxf+qHCMq/lm4Qy0TfvHSfbJdMioj0eFVMDFrJBqAzKOIqwxuDAs9MtpHCqP8ijsJiqPsRW0
	VbDv9V8/6oWpCDGY
X-Google-Smtp-Source: AGHT+IHopjIXv8jRnOM7SdbKGejL8HmLCEbi6BqZ/fl5zn8nC+umc/NX29TWVW5P2ry8JnLwjKerkQkMpRF8tHTR1Sg=
X-Received: by 2002:a05:6512:6c6:b0:591:c473:5bc7 with SMTP id
 2adb3069b0e04-591d858f85emr7186831e87.50.1761135743550; Wed, 22 Oct 2025
 05:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 14:22:12 +0200
X-Gm-Features: AS18NWDxwRikRa37d3sfSPIurHFNsUg5soxDVQrWVC_wnbUDqwvc55kIMFCSQNk
Message-ID: <CAMRc=MdWFL_+RJXPUNLd0BTyxbt9x8jztf5SDViPQCkxSqoHdg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: replace has_xxxx with core_type
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_052228_194336_130260F2 
X-CRM114-Status: UNSURE (   9.61  )
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

On Tue, Oct 21, 2025 at 9:27=E2=80=AFAM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

