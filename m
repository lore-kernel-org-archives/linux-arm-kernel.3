Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEB3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 20:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvUwPIh9VPd6kcQWqJtK7lvD8VOUbLFS4mVz8YD95rs=; b=xXHU+/QH92llwZqDbUNtGUeibL
	f/MmlkUgGt4g0Rm3cUD1QZic94AE4ZFVnNHFhoOpJhy1JZy4Vr7LQsln0SSKWrFHbS70Zh/ldZi/N
	e8wq5IE9NaICcHdvaXes+czhg58Xwuj95hHdQBDi+6ukgaV2Aakt3DlxcuzD3TLuQpNc0SqQsfbop
	/pGBsO6f5mjYBAzhjKIPP6+Aip8mLGBqrWn4RK08O73nsvalQPSw+RmR0vLYE6cIRQXvDcjtU4EO8
	GVZZ2eGGHXHTEVT0Jbz5UGlaIELh0naAR1sDwlULXFXq0XchHiP1jwDqPRKNcNNpwqZ9t5suykmt1
	C9fkBm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr0MM-0000000H7wo-0Fsb;
	Sat, 08 Mar 2025 20:01:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr0Ki-0000000H7oy-2F2B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 19:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C72B5A45A7B;
	Sat,  8 Mar 2025 19:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5CDC4CEE0;
	Sat,  8 Mar 2025 19:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741463978;
	bh=x3E1fq8IZUwU/fUF2C5GTmbaJW+Wcl0XpQM85Bz+Stg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hkLZMjRUhZKV6eypsedqDvbQn7W1IHnBcglKkq/TE5/sFLtFpOheLF6YwiqIzy/9d
	 reFkhemx4IRp/QKuwZXOGfn3ACLxmKqii8mD/5F9Fk/kRySyD+yk1Zi3a54/Z7piU/
	 +vQjmu6fqSFGluVC94BAGLKsQs+WUZ7FWol7WwoHzr9CIxC+JyAaNA8+XoocHR+4M8
	 WZxWCwk8GrNM7KFNIwbK+saC16tHOFij1wRXem+E0XOM/RZxn2v4wLfVqjnsA+HGoo
	 oJIWGgqLxyz2ctbI7vlOw6dGHsHCq7kmZVQUXVa09oWQ35m5OyNjet/t44zRZf+MTs
	 YLZrMGE3ieZ7g==
Date: Sat, 08 Mar 2025 13:59:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Eric Biggers <ebiggers@google.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Ihor Matushchak <ihor.matushchak@foobox.net>, 
 Ricardo Ribalda <ribalda@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-staging@lists.linux.dev, 
 Tommaso Merciai <tomm.merciai@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250308183410.3013996-20-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-20-demonsingur@gmail.com>
Message-Id: <174146397700.3496940.17285353944853657369.robh@kernel.org>
Subject: Re: [RFC PATCH 19/24] dt-bindings: media: i2c: max96712: add
 support for POC supplies
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_115940_698569_ACDF8730 
X-CRM114-Status: GOOD (  13.19  )
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


On Sat, 08 Mar 2025 20:33:48 +0200, Cosmin Tanislav wrote:
> The GMSL links can carry power to the serializer when using coaxial
> cables.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: patternProperties: 'port[0-3]-poc-supply' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308183410.3013996-20-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


