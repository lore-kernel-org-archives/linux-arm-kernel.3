Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F80C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5K/GviXxBbz04FRu5qx/Rj90c1ML6GlWoShYPAJk73A=; b=mVltW9M/loR8Thox2TXvFLmAR0
	9gfqrpPn3ThaCZUgL7KuPqwIS/q+/dicx7cNyRi6ylOfBYgrVk5NdChKSOuEg40+r0kuJFxZDHPLv
	Msu2Wcc1JALuEUAxwr3fxcJNs3imeu+klC+22oEDJHsn00TjB4yqNmDj+0l0bb/xmbA9OwG19fP4Q
	wzQBkBf8Y0q+Ltd0uxmO7BXEKpLRHDq6g3LBvk4kPI7rEo0KgoJEocCkDH8YHjF+uwpwRSc/rpJA0
	BeLlCkhaCue6hEpy5EQGTtpg6Qz2nsDsPbBV0QO2M3r4eBfAjcZdzx/A/Lzcm1lMP//Z7g9smO5RO
	BkjupwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkraA-0000000FBOj-2Xhk;
	Wed, 19 Feb 2025 21:26:14 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrSd-0000000F9O7-2lJF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 21:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85C8F611D4;
	Wed, 19 Feb 2025 21:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8BEC4CED1;
	Wed, 19 Feb 2025 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739999906;
	bh=zgChJNf/jNRQQ4Q+zy63+Z2ebjGkQIejxO8cpu9ja64=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ytk9ZN4Nfwb5KfE2wIsscLA2w9BYrtqzRHgMJ7YrVBMdg601+cXGaRNDkSMNiZif/
	 oLzBHncVEM/pt8X9yon0xPE3uAehMpIHrdoED3dL7z83FhwwIThYLQkwWclQcMbF7/
	 8LaFWH/dpMIZgKCOcN1pXi5LTFGHZE8M4OF8O6ghfuGQQEKmSfc/BYEiN8Cr2A8sYB
	 u01BAtD/dQXwvityHrENihfWdCUNeVEuvXp5wRqL/Bzk026J+J6E7b5g2rSyMv4cGu
	 2VRSRFWYVs9PrIRUpVvxGkD4WAAZ7sk6xRBVMLZxE/o0/xkw9V/4vzSABDGoIpPuvt
	 jYMBGdY6sIv3g==
Date: Wed, 19 Feb 2025 15:18:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de, 
 mathieu.poirier@linaro.org, krzk+dt@kernel.org, peng.fan@nxp.com, 
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com, conor+dt@kernel.org, 
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de, 
 shengjiu.wang@nxp.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org, 
 linux-kernel@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20250219192102.423850-3-daniel.baluta@nxp.com>
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-3-daniel.baluta@nxp.com>
Message-Id: <173999990554.2971484.2354660652098932942.robh@kernel.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_131827_755186_452E3B9E 
X-CRM114-Status: GOOD (  14.20  )
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


On Wed, 19 Feb 2025 21:20:56 +0200, Daniel Baluta wrote:
> On i.MX8MP we introduced support for using a reset controller
> to control DSP operation.
> 
> This patch adds reset property which is required for i.MX8MP.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/dsp/fsl,dsp.yaml:183:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/dsp/fsl,dsp.example.dts:85.37-38 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/dsp/fsl,dsp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250219192102.423850-3-daniel.baluta@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


