Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BEFD49233
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ues5ar3wa6bITd4P6/RODOqadKRqQc/ORaUoVLhX5oM=; b=3oER2mpozS4Oe0US/EqTFzTdu5
	rxcIi1C/5kSVifpvw9Ek8EAovZz2DEEld6EKRaZ6gOn0PPC0tLPF/G43uOqNPFRO9x9kbMiYov5+e
	DxJogwDI9d9R/JRogT8pLsSBrIstc/OOpEo1zhpvN7WcH2Ok8b7nyh+bGkb6O6aEG7vOHIPGpL+6T
	ibdeyaCpU+bcKNaKIilUlOUeKr6d7X/0u4cGT0JDmaOEv9e5ScaMHh9Coz+R1meGmOViewzUH+KOa
	ztT5DPKcDm2NmjLnOWt/pDU5eVcL8BdcacVpJ69r92IqDRWJilqa5PQBxJJ3MRIiBTPTtgayW6w7n
	K3NdUP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3Sq-00000009tVK-0x2z;
	Mon, 18 Nov 2024 15:14:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3Ru-00000009tNI-21Nd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CDCD8A40081;
	Mon, 18 Nov 2024 15:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159B2C4CED8;
	Mon, 18 Nov 2024 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731942837;
	bh=nwxs+Pgok1iHmZED1hS62HGL3ECEC031zlEfZR7ZHho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jP2eA5+ci4UjL6ymsR6d2tyOR/JgT46yIx8n+s706GKfYUN1/Qv0utpLtKSX6OkWU
	 jkJBQp8uzK/Wv9JVUlWR0uV1JoPAQc9oka7V6VHBG2jRb8Dr5jzbd5o51a/WX6Fe7Z
	 yqcj7rq2Wbswn+BN56l1jDTFlDLhSN/iWEnGGsULbts6Z5ETtuEBdh3LewbSPxaq6N
	 axXqoTcYFt4Dt1RONCzl40/+u3wrIXSbuWTXeE4Yt9vCfPrw2TgDXlXesAGwl/oIrW
	 9E2c3Ka8Zx4mXZzPWbEP2IeaRQzEiXRlZtWQOIcqJ7aDrviErXdBTK55NrVv7fqSb4
	 tO08QlSrTY08g==
Date: Mon, 18 Nov 2024 16:13:47 +0100
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
Message-ID: <ZztZq1ksXCkyLOvj@lpieralisi>
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com>
 <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
 <ZzdOOP0KuMMdo64W@lpieralisi>
 <20241115101401666-0800.eberman@hu-eberman-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115101401666-0800.eberman@hu-eberman-lv.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_071358_648027_B95358B1 
X-CRM114-Status: GOOD (  44.76  )
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

On Fri, Nov 15, 2024 at 11:08:22AM -0800, Elliot Berman wrote:
> On Fri, Nov 15, 2024 at 02:35:52PM +0100, Lorenzo Pieralisi wrote:
> > On Wed, Oct 23, 2024 at 09:30:21AM -0700, Elliot Berman wrote:
> > > On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
> > > > Quoting Elliot Berman (2024-10-18 12:39:48)
> > > > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > > > index 2328ca58bba6..60bc285622ce 100644
> > > > > --- a/drivers/firmware/psci/psci.c
> > > > > +++ b/drivers/firmware/psci/psci.c
> > > > > @@ -29,6 +29,8 @@
> > > > >  #include <asm/smp_plat.h>
> > > > >  #include <asm/suspend.h>
> > > > >
> > > > > +#define REBOOT_PREFIX "mode-"
> > > > 
> > > > Maybe move this near the function that uses it.
> > > > 
> > > > > +
> > > > >  /*
> > > > >   * While a 64-bit OS can make calls with SMC32 calling conventions, for some
> > > > >   * calls it is necessary to use SMC64 to pass or return 64-bit values.
> > > > > @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > +static void psci_vendor_sys_reset2(unsigned long action, void *data)
> > > > > +{
> > > > > +       const char *cmd = data;
> > > > > +       unsigned long ret;
> > > > > +       size_t i;
> > > > > +
> > > > > +       for (i = 0; i < num_psci_reset_params; i++) {
> > > > > +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > > > > +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > > > > +                                            psci_reset_params[i].reset_type,
> > > > > +                                            psci_reset_params[i].cookie, 0);
> > > > > +                       pr_err("failed to perform reset \"%s\": %ld\n",
> > > > > +                               cmd, (long)ret);
> > > > 
> > > > Do this intentionally return? Should it be some other function that's
> > > > __noreturn instead and a while (1) if the firmware returns back to the
> > > > kernel?
> > > > 
> > > 
> > > Yes, I think it's best to make sure we fall back to the architectural
> > > reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
> > > since device would reboot then.
> > 
> > Well, that's one of the doubts I have about enabling this code. From
> > userspace we are requesting a reboot (I don't even think that user
> > space knows which reboot modes are actually implemented (?)) and we may
> > end up issuing one with completely different semantics ?
> 
> You're right here, userspace issue a "reboot bootloader" and if kernel
> doesn't have the support to set up the right cookie, the device would do
> a normal reboot and not stop at the bootloader. This problem exists
> today and I think whether this is an issue to solve is out of scope here.

That's true. It is the same issue we have with reboot_mode anyway.

Is it a fair statement to say that currently when we request a reboot,
the reboot mode is the one set through /sys/kernel/reboot/mode ?

Does user space use that file today ?

I guess userspace does not take specific actions according to the
reset it thinks it issues - it is a question.

> > Are these "reset types" exported to user space ?
> > 
> 
> No mechanism exists to do that. We could do something specific for PSCI
> or do something generic for everybody. I don't think something specific
> for PSCI is the right approach because it's a general problem. I don't
> think there's enough interest to change reboot command plumbing to
> advertise valid reset types to userspace.

That's for sure. I suppose the most important bit is making sure that
all resets comply with the kernel semantics expected from a *reset*;
I appreciate that's a vague statement (and I have no idea how to enforce
it) but that's the gist of this discussion.

Another thing I am worried about is device drivers restart handlers
(ie having to parse a command that might be platform specific in a
generic driver to grok what reset was actually issued and what action
should be taken).

I admit it is a tough nut to crack this one - apologies for the time
it is taking to reach an agreement.

Lorenzo

