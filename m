Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6515CCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7Vm/ipdb4RFbngEiBrM2Kbqpue79Aa2GGMxvAz8GqY=; b=DA3Klpx7aydyeqS0Aix5RNGax6
	T098LQmV/JOG1cyYryPo0w5+izDimz1ATtW8cX2DOY2gjJeGbeiHhGryes4cPPXPzL3pB4/KNGaYn
	4R7dl8nqCALLPJvXV8LJHAVYThkt1KMEgYO7ICCn/ePD9MiKU/QfVWEsrqxont+0P+dFmm82S6cuG
	VIPsugKUEuK5MFczjP+gDffN2bCwI6Ky+zebkh2jJZKs6bEeLiXkbc0HqJlakgro13oozvKBRwBSv
	mYLPuNNZVHhMcx+CAIFeZIFtgZr/hm9TzGrV6zDUOP4lIRSkiJWzBelpxR4nE3+NVQv6jb0stGeYU
	OEuYb1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwq9-0000000FHyR-0SJ7;
	Wed, 14 Oct 2026 11:08:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwq4-0000000FHxY-0PUO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:08:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62E3D601F9;
	Wed, 14 Oct 2026 11:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2901F000FF;
	Wed, 14 Oct 2026 11:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791976083;
	bh=i7Vm/ipdb4RFbngEiBrM2Kbqpue79Aa2GGMxvAz8GqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ng3ouawJCasVk7LgevL638CVuYV2h9W2toQaDaf4h0VXW3vBcDbYVYF/0Zmh1con/
	 fkvVhefWbxAgmOaQDW+O+QkHdnJvQXGWBzvAk5v/pnTeFGLEvxrh3TQ6HRPszhhKFw
	 4TAJqaZuDOzqrB2owHGd8Rh0Wqu739LBOtnqHnCf5j8WiOh1r+ebHXkzCtg3LloYw1
	 lNlmWI/A/MOAPAd5XkPGIBl8d9T94XiGOLW6Ki4ATbV/AGcjkFWyubUI4zDO6lS+dr
	 8wxTu3i7bNm50rBFUxOpMENsL4pdj+XkbQ8IkcgXf4QlNvG3d58/Mn9tQyDUbuq0WI
	 gL+4QTDtwj3cw==
Date: Wed, 14 Oct 2026 13:07:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Pedro Sousa <pedrom.sousa@synopsys.com>, Hannes Reinicke <hare@suse.de>, 
	Joao Pinto <Joao.Pinto@synopsys.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com, 
	echanude@redhat.com
Subject: Re: [PATCH v8 10/12] arm64: dts: freescale: s32n79: Add UFS host
 controller
Message-ID: <20261014-wonderful-elusive-hornet-c32e5a@quoll>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
 <20261013103003.373156-11-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013103003.373156-11-larisa.grigore@oss.nxp.com>
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

On Tue, Oct 13, 2026 at 12:30:01PM +0200, Larisa Grigore wrote:
> Add the S32N79 UFS host controller node to the SoC dtsi.
> The controller remains disabled by default and is enabled by board dts
> files as needed.
> 
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32n79.dtsi | 24 +++++++++++++++++++++++

DTS shouldn't be in the UFS patchset as they tend to grab everything.
Please split.

Best regards,
Krzysztof


