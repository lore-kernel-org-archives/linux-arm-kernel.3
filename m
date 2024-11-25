Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3656D58D64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uu1HvUfSrpRomNkhLkLbzkzi1c0IK+jy7FSwN77P0wE=; b=i/S6O1U1uLSEdojo0UYTxMdNB6
	CSUUxKzAjq/mT9mzc2StFnMWa7Oo1ah6/0ljmuyLyZZ6UgFtP6tALZqlWuVqy9vaVjb5YYO8fsSVd
	flaM5a9rjzBUKw8KDt43LCdan4dybG+X/iszTWJfvfaRWzhdjk2gQkAacUcN4VBZ1TBSQ5p0TY0V5
	QyLavONI2m36WI2NvyC0xdRGV/0+dz+0NV0q/aMiCFPH9XD7Q2Oox6iNUIsnSTGgqcMSFVVYJRFgB
	ZE144w9usm6ThnQSnIUpiXNeYE8+PyXTCBdVQvAlBeSDVZVSbl+aTRwk/6ZODAODJUhXFyLh6Qhvb
	rJjbHSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbuU-00000008dIP-33qM;
	Mon, 25 Nov 2024 16:26:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbtX-00000008dDT-2EIO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 16:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8DBAA41846;
	Mon, 25 Nov 2024 16:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF32C4CECE;
	Mon, 25 Nov 2024 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732551902;
	bh=8as9MrIKimIX5awXjOc69Muy8ccgrwOcnR9Pg5tg3RM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EceNSwEX+TgJlehZMy7OR8Mq0G+SB+KHvkETI6gMwm7lsCLWo3i/H95qAjrUfR7TS
	 AVD7FZ4FMBTik47of/SlvlGwHhH4WNYHZNVuJBjVXQTDyjTu8TZxaiIiCW0jxte3fQ
	 xqlNZKfqfifAWCDDFVx3RUhMI0Ls9sBDqtd/2QeoooSMbfp4Vd7Pn9+eWZhbD1i7MY
	 rd/BHKJp4cg3vVoiGykMpmwhOI/+RLBqNQ3I/WuW8AQGwYecoqua5rEQeAxo9SeCXb
	 iuIZbE76a4apVquHSR+plzXN5TDKLPpjEbmg79YqOrFnfhy+NTGQWurOtkQm35vl3j
	 hgTPwpn+iSPcQ==
Date: Mon, 25 Nov 2024 10:25:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
 iuliana.prodan@nxp.com, laurentiu.mihalcea@nxp.com, daniel.baluta@gmail.com, 
 devicetree@vger.kernel.org, festevam@gmail.com, conor+dt@kernel.org, 
 aisheng.dong@nxp.com, krzk+dt@kernel.org, s.hauer@pengutronix.de, 
 shawnguo@kernel.org, imx@lists.linux.dev, shengjiu.wang@nxp.com, 
 a.fatoum@pengutronix.de, frank.li@nxp.com, linux-kernel@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20241125152427.136883-5-daniel.baluta@nxp.com>
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
 <20241125152427.136883-5-daniel.baluta@nxp.com>
Message-Id: <173255190049.1879836.4569049791062626285.robh@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: imx8mp: Add syscon
 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_082503_630937_2CDC6DE6 
X-CRM114-Status: GOOD (  13.64  )
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


On Mon, 25 Nov 2024 17:24:24 +0200, Daniel Baluta wrote:
> imx8mp audiomix contains a set of registers used to control
> the DSP.
> 
> The dsp will use this to acquire o reference to audiomix registers
> and handle the registers to control the dsp.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/imx8mp-audiomix.example.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl'] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241125152427.136883-5-daniel.baluta@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


