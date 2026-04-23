Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED57F99368
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bU6af3pFl4i//WlryeMZZ/EkJOmI89fwzpLq1PO73Y=; b=pfUBRXoJgUHnZzP7zdp1UEisxq
	56rbuTe/93nGYc3xJDY40mbACwbCEKh5NpVAbtKwwCewKIRqsd78SwVYhYCyHOM9vlC8MSvga4IpB
	Q2/qr6WpnuprHyTFuR9ZNJaHBmBk2WasFcwJqjmxpBfC3AfAqVF7dh7rO4li0U7dNdySYzbzZqChP
	YxIeP8c6JBh82SK19gd/YKeHVjVWn1NnxTh7GhEBjSYG0hj9sL6kv8aVALIPxBmjIS11GmZIhfGUl
	pDLkPrAPNWptcFBLh+HoPQyXiTXKUk6EXrhTHMA8m6+BDsMFJ1a1ps51nJ5s64o1uTDXzoMHPnzvE
	ITGlIscg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqyw-0000000BSG9-0v5J;
	Thu, 23 Apr 2026 10:08:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqyo-0000000BSFX-0G77
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DED0143FC9;
	Thu, 23 Apr 2026 10:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14C7C2BCAF;
	Thu, 23 Apr 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776938895;
	bh=CHvcjnR3SprvG3lX1LUmOGMYpbXoJ2lZd/UJrEB9jD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eG8+Zy3lPv6p4S4ubMi7YbUJOwCY4PtRErxgwgmw8G8U3cgwKTtlHJactQ+s5jfXB
	 Sq0QdRGiBGxaf6OM5dAjIZiEJ/1z2Wz2STT+B+MKhPEARQDqfKG/24SLpzRT2Rq9Gq
	 w06Dcg8RtVMoV++XgKcN6eu1xhgRZCj+4WiRh4/nfZVD9Sacotl38fL7cnuuLUnBo3
	 yyR4Uo45sFeOODj2A1FzojlWH+SNKa8ozmcMYxCrHl2Q3Y86itEjWxFw2fgV9WOU8E
	 T02LFv/zSuwWnymZwf28C0nUew03PVuQWyEbeZdlerB3RP0BPAb9eK4lBYaUa4LEOG
	 oByK9NZ7uiilQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>
Cc: peterz@infradead.org, sudeep.holla@kernel.org, yangyicong@hisilicon.com,
 dietmar.eggemann@arm.com, Jonathan.Cameron@huawei.com,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
In-Reply-To: <aeNxKpHzTQX4_kId@arm.com>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com>
Date: Thu, 23 Apr 2026 12:08:11 +0200
Message-ID: <87ldee0z1w.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_030818_124959_F073793C 
X-CRM114-Status: GOOD (  13.08  )
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

On Sat, Apr 18 2026 at 12:55, Catalin Marinas wrote:
> Another option would have been to avoid marking such CPUs present but I
> think this will break other things. Yet another option is to register
> all CPU devices even if they never come up (like maxcpus greater than
> actual CPUs).
>
> Opinions? It might be an arm64+ACPI-only thing.

I think so. The proper thing to do is to apply sane limits:

 1) The possible CPUs enumerated by firmware N_POSSIBLE_FW

 2) The maxcpus limit on the command line N_MAXCPUS_CL

So the actual possible CPUs evaluates to:

   num_possible = min(N_POSSIBLE_FW, N_MAXCPUS_CL, CONFIG_NR_CPUS);

The evaluation of the firmware should not mark CPUs present which are
actually not. ACPI gives you that information. See:

         5.2.12.14 GIC CPU Interface (GICC) Structure

in the ACPI spec. That has two related bits:

Enabled:

   If this bit is set, the processor is ready for use. If this bit is
   clear and the Online Capable bit is set, the system supports enabling
   this processor during OS runtime. If this bit is clear and the Online
   Capable bit is also clear, this processor is un- usable, and the
   operating system support will not attempt to use it.

Online Capable:

   The information conveyed by this bit depends on the value of the
   Enabled bit. If the Enabled bit is set, this bit is reserved and must
   be zero. Otherwise, if this bit is set, the system supports enabling
   this processor later during OS runtime

So the combination of those gives you the right answer:

   Enabled	Online
   	        Capable
   0            0        Not present, not possible
   0            1        Not present, but possible to "hotplug" layter
   1            0        Present
   1            1        Invalid

The kernel sizes everything on the number of possible CPUs and the
present CPU mask is only there to figure out which CPUs are actually
usable and can be brought up.

The runtime physical hotplug mechanics use acpi_[un]map_cpu() to toggle
the present bit.

Thanks,

        tglx




