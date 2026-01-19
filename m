Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DEDCCF2E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJFCPZlfc2d0XP2YZvhE7/lV60DrBLW++wy0oKt7axQ=; b=SqSmFaSNO4XZqxIWLvH8Amh72t
	6aM3mjiV9up3xbMZckEg8Kdko2RAuPvdkyqzEMOMelMFx4jMzmba0T8tpATTYIbAroWQ3jI2B8ZOI
	TQ8+s7sG5JGtQDQqqZj3v25jOnDulaM/bogqG6UX4pYY448JLI0bJDl/LiH9V7xL9x+tLsq4qs/k6
	epeY0/lCthpz3LC6Dd5aBW4WYU885vbAytzV+Kf5r1oMcZecOIGSGymDcWJarYRWD5YgLqvExpMxA
	juLmyRhu9La21wzw2W4LD60AlXp7YNrswSoZOFWQa7srYmmfrkyzuhnHUfg9QKVBoXACX/6tGLj05
	Q64SOpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnP8-00000001tUD-1kCQ;
	Mon, 19 Jan 2026 11:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnP2-00000001tR5-3TfB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3117B41996;
	Mon, 19 Jan 2026 11:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE914C116C6;
	Mon, 19 Jan 2026 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768821991;
	bh=TRoYFafhv6XYbtQkSQrDP1VuW/VHQIo2+i4Os6bLwHs=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=l5ZSURRT9nh/iNJP+CEEkjm7D6tFTPPkk6CKCVRdP2iiQf85uUvxe3+WZYtnyIFk9
	 rpI5wivHag132WVnVHOYItMfj1s1t2M6bJM6MqF/VIaQUI74kAWww9I1X0uScXLGIA
	 QuLJaY7iyJ1ghVoNbJVvO1jAeakYmazsiAtd99FuayT/yWM70YaAV9ZBM7AbmgShUw
	 uhCBzpfV2sVtxNg1R/IxbZx6hlPkoEXnBjj4LkatT2DEIQxIT/6hBWvUWH4gySFxc3
	 S3qWf7aJsJ4gkrmhF0iJa0enabfTojzMWOvehsLySEGIH9rYKpCRT601kLyQtvBbyy
	 ElAwngxihO8cg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:26:25 +0100
Message-Id: <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_032636_913256_7110B2E9 
X-CRM114-Status: UNSURE (   9.34  )
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

On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine
> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)

I think the name of this function is not ideal. 'get' usually indicates tha=
t a
reference count will be taken, but this is not the case here.

I'm also not sure about the machine prefix. If we really want this helper I=
'd
suggest something along the lines of e.g. of_root_read_compatible().

> +{
> +	return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);

