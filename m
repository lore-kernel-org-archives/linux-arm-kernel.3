Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58905C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmtecQnIMS1fJRzr1dQP71EddgymiTHZnMB1cAhWMdY=; b=CqoG1YM2zIUxwlYaQpmS23Tgl1
	B6+YDRQM00uL7/0n5OKSl0kQqMn5TDAV9aKD8aulep762TrtGop5FQl7kNdIxoGYh4LDO4Sed4DCD
	4SyrkJnk9ytffjDi3mA8j+94Pp6YSSaaM15ugTukI42UhE0s3B4u4/BFRJ2LqynQYIRFdwbnB4uGI
	/zYT0lsz3jb8bcY2jHgeR7tb5Hla2kWVKJlpMgCjpDxzHH4hy1Agw4xYg2tIoe55M5HMSAYRzWiqU
	9+UMCZ1po+MVPd6d1nKMp+uY+RHCixX9xQm0x1o5IRcTYurr0gh8eTaESFqpiWIIQ/L2dTc4QXvE7
	gGTlOPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4oV-00000006hOn-3gHs;
	Tue, 11 Mar 2025 18:58:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4kE-00000006gsc-0gYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FD3DA460CD;
	Tue, 11 Mar 2025 18:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CABC4CEE9;
	Tue, 11 Mar 2025 18:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719264;
	bh=DkxbPGCo5A/e7lDRlK6FKH/uxZlqGSzRqfvmnVsyDRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTDlUznVD4Cj7FZ/kaNJUVwzonfwXS0c1KgC58c+1coh7IMQFvCkz3vbJ/U8udX+M
	 9oSXhuPOzssLUsV9aiIG4Q3dywrNW9JkLNscaearhpYFtQgboZBChhYoS4VzwrnD77
	 ARbSi3erLuagq9m13Joh9cXbMc2GB+B7ZIELq1PlsZX+zfX94eDTtoJ5BSduYFjcgW
	 5ko5NRDgQdlL1e1LUnJBWovGDwI+NLhi08i7aXN/dT/szi0MnDc1CQuIEy33vmDpqT
	 Pu9YwP62K8bBjNeXbnsKNF0cw2lKUe+gDfWfJteCVcNbNU88PPY528WARi06hRQoSV
	 9EPO71I7F9yow==
Date: Tue, 11 Mar 2025 13:54:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ross Burton <ross.burton@arm.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Will Deacon <will@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [RFC PATCH v2 07/16] dt-bindings: media: i2c: max96712: add
 myself as maintainer
Message-ID: <174171926101.3971802.12167410956543937006.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-8-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-8-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_115426_267159_5F3283AA 
X-CRM114-Status: GOOD (  12.20  )
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


On Sun, 09 Mar 2025 10:47:59 +0200, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


