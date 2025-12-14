Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B7AD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyaP5lR+UMf82Qks9pPdWf5XfzExxxVhhBQJM/0Gj6c=; b=SkeILwJkbQjwMJnjdrk1BreIOY
	AegZB0SMtwIDVfbbIh0Qaha9cL/A2+hiNA7bPfv/UDDXli0qOIpphJLjPOPigONTyirCeHHIHkyE/
	PDrE5tep5wNDBKcMEpYqXmGkD/ZAmkncglRqEWtjlTpV5YZYbsDXWQmf6T5IHf0zLHZJaezIfBZoO
	h6ghSmmxtNk9RARxHj0pMRX559ip4jOegNFX7mWoFEpAqEO4LwCq7JYqV6qNQhbI9wDWM2EvBYrTH
	tg0QgN/poS/R4NELqJDH+xBor5Pk3cctSBVJbJ6jeiR5y1eNNcsqsOrYt3Rh99EJFHTf896iEzMM3
	I056OFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuBh-00000002lta-2jbz;
	Sun, 14 Dec 2025 22:03:33 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuBf-00000002ltF-0fa5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:03:32 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-k346.prod.antispam.mailspamprotection.com; s=arckey; t=1765749811;
	 b=nYZ4pIXBCQ6fOtloghk/A8qPJv2eRtWRIZ0pJQyGllX6ttvPXDh1Jo+Lkz0I0CwmXZla83SR58
	  3FPM2AxIXd8sPopCLHIDwfVtWgXFb0I8IKTJN94nwpdlyKFX41vjb728uVPM91ab5peMWAIhuB
	  bxeS5bGZX2GYWHepaOeoM1RBqJpJVAzy/+npp2zUwxegirlZ+HXjnJUm7HNALEwyJCCF1O1IiW
	  7Bis/TJUYCKZVt2nYxkOizDz9hg/8Pjjrx4K4N1PbZceV+SQJmWIslf+a0Lnc4o5qHhLv0Mkdq
	  VHrjHRz/CgTBj1nOKNkOnniQOYPDwG2yGVR3L8HOerWmEQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-k346.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-k346.prod.antispam.mailspamprotection.com; s=arckey; t=1765749811;
	bh=cVXolmIhuEAIzMtZ7d7H4m9GWbghCHHoI5tvljqLXVQ=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=Jc1mdFrzlFESxQq5ZNS9HCWvVvPxCvQzKx9irlYFDKUvMUSX2xcBKqlXs3lYmKhk+h8CbhgH1D
	  iC/ZO+ZDOm3wP8r1IEV3Lj0xsG9qNBpW7Shot8d7pjUbENRp1gXpvPKOSyOUxfhkBTCr3mAzgQ
	  XKUia5tD3Wah148Q+DqwlMSWh3Axo+32I94NXczAQy2xKb7S5RrUfk36jWDTsxYXE3p8HVfTYN
	  D5R3iMWqslXNHJnh73/WWjNpFn0CYlo8qK7Ivyo24Agi0/9shypbf1U15yqjYzzzW3DOr3q11P
	  2SxHpxB0neSZ4ZGtdGCBCD+MoM36RM0pJ+7WSR6CNnJs8g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=iyaP5lR+UMf82Qks9pPdWf5XfzExxxVhhBQJM/0Gj6c=; b=mDJij/ZRHTILCLgFnSUWhapu6x
	XlE3LOwHHSdP20erK3m2cNgrMAtJC2j3ClUTqtKhkEyy5YdOI7WtCjhXqBbJMnTre+dznhlwX6NKJ
	/OzxmMJ6c+vrY9ccBBVSfsBz2b1zQBi6DF5RN9LxvJ6eFkP38brln6p7L/qk4CpzHdhk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-k346.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUuBT-00000002juJ-29ZH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=iyaP5lR+UMf82Qks9pPdWf5XfzExxxVhhBQJM/0Gj6c=; b=nwslf0FTSvzy1JPX0PEPfe95JY
	AbhGi8R2VFfgfS4b9fiJctKkzUtkq7tFdiVpJonYeEi3op/CjnhaEJlH6fJBmP3rWch5rTf5iksra
	ndhvnv2IT2pv2rypR3vHD7dxXa85QEBXLj1tBIzhnMhpOPGAluHXT3is/9I1zbJSd6Og=;
Received: from [79.34.194.176] (port=59972 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUuBE-00000000CVM-0NDd;
	Sun, 14 Dec 2025 22:03:04 +0000
Date: Sun, 14 Dec 2025 23:02:58 +0100
From: Francesco Valla <francesco@valla.it>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] arm64: dts: imx91: Update file name with dash
Message-ID: <aT80EhkC41d7BSZs@bywater>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
 <20251212-imx91-dts-v1-3-2bb3c13762dd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx91-dts-v1-3-2bb3c13762dd@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7ee066d74b7c285305edf251cf57cc5f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vUuBT-00000002juJ-29ZH-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-k346.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_140331_350866_C7F5AC13 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

Hi Peng,

On Fri, Dec 12, 2025 at 05:16:09PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Update "imx91_93_common.dtsi" to "imx91-93-common.dtsi" to align with
> others.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91.dtsi           |    2 +-
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 1187 --------------------
>  arch/arm64/boot/dts/freescale/imx93.dtsi           |    2 +-
>  3 files changed, 2 insertions(+), 1189 deletions(-)
>

The new (i.e., renamed) file is not there, so this is not working.

Francesco


