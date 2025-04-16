Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18194C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvN8SOjmNm8vvVPr99tsFG2WGFqFOuiF5wi0Uvwa5Ow=; b=qSLmvGwUGCA4ToxWMO5b3Tg2aV
	7tyYE9qIbA2kkRPDpPAB9e6Xhx2dLap0LJV/QaYbRIldDp3bs1ybNPnI27sWqKen0mdkVVcLGhAT+
	yRzqxvtUyU5u0v3x/GHi53jBRazBk1PMjAPU7zCEJHrf0C5rRakpwFCOA0SOsdM/SGB9R2sSz6ZDj
	TNKZppJHETp43WZS0vSns34KRTcMHiZjJ9I8bWwVaxDPIdurkB1u/CHspIm0QpfulD0fJkQWxS0tU
	cXvGv8M0w9VCkWezPz2Pe1nbXqrUyXtGeQ6RcB3OVYxTWmlHUgAuznCiu5XJ8qtEBk9fRAVeOF2FG
	MfZVhyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51nf-00000009Uop-0GZk;
	Wed, 16 Apr 2025 12:23:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51Wf-00000009RIf-0gxe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B9A2A43191;
	Wed, 16 Apr 2025 12:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45FAC4CEE2;
	Wed, 16 Apr 2025 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744805155;
	bh=bnMHt1rL/O6Hg4QOcjQu/TboqXC7jvmxdMfDriXSJrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pafbQmE0kdKd2epxSFbX+aHj66P+4Irm/VJM0YBN2/Us1PDyFps2Hwx05AkWO0eIb
	 T/LJTHBvb2Ixpd9fE4uspC+NmUYvjrZ+PB47zKk/Y7DyJuNqjGPouPQYbPwVAAvoEl
	 89wXmy7bm/3ey0J/fgTpt9X7iJJMSn8V21uVhlm8HuoAlUyKU3ZdqIyLPyO8312AYb
	 CJQgk9FNYOWRLqK/ClgrcpjSnGg/gHRLtRrcR7O3kN1q8PpZibBq+7TlgZjHNxXt6u
	 BbQv9wBaEhz5nM85jvH/tVhCF7wkp8oCkuE39Nx0LAyyTPsOFgBGD0wuy2+b+kXBnv
	 VSus8NV6ceJpw==
Date: Wed, 16 Apr 2025 14:05:44 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <quic_spratap@quicinc.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Elliot Berman <elliotb317@gmail.com>,
	Elliot Berman <elliot.berman@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/5] firmware: psci: Read and use vendor reset types
Message-ID: <Z/+dGLAGXpf9bX7G@lpieralisi>
References: <20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com>
 <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
 <Z9QQw6BcE7IXzu+r@lpieralisi>
 <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
 <Z/U95G+2GsoLD6Mi@lpieralisi>
 <973eaca7-0632-53d8-f892-fe4d859ebbac@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <973eaca7-0632-53d8-f892-fe4d859ebbac@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050557_350556_E41E3C2D 
X-CRM114-Status: GOOD (  72.72  )
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

On Wed, Apr 09, 2025 at 11:48:24PM +0530, Shivendra Pratap wrote:
> 
> 
> On 4/8/2025 8:46 PM, Lorenzo Pieralisi wrote:
> > On Tue, Mar 25, 2025 at 07:33:36PM +0530, Mukesh Ojha wrote:
> >> On Fri, Mar 14, 2025 at 12:19:31PM +0100, Lorenzo Pieralisi wrote:
> >>> On Mon, Mar 03, 2025 at 01:08:31PM -0800, Elliot Berman wrote:
> >>>> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> >>>>
> >>>> SoC vendors have different types of resets and are controlled through
> >>>> various registers. For instance, Qualcomm chipsets can reboot to a
> >>>> "download mode" that allows a RAM dump to be collected. Another example
> >>>> is they also support writing a cookie that can be read by bootloader
> >>>> during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> >>>> vendor reset types to be implemented without requiring drivers for every
> >>>> register/cookie.
> >>>>
> >>>> Add support in PSCI to statically map reboot mode commands from
> >>>> userspace to a vendor reset and cookie value using the device tree.
> >>>
> >>> I have managed to discuss a little bit this patchset over the last
> >>> few days and I think we have defined a plan going forward.
> >>>
> >>> A point that was raised is:
> >>>
> >>> https://man7.org/linux/man-pages/man2/reboot.2.html
> >>>
> >>> LINUX_REBOOT_CMD_RESTART2 *arg command, what is it supposed to
> >>> represent ?
> >>>
> >>> Is it the mode the system should reboot into OR it is the
> >>> actual command to be issued (which is what this patchset
> >>> implements) ?
> >>>
> >>> LINUX_REBOOT_CMD_RESTART "..a default restart..."
> >>>
> >>> It is unclear what "default" means. We wonder whether the
> >>> reboot_mode variable was introduced to _define_ that "default".
> >>>
> >>> So, in short, my aim is trying to decouple reboot_mode from the
> >>> LINUX_REBOOT_CMD_RESTART2 *arg command.
> >>>
> >>> I believe that adding a sysfs interface to reboot-mode driver
> >>> infrastructure would be useful, so that the commands would
> >>> be exposed to userspace and userspace can set the *arg command
> >>> specifically to issue a given reset/mode.
> >>>
> >>> I wonder why this is not already in place for eg syscon-reboot-mode
> >>> resets, how does user space issue a command in those systems if the
> >>> available commands aren't exposed to userspace ?
> >>>
> >>> Is there a kernel entity exposing those "modes" to userspace, somehow ?
> >>>
> >>>> A separate initcall is needed to parse the devicetree, instead of using
> >>>> psci_dt_init because mm isn't sufficiently set up to allocate memory.
> >>>>
> >>>> Reboot mode framework is close but doesn't quite fit with the
> >>>> design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> >>>> be solved but doesn't seem reasonable in sum:
> >>>>  1. reboot mode registers against the reboot_notifier_list, which is too
> >>>>     early to call SYSTEM_RESET2. PSCI would need to remember the reset
> >>>>     type from the reboot-mode framework callback and use it
> >>>>     psci_sys_reset.
> >>>>  2. reboot mode assumes only one cookie/parameter is described in the
> >>>>     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
> >>>>     cookie.
> >>>
> >>> This can be changed and I think it should, so that the reboot modes
> >>> are exposed to user space and PSCI can use that.
> >>>
> >> In the case of a regular reboot or panic, the reboot/panic notifiers run
> >> first, followed by the restart notifiers. The PSCI reset/reset2 should
> >> be the last call from Linux, and ideally, this call should not fail.
> >>
> >> Reboot mode notifiers => restart notifiers or Panic notifiers => restart
> >> notifiers
> >>
> >> So, if I understand correctly, you mean that we can change the reboot
> >> mode framework to expose the arguments available to user space. We can
> >> extend it to accept magic and cookies, save them in the reboot
> >> framework, and retrieve them via a call from PSCI during a regular
> >> reboot or panic based on the current arguments. Is this leading towards
> >> writing an ARM-specific PSCI-reboot-mode driver, which in its reboot
> >> notifier callback saves the magic and cookies, and these magic and
> >> cookies will be used during psci_sys_reset2()? Or is there something
> >> wrong with my understanding?
> > 
> > No, you got it right (apologies for the delay in replying) - if the
> > case for making reboot mode available to user space is accepted.
> > 
> 
> Agree that the available modes should be exposed to usespace via sysfs interface
> and we should implement it. Also #1 and #2 can be handled via some
> changes in the design as mentioned in above discussion.
> 
> I have one doubt though when we implement this via reboot-mode framework.
> The current patch implements PSCI ARM PSCI SYSTEM RESET2 vendor reset types.
> psci driver is initialized very early at boot but potential ARM psci reboot-mode
> driver will not probe at that stage and the ARM PSCI SYSTEM RESET2 vendor reset
> types functionality will not be available in psci reset path until the reboot-mode
> driver probes. Will this cause any limitation on usage of ARM's PSCI vendor-reset
> types for early device resets?
> 
> One use-case may be an early device crash or a early reset where a vendor 
> wants to use PSCI SYSTEM RESET2 vendor reset type to a reset the device to a 
> specific state but may not be able to use this driver.
> (eg: a kernel panic at early boot where a vendor wants to reset device 
> to a specific state using vendor reset. Currently panic passes a NULL
> (*arg command) while device reset but it may be explored for vendor specific
> reset).

As you said, that would not be a PSCI only issue - *if* we wanted to
plug in this use case we should find a way to do it at reboot mode
driver level.

As a matter of fact, this is not a mainline issue AFAICS.

Even if we did not design this as a reboot mode driver there would be a
time window where you would not be able to use vendor resets on panic.

I don't see it as a major roadblock at the moment.

Thanks,
Lorenzo

> 
> - Shivendra
> 
> >> P.S. We appreciate Elliot for his work and follow-up on this while being
> >> employed at Qualcomm.
> > 
> > Yes I sincerely do for his patience, thank you.
> > 
> > Lorenzo
> > 
> >>>>  3. psci cpuidle driver already registers a driver against the
> >>>>     arm,psci-1.0 compatible. Refactoring would be needed to have both a
> >>>>     cpuidle and reboot-mode driver.
> >>>>
> >>>> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/firmware/psci/psci.c | 105 +++++++++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 105 insertions(+)
> >>>>
> >>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> >>>> index a1ebbe9b73b136218e9d9f9b8daa7756b3ab2fbe..6f8c47deaec0225f26704e1f3bcad52603127a85 100644
> >>>> --- a/drivers/firmware/psci/psci.c
> >>>> +++ b/drivers/firmware/psci/psci.c
> >>>> @@ -80,6 +80,14 @@ static u32 psci_cpu_suspend_feature;
> >>>>  static bool psci_system_reset2_supported;
> >>>>  static bool psci_system_off2_hibernate_supported;
> >>>>  
> >>>> +struct psci_reset_param {
> >>>> +	const char *mode;
> >>>> +	u32 reset_type;
> >>>> +	u32 cookie;
> >>>> +};
> >>>> +static struct psci_reset_param *psci_reset_params __ro_after_init;
> >>>> +static size_t num_psci_reset_params __ro_after_init;
> >>>> +
> >>>>  static inline bool psci_has_ext_power_state(void)
> >>>>  {
> >>>>  	return psci_cpu_suspend_feature &
> >>>> @@ -306,9 +314,39 @@ static int get_set_conduit_method(const struct device_node *np)
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> +static int psci_vendor_system_reset2(const char *cmd)
> >>>> +{
> >>>> +	unsigned long ret;
> >>>> +	size_t i;
> >>>> +
> >>>> +	for (i = 0; i < num_psci_reset_params; i++) {
> >>>> +		if (!strcmp(psci_reset_params[i].mode, cmd)) {
> >>>> +			ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> >>>> +					     psci_reset_params[i].reset_type,
> >>>> +					     psci_reset_params[i].cookie, 0);
> >>>> +			/*
> >>>> +			 * if vendor reset fails, log it and fall back to
> >>>> +			 * architecture reset types
> >>>
> >>> That's not what the code does.
> >>>
> >> Ack.
> >>
> >> -Mukesh
> >>
> >>>> +			 */
> >>>> +			pr_err("failed to perform reset \"%s\": %ld\n", cmd,
> >>>> +			       (long)ret);
> >>>> +			return 0;
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	return -ENOENT;
> >>>> +}
> >>>> +
> >>>>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> >>>>  			  void *data)
> >>>>  {
> >>>> +	/*
> >>>> +	 * try to do the vendor system_reset2
> >>>> +	 * If there wasn't a matching command, fall back to architectural resets
> >>>> +	 */
> >>>> +	if (data && !psci_vendor_system_reset2(data))
> >>>> +		return NOTIFY_DONE;
> >>>> +
> >>>>  	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> >>>>  	    psci_system_reset2_supported) {
> >>>>  		/*
> >>>> @@ -795,6 +833,73 @@ static const struct of_device_id psci_of_match[] __initconst = {
> >>>>  	{},
> >>>>  };
> >>>>  
> >>>> +#define REBOOT_PREFIX "mode-"
> >>>> +
> >>>> +static int __init psci_init_system_reset2_modes(void)
> >>>> +{
> >>>> +	const size_t len = strlen(REBOOT_PREFIX);
> >>>> +	struct psci_reset_param *param;
> >>>> +	struct device_node *psci_np __free(device_node) = NULL;
> >>>> +	struct device_node *np __free(device_node) = NULL;
> >>>> +	struct property *prop;
> >>>> +	size_t count = 0;
> >>>> +	u32 magic[2];
> >>>> +	int num;
> >>>> +
> >>>> +	if (!psci_system_reset2_supported)
> >>>> +		return 0;
> >>>> +
> >>>> +	psci_np = of_find_matching_node(NULL, psci_of_match);
> >>>> +	if (!psci_np)
> >>>> +		return 0;
> >>>> +
> >>>> +	np = of_find_node_by_name(psci_np, "reset-types");
> >>>> +	if (!np)
> >>>> +		return 0;
> >>>
> >>> Related to my initial question above. If LINUX_REBOOT_CMD_RESTART2 *arg command,
> >>> is the actual reset to be issued, should we add a default mode "cold"
> >>> and, if SYSTEM_RESET2 is supported, a "warm" reset mode too ?
> >>>
> >>> It all boils down to what *arg represents - adding "cold" and "warm"
> >>> modes would remove the dependency on reboot_mode for resets issued
> >>> through LINUX_REBOOT_CMD_RESTART2, the question is whether this
> >>> is the correct thing to do.
> >>>
> >>> Comments very welcome.
> >>>
> >>> Thanks,
> >>> Lorenzo
> >>>
> >>>> +
> >>>> +	for_each_property_of_node(np, prop) {
> >>>> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> >>>> +			continue;
> >>>> +		num = of_property_count_u32_elems(np, prop->name);
> >>>> +		if (num != 1 && num != 2)
> >>>> +			continue;
> >>>> +
> >>>> +		count++;
> >>>> +	}
> >>>> +
> >>>> +	param = psci_reset_params =
> >>>> +		kcalloc(count, sizeof(*psci_reset_params), GFP_KERNEL);
> >>>> +	if (!psci_reset_params)
> >>>> +		return -ENOMEM;
> >>>> +
> >>>> +	for_each_property_of_node(np, prop) {
> >>>> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> >>>> +			continue;
> >>>> +
> >>>> +		num = of_property_read_variable_u32_array(np, prop->name, magic,
> >>>> +							  1, ARRAY_SIZE(magic));
> >>>> +		if (num < 0) {
> >>>> +			pr_warn("Failed to parse vendor reboot mode %s\n",
> >>>> +				param->mode);
> >>>> +			kfree_const(param->mode);
> >>>> +			continue;
> >>>> +		}
> >>>> +
> >>>> +		param->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> >>>> +		if (!param->mode)
> >>>> +			continue;
> >>>> +
> >>>> +		/* Force reset type to be in vendor space */
> >>>> +		param->reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic[0];
> >>>> +		param->cookie = num > 1 ? magic[1] : 0;
> >>>> +		param++;
> >>>> +		num_psci_reset_params++;
> >>>> +	}
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +arch_initcall(psci_init_system_reset2_modes);
> >>>> +
> >>>>  int __init psci_dt_init(void)
> >>>>  {
> >>>>  	struct device_node *np;
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>

