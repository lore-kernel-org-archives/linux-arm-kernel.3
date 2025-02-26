Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1043BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWoHU8hu46dRejoYbRwPdVFyOWD54ZJ4E158Xpmj8u8=; b=5BvTYVU0QheNrA7kqsVhJ7eM/r
	KyFIWBWEz2wlfrdGag5ZsoCD+ztzoAHyfecik05SDsmc+57BpRP2xyIB7oi03oLWVWBoDcB/38mXl
	JwYxAHzUIFNhzUUh9hHQo6XCRpdaGg4UxVNORdTbjvF2mk9i7MT3/zrwJfSdiZh4RxiPzWd9uAXR0
	cwg3iIbAgVCarygHQJ5my2yBpQYKmohfpRXVkN7xr2j/y54MyvJ3+2Dx1jcS/3CmgQLux64vwKD9a
	Zr++jyrlfctT05SSJANjA7T8pfH+3syz+37KvXsGQ431IVj1iSOL/+uXJ65PV6WIUB7ZMSAjyaTkU
	qJr7dMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJF0-00000004FbF-0B2n;
	Wed, 26 Feb 2025 15:22:30 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIPD-000000045Mt-0pa8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C523661226;
	Wed, 26 Feb 2025 14:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DACC4CED6;
	Wed, 26 Feb 2025 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740580138;
	bh=imG2eoF7EhULeRCWxlkU478DrsG7zuM8IA1zXttiVIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOoWo6I4axjc7/g3HzbBnRFc+bA68ZZR3cVJiGZ4m/qgqjPAatfRVKgjcDg9ZZGQt
	 PimKjt9TdT6ogmZnuyKrvpZckMidtvJ0PxOJNFPI2CiW1DBM8t6hhYYrlJj3hZrW4+
	 Y0+M+8c0TVPmzP2HAt5KWoP8LXTK9ytXg9B4f1HeUg+bVlZE4JgD4lUn4RNcYHQm76
	 qL8irsILkPnFzN4ukaj5mwEQl2ItHgXji0xyV+1/nrltYul0p1dHIc1cu0zIZLD7OI
	 N2smNVVERmR8m7QXregyeB9z/xbQRf55L5mB+mim13MpOSJHcys2hX/gcPdvmgNcGY
	 4q11+sAs4NzaQ==
Date: Wed, 26 Feb 2025 15:28:47 +0100
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
Message-ID: <Z78lH/XErc7G8bL9@lpieralisi>
References: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
 <20241107-arm-psci-system_reset2-vendor-reboots-v8-3-e8715fa65cb5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-arm-psci-system_reset2-vendor-reboots-v8-3-e8715fa65cb5@quicinc.com>
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
> 
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

Mulling over this. If a command (data) was provided and a PSCI vendor
reset parsed at boot, if the vendor reset fails, isn't it correct to
just fail reboot instead of falling back to architectural resets ?

What's missing is defining the "contract" between the
LINUX_REBOOT_CMD_RESTART2 arg parameter and the kernel reboot
type that is executed.

I do wonder whether this is an opportunity to deprecate reboot_mode
altogether on arm64 (I think that the relationship between REBOOT_WARM
and REBOOT_SOFT with PSCI arch warm reset is already loose - let alone
falling back to cold reset if reboot_mode == REBOOT_GPIO - which does
not make any sense at all simply because REBOOT_GPIO is ill-defined to
say the least).

Thoughts ?

Thanks,
Lorenzo

> +
>  	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>  	    psci_system_reset2_supported) {
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

