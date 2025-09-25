Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F4CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xp46yIJcbHRJcWjVDLrWyTZCidnv7xkJHZZNxJgNolE=; b=GsdzB4QfIAJF+maeuS7TdCdnoi
	Q9QkuhR0QJJFURJj6hsWj6c/db6cLes2p15abl0TuWmQbr/BRm2KMVXKpaSxJeiLpPfcskZNA82/C
	g4UpoGwBGB4WURMNNwgErYcUiAjmPwVFovIQ/tq1B5/4QNiH1349ePPk1RnQSQ7+9pLOPP/ZHSKAh
	xNKbdIWNBUNMn0rV35zXF7+Fn7qwOjP9Fi0ctHYt7HOOixslohW+Shi7ORz9I2ANcPx452zx7RY8y
	3kceiZHh7MUcAk2EO6ZM+bIuYhvfzuFTar7YhUb2Khs+8kGVrgyWkPb3QvlsasutYLv9Pua3ONQ+M
	vmGAjiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tKY-0000000D5Mz-0I9c;
	Thu, 25 Sep 2025 21:16:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tKW-0000000D5Mb-0MGR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:16:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-57e03279bfeso1929854e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758835001; x=1759439801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp46yIJcbHRJcWjVDLrWyTZCidnv7xkJHZZNxJgNolE=;
        b=N1VL1u+1FjEHnrNUUpJUCfLpTTT6BrLnn6ds0PsVpSSlnSG3pbbuTvq0uIzb2MT6/r
         Jk+K7HtdR044ifKYYYNm7pS4dE1ii7w8mu/8OPSZyLhpUoFmUMB2mBXjXxYvLFXq3/mf
         +Pyjoco6iPxsSHg1EZnxaod8uIxtuxoJ39QkD5j0bZwVV4BMErEE4WopzL+kZPbeJBav
         9CsB9ukDwEv8UyE/XDb63onvWds3PqKCjpbWMwZPZz88uYd8IFXEptzcuf29yfKAOu3r
         BjiLlgxtpgiAP+Ya+1s/A+SPD688rvefMTn6bRW1S68WU0EigO00v4nEi07hC+ewDkfy
         zBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835001; x=1759439801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xp46yIJcbHRJcWjVDLrWyTZCidnv7xkJHZZNxJgNolE=;
        b=MhJcGzrgWP/VwmvXz8xGtRBrvKGudckxlGmBzfVQDVdQE+feihpTHjUmovIj5wzJwp
         QgAD2IBFE9Cf1WRcJasavSKQn4twnOoXjBR9sJ6X/jCFdA74IIKmrTWuBpy7+vkdfyn9
         TmGSMoFlXkaFMO87Gy2jJoiMEu6wPcPJz8OrpVmRtVtkO8V7rU/+2PpGCWPDjo0nOm+f
         0saUlc1aGOT6bwJuTPcwVOZAehx4c6qUP3Hlmqwl8zcX8SEQzI99DYMndPmKEx6XjYnK
         +hItYK0Gfg3dMhiYrUMO0omqHCCM2qHxhbhnsKJZcgQgq0TniG1cbuxakpzmRR7GThWo
         NndA==
X-Forwarded-Encrypted: i=1; AJvYcCVabXlZWv0iSHgy7bTeFgaLt98XB6T/iY6xxTd90tCc34dr8GT/bWdWmb3Ka25SCRk4J6KhXCtMW3N2R0T+Abqw@lists.infradead.org
X-Gm-Message-State: AOJu0YwkM3iIQsely6W2CQNf7h49eZ/EaEKWUgWue8hYUOQ0gRFM0KdH
	ZdTFMkTrhKVYMXera3o2/hJDJekaCxYMt87QCYn7dydPYe9rxl9cFFn8BdJGtzDF0cjy9T8cKyd
	1kbjavjqbiD2iuX4z1hgVk2DyEYJFuHUR7A==
X-Gm-Gg: ASbGncsF2uI/UNAU0y2qrkqv7VU/2EkjA3lPdgrR20IJf7q3WqBnesZlbbN0XE54o8W
	gmtyjhBbAC/1icJ+8ZX4Q3qH+DRIrv2zWFY84shBhYsFOZdFQo0ojAQIln+RWRTzMHBZdDNNbxF
	EZd6gifdXKIIa+fUe8M2Ms2uPbw47nO4RdI2xJT6ADvapjjfy0UdtpNvlqHQhhj4kRFwBrglHzD
	ms3dmxr7shNgD+YvAxqdqC6ltFVnWBaCBkr7lc=
X-Google-Smtp-Source: AGHT+IF/R4h8pdyoRhIuFrnmhFqzj4YND2cqkoN6aHQ0ZxIGheJEKMprkxFrhvzl4kOccS6Aw2A/43bT62WxKEVS/6w=
X-Received: by 2002:a05:6512:2345:b0:55f:5c1d:6cd8 with SMTP id
 2adb3069b0e04-58304fa84d1mr1231774e87.2.1758835001303; Thu, 25 Sep 2025
 14:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-imx6_dts_cleanup-v1-0-748380dd0d22@nxp.com> <20250925-imx6_dts_cleanup-v1-5-748380dd0d22@nxp.com>
In-Reply-To: <20250925-imx6_dts_cleanup-v1-5-748380dd0d22@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 Sep 2025 18:16:30 -0300
X-Gm-Features: AS18NWCZCROPwL8d5eWS_txyBP3E590ZB-alom2X8buKGCuzjFOmQJoNNEiM6KQ
Message-ID: <CAOMZO5BNBp-sgeMvisvXjvrQpkznGkCY-8h_vwp46p0izwYqEw@mail.gmail.com>
Subject: Re: [PATCH 05/11] ARM: dts: imx6: remove gpio suffix for regulator
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_141644_146079_80CF4248 
X-CRM114-Status: UNSURE (   7.97  )
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

On Thu, Sep 25, 2025 at 6:14=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> -       reg_pcie_power_on_gpio: regulator-pcie-power-on-gpio {
> +       reg_pcie_power_on_gpio: regulator-pcie-power-on {

What about removing _gpio from the label as well for consistency?

