Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E16CE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KodV6WcWZNSUrtGGsjrnGKWe/PAUnYcTH0x1rpXI3I=; b=gttckJxxOg0Akb4bPpUkaeqhgC
	koq0tY2+hbQDdKrDdaZt7RQtlWcS1OsxaqqUO52cqlMYXxOknTLNUUtYeF6wN2OkC9sjPwPvETbOl
	8+s8+NBZkGHi7+zHnoeCY2UyiXVy4vHIeFZXkI7n9GLto6c+IW0/bSeAMgjDWRd2eSA8SpvE58rnO
	a4HTUl/IOqrpip/cMrrQlHwCJ8LZw8fjq+ozDqUWRpf2UkrzTVbdsCQSXAnUI3crR8j47oA10yIV0
	YO+Z7qAtmg0OaibJSjHEOG1isQVZcT57lk8b7WSz6gyzvLwNhp4l7synV/Z9u2whCjvjs5VDoSLoi
	QdKNqYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNScP-0000000CfA3-2VDT;
	Tue, 17 Dec 2024 08:07:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSbK-0000000Cf1m-1YM1;
	Tue, 17 Dec 2024 08:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6566AA41D95;
	Tue, 17 Dec 2024 08:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0607FC4CED3;
	Tue, 17 Dec 2024 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734422800;
	bh=lezp6EOr1sTrbOd8jVW8DSk++wf4bf36AnptRA4PyH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+vowBXnjBaLUcuH3ZNTlxuYXFlQoFs+HB+3snpwxM1GcMu32ovTLikNU/IGawtnc
	 r3cwON5Peqm4GfLiMitiu+BtPNNxdYI8go7HgZO2CYqt9dw1OWu9tKL71pWVzzY++4
	 vZB2IcRIxWiznIJeOfvJzgWru5L9OGuWaUBz711FfpLvLU7lx3S95Jfwz57W8GzpM+
	 28k3ygSVqpUKOCM03xWFzm7svkTDrNjht5c0paP7Y5FDr0ng6aTkQiUpTA3uN2vL2a
	 swxqAfXJIO6wbed7cknFYAUCK3x/CJxvG2mIu2B1jqCZ4tLzKzFUY2JSUaoWL/DohT
	 OvNixEsVkwTJg==
Date: Tue, 17 Dec 2024 09:06:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
	alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <20241217-judicious-stereotyped-centipede-5ddb27@houat>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="f3jzfinrd3s3htcj"
Content-Disposition: inline
In-Reply-To: <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_000642_481618_FBF7A3EC 
X-CRM114-Status: GOOD (  11.08  )
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


--f3jzfinrd3s3htcj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
MIME-Version: 1.0

Hi,

On Tue, Dec 17, 2024 at 02:51:47PM +0800, Sandor Yu wrote:
> +static ssize_t firmware_version_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf);
> +static struct device_attribute firmware_version = __ATTR_RO(firmware_version);
> +
> +ssize_t firmware_version_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct cdns_mhdp8501_device *mhdp = dev_get_drvdata(dev);
> +
> +	u32 version = readl(mhdp->base.regs + VER_L) | readl(mhdp->base.regs + VER_H) << 8;
> +	u32 lib_version = readl(mhdp->base.regs + VER_LIB_L_ADDR) |
> +			  readl(mhdp->base.regs + VER_LIB_H_ADDR) << 8;
> +
> +	return sprintf(buf, "FW version %d, Lib version %d\n", version, lib_version);
> +}
> +
> +static void cdns_mhdp8501_create_device_files(struct cdns_mhdp8501_device *mhdp)
> +{
> +	if (device_create_file(mhdp->dev, &firmware_version)) {
> +		DRM_ERROR("Unable to create firmware_version sysfs\n");
> +		device_remove_file(mhdp->dev, &firmware_version);
> +	}
> +}

sysfs files are part of the uABI, and need to be stable and documented.

For these kind of things, you should use debugfs.

Maxime

--f3jzfinrd3s3htcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2ExDQAKCRAnX84Zoj2+
dnc4AYCqAZF9d60JM6qP2gOgYAn6lAKF42a7J9At1vpspnjLkxWeo82wwxsVUN3q
dX1sPvsBf0FnUgCipeCjavvQGCADOKKD3bokWMMWhfpqBINEp3TxubYkPBBuPx7Q
x5ViCYwzhw==
=BgFt
-----END PGP SIGNATURE-----

--f3jzfinrd3s3htcj--

