Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BEFC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8nUzlLmfXp3qz99nL6j1GxwtUSQQcbp5H3gxqfjjPI=; b=FXzR7jVAC+uMwiLjPU7WU89J0W
	CM0vy3gcbToAFsrIZ/G1IdvLRm2sZ3O5wWWg+gj4QVMcevSPWx9GCrYvFZdlwLrhdyqadmhTqAyFa
	vAs2Ynw62w6JqixVEXW8kUEzVX3KNIwWRJverfCWmbJHmpNhOZfyqkvQT1EO9DmelG/tlcv+/wQmW
	pyIn392iHL7+ljlLt5TXzk3cFVEgoVtcOpmLqfc8qesPxi3RQldGTOgTmNXS2SlBdyeHDfShy8VVU
	MQHkyfsuIeWSeQQ7ro4+9SD0CQe9rwwSsTtKsihSUohEB0T5NLM5TF7OQplarEcv6em709xM+7p2Z
	2DPN1hhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLSW-00000002rwg-31MW;
	Mon, 27 Jul 2026 13:33:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLST-00000002rwE-3DpH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:33:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EA81437B9;
	Mon, 27 Jul 2026 13:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A01D1F000E9;
	Mon, 27 Jul 2026 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785159209;
	bh=M8nUzlLmfXp3qz99nL6j1GxwtUSQQcbp5H3gxqfjjPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k/eNk6JfuND17CvbyXfdUgOQNertYWeeMl0v3MYZhga6vr54jB5KRMXiW1Tqikg1p
	 F7kdnd9eSaMXC06+aPEayqUSGl/sfq3afrwOlSucbMyLCHZBs3ZnrpANJ2nTEtPHEM
	 3JcPFNtLyj46eA7KyFovAHHtAXvY/Z2Gon2f7i0RBOSHtRLeDn5u0//PS5B/aVX171
	 bjC1H/ftlq9id7cWRndK3Hm0BhimEZzRrPb/NzLbdqsQTzpfC4rP0m+Dwfiz/PFuYp
	 EmGiqg1h+nUFIbYgLqCUOHM2+mVVlOVWzgntd0XmLEO5qn9wZLIIyqYJ/HXSaWqonT
	 VRCrTwdIC+JDQ==
Date: Mon, 27 Jul 2026 15:33:21 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>,
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
Subject: Re: [PATCH v4 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
Message-ID: <amdeITt0wL4FG2Am@red-moon>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-11-andre.przywara@arm.com>
 <20260724-finicky-knowing-foxhound-df1e56@sudeepholla>
 <amdTr8Sxw9024CN7@lpieralisi>
 <20260727-knowing-bittern-of-tempest-6deb54@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-knowing-bittern-of-tempest-6deb54@sudeepholla>
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

On Mon, Jul 27, 2026 at 02:20:02PM +0100, Sudeep Holla wrote:
> On Mon, Jul 27, 2026 at 02:48:47PM +0200, Lorenzo Pieralisi wrote:
> > On Fri, Jul 24, 2026 at 11:18:32AM +0100, Sudeep Holla wrote:
> > > On Thu, Jul 23, 2026 at 05:54:54PM +0200, Andre Przywara wrote:
> > > > The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> > > > registers through a firmware interface. This requires a shared memory
> > > > region to hold the message, and a mailbox to trigger the access.
> > > > For ACPI this is wrapped as a PCC channel, described using existing
> > > > ACPI abstractions.
> > > > 
> > > > Add code to parse those PCC table descriptions associated with an MSC,
> > > > and store the parsed information in the MSC struct.
> > > > There can be multiple PCC channels, and each channel can serve multiple
> > > > MSCs, so we need to keep track of the channel usage, using a list and
> > > > a refcount.
> > > > This will be used by the MPAM-Fb access wrapper code.
> > > > 
> > > > [1] https://developer.arm.com/documentation/den0144/latest
> > > > 
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > ---
> > > >  drivers/acpi/arm64/mpam.c      |   6 +-
> > > >  drivers/resctrl/mpam_devices.c | 127 ++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 129 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> > > > index 84963a20c3e7..ca9b8754ae5f 100644
> > > > --- a/drivers/acpi/arm64/mpam.c
> > > > +++ b/drivers/acpi/arm64/mpam.c
> > > > @@ -220,8 +220,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
> > > >  	struct platform_device *pdev __free(platform_device_put) =
> > > >  		platform_device_alloc("mpam_msc", tbl_msc->identifier);
> > > 
> > > Looks like tbl_msc->identifier is getting stashed as pdev->id...
> > > 
> > > 
> > > >  	int next_res = 0, next_prop = 0, err;
> > > > -	/* pcc, nrdy, affinity and a sentinel */
> > > > -	struct property_entry props[4] = { 0 };
> > > > +	/* pcc, msc-id, nrdy, affinity and a sentinel */
> > > > +	struct property_entry props[5] = { 0 };
> > > >  	/* mmio, 2xirq, no sentinel. */
> > > >  	struct resource res[3] = { 0 };
> > > >  	struct acpi_device *companion;
> > > > @@ -256,6 +256,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
> > > >  	} else if (iface == MPAM_IFACE_PCC) {
> > > >  		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
> > > >  							tbl_msc->base_address);
> > > > +		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
> > > > +							tbl_msc->identifier);
> > > 
> > > Why is this needed then as you can fetch it as pdev->id ?
> > 
> > I suppose it is to have properties parity between OF and ACPI without
> > having to change the driver property parsing path.
> > 
> 
> Yes, that was my initial thought as well. However, after looking into it
> further, I could not find any device tree bindings in the upstream tree.
> I am therefore unsure whether MPAM is supported on DT platforms.
> 
> The use of these device properties appears to have been based on DT bindings
> that may never have been upstreamed. As [1] suggests, the bindings were
> dropped before the initial merge.
> 
> Although we could rename these properties later to align with any DT bindings
> that are introduced, I think it would be preferable to avoid adding new
> properties unless they are strictly necessary.

Ah. That makes sense, if DT bindings get published the driver can be
reworked accordingly (if we want to improve how the code looks), this is
just Linux kernel internals anyway.

As it stands the "msc-id" property is churn, that's what you are saying.

Lorenzo

> -- 
> Regards,
> Sudeep
> 
> [1] https://lore.kernel.org/all/20251107123450.664001-1-ben.horgan@arm.com/

