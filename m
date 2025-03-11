Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF810C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dl1JWfYJOg72EaaV3ldWA/0rrmYP/fUTPGuYqr0ndJY=; b=tGAV1bIj14WxQjqAaVSAxNUAcB
	YuiM+k9c0kSR0EkRs2acdkhUHa6yTTsglPQ7o2nUJUSmfHofTz/0MDJ7bGbor+gUOHoiTDBEKAhgJ
	H+SP4iKHScABULErgkwlZ49+PzTpE8LfaT+PajwJfp+60tT9N0nAr6IutHY0hU3UT001mWMoH7r4o
	+RFsRKYoJUUiOSTcHXrUpeVtJGHRSh3EdB9/a9Le/QlM7WaWykWnl207xRG2hIgJpY9DvPmEMNZEO
	9S+8Wdjv6HQBkcee2SfukX9dO+gn3RpYlXaaI+CkdeSvH48QMPn6h149V7DQ6Q9vcjWJKLGIW7fJM
	UfFDo+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2VD-00000006L7C-4B2n;
	Tue, 11 Mar 2025 16:30:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2S2-00000006Kk8-4BW1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:27:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223594b3c6dso103466645ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741710449; x=1742315249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dl1JWfYJOg72EaaV3ldWA/0rrmYP/fUTPGuYqr0ndJY=;
        b=xDfPOpk2Vp8C6voGab93lSPnkffcG3yG02RYar4bJIF2ceowbvbdhKBIo3G5/2Sm0C
         1qZ57ULnYPZBPuH1ZyTnElgNyARGX/Qb4spzK4Ir2JsWqx2zIjniNexYy95k1ZnrRQD/
         dZ3bGZI2IwufM+BJnbbd+As4MPfwP38bFf7Oploks0McN60CwLEHZghswTrXwHH5md4c
         zSsFKYdRaJ0e1EBQSH1YwBWy3fJNVNlhxXz9b3chkkQNVlECX2I6tMe036q1+kr3H1pM
         AbN8CjF9lXuzbqfbO6AIuXPw7wR/aQ9pRUmezTzqNEfI7R0jtHmiJunJAapcp/pi7/JW
         X1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710449; x=1742315249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dl1JWfYJOg72EaaV3ldWA/0rrmYP/fUTPGuYqr0ndJY=;
        b=mi1U+BQVRGWDTBv5OYVFVQZwJ9IxjWFc8EFNPgt8R2sfAeuiA/Umy8tqi5Xo6bdRBV
         +UxIkcokMTMx4ezZki1Xhc496K+Yg7sodg8uAyzqXPKmocYMr3KZX6CHvkAzu0ysPmx2
         5EAnxJnck0TvAuQNBE6p28iv1qmwuPqMSn5MhK6gixswReXn61h+ax6hFWFZQcT3U/sn
         gBVlW5DiKpf5D6JrHBcyhj+c11xCRSeDxWGP2gxQDhxOvPIi4rjyjRknzth31AjJWAld
         QQcXUglirFai1PG2nZxk9pIhu4gVw4CM6xltl82x9sWzIaFGte0298K4k8YojJ3VIv6Y
         393g==
X-Forwarded-Encrypted: i=1; AJvYcCXEVfxswRN2jNPkYjBTN49h8A2VF/g9wrzzLTnJPBqbrYjFRv0pnHbszh26cD6xLREiVLUOeSiAi4XtKi/zBlju@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7NCiYrD9dnfNGgrRDvQymP9PKx3mbunPRInzvS52E5C5LrD7q
	Zct1zlfBwjPR3Q/wO2I6N1gWk++0OGl1ldWB3qCJQsI0xrhLdlKjoQCPTt/mfs0=
X-Gm-Gg: ASbGncseSlMHrpWFaaC9keriRMPo3nfIFXpWnuSrG0Nuh86swZvg1cm0GDtneQcuEdC
	PcDJNEUURT4WRJpiBzQu5brHdpf8E0WegVOD1uwiBqao5/lKi+GC7QMSoefJ5GQNq4yvzscwtA+
	7OC0AmIHVQwcPR8OMgrRd1GTrxRZDjFP86ehyl9frl2VmEDeLp7jQycGCIT87aUoifyuUrDMDhs
	hFFswcTFYQp7WGHIhRp+bOWQ8ANr1bHVHA20pNLIZ3nLVqn5mKYhCteMMsl9GHPYCQZ1RBKZzNr
	HDgpWtq6YtbFcyV4ZAgVjmitCwyL2YLmnuEiXYWy3XA4YJ7s
X-Google-Smtp-Source: AGHT+IF2UG2Kdovm4QQZtJqBjJbgL9SWkVL1VlYQjoRQyWIygr7zZtU2BIqigowT+nJo0KVbHMcrnA==
X-Received: by 2002:a17:903:32c2:b0:224:1074:6393 with SMTP id d9443c01a7336-22428bffe92mr243601665ad.43.1741710449034;
        Tue, 11 Mar 2025 09:27:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff32:9486:a333:ba9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e948asm100400365ad.75.2025.03.11.09.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:27:28 -0700 (PDT)
Date: Tue, 11 Mar 2025 10:27:25 -0600
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
Message-ID: <Z9BkbVHlx60VFD7q@p14s>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_092731_040358_F8100B53 
X-CRM114-Status: GOOD (  32.18  )
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

Thanks for the re-spin.  I will wait for Shawn and Sascha to review their
respective bits before picking up this set.

Mathieu

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
> 
> -- 
> 2.43.0
> 

