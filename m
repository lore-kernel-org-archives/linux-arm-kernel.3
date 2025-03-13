Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFDBC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dk/KVdNUO+2NCTC/VAHji5cbX9MUum8KYD6NkCMODY=; b=T5kxuB9sRzF//Iydpg/zYcl3pZ
	9o0afuDKCWDefZLH6eALEmtxzU6whqXt7Xxiydt1zNpqkubuvbM9hYwnEfKd7CdV2VG2OID4gX0X4
	fDwwEk785HmdddUcUp4by04YqEnE+oCaKpYTlZbdL9qD7uKGNPebTOya539z+uRvryRq+kFiSk1lh
	tJ4VHxSXwgGdqLQ1LgO/VmbtkXA0+gZWPJPqNATdXbE1wh/m4gvvq5S+bQwK+gjI10eEJZpbn3sLO
	8LlneeN78wohHAAeJL+qyTrTzXmTiiz5u/i9iqBt3n+KI6awNS2dkIL4XE2RbnfRgQmqP0f/dhbmd
	KDS4R5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsl1C-0000000BjxX-1cXs;
	Thu, 13 Mar 2025 16:02:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsklq-0000000Bhia-3TEm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 15:46:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-223f4c06e9fso22121635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741880813; x=1742485613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dk/KVdNUO+2NCTC/VAHji5cbX9MUum8KYD6NkCMODY=;
        b=irc+A9F2Rx79aIsM3dqN+jSZAJ0g10zSuqpPysEfY0pAggiBXJEh5MqckWWPA6G62X
         ciiQb2ems3y6MUHoPAYuMaEn29US5zknwWOb0bR2GvUrWO++Rue5UHvRl8yhzfJeTOTv
         5J5Lb4WTA8+6yxVL/Fg22qsWVqs5UL4caxUU83xqAHQ3LUsBsyoAD/9XHU385QFUBBy3
         icrH2luMzqT8fcgfwzq31Xlai23DBTFQjE+oIOlvqft9zVDe5JUpugKhP2V/cTMdvj8p
         6GTDpWXC2Z5HXDcpRDOQsQelWXRw2UNCKuqxg+Br5jwny0ZbVkjvnGR33SE18YTY8xMT
         7tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880813; x=1742485613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dk/KVdNUO+2NCTC/VAHji5cbX9MUum8KYD6NkCMODY=;
        b=uPXW3lpyFOJL4WQoNmWlWONm5v8/LE80TWqcajFWJa7x0xoYaglB8mXODM9b5E2CQ4
         LlmaiXu6NPxnk2FnDOuf7cdsblFjNxTQHwaVT9nwM2uLGICX5dBMfiNRmzXVfuua5+YG
         5U8hiLce1Ps2U1ijRmS7nEvUvcJuoK3jaX6wyBuWjwXwVFxsj8rxy+IPuPQXvKqSH36d
         WkoV+kSSg+0PpvX1kj3w5el1GqvkP5rd1oM6wgGbJuECH5lYI4LKcwIGi+VMpP6G+q0b
         VmfNLRPfnQuYH7GitF0uOPGCJmVL4nthluyAOkhymQrgOD0jCjsWj9CK1X5MPal6JL9t
         svNA==
X-Forwarded-Encrypted: i=1; AJvYcCUC6CDp7gPVfLQ9yFbVHn4Z9udKDYiVkopCw+M5ONIOjoVPwRGoXzXOQjdeWVxwy77lkZd1scsTAeDvyaM68KH4@lists.infradead.org
X-Gm-Message-State: AOJu0YxXrw5qRZQpAJi/9E8F8r2CnfQYMnwiN1Hrrb2afAbomfdtK1bc
	d/eVawRIRR0XcEJM94m9McbZ6+BYlRCsXHdyTbEA8gWHudip7HcGx+UPAYfwd8o=
X-Gm-Gg: ASbGncsNZoD22qe7HOS6eecgxcfLlc8LCnnCQbKPqWcWu1kTfFvEcHe+46+uSYi/yBt
	bknsWB0bsYGshS8adPb0dQm44wfDflfhOFT+ipaqnuC+0Uo8O0jG2lFVtOrcIypLrJ85MnOL8ex
	hY7I4C+5fWg7eE2NuFj8QsbtVM8TsHG8hTuP8j6qDzW4RQcUvv5ymIht4Dl7TFivJeSDIqlcfyT
	/WaHyJVV1j/bJZb+fc3gQwxIfrdSa9/QpytRH8TIjUKXITjnfYUaD1dUHMR01yRgRJQrgkuW4BG
	b0vssLuxAp0d2Y9F6tRoclNeN1rQ92iKP7NETIDDxVZOQ3dXfi3uGdy2ZKs=
X-Google-Smtp-Source: AGHT+IHmhKUWmuw5hxmGn5MltXhJp+mOVpY2OPHTTEaVO3b51JPFYbzscOBmXvFxMsGPCnOFc7K2lg==
X-Received: by 2002:a17:903:3d03:b0:223:5187:a886 with SMTP id d9443c01a7336-225c66a7cb6mr49221535ad.22.1741880813496;
        Thu, 13 Mar 2025 08:46:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:46d2:1635:3673:c3f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba710dsm14851215ad.128.2025.03.13.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:46:52 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:46:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	shawnguo@kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	Frank.Li@nxp.com, peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Subject: Re: [PATCH v5 0/8] imx8mp: Add support to Run/Stall DSP via reset API
Message-ID: <Z9L96ssnL1S5z7rb@p14s>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_084654_890851_A1AA03E9 
X-CRM114-Status: GOOD (  33.28  )
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

On Tue, Mar 11, 2025 at 10:58:03AM +0200, Daniel Baluta wrote:
> This patch series adds support to control the Run/Stall DSP bits found on
> i.MX8MP via the reset controller API instead of using the syscon API.
> 
> DSP found on i.MX8MP doesn't have a direct reset line so according to hardware
> design team in order to handle assert/deassert/reset functionality we
> need to use a combination of control bits from two modules.
> 
> Audio block control module:
> 	- for Run/Stall control bits of the DSP
> 
> Debug Access Port (DAP)
> 	- for Software Reset via IMX8M_DAP_PWRCTL register
> 
> The current implementation for IMX DSP Remotproc driver and for Sound Open
> Firmware driver (already upstream) uses the following approach:
> 	- maps the Audio Block Control address via syscon API through
>           the fsl,dsp-ctrl property of the dsp node.
> 	- maps the DAP address space using directly a call to ioremap
>           with IMX8M_DAP_DEBUG macro depicting the DAP base address.
> 
> The both approaches are problematic when comes to describing the address
> spaces via the DT:
> 	- for Audio Block Control, because it uses the syscon interface
> 	- for DAP because it hardcodes de base address instead of using a dt node.
> 
> This patch series aims to fix the Audio Block control usage of the
> syscon interface and replace it with Reset Controller interface.
> 
> Main advantages of using the Reset Controller API is that we stop
> abusing the syscon interface, offer a better probe ordering, PM runtime
> support. Main critique of using the Reset Controller API is that
> Run/Stall bits are not reset bits (but according the hardware design
> team they are part of the reset proccess since there is no real reset
> line).
> 
> Initial discussion is here:
> https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/
> 
> Note that we can safely remove the fsl,dsp-ctrl property usage from IMX DSP
> remoteproc driver because there is no Device Tree users.
> 
> Changes since v4:
> https://lore.kernel.org/lkml/20250305100037.373782-3-daniel.baluta@nxp.com/T/
> 	- picked-up R-b tags from Frank Li and Peng Fan
> 	- reworded commit message of patch 8/8 as per Mathieu Poirier suggestion
> 
> Changes since v3:
> https://lore.kernel.org/linux-arm-kernel/20250225102005.408773-5-daniel.baluta@nxp.com/T/
> 	- renamed resets ids as per Philipp comments
> 	- add boths resets (named them runstall and softreset) as per Philipp comments
> 
> Changes since v2:
> (https://lore.kernel.org/lkml/Z7ZNngd3wtJ5MZgl@lizhi-Precision-Tower-5810/T/)
>         - picked R-b and A-b tags
>         - use run_stall instead of reset to refer to reset controller
>           instance
>         - remove 'resets' description as it is a common property
>         - add correct include in the yaml dts snippet example
> Changes since v1:
> (https://lore.kernel.org/imx/20250219030809.GD6537@nxa18884-linux/T/)
>         - addresed comments received on v1
>         - picked up R-b and A-b tags
> 
> Daniel Baluta (8):
>   dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
>   dt-bindings: dsp: fsl,dsp: Add resets property
>   arm64: dts: imx8mp: Use resets property
>   reset: imx8mp-audiomix: Add prefix for internal macro
>   reset: imx8mp-audiomix: Prepare the code for more reset bits
>   reset: imx8mp-audiomix: Introduce active_low configuration option
>   reset: imx8mp-audiomix: Add support for DSP run/stall
>   imx_dsp_rproc: Use reset controller API to control the DSP
> 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 +++++-
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  3 +
>  drivers/remoteproc/imx_dsp_rproc.c            | 25 ++++--
>  drivers/remoteproc/imx_rproc.h                |  2 +
>  drivers/reset/reset-imx8mp-audiomix.c         | 78 +++++++++++++------
>  .../dt-bindings/reset/imx8mp-reset-audiomix.h | 13 ++++
>  6 files changed, 114 insertions(+), 31 deletions(-)
>  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h

Other than patch 3 for which I haven't received a Reviewed-by, I have applied
this set.

Thanks,
Mathieu

> 
> -- 
> 2.43.0
> 

