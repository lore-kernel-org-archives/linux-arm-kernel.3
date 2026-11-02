Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s0tlwKFL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsdDR+nA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=26a2YZlWRaSAPOHcTE2+5kqHdv/Otj5O8ZWz6zf8wtQ=; b=s0tlwKFLpL1e+I8DfhQRgcJTdo
	Dy7bCoFY002rdsXebnINecOMptswr9qDY4TlLBh7MiX+Yw6jgvc5xIbUeApjDd55LbuCu0VXDRcun
	lcadbqdiMgkOqTnN/FCGqqAdxpNPd+eDA1PPc7m2obw0HVKXFMe3+w3amOqkchYDEyigczewBjKTF
	uSVgKemq1Bkvpsl8JDFzF2NGQLt33H9Ab4TNUkIseDsVsasagZRa7jxaD6p5K4SMqEPt5Zzemzxd3
	Ckhz0hm40EhrBk/64AuZKsiE9Cga1/ig2tX6PXZMp+JLHNnLpf6FL8nYuicAIbePWKoQwm6SOgZXI
	tkTlMkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpDV-0000000G9zl-0uFR;
	Mon, 02 Nov 2026 10:24:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpDU-0000000G9zX-0Gg6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:24:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDF5C417F5;
	Mon,  2 Nov 2026 10:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AEF1F000C1;
	Mon,  2 Nov 2026 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615079;
	bh=26a2YZlWRaSAPOHcTE2+5kqHdv/Otj5O8ZWz6zf8wtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KsdDR+nA0Vmu1ul1ZwLcrtE04Wkx0MghFLnKiscSeN2bRZw5WNzo9qd5FBE0y8els
	 E2sKHux9JcJExeK7PmgQ18XFpHz4dMjU9+zT2os1sErYDQEb5QTmhpZ9wxMPvIUt8+
	 CCz1uKXYKJHaGnumJl3hkJygQZKBR6PCwXqrK5j0gdppmj0/BgkwBXf/1s8EYRwSAC
	 r4UpGaTUgz2ORT8RyMfWAqpiSA/uzrYRXSogsQJfK5WtdRXT+9X5LKUI/3ZCKjV864
	 AP67ELqi3EfZJwezddFIO4xPMRmvthirx9tbeCyaHaR2zTV/2a84h1E3CDAB9UZ8Qv
	 IyJD/cgfQQhUA==
Date: Mon, 2 Nov 2026 11:24:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: stm32: add kernel clocks for ETR and
 STM
Message-ID: <20261102-modest-green-emu-1c0017@quoll>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-2-398d348ea8fd@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-ups_mp25_clk_update-v2-2-398d348ea8fd@foss.st.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:43:18PM +0200, Gabriel Fernandez wrote:
> Add the kernel clocks of the ETR (CK_KER_ETR) and of the STM
> (CK_KER_STM) for STM32MP25, with the matching SCMI clocks
> (CK_SCMI_KER_ETR and CK_SCMI_KER_STM).
> These are the trace (ATB) clocks of the CoreSight Embedded
> Trace Router and System Trace Macrocell, while the bus clocks
> only provide register access (APB).
> 
> Also rename the bus clocks according to the reference manual,
> without changing their values: CK_BUS_STM500 into CK_BUS_STM,
> CK_SCMI_STM500 into CK_SCMI_BUS_STM and CK_SCMI_ETR into
> CK_SCMI_BUS_ETR.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
> index 242f61205a9f..cef997508b56 100644
> --- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
> +++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
> @@ -109,7 +109,7 @@
>  /* LOW SPEED MCU CLOCK */
>  #define CK_ICN_LS_MCU		88
>  
> -#define CK_BUS_STM500		89
> +#define CK_BUS_STM		89

This has almost three years, so you are affecting users for no real
gain.

Best regards,
Krzysztof


