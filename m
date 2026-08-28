Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CC5C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZ4e3BAM8WtvBRbCVZsWH8ycqPYsmV8yz4lnKdxgUT8=; b=YYgcjudV2Ak40HcLMv9bX5vA+1
	rGOddirJRxR7+1JgwszHBd6fluECpl+to5rPZMlJb2JoTn6mfga3Q/qQWLP0G7ot2O4Vuvu5VPxuP
	7ePG4MpY1pS1ToDJ3QqzoZW0eYFki0VWZJNaY/Xnyittteb4gmOUIddkQ9rcANRBl1wtUgd58bpME
	jTBWm2SycQ2POD9L5cHzEugz4xeJZ38sDHNAdKi3Y+PPWeaZ4nenLhrPJtf7XpdarhND/ZPjyD+7D
	dNsJRouPTcVlAtEn0t5NvsS1/b1vrdwXAJsyiuft2zI36z/moq+mkBr+XXtUChz0GBQE+vNTIiTG3
	sI2xokFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztpj-00000005ZnV-0WUs;
	Fri, 28 Aug 2026 10:29:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztpi-00000005ZnJ-0gYo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:29:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9134E432A3;
	Fri, 28 Aug 2026 10:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5AB1F000E9;
	Fri, 28 Aug 2026 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787912953;
	bh=BZ4e3BAM8WtvBRbCVZsWH8ycqPYsmV8yz4lnKdxgUT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DhGlpDidQLzWh8TNGr/UXa4orJ8My0d4LT2wsGgdpjOnnhzGZ/n5uIT/iCbu5EmDF
	 lJqqcNSK2zLvmd5Qkv8daRHRFsfZuIeVwYl3FT/M7xYJLdXhrLhhfZko3PztO9FogQ
	 YAvJ+NZILIhxQsjRfP9tuXpisbYiM2utYild6mb3FmAjtWg2hhEORnKJEmP/OLulqP
	 p2mtYzdgj2tInTJFQal/shyGFUJAETX+NCXLA2Pr4yrhwEVrMRUu5oHZDzBChm6+g8
	 sLbQHo0DOF6ZKrGyiHq6vOrbsu7ToQf37oxh2kwzuTTNhpQonOEyIcbGYZl2s1T55C
	 dhTw94bYmiNkw==
Date: Fri, 28 Aug 2026 12:29:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: ufs: Add compatibles for S32N79 Host
 Controller platform driver
Message-ID: <20260828-pretty-impetuous-dove-cfcd0e@quoll>
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
 <20260826134048.854748-7-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826134048.854748-7-larisa.grigore@oss.nxp.com>
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

On Wed, Aug 26, 2026 at 03:40:44PM +0200, Larisa Grigore wrote:
> Document the device tree binding for the NXP S32N79 DWC-based UFS host
> controller which is compliant with JESD-223D "Universal Flash Storage Host
> Controller Interface" v3.0.

Subject - Describe hardware, not platform drivers.

Best regards,
Krzysztof


