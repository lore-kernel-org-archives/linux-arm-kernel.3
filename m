Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDFFCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL5p9gSAu0MJNLyii4c8sbOKPJ0Qx/zmAiN5oPjsWsU=; b=WDPaKRyu8muE1Agn+KEXisBBZO
	eHY4DJFv9hLEX+iM9v7zD/9CHEU8768bbl7XnUtwYn5SmAsRnLeS8OdUYq9SyZYciogoRZITjSg8+
	2a8k4GFf2WHbO1yyyGaAZhZkYvajxQh8FszncN+j33FTY4/48vlEz34Qw4a1EZ116d2G5tnyG2HHL
	AkMGlgDBzaSxDYrP54b4TiMKrM43b4YGQg0IXMBUJfiM89MacWyVDZ9ItqQTt299TmZVI+wpcMpeF
	k2EIK/dZ7CBCi1w1EI4bZaQaCDdflDBdb3DXN/sqleg/Y8Cb2dO1yTZoYIBIHS3l3e5nSx/slh58D
	aaBvoFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOUG-0000000AvBB-1e7H;
	Tue, 19 Aug 2025 15:43:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLcP-0000000ASt3-0plC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A36645C623F;
	Tue, 19 Aug 2025 12:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48B8C4CEF1;
	Tue, 19 Aug 2025 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755607149;
	bh=mq54Juz4cOxSc0yvV5IUeJzSpqLNjIkIZdlTuXERT+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJMmDXoz5HfrnFzyPCJzY0XeT7U2ONbdBoqwSnxcne9u7uFgDTvqtc8S4OA0xfa/6
	 0iWitJUzbhV9M9Er/ro/w2s6jcBB6QbkSuMgqgn9REeEJ7D57PtaDPFm6V7kUMIpDB
	 gRwT3YxPd/zn+R1eu7r0vur7p/KR3u0kB7fJt76tg54WYR/k073Ll0duZfnl3a2mMI
	 FqMnBDD0LyzRbWgbajJzTS232DgrZLqixYLRf7kahu0h50O5eW+waAfxcRVtxuWabN
	 JS1Y2rAxhRPNDsAgbSa/teiwfPZplac8Yp5iWC1XilyHUOLhLHzNSdCyaX8S3H9pDF
	 SVJypEBp93Vfw==
Date: Tue, 19 Aug 2025 13:39:02 +0100
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <20250819123902.GD7508@google.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_053913_279855_B3127DC4 
X-CRM114-Status: GOOD (  16.70  )
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

On Tue, 19 Aug 2025, James Calligeros wrote:

> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                  |   2 +
>  drivers/hwmon/Kconfig        |  12 +
>  drivers/hwmon/Makefile       |   1 +
>  drivers/hwmon/macsmc_hwmon.c | 858 +++++++++++++++++++++++++
>  drivers/mfd/macsmc.c         |   1 +

And here.  And everywhere else.

>  5 files changed, 874 insertions(+)

-- 
Lee Jones [李琼斯]

