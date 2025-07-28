Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26279C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9eqnKcn6xFmuMKz1MUEBtlbUFa94aG6iPvGSHOUD+w=; b=zagjVrbmKm77aUwy/apkijw5Xy
	D2bwQSFUze71y/iTw2FTY8NQYclE8djaNvrlW9DSNkI7Q7XcMDiNnAozV5c3viHxMPFE1D0fjTNwg
	pVSJi+ZcGFCXKu1LTprocRdKfjkl0VC/c/YtLt328CIV05ecXUA4CtN1qhJEtNZAAHI1vtDtFKFey
	TJZBiKmriOdbYNEmpj6dF1vrv0JvlEs6XFwCXbyWhXxN40XSY0pj4JuDDuUCr9Gf7iRXSjCT7kRYj
	IOn5rh9aJf0WEH5PaJU9+Va4xl9CqAY5elCp+ldhd0nt8ZZr6RGwIwnNQfysWbWsoD2aS+1QfY99O
	6XmN3r6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQMr-0000000EvdW-0rGw;
	Mon, 28 Jul 2025 16:06:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPs6-0000000Epin-3Axr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:34:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0789B152B;
	Mon, 28 Jul 2025 08:34:28 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB3323F66E;
	Mon, 28 Jul 2025 08:34:32 -0700 (PDT)
Date: Mon, 28 Jul 2025 16:34:27 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com, bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com, baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>
Subject: Re: [RFC PATCH 27/36] arm_mpam: Allow configuration to be applied
 and restored during cpu online
Message-ID: <aIeYgxJf9EASA5Zs@e133380.arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-28-james.morse@arm.com>
 <7ab40c09-3922-4e0c-85dd-00ff05be4ce6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ab40c09-3922-4e0c-85dd-00ff05be4ce6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_083438_876510_9F041438 
X-CRM114-Status: GOOD (  34.32  )
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

Hi,

On Mon, Jul 28, 2025 at 12:59:12PM +0100, Ben Horgan wrote:
> Hi James,
> 
> On 7/11/25 19:36, James Morse wrote:
> > When CPUs come online the original configuration should be restored.
> > Once the maximum partid is known, allocate an configuration array for
> > each component, and reprogram each RIS configuration from this.
> > 
> > The MPAM spec describes how multiple controls can interact. To prevent
> > this happening by accident, always reset controls that don't have a
> > valid configuration. This allows the same helper to be used for
> > configuration and reset.
> > 
> > CC: Dave Martin <Dave.Martin@arm.com>
> > Signed-off-by: James Morse <james.morse@arm.com>
> > ---
> >   drivers/platform/arm64/mpam/mpam_devices.c  | 236 ++++++++++++++++++--
> >   drivers/platform/arm64/mpam/mpam_internal.h |  26 ++-
> >   2 files changed, 234 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
> > index bb3695eb84e9..f3ecfda265d2 100644
> > --- a/drivers/platform/arm64/mpam/mpam_devices.c
> > +++ b/drivers/platform/arm64/mpam/mpam_devices.c

[...]

> > @@ -1000,10 +1041,38 @@ static void mpam_reset_msc(struct mpam_msc *msc, bool online)

[...]

> > +static void mpam_reprogram_msc(struct mpam_msc *msc)
> > +{
> > +	int idx;
> > +	u16 partid;
> > +	bool reset;
> > +	struct mpam_config *cfg;
> > +	struct mpam_msc_ris *ris;
> > +
> > +	idx = srcu_read_lock(&mpam_srcu);
> > +	list_for_each_entry_rcu(ris, &msc->ris, msc_list) {
> > +		if (!mpam_is_enabled() && !ris->in_reset_state) {
> > +			mpam_touch_msc(msc, &mpam_reset_ris, ris);
> > +			ris->in_reset_state = true;
> > +			continue;
> > +		}
> > +
> > +		reset = true;
> > +		for (partid = 0; partid <= mpam_partid_max; partid++) {

> Do we need to consider 'partid_max_lock' here?

Just throwing in my 2¢, since I'd dug into this a bit previously:

Here, we are resetting an MSC or re-onlining a CPU.  Either way, I
think that this only happens after the initial probing phase is
complete.

mpam_enable_once() is ordered with respect to the task that did the
final unlock of partid_max_lock during probing, by means of the
schedule_work() call.  (See <linux/workqueue.h>.)

Taking the hotplug lock and installing mpam_cpu_online() for CPU
hotplug probably brings a sufficient guarantee also (though I've not
dug into it).

This function doesn't seem to be called during the probing phase (via
mpam_discovery_cpu_online()), so there shouldn't be any racing updates
to the global variables here.

> > +			cfg = &ris->vmsc->comp->cfg[partid];
> > +			if (cfg->features)
> > +				reset = false;
> > +
> > +			mpam_reprogram_ris_partid(ris, partid, cfg);
> > +		}
> > +		ris->in_reset_state = reset;
> > +	}
> > +	srcu_read_unlock(&mpam_srcu, idx);
> > +}

[...]

> > @@ -1806,6 +1875,43 @@ static void mpam_unregister_irqs(void)

[...]

> > +static int __allocate_component_cfg(struct mpam_component *comp)
> > +{
> > +	if (comp->cfg)
> > +		return 0;
> > +
> > +	comp->cfg = kcalloc(mpam_partid_max + 1, sizeof(*comp->cfg), GFP_KERNEL);

> And here?

Similarly, this runs only in the mpam_enable_once() call.

[...]

> > @@ -1861,6 +1976,8 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
> >   	might_sleep();
> >   	lockdep_assert_cpus_held();
> > +	memset(comp->cfg, 0, (mpam_partid_max * sizeof(*comp->cfg)));

> And here?

Similarly to mpam_reset_msc(), I think this probably only runs from
mpam_enable_once() or mpam_cpu_online().

I think most or all of the existing reads of the affected globals from
within mpam_resctrl.c are also callbacks from resctrl_init(), which
again exceutes during mpam_enable_once() (though I won't promise I
haven't missed one or two).

Once resctrl has fired up, I believe that the MPAM driver basically
trusts the IDs coming in from resctrl, and doesn't need to range-check
them against the global parameters again.

[...]

> Thanks,
> 
> Ben

I consciously haven't done all the homework on this.

Although it may look like the globals are read all over the place after
probing, I think this actually only happens during resctrl initialision
(which is basically single-threaded).

The only place where they are read after probing and without mediation
via resctrl is on the CPU hotplug path.

Adding locking would ensure that an unstable value is never read, but
this is not sufficient by itself to sure that the _final_ value of a
variable is read (for some definition of "final").  And, if there is a
well-defined notion of final value and there is sufficient
synchronisation to ensure that this is the value read by a particular
read, then by construction an unstable value cannot be read.


I think that this kind of pattern is not that uncommon in the kernel,
though it is a bit painful to reason about.

Cheers
---Dave

