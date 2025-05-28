Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30463C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L71x5+rSvPj1zJezK3dif32i9JkRazX441gdrufRFrA=; b=RTFxrmTqCjq61OUjQfwEy6gPVa
	zcoWf02th9/MHNs4AHNCeKKN8b7FYKlg6sd76+MIc8Q1fjrKg893fIoDQmvUFv6VP9vwzwfZKcNxo
	FloUUWLHayX/mzAPbm6vc/QcxmtLyxf9aJH7zwfIA8X8ktlVUoBlrw/ZaP0PJn7PyAuYFNQ0kg39d
	R2/PVfw5e23hQ9jqPu1LCQFKOyZNNADq6GhTQeApXtN98KkV95JmHfZgmlqC3WX249WMw6rhGfj6U
	bkn26UT9HbF/Tk64UKbcJAnEqFm0f8ZB8iMjcRd4FIAU4eIIOLqLl5DEX4aTWCxxIohKuy8UlHiSQ
	68iUsnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHq9-0000000DPV6-1VIV;
	Wed, 28 May 2025 14:33:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHmg-0000000DP3C-2klG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A21DA49E4C;
	Wed, 28 May 2025 14:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CBFC4CEE3;
	Wed, 28 May 2025 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748442573;
	bh=ubMRziPv811a1c4W27GNJyX/xyPJhyiu/AXagdFgPWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=I7laG2ypimp7SHSqxMa5Zv8dK5qj7rZUUI7/nErluXMBjhHHMSEtM6yvXCbavNUhJ
	 ey5iPZkBWJFk8SdpyOmPE4kc14L+AahhnxT82ig5yydt8ZG7426O9eTfU0PgtGGVRe
	 xxUm5obNaIxguw+DGXasu5SNYMHJKYo3ZwA+moZEIC0Zh1EYIv/kuGIZpD27Mc3PFs
	 S/T8x6XVxdLiEpgBzOnm7N4RHNl+O3rbxGrGNaiysI7sIoqd0AJeh3oRi0giO6QTLq
	 5vjtSN63MVbmCnUuTtCt2hed50uiXtRzJcJndBPHYw5f+w44UAcfR7sRFzPy5iAn6o
	 F4Q1/RWE7qBow==
Date: Wed, 28 May 2025 09:29:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-gpio@vger.kernel.org
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
Message-Id: <174844257180.4036102.7091043043619447480.robh@kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_072934_759137_4DF0E9FB 
X-CRM114-Status: GOOD (  12.32  )
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


On Wed, 28 May 2025 15:30:55 +0200, Clément Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  | 187 +++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl-hdp.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


