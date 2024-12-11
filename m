Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E443E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/Dji+NNzfPh/DTGNhy0uFnkomrRTM1W72SA3s6r9M8=; b=WVhWYl/i4Sn7j2FMjM2XczIedO
	MAMdidlugRvJ9Pk89q40EyvwfZj5RISWoq5PTVxOGzCk5nC+LyjLYEKgzAL9JIAkuy5GaaJYy8w5Y
	VkjwHEujZvfWqx5kRhZySlDQgSfRwT/jCVQ6kqFhKmPRezwuQHfFDKo3t0/iq/iEmmLqK3/wU5MWd
	V3YrcoMRH0381T/kEBE8Y5mptKdOHVlYBcpYyEHKUrlsR//UkdyXe3zaa3+uoxGIyayPgV6aI9avP
	xUPMAwZzWsTGd0iA0KG2MWU0PL0r9D3APzDTIHEmLvNOFr2YSl5M953u0xhBDCDfoxFy1sdVqeA8A
	PIF2+CEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJ9N-0000000ERjX-1bTj;
	Wed, 11 Dec 2024 09:36:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJ8J-0000000ERXr-219p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66CEAA41FFB;
	Wed, 11 Dec 2024 09:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4F2C4CED2;
	Wed, 11 Dec 2024 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909750;
	bh=iLFw43OnoXzWnqMuVnmSTPFH2Xr7CNIIsPaMJUmIUvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiExNU8dJp4RuFxEc6MEegk5hw5t8sC9v94SeKS6W+/wpBfA9L2Aly+iaIPeqxFau
	 RXvplC/NV4cZiaziOrSA3lnbM7NPL9J4E2p/ze9McR1CTnYrnUcAQjlYWv/WygOdbS
	 ULZupA2+6BZbQJHsXjZdPaJ7onl+0T+HHT8xvx5S/aVMpUALQTZFO65BlTCGhRAwpl
	 M+27eShzZhiz0fXXksV11LS+GbKSZA1pAqtUW8p4LBL53YpCIEIA+pXLsXwA24Z4vo
	 rZn8PLGuHWXPcaA7Hk2yXjEmHhXEtvJyP8Dj32CpFPVwcxTCP+ALV2/fp/mpEfjadi
	 xQVcJdYH+1w5w==
Date: Wed, 11 Dec 2024 10:35:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengfei Li <pengfei.li_1@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: fsl,imx91-tmu: add bindings
 for NXP i.MX91 thermal module
Message-ID: <u2y3owsp442geue2knfhnx4zhrzefmky6bl47nxaaqhw7dhpb3@vkc6z7c5hwv2>
References: <20241210-imx91tmu-v2-0-5032aad4d88e@nxp.com>
 <20241210-imx91tmu-v2-1-5032aad4d88e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-imx91tmu-v2-1-5032aad4d88e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_013551_579163_2457BB0D 
X-CRM114-Status: GOOD (  11.23  )
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

On Tue, Dec 10, 2024 at 04:27:02PM -0500, Frank Li wrote:
> +description:
> +  i.MX91 features a new temperature sensor. It includes programmable
> +  temperature threshold comparators for both normal and privileged
> +  accesses and allows a programmable measurement frequency for the
> +  Periodic One-Shot Measurement mode. Additionally, it provides
> +  status registers for indicating the end of measurement and threshold
> +  violation events.
> +

Missing ref to thermal-sensor.yaml

> +properties:
> +  compatible:
> +    items:
> +      - const: fsl,imx91-tmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    items:
> +      - description: Phandle to the trim control 1 provided by ocotp
> +      - description: Phandle to the trim control 2 provided by ocotp
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: trim1
> +      - const: trim2
> +
> +  "#thermal-sensor-cells":
> +    enum: [0, 1]

Why this is flexible? How many sensors do you have there?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#thermal-sensor-cells'

Use consistent quotes, either ' or "

> +
> +additionalProperties: false

This should be unevaluatedProperties: false after referencing mentioned
earlier thermal-sensor yaml

Best regards,
Krzysztof


