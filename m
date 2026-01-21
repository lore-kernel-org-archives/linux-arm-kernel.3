Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89D0D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDN0nW4ItbFevNt9c/EEImVK2Hk+2CBeDthDqMAQreA=; b=AxSxUAF+U0jXbD5sfb6hXgn3HO
	7utjEU/8NN8zf7WK/Luodeyo4KACoCGPP5i3uzGx4B1wmbArJkhZZa1shDEyx4I+rJti6z0T1cBDC
	xrBWror67n9Raj03JpcZ48K9kr4ah3MLeqs4gzYF0L/JyZFZhbH5uzXOLU3tkTpD/qRjRHfLIpfB/
	4sd7jXGAWyzTO7wzPF3puE2ITg8gSM08fMDMHbOkPgg1xQRyjLdpv1LPG7ynWEBWj+g8YH4dtj35j
	k1jcZDU7hwLRl97vm/I1VlG9Jl6gQHx4XfZoOhxK0QklkdyylKyBiBNYwbgvB75WY1JAuXOUK2+mw
	iGSsLviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT1A-000000052ZT-0Kzy;
	Wed, 21 Jan 2026 07:52:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT17-000000052YU-0Mlz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:52:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4327B44322;
	Wed, 21 Jan 2026 07:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B00C116D0;
	Wed, 21 Jan 2026 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768981960;
	bh=oY9kkfuH0Ditjdy+JGL/WtyxAil2KCbor0Br2BgfSJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+u3e1m9rHY7iuamrnV9iFcVuLPYLXko6sYxIy2vjGoDYi0SX/vRPdq60y4RbzcDr
	 FW/z6KRnw1+GHO8/GTnUQ0I/uweJfhLQWWUnhZoFHDXLMzgqG+8V89GP9csySkh1Od
	 hzamX13jHyv+OL7UOYu8S8iYq+vYVD0+Bz1Wt+YammLhZAspaqTOrMYUA3ZNi1b2fb
	 qRQ02Y2Nva0FypOzFKK0hpNjoOVMUIo4RhL4b+FlshR35gTnnnsaHLK0wI4yLKbTGp
	 EH4afsG5hPJlNS55ElkcQHuF+HGU5pVJBNbMXikbfgDNx1iETYIVUYQC/33CpGgtpx
	 fOOjsXiYpliOw==
Date: Wed, 21 Jan 2026 08:52:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: thermal: Add Google GS101 TMU
Message-ID: <20260121-stoic-lavender-okapi-c27c51@quoll>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_235241_177861_A9D1495C 
X-CRM114-Status: GOOD (  12.33  )
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

On Mon, Jan 19, 2026 at 12:08:47PM +0000, Tudor Ambarus wrote:
> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
> 
> The GS101 TMU utilizes a hybrid control model shared between the
> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
> firmware.
> 
> While the TMU is a standard memory-mapped IP block, on this platform
> the AP's direct register access is restricted to the interrupt pending
> (INTPEND) registers for event identification. High-level functional
> tasks, such as sensor initialization, threshold programming, and
> temperature reads, are delegated to the ACPM firmware.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


