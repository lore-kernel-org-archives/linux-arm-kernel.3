Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9261CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANhd86iuOMKoE/StQvz9g8L6r6QbejOrNXlH1hXjy9I=; b=LQl+96JtETw4ZRa3UWI5sw3aVi
	tvwR1j9QupwaOQiuYX+jp1FiKrXePxsjiY/A3oFr5QVYAarEPhzIeQp+ZCaU089dq47ANtUAeMN8n
	oHWKkjQ5UxrRiaTblkq+dGLOqG+kQf9SVn33D/M2ET4212PPOBxX1lrmT8M9evFq4VEgAXbeN86I/
	jPh3+4U7dsl31rsiMJAwClJ7CiQ7Vsmz4jk464ThGd0xYa8O5zXA/waoxfpfVFaX0RTlFCwbNxQBr
	9PZZY581nB33Qm7AazaEd4tp9W2sYEkoCGW9HMvfijsK516W78hZwCoZk67QKqFaIk2pnJd1GNopg
	4YcgNLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLtX-0000000AVMy-28zG;
	Tue, 19 Aug 2025 12:56:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK5g-0000000ACxz-0QgK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D35594626A;
	Tue, 19 Aug 2025 11:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F9BC19423;
	Tue, 19 Aug 2025 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601279;
	bh=3om6RlJ1FrtuQO9/XxQ8KBEG17jf3kejVcBwwMOA+mM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lxezlpTQ1VJxdf0sF3n0/rnCC5CGmWaOdQERGWLOLzdxQ0gwflpmXEjxaoGoiJNaq
	 LRMvTWMmc7D1V7y9qdS+Qui5fhozl713FNJQAFfUZtJLLO/husIrdEc8BHU8nnwNk1
	 5H/Ux+E9/4IO43soMLS6pxKTNHeZdO1J7OfpSWV/uzDrSeDEw2/SW7jR+0PwUiBP9R
	 oENsFr/qSfrkwcWjvtFas+aQeYLpyr+/GSj4NNbXEsj8K8O5EHpYQGz54DY1Gu+RBU
	 XAM6yMaMK9KJ2/0QK2MFHgHM7HyRSO0R0DobKAnTonjmydQqwnmSXRVbt6c58NKc6V
	 fuv+SzbfqA9eg==
Date: Tue, 19 Aug 2025 06:01:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 David Airlie <airlied@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-5-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-5-04153978ebdb@foss.st.com>
Message-Id: <175560127275.3969236.2787022865949537210.robh@kernel.org>
Subject: Re: [PATCH v3 05/13] dt-bindings: display: st,stm32mp25-lvds: add
 power-domains property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_040120_162794_3DEF1895 
X-CRM114-Status: GOOD (  10.97  )
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


On Tue, 19 Aug 2025 11:15:58 +0200, Raphael Gallais-Pou wrote:
> STM32 LVDS peripheral may be in a power domain.  Allow an optional
> single 'power-domains' entry for STM32 LVDS devices.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-5-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


