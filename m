Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F27CCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zjnCK7lHfVwwEax6BdpktZ655SImuozj2GtxMohewo=; b=McXSm1YKBMYcJEy2J3X2XSjkYH
	ei9HmrXpCIuZGaZfkhZjUgaEmVaTMbMjPDXJqoGpAuVC2nogFp0/98rL6d1w8vrMWGiYvaErDy7b8
	l+vvJ/4LHPfsLYhQcpZq8J6uwQU1CqahF3uscvVU1EUNDmhDlcQ83K3eJlRmSrFwOhK33w+EXf6zF
	41Us+RY0fgv4aXuSq9NmyFurBVAHBaVtXTsCzlg4jVfzfHgzH9+Ursz91mkmqsB76ZtjOy9v3VMXf
	FQalWPDn48lNfmqoXZCs/Y2Mjl8iEtHEggy0gnNtwBYqIy3qk6yjxCKzXaHEdrmJV6Ux9eDiFTpRw
	iru8lS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7di-0000000BUGJ-0tzR;
	Fri, 12 Jun 2026 19:34:02 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7df-0000000BUFV-1YxT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:34:01 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 10BB6EC00AB;
	Fri, 12 Jun 2026 15:33:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 12 Jun 2026 15:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781292836; x=1781379236; bh=/zjnCK7lHf
	VwwEax6BdpktZ655SImuozj2GtxMohewo=; b=Eqielws52KTkw7zsOfi+xi3JhS
	AhTt0V5YidG6xsprKVry4W/I8lRr/M54c5uBxkovOLIND5UlrduRrzhZZcl39bw8
	f/2Bl5YmbKXmL/cKDdAl0Dsr2x2N4e5029Aes58mZG0y3Fnt5gxHo8KAkTB0kKtw
	eEAm3XvLMThOYm1UoNjfn+ME1w8BxDRPgfeR1/53QqZaWp2qgr5MxJqCuc0HzxRA
	Sgx+fYtCOORyIkRrEuJVHtWL1PJhxDKGak4P0Ir191aGSg92X8cqpnb5ZQEKuHjo
	tYz6Pj1xhH1X2N3ml+t+SpX3uQpHaYW3AINSb/Okuk312q4Uvl0vkvxXOK3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781292836; x=1781379236; bh=/zjnCK7lHfVwwEax6BdpktZ655SImuozj2G
	txMohewo=; b=S4mteoiPNXjeiRCHIoVA8vJ0BaFIJTW9OCr+1LhzHKcdG1Vdrxp
	FnDWNmKHXV7aCo1pUSqAzznVNqPLrQwHRWzoN8tg9nPRqlvQhgHjudmwngNekeqN
	UiTRDKTVXCTO5xOxjBbTshkMEX+1p8Ov0mr0ZeqBrss3HEUJFnOn+1PpClr6KGCH
	GEvw5gINadtgbhC5U0e6Qw76/o/GxDp7ME2voSSgYSLkvkS90GYE+4zi+AnM6GxB
	qciZm9jkZK+FZW7gS70amUQOEXWlnA+Qm9dfENUCAc49WI6vq1wdRBjq46mpeXMN
	57oGX4XBCWOhGJfPbnxYwlAK2jJ/scpa5hA==
X-ME-Sender: <xms:I18salrCtoNgpi7fQ9Z42eRSt1ZmCTgIiA4YpRvrCuQUIBWMDTDAig>
    <xme:I18saqN8GbEhuaPTBDAwPxdUQ1nKVKDaWrKwGMBqjN7f2A2c3x2-8jUmgo5xj8abr
    88gBkLn6V71LSwGtVmqC7M6QeZuwHcekZ6u5fd3gWNff1u_s8_VvVQ>
X-ME-Received: <xmr:I18sal1YNhUsmmc-p702NUFzJ5TfuS83gPqC_MGbQwDsmnFIRVgvilMAP0ZcHTcc8vQxPHA7HyRi9PJPq_vDnFDW4fJjdl_xelo>
X-ME-Proxy-Cause: dmFkZTGI2O/RUKdXzrdaA/y5hk0nMevJyo5wpdtte2IIVQPQtt4IUNkxwbLYb1ph7d7aZ7
    qoaqPpXV13WMDmKoQwHaTjXD0O/E1YXQZ4Q7mWuUfUR/VBzhilBLOUrdlJ1GDPjZD/8TXx
    wM740ipnONQgsTZQnBxGrqwaImd1D95TI8PCkZFUyBSbJbauwB/KYnV0sgyV5LhfnMmoHK
    bOUfUcHq5w6PnHIvFwC3dibhy+aJgYNvNtp6RNkvoblKNzN4oVBWl1j9WYec27AAC3YfqI
    Is/0pceSEPg67f4NhdlzznSlTSrFo2eppW1B/gI+pi5KS7854SUO/GGh32t2CmFPqBCLfd
    SBetDG+AiUURByEATKkRqceEHBcmohouYvU0fGL/t2YDkMlCF+rcpKiGUpLncuGPVKMvzQ
    McTc/H+QIJutwMyF16ufi3izOfEBrYUYGnBJLCwBZEP9e/0eymfpSWY3LPpk9EtlFs5A2t
    eT/dA4CM1ByvAIR+BPCNDt6xiL1acOl15pOmf1jeRLyhDUPR8UhrOaPuLlX2KL0/4jnmNC
    PfDUzkgTQ8IxJzsM6bw0Z+z0otQmdP573mk+L0pK9k5CZP2AMWIIPaZHBtEdAF/UTWyf+k
    if8eGxGG2hAut4rBJhxJQ6Rt62QE529L8rgci2wdeWACY3+dKSjM2z4c6aAQ
X-ME-Proxy: <xmx:I18sahDjzwRIkKecIJB9kWO8FWZX1fKb_ZnK8HZAG9SLXt_La7JuCw>
    <xmx:I18saqI9xIbxquipC7zA5bH7ywZ5g1oaLohMsQ6y8U-1zRpnSVNZgA>
    <xmx:I18saimA5w9VWQYc4ILpX6GKsftFz3WF_ezruN-M7FBqljOZdrdr6A>
    <xmx:I18sarZjiT9BPSIuWTvhdvZiVJXjhzFhkBtAMwOYL6tDz0abNTeveQ>
    <xmx:JF8satQOV05TQkQJ4JSKu97NzoEEwNweqdo72hHlcAQ8PB4sWIwTSD_W>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 15:33:54 -0400 (EDT)
Date: Fri, 12 Jun 2026 21:33:53 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Sebastian Reichel <sre@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] power: supply: macsmc: Support macOS 27 SMC firmware
Message-ID: <20260612193353.GA7993@robin.jannau.net>
References: <20260612-gate-power-v2-1-de76cb9bb7ef@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-gate-power-v2-1-de76cb9bb7ef@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_123359_836337_A2C9D56A 
X-CRM114-Status: GOOD (  28.06  )
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

On Fri, Jun 12, 2026 at 08:36:03PM +0200, Sasha Finkelstein wrote:
> The SMC firmware included in macOS 27 changed the size of BCF0 key from
> 4 to 1 bytes. This key is used for indicating that battery state is
> critically low.
> 
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

I think
Fixes: 0ebf821cf6c7 ("power: supply: Add macsmc-power driver for Apple Silicon")
and "Cc: stable" could be justified. Timing is a little unfortunate with
v7.1 expected on sunday.

> ---
> Changes in v2:
> - Addressing review feedback
> - Link to v1: https://patch.msgid.link/20260611-gate-power-v1-1-8a62721086c7@chaosmail.tech
> ---
>  drivers/power/supply/macsmc-power.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
> index 33ca07460f3a..747315e372bc 100644
> --- a/drivers/power/supply/macsmc-power.c
> +++ b/drivers/power/supply/macsmc-power.c
> @@ -86,6 +86,7 @@ struct macsmc_power {
>  	bool has_ch0i; /* Force discharge (Older firmware) */
>  	bool has_ch0c; /* Inhibit charge (Older firmware) */
>  	bool has_chte; /* Inhibit charge (Modern firmware) */
> +	bool bcf0_1byte; /* Battery critical key is 1 byte (Modern firmware) */
>  
>  	u8 num_cells;
>  	int nominal_voltage_mv;
> @@ -273,6 +274,19 @@ static int macsmc_battery_get_date(const char *s, int *out)
>  	return 0;
>  }
>  
> +static int macsmc_battery_read_bcf0(struct macsmc_power *power, u32 *val)
> +{
> +	u8 tval = 0;
> +	int ret;
> +
> +	if (!power->bcf0_1byte)
> +		return apple_smc_read_u32(power->smc, SMC_KEY(BCF0), val);
> +
> +	ret = apple_smc_read_u8(power->smc, SMC_KEY(BCF0), &tval);
> +	*val = tval;
> +	return ret;
> +}

I think the following is slightly easier to read

{
	if (power->bcf0_1byte) {
		u8 tval = 0;
		int ret = apple_smc_read_u8(power->smc, SMC_KEY(BCF0), &tval);
		*val = tval;
		return ret;
	}

	return apple_smc_read_u32(power->smc, SMC_KEY(BCF0), val);
}

Not worth a respin in itself but worthwhile if there's a v3 for the the
Fixes: tag.

> +
>  static int macsmc_battery_get_capacity_level(struct macsmc_power *power)
>  {
>  	bool flag;
> @@ -280,7 +294,7 @@ static int macsmc_battery_get_capacity_level(struct macsmc_power *power)
>  	int ret;
>  
>  	/* Check for emergency shutdown condition */
> -	if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val) >= 0 && val)
> +	if (macsmc_battery_read_bcf0(power, &val) >= 0 && val)
>  		return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
>  
>  	/* Check AC status for whether we could boot in this state */
> @@ -577,7 +591,7 @@ static void macsmc_power_critical_work(struct work_struct *wrk)
>  	 * Check if SMC flagged the battery as empty.
>  	 * We trigger a graceful shutdown to let the OS save data.
>  	 */
> -	if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &bcf0) == 0 && bcf0 != 0) {
> +	if (macsmc_battery_read_bcf0(power, &bcf0) == 0 && bcf0 != 0) {
>  		power->orderly_shutdown_triggered = true;
>  		dev_crit(power->dev, "Battery critical (empty flag set). Triggering orderly shutdown.\n");
>  		orderly_poweroff(true);
> @@ -616,6 +630,7 @@ static int macsmc_power_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
>  	struct power_supply_config psy_cfg = {};
> +	struct apple_smc_key_info info;
>  	struct macsmc_power *power;
>  	bool has_battery = false;
>  	bool has_ac_adapter = false;
> @@ -714,6 +729,20 @@ static int macsmc_power_probe(struct platform_device *pdev)
>  		if (apple_smc_key_exists(smc, SMC_KEY(CH0I)))
>  			power->has_ch0i = true;
>  
> +		ret = apple_smc_get_key_info(power->smc, SMC_KEY(BCF0), &info);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to determine BCF0 key size\n");
> +			return ret;
> +		}
> +		if (info.size == 1)
> +			power->bcf0_1byte = true;
> +		else if (info.size == 4)
> +			power->bcf0_1byte = false;
> +		else {
> +			dev_err(&pdev->dev, "Unexpected BCF0 key size %d\n", info.size);
> +			return -EIO;
> +		}
> +
>  		/* Reset "Optimised Battery Charging" flags to default state */
>  		if (power->has_chte)
>  			apple_smc_write_u32(smc, SMC_KEY(CHTE), 0);
> @@ -766,7 +795,7 @@ static int macsmc_power_probe(struct platform_device *pdev)
>  		power->nominal_voltage_mv = MACSMC_NOMINAL_CELL_VOLTAGE_MV * power->num_cells;
>  
>  		/* Enable critical shutdown notifications by reading status once */
> -		apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val32);
> +		macsmc_battery_read_bcf0(power, &val32);
>  
>  		psy_cfg.drv_data = power;
>  		power->batt = devm_power_supply_register(dev, &power->batt_desc, &psy_cfg);
> 
> ---

Reviewed-by: Janne Grunau <j@jannau.net>

thanks
Janne

