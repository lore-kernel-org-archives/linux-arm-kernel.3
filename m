Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3412CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeRqiOPLopz5KVnC68acZ5B+PxJ3Dx5XQd6rUO1DhDU=; b=sFfByQJyvGCbLZDCpX0QoDqN/4
	BzxguVmuwCFtW5BZo5W85WDQBSc/SRHf1Pzr8Ie2L0NzU9WDJVe2q+e4/8V99ijc5Dk4O9L5iwK7w
	vHjtCSbrIFZ/sBpKn2O6KmNR1IvlRqXXZ/isYW7MM58tn7FD3Wglvtc/yjSb3154jpmzyF+c+Fk3O
	FvPtGsFV3eretEhNOgBg/GgtIr1zgprXjMHv98oNzZExvULhfpNb4dCAsDRFHNj7o6UV62n7RsFFD
	HNzY833i1QVE2A5gPGBlxi9FRNdH9mYnksun0YgTe1DSmO98S4BbMKTpl+tqKi7S23Fwfq8DvNkPr
	ZCGNVITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AO-00000007opF-3CvE;
	Mon, 18 Aug 2025 14:48:56 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unxWd-00000007Bzt-3mhP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 10:55:41 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e9343256981so914514276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514539; x=1756119339; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FeRqiOPLopz5KVnC68acZ5B+PxJ3Dx5XQd6rUO1DhDU=;
        b=Gth+eVl2V3tcuAmt3FnVvJKMO9Rb2sOZfnfk7lMj3Cb4ONI9Il3JtoD47Soy2LdUFE
         LQlQJUaf4rMGZygx+5TH+cIRTVayU8Bz2mDa+4hl4WOlMbx1h54PFoiWj22+P1iZJx5x
         ETxtxr7xJphF0MiubBGz9K1UFNuzl8vZTyoCCb04exSk8Qpv4rDh2EWAvPQuUUvRphGe
         7fuuxbov+VYRjXJmapbldn2bCxTjktcYwsx7M9dFOg/yB8R84IyXu0NCCpiylTsnz6v+
         JuG1v879OZ10AM8coAWmihm+5JwZs0tLOwqym+5l+eS9oWlSZobhs16s5i/YVjnC4q4C
         LXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514539; x=1756119339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeRqiOPLopz5KVnC68acZ5B+PxJ3Dx5XQd6rUO1DhDU=;
        b=fP/1S+jOO4fcv40NBogEuWNRusdSesL0NghmbDB4jrJQffC8ST5h2TnfhikHDJ/dxW
         cyLRexKU4pFx+bgdo48j8lR0ZunAq9P3K9gdfwnq7YNCUaDfvEFWMhV3CVcXow1xyoTt
         3KhZafJ/eJNOs5jgmdT2TwlSJsdxvJNI0BDwjSpd9+6nUV9McRMJE44WlnW9wriBz+02
         WTYjMuf1NM5ygXstBVGZPwJgBu3UBvdJ0/wGN20hX1wKvPbeX1vfZYh+7a1gl3tveV2L
         JJ46aMXD6gftbm8iPRJA2jD37SOvXQZ4Ui4fEWvI1VPnE3BqXqBIyjhl8CcMS4JM91wO
         XhQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDv1TniR1PFIHIpLbj76T5Mk96ID5/7Dbevs6LMMIqVQf3JKOqALk/Xfkzq94Ipb7+Rb7HZbG2EkpqA7ic99wg@lists.infradead.org
X-Gm-Message-State: AOJu0YwJXfXgT6DHbGb8OqiX9ocWpZrANZMdt82WFUxbAQ8pGyR54P7m
	StVbztk/4ybsXdyX13EqwG9WsreL1FnsJdm9GZE6/GIBKKHuEpq92vH4AarEPJ9/me39J8cEKpm
	EVGwByKxsPocamc3UQpezUUiQoKVxwrZHo0J31YtSGQ==
X-Gm-Gg: ASbGncvAutJL5EY9ZKjKH6eFAxahLrgqvmz/KOdSUFosVi/v6qTnPG7gH/w1IJE3k5Z
	6ALrKkwJfo/SYAGUza+W+oiDJbQ/t36v8fjow3vPk7GNPiztX0qYsqZ5aGy/vO1RGm7as10F0gT
	PSVHVS/CcXBzliEistR6l0QarEqvZGQTIxvUv4ko84npkMcYQ1eHqG4S7uc96DQROt8mRC48eW6
	s8dal8o
X-Google-Smtp-Source: AGHT+IF46ecL1xUjdrsluGaAMVIK/JazDBA1JIpYrAjgHNI9HWRequ3E121ddAsqZMq/3qbwEzgmgBnN6SAjLVVuP9k=
X-Received: by 2002:a05:6902:c02:b0:e93:49e4:296 with SMTP id
 3f1490d57ef6-e9349e4262cmr5734998276.15.1755514538545; Mon, 18 Aug 2025
 03:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250730060543.1735971-1-sai.krishna.potthuri@amd.com>
In-Reply-To: <20250730060543.1735971-1-sai.krishna.potthuri@amd.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:55:02 +0200
X-Gm-Features: Ac12FXzR0M0mFy6ZPqWaS6vLojYGCwrlmKHrnZEElZA3PnZ6Uz4ev6cpqb4ddLI
Message-ID: <CAPDyKFpjtLjgRZ-q2VJWtqw5f=jZ7VpvSO3pCd0PUM5b-0p=0g@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-of-arasan: Ensure CD logic stabilization
 before power-up
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, git@amd.com, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_035539_940393_420BF37E 
X-CRM114-Status: GOOD (  28.98  )
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

On Wed, 30 Jul 2025 at 08:05, Sai Krishna Potthuri
<sai.krishna.potthuri@amd.com> wrote:
>
> During SD suspend/resume without a full card rescan (when using
> non-removable SD cards for rootfs), the SD card initialization may fail
> after resume. This occurs because, after a host controller reset, the
> card detect logic may take time to stabilize due to debounce logic.
> Without waiting for stabilization, the host may attempt powering up the
> card prematurely, leading to command timeouts during resume flow.
> Add sdhci_arasan_set_power_and_bus_voltage() to wait for the card detect
> stable bit before power up the card. Since the stabilization time
> is not fixed, a maximum timeout of one second is used to ensure
> sufficient wait time for the card detect signal to stabilize.
>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe


> ---
> Changes in v3:
> - Add quirk to sdhci_arasan_of_data and assigned them to
> sdhci_arasan->quirks in probe instead of using of_device_is_compatible().
> Changes in v2:
> - Use read_poll_timeout() instead of readl_poll_timeout().
> - Enable the CD stable check using platform specific quirk.
> - Define the quirk for Xilinx/AMD ZynqMP, Versal and Versal NET platforms.
>
>  drivers/mmc/host/sdhci-of-arasan.c | 33 ++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 42878474e56e..60dbc815e501 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -99,6 +99,9 @@
>  #define HIWORD_UPDATE(val, mask, shift) \
>                 ((val) << (shift) | (mask) << ((shift) + 16))
>
> +#define CD_STABLE_TIMEOUT_US           1000000
> +#define CD_STABLE_MAX_SLEEP_US         10
> +
>  /**
>   * struct sdhci_arasan_soc_ctl_field - Field used in sdhci_arasan_soc_ctl_map
>   *
> @@ -206,12 +209,15 @@ struct sdhci_arasan_data {
>   * 19MHz instead
>   */
>  #define SDHCI_ARASAN_QUIRK_CLOCK_25_BROKEN BIT(2)
> +/* Enable CD stable check before power-up */
> +#define SDHCI_ARASAN_QUIRK_ENSURE_CD_STABLE    BIT(3)
>  };
>
>  struct sdhci_arasan_of_data {
>         const struct sdhci_arasan_soc_ctl_map *soc_ctl_map;
>         const struct sdhci_pltfm_data *pdata;
>         const struct sdhci_arasan_clk_ops *clk_ops;
> +       u32 quirks;
>  };
>
>  static const struct sdhci_arasan_soc_ctl_map rk3399_soc_ctl_map = {
> @@ -514,6 +520,24 @@ static int sdhci_arasan_voltage_switch(struct mmc_host *mmc,
>         return -EINVAL;
>  }
>
> +static void sdhci_arasan_set_power_and_bus_voltage(struct sdhci_host *host, unsigned char mode,
> +                                                  unsigned short vdd)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
> +       u32 reg;
> +
> +       /*
> +        * Ensure that the card detect logic has stabilized before powering up, this is
> +        * necessary after a host controller reset.
> +        */
> +       if (mode == MMC_POWER_UP && sdhci_arasan->quirks & SDHCI_ARASAN_QUIRK_ENSURE_CD_STABLE)
> +               read_poll_timeout(sdhci_readl, reg, reg & SDHCI_CD_STABLE, CD_STABLE_MAX_SLEEP_US,
> +                                 CD_STABLE_TIMEOUT_US, false, host, SDHCI_PRESENT_STATE);
> +
> +       sdhci_set_power_and_bus_voltage(host, mode, vdd);
> +}
> +
>  static const struct sdhci_ops sdhci_arasan_ops = {
>         .set_clock = sdhci_arasan_set_clock,
>         .get_max_clock = sdhci_pltfm_clk_get_max_clock,
> @@ -521,7 +545,7 @@ static const struct sdhci_ops sdhci_arasan_ops = {
>         .set_bus_width = sdhci_set_bus_width,
>         .reset = sdhci_arasan_reset,
>         .set_uhs_signaling = sdhci_set_uhs_signaling,
> -       .set_power = sdhci_set_power_and_bus_voltage,
> +       .set_power = sdhci_arasan_set_power_and_bus_voltage,
>         .hw_reset = sdhci_arasan_hw_reset,
>  };
>
> @@ -570,7 +594,7 @@ static const struct sdhci_ops sdhci_arasan_cqe_ops = {
>         .set_bus_width = sdhci_set_bus_width,
>         .reset = sdhci_arasan_reset,
>         .set_uhs_signaling = sdhci_set_uhs_signaling,
> -       .set_power = sdhci_set_power_and_bus_voltage,
> +       .set_power = sdhci_arasan_set_power_and_bus_voltage,
>         .irq = sdhci_arasan_cqhci_irq,
>  };
>
> @@ -1447,6 +1471,7 @@ static const struct sdhci_arasan_clk_ops zynqmp_clk_ops = {
>  static struct sdhci_arasan_of_data sdhci_arasan_zynqmp_data = {
>         .pdata = &sdhci_arasan_zynqmp_pdata,
>         .clk_ops = &zynqmp_clk_ops,
> +       .quirks = SDHCI_ARASAN_QUIRK_ENSURE_CD_STABLE,
>  };
>
>  static const struct sdhci_arasan_clk_ops versal_clk_ops = {
> @@ -1457,6 +1482,7 @@ static const struct sdhci_arasan_clk_ops versal_clk_ops = {
>  static struct sdhci_arasan_of_data sdhci_arasan_versal_data = {
>         .pdata = &sdhci_arasan_zynqmp_pdata,
>         .clk_ops = &versal_clk_ops,
> +       .quirks = SDHCI_ARASAN_QUIRK_ENSURE_CD_STABLE,
>  };
>
>  static const struct sdhci_arasan_clk_ops versal_net_clk_ops = {
> @@ -1467,6 +1493,7 @@ static const struct sdhci_arasan_clk_ops versal_net_clk_ops = {
>  static struct sdhci_arasan_of_data sdhci_arasan_versal_net_data = {
>         .pdata = &sdhci_arasan_versal_net_pdata,
>         .clk_ops = &versal_net_clk_ops,
> +       .quirks = SDHCI_ARASAN_QUIRK_ENSURE_CD_STABLE,
>  };
>
>  static struct sdhci_arasan_of_data intel_keembay_emmc_data = {
> @@ -1937,6 +1964,8 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
>         if (of_device_is_compatible(np, "rockchip,rk3399-sdhci-5.1"))
>                 sdhci_arasan_update_clockmultiplier(host, 0x0);
>
> +       sdhci_arasan->quirks |= data->quirks;
> +
>         if (of_device_is_compatible(np, "intel,keembay-sdhci-5.1-emmc") ||
>             of_device_is_compatible(np, "intel,keembay-sdhci-5.1-sd") ||
>             of_device_is_compatible(np, "intel,keembay-sdhci-5.1-sdio")) {
> --
> 2.25.1
>

