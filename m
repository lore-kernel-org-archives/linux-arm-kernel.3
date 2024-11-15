Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B254D6DDE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TL/f6gB+eR6At/50KIxwZ5dbWdax/WfEXDBQV+7s6Q=; b=S90wsHIoYnNySeJEcHgHYw/LZl
	yA9NsHv1rDj4iTBhq6B0WdyPs3MH88lynVgsm7c4Jvl3FF+krguXVt0kw9c/5veOMXWn933ov/f6t
	Y1KWHTl3T7Oc5OGwFqB3FBMCavVFQXqtMu87c4b+9OUIjluwlY2wsYGVycjSe1cduVY1ZkaQsikuk
	CvtGRFkTdde+ukP7P2EvgZTDsuRhsaQksJkySS3cG0dVddEhukg3Ah6yV2O8V/Mq5v4kmYU9RmabN
	sDG6sQfKSOyPLB3+401DnQjtTj7m3yHBwxVKbsgIhzjwfL4uLRX/mrux+wbTCHHWs4Qu8GHhTRAzE
	/BPQK5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwkJ-00000002tie-46yd;
	Fri, 15 Nov 2024 13:52:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwjP-00000002tXE-0Q9V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4BBB5C46EE;
	Fri, 15 Nov 2024 13:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB1EC4CED2;
	Fri, 15 Nov 2024 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731678684;
	bh=MlPuyzzgSsm7Upv0T4jrjr7nvxuVanXJvHn97zg2xk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPtvyYChMaPn5PzQdbSjVCCdUbBtgON+sNttzyOVbc+My1IIaOget9MSj9wgiE9+W
	 NftbX7/VJXCT9NMLnDUNlqJeoovzXCAEPhlNRLLEEQKtEDD0pABgOEvsan220/BIzb
	 HRGiFPOqg6a/dbzL9GRvrP683lcy+nJc0d+EyiL6Y8ltbSXcr+Drzaose5rsdYc1eR
	 BE7c2v4iTK3pO4e4v8WfuBCNt/roopJGTQCg4qTMR2ExqKTrnu1SubgrgR0CzTFHfz
	 7Poo53qVqJD6FJvBqhNhmCPr0sQ5/ZSFMoQMRe+ZopcqRrbFuqpwJTW+E/HmhQVXDS
	 6iYqxQeuqRl7g==
Date: Fri, 15 Nov 2024 14:51:16 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Shivendra Pratap <quic_spratap@quicinc.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 3/6] firmware: psci: Read and use vendor reset types
Message-ID: <ZzdR1HuTpnU1OL/i@lpieralisi>
References: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
 <20241107-arm-psci-system_reset2-vendor-reboots-v8-3-e8715fa65cb5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-arm-psci-system_reset2-vendor-reboots-v8-3-e8715fa65cb5@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_055127_224151_FB4973C5 
X-CRM114-Status: GOOD (  44.79  )
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

On Thu, Nov 07, 2024 at 03:38:27PM -0800, Elliot Berman wrote:
> SoC vendors have different types of resets and are controlled through
> various registers. For instance, Qualcomm chipsets can reboot to a
> "download mode" that allows a RAM dump to be collected. Another example
> is they also support writing a cookie that can be read by bootloader
> during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> vendor reset types to be implemented without requiring drivers for every
> register/cookie.
> 
> Add support in PSCI to statically map reboot mode commands from
> userspace to a vendor reset and cookie value using the device tree.
> 
> A separate initcall is needed to parse the devicetree, instead of using
> psci_dt_init because mm isn't sufficiently set up to allocate memory.

Nit: information below this point is more a cover letter than for the
commit log.

> Reboot mode framework is close but doesn't quite fit with the
> design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> be solved but doesn't seem reasonable in sum:
>  1. reboot mode registers against the reboot_notifier_list, which is too
>     early to call SYSTEM_RESET2. PSCI would need to remember the reset
>     type from the reboot-mode framework callback and use it
>     psci_sys_reset.
>  2. reboot mode assumes only one cookie/parameter is described in the
>     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
>     cookie.
>  3. psci cpuidle driver already registers a driver against the
>     arm,psci-1.0 compatible. Refactoring would be needed to have both a
>     cpuidle and reboot-mode driver.
> 
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  drivers/firmware/psci/psci.c | 104 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 2328ca58bba61fdb677ac20a1a7447882cd0cf22..e60e3f8749c5a6732c51d23a2c1f453361132d9a 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -79,6 +79,14 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void)
>  static u32 psci_cpu_suspend_feature;
>  static bool psci_system_reset2_supported;
>  
> +struct psci_reset_param {
> +	const char *mode;
> +	u32 reset_type;
> +	u32 cookie;
> +};
> +static struct psci_reset_param *psci_reset_params __ro_after_init;
> +static size_t num_psci_reset_params __ro_after_init;
> +
>  static inline bool psci_has_ext_power_state(void)
>  {
>  	return psci_cpu_suspend_feature &
> @@ -305,9 +313,38 @@ static int get_set_conduit_method(const struct device_node *np)
>  	return 0;
>  }
>  
> +static void psci_vendor_system_reset2(const char *cmd)
> +{
> +	unsigned long ret;
> +	size_t i;
> +
> +	for (i = 0; i < num_psci_reset_params; i++) {
> +		if (!strcmp(psci_reset_params[i].mode, cmd)) {
> +			ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +					     psci_reset_params[i].reset_type,
> +					     psci_reset_params[i].cookie, 0);
> +			/*
> +			 * if vendor reset fails, log it and fall back to
> +			 * architecture reset types
> +			 */
> +			pr_err("failed to perform reset \"%s\": %ld\n", cmd,
> +			       (long)ret);
> +			return;
> +		}
> +	}
> +}
> +
>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>  			  void *data)
>  {
> +	/*
> +	 * try to do the vendor system_reset2
> +	 * If the reset fails or there wasn't a match on the command,
> +	 * fall back to architectural resets
> +	 */
> +	if (data && num_psci_reset_params)
> +		psci_vendor_system_reset2(data);
> +
>  	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>  	    psci_system_reset2_supported) {

This is a mess. To issue architectural warm reset we check reboot_mode,
for vendor resets we ignore it - there is no rationale, that's the point
I am making.

Also see my question on the other thread re: user space and reset
"modes".

I appreciate we are not making progress but I don't want to pick up
the pieces later after merging this code - it is unclear to me what's
the best path forward - I would like to understand how other
platforms/arches behave in this respect.

>  		/*
> @@ -750,6 +787,73 @@ static const struct of_device_id psci_of_match[] __initconst = {
>  	{},
>  };
>  
> +#define REBOOT_PREFIX "mode-"
> +
> +static int __init psci_init_system_reset2_modes(void)
> +{
> +	const size_t len = strlen(REBOOT_PREFIX);
> +	struct psci_reset_param *param;
> +	struct device_node *psci_np __free(device_node) = NULL;
> +	struct device_node *np __free(device_node) = NULL;
> +	struct property *prop;
> +	size_t count = 0;
> +	u32 magic[2];
> +	int num;
> +
> +	if (!psci_system_reset2_supported)
> +		return 0;
> +
> +	psci_np = of_find_matching_node(NULL, psci_of_match);
> +	if (!psci_np)
> +		return 0;
> +
> +	np = of_find_node_by_name(psci_np, "reset-types");
> +	if (!np)
> +		return 0;
> +
> +	for_each_property_of_node(np, prop) {
> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> +			continue;
> +		num = of_property_count_u32_elems(np, prop->name);
> +		if (num != 1 && num != 2)
> +			continue;
> +
> +		count++;
> +	}
> +
> +	param = psci_reset_params =
> +		kcalloc(count, sizeof(*psci_reset_params), GFP_KERNEL);
> +	if (!psci_reset_params)
> +		return -ENOMEM;
> +
> +	for_each_property_of_node(np, prop) {
> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> +			continue;
> +
> +		param->mode = kstrdup_const(prop->name + len, GFP_KERNEL);

FWIW - I think you need to keep the logic in the previous loop into account
because that's what is used to allocate param, it is not a given that
param is valid at this stage if I am not mistaken - the previous loop
checked:

	num = of_property_count_u32_elems(np, prop->name);
	if (num != 1 && num != 2)
		continue;

Lorenzo

> +		if (!param->mode)
> +			continue;
> +
> +		num = of_property_read_variable_u32_array(np, prop->name, magic,
> +							  1, ARRAY_SIZE(magic));
> +		if (num < 0) {
> +			pr_warn("Failed to parse vendor reboot mode %s\n",
> +				param->mode);
> +			kfree_const(param->mode);
> +			continue;
> +		}
> +
> +		/* Force reset type to be in vendor space */
> +		param->reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic[0];
> +		param->cookie = num > 1 ? magic[1] : 0;
> +		param++;
> +		num_psci_reset_params++;
> +	}
> +
> +	return 0;
> +}
> +arch_initcall(psci_init_system_reset2_modes);
> +
>  int __init psci_dt_init(void)
>  {
>  	struct device_node *np;
> 
> -- 
> 2.34.1
> 

