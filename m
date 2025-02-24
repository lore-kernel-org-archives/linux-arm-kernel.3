Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8071FC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCcU40nqG2qpQJNmSlgmn09aHVo2xllo2f5GNdN+iOc=; b=fhPGbuqlfV1nb38k5zY68pvIfH
	v1vNjZWB6m2sb+c9uLpA4TpsogLx8VEOvsqvnOYJ3t42CTWrGBStRNPJes+Qb1xKOuXlA4ukY3l9n
	ST1K1QecgcK6YBO+QmW+9ejdEYdBwfzNlcdl7ooG95fwOCsuIXClnhUuBDxd0Z2gx6EXw5NrEfQjR
	3D+8gBRf4Mv7+2pSFWrO/KQkIW1pHJ7/8U5GT63b+cHukUSdb56Q8GKHuTJUo3oUV9O40vX+3gh78
	MiDe2zxKNzQ83+St5PCZXFKxtXOEBbMmoqVRyTubG8a3AH3CUUxWs5OYaY52o3s2Yf5tMyRfzqntn
	hLLxwW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfP6-0000000F9EG-3GF9;
	Mon, 24 Feb 2025 20:50:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfKL-0000000F8Vf-2rbw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0C945C6737;
	Mon, 24 Feb 2025 20:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D491C4CED6;
	Mon, 24 Feb 2025 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740429920;
	bh=QgksAgFLJVabfIFwX75z/Nx5a6DuAlpc5gJA1Ykv2Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4PuSmUd5e6xEQZv/m92TzrDuWVhYUGj5Z/fSbN9X3NjRGO4vd2/oE/ErwnO3/pCu
	 wrW8DU37q0JZkRZ+kBVC5s1Fuji5ufLY5GKxKuyL+ENKJg96Ifn7uOcss5PyHj8VD7
	 cEVG7FP+A8aqDBWBjORYcaYatL0k8S0az8QjfFaFF02iFbmoeU5I07+ToJjGd9uxzn
	 LylpT+opFNf8oftDndf6VXgtMXk/7V9zOCTTvsICrYhZJNErObLlRWhd3Q8WUFpWOa
	 rqy7+C7u718DposJaPRNyxvartvPH8K/PMoqZf74GKiTjutyzwnB0hhXrcfn6+PD7R
	 EKun7ZzeFI+Ow==
Date: Mon, 24 Feb 2025 14:45:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 06/14] arm64: dts: imx8mp: Add pinctrl config definitions
Message-ID: <174042991798.4062591.16695660457830350664.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-6-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-6-5ccbbf613543@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_124521_776753_B8865DC9 
X-CRM114-Status: GOOD (  14.10  )
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


On Mon, 24 Feb 2025 14:50:56 +0100, Maud Spierings wrote:
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> 
> ---
> This patch has already been sent in a different group of patches: [1]
> It was requested there to submit it along with a user, this series also
> includes some users for it.
> 
> [1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com/
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


