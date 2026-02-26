Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B11FD9E12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P103FCGrnxs/xWkEVMA9wfCrrwGUD1RHdk9OgkWjkw4=; b=AlGN90T5d7ACK/IZNMnAG7bbil
	501ZSlZGtmwygT777/k/ugVKVRW6prB+6uJxXNczNvExnctIrMg84FkhaVqa8TtBWJPJywtGRCAcY
	C8h5byh2Oi/vz5fs9SaK2jCbb6lrl4wzt8O/FjhFsTpd7uva9xHEpw+4kwdng5XUlKl2Z2WM+MDIe
	8kMt8aLeqN91cFcFesGahmxTrF59K9PJCPMgDlUj1Dlv6DGCEpVvs9NmBtejkrLuQoTYvLUJEtlU4
	0vJQSUZYbjc8AfzyYAsIrf9sqLw55Ji1agGPGZ/AM3U+aEHCs56Gat88ZIvaseZg/fZ/H6qQvTPJ/
	osqVA8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhu4-00000007ASw-1DTh;
	Thu, 26 Feb 2026 20:24:08 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhu0-00000007AS1-3KTa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 20:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=P103
	FCGrnxs/xWkEVMA9wfCrrwGUD1RHdk9OgkWjkw4=; b=ArwLD00NgpD8GB6F3smK
	N81VP79SFKd4S2KXc7kXA8DG2HqiKcVJFAE84wiZkLVbYc0dcDn7xVrrqOstsWmm
	7Soa2GzK0V7rlrV345mLTHVvK9YqnQjwG8WTaHRhEhp5Lj26sWW7ILiQSNNSg0Lk
	6xVBe+6iePHwSS6IMD4VazRh8aWVu/Jlk7ukQYVSFWIflH3BUhp3GEp+Sxk2fnii
	ObczMWhgDQeaLFMLAlD8cApZLoPT+tppLZb/0yLahD4PGixDzB3JaKRupzLSPzpI
	dzo/jA0JGrDU8Ch20uk3ospXBOmwShwf7nY7+Zwqqvg+YlA/gOPAl+aqZgJfkyfm
	pw==
Received: (qmail 1210022 invoked from network); 26 Feb 2026 21:24:01 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2026 21:24:01 +0100
X-UD-Smtp-Session: l3s3148p1@u1Kn5r9L+OUujnuU
Date: Thu, 26 Feb 2026 21:24:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/12] i2c: configure parent device and OF node
 through the adapter struct
Message-ID: <aaCr4CeJFGaRMWRU@ninjato>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_122405_137409_64C5F043 
X-CRM114-Status: GOOD (  20.78  )
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

On Mon, Feb 23, 2026 at 10:05:46AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.
> 
> This series addresses the usage of adap->dev in probe() callbacks where
> drivers assign the parent device address and the associated OF-node
> directly to the struct device embedded in i2c_adapter. We extend the
> latter struct to accept the parent struct device and of_node directly
> and make it assign it to its internal struct device inside
> i2c_register_adapter(). For now just 12 patches but I'll keep on doing it
> if these get accepted. Once these get upstream for v6.20/7.0, we'll be
> able to also start converting i2c drivers outside of drivers/i2c/.
> 
> Link: https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Also applied (and squashed) to for-current. Tags are retained BTW.


