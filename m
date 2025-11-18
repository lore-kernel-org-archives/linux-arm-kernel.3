Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8E6CED624
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF+16j3gsEa/KcDqPuJLbf1X/jjqwJ+Jgs6J+k/qitg=; b=yY7nOTUX/4Egghf3p/xaNcno34
	tVPYXf9AUxbq0j4VddMz3Sl8dXUYrxC+odADPX7EOJSEn4bfrVhGWx/jmyPwzUr+CRDW6ABR3GxZ/
	ZEGcIwRXc4zEJcZ6p6L3QeXdnNL5sZy2P5XniBx0VsSWht52zkRPFp50gpdQiU9mREeJTmW67jyLh
	1wLndVLhBkzTqbSroff+aiwvFNnt2P5I4EGjyK2b/B+S0HQcZnHHskQQp3Q2PDw3KRedU2nP1nHEX
	SaqyuASbBRKdFQ9OZlCLidukzVHRGKWEw2I+Imbd2L+7aMLR6PIuvSCRVCLIUdKdOCZWYOBeDyS50
	LXO1514Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKou-00000000PrY-25nN;
	Tue, 18 Nov 2025 12:28:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKot-00000000PrJ-26SF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:28:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 883EA601AA;
	Tue, 18 Nov 2025 12:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33852C4CEFB;
	Tue, 18 Nov 2025 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763468905;
	bh=HkElddSNiWQx84TT3HUUBpi/rNgO0A/CKPAtgfrEFa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0zU4oM1pH8YX2XK6W2GczfPtfKY6olP8Z/ZMzR7Jg8Aa+8BSORrRNvrMFXHb80q+
	 UnxHc6Ywp1OIXy+rIqum7VGZ7Aaj+ryNouvyEJlNDltxDdF4f3R5SIuToTZ24zY1+f
	 spPVFf2ylUfTQs2A/EQLfWO6+mWwfqRkY7NH02wbMlNi9FQsRj6F5kkoXIAWWcMd2K
	 rTow1dvi13KG7jMvA+FgBWq/bbxS/oLHwkP3pm6C0PBRjPebfw5jOYytDHgF7BdqfW
	 y3wS8UoI0Q+MoWethNO00zDIuamTBJAmpVRnqQCwxQ80JKQVllJ5vpU3uyolQez6Wb
	 4ZDPOU5gXd0Gg==
Date: Tue, 18 Nov 2025 13:28:10 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	John Stultz <john.stultz@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <aRxmWrAkD0Vu4pF+@lpieralisi>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
 <aRIfc9iuC2b9DqI+@lpieralisi>
 <80e68e44-a8e0-464a-056e-9f087ad40d51@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80e68e44-a8e0-464a-056e-9f087ad40d51@oss.qualcomm.com>
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

On Mon, Nov 17, 2025 at 11:14:48PM +0530, Shivendra Pratap wrote:
> 
> 
> On 11/10/2025 10:52 PM, Lorenzo Pieralisi wrote:
> > On Sun, Nov 09, 2025 at 08:07:20PM +0530, Shivendra Pratap wrote:
> >> SoC vendors have different types of resets which are controlled
> >> through various hardware registers. For instance, Qualcomm SoC
> >> may have a requirement that reboot with “bootloader” command
> >> should reboot the device to bootloader flashing mode and reboot
> >> with “edl” should reboot the device into Emergency flashing mode.
> >> Setting up such reboots on Qualcomm devices can be inconsistent
> >> across SoC platforms and may require setting different HW
> >> registers, where some of these registers may not be accessible to
> >> HLOS. These knobs evolve over product generations and require
> >> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
> >> reset which can help align this requirement. Add support for PSCI
> >> SYSTEM_RESET2, vendor-specific resets and align the implementation
> >> to allow user-space initiated reboots to trigger these resets.
> >>
> >> Implement the PSCI vendor-specific resets by registering to the
> >> reboot-mode framework.
> > 
> > I think that we should expose to user space _all_ PSCI reset types,
> > cold, warm + vendor specific - as a departure from using the reboot_mode
> > variable (and possibly deprecate it - or at least stop using it).
> 
> sure. We can try that. Have tried to compile it all at the end of this thread.
> 
> > 
> >> As psci init is done at early kernel init, reboot-mode registration cannot
> >> be done at the time of psci init.  This is because reboot-mode creates a
> >> “reboot-mode” class for exposing sysfs, which can fail at early kernel init.
> >> To overcome this, introduce a late_initcall to register PSCI vendor-specific
> >> resets as reboot modes. Implement a reboot-mode write function that sets
> >> reset_type and cookie values during the reboot notifier callback.  Introduce
> >> a firmware-based call for SYSTEM_RESET2 vendor-specific reset in the
> >> psci_sys_reset path, using reset_type and cookie if supported by secure
> >> firmware. Register a panic notifier and clear vendor_reset valid status
> >> during panic.  This is needed for any kernel panic that occurs post
> >> reboot_notifiers.
> > 
> > Is it because panic uses reboot_mode to determine the reset to issue ?
> 
> Yes. As we know, currently psci supports only two resets,
> psci_sys_reset2 (ARCH warm reset) and psci_sys_reset(COLD RESET). And kernel
> panic path should take the path set by reboot_mode to maintain backward
> compatibility. 
> 
> > 
> >> By using the above implementation, userspace will be able to issue
> >> such resets using the reboot() system call with the "*arg"
> >> parameter as a string based command. The commands can be defined
> >> in PSCI device tree node under “reboot-mode” and are based on the
> >> reboot-mode based commands.
> > 
> > IMHO - it would be nice if could add mode-cold (or mode-normal in reboot mode
> > speak) and mode-warm by default (if PSCI supports them) so that userspace
> 
> Default mode in current kernel is cold, until explicitly set to warm.
> So should it be defaulted to cold?

I managed to confuse you sorry. What I wanted to say is that user space
should be able to issue _all_ PSCI resets (inclusive of cold and warm if
supported - ie if SYSTEM_RESET2 is supported) not just vendor resets.

I misused "by default" - I meant cold and warm PSCI resets should be part
of the reboot-mode list.

[...]

> >>  
> >> +struct psci_vendor_sysreset2 {
> >> +	u32 reset_type;
> >> +	u32 cookie;
> >> +	bool valid;
> >> +};
> >> +
> >> +static struct psci_vendor_sysreset2 vendor_reset;
> > 
> > I think this should represent all possible PSCI reset types, not vendor only
> > and its value is set by the reboot mode framework.
> > 
> >> +
> >> +static int psci_panic_event(struct notifier_block *nb, unsigned long v, void *p)
> >> +{
> >> +	vendor_reset.valid = false;
> > 
> > I don't like this. Basically all you want this for is to make sure that
> > we don't override the reboot_mode variable.
> 
> Yes, it does not look good but as we planned to use reboot-mode framework earlier, which
> sets the modes at the at reboot_notifiers. This needs to be taken care for any panic
> that occurs between reboot_notifier and restart_notifier.

Isn't there a simpler way to detect whether we are in panic mode and
consequently we just issue a reset based on reboot_mode ?

panic_in_progress() ?

> > One (hack) would consist in checking the reboot_mode variable here and
> > set the struct I mentioned above to the value represented in reboot_mode.
> > 
> > Good luck if reboot_mode == REBOOT_GPIO :-)
> 
> psci supports only two modes, ARCH_WARM and cold, so anything else except WARM/SOFT
> should default to cold? So even if REBOOT_GPIO is set in reboot_mode, we should default
> it to cold reset.
> 
> > 
> >> +	return NOTIFY_DONE;
> >> +}
> >> +
> >> +static struct notifier_block psci_panic_block = {
> >> +	.notifier_call = psci_panic_event
> >> +};
> >> +
> >>  bool psci_tos_resident_on(int cpu)
> >>  {
> >>  	return cpu == resident_cpu;
> >> @@ -309,7 +330,10 @@ static int get_set_conduit_method(const struct device_node *np)
> >>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> >>  			  void *data)
> >>  {
> >> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> >> +	if (vendor_reset.valid && psci_system_reset2_supported) {
> >> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
> >> +			       vendor_reset.cookie, 0);
> > 
> > See above. Two calls here: one for resets issued using the new userspace
> > interface you are adding and legacy below - no vendor vs reboot_mode, this
> > is a mess.
> 
> Are we suggesting to completely remove the reboot_mode check from here in the new
> design and base it on reboot <CMD> param?

I am suggesting that there must be two reset options:

- based on reboot mode set by user space
- based on reboot_mode variable (as a fallback and while panic is in progress)

> > 
> >> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> >>  	    psci_system_reset2_supported) {
> >>  		/*
> >>  		 * reset_type[31] = 0 (architectural)
> >> @@ -547,6 +571,72 @@ static const struct platform_suspend_ops psci_suspend_ops = {
> >>  	.enter          = psci_system_suspend_enter,
> >>  };
> >>  
> >> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot, u64 magic)
> >> +{
> >> +	u32 magic_32;
> >> +
> >> +	if (psci_system_reset2_supported) {
> >> +		magic_32 = magic & GENMASK(31, 0);
> >> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic_32;
> >> +		vendor_reset.cookie = (magic >> 32) & GENMASK(31, 0);
> > 
> > Use FIELD_PREP/GET() please (but as mentioned above the vendor reset type
> > bit[31] should be part of the reboot mode magic value, see above).
> 
> sure. Will align this. thanks.
> 
> > 
> >> +		vendor_reset.valid = true;
> >> +	}
> >> +
> >> +	return NOTIFY_DONE;
> >> +}
> >> +
> >> +static int __init psci_init_vendor_reset(void)
> >> +{
> >> +	struct reboot_mode_driver *reboot;
> >> +	struct device_node *psci_np;
> >> +	struct device_node *np;
> >> +	int ret;
> >> +
> >> +	if (!psci_system_reset2_supported)
> >> +		return -EINVAL;
> >> +
> >> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> >> +	if (!psci_np)
> >> +		return -ENODEV;
> >> +
> >> +	np = of_find_node_by_name(psci_np, "reboot-mode");
> >> +	if (!np) {
> >> +		of_node_put(psci_np);
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
> >> +	if (ret)
> >> +		goto err_notifier;
> >> +
> >> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
> >> +	if (!reboot) {
> >> +		ret = -ENOMEM;
> >> +		goto err_kzalloc;
> >> +	}
> >> +
> >> +	reboot->write = psci_set_vendor_sys_reset2;
> >> +	reboot->driver_name = "psci";
> >> +
> >> +	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
> >> +	if (ret)
> >> +		goto err_register;
> >> +
> >> +	of_node_put(psci_np);
> >> +	of_node_put(np);
> >> +	return 0;
> >> +
> >> +err_register:
> >> +	kfree(reboot);
> >> +err_kzalloc:
> >> +	atomic_notifier_chain_unregister(&panic_notifier_list, &psci_panic_block);
> >> +err_notifier:
> >> +	of_node_put(psci_np);
> >> +	of_node_put(np);
> >> +	return ret;
> >> +}
> >> +late_initcall(psci_init_vendor_reset)
> > 
> > I don't like adding another initcall here.
> > 
> > I wonder whether this code belongs in a PSCI reboot mode driver, possibly a
> > faux device in a way similar to what we did for cpuidle-psci (that after all
> > is a consumer of PSCI_CPU_SUSPEND in a similar way as this code is a
> > PSCI_SYSTEM_RESET{2} consumer), that communicates with
> > drivers/firmware/psci/psci.c with the struct mentioned above.
> 
> sure. we can create a new driver and try it as in cpuidle: cpuidle-psci.
> Can you suggest a bit more on the overall approach we want to take here?
> Have tried to summarize the potential changes and few questions below.
> 
> - new driver registers a faux device - say - power: reset: psci_reset.

Yes this could be a potential way forward but that's decoupled from the
options below. If we take this route PSCI maintainers should be added
as maintainers for this reboot mode driver.

> - struct with pre-built psci reset_types - (warm, soft, cold). Currently
>   only two modes supported, anything other than warm/soft defaults to cold.
> - vendor resets to be added as per vendor choice, inside psci device tree(SOC specific).
> - psci_reset registers with reboot-mode for registering  vendor resets. Here, we
>   have a problem, the pre-built psci reset_types - (warm, soft, cold) cannot be added via
>   reboot-mode framework.

Why ?

>   Should the new psci_reset driver, move away from reboot-mode
>   framework as-well? And define its own parsing logic for psci_reset_types,
>   and have its own restart_notifier instead of reboot_notifier?

No. As I said earlier, I think it makes sense to allow user space to
select _all_ PSCI reset types - architected and vendor specific in
a single reboot mode driver.

I believe that we must be able to have two well defined ways for
issuing resets:

- one based on reboot mode driver
- one based on reboot_mode variable interface

Does this make sense everyone ? I don't know the history behind
reboot_mode and the reboot mode driver framework I am just stating
what I think makes sense to do for PSCI.

Thanks,
Lorenzo

> - If new psci_reset driver move away from reboot-mode, we can get rid of the panic_notifier
>   added in the psci code. Else, we may still need the panic_notifier for any kernel panic
>   that occurs between reboot_notifier and restart_notifier?
> - psci driver will export a function which will be called externally to set the current
>   psci reset_type.
> - psci_sys_reset in psci driver should remove the check on reboot_mode. It will default to
>   cold reset (for the reason the current kernel defaults to cold reset in psci.)
>   example change in psci_sys_reset:
>     if(psci_system_reset2_supported && <psci_reset_new_struct_var> != cold)
>        psci_sys_reset2(AS PER PARAMS FROM new psci_reset driver)
>     else
>        psci_sys_reset(COLD RESET)
> 
> thanks,
> Shivendra

