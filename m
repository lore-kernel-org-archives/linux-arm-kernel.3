Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4C8CAC580
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 01:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIqAuAlL8F2b5zg0kPwNOiW88NC18gskGb7XFX68fOM=; b=vC//bh4eYLE8sMtcwyHpm0SMTr
	tQt4IujgyTRHiQaDN0uGjDJOEgHL76n6HLAw1tlnd8+oSAa9wjPr2nqJZDXuFZIinIn9Oc/ysy9Yg
	wSed9N7JDCv65dn0SZVVPaAn9kKROChvgYWguotpGfMSVF/ZE1gITze+Xro45ThCQbgYjWKSdgs1t
	jibEVS+gU5ZT6Z9jxdBeKvRvcJ+An1WWg/icZ0cR7X5mjfDrk7bFnLpR5WBIG66r4xVP8QDTaew/f
	03HcG40uhfNb8mXKgKlQSSrH/Jibns1M1U6Lrlg+wICP6rGzt8EyhRKPEHbGqxPFmEjaZc5L9KVEW
	CKrtcNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhh1-00000005s3V-2fPL;
	Sat, 06 Sep 2025 01:26:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uufqs-00000005Gfd-0Qhp;
	Fri, 05 Sep 2025 23:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B7F7601AE;
	Fri,  5 Sep 2025 23:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40DBC4CEF1;
	Fri,  5 Sep 2025 23:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757114896;
	bh=sHDzQNR+4667hi5yiXtnj/s70kNPk7kjxozWctS/6wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyF/8o2Wy9POeXCaDjWYs/9R6CSYmeh9r/M2PRpfA4L9DGcUBwEUEbI6X26kA61LU
	 yCDjRjNRuNAVtBjI0yKApZGnoKrQoW5prezgO6vG7QcW8ufhPAdYS6cW/oFw618sVf
	 AOUfK2s9ZdvAHQrqKe+3PK4dWD7kUsLfFXdYqfrYBtgrg/dkVHGzApS+dWHf9xiWSx
	 7idD8L5Zm1fLgge50y279bTRqys4e+pZXl2r7u3Q/2d1TaNrBEFcuJoCnIoOAQVZO5
	 TgRG8bZwL7EnAfB3io/hw/RoAWiEOSM60SVMAgH3mH1EQQdmi4NAhAr/+cSsWzH4wl
	 yPxOqH5Fc6tDg==
Date: Fri, 5 Sep 2025 18:28:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Steven Price <steven.price@arm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH RFC 03/10] dt-bindings: sram: Add compatible for
 mediatek,mt8196-gpufreq-sram
Message-ID: <175711489460.1508247.14844222484675872512.robh@kernel.org>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-3-7b6c2d6be221@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-mt8196-gpufreq-v1-3-7b6c2d6be221@collabora.com>
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


On Fri, 05 Sep 2025 12:22:59 +0200, Nicolas Frattaroli wrote:
> This compatible is used for an SRAM section that's shared between the
> MT8196's application processor cores and the embedded GPUEB MCU that
> controls the GPU frequency.
> 
> Through this SRAM section, things about the GPU frequency controller
> like the OPP table can be read.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


