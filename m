Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0998BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U11+qUDBFqdtzIwC9C/OC7CkSz8LcuQAkhGjD/qyD2I=; b=QUltaFohtFo3Bxtko6cKsbJXQi
	T2cOPxfpUH2vc1INp3gbzNkveUs2YLjOdw2rdGRalFk6sUcQzhpErkz/+9ngQYMLlsADouj4zdUV8
	PrjfXJYEPwxig3sctBKL3s6lenthi2d5Bi7bfiPBPNzS1gB8V1J+jFPv6vuWa+E77PVatVDEfpjmR
	10k65tfqWqp3H7ibHGw9z2Ti1g4UYkJSl8zzfXr7MHlox22FFPkya3uhtgsKUZKhni3CG26C1/k1l
	GKnwkQmJow/WuzNDJhQaOcEtDj7hFV+WCeDiPdno27YQ0XR918PWbxxdWZ+zSCv0EIAsJhghTFQFH
	G1ypmabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueae8-00000005ENw-0860;
	Wed, 23 Jul 2025 14:40:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZol-000000056Co-3xRG;
	Wed, 23 Jul 2025 13:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A16A5C62BA;
	Wed, 23 Jul 2025 13:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21E6C4CEE7;
	Wed, 23 Jul 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753278454;
	bh=e4iFmU4V8FdSQBveMXcP7eTilC+19QO83wN4KtTy+Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eY8CsQHbcb2OswoT+ggFsv3c+SKfn4phee/f3jbk8YITne+7vWAvq+pKn+v41trYZ
	 U6D+J+cibmnR0ZmBIszGLK9iU0OpXJuqBvH4y9Q0VJPGoQpOIA1zKDYP6ekqBERbDs
	 QugPrw354rRa7o4rZZl7+YOJhT+wR0D2wY+tCaMLp17pDUPCumTsY7frUR4SUpOdAz
	 NhMOBTZBPhuPXa/zUdu33rGWB/BYMSw6VLUkTST4KNKSZlc6m0gZ0Uw+jkHkOCiP7g
	 QWHKnGcoWcxJf0LXcEpTS1HUvhCKP+60Sq3a93WUft148wYpbv3D1+0k5FGG+gd85N
	 v9kXkk5W1rxuA==
Date: Wed, 23 Jul 2025 08:47:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, Andy Shevchenko <andy@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Cameron <jic23@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-rockchip@lists.infradead.org,
	David Lechner <dlechner@baylibre.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: iio: adc: rockchip-saradc: Allow use
 of a power-domain
Message-ID: <175327845184.2145175.4601554796265618767.robh@kernel.org>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
 <20250723085654.2273324-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723085654.2273324-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_064736_023979_03AF821C 
X-CRM114-Status: GOOD (  14.88  )
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


On Wed, 23 Jul 2025 08:56:45 +0000, Jonas Karlman wrote:
> The SARADC controller in most Rockchip SoCs are part of power domains
> that are always powered on, i.e. PD_BUS or PD_PERI. These always powered
> on power domains have typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the power domain of the
> SARADC controller.
> 
> On RK3528 the SARADC controller is part of the PD_VPU power domain.
> 
> Add support to describe an optional power-domains for the SARADC
> controller in Rockchip SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: Update commit message
> ---
>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


