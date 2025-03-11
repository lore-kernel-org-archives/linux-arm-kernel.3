Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55275C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gToypqwtDuyPyagfrBdRV1qc0yFQHOmboUmLm/cWKIA=; b=itQ1V0oxqk6RIwseXopbmsFBD+
	mInLBUZC68w2fBCiOVlBULoYSk9I+TiidTWBVefYzL6ZlQUgp48yYyWZU7WmWH/R4zZpIRzzGOK1q
	Xt6rNhehIkM+uv2loamba+0IDpkn3jQZJbpMqxpgLoMGfLFugW8Q5aA+IT66ZRRTEVltY6Rbkd7SJ
	FYTLgXMcLb9dGWrguKfUdk5uJfI7fIfGOhhglIvlKj+ic/7fXUt5MBs3tkLVIMMrr54U8LK7Oo4dv
	4LDgkQMyeHeHHsPN0tE1m2uMp6xriNWq7IjZ/yuaX1oydgT3xKSwOYTp12trY6mZTkIyc/U3YWIEP
	PXhEELbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4wd-00000006jLN-1CTP;
	Tue, 11 Mar 2025 19:07:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4rS-00000006hso-0VKW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25C1EA461D0;
	Tue, 11 Mar 2025 18:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8B1C4CEEB;
	Tue, 11 Mar 2025 19:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719713;
	bh=0Nfwq+o/IjqVRo3eRbr8bUtiQdKmbKP077wEPUEz2zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZY6YGXKCb1uTU7OezaPlgZioViMjGooBUqKf89gxYxAHZcGmfZ3cE1abOY6DVPhV
	 GNo8mCd1Ny9tVwPTMbMYlqS6HshemvYMjzUz6krcVB1H6mxaU1jTnF5w6G0BqFD4Oc
	 /Uf1a707YkpBeD23JMUTjRLncrk44MjwbvxLNrcaumDCnD7QPPUShatjz+ocwFNgDU
	 Ypo9/reXpehajLhy9M6h5A02ymO+0FOK+4lXJZ02ql7ZYIkDI0pxFPDL3d0Xuy20Lm
	 qzSoEV233vG9OBiu+i5Q9QHjdxfZdZWC3gRFuwr7e1w6qn+KFJnCmZmU48bEAiQ0oV
	 e0GzyMG7ssSkQ==
Date: Tue, 11 Mar 2025 14:01:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Julien Massot <julien.massot@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Eric Biggers <ebiggers@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-media@vger.kernel.org, Will Deacon <will@kernel.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-staging@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v2 09/16] dt-bindings: media: i2c: max96712: add
 support for I2C MUX
Message-ID: <174171971116.3980957.12739233832407896359.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-10-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-10-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_120154_290101_B7C71092 
X-CRM114-Status: GOOD (  12.88  )
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


On Sun, 09 Mar 2025 10:48:01 +0200, Cosmin Tanislav wrote:
> MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
> capable of connecting to a separate serializer. If these serializers
> have the same CFG pins configuration, they will also have the same I2C
> address, causing conflicts unless the deserializer muxes the I2C
> channels. Moreover, the serializers can have the same hardware attached
> to their respective I2C bus.
> 
> The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
> to facilitate communication to each of the connected serializers.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


