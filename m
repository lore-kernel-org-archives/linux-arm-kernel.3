Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE71C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRbojd9gT1Od8I02eNTr1okTpSsGxNJLz46AeyjgNRA=; b=rMkLoy8NnV7BEswWGnM1E04il9
	OfW/8Vtvn2bjcVGI/VNFNA/rFmAM8ZNdnEpB5LzB+FkHnquRLAflFBJKUy7XbG8T4Jjp5QmtGGFfg
	aFdXg/70y4gVYCS1Zlw9lhU59/6NmUM6aDrC1HrqKWx8BfMBguAEK8Nn44o5Fa6yCeABchjuhnHMy
	3KtL2cBafcltc0qDAPxoKsNSw5m7HOH6AbcvASfHhqFcN/ZX/W6fb1JY3aJlMPqqC6j7RmAPZqIB6
	EEOjl8PXzGxI7QzaSb8wsVcF/Q6+5nQ04eQv0K07cvIpOozdMUr5hLk1kNMx1uImtWYMkKmnSxba1
	xMw2GqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUONm-00000008UUG-1bM4;
	Wed, 25 Jun 2025 11:33:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNSr-00000008KIp-2efx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oRbojd9gT1Od8I02eNTr1okTpSsGxNJLz46AeyjgNRA=; b=crQyrhFmSDuhafvLikK7y4EdMy
	ifj+isCkb3c0ZE3gI6TTfScaOm8gb92LPTZgyvPas9KutCIJHVY8PW0wMpMI+ViNn0IPRkWdaT2cA
	sZaCikP8TE3la7waefYyVuhPvN8WoRPkoZAI0xU1PNLYV++GL/AEYUc02QOWSaI8CA3iygCJ2a+5c
	6m53F+s7kI8gkbWGcjM4HnABmsmkPIRYKvmYlKCUHQOIY2wZhPGYrtjxJHi9KCdl8gzhxdKsICm8o
	9tlVbChIVNPAEevkueYX7AtEYjjbrZ98OFvxfY75/BOxSAuSKtrFzYRoc0jfILYDv7jPZSOsRPfUU
	1DI+6AmQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNSp-00000005msk-0euh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:34:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUNSO-0007Kd-Gq; Wed, 25 Jun 2025 12:34:20 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUNSO-005GSi-08;
	Wed, 25 Jun 2025 12:34:20 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUNSN-00H7jR-2z;
	Wed, 25 Jun 2025 12:34:19 +0200
Date: Wed, 25 Jun 2025 12:34:19 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-doc@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <20250625103419.h32apyxfjztpoi7k@pengutronix.de>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113447_228190_0B2F58BE 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Pankaj,

thank you for the patchset and sorry for jumping late.

On 25-06-19, Pankaj Gupta wrote:

...
> ---
> Pankaj Gupta (7):
>       Documentation/firmware: add imx/se to other_interfaces
>       dt-bindings: arm: fsl: add imx-se-fw binding doc
>       firmware: imx: add driver for NXP EdgeLock Enclave
>       firmware: imx: device context dedicated to priv
>       firmware: drivers: imx: adds miscdev

I didn't had the time for a detailed review but the patches3-5 (e.g. all
firmware: *) can be squashed. In patch3 you add a set of files which
you're going to patch in patch4 and patch5.

Please have a look at my comment on patch3.

Regards,
  Marco

>       arm64: dts: imx8ulp: add secure enclave node
>       arm64: dts: imx8ulp-evk: add reserved memory property
> 
>  Documentation/ABI/testing/se-cdev                  |   43 +
>  .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 ++
>  .../driver-api/firmware/other_interfaces.rst       |  123 +++
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   12 +-
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   11 +-
>  drivers/firmware/imx/Kconfig                       |   13 +
>  drivers/firmware/imx/Makefile                      |    2 +
>  drivers/firmware/imx/ele_base_msg.c                |  269 +++++
>  drivers/firmware/imx/ele_base_msg.h                |   95 ++
>  drivers/firmware/imx/ele_common.c                  |  354 ++++++
>  drivers/firmware/imx/ele_common.h                  |   49 +
>  drivers/firmware/imx/se_ctrl.c                     | 1145 ++++++++++++++++++++
>  drivers/firmware/imx/se_ctrl.h                     |  128 +++
>  include/linux/firmware/imx/se_api.h                |   14 +
>  include/uapi/linux/se_ioctl.h                      |   97 ++
>  15 files changed, 2443 insertions(+), 3 deletions(-)
> ---
> base-commit: 9e9eef5925a5d2b1938484c4edc906e384145959
> change-id: 20240507-imx-se-if-a40055093dc6
> 
> Best regards,
> -- 
> Pankaj Gupta <pankaj.gupta@nxp.com>
> 
> 
> 

