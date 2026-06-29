Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B23C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=; b=fUKfprJHldOL/EWMIvN6HhcLOP
	SSIdTen7mGrNSuH4DF26YnB8xRx37mOtJM4cL0qBlg65yw7INz3pQm8ugbZ4jdvzI8yPB91P49xzG
	8IjjIIRObl8oIEkhx2PL9Jk+YYTOQfIWUu46FSKWN2xe1Qs2kWpOsJMvpYpQX0mSMkxctcuW/3SQR
	tBITUfjMTtA2ec4qPccMsLXIV5VYCMSY93zVAfTkKS9qTIaWyEYfk8eWfGBbmtjIUP6aPBbaQGu3Z
	c18MF6jIpVwJZdFzXsa8Zp5TdDOqq9DjTZZvWB/Vs2uWJLWwZK5fKRE9DlMS2cE9IeJktPMtO6ijU
	z7Fm2mDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAL-0000000EYxC-1f5W;
	Mon, 29 Jun 2026 12:32:45 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAI-0000000EYwm-3gQQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:32:44 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so5618648a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782736361; cv=none;
        d=google.com; s=arc-20260327;
        b=evA1qC2ThpizY503UxLUQufow4hgJI7QbVEA+JrSf2/k5bTJXnDP5aeHKGio5fjFly
         IDCJUOpQ9Ne/TUHrhMY1oQ1Au946ed3CI9DoX0ph7J/1lqA8hW88/N5z/Lz8Bi3RggPo
         5WYe1iQAZ0OtxxaTbx//dv0U+3NUm3S+WS56tDDhoZ1B6LqCrC/Wy7e+6BifRmkKSPba
         E6hkKdcmpDYEeSmVUS9E32pKkv2LBVdHuhLu3788UywnS8s7ns3sA1v2z3SJJcmLXnZW
         VRDt4RJWzxqwZD26KeiNx6phg194tjLPQmWs34V3sprimt/blKFLXDW6Pzxz4LTReOdT
         zh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        fh=1R6cIPb4QqKmybHXMFpp+cODhl77rUFF7echofsiQMM=;
        b=jMxKPhaDfjf9aHOAGmmgJn4YfYXVmu783kieHJRhPBKG6k70meWd5922o1iUmmit66
         Gqo5Rmc3hm+/NQPmfac7h7qJRsyWZi3kJoIiywZNRX98dYYT1IJ4zcbYLO+l+55hwPkC
         /J5Ot/zX6X0lO4JNaRpou3fR+5xORPDOP+gXQ1h0ieZEZaAR1wTXKSmrDPHSCGPKstzv
         LiFif7/wEIPDODoW48+ph7a6k2lT2AOnMSRi5PQS5c8yJOc6pihlp/+nnCBrLt5CprRs
         +qbKxR4+3MpASQHswchOmYXY7DisTiom8dpT40P3o68fHurYtwjV4Y1LCMPM55SdU4Te
         T5PA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782736361; x=1783341161; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=XRLb8a0op7xQNWvv9zjdINf+AVzAB3cYyS42/hE90w6XgckOHWw1lPGroJePDpaZAk
         Hq14z9ZP3atBBTovxm45NvKAansRYtt3Vdw2YOtAnk4AR8BmBEwmDNhk2ja2eTYiUyWn
         DjO38c7ShbJmGpnOGkCiZ/cMI0ROicpU71ZF8rLmJhLPB5yHyy6AXNZNI69Uin7tiuaF
         oJuEVRkqc/F6rino3AbwG1cIheR4fWHG/DKNFdI/h05UnubioqEqTg/aO9AbkKVUejZc
         nGUlqZmR6A4T14ArvSqiyo8YVajIMWKZqoC5JFrk+UnmFxrZl9D4094OtyVtrZhSSdlh
         zLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736361; x=1783341161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=s3NE/dk3qP8U0Eo7lh9g7Xk5WIcha3YSIKSlfjcscMmu5MXq828Q7Aw6aGyHed4aNl
         b/Rwy3zsmflueiMyfmWX2mmeH0uD+ssq+pxkMVo0pKKPKaTR0C3AS8AhOeNXNI751wOv
         Tm+sqd8fIc2vg1V0/MvVk4TL3Hc9kalLlWIdNBkmbHSBMta6aqwwD8p8OVfvR+Gwg10y
         u14KNxlkYerPmAE4qlQjz9fEk5gtlc8vG0fzenKZUfonNIR0FaaxHyjDTqmzB4hyGJON
         bV0iGKfA6lDgUlHnY9CxjCMb6bpAG9+L6+mrjXizgLu04/PpfTFhu7Ymc7nBV3AA6HAU
         5Dlg==
X-Forwarded-Encrypted: i=1; AHgh+RqsIjW7CU9yrbct06ZmyeU5vu5kMeoGS5JH98JIyjdUNaYxjsU8eTIQwf9sax/kL4J6YssJphHT5uC16OXUGikR@lists.infradead.org
X-Gm-Message-State: AOJu0YzgWyJccpcZKG42GQELIjAMBecGW9Bo62Or0HPAlPnaii6k7HnL
	rcxAkB5L/g0tNUcinGPfQJoHYq3BtGUZTvdIo0wpYwI4DBTWeP4mkbdwQKQdawzzpIAdFnBNvEB
	03RrjxKF32eRmWPF4srGjnJwW98hQoXSrzMeqsb7pLg==
X-Gm-Gg: AfdE7ckmElq850OUozZdyxWR70gPpEtGE/qqhpA/vkFqAaD1oUU4J/4gbKaLkrtVPzU
	q69n/ittBidcWK6WSpzA6qJVOY7+0j6aoOeWWzuXJu9yA+ISOx0PcfH2/C++dI8OREPLBlgK12w
	hJD8HKinc/vI3TSF2keIScmBESO3utmf8PsvLuT4YZe2zIQIjocSyCgPiDTEfo/76E5FXCtQn+r
	pUcZx0+F4Q9LI3VW3dSS928qE0cdpsd4tB+0knaVVm6dfkLKDUvKUh/lPhfmmEmNarn5eZsF4ri
	t72KDTlapfNErpTvvQ09px4AWZqFvQ==
X-Received: by 2002:a05:6402:35cd:b0:697:d475:9692 with SMTP id
 4fb4d7f45d1cf-6983630b4camr4695431a12.11.1782736360872; Mon, 29 Jun 2026
 05:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 13:32:29 +0100
X-Gm-Features: AVVi8CdLbhp4Di9rmkSMap57ieyZzpxVCIoG3c1G91VB-Ou_IfcxhglJYrQ6uH0
Message-ID: <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053242_961019_6841AACE 
X-CRM114-Status: GOOD (  18.83  )
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

Hi Krysztof & Denzeel,

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Correct eight PERIS gate clock parents to match the hardware clock
> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> default source.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

@Krysztof: I was thinking, maybe we should establish a new rule/best
practice for Samsung clock upstream submissions whereby patch
contributors should link to the downstream cal-if code for the SoC
after the --- line. That would make reviewing the patches' correctness
a bit easier, as the downstream cal-if code would be readily available
to the reviewer.

regards,

Peter

>  drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index ee3566b8e57c..df5928833b23 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -2551,7 +2551,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
>
>  /* Parent clock list for CMU_PERIS muxes */
>  PNAME(mout_peris_bus_user_p)           = { "oscclk", "mout_cmu_peris_bus" };
> -PNAME(mout_peris_clk_peris_gic_p)      = { "oscclk", "mout_peris_bus_user" };
> +PNAME(mout_peris_clk_peris_gic_p)      = { "mout_peris_bus_user", "oscclk" };
>
>  static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
>         MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
> @@ -2584,15 +2584,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
> -            "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_oscclk_clk", "oscclk",
>              CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
> -            "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
> -            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
> +            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
> @@ -2600,19 +2600,19 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_GIC_CLK,
> -            "gout_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
>              21, CLK_IS_CRITICAL, 0),
>         GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
> -            "gout_peris_lhm_axi_p_peris_clk", "oscclk",
> +            "gout_peris_lhm_axi_p_peris_clk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_MCT_PCLK,
> -            "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_mct_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
> -            "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_otp_con_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
> @@ -2624,7 +2624,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
> -            "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,
>
> --
> 2.54.0
>

