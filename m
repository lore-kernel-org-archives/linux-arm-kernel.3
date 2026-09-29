Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060E0CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:Date:References:In-Reply-To:Cc:To:From:Subject:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vSMTaFwVmnb+Rmt42e8RSqF0GusWSrT12M1j+n1IUM=; b=ZruYoToSq8W8P+QNFhQTGpxSsJ
	8SRD6XOMtIdEB6PsJv5aan3q26auGY3qzbRurwYfK2zxhz1VnKYHeV5TZLFlRiXIKRE6oJ96foVm7
	ozlO+vFLgotGA6XBjREIDza3TA9EBHVOKJNfEEjU/dz+tY+CIJi4Umc3I5IkMY1Rq5U84VCH/rNgq
	GABDzeUNiHouFGhG/tw29HO1YPasXnoKcVpwnYnPjQfEvBrPE/4b1ysgrPVV1uitsoGwKxRZN+2iN
	NaAsbacLlklKSps+I83ElibPssOLUmQhrxkrVjTVcFSsLSGhtGiLgKqROFtjzQKeiCjyDSmxfHMry
	BqcOeL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBarz-000000045E8-1zQw;
	Tue, 29 Sep 2026 16:39:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaru-000000045Bf-3o17
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790699987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vSMTaFwVmnb+Rmt42e8RSqF0GusWSrT12M1j+n1IUM=;
	b=WJ8eYsfZzrxVRuBZNP4H/bckEbXoKPo7wDJB1a+pR4NqduV9Capu36mpmdEEn36MmFEUhS
	/iTe/rH5S33BDi4cxlPxQSThm4gMlLRa6Jv3DmMtA3qv6ceYj0Oy8sAeKVMvpl25ofYFLe
	t2frnQbeha7LxaR1W+1Nsd2r7xm7vak=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-jZPjatw9OFCVNqN9rWSvbQ-1; Tue, 29 Sep 2026 12:39:45 -0400
X-MC-Unique: jZPjatw9OFCVNqN9rWSvbQ-1
X-Mimecast-MFC-AGG-ID: jZPjatw9OFCVNqN9rWSvbQ_1790699985
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so193351785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699985; x=1791304785;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vSMTaFwVmnb+Rmt42e8RSqF0GusWSrT12M1j+n1IUM=;
        b=Lx9aDs1jhJn5WQ3o8Pr5DnKE7tbVIg8vgCqYCB6mljiD95LselP7GmO6r5RsaBfUbl
         vBP5fQibxjKEWl2bTWOjp4EwATET0cBr1kA4vDN9pOO2Y/YCtKpsmtvmu8kyhx7S0Fok
         mS+PsFXyp6nKKCbdUT/dF6bi0Ki09UIGD1e5pMI9b3jrzbf8gPah8XQ0lg93MSH7xCTA
         1KYObO5D4uYPf1NRo9P7vmP9bmaS7o8jGkxxQkROrkShH7PkzHIQ5EroLCtYQBH6UlYd
         C1G/eQ1g8faltOhfvQQTxp4xXhCsJ3qHbOn7m7IgH+vh7h8V+GpVAyswstMCdSz9erlR
         U4VA==
X-Forwarded-Encrypted: i=1; AKwUvByikT6mV9/u/7lFf72rvEoVnPY9b83UtYOAvHkIIhISD22AD1Zl+F10+VBQpJUJvRQaDivg/ZiNvdW8ZJO1pQyv@lists.infradead.org
X-Gm-Message-State: AFuF++mp3KI97efK74ZXsQivks+EQr8dWoLPjPM9q+W/IKCl4gcqeb/t
	8dhAH2YUFgo/FgLBPbXwUe+9kPyzCZhLjG+HPQpGcA8Y0MT+2Z1wvyRdtzr1uf6V0bUbmd+ZkWj
	xuRjQNK+0PNwZSoGgU3kcRJMJ5XAtKMw43aR2WC9dNAB9mCzk43ypmCptu2Ao1znkcvMdpRUA5L
	8t
X-Gm-Gg: AYBFou3TQVyON7Of3PG3TgSShwxxE/27vZ+UOmjXif58XlPagCgMInixOzq90AwT0Wp
	SG1eZSipUa7wFyhNBNu9QRLjKO4N5vsmrBykagYGCoaQ9n37aNPLxJ9XT370ytVgmmUC/32HUpX
	RSx130fVqGTTbjK8CVb4ePue+NX141QLK3jnpWzEv/L+ON3UFYpgb3gII/ooNYxyQKVhqhYklbd
	NopevB7keC/6VS2FG4x+Sq3uLq3vCW43z7pA9CrIJDtd6xBkRhnpC7gQ/sxG8WXZcHDcBE/74DI
	iUEDmY8JYEwsgO58oRSmc6usMA/yMHDC5oHYhkArFAjfWN0TviPRG43G3DtEZX7d27M5nqWlGe4
	iotwD+GDwDx/26CDNity6hrgdMOVDG3BbqrlBElWeif9l167fgP8=
X-Received: by 2002:a05:620a:44c8:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c8bef3627mr583066985a.16.1790699984920;
        Tue, 29 Sep 2026 09:39:44 -0700 (PDT)
X-Received: by 2002:a05:620a:44c8:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c8bef3627mr583060685a.16.1790699984366;
        Tue, 29 Sep 2026 09:39:44 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f569504sm8213985a.45.2026.09.29.09.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:39:43 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH] clk: sp7021: fix infrastructure clocks clobbering PLL
 provider entries
From: Brian Masney <bmasney@redhat.com>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-clk@vger.kernel.org, qinjian@cqplus1.com, mturquette@baylibre.com, 
 sboyd@kernel.org, bmasney@redhat.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260820130224.1584902-1-ag@ffroot.co.za>
References: <20260820130224.1584902-1-ag@ffroot.co.za>
Date: Tue, 29 Sep 2026 12:39:39 -0400
Message-Id: <179069997903.213266.2923932929883625249.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5320; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5JgxFy2M+q3CsNTyNd/dWd2e9DAffFt/Edo2iCguHck=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2vzz7ycm+N27TyV5lxTtR+xYdvf19yx83WVnnLT7PU
 4K31+5+0FHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE9BYz/JWokypfe96ZZ+8W
 vYDIKH/eUr4V6dccmJxPLZqx0n2bfz0jw+crmUnSj5X/vFC82p76KnJJfubmTXKP5i6em7nTQ3J
 1Jy8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UOMOtrilRqPH8GkykCzJMQC2bhyFWw12tSCt_rroK9Q_1790699985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_093951_066588_88BEE949 
X-CRM114-Status: GOOD (  32.03  )
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

Hi Andrew,

On 2026-08-20 15:02 +0200, Andrew Gaylard wrote:
> The sp_clk_gates[] array previously included 9 infrastructure gate
> clocks (CLK_SYSTEM, CLK_IOCTL, etc.) appended after the 64 DT-visible
> gate clocks. The registration loop used the array index directly as the
> hws[] index, so infrastructure clocks at positions 64-72 overwrote
> hws[PLL_A] through hws[PLL_SYS].
> 
> As a result, DT lookups for <&clkc PLL_E_25> (index 67), PLL_E_2P5
> (66) and PLL_E_112P5 (68) silently resolved to CLK_RBUS, CLK_IOP and
> CLK_SDCTRL0 respectively. The L2SW Ethernet driver believed it was
> holding the PLLE outputs, but was actually double-referencing already-
> critical infrastructure clocks. The real PLLE outputs remained at
> enable_count=0 and were powered down by clk_disable_unused(), causing
> an Ethernet hang on boards with fixed-link MAC-to-MAC connections.
> 
> Fix by splitting infrastructure clocks into a separate sp_clk_infra[]
> array and registering them with a dedicated loop that uses a local hw
> variable rather than an hws[] slot. Since these clocks have no DT
> consumer they do not need to appear in the of_clk provider table.
> 
> With the provider table correct, the L2SW driver's devm_clk_get_enabled()
> calls now hold the actual PLLE outputs, making CLK_IS_CRITICAL on plle
> and its sub-outputs unnecessary. Remove it.
> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

This patch does not apply against the tree.

Brian

> ---

>  drivers/clk/clk-sp7021.c | 42 +++++++++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> index 1d067b0af8a7..50c667cbb3dc 100644
> --- a/drivers/clk/clk-sp7021.c
> +++ b/drivers/clk/clk-sp7021.c
> @@ -124,9 +124,14 @@ static const struct sp_clk_gate_info sp_clk_gates[] = {
>  	{ 0x97 },
>  	{ 0x98 },		/* CLK_ICM: Input Capture Module */
>  	{ 0x99, 0, true },	/* CLK_AXI_GLOBAL: AXI interconnect, no driver consumer */
> -	/* Infrastructure clocks: all default to enabled in hardware but
> -	 * have no driver consumer, so marked critical to prevent gating.
> -	 */
> +};
> +
> +/*
> + * Infrastructure clocks have no DT consumer so are not exposed
> + * through the of_clk provider. They are registered separately and
> + * marked CLK_IS_CRITICAL so clk_disable_unused() never gates them.
> + */
> +static const struct sp_clk_gate_info sp_clk_infra[] = {
>  	{ 0x00, 0, true },	/* CLK_SYSTEM:  SYSTEM CLKEN    mo_clken0 bit 0  */
>  	{ 0x03, 0, true },	/* CLK_IOCTL:   IOCTL CLKEN     mo_clken0 bit 3  */
>  	{ 0x04, 0, true },	/* CLK_IOP:     IOP CLKEN       mo_clken0 bit 4  */
> @@ -644,25 +649,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>  	/*
>  	 * PLLE and all its sub-outputs are used by the L2SW Ethernet switch
>  	 * (50MHz RMII, 25MHz MII/100M, 2.5MHz MII/10M, 112.5MHz MAC fabric).
> -	 * The L2SW driver explicitly claims these via clock-names in DTS, but
> -	 * CLK_IS_CRITICAL is kept as a belt-and-suspenders guard in case the
> -	 * driver consumer reference isn't sufficient on all board configurations.
> +	 * The L2SW driver explicitly claims these via clock-names in DTS.
>  	 */
>  	hws[PLL_E] = sp_pll_register(dev, "plle", &pd_ext, PLLE_CTL,
> -				     6, 2, 50000000, 0, 0, CLK_IS_CRITICAL);
> +				     6, 2, 50000000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E]))
>  		return PTR_ERR(hws[PLL_E]);
>  	pd_e.hw = hws[PLL_E];
>  	hws[PLL_E_2P5] = sp_pll_register(dev, "plle_2p5", &pd_e, PLLE_CTL,
> -					 13, -1, 2500000, 0, 0, CLK_IS_CRITICAL);
> +					 13, -1, 2500000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E_2P5]))
>  		return PTR_ERR(hws[PLL_E_2P5]);
>  	hws[PLL_E_25] = sp_pll_register(dev, "plle_25", &pd_e, PLLE_CTL,
> -					12, -1, 25000000, 0, 0, CLK_IS_CRITICAL);
> +					12, -1, 25000000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E_25]))
>  		return PTR_ERR(hws[PLL_E_25]);
>  	hws[PLL_E_112P5] = sp_pll_register(dev, "plle_112p5", &pd_e, PLLE_CTL,
> -					   11, -1, 112500000, 0, 0, CLK_IS_CRITICAL);
> +					   11, -1, 112500000, 0, 0, 0);
>  	if (IS_ERR(hws[PLL_E_112P5]))
>  		return PTR_ERR(hws[PLL_E_112P5]);
>  
> @@ -689,7 +692,7 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>  		return PTR_ERR(hws[PLL_SYS]);
>  	pd_sys.hw = hws[PLL_SYS];
>  
> -	/* gates */
> +	/* gates, directly mapped into hws[] for DT lookup */
>  	for (i = 0; i < ARRAY_SIZE(sp_clk_gates); i++) {
>  		char name[10];
>  		u32 j = sp_clk_gates[i].reg;
> @@ -706,6 +709,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>  			return PTR_ERR(hws[i]);
>  	}
>  
> +	/* infrastructure gates, not in hws[] */
> +	for (i = 0; i < ARRAY_SIZE(sp_clk_infra); i++) {
> +		char name[14];
> +		u32 j = sp_clk_infra[i].reg;
> +		struct clk_hw *hw;
> +
> +		sprintf(name, "infra_0x%02x", j);
> +		hw = devm_clk_hw_register_gate_parent_data(dev, name, &pd_sys,
> +							   CLK_IS_CRITICAL,
> +							   clk_base + (j >> 4) * 4,
> +							   j & 0x0f,
> +							   CLK_GATE_HIWORD_MASK,
> +							   NULL);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +	}
> +
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>  }
>  
> -- 
> 2.53.0
> 
> 
> 



