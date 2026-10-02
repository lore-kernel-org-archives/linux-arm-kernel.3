Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B6CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=; b=1EV8gF0oP08mjxnpLMMrR8/XOl
	tc4thfSCxpsiMKfE00vTFFTq811tRNYnzbWt9I0RBj4WWsI48knzR6LqqHk9yQhJ0r5yHk/lVIiW6
	j3JR3V2OWqNgunoOIwjozVIATfPkFD7GOmQOoKIg/v1ODf+H/fTFNrV/D975ZlbEEEGGgVgECM0ld
	TQ22ZYL4DqLy0S501Rp4EP4PEDzbWWN+UiCOQt2WQpE9VA22gERT/KKe0yOxoHzUoDgeq5PtJhVVh
	aZPz2akwcMl4jMgC3cMo5JcPa4+9IH50Cix+KgDIoGZzDO4zSIQ5S0UwJKL0wBKqdtEXf7n08mCB9
	DthYb82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeRP-0000000Bngf-3vBQ;
	Fri, 02 Oct 2026 14:40:51 +0000
Received: from mail-vs2-x28.google.com ([2a00:1450:4864:3a::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeRN-0000000Bng4-3GWS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:40:51 +0000
Received: by mail-vs2-x28.google.com with SMTP id ada2fe7eead31-7bcadbdd8ddso2218508137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 07:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952048; cv=none;
        d=google.com; s=arc-20260327;
        b=JUUsHOqkgaRlXEW73zG52riGRicxkLRQI4BlvW/9DF5C0R7w8DhXK1ACxFrpBZaY+/
         O5DVDJbMCnZ0Fe+eRxqW09cEOCxKLt0MFqaQ8oYZzx9nNKGdQmr63+F06sUUc9obm/B5
         SeLfMtH7iSTa+dO4z45ktNcfD59foIQw86COqp/jXxhz81k1qcMrU/oyElcKgenY7Dzz
         6X/HbskfiTTwP5Yqc3DQ/qrpCg93rIezDcbW2oIKfli/7UNdFYywMDZbtWbtbpZBIMJC
         6OY4Cbj+w2g3ek3bkmJyFetsRNPCDxcbkTAnRnOjff+GHnvvryR1vRWsYhio0e6AcTur
         KnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        fh=Gb+p8cIK6ENeEv8/JIA78scyIEZxrRXNJ8+aV9oSWQI=;
        b=byci9CnMb0jyengIl8VfVU6IatVv/E3sL+K4PHyH4teXnCiT+xIdICCWn/CfbM4saK
         ZHXgL4fC8AAKeIEQirJV/7O5FE/1jN7yyCN96/icZtJyV3DZYQ+DdSOzBz5IAT3RkFUP
         PcIzyPsREx9RFpnYP/WlWF5+5zgZMSj7UZ+bVLSGUBEefw5D1Aa99KNw58MJRZ6y4S7T
         PBaaGXbXVKSyHeJrTiBwJhBlCcTw3qUcZwlIreowMK2wj8ancY1z3SveI9LXPZKMBINN
         UWvY6r0Z73xPj+oHGopql+7dIFokWjiYFxPpEio3ZBJFVS6eZ3NxSAkTFnniPk/y8SET
         JblQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952048; x=1791556848; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=maTplxU2ONDB+Z5qII3YvM74G4BCTs170Xbk1aknuSQllSYuOOONUz0Uk5/GYkkUMf
         31WV9R8Vk0jwZBjfaKiGeK7hl3Eq9tAQ5V5ObkKeH/xiTWn30lqD8cw+S3x8wR2t1PBR
         yc/3YYZITA5yUDithuPCJylRrCWrXsUszH1NleaqzZqpeUbssiAad+qFugeAk794KVGf
         KA5vh7aUqe1NAmG/Vl0Z08HZhPux7UwzsVmAtou0OnwIL8D0Va65CNy5002VZbKumLdF
         BcnN+QJ4OjSmBZ4C1DfAs+zTzaEe14HSZONwv6X4PfQWRqU01ZAP7q1lqNmMBw1Wt6/Q
         i8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952048; x=1791556848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=sYBSofuwZVzdeF94iM2r60oRKuOO3dhvGLqtx3D59LOJwPR3hoCFM0H3rsFV5RNLSN
         jnkDyn/SzHe+h4gjs/QWucKB8AgmNApAh/RNqkNV3xe6n3vrVKOlZvYc+gYlRNR1NEdt
         2fRyUfrOheWHubEK6rOElb+kbA67W6C2VFq1lznlbmPyh6nPYrINIE4RqVUWPHh7kb8T
         P4DDnCurm8w5oD7YPAtJQMue++5a40RC4XCixaGLRptBPxYmza2to05IPBx5HUZxyFCT
         Gd5XsheKY/i4ejc6Y5A1rJaM80JfttiJ9Yxi7ra7+Uelzf7MeArO8+AHJAVlW9BX2YZI
         X30Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwKXdKXwcMGbKshujGTQp61R3Uhb/IvZlN6P15Es/PPoeF7H7kAbogiGKKAzO2dqs6J/SY/XLI/qyBNoNsq+Fg@lists.infradead.org
X-Gm-Message-State: AFq9FYIjjtaorvN5cnj3WzSZjjkhg4ka+dCHFhQD/X54LtI3N9E0qCAw
	dNlHSQEDKKWeP/pr+PX02p99ryGiKaCVtjfC46xzKdjnJlLtyP5L7O/LLqBDbTM/K5huU2m12kh
	UL+8GET4Lvhwpei8jvJW8WY8FrdiUXPITcSoUstKaXw==
X-Gm-Gg: AYBFou3VG7g9hrP4vepyCcgAgGLBP92oWLHMRhip8USUoYbD4l5E78cTmcc82OPo59n
	+rh8mPHO06H4UxcqBKAg4mNtmvgUrM/g3kzqOmtMHK9vgW4GQtuINvCixog1Js6Q+WN8yj0jFUA
	oOSLVF7HSBNczVpRqF8DLy0kbSb/2SiwC/waAF66s5OczE8kB8kRQKAkRd/8Uchzig3GgjSj3Ut
	yaTotCaAQtwbTL3OLMfFpi8d6fyKPP5+vkO8CA8tiw1CJsd5p2Vk0vvfQGFxa5XIzUfB+l6tTJJ
	dfTo+Pz8uN5HMvCqY2RpdXFbaG7FCBmk84rbd8jOrFqQ5jviHF2hbjYnHTnrainusewpz+mV2du
	p72ytC+tzadbDYw==
X-Received: by 2002:a05:6102:1624:b0:7a8:10eb:9775 with SMTP id
 ada2fe7eead31-7c0f1de9f8amr776221137.4.1790952048089; Fri, 02 Oct 2026
 07:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:40:33 +0100
X-Gm-Features: AclHuK8D6xaEDYaJjeS22_XFdGHe8Vl0E2LtBv0KYmeFPY7diuDQNpJU8hTUVF8
Message-ID: <CADrjBPrTNGN7N9Q+rRO61O-mkz-j7YVV4D3tT0W=xj=KM-GT7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos850: Add operating points for CPUs
 and enable cpufreq
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_074049_868089_7C084F3F 
X-CRM114-Status: GOOD (  20.82  )
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

On Tue, 29 Sept 2026 at 04:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850 has two clusters with four Cortex-A55 cores each. The OPPs are
> identical for both clusters.
> Add OPPs for both clusters and replace cpu clocks with ACPM
> EXYNOS850_CLK_ACPM_DVFS_CPUCL{0,1} clocks.
>
> The maximum nominal frequency should be 2.002 Ghz but at this point the
> following OPP is not added here:
>
>         opp-2002000000 {
>                 opp-hz = /bits/ 64 <2002000000>;
>                 opp-microvolt = <1050000>;
>                 clock-latency-ns = <500000>;
>         };
>
> due to stability issues. Testing on a fully loaded system with CPU-bound
> tasks triggers data aborts and illegal instruction errors at 2.002 GHz
> after 1-2 hours of such stress testing.
> Running the same workload overnight on a CPUs fixed at previous OPP didn't
> lead to any issues so opp-1846000000 is currentlly the highest one as it is
> considered safe.
>
> Higher OPPs can be re-evaluated once thermal support is implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 224 +++++++++++++++++++++++++++++-
>  1 file changed, 220 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 91c6cee8f483..36501e5903f8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -100,8 +100,9 @@ cpu0: cpu@0 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x0>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
> -                       clock-names = "cluster0_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       clock-names = "cpucl0";
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -109,6 +110,8 @@ cpu1: cpu@1 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x1>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -116,6 +119,8 @@ cpu2: cpu@2 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x2>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -123,6 +128,8 @@ cpu3: cpu@3 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x3>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu4: cpu@100 {
> @@ -130,8 +137,9 @@ cpu4: cpu@100 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x100>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
> -                       clock-names = "cluster1_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       clock-names = "cpucl1";
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu5: cpu@101 {
> @@ -139,6 +147,8 @@ cpu5: cpu@101 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x101>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu6: cpu@102 {
> @@ -146,6 +156,8 @@ cpu6: cpu@102 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x102>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu7: cpu@103 {
> @@ -153,6 +165,210 @@ cpu7: cpu@103 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x103>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
> +               };
> +       };
> +
> +       cpucl0_opp_table: opp-table-0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +       };
> +
> +       cpucl1_opp_table: opp-table-1 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
>                 };
>         };
>
>
> --
> 2.51.0
>

