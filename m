Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BBBD6DDE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOX2qHMUjnGzaf6JIG8pckzdJI0P6r1C0VXNRCNb6CA=; b=cL9bkEwJ7U44C8jjEbhNFxMuQq
	ubTrB9+XjLLbhDDkCnUnH+jYV7ZbrTcPOw2OgPY1Bz+x250yoPfcgxcG6yxjXLCiEGrDDcaghTbGX
	TBUVin4wLqfz1/30ROUg/wlPlgCO4yQdS67Dfs8yZk3Cabq5h6YWaGfnjQIlvBvC65Gjlmcmj4LII
	/Kzjk3YIcM0aUoVlZSXgZX3Sh+kinHayz0TdnH5DmNwG8vUMiP1/khizbRYYz0e1UMCxHYRV3+3hQ
	cRmwOpRFB5xIgqRWuNW1gHrc8peYh1qygqLh8FwCtiylw0c/6iX7yiRCkEKXL9HDyMRXvuFcNIgGl
	+nLlvlLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwVQ-00000002qZ0-242k;
	Fri, 15 Nov 2024 13:37:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwUV-00000002qRx-1AKW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3832C5C6232;
	Fri, 15 Nov 2024 13:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99968C4CECF;
	Fri, 15 Nov 2024 13:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731677762;
	bh=AO9xLnbPqrNc6QxB+RS5a+ltPUCHQ2swdaCjyUpk4wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihMrMQsewJGf3fyd3nlj3JxP3tSQ4LnK2kgn3BN0eJzom0hdGJ6rjAK8YzNknop2o
	 Loy9rOWAMzK2wgZYyDQftVkiBpE6qHthohXsA3wNHAfLpfVbuZm9Okvqe3R3+SSxeu
	 utZD3w8CDTNJ4hf4WPFir8h8wBBvcfLu7jKEkS6XI6g2VcixMKOysYpG4ApLl2+UNJ
	 c1TCbFe4izxfsz5re3g+DQcVASROO9DwmzJ3gFaDycj9PaZIae8gYkupbsxULSUqrq
	 YsekWgxpkSxWR1hQZop/s3vbnaz3OeG/GiOlLme6Xf1dJ95hDNFZRNADqyF336AGtc
	 d5tzg18ROdG/Q==
Date: Fri, 15 Nov 2024 14:35:52 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Andy Yan <andy.yan@rock-chips.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Shivendra Pratap <quic_spratap@quicinc.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 3/5] firmware: psci: Read and use vendor reset types
Message-ID: <ZzdOOP0KuMMdo64W@lpieralisi>
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com>
 <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_053603_405514_B063F727 
X-CRM114-Status: GOOD (  32.73  )
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

On Wed, Oct 23, 2024 at 09:30:21AM -0700, Elliot Berman wrote:
> On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
> > Quoting Elliot Berman (2024-10-18 12:39:48)
> > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > index 2328ca58bba6..60bc285622ce 100644
> > > --- a/drivers/firmware/psci/psci.c
> > > +++ b/drivers/firmware/psci/psci.c
> > > @@ -29,6 +29,8 @@
> > >  #include <asm/smp_plat.h>
> > >  #include <asm/suspend.h>
> > >
> > > +#define REBOOT_PREFIX "mode-"
> > 
> > Maybe move this near the function that uses it.
> > 
> > > +
> > >  /*
> > >   * While a 64-bit OS can make calls with SMC32 calling conventions, for some
> > >   * calls it is necessary to use SMC64 to pass or return 64-bit values.
> > > @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
> > >         return 0;
> > >  }
> > >
> > > +static void psci_vendor_sys_reset2(unsigned long action, void *data)
> > > +{
> > > +       const char *cmd = data;
> > > +       unsigned long ret;
> > > +       size_t i;
> > > +
> > > +       for (i = 0; i < num_psci_reset_params; i++) {
> > > +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > > +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > > +                                            psci_reset_params[i].reset_type,
> > > +                                            psci_reset_params[i].cookie, 0);
> > > +                       pr_err("failed to perform reset \"%s\": %ld\n",
> > > +                               cmd, (long)ret);
> > 
> > Do this intentionally return? Should it be some other function that's
> > __noreturn instead and a while (1) if the firmware returns back to the
> > kernel?
> > 
> 
> Yes, I think it's best to make sure we fall back to the architectural
> reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
> since device would reboot then.

Well, that's one of the doubts I have about enabling this code. From
userspace we are requesting a reboot (I don't even think that user
space knows which reboot modes are actually implemented (?)) and we may
end up issuing one with completely different semantics ?

Are these "reset types" exported to user space ?

Lorenzo

> > > +               }
> > > +       }
> > > +}
> > > +
> > >  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> > >                           void *data)
> > >  {
> > > +       if (data && num_psci_reset_params)
> > > +               psci_vendor_sys_reset2(action, data);
> > > +
> > >         if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> > >             psci_system_reset2_supported) {
> > >                 /*
> > > @@ -750,6 +780,68 @@ static const struct of_device_id psci_of_match[] __initconst = {
> > >         {},
> > >  };
> > >
> > > +static int __init psci_init_system_reset2_modes(void)
> > > +{
> > > +       const size_t len = strlen(REBOOT_PREFIX);
> > > +       struct psci_reset_param *param;
> > > +       struct device_node *psci_np __free(device_node) = NULL;
> > > +       struct device_node *np __free(device_node) = NULL;
> > > +       struct property *prop;
> > > +       size_t count = 0;
> > > +       u32 magic[2];
> > > +       int num;
> > > +
> > > +       if (!psci_system_reset2_supported)
> > > +               return 0;
> > > +
> > > +       psci_np = of_find_matching_node(NULL, psci_of_match);
> > > +       if (!psci_np)
> > > +               return 0;
> > > +
> > > +       np = of_find_node_by_name(psci_np, "reset-types");
> > > +       if (!np)
> > > +               return 0;
> > > +
> > > +       for_each_property_of_node(np, prop) {
> > > +               if (strncmp(prop->name, REBOOT_PREFIX, len))
> > > +                       continue;
> > > +               num = of_property_count_elems_of_size(np, prop->name, sizeof(magic[0]));
> > 
> > Use of_property_count_u32_elems()?
> > 
> > > +               if (num != 1 && num != 2)
> > > +                       continue;
> > > +
> > > +               count++;
> > > +       }
> > > +
> > > +       param = psci_reset_params = kcalloc(count, sizeof(*psci_reset_params), GFP_KERNEL);
> > > +       if (!psci_reset_params)
> > > +               return -ENOMEM;
> > > +
> > > +       for_each_property_of_node(np, prop) {
> > > +               if (strncmp(prop->name, REBOOT_PREFIX, len))
> > > +                       continue;
> > > +
> > > +               param->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> > > +               if (!param->mode)
> > > +                       continue;
> > > +
> > > +               num = of_property_read_variable_u32_array(np, prop->name, magic, 1, 2);
> > 
> > ARRAY_SIZE(magic)?
> > 
> > > +               if (num < 0) {
> > 
> > Should this be less than 1?
> > 
> 
> of_property_read_variable_u32_array should return -EOVERFLOW (or maybe
> -ENODATA) if the array is empty. I don't see it's possible for
> of_property_read_variable_u32_array() to return a non-negative value
> that's not 1 or 2.
> 
> > > +                       pr_warn("Failed to parse vendor reboot mode %s\n", param->mode);
> > > +                       kfree_const(param->mode);
> > > +                       continue;
> > > +               }
> > > +
> > > +               /* Force reset type to be in vendor space */
> > > +               param->reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic[0];
> > > +               param->cookie = num == 2 ? magic[1] : 0;
> > 
> > ARRAY_SIZE(magic)?
> > 
> > > +               param++;
> > > +               num_psci_reset_params++;
> > > +       }
> > > +
> > > +       return 0;

