Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F816CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSj1BNhFUGS9D6nHDwBENPbvjao7G0oMILplewyKaYo=; b=D9e54rSfqL50GbZXz9ircADh03
	l0V6IrOwFJ1XtXLvawAjBlzEEhAw49OLiOfGbwK/AQclkU5ohClqkbgA9PWnFx7t8zrSCzF88ZqAz
	VOVCJMiZzfQ+b97TX65/Ug192DluAP6OivqbXwyzlYXDr+eMbtpIxJoIzRsqKGMUCrXhsi4p+gLrY
	pBb4Ymoh6Xr2N+6+R53+Gq2WYkQKQ8Z58HwVemiz3Wx1rzh9Vrll0w6QTkEVV7DyBt6mFWBoiTTqC
	ixhC7VuU+bD+B4E1ikIcGIOh+F2qYqtsPN3Fsl0NGDJCu6nVytFBmwDmEb5AiPSnFDIh+fvrT+3r8
	W515tU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29kD-000000028cf-2qeV;
	Fri, 26 Sep 2025 14:48:21 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29kA-000000028YZ-2Q7Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:48:20 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cYCzn3mX8z6M4Rs;
	Fri, 26 Sep 2025 22:45:09 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 53443140278;
	Fri, 26 Sep 2025 22:48:11 +0800 (CST)
Received: from localhost (10.47.75.77) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 26 Sep
 2025 15:48:09 +0100
Date: Fri, 26 Sep 2025 15:48:06 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 06/29] ACPI / MPAM: Parse the MPAM table
Message-ID: <20250926154806.0000609e@huawei.com>
In-Reply-To: <334e0e8b-3f30-48b7-896f-0b31111d2b41@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-7-james.morse@arm.com>
	<20250911141726.00002f0c@huawei.com>
	<334e0e8b-3f30-48b7-896f-0b31111d2b41@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.77]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_074818_909301_34262F0D 
X-CRM114-Status: GOOD (  56.97  )
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


Hi James

Just a few things I've picked out to reply to.
Absolutely fine with your other replies.

> 
> >> +	char uid[16];
> >> +	u32 acpi_id;
> >> +
> >> +	if (acpi_disabled || !system_supports_mpam() || IS_ERR(table))
> >> +		return 0;
> >> +
> >> +	if (table->revision < 1)
> >> +		return 0;
> >> +
> >> +	table_end = (char *)table + table->length;
> >> +
> >> +	while (table_offset < table_end) {
> >> +		tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
> >> +		table_offset += tbl_msc->length;
> >> +
> >> +		if (table_offset > table_end) {
> >> +			pr_debug("MSC entry overlaps end of ACPI table\n");
> >> +			break;  
> 
> > That this isn't considered an error is a bit subtle and made me wonder
> > if there was a use of uninitialized pdev (there isn't because err == 0)  
> 
> Its somewhat a philosophical arguement. I don't expect the kernel to have to validate
> these tables, they're not provided by the user and there quickly becomes a point where
> you have to trust them, and they have to be correct.

Potential buffer overrun is to me always worth error out screaming, but I get your
broader point.   Maybe just make it a pr_err()

> At the other extreme is the asusmption the table is line-noise and we should check
> everything to avoid out of bounds accesses. Dave wanted the diagnostic messages on these.
> 
> As this is called from an initcall, the best you get is an inexplicable print message.
> (what should we say - update your firmware?)

Depends on whether you can lean hard on the firmware team. Much easier
for me if I can tell them the board doesn't boot because they got it wrong.

That would have been safer if we had this upstream in advance of hardware, but indeed
a little high risk today as who knows what borked tables are out there.

Personal preference though is to error out on things like this and handle the papering
over at the top level.  Don't put extra effort into checking tables are invalid
but if we happen to notice as part of code safety stuff like sizes then good to scream
about it.

> 
> 
> Silently failing in this code is always safe as the driver has a count of the number of
> MSC, and doesn't start accessing the hardware until its found them all.
> (this is because to find the system wide minimum value - and its not worth starting if
>  its not possible to finish).
> 
> 
> > Why not return here?  
> 
> Just because there was no other return in the loop, and I hate surprise returns.
> 
> I'll change it if it avoids thinking about how that platform_device_put() gets skipped!
> 
> 
> >   
> >> +		}
> >> +
> >> +		/*
> >> +		 * If any of the reserved fields are set, make no attempt to
> >> +		 * parse the MSC structure. This MSC will still be counted,
> >> +		 * meaning the MPAM driver can't probe against all MSC, and
> >> +		 * will never be enabled. There is no way to enable it safely,
> >> +		 * because we cannot determine safe system-wide partid and pmg
> >> +		 * ranges in this situation.
> >> +		 */  
> 
> > This is decidedly paranoid. I'd normally expect the architecture to be based
> > on assumption that is fine for old software to ignore new fields.  ACPI itself
> > has fairly firm rules on this (though it goes wrong sometimes :)  
> 
> Yeah - the MPAM table isn't properly structured as subtables. I don't see how they are
> going to extend it if they need to.
> 
> The paranoia is that anything set in these reserved fields probably indicates something
> the driver needs to know about: a case in point is the way PCC was added.
> 
> I'd much prefer we skip creation of MSC devices that have properties we don't understand.
> acpi_mpam_count_msc() still counts them - which means the driver never finds all the MSC,
> and never touches the hardware.
> 
> MPAM isn't a critical feature, its better that it be disabled than make things worse.
> (the same attitude holds with the response to the MPAM error interrupt - reset everything
>  and pack up shop. This is bettern than accidentally combining important/unimportant
>  tasks)
> 
> 
> > I'm guessing there is something out there that made this necessary though so
> > keep it if you actually need it.  
> 
> It's a paranoid/violent reaction to the way PCC was added - without something like this,
> that would have led to the OS trying to map the 0 page and poking around in it - never
> likely to go well.
> 
> Doing this does let them pull another PCC without stable kernels going wrong.
> Ultimately I think they'll need to replace the table with one that is properly structured.
> For now - this is working with what we have.

Fair enough. I'm too lazy / behind with reviews to go scream via our channels about
problems here.  Paranoia it is.  Maybe we'll end up backporting some 'fixes' that
ignore nicely added fields with appropriate control bits to turn them on.
So be it if that happens.

> 
> 
> >> +		if (tbl_msc->reserved || tbl_msc->reserved1 || tbl_msc->reserved2) {
> >> +			pr_err_once("Unrecognised MSC, MPAM not usable\n");
> >> +			pr_debug("MSC.%u: reserved field set\n", tbl_msc->identifier);
> >> +			continue;
> >> +		}
> >> +
> >> +		if (!tbl_msc->mmio_size) {
> >> +			pr_debug("MSC.%u: marked as disabled\n", tbl_msc->identifier);
> >> +			continue;
> >> +		}
> >> +
> >> +		if (decode_interface_type(tbl_msc, &iface)) {
> >> +			pr_debug("MSC.%u: unknown interface type\n", tbl_msc->identifier);
> >> +			continue;
> >> +		}
> >> +
> >> +		next_res = 0;
> >> +		next_prop = 0;
> >> +		memset(res, 0, sizeof(res));
> >> +		memset(props, 0, sizeof(props));
> >> +
> >> +		pdev = platform_device_alloc("mpam_msc", tbl_msc->identifier);  
> > 
> > https://lore.kernel.org/all/20241009124120.1124-13-shiju.jose@huawei.com/
> > was a proposal to add a DEFINE_FREE() to clean these up.  Might be worth a revisit.
> > Then Greg was against the use it was put to and asking for an example of where
> > it helped.  Maybe this is that example.
> > 
> > If you do want to do that, I'd factor out a bunch of the stuff here as a helper
> > so we can have the clean ownership pass of a return_ptr().  
> > Similar to what Shiju did here (this is the usecase for platform device that
> > Greg didn't like).
> > https://lore.kernel.org/all/20241009124120.1124-14-shiju.jose@huawei.com/
> > 
> > Even without that I think factoring some of this out and hence being able to
> > do returns on errors and put the if (err) into the loop would be a nice
> > improvement to readability.  
> 
> If you think its more readable I'll structure it like that.

The refactor yes. I'd keep clear of the the DEFINE_FREE() unless you have
some spare time ;)
> 
> 
> >> +		if (!pdev) {
> >> +			err = -ENOMEM;
> >> +			break;
> >> +		}

> >> +int acpi_mpam_count_msc(void)
> >> +{
> >> +	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_MPAM, 0);
> >> +	char *table_end, *table_offset = (char *)(table + 1);
> >> +	struct acpi_mpam_msc_node *tbl_msc;
> >> +	int count = 0;
> >> +
> >> +	if (IS_ERR(table))
> >> +		return 0;
> >> +
> >> +	if (table->revision < 1)
> >> +		return 0;
> >> +
> >> +	table_end = (char *)table + table->length;  
> 
> > Trivial so feel free to ignore.
> > Perhaps should aim for consistency.  Whilst I prefer pointers for this stuff
> > PPTT did use unsigned longs.  
> 
> I prefer the pointers, and as it's a separate file, I don't think it needs to be
> concistent with PPTT.

Fair enough.  Maybe PPTT is ripe for some cleanup once you are done messing with it.
I'm certainly going to add churn now.

J

