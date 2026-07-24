Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1541EC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZoacX15n1s/wdu2z1dTP72aFcV6AUwO1bgAXZEOsx8=; b=myzlSXu8QDmqLh6ySZuci4tdVv
	xAITBAxFkdp2xOkZr2CMAb7FlU2HBnC9IirlXbtuYc4pKUoqqHv4OkBWFFNb0ydOcD4lBftuHzqj1
	i6MJKulfXQ1rQNDZtckFChDhh5W5RuFtcFEDBUTwnZ16JiHn0ZHqtfeEOIllCetkDjfVajifh+FPX
	aACwQUC1gd7/pP7lUZfEByqmPPvOTxDFbREJ55mdP/7cl2PlaRjiLey5B68LCDdH2PA1SZU4P9ZIx
	FRF+8aNUOWHZdOS8H1TVyc43hsZFjquMrXV1799yG8LHAlGNXFqC8MPE6A6pTJxXwAEQoLEvWV5Sr
	S/zL2wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCca-0000000G1P6-2olt;
	Fri, 24 Jul 2026 09:55:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCcZ-0000000G1No-0lKb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:55:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60E20600C3;
	Fri, 24 Jul 2026 09:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C7C1F00A3A;
	Fri, 24 Jul 2026 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886910;
	bh=CZoacX15n1s/wdu2z1dTP72aFcV6AUwO1bgAXZEOsx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y3hMcaRQ6kJleShuEits1tOJawoutRF3Q9l30Ffi/RtBR9jVDKXluPTIHNObRWwHa
	 wWDYCY2+fnIbz2DGP++hRmLiBR7AuGKejuEUXfJPNpknSASwec/HybTVieqqFkU5Bt
	 489c2vJyrJ56sQoLKPZxg/osv21akQoXoc20t24C/8lpJFc5Q/LU/c1H7wHtEiY5Nk
	 4rbyEXE3VFL1ZE64EVKm8pIx0fDsndrkLciA3KVq+SENUfgj5zyEqQB0Nl+uwJJuHr
	 k2+xtwTu+YwVswYSQcnLGX03idKkKVvNf2mDlzD0c48AF8ZTeBJxIqzhXtKi4AjOTB
	 pFrrI9Zw0n31g==
Date: Fri, 24 Jul 2026 10:55:04 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
Message-ID: <20260724-imposing-lurking-toucanet-cfe22c@sudeepholla>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723155454.1760823-9-andre.przywara@arm.com>
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

On Thu, Jul 23, 2026 at 05:54:52PM +0200, Andre Przywara wrote:
> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> alternative way of accessing the "Memory System Components" (MSC) in an
> MPAM enabled system.
> 
> Normally the MSCs are MMIO mapped, but in some implementations this
> might not be possible (MSC located outside of the local socket, MSC
> mapped secure-only) or desirable (direct MMIO access too slow or needs
> to be mediated through a control processor). MPAM-fb standardises a
> protocol to abstract MSC accesses, building on the SCMI protocol.
> 
> Add functions that do an MSC read or write access by redirecting the
> request through a firmware interface. For now this done via an ACPI
> PCC shared memory and mailbox combination.
> 
> Since the protocol used is only a small subset of the full SCMI spec,
> and the SCMI protocol has no full ACPI support anyway, open-code the
> (simple) SCMI message generation, for just the fields we need.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/Makefile        |   2 +-
>  drivers/resctrl/mpam_devices.c  |  27 ++++-
>  drivers/resctrl/mpam_fb.c       | 197 ++++++++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h |  20 ++++
>  include/linux/arm_mpam.h        |   2 +-
>  5 files changed, 240 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/resctrl/mpam_fb.c
> 
> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> index 4f6d0e81f9b8..097c036724e9 100644
> --- a/drivers/resctrl/Makefile
> +++ b/drivers/resctrl/Makefile
> @@ -1,5 +1,5 @@
>  obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
> -mpam-y						+= mpam_devices.o
> +mpam-y						+= mpam_devices.o mpam_fb.o
>  mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)		+= mpam_resctrl.o
>  
>  ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index e2cb884eacf4..b8108ed4b32c 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -181,6 +181,9 @@ static int __mpam_read_reg(struct mpam_msc *msc, u16 reg, u32 *res)
>  {
>  	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>

The above doesn't make any sense for PCC accesses, perhaps need to be pushed
down ?

> +	if (msc->iface == MPAM_IFACE_PCC)
> +		return mpam_fb_send_read_request(msc, reg, res);
> +
>  	*res = readl_relaxed(msc->mapped_hwpage + reg);
>  
>  	return 0;
> @@ -197,9 +200,12 @@ static inline int _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg,
>  
>  static int __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
>  {
> -	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
>  	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>  

Ditto

-- 
Regards,
Sudeep

