Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ED4D2E027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuW6SPRIybSpJvdFDUcE9wf3jZW9FAQ17OxBkhPDepc=; b=1Ba0wAI7ASQ5JYIV7pfnDKyy79
	tWSx5/5a+47KofiyoQ8fR5R5r/Bj+qk9aKxCnsPhC/Q40J/I20cuzRHRBSu7q4IN7ZvOmAtwBtKHp
	D0iz+g4fJ3m1XPXHC0Z7n1EkjyXKHE2t3ZpbGLQbJd++uKVlKQ6VHsj1xaPyfHjVF6fXBxp+dTDsB
	bKgM2IhorZ/uh777lgB7Z0jKRMl1KW70fYbRofSNRUIPW8PlO57KEtG4ROgI0sAtfIPNi4q0KHllc
	YyVEwKWhaLO1bnrkAIRDemwPF/nMzbI3uCcUI60bq6rykXbc3PGRXE0GzyZyeW8Z1lQUL4EgPaH0T
	fQKVKAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XAo-0000000DfDJ-06Oz;
	Wed, 23 Oct 2024 08:56:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X0h-0000000Dcs7-1RP1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 456285C5D03;
	Wed, 23 Oct 2024 08:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4126C4CEC6;
	Wed, 23 Oct 2024 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673190;
	bh=EyZ4QiVXvPEbdDEY9GYHE0FBEpWxqBjav2KP4V+fZmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrGTwzflVTlJdLIYjkTXefJWDQspCdNwO9KK8hrcJ8ViG8MqtrEAXscjMMkwEYP+A
	 T+wzl7dpb9x4hhedL38JuarGMqJjqWsjoRxeEFLJl4DDo5fm311snn7nopIYzbaqfp
	 dVPRLzJsNyAN6twwq2zRatp/Y/rrZzqK/8ZFMkojCjJ9n379WOiFBUwyWpGBr1Fa3k
	 dc+bgfJCa2ZVFEZyQZGkQhA2Rdo+ThVHyFj721UoR9Gh4kZJDHwhSLHYPU8CIGmQj4
	 NdtMkoyp8RHC5ID7k06/gbWk+wybN0bw40moyYK7E52Nt4drdkwyY3IERFdGyQA1k/
	 R07zGMfUYWV+w==
Date: Wed, 23 Oct 2024 10:46:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Cheick Traore <cheick.traore@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 04/14] dt-bindings: pinctrl: stm32: add RSVD mux function
Message-ID: <vvmrfkpzs4ns2bhvcx2k2fdvacxqjdx5p2oyygzgr7zjrbdl6h@cvfo6623oxl6>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-5-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_014631_445072_9C63B98A 
X-CRM114-Status: GOOD (  10.26  )
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

On Tue, Oct 22, 2024 at 05:56:48PM +0200, Antonio Borneo wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> 
> Document the RSVD (Reserved) mux function, used to reserve pins
> for a coprocessor not running Linux.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml     | 8 ++++++++
>  include/dt-bindings/pinctrl/stm32-pinfunc.h               | 1 +
>  2 files changed, 9 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


