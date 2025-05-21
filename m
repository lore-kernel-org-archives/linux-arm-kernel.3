Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338FAC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpDVPw1NZAHnYMwuhbAJWvIdRrYoJ8/yloUGNqpjYAg=; b=yP5QUf1L0plv6+/TGwmVUVUn4e
	0pdSbd5+pQ+QjHgA0MfC+OM4ZnheITOHqmv1o7IXjB7RWpafmTPwe4Xa9jvJVoeKJ2H4fACrurUCE
	DNYlOwYXdA+geKoIFD/MRy/7l5eXmGz/Hy8Px/Ju3l6I9/kzI8cflpCO1hohck7AHApDdOz+eWf7a
	M31twQSov8+Jzrjzyzk2wVk40xO/H+NMdjVAhWVUsHMlD//9D8cmD1MjoHZYYMZjgakUhRlL6wyA2
	d8ZZMUr7U4MwDgutWbUUqBSFAR2fKrxreIcVwr7tH/w9vz9g4L+Ot45w7hJQj4/ZKnRGYK3FGD5E/
	17UwQWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdWO-0000000F0ui-0psw;
	Wed, 21 May 2025 07:05:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdTW-0000000F0L4-2Egt;
	Wed, 21 May 2025 07:02:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3A22629D5;
	Wed, 21 May 2025 07:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7A7C4CEE4;
	Wed, 21 May 2025 07:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810969;
	bh=rJJFudt4I3SK/FsUgWrU4RNF8V2zQbKq65qLzlHHtm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckmoVOQJAGhQ8RMwu7LGRHDrCdz1GrlTq7wOzvcIhVeLgKay8aWoyL3zOVUW3kMTn
	 AwfdR3bMdRPJU2ET5Zv35oJ4S0+zo3jC2l1cKYZ6FJ4Zg54FYZ9JHed0VLFIHQJ6Ep
	 jF4REK8QkUWaAbii5lK7sVFNXbU99il8vftx/IRKGOOS13Psb2VsbDXriYc2E2fcVt
	 wZUDrWohnrLd5rJfgnDXh9A07yVFMpe5QvR9DqzbxbJyOs+Q/1X5HfQ535jmyNKw1w
	 zADXuuYXI6rVDvvR8rwd70tH6HVRF6S3tNc1P5otdpD4DBLv9uiAc34zr5HHdhOGTU
	 LaiBf0yTaSPbA==
Date: Wed, 21 May 2025 09:02:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
Message-ID: <20250521-able-heretic-starfish-ff51c4@kuoka>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
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

On Tue, May 20, 2025 at 12:26:54PM GMT, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
> 
> v4:
> - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
> - Remove unneeded items: (Krzysztof Kozlowski)
> - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> - Add reg-names to list of required properties (Krzysztof Kozlowski)
> - Fix example (Krzysztof Kozlowski)
> 
> v5:
> - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> - Streamline compatible property (Krzysztof Kozlowski)
> 

This is a big patchset, so please slow down and do not send it every day
but allow people to actually review the version you post.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


