Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE44C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0n3Hxx6AcSdKBEDC7IEQI2B7OoivvEBc8Agy5phMAiU=; b=gFAUnetBHvPzAK75yzbfem5jAR
	ZkzJCdbSe9AYvNmpCxPtGcVxaTGO2v87pei8MVhFpAESB5TPIcZhCHN3buh4jKB11b8Ni0dPPD/L3
	DOc+GgARkYW1Z9yGSSjFanucnDLpOEgGgLxmGR59uAaVh4F8Y9WAAalQMFvQIycpT4c3ieMaL1KE/
	uzsCVApAqZfvRq2c2A8ynTP5qjmZLyznOZ+wC7gIJe4t//8s7MtQUp8U5wCSSf4LTOBP0EwcU0DpN
	zA7pJzAZJsdCVMEtdAC5lEKb+SPJBqZwjTJjdqujbs8hkjZlPH8h+3gFXf5gcLdzQRzESDnStD3H8
	2yXBakkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Jk-00000006cY9-3BPw;
	Tue, 11 Mar 2025 18:27:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts42S-00000006ZIa-3Wi8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:09:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4CC5A45FF8;
	Tue, 11 Mar 2025 18:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35008C4CEE9;
	Tue, 11 Mar 2025 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716551;
	bh=rkr+MYPP/xd4K2DHcaPS2KuUJTGBzM0NtVFOM7N1J1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gbn9Y5lbkjZe040Ba/4mIfjbFEbAzel6Rd2OdFOpWJjJT4fLwpdUd89Bsr96l23hG
	 jPS168nV34DkfYi0pUd0M/2EJ6XsvRINQmAsA8Pa0TSjNYyzCi4akzTtXaNYb7bFOv
	 WGaLCiiYrbS/GmIj7MHEMBRF2jDYSxGqYxkXxiUoV4OffWyG7vIzH2iXux6dH0ZTuk
	 CpWBof+b4Gz/SBIKX7N3a920OmnOxaQzH9W1n1pKRHdzHmYcVMq7pXge2NZo72QNN+
	 EWavL6vNwlmv/Mn8u8JvT2jBppi/PPstPkWl7D5LwImIcostcp+YJt8dlSKcFtxSsk
	 3oay5uSIki0cA==
Date: Tue, 11 Mar 2025 13:09:09 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/16] dt-bindings: media: i2c: max96717: reflow
 text
Message-ID: <20250311180909.GA3915230-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-3-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-3-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110912_998268_49932FF6 
X-CRM114-Status: GOOD (  21.17  )
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

On Sun, Mar 09, 2025 at 10:47:54AM +0200, Cosmin Tanislav wrote:
> This text is using weird line lengths. Fix it.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 15ab37702a92..1026678a17a7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -12,16 +12,15 @@ maintainers:
>    - Cosmin Tanislav <cosmin.tanislav@analog.com>
>  
>  description:

Use '>' token for multiple paragraphs.

> -  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
> -  into GMSL2 serial outputs. The device allows the GMSL2 link to
> -  simultaneously transmit bidirectional control-channel data while forward
> -  video transmissions are in progress. The MAX96717 can connect to one
> -  remotely located deserializer using industry-standard coax or STP
> -  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
> -  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
> -  data received by the serializer.
> -  The MAX96717 supports Reference Over Reverse (channel),
> -  to generate a clock output for the sensor from the GMSL reverse channel.
> +  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input into GMSL2
> +  serial outputs. The device allows the GMSL2 link to simultaneously transmit
> +  bidirectional control-channel data while forward video transmissions are in
> +  progress. The MAX96717 can connect to one remotely located deserializer using
> +  industry-standard coax or STP interconnects. The device cans operate in pixel
> +  or tunnel mode. In pixel mode the MAX96717 can select the MIPI datatype, while
> +  the tunnel mode forward all the MIPI data received by the serializer.

> +  The MAX96717 supports Reference Over Reverse (channel), to generate a clock
> +  output for the sensor from the GMSL reverse channel.

Is this a separate paragraph? If not, the wrapping is not right. If so, 
then needs a blank line in between.

>  
>    The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
>    forward direction and 187.5Mbps in the reverse direction.
> -- 
> 2.48.1
> 

