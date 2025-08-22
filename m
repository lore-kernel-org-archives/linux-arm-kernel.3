Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C663CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f4pyol3RN0+J86dhVH8T2VCAyqMMjU3h162wFO7pfk=; b=hYQIV4S1SCbwUzg0p1VcI9Z7Qm
	nnHedOfqM2VFDv+jUJ+yCXkrqQ9JFDssKHtvmfU+zQggXlFz5YgMWLkWE8viA3qGSPZhTmrS66z0D
	+Do7c5ZzxfNYWo+u+e3RdpV++wVvKkP9Mnlh2RLP7623l5OSTU1oySIpqwN5cWspH+iNYdqAkNg6S
	M7E8zXcYriL9wbp2eNq2kbYwDrKYzpJiuVae3qNEfpuZgZUvW5LNyJZoiB8lzsvXPO+ITgC5lRzo5
	EIMnwhx246A95hN4Lvcxclbu+3kndV2TwIeaIZOnmqlTjmW8Ac1KGLY5y1ljm0HiHzCyRXV7FD42T
	v/2kuVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTM-00000004KbW-0jUL;
	Sat, 23 Aug 2025 08:19:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXc9-00000003OJZ-0EJm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3866D419C5;
	Fri, 22 Aug 2025 19:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5934C4CEED;
	Fri, 22 Aug 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891592;
	bh=dg74KSkRhAtNHcxY1z8fkqMzfxeeOVWbECFvFRXHLSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXpJdOxLNycUvIsw2gMPg9zMyrLykVSU8bb4RU5BVW/xSq/Vls3DtK2GulvNfNh9p
	 /rpm9efCsTWFz55az9lBRAVaMmZiGzjSsotLl8YIGj4dj0OL1EqiXNjVaBvR/chQHn
	 FJwOBlmJrRSZv1V9sGHuFLwlhgpHSqv3rIKsjVAOvH/4dU0x0AWtCEAxY9LzMV8N8T
	 lOEPz2/kOoJUySu0oi7CU5zLpNuTGEadrKYU279/tloaEh9YOUYVRhJmsPl6CKPWmx
	 SC8vBb2xd29j9VoS+ye0Hqo7k0xubgxT4jOs15OBMDOUSw0agE3Ivnzt8NlGqhTNQu
	 uk8aLClwGeRfg==
Date: Fri, 22 Aug 2025 14:39:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: swathi.ks@samsung.com, linux-arm-kernel@axis.com, krzk@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	hypmean.kim@samsung.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, hrishikesh.d@samsung.com, pjsin865@coasia.com,
	pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org,
	kenkim@coasia.com, linus.walleij@linaro.org, soc@lists.linux.dev,
	dj76.yang@samsung.com, linux-arm-kernel@lists.infradead.org,
	cw00.choi@samsung.com, smn1196@coasia.com, jesper.nilsson@axis.com,
	shradha.t@samsung.com, catalin.marinas@arm.com, arnd@arndb.de,
	mingyoungbo@coasia.com, gwk1013@coasia.com, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, will@kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, hgkim05@coasia.com, ksk4725@coasia.com,
	devicetree@vger.kernel.org, inbaraj.e@samsung.com, sboyd@kernel.org,
	alim.akhtar@samsung.com
Subject: Re: [PATCH v2 01/10] dt-bindings: clock: Add ARTPEC-8 clock
 controller
Message-ID: <175589159077.191700.15798343255656756009.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124019epcas5p42ac6e6abe1d3c8c9d69331596e51ad48@epcas5p4.samsung.com>
 <20250821123310.94089-2-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-2-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_123953_120604_D1E716C3 
X-CRM114-Status: GOOD (  10.69  )
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


On Thu, 21 Aug 2025 18:02:45 +0530, Ravi Patel wrote:
> From: Hakyeong Kim <hgkim05@coasia.com>
> 
> Add dt-schema for Axis ARTPEC-8 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS
> - CMU_IMEM
> - CMU_PERI
> 
> Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  .../bindings/clock/axis,artpec8-clock.yaml    | 213 ++++++++++++++++++
>  include/dt-bindings/clock/axis,artpec8-clk.h  | 169 ++++++++++++++
>  2 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
>  create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


