Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAC9C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+GPbXocn+GZt51EEEnfn5JN7h4RZgrIn1M7Ie3K7Kw=; b=TlAA7rh7ygdGrN1Zd8p0BSeuOO
	4rdGdvWwp8Sy6Bg2gn8+Jh6HehzKsE6rKTwJsUFRs3zFujGWRCPIY8n7Bk7ZclU0ddJ4/YRhamtw/
	iB6ZoUN0ib4l5YlNUCn5+1ZJRjwiDPdOTvXNJc5eWMOh/nJr47kmZKOB6ewwrLw3woG+Bm+b9LHNX
	AbF5MvPXUj0cY/J7IYcI9BlaENWNr08vV14PvXi4koYT06sV+4YZfy7kEIeUDTpt8wuA3uq+QoX1W
	tCv96fplbZc/vxiZYSD4emjpFanB7rmHrFPcR/9CR/UYr1uKUyGjmF/cZPnPEc4W1lHaJKjcXI4sn
	A11FS0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5ce-00000006psy-382d;
	Tue, 11 Mar 2025 19:50:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4N6-00000006d4l-1T7Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A5B2A460F6;
	Tue, 11 Mar 2025 18:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D87C4CEEB;
	Tue, 11 Mar 2025 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741717831;
	bh=LfsP1qD1UixHyLWZ+BVqcc7KJb/AoO47XMtQU9zN91U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5w30VCq3PkMpKSWE5/3EWYD1W9vpCIoatlFxl35rE5UabEOZHWhQ//an4RBbs72V
	 tOiAdDKyID0cT0PqoSo+FBxKHjNjH9+zcUjtE8+pCCuOxCwiKNRmU588sNAJSfUX7u
	 CmSrBZUENaNraghVqc4b4ROIRXnfI2ARvCDLVaKR3peh2O01RYTm1C3QAFgkzQvZOi
	 j45PaaT32l5jMyIxeohinGAQ9Sqm/1iSEuh5btVnz5LFKGU3+l/Mp5TgWA1i57hSe2
	 zvBuAu0q1jCBR5o0+5AvNQhKeTNjbPE92gBmHklCugPBSjzvSwssXnPv4eB0UtoDa9
	 W4aJl288c7wug==
Date: Tue, 11 Mar 2025 13:28:13 -0500
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
Subject: Re: [RFC PATCH v2 05/16] dt-bindings: media: i2c: max96717: add
 support for MAX9295A
Message-ID: <20250311182813.GA3934398-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-6-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-6-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_113032_506618_C595A1EC 
X-CRM114-Status: GOOD (  17.93  )
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

On Sun, Mar 09, 2025 at 10:47:57AM +0200, Cosmin Tanislav wrote:
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
> 
> Document the compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 0a43582168a8..31fb62debdc7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -24,11 +24,14 @@ description:
>  
>    The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
>    forward direction and 187.5Mbps in the reverse direction.
> +
>    MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
> +  MAX9295A only supports pixel mode.
>  
>  properties:
>    compatible:
>      oneOf:
> +      - const: maxim,max9295a
>        - const: maxim,max96717f

Make these 2 a single 'enum'.

>        - items:
>            - enum:
> -- 
> 2.48.1
> 

